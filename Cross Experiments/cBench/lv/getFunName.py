import os

bench_name = os.environ.get('BENCH_NAME', 'automotive_bitcount')
fun_name = os.environ.get('FUN_NAME', 'fun_1.ll')

data = open('/tmp/'+bench_name+'/original/'+fun_name)
info = data.readlines()[1]
print(bench_name + ' ' + info.split('@')[1].split('(')[0])