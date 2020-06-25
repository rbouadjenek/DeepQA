# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Copyright (c) 2020. ROHAN MAN AMATYA, Deakin University                     +
#                Email:  RMAMATYA@deakin.edu.au                                +
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


def create_dir(dir_path):
    if not os.path.exists(dir_path):
        os.mkdir(dir_path)


def remove_dir(dir_path):
    if os.path.exists(dir_path):
        shutil.rmtree(dir_path)


def get_random_numbers_between(end_index):
    return random.randint(0, end_index)


def get_random_array(array_size):
    return np.array([float('%.2f' % (random.random())) for _ in range(0, array_size)])


def mean_confidence_interval_95(data):
    """
    Return the mean and the confidence interval at 95.
    """
    mean = np.mean(data)
    conf_interval = (np.std(data) / np.sqrt(len(data))) * 1.96
    return mean, conf_interval


def get_random_probabilities_with_positive_tokens(array_size, num_of_positive_tokens):
    """
    Return random probability list based on number of positive tokens. Returns probability list.
    """
    contiguous_positive_element = [1] * num_of_positive_tokens
    probabilities = [0] * array_size
    # For start of positive token sequence
    random_start_index = get_random_numbers_between(
        array_size - num_of_positive_tokens)  # the endindex is total length minus number of positive tokens
    # random positive token distribution array
    probabilities[
    random_start_index:random_start_index + len(contiguous_positive_element)] = contiguous_positive_element
    return probabilities


def get_impure_probabilities(probabilities, impurity):
    """
    Return impurity injected probability distribution
    """
    np_probabilities = np.array(probabilities)
    np_impurity_probabilities = get_random_array(len(probabilities))
    impurity_injection_probabilities = impurity * np_probabilities + (1 - impurity) * np_impurity_probabilities
    return list(impurity_injection_probabilities)
