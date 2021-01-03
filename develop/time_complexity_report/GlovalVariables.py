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

IMPURITY_ARRAY = [0.5, 0.6, 0.7, 0.8, 0.9, 1]  # lambda parameter
# IMPURITY_ARRAY = [1]			# lambda parameter

ARRAY_SIZE_LIST = [10, 20, 30, 50, 100, 150, 200, 300, 400, 500]
# ARRAY_SIZE_LIST = [10, 20, 30]

OUTPUT_DIR = 'output'

# NUMBER OF TIMES TO EXECUTE A PROBABILITY DISTRIBUTION for EF1
NUM_OF_RUNS = 10

# MILP vs Brute Force vs BPS
OUTPUT_FILE_NAME = 'time_p={}_impurity={:2.2f}.tsv'
OUTPUT_FILE_COLUMNS = ['DATA_SIZE', 'TIME_MILP', 'TIME_MILP_CI', 'TIME_BF', 'TIME_BF_CI', 'TIME_BPS', 'TIME_BPS_CI']

# MILP vs BPS
MILP_BPS_FILE_NAME = 'perf_raw_p={}_impurity={:2.2f}.tsv'
MILP_BPS_FILE_COLUMNS = ['DATA_SIZE','MILP_START','MILP_END', 'MILP_EF1_SCORE','MILP_PRECISION','MILP_RECALL','MILP_F1_SCORE','MILP_EM','BPS_START','BPS_END', 'BPS_EF1_SCORE','BPS_PRECISION','BPS_RECALL','BPS_F1_SCORE','BPS_EM', 'PROBABILITIES','CORRUPTED_PROBABILITIES']

# Performance
OUTPUT_PERF_FILE_NAME = 'perf_p={}_impurity={:2.2f}.tsv'
OUTPUT_PERF_FILE_COLUMNS = ['DATA_SIZE','MILP_PRECISION_MEAN','MILP_PRECISION_CI','MILP_RECALL_MEAN','MILP_RECALL_CI','MILP_F1_SCORE_MEAN','MILP_F1_SCORE_CI','MILP_EM', 'BPS_PRECISION_MEAN', 'BPS_PRECISION_CI', 'BPS_RECALL_MEAN', 'BPS_RECALL_CI', 'BPS_F1_SCORE_MEAN', 'BPS_F1_SCORE_CI', 'BPS_EM']
