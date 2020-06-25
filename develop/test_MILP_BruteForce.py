import random
# import numpy as np
from gurobipy import *
import pandas as pd
from time_complexity_report.helpers import ef1_helpers

REPORT_FILE_NAME = 'assert_equality.tsv'
OUTPUT_COLUMNS = ['Array_Size','Brute_Force_Optimal','MILP_Optimal','Brute_Force_ef1','Milp_ef1','Match','incorrect_array']

MIN_ARRAY_SIZE = 10
MAX_ARRAY_SIZE = 50

# number of arrays 
NUMBER_OF_ARRAYS = 10000


OUTPUT_DF = pd.DataFrame(columns=OUTPUT_COLUMNS)


def assert_milp_brute_force_optimal_substring(probabilities):
	brute_force_index_tuple, brute_force_max_ef1_score = ef1_helpers.get_brute_force_optimal_substring(probabilities)
	brute_force_index_tuple = (brute_force_index_tuple[0], brute_force_index_tuple[1]-1)
	s, e, milp_max_ef1_score = ef1_helpers.select_LP_optimal_subsequence(probabilities)
	milp_index_tuple = (s, e)
	return brute_force_index_tuple, brute_force_max_ef1_score, milp_index_tuple, milp_max_ef1_score

def main():
	global OUTPUT_DF

	# for number of arrays
	for cnt, array in enumerate(range(0, NUMBER_OF_ARRAYS)):
		row_dict = {}
		# random array size
		random_array_size = random.randint(MIN_ARRAY_SIZE, MAX_ARRAY_SIZE)
		print(random_array_size)
		# array_random_probabilities = list(np.random.random(random_array_size))
		# taking decimal upto 2 places
		array_random_probabilities = [float('%.2f'%(random.random())) for _ in range(0, random_array_size)]	
		# print(array_random_probabilities)
		brute_force_index_tuple, brute_force_max_ef1_score, milp_index_tuple, milp_max_ef1_score = assert_milp_brute_force_optimal_substring(array_random_probabilities)
		row_dict['Array_Size'] = len(array_random_probabilities)
		row_dict['Brute_Force_Optimal'] = brute_force_index_tuple
		row_dict['Brute_Force_ef1'] = brute_force_max_ef1_score
		row_dict['MILP_Optimal'] = milp_index_tuple
		row_dict['Milp_ef1'] = milp_max_ef1_score
		match = (brute_force_index_tuple== milp_index_tuple)
		row_dict['Match'] = match
		if not match:
			row_dict['incorrect_array'] = array_random_probabilities

		OUTPUT_COLUMNS = ['Array_Size','Brute_Force_Optimal','MILP_Optimal','Brute_Force_ef1','Milp_ef1','Match','incorrect_array']

		OUTPUT_DF = OUTPUT_DF.append(row_dict, ignore_index=True)
		print('----------------')
	OUTPUT_DF.to_csv(REPORT_FILE_NAME, sep='\t', index=False)

if __name__ == '__main__':
	main()