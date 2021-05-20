#
#   Copyright (c) 2021. Mohamed Reda Bouadjenek, Deakin University
#
#             Email:  reda.bouadjenek@deakin.edu.au
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#      You may obtain a copy of the License at:
#
#                   http://www.apache.org/licenses/LICENSE-2.0
#
#      Unless required by applicable law or agreed to in writing, software
#      distributed under the License is distributed on an "AS IS" BASIS,
#      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#      See the License for the specific language governing permissions and
#      limitations under the License.
#
#
import json
import os
import random
import numpy as np
from tokenizers import BertWordPieceTokenizer
from transformers import BertTokenizer
from tensorflow import keras
from tqdm import tqdm

def get_SQuAD1():
    train_data_url = "https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json"
    train_path = keras.utils.get_file("train-v1.1.json", train_data_url)
    with open(train_path) as json_file:
        raw_train_data = json.load(json_file)

    topics = raw_train_data['data']
    random.Random(1).shuffle(topics)

    i = int(len(raw_train_data['data']) * 0.95)
    raw_train_data = {'data': topics[:i]}
    raw_val_data = {'data': topics[i:]}

    test_data_url = "https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json"
    test_path = keras.utils.get_file("dev-v1.1.json", test_data_url)
    with open(test_path) as json_file:
        raw_test_data = json.load(json_file)
    return raw_train_data, raw_val_data, raw_test_data


def get_SQuAD2():
    train_data_url = "https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v2.0.json"
    train_path = keras.utils.get_file("train-v2.0.json", train_data_url)
    with open(train_path) as json_file:
        raw_train_data = json.load(json_file)

    topics = raw_train_data['data']
    random.Random(1).shuffle(topics)

    i = int(len(raw_train_data['data']) * 0.95)
    raw_train_data = {'data': topics[:i]}
    raw_val_data = {'data': topics[i:]}

    test_data_url = "https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v2.0.json"
    test_path = keras.utils.get_file("dev-v2.0.json", test_data_url)
    with open(test_path) as json_file:
        raw_test_data = json.load(json_file)
    return raw_train_data, raw_val_data, raw_test_data


def get_NewsQA():
    train_data_url = "http://206.12.93.90:8080/newsqa-data/newsqa-data-train-v3.json"
    train_path = keras.utils.get_file("newsqa-data-train-v3.json", train_data_url)
    with open(train_path) as json_file:
        raw_train_data = json.load(json_file)

    val_data_url = "http://206.12.93.90:8080/newsqa-data/newsqa-data-dev-v3.json"
    val_path = keras.utils.get_file("newsqa-data-val-v3.json", val_data_url)
    with open(val_path) as json_file:
        raw_val_data = json.load(json_file)

    test_data_url = "http://206.12.93.90:8080/newsqa-data/newsqa-data-test-v3.json"
    test_path = keras.utils.get_file("newsqa-data-test-v3.json", test_data_url)
    with open(test_path) as json_file:
        raw_test_data = json.load(json_file)
    return raw_train_data, raw_val_data, raw_test_data


# raw_train_data, raw_val_data, raw_test_data = get_SQuAD1()
# raw_train_data, raw_val_data, raw_test_data = get_SQuAD2()
raw_train_data, raw_val_data, raw_test_data = get_NewsQA()


def get_stats(raw_data):
    total_paragraphs = 0
    total_questions = 0
    total_topics = 0
    is_impossible = 0
    for item in raw_data["data"]:
        total_topics += 1
        for para in item["paragraphs"]:
            total_paragraphs += 1
            for qa in para["qas"]:
                total_questions += 1
                if 'is_impossible' in qa:
                    if qa['is_impossible']:
                        is_impossible += 1
    print('total_topics: ', total_topics)
    print('total_paragraphs', total_paragraphs)
    print('total_questions:', total_questions)
    print('is_impossible: ', is_impossible)


# print('raw_train_data stats:')
# get_stats(raw_train_data)
# print('raw_val_data stats:')
# get_stats(raw_val_data)
# print('raw_test_data stats:')
# get_stats(raw_test_data)

class SquadExample:
    def __init__(self, id_, question, context, is_impossible, start_char_idx, answer_text, all_answers):
        self.id_ = id_
        self.question = question
        self.context = context
        self.is_impossible = is_impossible
        self.start_char_idx = start_char_idx
        self.answer_text = answer_text
        self.all_answers = all_answers
        self.skip = False

    def preprocess(self, max_len, tokenizer):
        context = self.context
        question = self.question
        answer_text = self.answer_text
        start_char_idx = self.start_char_idx

        # Clean context, answer and question
        context = " ".join(str(context).split())
        question = " ".join(str(question).split())
        answer = " ".join(str(answer_text).split())

        # Find end character index of answer in context
        end_char_idx = start_char_idx + len(answer)
        if end_char_idx >= len(context):
            self.skip = True
            return

        # Mark the character indexes in context that are in answer
        is_char_in_ans = [0] * len(context)
        for idx in range(start_char_idx, end_char_idx):
            is_char_in_ans[idx] = 1

        # Tokenize context (paragraph)
        tokenized_context = tokenizer.encode(context)

        # Find tokens that were created from answer characters
        ans_token_idx = []
        for idx, (start, end) in enumerate(tokenized_context.offsets):
            if sum(is_char_in_ans[start:end]) > 0:
                ans_token_idx.append(idx)

        # Tokenize question
        tokenized_question = tokenizer.encode(question)

        # Extract labels
        labels = np.zeros(len(tokenized_context.ids)).tolist()
        for i in ans_token_idx:
            labels[i] = 1

        labels = np.zeros(len(tokenized_question.ids) - 1).tolist() + labels

        ## padding labels
        if max_len - len(labels) > 0:
            labels = labels + np.zeros(max_len - len(labels)).tolist()

        ## output mask
        output_mask = np.ones(len(tokenized_context.ids) - 1).tolist()
        output_mask = np.zeros(len(tokenized_question.ids)).tolist() + output_mask
        if max_len - len(output_mask) > 0:
            output_mask = output_mask + np.zeros(max_len - len(output_mask)).tolist()

        # Find start and end token index for tokens from answer
        # print(ans_token_idx)

        ans_token_idx = [x + (len(tokenized_question.ids) - 1) for x in ans_token_idx]

        start_token_idx = 0
        end_token_idx = 0
        if self.is_impossible == False:
            # if len(ans_token_idx) == 0:
            # print(self.id_)
            # print('reda')
            start_token_idx = ans_token_idx[0]
            end_token_idx = ans_token_idx[-1]

        # Create inputs
        input_ids = tokenized_question.ids + tokenized_context.ids[1:]
        token_type_ids = [0] * len(tokenized_question.ids[1:]) + [1] * len(tokenized_context.ids)
        attention_mask = [1] * len(input_ids)

        # Pad and create attention masks.
        # Skip if truncation is needed
        padding_length = max_len - len(input_ids)
        if padding_length > 0:  # pad
            input_ids = input_ids + ([0] * padding_length)
            attention_mask = attention_mask + ([0] * padding_length)
            token_type_ids = token_type_ids + ([0] * padding_length)
        elif padding_length < 0:  # truncate
            input_ids = input_ids[0:max_len]
            attention_mask = attention_mask[0:max_len]
            token_type_ids = token_type_ids[0:max_len]
            input_ids = input_ids[0:max_len]
            output_mask = output_mask[0:max_len]
            if end_token_idx >= max_len:
                self.skip = True

        self.input_ids = input_ids
        self.token_type_ids = token_type_ids
        self.attention_mask = attention_mask
        self.start_token_idx = start_token_idx
        self.end_token_idx = end_token_idx
        self.context_token_to_char = tokenized_context.offsets
        self.ans_token_idx = np.asarray(ans_token_idx)
        self.labels = np.asarray(labels)
        self.output_mask = np.asarray(output_mask)


def create_squad_examples(raw_data, max_len, tokenizer, debug=False):
    skipped_questions = 0
    squad_examples = []
    with tqdm(total=len(raw_data["data"])) as pbar:
        for item in raw_data["data"]:
            for para in item["paragraphs"]:
                context = para["context"]
                for qa in para["qas"]:
                    context = para["context"]
                    id_ = qa["id"]
                    # if id_ == 'fab5804b951fefa851fc7320b69dae28':
                    #     print(para)
                    question = qa["question"]
                    all_answers = [_["text"] for _ in qa["answers"]]
                    is_impossible = False
                    if 'is_impossible' in qa:
                        is_impossible = qa['is_impossible']
                    answer_text = ''
                    start_char_idx = -1
                    if is_impossible == False:
                        answer_text = qa["answers"][0]["text"]
                        start_char_idx = qa["answers"][0]["answer_start"]
                        # REDA: fix bug where there is '\n' in the string
                        context = context.replace('\n', ' ')
                        # REDA: fix bug where there is '   ' in string
                        while '  ' in context:
                            i = context.find('  ')
                            context = context.replace('  ', ' ', 1)
                            if start_char_idx > i:
                                start_char_idx -= 1

                    squad_eg = SquadExample(id_, question, context, is_impossible, start_char_idx, answer_text,
                                            all_answers)
                    squad_eg.preprocess(max_len, tokenizer)
                    ## Skip questions for which the answer couldn't be correctly extracted.
                    if squad_eg.skip == False:
                        ans = squad_eg.input_ids[squad_eg.start_token_idx:squad_eg.end_token_idx + 1]
                        if is_impossible is False:
                            true_ans = tokenizer.encode(qa["answers"][0]["text"]).ids[1:-1]
                            if true_ans != ans:
                                squad_eg.skip = True
                                skipped_questions += 1
                            else:
                                if debug:
                                    context = para["context"]
                                    question = qa["question"]
                                    answers = qa["answers"][0]["text"]
                                    answer_start = qa["answers"][0]["answer_start"]
                                    print()
                                    print('=' * 30)
                                    print(answers)
                                    print(context[answer_start:answer_start + len(answers)])
                                    print(tokenizer.decode(ans, skip_special_tokens=True))
                                    print('=' * 30)
                            if np.sum(squad_eg.labels[
                                      squad_eg.start_token_idx:squad_eg.end_token_idx + 1]) != squad_eg.end_token_idx + 1 - squad_eg.start_token_idx:
                                print('error!')
                        else:
                            if ans != [101]:
                                skipped_questions += 1
                                squad_eg.skip = True
                            if np.sum(squad_eg.labels) != 0:
                                print('error!')
                    squad_examples.append(squad_eg)
            pbar.update(1)
    return squad_examples, skipped_questions


def create_inputs_targets(squad_examples):
    dataset_dict = {
        "input_ids": [],
        "token_type_ids": [],
        "attention_mask": [],
        "start_token_idx": [],
        "end_token_idx": [],
        "ans_token_idx": [],
        "labels": [],
        "output_mask": [],
    }
    skipped = 0
    for item in squad_examples:

        if not item.skip:
            for key in dataset_dict:
                # print(key,type(getattr(item, key)))
                dataset_dict[key].append(getattr(item, key))
        else:
            skipped += 1
    for key in dataset_dict:
        if key != 'labels' and key != 'ans_token_idx':
            dataset_dict[key] = np.array(dataset_dict[key])
    x = [
        dataset_dict["input_ids"],
        dataset_dict["token_type_ids"],
        dataset_dict["attention_mask"],
        # dataset_dict["output_mask"],
    ]
    y1 = [dataset_dict["start_token_idx"], dataset_dict["end_token_idx"]]
    # y1 = dataset_dict["start_token_idx"]
    y2 = np.asarray(dataset_dict["labels"])
    y3 = np.asarray(dataset_dict["ans_token_idx"])
    return x, y1, y2, y3, skipped


# max_len = 300
#
# save_path = os.path.expanduser("~") + "/.bert_base_uncased/"
# if not os.path.exists(save_path):
#     slow_tokenizer = BertTokenizer.from_pretrained("bert-base-uncased")
#     os.makedirs(save_path)
#     slow_tokenizer.save_pretrained(save_path)
# tokenizer = BertWordPieceTokenizer(save_path + "vocab.txt", lowercase=True)
#
# train_squad_examples, train_skipped_questions = create_squad_examples(raw_train_data, max_len, tokenizer, False)
# x_train, y1_train, y2_train, y3_train, train_total_skipped_questions = create_inputs_targets(train_squad_examples)
# print('Size: ', len(y1_train[0]))
# print('skipped_questions: ', train_skipped_questions)
# print('skipped_questions: ', train_total_skipped_questions)
#
# eval_squad_examples, val_skipped_questions = create_squad_examples(raw_val_data, max_len, tokenizer)
# x_eval, y1_eval, y2_eval, y3_eval, val_total_skipped_questions = create_inputs_targets(eval_squad_examples)
# print('Size: ', len(y1_eval[0]))
# print('skipped_questions: ', val_skipped_questions)
# print('skipped_questions: ', val_total_skipped_questions)
#
# test_squad_examples, test_skipped_questions = create_squad_examples(raw_test_data, max_len, tokenizer)
# x_test, y1_test, y2_test, y3_test, test_total_skipped_questions = create_inputs_targets(test_squad_examples)
# print('Size: ', len(y1_test[0]))
# print('skipped_questions: ', test_skipped_questions)
# print('skipped_questions: ', test_total_skipped_questions)
