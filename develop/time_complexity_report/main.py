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
	return time.time()-start, s, e,


def get_milp_ef1_executiong_time_and_bounding_indices(probabilities): 
	start = time.time()
	s, e, milp_max_ef1_score = ef1_helpers.select_LP_optimal_subsequence(probabilities)
	return time.time()-start, s, e



def get_total_number_of_executions():
    return len(GV.ARRAY_SIZE_LIST) * len(GV.IMPURITY_ARRAY) * (GV.NUM_OF_RUNS)


def main(num_of_positive_tokens):
	initialize_proces()
	total_executions = get_total_number_of_executions()


	mil_bps_df = pd.DataFrame(columns=GV.MILP_BPS_FILE_COLUMNS)

	for impurity in tqdm(GV.IMPURITY_ARRAY, desc='Total progress'):
		output_df = pd.DataFrame(columns=GV.OUTPUT_FILE_COLUMNS)
	
		for array_size in tqdm(GV.ARRAY_SIZE_LIST, desc='Arrays processing with impurity = {}'.format(impurity)):
			# initial random probability based on number of positive tokens
			probabilities = helpers.get_random_probabilities_with_positive_tokens(array_size, num_of_positive_tokens)
			run_row_dict = {}
			# print('Array Size: {}, Impurity: {}'.format(array_size, impurity))
			milp_ef1_time_duration_list = []
			brute_force_ef1_time_duration_list = []
			bps_ef1_time_duration_list = []

			# milp vs bps
			milp_bps_row = {}
			milp_bps_row['DATA_SIZE'] = array_size
			milp_bps_row['IMPURITY'] = impurity
			for run in range(GV.NUM_OF_RUNS):
				# probability with impurity
				impurity_injection_probabilities = helpers.get_impure_probabilities(probabilities, impurity)
				# computing time for milp ef1 score
				mil_exec_time, milp_s, milp_e = get_milp_ef1_executiong_time_and_bounding_indices(impurity_injection_probabilities)
				milp_ef1_time_duration_list.append(mil_exec_time)
				# computing time for brute force ef1 score
				brute_force_ef1_time_duration_list.append(get_brute_force_ef1_execution_time(impurity_injection_probabilities))
				# computing time for bps ef1 score		
				bps_exec_time, bps_start, bps_end = get_bps_ef1_execution_time_and_bounding_indices(impurity_injection_probabilities)
				bps_ef1_time_duration_list.append(bps_exec_time)

				milp_bps_row['MILP_EF1_SCORE'] = ef1_helpers.get_substring_ef1_score(impurity_injection_probabilities,(milp_s, milp_e+1))
				milp_bps_row['BPS_EF1_SCORE'] = ef1_helpers.get_substring_ef1_score(impurity_injection_probabilities,(bps_start, bps_end+1))
				mil_bps_df = mil_bps_df.append(milp_bps_row, ignore_index=True)

			# computing mean and confidence interval
			milp_ef1_mean, milp_ef1_confidence_interval = helpers.mean_confidence_interval_95(milp_ef1_time_duration_list)
			brute_force_ef1_mean, brute_force_ef1_confidence_interval = helpers.mean_confidence_interval_95(brute_force_ef1_time_duration_list)
			bps_ef1_mean, bps_ef1_confidence_interval = helpers.mean_confidence_interval_95(bps_ef1_time_duration_list)

			run_row_dict['DATA_SIZE'] = array_size
			run_row_dict['TIME_MILP'] = milp_ef1_mean
			run_row_dict['TIME_MILP_CI'] = milp_ef1_confidence_interval
			run_row_dict['TIME_BF'] = brute_force_ef1_mean
			run_row_dict['TIME_BF_CI'] = brute_force_ef1_confidence_interval
			run_row_dict['TIME_BPS'] = bps_ef1_mean
			run_row_dict['TIME_BPS_CI'] = bps_ef1_confidence_interval
			output_df = output_df.append(run_row_dict, ignore_index=True)

		# write to file for each impurity and given p
		output_df['DATA_SIZE'] = output_df['DATA_SIZE'].astype(int)
		output_df = output_df[GV.OUTPUT_FILE_COLUMNS]
		output_df.to_csv(
						os.path.join(GV.OUTPUT_DIR, GV.OUTPUT_FILE_NAME.format(
																				num_of_positive_tokens,
																				impurity
																				)
																				), sep='\t', index=False)

		mil_bps_df.sort_values(by=['DATA_SIZE','IMPURITY'], ascending=True, inplace=True)
		mil_bps_df.to_csv(
						os.path.join(GV.OUTPUT_DIR, GV.MILP_BPS_FILE_NAME.format(
																				num_of_positive_tokens
																				)
																				), sep='\t', index=False)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Expected f1-score for optimal substring using MILP and brute force')
    parser.add_argument("--p", help="Number of positive tokens", type=int, required=True)
    args = parser.parse_args()

    num_of_positive_tokens = args.p
    main(num_of_positive_tokens)
