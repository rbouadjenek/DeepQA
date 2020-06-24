# IMPURITY_ARRAY = [0.6, 0.7, 0.8, 0.9, 1]			# lambda parameter
IMPURITY_ARRAY = [1]			# lambda parameter


# implement this as command line arg
NUM_OF_POSITIVE_TOKENS = list(range(1, 11))			# number of contiguous positive tokens

# ARRAY_SIZE_LIST = [10, 20, 30, 50, 100, 150, 200]
ARRAY_SIZE_LIST = [10]

OUTPUT_DIR = 'output'

NUM_OF_RUNS = 10

OUTPUT_FILE_NAME = 'a={}_p={}_impurity={:2.2f}.tsv'
OUTPUT_FILE_COLUMNS = ['PROBABILITIES','IMPURITY_PROBABILITIES', 'TIME_MILP','TIME_MILP_CI', 'TIME_BF', 'TIME_BF_CI']