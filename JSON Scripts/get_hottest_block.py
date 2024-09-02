import json
import sys

if ('--help' in sys.argv or len(sys.argv) == 1):
    print('USAGE:\n')
    print('--help:\n  Print this output\n')
    print('No args:\n  Print this output\n')
    print('One arg (JSON file):\n  Print hottest blocks for the JSON file\n')
    print('Two args (JSON file and application name):\n  Print hottest blocks for every function of given application on the JSON file\n')
    print('Three args (JSON file, application name and function name):\n  Print hottest blocks for every execution of given application and function on the JSON file\n')
    print('Four args (JSON file, application name, function name and execution number):\n  Print hottest blocks for given application, function and execution on the JSON file\n')
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
            executions = {}
            for u in graph:
                for v in graph[u]:
                    if v in executions:
                        executions[v] += graph[u][v]
                    else:
                        executions[v] = graph[u][v]
            sorted_executions = sorted(executions.items(), key=lambda item: item[1])[::-1]
            max_count = sorted_executions[0][1]
            hottest_blocks = [sorted_executions[0][0]]
            for block, count in sorted_executions:
                if block == sorted_executions[0][0]:
                    continue
                if count < max_count:
                    break
                hottest_blocks.append(block)
            print(len(hottest_blocks))
            for block in hottest_blocks:
                print(block)
        else:
            print('Error: Function name not found for application ' + app_name)
    else:
        print('Error: Application name not found')

def print_function(app_name, function_name):
    if app_name in data:
        if function_name in data[app_name]:
            num_executions = len(data[app_name][function_name])
            print('extr_'+app_name+'.c_'+function_name+'.c')
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

