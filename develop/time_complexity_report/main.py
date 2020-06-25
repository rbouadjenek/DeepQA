from helpers import helpers
import GlovalVariables as GV
import numpy as np
import scipy.stats
import time
import pandas as pd
import os
import argparse
from helpers import ef1_helpers

def initialize_proces():
	# helpers.remove_dir(GV.OUTPUT_DIR)
	helpers.create_dir(GV.OUTPUT_DIR)



def get_brute_force_ef1_execution_time(probabilities):
	start = time.time()
	brute_force_index_tuple, brute_force_max_ef1_score = ef1_helpers.get_brute_force_optimal_substring(probabilities)
	return time.time()-start



def get_milp_ef1_executiong_time(probabilities): 
	start = time.time()
	s, e, milp_max_ef1_score = ef1_helpers.select_LP_optimal_subsequence(probabilities)
	return time.time()-start


def get_total_number_of_executions():
	return len(GV.ARRAY_SIZE_LIST)*len(GV.IMPURITY_ARRAY)* (GV.NUM_OF_RUNS)


def main(num_of_positive_tokens):
	initialize_proces()
	total_executions = get_total_number_of_executions()
	completed_executions = 0

	for impurity in GV.IMPURITY_ARRAY:
		output_df = pd.DataFrame(columns=GV.OUTPUT_FILE_COLUMNS)
	
		for array_size in GV.ARRAY_SIZE_LIST:
			# initial random probability based on number of positive tokens
			probabilities = helpers.get_random_probabilities_with_positive_tokens(array_size, num_of_positive_tokens)
			run_row_dict = {}
			print('Array Size: {}, Impurity: {}'.format(array_size, impurity))
			milp_ef1_time_duration_list = []
			brute_force_ef1_time_duration_list = []

			for run in range(GV.NUM_OF_RUNS):
				# probability with impurity
				impurity_injection_probabilities = helpers.get_impure_probabilities(array_size, probabilities, impurity)
				# computing time for milp ef1 score
				milp_ef1_time_duration_list.append(get_milp_ef1_executiong_time(impurity_injection_probabilities))
				# computing time for brute force ef1 score
				brute_force_ef1_time_duration_list.append(get_brute_force_ef1_execution_time(impurity_injection_probabilities))
				completed_executions += 1
				helpers.print_progress_bar(completed_executions, total_executions, prefix = 'Progress:', suffix = 'Complete', length = 50)

			# computing mean and confidence interval
			milp_ef1_mean, milp_ef1_confidence_interval = helpers.mean_confidence_interval(milp_ef1_time_duration_list)
			brute_force_ef1_mean, brute_force_ef1_confidence_interval = helpers.mean_confidence_interval(brute_force_ef1_time_duration_list)


			# print(probabilities_list)
			# output_df['PROBABILITIES'] = probabilities_list
			# output_df['IMPURITY_PROBABILITIES'] = impurity_injection_probabilities_list
			run_row_dict['DATA_SIZE'] = array_size
			run_row_dict['TIME_MILP'] = milp_ef1_mean
			run_row_dict['TIME_MILP_CI'] = milp_ef1_confidence_interval
			run_row_dict['TIME_BF'] = brute_force_ef1_mean
			run_row_dict['TIME_BF_CI'] = brute_force_ef1_confidence_interval
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

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Expected f1-score for optimal substring using MILP and brute force')
	parser.add_argument("--p", help="Number of positive tokens", type=int, required=True) 
	args = parser.parse_args()

	num_of_positive_tokens = args.p
	main(num_of_positive_tokens)