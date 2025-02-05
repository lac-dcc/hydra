import json
import os
from collections import OrderedDict

base_dir = os.environ.get('BASE_DIR', '')
random_dir = base_dir+'/Results/cBench/Random'
# nested_dir = base_dir+'/Results/cBench/Nested'
predictor_dir = base_dir+'/Results/cBench/Predictor'

def get_info(path, type):
    json_data = {}
    for d in os.listdir(path):
        aux = path+'/'+d
        bench_name = d
        json_data[bench_name] = {}
        for f in os.listdir(aux):
            function_name = f[:-(len(type)+5)]
            arq = open(aux+'/'+f)
            json_data[bench_name][function_name] = []
            try:
                for line in arq.readlines():
                    json_data[bench_name][function_name].append(line[:-1])
            except:
                pass
            arq.close()
    return json_data

random_json = get_info(random_dir, 'random')
# nested_json = get_info(nested_dir, 'nested')
predictor_json = get_info(predictor_dir, 'predictor')

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

arq = open(json_folder+'/cBenchRandomOrdering.json','w')
json.dump(sort_json(random_json), arq)
arq.close()
# arq = open(json_folder+'/cBenchNestedBlock.json','w')
# json.dump(sort_json(nested_json), arq)
# arq.close()
arq = open(json_folder+'/cBenchPredictorOrdering.json','w')
json.dump(sort_json(predictor_json), arq)
arq.close()