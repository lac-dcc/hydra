import os
import json

def removebb(s):
    if (len(s) == 2): return '0'
    else: return s[2:]

def extract_and_format_digits(s):
    a = s.split('.')
    if (len(a) == 1): return removebb(s)
    bb1 = removebb(a[0])
    a = '.'.join(a[1:]) 
    if (a == 'loopexit'): return bb1+'.le'
    pos = a.find('_')
    bb2 = removebb(a[0:pos])
    if pos == -1: bb2 = removebb(a)
    args = a[pos+1:]
    if (args == 'crit_edge'):
        return bb1+'_'+bb2+'.ce'
    else:
        return bb1+'_'+bb2+'.'+args
    
base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
exp_folder = os.environ.get('EXP_FOLDER', '')

try:
    os.chdir(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/predicted_reports/opt')
    HB = {}
    BO = {}
    for i in os.listdir('.'):
        aux = open(i,'r')
        aux_dt = aux.readlines()[0]
        aux.close()
        if aux_dt[0] != '[':
            aux_dt = '['+aux_dt.replace('}{', '},{')+']'
        aux = open(i,'w')
        print(aux_dt, end='', file=aux);
        aux.close()
        try:
            dt = json.load(open(i,'r'))
            HB[i[:-5]] = {}
            BO[i[:-5]] = {}
            for f in dt:
                f_name = f['benchmarkInfo']['funcName']
                hb = extract_and_format_digits(f['hottestBB']['bbName'])
                bo = []
                for block in f['bbOrderByHotness']:
                    bo.append(extract_and_format_digits(block['name']))
                HB[i[:-5]][f_name] = hb
                BO[i[:-5]][f_name] = bo
        except:
            print(i)
    json.dump(HB, open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchVespaBlock.json','w'))
    json.dump(BO, open(base_dir+'/Cross Experiments/cBench/'+exp_folder+'/JSON Files/cBenchVespaOrdering.json','w'))
except:
    print('No Vespa results in this experiment')
