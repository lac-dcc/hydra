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
    ['Benchmark name', 'Function name', 'Execution', 'Number of vertices', 'Number of edges', 'Min count', 'Max count', 'Random distance', 'Predictor distance']
]

json_folder = os.environ.get('JSON_FOLDER', '')
if json_folder == '':
    print('Input JSON folder path')
    json_folder = input()

gt_data = json.load(open(json_folder+'/cBenchResults.json','r'))
random_data = json.load(open(json_folder+'/cBenchRandomOrdering.json','r'))
predictor_data = json.load(open(json_folder+'/cBenchPredictorOrdering.json','r'))

# benchmarks = os.listdir('Benchmark/cBench')

for app_name in gt_data:
    for function_name in gt_data[app_name]:
        random_guess = random_data[app_name][function_name]
        predictor_guess = predictor_data[app_name][function_name]
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
            if max_count == 0: continue

            sorted_frequencies = sorted(frequencies.items(), key=lambda item: (-item[1], item[0]))
            sorted_block_indices = {}
            idx = 0
            # block_ordering_list = []
            for block, freq in sorted_frequencies:
                # block_ordering_list.append(block)
                sorted_block_indices[block] = idx
                idx += 1
            
            random_guess_indices = []
            for block in random_guess:
                random_guess_indices.append(sorted_block_indices[block])
            random_distance = compute_swap_distance(random_guess_indices)

            predictor_guess_indices = []
            for block in predictor_guess:
                predictor_guess_indices.append(sorted_block_indices[block])
            predictor_distance = compute_swap_distance(predictor_guess_indices)

            # block_ordering = ';'.join(block_ordering_list)
            # random_ordering = ';'.join(random_guess)
            # predictor_ordering = ';'.join(predictor_guess)
            
            csv_data.append([app_name, function_name, execution_number, nodes, edges, min_count, max_count, random_distance, predictor_distance])

with open('cBenchTableOrdering.csv', mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)