#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Copyright (c) 2021. Mohamed Reda Bouadjenek, Deakin University              +
#           Email:  reda.bouadjenek@deakin.edu.au                              +
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


# In[1]:


# To be run on Google Colab!
# !mkdir preprocessing/
# !wget --directory-prefix=preprocessing/  https://raw.githubusercontent.com/rbouadjenek/DeepQA/master/DeepQA/preprocessing/__init__.py   > /dev/null 2> /dev/null 
# !wget --directory-prefix=preprocessing/ https://raw.githubusercontent.com/rbouadjenek/DeepQA/master/DeepQA/preprocessing/preprocessing.py  > /dev/null 2> /dev/null 
# !pip install tokenizers transformers keras_metrics > /dev/null 2> /dev/null 

# from google.colab import drive
# drive.mount('/content/drive')

use_tpu = False


# In[2]:


import os
import random
import json
import tarfile
from tensorflow import keras
import numpy as np
import matplotlib.pyplot as plt
from tensorflow.python.keras import backend as K
from tokenizers import BertWordPieceTokenizer
from transformers import BertTokenizer, BertConfig, TFBertModel
import tensorflow as tf
from tensorflow.keras import layers
from preprocessing.preprocessing import create_squad_examples, create_inputs_targets, get_SQuAD1, get_SQuAD2, get_NewsQA
from keras.layers import LSTM, Input
from tensorflow.keras.layers import InputSpec
from keras.activations import tanh, softmax
from keras.utils.np_utils import to_categorical

# Set the random seeds
np.random.seed(1)
random.seed(1)
tf.random.set_seed(1)



# # Data preprocessing

# In[3]:


# set max length value
max_len = 300
# Create the tokenizer
save_path = os.path.expanduser("~") + "/.bert_base_uncased/"
if not os.path.exists(save_path):
    slow_tokenizer = BertTokenizer.from_pretrained("bert-base-uncased")
    os.makedirs(save_path)
    slow_tokenizer.save_pretrained(save_path)
tokenizer = BertWordPieceTokenizer(save_path + "vocab.txt", lowercase=True)


# In[4]:


# Get the raw data

# raw_train_data, raw_val_data, raw_test_data = get_SQuAD1()
raw_train_data, raw_val_data, raw_test_data = get_SQuAD2()
# raw_train_data, raw_val_data, raw_test_data = get_NewsQA()


# In[5]:


# Prepare the data

# train_squad_examples, train_skipped_questions = create_squad_examples(raw_train_data, max_len, tokenizer, False)
# x_train, y1_train, y2_train, y3_train, y4_train, train_total_skipped_questions = create_inputs_targets(train_squad_examples)
# print('Size: ', len(y1_train[0]))
# print('skipped_questions: ', train_skipped_questions)
# print('skipped_questions: ', train_total_skipped_questions)

# eval_squad_examples, val_skipped_questions = create_squad_examples(raw_val_data, max_len, tokenizer)
# x_eval, y1_eval, y2_eval, y3_eval, y4_eval, val_total_skipped_questions = create_inputs_targets(eval_squad_examples)
# print('Size: ', len(y1_eval[0]))
# print('skipped_questions: ', val_skipped_questions)
# print('skipped_questions: ', val_total_skipped_questions)

test_squad_examples, test_skipped_questions = create_squad_examples(raw_test_data, max_len, tokenizer)
x_test, y1_test, y2_test, y3_test, y4_test, test_total_skipped_questions = create_inputs_targets(test_squad_examples)
print('Size: ', len(y1_test[0]))
print('skipped_questions: ', test_skipped_questions)
print('skipped_questions: ', test_total_skipped_questions)


# # Create the keras model 

# In[6]:


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Acknowledgement:                                                            +
#          The code in this cell has been borrowed from keon                   +
#                     https://github.com/keon                                  +
#               https://github.com/keon/pointer-networks                       +
#                                                                              +
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class Attention(keras.layers.Layer):
    """
        Attention layer
    """

    def __init__(self, hidden_dimensions, name='attention'):
        super(Attention, self).__init__(name=name, trainable=True)
        self.W1 = keras.layers.Dense(hidden_dimensions, use_bias=False)
        self.W2 = keras.layers.Dense(hidden_dimensions, use_bias=False)
        self.V = keras.layers.Dense(1, use_bias=False)

    def call(self, encoder_outputs, dec_output, mask=None):
        w1_e = self.W1(encoder_outputs)
        print('encoder_outputs>',encoder_outputs.shape)
        w2_d = self.W2(dec_output)
        print('dec_output>',dec_output.shape)
        tanh_output = tanh(w1_e + w2_d)
        v_dot_tanh = self.V(tanh_output)
        if mask is not None:
            v_dot_tanh += (mask * -1e9)
        attention_weights = softmax(v_dot_tanh, axis=1)
        att_shape = K.shape(attention_weights)
        return K.reshape(attention_weights, (att_shape[0], att_shape[1]))
    

class Decoder(keras.layers.Layer):
    """
        Decoder class for PointerLayer
    """

    def __init__(self, hidden_dimensions):
        super(Decoder, self).__init__()
        self.lstm = keras.layers.LSTM(
            hidden_dimensions, return_sequences=False, return_state=True)

    def call(self, x, hidden_states):
        print('armani')
        dec_output, state_h, state_c = self.lstm(
            x, initial_state=hidden_states)
        return dec_output, [state_h, state_c]

    def get_initial_state(self, inputs):
        return self.lstm.get_initial_state(inputs)

    def process_inputs(self, x_input, initial_states, constants):
        return self.lstm._process_inputs(x_input, initial_states, constants)
    

class PointerLSTM(keras.layers.Layer):
    """
        PointerLSTM
    """

    def __init__(self, hidden_dimensions, output_length=2, name='pointer', **kwargs):
        super(PointerLSTM, self).__init__(
            hidden_dimensions, name=name, **kwargs)
        self.hidden_dimensions = hidden_dimensions
        self.attention = Attention(hidden_dimensions)
        self.decoder = Decoder(hidden_dimensions)
        self.output_length = output_length

    def build(self, input_shape):
        super(PointerLSTM, self).build(input_shape)
        self.input_spec = [InputSpec(shape=input_shape)]

    def call(self, x, training=None, mask=None, states=None):
        """
        :param Tensor x: Should be the output of the decoder
        :param Tensor states: last state of the decoder
        :param Tensor mask: The mask to apply
        :return: Pointers probabilities
        """

        input_shape = self.input_spec[0].shape
        
#         print('input_shape>',input_shape)
        
        en_seq = x
        x_input = x[:, input_shape[1] - 1, :]
        x_input = K.repeat(x_input, input_shape[1])
        if states:
            initial_states = states
        else:
            initial_states = self.decoder.get_initial_state(x_input)

        constants = []
        preprocessed_input, _, constants = self.decoder.process_inputs(
            x_input, initial_states, constants)
        constants.append(en_seq)
        
#         print('preprocessed_input[:,0:self.output_length,:]>',preprocessed_input[:,0:self.output_length,:].shape)
#         print('initial_states>', initial_states)
#         print('input_shape[1]>',input_shape[1])
        last_output, outputs, states = K.rnn(self.step, preprocessed_input[:,0:self.output_length,:],
                                             initial_states,
                                             go_backwards=self.decoder.lstm.go_backwards,
                                             constants=constants,
                                             input_length=input_shape[1])
#         print('outputs>',outputs.shape)
        
        return outputs

    def step(self, x_input, states):
        x_input = K.expand_dims(x_input,1)
        input_shape = self.input_spec[0].shape
#         print('input_shape>',input_shape)

        en_seq = states[-1]
#         print('en_seq>',en_seq.shape)

        _, [h, c] = self.decoder(x_input, states[:-1])
        dec_seq = K.repeat(h, input_shape[1])
        
#         print('dec_seq>',dec_seq.shape)
        
        probs = self.attention(dec_seq, en_seq)
        
#         print('probs>',probs.shape)
#         print('-'*50)
        return probs, [h, c]

#     def get_output_shape_for(self, input_shape):
#         # output shape is not affected by the attention component
#         print('reda')
#         return (input_shape[0], input_shape[1], input_shape[1])

#     def compute_output_shape(self, input_shape):
#         print('reda')
#         return (input_shape[0], input_shape[1], input_shape[1])


# In[7]:




main_input = Input(shape=(300, 768), name='main_input')

encoder,state_h, state_c = LSTM(768,return_sequences = True, name="encoder",return_state=True)(main_input)
decoder = PointerLSTM(768, output_length=3, name="decoder")

output = decoder(encoder,states=[state_h, state_c])


# In[105]:


# Define the model
def create_model(learn_rate=5e-5, dropout_prob=0.3):
    ## BERT encoder 
    configuration = BertConfig(hidden_dropout_prob=dropout_prob, attention_probs_dropout_prob=dropout_prob) 
    encoder = TFBertModel.from_pretrained("bert-base-uncased", config=configuration)
    ## QA Model
    input_ids = layers.Input(shape=(max_len,), dtype=tf.int32, name="input_ids")
    token_type_ids = layers.Input(shape=(max_len,), dtype=tf.int32, name="token_type_ids")
    attention_mask = layers.Input(shape=(max_len,), dtype=tf.int32, name="attention_mask") 
    
    embedding = encoder(input_ids, token_type_ids=token_type_ids, attention_mask=attention_mask)[0]
    
#     state_h = embedding[:,0,:]
#     state_c = embedding[:,0,:]
#     print(state_h.shape)
    
    decoder = PointerLSTM(768, name="decoder")(embedding)
    
    
    model = keras.Model(
        inputs=[input_ids, token_type_ids, attention_mask],
        outputs=decoder,
    )
    loss = keras.losses.SparseCategoricalCrossentropy(from_logits=False)

    optimizer = keras.optimizers.Adam(lr=learn_rate)
    model.compile(optimizer=optimizer, loss=loss, metrics=['accuracy'],
                  run_eagerly=False) 
    print(model.summary())
    return model


# In[106]:


model = create_model(5e-05, 0)


# In[16]:


if use_tpu:
    tpu = tf.distribute.cluster_resolver.TPUClusterResolver()
    tf.config.experimental_connect_to_cluster(tpu)
    tf.tpu.experimental.initialize_tpu_system(tpu)
    strategy = tf.distribute.experimental.TPUStrategy(tpu)
    


# # Start the training

# In[ ]:


callback = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=3)



# # Run the model with the best parameters

# In[ ]:


# Hyper-parameters
# SQuAD1.1
# file_name = "SQuAD1.1_"
# lr = 5e-05
# dropout_prob = 0.2

# SQuAD2.0
# file_name = "SQuAD2.0_"
# lr = 5e-05
# dropout_prob = 0.2

# NewsQA
# file_name = "NewsQA_"
# lr = 9E-06
# dropout_prob = 0.2


# In[ ]:


callback = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=3)
np.random.seed(1)
random.seed(1)
tf.random.set_seed(1)
if use_tpu: 
    with strategy.scope():
        model = create_model(lr, dropout_prob)

history = model.fit(
    x_train,
    y4_train,
    validation_data=(x_eval, y4_eval),
    epochs=20, 
    verbose=1,
    batch_size=128,
    callbacks=[callback],
)
model.evaluate(x_test, y4_test, batch_size=128)


# In[ ]:


test_pred = model.predict(x_test, verbose=1)
eval_pred = model.predict(x_eval, verbose=1)


# In[ ]:


# Zip and copy the results

algorithm = "Answer_Pointer_BM_"
file_list = []

def save_to_file(name, data):
    json_string = json.dumps(data.tolist())
    file = algorithm + file_name + name
    file_list.append(file)
    with open(file, "w") as text_file:
        text_file.write(json_string)

save_to_file("test_pred.txt", test_pred)
save_to_file("eval_pred.txt", eval_pred)

save_to_file("y2_eval.txt", y2_eval)
save_to_file("y3_eval.txt", np.array([v.tolist() for v in y3_eval]))
save_to_file("y4_eval.txt", y4_eval)

save_to_file("y2_test.txt", y2_test)
save_to_file("y3_test.txt", np.array([v.tolist() for v in y3_test]))
save_to_file("y4_test.txt", y4_test)



save_to_file("token_type_eval.txt", x_eval[1])
save_to_file("token_type_test.txt", x_test[1])

save_to_file("input_ids_test.txt", x_test[0])


tar = tarfile.open(algorithm + file_name + "predictions.tar.gz", "w:gz")
for name in file_list:
    tar.add(name)
tar.close()

get_ipython().system('mv *predictions.tar.gz /content/drive/MyDrive')


# # Debugging

# In[26]:


model = create_model(5e-05, 0)
i = 4
history = model.fit(
        [x_test[0][0:i],x_test[1][0:i],x_test[2][0:i]],
        y4_test[0:i],
        epochs=20, 
        verbose=1,
        batch_size=4,
)


# In[ ]:




