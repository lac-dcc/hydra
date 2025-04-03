functions = []

functions_data = open('functions_diff.txt','r').readlines()
hot_block_data = open('cBenchTable.csv','r').readlines()
block_ordering_data = open('cBenchTableOrdering.csv','r').readlines()


for bench_function in functions_data:
    bench_name = bench_function.split()[0]
    function_name = bench_function.split()[1]
    functions.append((bench_name,function_name))

filtered_hb = open('cBenchTableFiltered.csv','w')
print(hot_block_data[0],file=filtered_hb,end='')

for line in hot_block_data[1:]:
    bench_name = line.split(';')[0]
    function_name = line.split(';')[1]
    if (bench_name,function_name) in functions:
        print(line,file=filtered_hb,end='')

filtered_hb.close()

filtered_bo = open('cBenchTableOrderingFiltered.csv','w')
print(block_ordering_data[0],file=filtered_bo,end='')
for line in block_ordering_data[1:]:
    bench_name = line.split(';')[0]
    function_name = line.split(';')[1]
    if (bench_name,function_name) in functions:
        print(line,file=filtered_bo,end='')

filtered_bo.close()