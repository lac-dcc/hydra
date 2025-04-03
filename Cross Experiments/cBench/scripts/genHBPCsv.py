import json
import csv
import os

csv_data = [
    ['Benchmark Name', 'Function Name', 'Execution', 'Number of vertices', 'Number of edges', 'Min count', 'Max count', 'Hottest blocks', 'Random hottest guess', 'Random hit', 'Nested hottest guess', 'Nested hit', 'Predictor guess', 'Predictor hit', 'Profile guess', 'Profile hit', 'Benchmark link']
]

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
exp_folder = os.environ.get('EXP_FOLDER', '')

gt_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchResults.json','r'))
random_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchRandomBlock.json','r'))
nested_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchNestedBlock.json','r'))
predictor_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchPredictorBlock.json','r'))
profile_data = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchProfileBlock.json','r'))

benchmarks = os.listdir(base_dir+'/Benchmark/cBench')

for app_name in gt_data:
    for function_name in gt_data[app_name]:
        random_guess = random_data[app_name][function_name]
        nested_guess = nested_data[app_name][function_name]
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
            sorted_frequencies = sorted(frequencies.items(), key=lambda item: item[1])[::-1]
            max_count = sorted_frequencies[0][1]
            if max_count <= 0:
                continue
            min_count = sorted_frequencies[-1][1]
            if min_count < 0:
                continue
            hottest_blocks_list = []
            for block, count in sorted_frequencies:
                if count < max_count:
                    break
                hottest_blocks_list.append(block)
            hottest_blocks = ';'.join(sorted(hottest_blocks_list))
            random_hit = 0
            if frequencies[random_guess] == max_count:
                random_hit = 1
            nested_hit = 0
            try:
                if frequencies[nested_guess] == max_count:
                    nested_hit = 1
            except:
                print(nested_guess, function_name)
                exit(0)
            predictor_hit = 0
            if frequencies[predictor_guess] == max_count:
                predictor_hit = 1
            profile_hit = 0
            if frequencies[profile_guess] == max_count:
                profile_hit = 1
            csv_data.append([app_name, function_name, execution_number, nodes, edges, min_count, max_count, str(hottest_blocks), random_guess, random_hit, nested_guess, nested_hit, predictor_guess, predictor_hit, profile_guess, profile_hit, benchmark_link])

with open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/cBenchTable.csv', mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)