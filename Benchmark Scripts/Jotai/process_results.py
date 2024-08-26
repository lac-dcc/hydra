import os
import json
import sys

final = {}

def process_file(file_name):
    global final
    aux = {}
    arq = open(file_name, 'r')
    lines = arq.readlines()
    for line in lines:
        try:
            line = line.split(':')
            c = int(line[1][1:])
            edge = line[0][:-1].split('->')
            u = edge[0][:-1]
            v = edge[1][1:]
            if u in aux:
                if v in aux[u]:
                    aux[u][v] += c
                else:
                    aux[u][v] = c
            else:
                aux[u] = {v: c}
        except:
            continue
    arq.close()
    return aux

results_dir = os.environ.get('RESULTS_DIR', '')
if results_dir == '':
    print('Input results directory')
    results_dir = input()
json_file_name = os.environ.get('JSON_FILE', '')
if json_file_name == '':
    print('Input JSON file path')
    json_file_name = input()

for app_name in os.listdir(results_dir):
    app_folder = results_dir+app_name+'/'
    final[app_name] = {}
    for function_name in os.listdir(app_folder):
        function_folder = app_folder+function_name+'/'
        final[app_name][function_name] = [{}]*len(os.listdir(function_folder))
        for exec_number in os.listdir(function_folder):
            exec_folder = function_folder+exec_number+'/profiles/'
            for file_name in os.listdir(exec_folder):
                if '.prof.full.edges' in file_name and file_name[:-16] == function_name:
                    final[app_name][function_name][int(exec_number)] = process_file(exec_folder+file_name)

arq = open(json_file_name,'w')
json.dump(final, arq)
arq.close()
