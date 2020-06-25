import random
# import numpy as np
from gurobipy import *
import pandas as pd

REPORT_FILE_NAME = 'assert_equality.tsv'
OUTPUT_COLUMNS = ['Array_Size','Brute_Force_Optimal','MILP_Optimal','Brute_Force_ef1','Milp_ef1','Match','incorrect_array']

MIN_ARRAY_SIZE = 10
MAX_ARRAY_SIZE = 50

# number of arrays 
NUMBER_OF_ARRAYS = 10000


OUTPUT_DF = pd.DataFrame(columns=OUTPUT_COLUMNS)

# def select_LP_optimal_subsequence(probabilities):
#     """
#     This function optimizes the expected f1-score to choose the optimal subsequence
#     of probabilities.
#     :param probabilities: the sequence of probabilities.
#     :return: the start index and the end index of the optimal subsequence.
#     """
#     C = sum(probabilities)
#     M = 1e4  # Value for Big M.
#     dict_probabilities = dict({j: probabilities[j] for j in range(len(probabilities))})
#     ###################
#     # Define the model.
#     ###################
#     model = Model('EF1-Score')
#     # element variable
#     w = model.addVars(dict_probabilities.keys(), lb=0.0, ub=1.0, vtype='C', name='w')
#     I = model.addVars(dict_probabilities.keys(), lb=0.0, ub=1.0, vtype='B', name='I')
#     u = model.addVar(lb=0, vtype='C', name='u')
#
#     # Index variables
#     Is = model.addVars(dict_probabilities.keys(), vtype='B', name='Is')
#     Ie = model.addVars(dict_probabilities.keys(), vtype='B', name='Ie')
#
#     s = model.addVar(lb=0, ub=len(dict_probabilities) - 1, vtype='I', name='s')
#     e = model.addVar(lb=0, ub=len(dict_probabilities) - 1, vtype='I', name='e')
#
#     # Objective function
#     model.setObjective(w.prod(dict_probabilities), GRB.MAXIMIZE)
#
#     # Constraints
#
#     model.addConstr(quicksum(w[j] for j in range(len(dict_probabilities))) + u * C == 1.0, 'sum(w)+uC=1')
#     model.addConstr(s <= e, 's<=e')
#     for j in dict_probabilities:
#         model.addConstr(w[j] <= u, f"w[{j}]<=u")
#         model.addConstr(w[j] <= M * I[j], f"w[{j}]<=M*I({j})")
#         model.addConstr(w[j] >= u - M * (1 - I[j]), f"w[{j}]>=u-M*[1-I({j})]")
#         model.addConstr(w[j] >= 0.0, f"w[{j}]>=0.0")
#
#         # Interval selection constraints
#         model.addGenConstrAnd(I[j], [Is[j], Ie[j]], f"selection_constraint-{j}")
#
#         model.addGenConstrIndicator(Is[j], True, s <= j)
#         model.addGenConstrIndicator(Ie[j], True, e >= j)
#
#         model.addGenConstrIndicator(Is[j], False, s >= j + 1)
#         model.addGenConstrIndicator(Ie[j], False, e <= j - 1)
#
#     model.optimize()
#     # model.write("out.lp")
#     optimal_value = 2 * model.getObjective().getValue() # optimal ef1 score
#     return int(round(s.X)), int(round(e.X)), optimal_value



# def get_brute_force_substring_ef1_score(probabilities, substring_seq):
# 	"""
# 	Get expected F1-score for a substring
# 	"""
# 	# sum of all probabilities
# 	sum_of_all_probabilities = sum(probabilities)
# 	# probability substring
# 	substring_probabilities = probabilities[substring_seq[0]:substring_seq[1]]
# 	# sum of probabilities of substring
# 	sum_of_substring_probabilities = sum(substring_probabilities)
# 	# sum of indicator random variables
# 	num_of_indicator_rv = len(substring_probabilities)
# 	expected_precision = sum_of_substring_probabilities/num_of_indicator_rv
# 	expected_recall = sum_of_substring_probabilities/sum_of_all_probabilities
# 	# calculating expected ef1 score
# 	try:
# 		ef1_score_for_substring = (2*expected_precision*expected_recall)/(expected_precision+expected_recall)
# 	except:
# 		# handling of division by 0
# 		ef1_score_for_substring = 0
# 	return ef1_score_for_substring
#
#
#
# def get_brute_force_optimal_substring(probabilities):
# 	# for brute Force
# 	# print('Computing Brute Force')
# 	optimal_ef1_score_dict = {}
# 	# list of all subset indices
# 	all_substring_index_list = [(i,i+j) for i in range(0,len(probabilities)) for j in range(1,len(probabilities)-i+1)]
# 	# getting ef1-score for each substring
# 	for substring_index_list in all_substring_index_list:
# 		optimal_ef1_score_dict[(substring_index_list[0],substring_index_list[1])] = get_brute_force_substring_ef1_score(probabilities,substring_index_list)
# 	# print(optimal_ef1_score_dict)
# 	optimal_ef1_score_dict_sorted = sorted(optimal_ef1_score_dict.items(), key=lambda x: x[1], reverse=True)
# 	# returns tuple of start and end indices
# 	# return optimal subset indices
# 	return optimal_ef1_score_dict_sorted[0][0],optimal_ef1_score_dict_sorted[0][1]



def assert_milp_brute_force_optimal_substring(probabilities):
	brute_force_index_tuple, brute_force_max_ef1_score = get_brute_force_optimal_substring(probabilities)
	brute_force_index_tuple = (brute_force_index_tuple[0], brute_force_index_tuple[1]-1)
	s, e, milp_max_ef1_score = select_LP_optimal_subsequence(probabilities)
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