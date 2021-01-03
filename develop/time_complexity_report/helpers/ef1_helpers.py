# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Copyright (c) 2020. Reda Bouadjenek & ROHAN MAN AMATYA, Deakin University   +
#     Email: reda.bouadjenek@dekain.edu.au and RMAMATYA@deakin.edu.au          +
#                                                                              +
#  Licensed under the Apache License, Version 2.0 (the "License");             +
#   you may not use this file except in compliance with the License.           +
#    You may obtain a copy of the License at:                                  +
#                                                                              +
#                 http://www.apache.org/licenses/LICENSE-2.0                   +
#                                                                              +
#    Unless required by applicable law or agreed to in writing, software       +
#    distributed under the License is distributed on an "AS IS" BASIS,         +
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  +
#    See the License for the specific language governing permissions and       +
#    limitations under the License.                                            +
#                                                                              +
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

import os
import random
import shutil
import numpy as np
from gurobipy import *


def create_dir(dir_path):
    if not os.path.exists(dir_path):
        os.mkdir(dir_path)


def remove_dir(dir_path):
    if os.path.exists(dir_path):
        shutil.rmtree(dir_path)


def get_random_numbers_between(end_index):
    return random.randint(0, end_index)


def get_random_array(array_size):
    return [float('%.2f' % (random.random())) for _ in range(0, array_size)]


def select_LP_optimal_subsequence(probabilities):
    """
    This function optimizes the expected f1-score to choose the optimal subsequence
    of probabilities.
    :param probabilities: the sequence of probabilities.
    :return: the start index and the end index of the optimal subsequence.
    """
    C = sum(probabilities)
    M = 1e4  # Value for Big M.
    dict_probabilities = dict({j: probabilities[j] for j in range(len(probabilities))})
    ###################
    # Define the model.
    ###################
    model = Model('EF1-Score')
    # Model console output masking
    model.setParam('OutputFlag', False)

    # element variable
    w = model.addVars(dict_probabilities.keys(), lb=0.0, ub=1.0, vtype='C', name='w')
    I = model.addVars(dict_probabilities.keys(), lb=0.0, ub=1.0, vtype='B', name='I')
    u = model.addVar(lb=0, vtype='C', name='u')

    # Index variables
    Is = model.addVars(dict_probabilities.keys(), vtype='B', name='Is')
    Ie = model.addVars(dict_probabilities.keys(), vtype='B', name='Ie')

    s = model.addVar(lb=0, ub=len(dict_probabilities) - 1, vtype='I', name='s')
    e = model.addVar(lb=0, ub=len(dict_probabilities) - 1, vtype='I', name='e')

    # Objective function
    model.setObjective(w.prod(dict_probabilities), GRB.MAXIMIZE)

    # Constraints

    model.addConstr(quicksum(w[j] for j in range(len(dict_probabilities))) + u * C == 1.0, 'sum(w)+uC=1')
    model.addConstr(s <= e, 's<=e')
    for j in dict_probabilities:
        model.addConstr(w[j] <= u, f"w[{j}]<=u")
        model.addConstr(w[j] <= M * I[j], f"w[{j}]<=M*I({j})")
        model.addConstr(w[j] >= u - M * (1 - I[j]), f"w[{j}]>=u-M*[1-I({j})]")
        model.addConstr(w[j] >= 0.0, f"w[{j}]>=0.0")

        # Interval selection constraints
        model.addGenConstrAnd(I[j], [Is[j], Ie[j]], f"selection_constraint-{j}")

        model.addGenConstrIndicator(Is[j], True, s <= j)
        model.addGenConstrIndicator(Ie[j], True, e >= j)

        model.addGenConstrIndicator(Is[j], False, s >= j + 1)
        model.addGenConstrIndicator(Ie[j], False, e <= j - 1)

    model.optimize()
    # model.write("out.lp")
    optimal_value = 2 * model.getObjective().getValue()  # optimal ef1 score
    return int(round(s.X)), int(round(e.X)), optimal_value


def get_substring_ef1_score(probabilities, substring_seq):
    """
    Get expected F1-score for a probability distribution

    params:
    probabilities (list): List of probabilities
    substring_seq (tuple): start and end index
    Returns:
    float: Expected f1 score for a string

    """
    # sum of all probabilities
    sum_of_all_probabilities = sum(probabilities)
    # probability substring
    substring_probabilities = probabilities[substring_seq[0]:substring_seq[1]]
    # sum of probabilities of substring
    sum_of_substring_probabilities = sum(substring_probabilities)
    # sum of indicator random variables
    num_of_indicator_rv = len(substring_probabilities)
    expected_precision = sum_of_substring_probabilities / num_of_indicator_rv
    expected_recall = sum_of_substring_probabilities / sum_of_all_probabilities
    # calculating expected ef1 score
    if expected_precision + expected_recall != 0:
        ef1_score_for_substring = (2 * expected_precision * expected_recall) / (
                expected_precision + expected_recall)
    else:
        # handling of division by 0
        ef1_score_for_substring = 0

    return ef1_score_for_substring


def get_brute_force_optimal_substring(probabilities):
    """
    Generated optimal substring based on EF1 score

    params:
    probabilities (list): List of probabilities

    Returns:
    ((start_index, end_index), optimal ef1 score): The end_index is inclusive and should be substracted by 1 to get actual 0-based index.

   """
    # for brute Force
    # #print('Computing Brute Force')
    optimal_ef1_score_dict = {}
    # list of all subset indices
    all_substring_index_list = [(i, i + j) for i in range(0, len(probabilities)) for j in
                                range(1, len(probabilities) - i + 1)]
    # getting ef1-score for each substring
    for substring_index_list in all_substring_index_list:
        optimal_ef1_score_dict[
            (substring_index_list[0], substring_index_list[1])] = get_substring_ef1_score(probabilities,
                                                                                          substring_index_list)
    # #print(optimal_ef1_score_dict)
    optimal_ef1_score_dict_sorted = sorted(optimal_ef1_score_dict.items(), key=lambda x: x[1], reverse=True)
    # returns tuple of start and end indices
    # return optimal subset indices
    return optimal_ef1_score_dict_sorted[0][0], optimal_ef1_score_dict_sorted[0][1]


def binary_partition_search(probabilities):
    """
    Get the middle index from a list

    params:
    probabilities (list): A list of probabilities associated to each token 

    Returns:
    int: End index of the optimal ef1-score sub list. This index is exclusive and 1 needs to be added.
    """
    _min, _max = 0, len(probabilities)
    _mid = int((_min + _max) / 2)
    while _min != _max and _mid != _max and _min != _mid:
        # print((_min, _mid, _max))
        min_mid_slice_ef1_score = get_substring_ef1_score(probabilities, (_min, _mid))
        # print(min_mid_slice_ef1_score)
        # #print(_min, _max)
        min_max_slice_ef1_score = get_substring_ef1_score(probabilities, (_min, _max))
        # print(min_max_slice_ef1_score)
        if (min_mid_slice_ef1_score >= min_max_slice_ef1_score):
            _max = _mid
            _mid = int((_min + _max) / 2)
        else:
            _min = _mid
            _mid = int((_min + _max) / 2)
        # print((_min, _mid, _max))
        # print('-------------')
    return _mid


def bps_bound_contraction_algo(probabilities):
    """
    Get the middle index from a list

    params:
    probabilities (list): A list of probabilities associated to each token 

    Returns:
    int: Start index s and end index e of the subsequence with the highest EF1 score
    """
    np_probabilities = np.array(probabilities)
    end_index = binary_partition_search(np_probabilities)
    optimal_probabilities_subset = np_probabilities[0:end_index + 1]
    optimal_probabilities_subset_reverse = optimal_probabilities_subset[::-1]
    # print('reverse')
    start_index = len(optimal_probabilities_subset_reverse) - (
                binary_partition_search(optimal_probabilities_subset_reverse) + 1)  # since this is also end index
    return start_index, end_index


def get_substring_performance_score(probabilities, substring_seq):
    """
    Compute performance for a given substring -- precision, recall, F1-Score, and Exact Match.

    params:
    probabilities (list): List of probabilities
    substring_seq (tuple): start and end index (both inclusive)

    Returns:
    float: performance metrics: precision, recall, F1-Score, and Exact Match.
    """
    # sum of all probabilities
    sum_of_all_probabilities = sum(probabilities)
    # probability substring
    substring_probabilities = probabilities[substring_seq[0]:substring_seq[1]]
    # sum of probabilities of substring
    sum_of_substring_probabilities = sum(substring_probabilities)
    # sum of indicator random variables
    num_of_indicator_rv = len(substring_probabilities)
    precision = sum_of_substring_probabilities / num_of_indicator_rv
    recall = sum_of_substring_probabilities / sum_of_all_probabilities
    # calculating expected ef1 score
    if precision + recall != 0:
        f1_score = (2 * precision * recall) / (
                precision + recall)
    else:
        # handling of division by 0
        f1_score = 0

    em = 0
    if sum_of_all_probabilities == sum_of_substring_probabilities:
        em = 1

    return precision, recall, f1_score, em
