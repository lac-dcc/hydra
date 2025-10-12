import os
from shutil import copytree
import sys


bench_dir = os.environ.get('BENCH_DIR', '')
results_dir = os.environ.get('RESULTS_DIR', '')

if bench_dir == '':
    print('Input benchmark directory: ')
    bench_dir = input()
if results_dir == '':
    print('Input results directory')
    results_dir = input()


exec_num = '0'

try: exec_num = sys.argv[1]
except: pass

for d in os.listdir(bench_dir):
    if '.c.profiling' in d:
        try:
            function_app = ''
            function_name = ''
            if '.h_' in d:
                b = d.split('.h')
                function_app = b[0][5:]
                function_name = b[1][1:-2]
            else:
                b = d.split('.c')
                function_app = b[0][5:]
                function_name = d.split('.c')[1][1:]
            for aux in os.listdir(bench_dir+'/'+d+'/profiles'):
                if function_name in aux:
                    a_path = results_dir+'/'+function_app+'/'+function_name+'/'+exec_num
                    if not os.path.exists(a_path):
                        os.makedirs(a_path)
                    if function_name in aux:
                        copytree(
                            bench_dir+'/'+d+'/profiles',
                            a_path+'/profiles'
                        )
        except:
            continue
