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
    ['Benchmark Name', 'Function Name', 'Execution', 'Number of vertices', 'Number of edges', 'Min count', 'Max count', 'Block Ordering', 'Upper Bound Guess', 'Upper Bound Distance', 'Upper Bound Hit', 'Hydra Guess', 'Hydra Distance', 'Hydra Hit']
]

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
gt_json = os.environ.get('GT_JSON_FILE', '')
ub_json = os.environ.get('UB_JSON_FILE', '')
h_json = os.environ.get('H_JSON_FILE', '')
csv_file = os.environ.get('CSV_FILE', '')

gt_data = json.load(open(gt_json,'r'))
ub_data = json.load(open(ub_json, 'r'))
h_data = json.load(open(h_json,'r'))

print('Generating CSV File for ' + h_json)

for app_name in gt_data:
    for function_name in gt_data[app_name]:
        ub_guess = ub_data[app_name][function_name]
        h_guess = h_data[app_name][function_name]
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

            if max_count <= 0 or min_count < 0:
                continue

            sorted_block_indices = {}
            idx = 0
            block_ordering_list = []
            for block, freq in sorted_frequencies:
                block_ordering_list.append(block)
                sorted_block_indices[block] = idx
                idx += 1
            
            worked = True
            ub_indices = []
            for block in ub_guess:
                try:
                    ub_indices.append(sorted_block_indices[block])
                except:
                    print(app_name + '/' + function_name)
                    worked = False
            ub_distance = compute_swap_distance(ub_indices)
            ub_hit = round(1.0-ub_distance/(nodes*(nodes-1.0)/2.0),4)

            h_indices = []
            for block in h_guess:
                try:
                    h_indices.append(sorted_block_indices[block])
                except:
                    print(app_name + '/' + function_name)
                    worked = False
            h_distance = compute_swap_distance(h_indices)
            h_hit = round(1.0-h_distance/(nodes*(nodes-1.0)/2.0),4)

            if not worked:
                break
                
            
            block_ordering = ';'.join(block_ordering_list)
            ub_ordering = ';'.join(ub_guess)
            h_ordering = ';'.join(h_guess)
            if len(h_ordering) != len(block_ordering) or len(ub_ordering) != len(block_ordering):
                continue
            csv_data.append([app_name, function_name, execution_number, nodes, edges, min_count, max_count, str(block_ordering), str(ub_ordering), ub_distance, f"{ub_hit:.4f}".replace('.',','), str(h_ordering), h_distance, f"{h_hit:.4f}".replace('.',',')])

with open(csv_file, mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)
