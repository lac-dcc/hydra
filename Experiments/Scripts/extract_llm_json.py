import os
import json

def removebb(s):
    if (len(s) == 2): return '0'
    else: return s[2:]

def extract_and_format_digits(s):
    # s = s.replace('`','')
    a = s.split('.')
    if (len(a) == 1): return removebb(s)
    bb1 = removebb(a[0])
    a = '.'.join(a[1:]) 
    if (a == 'loopexit'): return bb1+'.le'
    elif (a == 'preheader'): return bb1+'.ph'
    pos = a.find('_')
    bb2 = removebb(a[0:pos])
    if pos == -1: bb2 = removebb(a)
    args = a[pos+1:]
    if (args == 'crit_edge'):
        return bb1+'_'+bb2+'.ce'
    else:
        return bb1+'_'+bb2+'.'+args

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
exps = ['o1', 'o2', 'o3']

for exp_folder in exps:
    try:
        os.chdir(base_dir+'/Experiments/Profile_Projection/LLM_Reports/'+src_opt+'_profile/'+dst_opt)
        BO = {}
        for i in os.listdir('.'):
            try:
                blocks_file = open(base_dir+'/block_names.txt', 'r')
                block_names = {}
                for j in blocks_file.readlines():
                    s = j.replace('\n','').split(';')
                    block_names[s[0]] = s[1]
                blocks_file.close()
                blocks_file = open(base_dir+'/block_names.txt', 'a')
                dt = json.load(open(i,'r'))
                # HB[i[:-5]] = {}
                BO[i[:-19]] = {}
                for f in dt:
                    f_name = f['benchmarkInfo']['funcName']
                    bo = []
                    for block in f['bbOrderByHotness']:
                        bo_full_name = block['name']
                        bo_name = extract_and_format_digits(bo_full_name)
                        bo.append(bo_name)
                        if bo_full_name not in block_names:
                            block_names[bo_full_name] = bo_name
                            print(bo_full_name + ';' + bo_name, file=blocks_file)
                        
                    # HB[i[:-5]][f_name] = hb
                    BO[i[:-19]][f_name] = bo
                blocks_file.close()
            except:
                # continue
                print(i)
        json.dump(BO, open(base_dir+'/Experiments/Profile_Projection/JSON_Files/Beetle/'+dst_opt+'/'+src_opt+'.json','w'))
    except:
        print('No Beetle results in this experiment')
