import os
import json

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
exp_folder = os.environ.get('EXP_FOLDER', '')

def get_elapsed_time(data):
    elapsed_time = {}
    total_elapsed_time = 0.0
    for benchmark in data:
        ms_time = round(float(data[benchmark]['execution_time'])*1000.0,3)
        elapsed_time[benchmark] = ms_time
        total_elapsed_time = round(total_elapsed_time+ms_time,3)
        print(benchmark + ': ' + str(ms_time) + 'ms')
    print('Total time: ' + str(total_elapsed_time) + 'ms')
    return elapsed_time

def get_elapsed_time_profile(data):
    elapsed_time = ({}, {})
    total_elapsed_time = 0.0
    full_elapsed_time = 0.0
    for benchmark in data:
        ms_time = round(float(data[benchmark]['execution_time'])*1000.0,3)
        elapsed_time[0][benchmark] = ms_time
        total_elapsed_time = round(total_elapsed_time+ms_time,3)

        full_ms_time = round(float(data[benchmark]['full_execution_time'])*1000.0,3)
        elapsed_time[1][benchmark] = full_ms_time
        full_elapsed_time = round(full_elapsed_time+full_ms_time,3)

        print(benchmark + ': ' + str(ms_time) + 'ms | With Nisse: ' + str(full_ms_time) + 'ms')
    print('Total time: ' + str(total_elapsed_time) + 'ms | With Nisse: ' + str(full_elapsed_time) + 'ms')
    return elapsed_time

random_data_hot_block = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchRandomBlock.json','r'))
random_data_block_ordering = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchRandomOrdering.json','r'))
nested_data_hot_block = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchNestedBlock.json','r'))
predictor_data_hot_block = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchPredictorBlock.json','r'))
predictor_data_block_ordering = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchPredictorOrdering.json','r'))
profile_data_hot_block = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchProfileBlock.json','r'))
profile_data_block_ordering = json.load(open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchProfileOrdering.json','r'))

print('Random hot block:')
get_elapsed_time(random_data_hot_block)
print()

print('Random block ordering:')
get_elapsed_time(random_data_block_ordering)
print()

print('Nested hot block:')
get_elapsed_time(nested_data_hot_block)
print()

print('Predictor hot block:')
get_elapsed_time(predictor_data_hot_block)
print()

print('Predictor block ordering:')
get_elapsed_time(predictor_data_block_ordering)
print()

print('Profile projection hot block:')
get_elapsed_time_profile(profile_data_hot_block)
print()

print('Profile projection block ordering:')
get_elapsed_time_profile(profile_data_block_ordering)

# random_block_ordering_time = {}
# predictor_block_ordering_time = {}
# profile_block_ordering_time = ({}, {})

# total_random_time = 0.0
# total_predictor_time = 0.0
# total_profile_time = 0.0
# total_full_profile_time = 0.0

# for benchmark in random_data:
#     elapsed_time = round(float(random_data[benchmark]['execution_time'])*1000.0,3)
#     random_block_ordering_time[benchmark] = elapsed_time
#     total_random_time = round(total_random_time+elapsed_time,3)
# for benchmark in predictor_data:
#     elapsed_time = round(float(predictor_data[benchmark]['execution_time'])*1000.0,3)
#     predictor_block_ordering_time[benchmark] = elapsed_time
#     total_predictor_time = round(total_predictor_time+elapsed_time,3)
# for benchmark in profile_data:
#     elapsed_time = round(float(profile_data[benchmark]['execution_time'])*1000.0,3)
#     profile_block_ordering_time[0][benchmark] = elapsed_time
#     total_profile_time = round(total_profile_time+elapsed_time,3)
#     elapsed_time = round(float(profile_data[benchmark]['full_execution_time'])*1000.0,3)
#     profile_block_ordering_time[1][benchmark] = elapsed_time
#     total_full_profile_time = round(total_full_profile_time+elapsed_time,3)

# print('Random block ordering: ')
# for benchmark in random_block_ordering_time:
#     print(benchmark + ': ' + str(random_block_ordering_time[benchmark]) + 'ms')
# print('Total time: ' + str(total_random_time) + 'ms')
# print()

# print('Predictor block ordering: ')
# for benchmark in predictor_block_ordering_time:
#     print(benchmark + ': ' + str(predictor_block_ordering_time[benchmark]) + 'ms')
# print('Total time: ' + str(total_predictor_time) + 'ms')
# print()

# print('Profile projection block ordering: ')
# for benchmark in profile_block_ordering_time[0]:
#     print(benchmark + ': ' + str(profile_block_ordering_time[0][benchmark]) + 'ms | With Nisse: '
#     + str(profile_block_ordering_time[1][benchmark]) + 'ms')
# print('Total time: ' + str(total_profile_time) + 'ms | With Nisse: '
# + str(total_full_profile_time) + 'ms')

