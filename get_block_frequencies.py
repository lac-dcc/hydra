import json
import sys

if ('--help' in sys.argv or len(sys.argv) == 1):
    print('USAGE:\n')
    print('--help:\n  Print this output\n')
    print('No args:\n  Print this output\n')
    print('One arg (JSON file):\n  Print block frequencies for the JSON file\n')
    print('Two args (JSON file and application name):\n  Print block frequencies for every function of given application on the JSON file\n')
    print('Three args (JSON file, application name and function name):\n  Print block frequencies for every execution of given application and function on the JSON file\n')
    print('Four args (JSON file, application name, function name and execution number):\n  Print block frequencies for given application, function and execution on the JSON file\n')
    exit(0)

data = {}
with open(sys.argv[1],'r') as f:
    data = json.load(f)

def print_execution(app_name, function_name, exec_number):
    if app_name in data:
        if function_name in data[app_name]:
            graph = {}
            try:
                graph = data[app_name][function_name][exec_number]
            except:
                print('Error: Execution number not found')
            frequencies = {}
            for u in graph:
                for v in graph[u]:
                    if v[0] == '-':
                        continue
                    if v in frequencies:
                        frequencies[v] += graph[u][v]
                    else:
                        frequencies[v] = graph[u][v]
            sorted_frequencies = sorted(frequencies.items(), key=lambda item: int(item[0]))
            blocks = []
            for block, count in sorted_frequencies:
                if block[0] == '-':
                    continue
                blocks.append((block,str(count)))
            print(len(blocks))
            for block, count in blocks:
                print(block + ' : ' + count)
        else:
            print('Error: Function name not found for application ' + app_name)
    else:
        print('Error: Application name not found')

def print_function(app_name, function_name):
    if app_name in data:
        if function_name in data[app_name]:
            num_executions = len(data[app_name][function_name])
            print('_extr'+app_name+'.c_'+function_name+'.c')
            print(num_executions)
            for i in range(0,num_executions):
                print_execution(app_name, function_name, i)
        else:
            print('Error: Function name not found for application ' + app_name)
    else:
        print('Error: Application name not found')

def print_application(app_name):
    if app_name in data:
        for function_name in data[app_name]:
            print_function(app_name, function_name)
    else:
        print('Error: Application name not found')

def print_all():
    for app_name in data:
        print_application(app_name)

if len(sys.argv) == 5:
    print_execution(sys.argv[2], sys.argv[3], int(sys.argv[4]))
elif len(sys.argv) == 4:
    print_function(sys.argv[2], sys.argv[3])
elif len(sys.argv) == 3:
    print_application(sys.argv[2])
else:
    print_all()