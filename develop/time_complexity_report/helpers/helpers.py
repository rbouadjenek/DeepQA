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
	return [float('%.2f'%(random.random())) for _ in range(0, array_size)]

def mean_confidence_interval_95(data):
    mean = np.mean(data)
    conf_interval = (np.std(data)/np.sqrt(sum(data))) * 1.96
    return mean, conf_interval

def get_random_probabilities_list_with_positive_tokens(num_of_arrays, array_size, num_of_positive_tokens):
    """
    Return num_of_arrays number of random probability list based on number of positive tokens. Returns list of probability lists
    """
    probabilities_list = []

    for array in range(num_of_arrays):
        contiguous_positive_element = [1]*num_of_positive_tokens
        probabilities = [0]*array_size
        # For start of positive token sequence
        random_start_index = get_random_numbers_between(array_size-num_of_positive_tokens) # the endindex is total length minus number of positive tokens
        #random positive token distribution array 
        probabilities[random_start_index:random_start_index+len(contiguous_positive_element)] = contiguous_positive_element
        probabilities_list.append(probabilities)
    return probabilities_list


def get_random_probabilities_with_positive_tokens(array_size, num_of_positive_tokens):
    """
    Return random probability list based on number of positive tokens. Returns probability list
    """

    contiguous_positive_element = [1]*num_of_positive_tokens
    probabilities = [0]*array_size
    # For start of positive token sequence
    random_start_index = get_random_numbers_between(array_size-num_of_positive_tokens) # the endindex is total length minus number of positive tokens
    #random positive token distribution array 
    probabilities[random_start_index:random_start_index+len(contiguous_positive_element)] = contiguous_positive_element
    return probabilities



def get_impure_probabilities(intial_array_size, probabilities, impurity):
    """
    Return impurity injected probability distribution
    """
    if impurity == 1:
        return probabilities
    else:
        impurity_probabilities = get_random_array(intial_array_size)
        #impurity injection
        np_probabilities = np.array(probabilities)
        np_impurity_probabilities = np.array(impurity_probabilities)
        impurity_injection_probabilities = impurity*np_probabilities +(1-impurity)*np_impurity_probabilities
        return list(impurity_injection_probabilities)

def print_progress_bar(iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '█', printEnd = "\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end = printEnd)
    # Print New Line on Complete
    if iteration == total: 
        print()