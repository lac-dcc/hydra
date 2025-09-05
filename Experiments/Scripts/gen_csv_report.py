import json
import csv
import os

def compute_swap_distance(idx_array):
    res = 0
    for i in range(0, len(idx_array)):
        for j in range(i+1, len(idx_array)):
            if idx_array[j] < idx_array[i]:
                res += 1
    return res

csv_data = [
    ['Benchmark Name', 'Function Name', 'Execution', 'Number of vertices', 'Number of edges', 'Min count', 'Max count', 'Block Ordering', 'Guess', 'Distance', 'Hit']
]

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
gt_json = os.environ.get('GT_JSON_FILE', '')
h_json = os.environ.get('H_JSON_FILE', '')
csv_file = os.environ.get('CSV_FILE', '')

gt_data = json.load(open(gt_json,'r'))
h_data = json.load(open(h_json,'r'))

block_names_file = open(base_dir+'/block_names.txt','r')
block_names_data = {}
block_size = {}
for i in block_names_file.readlines():
    s = i.replace('\n','').split(';')
    block_names_data[s[1]] = s[0]
block_names_file.close()

print('Generating CSV File for ' + h_json)

for app_name in gt_data:
    for function_name in gt_data[app_name]:
        try:
            guess = h_data[app_name][function_name]
        except:
            nodes = 0
            for execution_number in range(1,len(gt_data[app_name][function_name])):
                graph = gt_data[app_name][function_name][execution_number]
                frequencies = {}
                nodes = set()
                edges = 0
                for u in graph:
                    nodes.add(u)
                    for v in graph[u]:
                        edges += 1
                        nodes.add(v)
                        if v in frequencies:
                            frequencies[v] += graph[u][v]
                        else:
                            frequencies[v] = graph[u][v]
                nodes = len(nodes)
                break
            print(app_name + '/' + function_name  + ' (' + str(nodes) + ' basic blocks) not found')
            continue
        worked = True
        for execution_number in range(1,len(gt_data[app_name][function_name])):
            graph = gt_data[app_name][function_name][execution_number]
            frequencies = {}
            nodes = set()
            edges = 0
            for u in graph:
                nodes.add(u)
                for v in graph[u]:
                    edges += 1
                    nodes.add(v)
                    if v in frequencies:
                        frequencies[v] += graph[u][v]
                    else:
                        frequencies[v] = graph[u][v]
            nodes = len(nodes)
            sorted_frequencies = sorted(frequencies.items(), key=lambda item: (-item[1], item[0]))

            max_count = sorted_frequencies[0][1]
            min_count = sorted_frequencies[-1][1]

            sorted_block_indices = {}
            idx = 0
            block_ordering_list = []
            for block, freq in sorted_frequencies:
                block_ordering_list.append(block)
                sorted_block_indices[block] = idx
                idx += 1
            
            indices = []
            made_up_blocks = []
            for block in guess:
                try:
                    indices.append(sorted_block_indices[block])
                except:
                    made_up_blocks.append(block_names_data[block])
                    continue
            distance = compute_swap_distance(indices)
            hit = round(1.0-distance/(nodes*(nodes-1.0)/2.0),4)
                
            
            block_ordering = ';'.join(block_ordering_list)
            ordering = ';'.join(guess)
            missing_blocks = []
            # if len(ordering) != len(block_ordering):
            for block in block_ordering.split(';'):
                if block not in ordering.split(';'):
                    missing_blocks.append(block_names_data[block])
            if len(missing_blocks) > 0 or len(made_up_blocks) > 0:
                if worked:
                    print('Error at: ' + app_name + '/' + function_name + '(' + str(nodes) + ' basic blocks)')
                    if len(missing_blocks) > 0:
                        print('Missing blocks: ' + ','.join(missing_blocks))
                    if len(made_up_blocks) > 0:
                        print('Made up blocks ' + ','.join(made_up_blocks))
                    print('\n\n',end='')
                worked = False
                continue
            if max_count <= 0 or min_count < 0:
                continue
            csv_data.append([app_name, function_name, execution_number, nodes, edges, min_count, max_count, str(block_ordering), str(ordering), distance, f"{hit:.4f}".replace('.',',')])

with open(csv_file, mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)
