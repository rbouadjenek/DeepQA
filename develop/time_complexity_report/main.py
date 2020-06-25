import helpers
import GlovalVariables as GV
import numpy as np
import scipy.stats
import time
import pandas as pd
import os
import argparse


def initialize_proces():
    helpers.create_dir(GV.OUTPUT_DIR)


def mean_confidence_interval_95(data):
    mean = np.mean(data)
    ci = 1.96 * np.std(data) / np.sqrt(len(data))
    return mean, ci


def get_random_probabilities_list(num_of_arrays, array_size, num_of_positive_tokens):
    """
    Return num_of_arrays number of random probability list. Returns list os probability lists
    """
    probabilities_list = []

    for array in range(num_of_arrays):
        contiguous_positive_element = [1] * num_of_positive_tokens
        probabilities = [0] * array_size
        # For start of positive token sequence
        random_start_index = helpers.get_random_numbers_between(
            array_size - num_of_positive_tokens)  # the endindex is total length minus number of positive tokens
        # random positive token distribution array
        probabilities[
        random_start_index:random_start_index + len(contiguous_positive_element)] = contiguous_positive_element
        probabilities_list.append(probabilities)
    return probabilities_list


def get_impure_probabilities(intial_array_size, probabilities, impurity):
    if impurity == 1:
        return probabilities
    else:
        impurity_probabilities = helpers.get_random_array(intial_array_size)
        # impurity injection
        np_probabilities = np.array(probabilities)
        np_impurity_probabilities = np.array(impurity_probabilities)
        impurity_injection_probabilities = impurity * np_probabilities + (1 - impurity) * np_impurity_probabilities
        return list(impurity_injection_probabilities)


def get_brute_force_ef1_execution_time(probabilities):
    start = time.time()
    brute_force_index_tuple, brute_force_max_ef1_score = helpers.get_brute_force_optimal_substring(probabilities)
    return time.time() - start


def get_milp_ef1_executiong_time(probabilities):
    start = time.time()
    s, e, milp_max_ef1_score = helpers.select_LP_optimal_subsequence(probabilities)
    return time.time() - start


def main(num_of_positive_tokens):
    initialize_proces()
    for array_size in GV.ARRAY_SIZE_LIST:

        # initial random probability
        probabilities_list = get_random_probabilities_list(GV.NUM_OF_RUNS, array_size, num_of_positive_tokens)

        for impurity in GV.IMPURITY_ARRAY:
            print('Array Size: {}, Impurity: {}'.format(array_size, impurity))

            milp_ef1_time_duration_list = []
            brute_force_ef1_time_duration_list = []
            impurity_injection_probabilities_list = []
            for probabilities in probabilities_list:
                # probability with impurity
                impurity_injection_probabilities = get_impure_probabilities(array_size, probabilities, impurity)

                impurity_injection_probabilities_list.append(impurity_injection_probabilities)
                # computing time for milp ef1 score
                milp_ef1_time_duration_list.append(get_milp_ef1_executiong_time(impurity_injection_probabilities))
                # computing time for brute force ef1 score
                brute_force_ef1_time_duration_list.append(
                    get_brute_force_ef1_execution_time(impurity_injection_probabilities))

            # computing mean and confidence interval
            milp_ef1_mean, milp_ef1_confidence_interval = mean_confidence_interval_95(milp_ef1_time_duration_list)
            brute_force_ef1_mean, brute_force_ef1_confidence_interval = mean_confidence_interval_95(
                brute_force_ef1_time_duration_list)

            output_df = pd.DataFrame(columns=GV.OUTPUT_FILE_COLUMNS, data={'PROBABILITIES': probabilities_list})

            print(probabilities_list)
            # output_df['PROBABILITIES'] = probabilities_list
            output_df['IMPURITY_PROBABILITIES'] = impurity_injection_probabilities_list
            output_df['TIME_MILP'] = milp_ef1_time_duration_list
            output_df['TIME_MILP_MEAN'] = milp_ef1_mean
            output_df['TIME_MILP_CI'] = milp_ef1_confidence_interval

            output_df['TIME_BF'] = brute_force_ef1_time_duration_list
            output_df['TIME_BF_MEAN'] = brute_force_ef1_mean
            output_df['TIME_BF_CI'] = brute_force_ef1_confidence_interval

            # write to file
            output_df.to_csv(
                os.path.join(GV.OUTPUT_DIR, GV.OUTPUT_FILE_NAME.format(
                    array_size,
                    num_of_positive_tokens,
                    impurity
                )
                             ), sep='\t', index=False)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Expected f1-score for optimal substring using MILP and brute force')
    parser.add_argument("--p", help="Number of positive tokens", type=int, required=True)
    args = parser.parse_args()

    num_of_positive_tokens = args.p
    main(num_of_positive_tokens)
