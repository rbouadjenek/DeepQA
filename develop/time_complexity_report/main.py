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
from helpers import helpers, ef1_helpers
import GlovalVariables as GV
import time
import pandas as pd
import os
import argparse
from tqdm import tqdm


def initialize_proces():
    # helpers.remove_dir(GV.OUTPUT_DIR)
    helpers.create_dir(GV.OUTPUT_DIR)


def get_brute_force_ef1_execution_time(probabilities):
    start = time.time()
    brute_force_index_tuple, brute_force_max_ef1_score = ef1_helpers.get_brute_force_optimal_substring(probabilities)
    return time.time() - start


def get_bps_ef1_execution_time_and_bounding_indices(probabilities):
    start = time.time()
    s, e = ef1_helpers.bps_bound_contraction_algo(probabilities)
    return time.time() - start, s, e,


def get_milp_ef1_executiong_time_and_bounding_indices(probabilities):
    start = time.time()
    s, e, milp_max_ef1_score = ef1_helpers.select_LP_optimal_subsequence(probabilities)
    return time.time() - start, s, e


def get_total_number_of_executions():
    return len(GV.ARRAY_SIZE_LIST) * len(GV.IMPURITY_ARRAY) * (GV.NUM_OF_RUNS)


def main(num_of_positive_tokens):
    initialize_proces()
    total_executions = get_total_number_of_executions()

    for impurity in tqdm(GV.IMPURITY_ARRAY, desc='Total progress'):
        output_df = pd.DataFrame(columns=GV.OUTPUT_FILE_COLUMNS)
        mil_bps_df = pd.DataFrame(columns=GV.MILP_BPS_FILE_COLUMNS)
        perf_df = pd.DataFrame(columns=GV.OUTPUT_PERF_FILE_COLUMNS)

        for array_size in tqdm(GV.ARRAY_SIZE_LIST, desc='Arrays processing with impurity = {}'.format(impurity)):

            run_row_dict = {}
            # print('Array Size: {}, Impurity: {}'.format(array_size, impurity))
            milp_ef1_time_duration_list = []
            brute_force_ef1_time_duration_list = []
            bps_ef1_time_duration_list = []

            bps_precision_list = []
            bps_recall_list = []
            bps_f1_score_list = []
            bps_em_list = []

            milp_precision_list = []
            milp_recall_list = []
            milp_f1_score_list = []
            milp_em_list = []

            # milp vs bps
            milp_bps_row = {}
            milp_bps_row['DATA_SIZE'] = array_size


            # performance
            performance_dict = {}

            for run in range(GV.NUM_OF_RUNS):
                # initial random probability based on number of positive tokens
                probabilities = helpers.get_random_probabilities_with_positive_tokens(array_size,
                                                                                      num_of_positive_tokens)
                milp_bps_row['PROBABILITIES'] = probabilities
                # probability with impurity
                impurity_injection_probabilities = helpers.get_impure_probabilities(probabilities, impurity)

                # assign probabilities to output
                milp_bps_row['CORRUPTED_PROBABILITIES'] = impurity_injection_probabilities

                # computing time for milp ef1 score
                mil_exec_time, milp_start, milp_end = get_milp_ef1_executiong_time_and_bounding_indices(
                    impurity_injection_probabilities
                )
                milp_bps_row['MILP_START'] = milp_start
                milp_bps_row['MILP_END'] = milp_end
                milp_ef1_time_duration_list.append(mil_exec_time)
                # computing time for brute force ef1 score
                brute_force_ef1_time_duration_list.append(
                    get_brute_force_ef1_execution_time(impurity_injection_probabilities)
                )
                # computing time for bps ef1 score
                bps_exec_time, bps_start, bps_end = get_bps_ef1_execution_time_and_bounding_indices(
                    impurity_injection_probabilities
                )
                milp_bps_row['BPS_START'] = bps_start
                milp_bps_row['BPS_END'] = bps_end
                bps_ef1_time_duration_list.append(bps_exec_time)

                milp_bps_row['MILP_EF1_SCORE'] = ef1_helpers.get_substring_ef1_score(
                    impurity_injection_probabilities,
                    (milp_start, milp_end + 1)
                )
                milp_bps_row['BPS_EF1_SCORE'] = ef1_helpers.get_substring_ef1_score(impurity_injection_probabilities,
                                                                                    (bps_start, bps_end + 1)
                                                                                    )

                # computing performance for bps
                bps_precision, bps_recall, bps_f1_score, bps_em = ef1_helpers.get_substring_performance_score(probabilities,(bps_start, bps_end + 1))
                bps_precision_list.append(bps_precision)
                bps_recall_list.append(bps_recall)
                bps_f1_score_list.append(bps_f1_score)
                bps_em_list.append(bps_em)
                milp_bps_row['BPS_PRECISION'] = bps_precision
                milp_bps_row['BPS_RECALL'] = bps_recall
                milp_bps_row['BPS_F1_SCORE'] = bps_f1_score
                milp_bps_row['BPS_EM'] = bps_em

                # computing performance for milp
                milp_precision, milp_recall, milp_f1_score, milp_em = ef1_helpers.get_substring_performance_score(
                    probabilities, (milp_start, milp_end + 1))
                milp_precision_list.append(milp_precision)
                milp_recall_list.append(milp_recall)
                milp_f1_score_list.append(milp_f1_score)
                milp_em_list.append(milp_em)
                milp_bps_row['MILP_PRECISION'] = milp_precision
                milp_bps_row['MILP_RECALL'] = milp_recall
                milp_bps_row['MILP_F1_SCORE'] = milp_f1_score
                milp_bps_row['MILP_EM'] = milp_em

                mil_bps_df = mil_bps_df.append(milp_bps_row, ignore_index=True)



            # computing mean and confidence interval
            milp_ef1_mean, milp_ef1_confidence_interval = helpers.mean_confidence_interval_95(
                milp_ef1_time_duration_list)
            brute_force_ef1_mean, brute_force_ef1_confidence_interval = helpers.mean_confidence_interval_95(
                brute_force_ef1_time_duration_list)
            bps_ef1_mean, bps_ef1_confidence_interval = helpers.mean_confidence_interval_95(bps_ef1_time_duration_list)

            run_row_dict['DATA_SIZE'] = array_size
            run_row_dict['TIME_MILP'] = milp_ef1_mean
            run_row_dict['TIME_MILP_CI'] = milp_ef1_confidence_interval
            run_row_dict['TIME_BF'] = brute_force_ef1_mean
            run_row_dict['TIME_BF_CI'] = brute_force_ef1_confidence_interval
            run_row_dict['TIME_BPS'] = bps_ef1_mean
            run_row_dict['TIME_BPS_CI'] = bps_ef1_confidence_interval
            output_df = output_df.append(run_row_dict, ignore_index=True)

            bps_precision_mean, bps_precision_confidence_interval = helpers.mean_confidence_interval_95(bps_precision_list)
            bps_recall_mean, bps_recall_confidence_interval = helpers.mean_confidence_interval_95(bps_recall_list)
            bps_f1_score_mean, bps_f1_score_confidence_interval = helpers.mean_confidence_interval_95(bps_f1_score_list)
            bps_em_mean, _ = helpers.mean_confidence_interval_95(bps_em_list)

            performance_dict['DATA_SIZE'] = array_size
            performance_dict['BPS_PRECISION_MEAN'] = bps_precision_mean
            performance_dict['BPS_PRECISION_CI'] = bps_precision_confidence_interval
            performance_dict['BPS_RECALL_MEAN'] = bps_recall_mean
            performance_dict['BPS_RECALL_CI'] = bps_recall_confidence_interval
            performance_dict['BPS_F1_SCORE_MEAN'] = bps_f1_score_mean
            performance_dict['BPS_F1_SCORE_CI'] = bps_f1_score_confidence_interval
            performance_dict['BPS_EM'] = bps_em_mean

            milp_precision_mean, milp_precision_confidence_interval = helpers.mean_confidence_interval_95(
                milp_precision_list)
            milp_recall_mean, milp_recall_confidence_interval = helpers.mean_confidence_interval_95(milp_recall_list)
            milp_f1_score_mean, milp_f1_score_confidence_interval = helpers.mean_confidence_interval_95(
                milp_f1_score_list)
            milp_em_mean, _ = helpers.mean_confidence_interval_95(milp_em_list)

            performance_dict['MILP_PRECISION_MEAN'] = milp_precision_mean
            performance_dict['MILP_PRECISION_CI'] = milp_precision_confidence_interval
            performance_dict['MILP_RECALL_MEAN'] = milp_recall_mean
            performance_dict['MILP_RECALL_CI'] = milp_recall_confidence_interval
            performance_dict['MILP_F1_SCORE_MEAN'] = milp_f1_score_mean
            performance_dict['MILP_F1_SCORE_CI'] = milp_f1_score_confidence_interval
            performance_dict['MILP_EM'] = milp_em_mean

            perf_df = perf_df.append(performance_dict, ignore_index=True)

        # write MILP vs Brute Force file for each impurity and given p
        output_df['DATA_SIZE'] = output_df['DATA_SIZE'].astype(int)
        output_df = output_df[GV.OUTPUT_FILE_COLUMNS]
        output_df.to_csv(
            os.path.join(GV.OUTPUT_DIR, GV.OUTPUT_FILE_NAME.format(
                num_of_positive_tokens,
                impurity
            )
                         ), sep='\t', index=False)

        # write performance file for each impurity and given p
        perf_df['DATA_SIZE'] = perf_df['DATA_SIZE'].astype(int)
        perf_df = perf_df[GV.OUTPUT_PERF_FILE_COLUMNS]
        perf_df.to_csv(
            os.path.join(GV.OUTPUT_DIR, GV.OUTPUT_PERF_FILE_NAME.format(
                num_of_positive_tokens,
                impurity
            )
                         ), sep='\t', index=False)

        # write MILP vs BPS file for each impurity and given p
        mil_bps_df['DATA_SIZE'] = mil_bps_df['DATA_SIZE'].astype(int)
        mil_bps_df.sort_values(by=['DATA_SIZE'], ascending=True, inplace=True)
        mil_bps_df.to_csv(
            os.path.join(GV.OUTPUT_DIR, GV.MILP_BPS_FILE_NAME.format(
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
