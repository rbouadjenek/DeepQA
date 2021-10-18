# Optimizing F1-Score for Text Spans Extraction in Question Answering Systems

<b>Abstract</b>

Current question answering systems are based on complex deep neural network architectures where often, the output
consists of two classification layers that are used to predict simultaneously the start and end positions of the answer in the input
passage. However, we argue in this paper that this approach suffers from several drawbacks. First, it does not optimize the metrics that
are used to evaluate the model’s performance, e.g., F1-Score or exact-match. Second, this approach does not allow encoding all
possible answers during training, and during prediction, it only focuses on one possible answer and does not allow the extraction of
other candidate answers. Lastly, this approach does not prevent the case where the token with the highest probability for being the
answer start token comes after the token with the highest probability for being the answer end token. This paper addresses these
deficiencies by proposing a novel approach for text spans extraction, which consists of a single classification output layer followed by
an independent optimization module. This 2-step approach aims first to optimize exact-match and then extracts a text span by
maximizing an expected F1-Score (EF1) objective. Specifically, we contribute with a Mixed Integer Linear Programming (MILP)
formulation to optimize EF1 subject to parameterized constraints for text spans extraction. The proposed approach allows the
extraction of multiple possible answers to a question from a passage and to identify if a span of text is a valid answer and so the
answerability of the question given the passage. We demonstrate the effectiveness of our approach with extensive experimental
evaluations and a comparison against existing baselines on the SQuAD1.1, SQuAD2.0, and NewsQA datasets.



# Installation


The MILP algorithm described in the paper requires [Gurobi](https://www.gurobi.com/) to be installed in your Python environement. Please follow [these instructions](https://www.gurobi.com/documentation/9.1/quickstart_mac/software_installation_guid.html).
Once Gurobi is installed, you need to add it to your own Python environment. Doing so requires you to install the gurobipy module. The steps for doing this depend on your platform. On Linux, you will need to open a terminal window, change your current directory to the Gurobi `<installdir>` (the directory that contains the file setup.py), and issue the following command:
  
  
```
python setup.py install
```
  
# THE MILP Algorithm
  
The MILP algorithm described in the paper can be executed in the Notebook in:

```
├── DeepQA  
   ├── MILP-Algorithm.ipynb
```

 Please install `Gurobi` as described above first.
  
# Training the models
  
  You can train the models described in the paper by clicking on the following links:
  

- MILP algorithm: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_MILP.ipynb). 
- Baseline 1: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_Baseline1.ipynb). 
- Baseline 3 ANSWER POINTER Sequence Model: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_ANSWER_POINTER_SM.ipynb). 
- Baseline 4 ANSWER POINTER Boundary Model: [Click here to open the Notebook in Google Colab ![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/rbouadjenek/DeepQA/blob/master/DeepQA/QA_V2.0_ANSWER_POINTER_BM.ipynb). 



## Interesting papers to read

- https://arxiv.org/pdf/1909.02209.pdf (paper that describes the best the technique!)
- https://arxiv.org/pdf/1810.06638.pdf
- https://arxiv.org/pdf/1808.05759.pdf
- https://arxiv.org/pdf/1712.03556.pdf
- https://arxiv.org/pdf/1711.07341.pdf
- https://arxiv.org/pdf/2001.09694v2.pdf
- https://arxiv.org/pdf/1908.05147.pdf
- https://arxiv.org/pdf/1608.07905.pdf
- https://arxiv.org/pdf/1907.10529.pdf


# Contacts 
For more information about this project, please contact:
* Mohamed Reda Bouadjenek: rbouadjenek@gmail.com
