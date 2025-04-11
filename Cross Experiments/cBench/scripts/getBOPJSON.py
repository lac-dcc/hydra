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
            if 'execution_time' in f:
                continue
            function_name = f[:-(len(type)+5)]
            arq1 = open(aux+'/'+f,'r')
            json_data[bench_name][function_name] = []
            try:
                for line in arq1.readlines():
                    if 'No profile' in line:
                        continue
                    json_data[bench_name][function_name].append(line[:-1])
            except:
                pass
            arq1.close()
        if type == 'Profile':
            arq = open(aux+'/full_execution_time.txt','r')
            json_data[bench_name]['full_execution_time'] = float(arq.readlines()[0])
            arq.close()
        arq = open(aux+'/execution_time.txt','r')
        json_data[bench_name]['execution_time'] = float(arq.readlines()[0])
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
predictor_dir = os.environ.get('RESULTS_FOLDER_PREDICTOR', 'Results/cBench/Predictor')
profile_dir = os.environ.get('RESULTS_FOLDER_PROFILE', 'Results/cBench/Profile')

random_json = process_results(random_dir, 'Random')
predictor_json = process_results(predictor_dir, 'Predictor')
profile_json = process_results(profile_dir, 'Profile')

json_folder = os.environ.get('JSON_FOLDER', '')
if json_folder == '':
    print('Input JSON folder path')
    json_folder = input()

arq = open(json_folder+'/cBenchRandomOrdering.json','w')
json.dump(sort_json(random_json), arq)
arq.close()
arq = open(json_folder+'/cBenchPredictorOrdering.json','w')
json.dump(sort_json(predictor_json), arq)
arq.close()
arq = open(json_folder+'/cBenchProfileOrdering.json','w')
json.dump(sort_json(profile_json), arq)
arq.close()