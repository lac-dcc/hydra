import json
import os
from collections import OrderedDict

def process_results(path, type):
    json_data = {}
    for d in os.listdir(path):
        aux = path+'/'+d
        bench_name = d
        json_data[bench_name] = {}
        for f in os.listdir(aux):
            function_name = f[:-(len(type)+5)]
            arq = open(aux+'/'+f)
            json_data[bench_name][function_name] = arq.readlines()[0][:-1]
            arq.close()
    return json_data

def sort_json(data):
    if isinstance(data, dict):
        sorted_dict = OrderedDict(sorted((k, sort_json(v)) for k, v in data.items()))
        return sorted_dict
    elif isinstance(data, list):
        return [sort_json(item) for item in data]
    else:
        return data

random_dir = os.environ.get('RESULTS_FOLDER_RANDOM', 'Results/cBench/Random')
nested_dir = os.environ.get('RESULTS_FOLDER_NESTED', 'Results/cBench/Nested')
predictor_dir = os.environ.get('RESULTS_FOLDER_PREDICTOR', 'Results/cBench/Predictor')
profile_dir = os.environ.get('RESULTS_FOLDER_PROFILE', 'Results/cBench/Profile')

random_json = process_results(random_dir, 'random')
nested_json = process_results(nested_dir, 'nested')
predictor_json = process_results(predictor_dir, 'predictor')
profile_json = process_results(profile_dir, 'profile')

json_folder = os.environ.get('JSON_FOLDER', '')
if json_folder == '':
    print('Input JSON folder path')
    json_folder = input()

arq = open(json_folder+'/cBenchRandomBlock.json','w')
json.dump(sort_json(random_json), arq)
arq.close()
arq = open(json_folder+'/cBenchNestedBlock.json','w')
json.dump(sort_json(nested_json), arq)
arq.close()
arq = open(json_folder+'/cBenchPredictorBlock.json','w')
json.dump(sort_json(predictor_json), arq)
arq.close()
arq = open(json_folder+'/cBenchProfileBlock.json','w')
json.dump(sort_json(profile_json), arq)
arq.close()