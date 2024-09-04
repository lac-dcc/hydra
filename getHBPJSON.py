import json
import os
from collections import OrderedDict

random_dir = 'Results/Jotai/Random'
nested_dir = 'Results/Jotai/Nested'

random_json = {}
nested_json = {}

for d in os.listdir(random_dir):
    aux = random_dir+'/'+d
    app_name = ''
    function_name = ''
    if '.h' in d:
        app_name = d.split('.h')[0][5:]
        function_name = d.split('.h')[1][1:]
    else:
        app_name = d.split('.c')[0][5:]
        function_name = d.split('.c')[1][1:]
    if app_name not in random_json:
        random_json[app_name] = {}
    for f in os.listdir(aux):
        if function_name in f:
            aux2 = aux+'/'+f
            arq = open(aux+'/'+f)
            random_json[app_name][function_name] = arq.readlines()[0][:-1]
            arq.close()

for d in os.listdir(nested_dir):
    aux = nested_dir+'/'+d
    app_name = ''
    function_name = ''
    if '.h' in d:
        app_name = d.split('.h')[0][5:]
        function_name = d.split('.h')[1][1:]
    else:
        app_name = d.split('.c')[0][5:]
        function_name = d.split('.c')[1][1:]
    if app_name not in nested_json:
        nested_json[app_name] = {}
    for f in os.listdir(aux):
        if function_name in f:
            aux2 = aux+'/'+f
            arq = open(aux+'/'+f)
            nested_json[app_name][function_name] = arq.readlines()[0][:-1]
            arq.close()

def sort_json(data):
    if isinstance(data, dict):
        sorted_dict = OrderedDict(sorted((k, sort_json(v)) for k, v in data.items()))
        return sorted_dict
    elif isinstance(data, list):
        return [sort_json(item) for item in data]
    else:
        return data

json_folder = os.environ.get('JSON_FOLDER', '')
if json_folder == '':
    print('Input JSON folder path')
    json_folder = input()

arq = open(json_folder+'/jotaiRandomBlock2.json','w')
json.dump(sort_json(random_json), arq)
arq.close()
arq = open(json_folder+'/jotaiNestedBlock2.json','w')
json.dump(sort_json(nested_json), arq)
arq.close()