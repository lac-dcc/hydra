import os
from shutil import copyfile
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
    if '.profiling' in d:
        try:
            bench_name = d[:-10]
            for f in os.listdir(bench_dir+'/'+d+'/profiles'):
                function_name = ''
                if '.prof.full.bb' in f:
                    function_name = f[:-13]
                elif '.prof.full.edges' in f:
                    function_name = f[:-16]
                else:
                    continue
                a_path = results_dir+'/'+bench_name+'/'+function_name+'/'+exec_num+'/profiles'
                if not os.path.exists(a_path):
                    os.makedirs(a_path)
                
                copyfile(
                    bench_dir+'/'+d+'/profiles/'+f,
                    a_path+'/'+f
                )
        except:
            continue