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
    ['Benchmark Name', 'Function Name', 'Execution', 'Number of vertices', 'Number of edges', 'Min count', 'Max count', 'Block Ordering', 'Random guess', 'Random distance', 'Random hit', 'Predictor guess', 'Predictor distance', 'Predictor hit', 'Profile guess', 'Profile distance', 'Profile hit', 'Benchmark link']
]

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
exp_folder = os.environ.get('EXP_FOLDER', '')

gt_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchResults.json','r'))
random_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchRandomOrdering.json','r'))
predictor_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchPredictorOrdering.json','r'))
profile_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchProfileOrdering.json','r'))

benchmarks = os.listdir(base_dir+'/Benchmark/cBench')

for app_name in gt_data:
    for function_name in gt_data[app_name]:
        random_guess = random_data[app_name][function_name]
        predictor_guess = predictor_data[app_name][function_name]
        profile_guess = profile_data[app_name][function_name]
        benchmark_link = 'https://github.com/lac-dcc/hydra/blob/main/Benchmark/cBench/'+app_name
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
            
            random_guess_indices = []
            for block in random_guess:
                random_guess_indices.append(sorted_block_indices[block])
            random_distance = compute_swap_distance(random_guess_indices)
            random_hit = round(1.0-random_distance/(nodes*(nodes-1.0)/2.0),4)

            predictor_guess_indices = []
            for block in predictor_guess:
                predictor_guess_indices.append(sorted_block_indices[block])
            predictor_distance = compute_swap_distance(predictor_guess_indices)
            predictor_hit = round(1.0-predictor_distance/(nodes*(nodes-1.0)/2.0),4)

            profile_guess_indices = []
            for block in profile_guess:
                profile_guess_indices.append(sorted_block_indices[block])
            profile_distance = compute_swap_distance(profile_guess_indices)
            profile_hit = round(1.0-profile_distance/(nodes*(nodes-1.0)/2.0),4)
            
            block_ordering = ';'.join(block_ordering_list)
            random_ordering = ';'.join(random_guess)
            predictor_ordering = ';'.join(predictor_guess)
            profile_ordering = ';'.join(profile_guess)

            csv_data.append([app_name, function_name, execution_number, nodes, edges, min_count, max_count, str(block_ordering), str(random_ordering), random_distance, f"{random_hit:.4f}".replace('.',','), str(predictor_ordering), predictor_distance, f"{predictor_hit:.4f}".replace('.',','), str(profile_ordering), profile_distance, f"{profile_hit:.4f}".replace('.',','), benchmark_link])

with open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/cBenchTableOrdering.csv', mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)