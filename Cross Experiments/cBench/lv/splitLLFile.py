import os

bench_name = os.environ.get('BENCH_NAME', 'automotive_bitcount')
og_data = open('/tmp/'+bench_name+'/'+bench_name+'.ll','r')
vec_data = open('/tmp/'+bench_name+'/'+bench_name+'_vec.ll','r')

function = []
cur_fun = 0

for i in og_data.readlines():
    if "attributes" == i[:10]:
        break
    if "; Function" == i[:10]:
        if (cur_fun != 0):
            out_file = open('/tmp/'+bench_name+'/original/fun_'+str(cur_fun)+'.ll','w')
            for line in function:
                print(line, file=out_file, end='')
            out_file.close()
        cur_fun += 1
        function = [i]
    else:
        function.append(i)

function = []
cur_fun = 0

for i in vec_data.readlines():
    if "attributes" == i[:10]:
        break
    if "; Function" == i[:10]:
        if (cur_fun != 0):
            out_file = open('/tmp/'+bench_name+'/vectorized/fun_'+str(cur_fun)+'.ll','w')
            for line in function:
                print(line, file=out_file, end='')
            out_file.close()
        cur_fun += 1
        function = [i]
    else:
        function.append(i)