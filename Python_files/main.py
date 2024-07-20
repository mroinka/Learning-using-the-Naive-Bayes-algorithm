import pandas as pd
from param import find_params
from pdf import pdf_uniform, pdf_binomial, pdf_gaussian
import numpy as np

FILE_PATH = '../data/dogs.csv'

df = pd.read_csv(FILE_PATH)

df_train = df[:int(len(df) * 0.8)]
df_test = df[int(len(df) * 0.8):]

class0 = df_train[df_train['class'] == 0]
class1 = df_train[df_train['class'] == 1]
class2 = df_train[df_train['class'] == 2]

class_list = [class0, class1, class2]
mu_height_0, sigma_height_0 = find_params(class0, 'height')

breed = {}

features = ['height', 'weight', 'bark_days', 'ear_head_ratio']
for index, class_item in enumerate(class_list):
    json = {index: {'height': {'mu': 0,
                                    'sigma': 0},
                         'weight': {'mu': 0,
                                    'sigma': 0},
                         'bark_days': {'n': 0,
                                       'p': 0},
                         'ear_head_ratio': {'a': 0,
                                            'b': 0}
                         }
            }
    for feature in features:
        match feature:
            case 'height':
                mu, sigma = find_params(class_item['height'], 'height')
                json[index]['height']['mu'] = mu
                json[index]['height']['sigma'] = sigma
            case 'weight':
                mu, sigma = find_params(class_item['weight'], 'weight')
                json[index]['weight']['mu'] = mu
                json[index]['weight']['sigma'] = sigma
            case "bark_days":
                n, p = find_params(class_item['bark_days'], 'bark_days')
                json[index]['bark_days']['n'] = n
                json[index]['bark_days']['p'] = p
            case "ear_head_ratio":
                a, b = find_params(class_item['ear_head_ratio'], 'ear_head_ratio')
                json[index]['ear_head_ratio']['a'] = a
                json[index]['ear_head_ratio']['b'] = b
    breed.update(json)


probability = 1.0
print(df.iloc[0])
x = df.iloc[0]
prob_list = []
for index, class_item in enumerate(class_list):
    probability = 1.0
    for feature in features:
        match feature:
            case 'height':
                prob = pdf_gaussian(x['height'], breed[index]['height']['mu'], breed[index]['height']['sigma'])
            case 'weight':
                prob = pdf_gaussian(x['weight'], breed[index]['weight']['mu'], breed[index]['weight']['sigma'])
            case "bark_days":
                prob = pdf_binomial(x['bark_days'], breed[index]['bark_days']['n'], breed[index]['bark_days']['p'])
            case "ear_head_ratio":
                prob = pdf_uniform(x['ear_head_ratio'], breed[index]['ear_head_ratio']['a'], breed[index]['ear_head_ratio']['b'])
        probability *= prob
    prob_list.append(probability)
print(np.argmax(prob_list))

