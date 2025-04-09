import os
import csv

def process_results(lines, start):
    idx = start
    ret = {}
    for bench in benchmarks:
        if bench not in lines[idx]:
            return {}
        time = float(lines[idx].split(':')[1].split('|')[0][1:-3])
        ret[bench] = f"{time:.3f}".replace('.',',')
        idx += 1
    return ret

def process_results_with_nisse(lines, start):
    idx = start
    ret = {}
    for bench in benchmarks:
        if bench not in lines[idx]:
            return {}
        time = float(lines[idx].split(':')[2][1:-3])
        ret[bench] = f"{time:.3f}".replace('.',',')
        idx += 1
    return ret

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
exp_folder = os.environ.get('EXP_FOLDER', 'empty')
time_file = base_dir+'/Cross Experiments/cBench/'+exp_folder+'/time.log'

benchmarks = ['automotive_bitcount', 'automotive_qsort1', 'automotive_susan_c', 'automotive_susan_e', 'automotive_susan_s', 'bzip2d', 'bzip2e', 'network_dijkstra', 'network_patricia', 'office_stringsearch1', 'security_blowfish_d', 'security_blowfish_e', 'security_rijndael_d', 'security_sha', 'telecom_CRC32', 'telecom_adpcm_c', 'telecom_adpcm_d']

csv_data = [
    ['Benchmark name', 'Random', 'Nested', 'Predictor', 'Profile', 'Profile+Nisse', 'Random', 'Predictor', 'Profile', 'Profile+Nisse']
]

fl = open(time_file,'r')
lines = fl.readlines()

results = [
    process_results(lines, 1),              # Random hot block
    process_results(lines, 41),             # Nested hot block
    process_results(lines, 61),             # Predictor hot block
    process_results(lines, 101),            # Profile hot block
    process_results_with_nisse(lines, 101), # Profile hot block + Nisse
    process_results(lines, 21),             # Random block ordering
    process_results(lines, 81),             # Predictor block ordering
    process_results(lines, 121),            # Profile block ordering
    process_results_with_nisse(lines, 121)  # Profile block ordering + Nisse
]

for bench in benchmarks:
    try:
        csv_line = [bench]
        for i in range(0,9):
            csv_line.append(results[i][bench])
        csv_data.append(csv_line)
    except:
        'Error processing times'
    
with open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/timeTable.csv', mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)