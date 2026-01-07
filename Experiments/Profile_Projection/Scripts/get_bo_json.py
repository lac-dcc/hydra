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
        # if type == 'Profile':
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

hash_matching_dir = os.environ.get('RESULTS_FOLDER_HASH_MATCHING', 'Results/cBench/Hash_Matching')
hist_region_dir = os.environ.get('RESULTS_FOLDER_HIST_REGION', 'Results/cBench/Hist_Region')

hash_matching_json = process_results(hash_matching_dir, 'hash-matching')
hist_region_json = process_results(hist_region_dir, 'hist-region')

hash_matching_json_file = os.environ.get('HASH_MATCHING_JSON_FILE')
hist_region_json_file = os.environ.get('HIST_REGION_JSON_FILE')

arq = open(hash_matching_json_file,'w')
json.dump(sort_json(hash_matching_json), arq)
arq.close()

arq = open(hist_region_json_file,'w')
json.dump(sort_json(hist_region_json), arq)
arq.close()