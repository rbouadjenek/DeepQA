# DeepQA
Research Project for Deep Query Answering Systems



# Installation

The MILP algorithm described in the paper requires [Gurobi](https://www.gurobi.com/) to be installed in your Python environement. Please follow [these instructions](https://www.gurobi.com/documentation/9.1/quickstart_mac/software_installation_guid.html).
Once Gurobi is installed, you need to add it to your own Python environment. Doing so requires you to install the gurobipy module. The steps for doing this depend on your
platform. On Linux, you will need to open a terminal window, change your current directory to
the Gurobi <installdir> (the directory that contains the file setup.py), and issue the following
command:
```
python setup.py install
```
  
# Training the models
  
  You can train the models described in the paper by clicking on the following links:
  

- MILP algorithm: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_MILP.ipynb). 
- Baseline 1: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_Baseline1.ipynb). 
- Baseline 3 ANSWER POINTER Sequence Model: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_ANSWER_POINTER_SM.ipynb). 
- Baseline 4 ANSWER POINTER Boundary Model: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_ANSWER_POINTER_BM.ipynb). 



## Interesting papers

- https://arxiv.org/pdf/1909.02209.pdf (paper that describes the best the technique!)
- https://arxiv.org/pdf/1810.06638.pdf
- https://arxiv.org/pdf/1808.05759.pdf
- https://arxiv.org/pdf/1712.03556.pdf
- https://arxiv.org/pdf/1711.07341.pdf
- https://arxiv.org/pdf/2001.09694v2.pdf
- https://arxiv.org/pdf/1908.05147.pdf
- https://arxiv.org/pdf/1608.07905.pdf
- https://arxiv.org/pdf/1907.10529.pdf
