import json
import csv
import os

csv_data = [
    ['File Name', 'Execution', 'Number of vertices', 'Number of edges', 'Min count', 'Max count', 'Hottest blocks', 'Random hottest guess', 'Random hit', 'Nested hottest guess', 'Nested hit', 'Predictor guess', 'Predictor hit', 'Benchmark link']
]

gt_data = json.load(open('JSON Files/jotaiMerlinResults.json','r'))
random_data = json.load(open('JSON Files/jotaiRandomBlock.json','r'))
nested_data = json.load(open('JSON Files/jotaiNestedBlock.json','r'))
predictor_data = json.load(open('JSON Files/jotaiPredictorBlock.json','r'))

benchmarks = os.listdir('Benchmark/Jotai')

for app_name in gt_data:
    for function_name in gt_data[app_name]:
        file_name = 'extr_'+app_name+'.c_'+function_name+'.c'
        if file_name not in benchmarks:
            file_name = 'extr_'+app_name+'.h_'+function_name+'.c'
        random_guess = random_data[app_name][function_name]
        nested_guess = nested_data[app_name][function_name]
        predictor_guess = predictor_data[app_name][function_name]
        benchmark_link = 'https://github.com/lac-dcc/hydra/blob/main/Benchmark/Jotai/'+file_name
        for execution_number in range(0,len(gt_data[app_name][function_name])):
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
            min_count = sorted_frequencies[-1][1]
            hottest_blocks_list = []
            for block, count in sorted_frequencies:
                if count < max_count:
                    break
                hottest_blocks_list.append(block)
            hottest_blocks = ';'.join(sorted(hottest_blocks_list, key=lambda x: int(x)))
            random_hit = 0
            if frequencies[random_guess] == max_count:
                random_hit = 1
            nested_hit = 0
            if frequencies[nested_guess] == max_count:
                nested_hit = 1
            predictor_hit = 0
            if frequencies[predictor_guess] == max_count:
                predictor_hit = 1
            csv_data.append([file_name, execution_number, nodes, edges, min_count, max_count, str(hottest_blocks), random_guess, random_hit, nested_guess, nested_hit, predictor_guess, predictor_hit, benchmark_link])

with open('jotaiMerlinTable.csv', mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)