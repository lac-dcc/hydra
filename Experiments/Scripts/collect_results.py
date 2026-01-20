import csv
import os
import json
import numpy as np
import matplotlib.pyplot as plt
from tabulate import tabulate
from PIL import Image, ImageDraw, ImageFont

base_dir = os.environ.get('BASE_DIR', '')
os.makedirs(base_dir+'/Summarized_Results', exist_ok=True)

prediction_results_folder = base_dir+'/Experiments/Profile_Prediction/CSV_Files'
projection_results_folder = base_dir+'/Experiments/Profile_Projection/CSV_Files'

def save_csv(csv_dt, file_name):
    for row in csv_dt:
        for i in range(0,len(row)):
            row[i] = row[i].replace('%','').replace('.',',')
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
        writer.writerows(csv_dt)

def render_csv(csv_dt, file_name):
    headers = csv_dt[0]
    rows = csv_dt[1:]
    table = tabulate(rows, headers=headers, tablefmt="fancy_grid")
    # print(table)

    width, height = 800, 600
    bg_color = (255, 255, 255)
    fg_color = (0, 0, 0)

    font_path = '/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf'
    font_size = 16
    font = ImageFont.truetype(font_path, font_size)

    line_spacing = 4
    bbox = font.getbbox("Ay")
    line_height = bbox[3] - bbox[1] + line_spacing

    image = Image.new("RGB", (width, height), bg_color)
    draw = ImageDraw.Draw(image)

    y = 0
    for row in table.split('\n'):
        draw.text((0,y), row, font=font, fill=fg_color)
        y += line_height

    image.save(file_name, "PNG")

def compute_avg(file_name, benchmarks=[]):
    s = 0.0
    n = 0
    dt = open(file_name, 'r')
    csv_dt = csv.reader(dt, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    next(csv_dt)
    if benchmarks == []:
        for row in csv_dt:
            n += 1
            s += float(row[-1].replace(',','.'))
    else:
        for row in csv_dt:
            if (row[0], row[1], row[2]) in benchmarks:
                n += 1
                s += float(row[-1].replace(',','.'))
    return round(round(s/n, 4)*100.0, 2)

### RQ1

csv_dt = [['Heuristic', '-O0', '-O1', '-O2', '-O3']]
for i in range(2):
    csv_dt.append(['']*5)

for (i,x) in [(1, 'LLVM'), (2, 'Random')]:
    csv_dt[i][0] = x
    for (j,y) in [(1, 'o0'), (2, 'o1'), (3, 'o2'), (4, 'o3')]:
        file_path = prediction_results_folder+'/'+x+'/'+y+'.csv'
        csv_dt[i][j] = str(compute_avg(file_path))+'%'

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ1.csv')
render_csv(csv_dt, base_dir+'/Summarized_Results/RQ1.png')

### RQ2

csv_dt = [['', 'Heuristic', '-O0', '-O1', '-O2', '-O3']]
for i in range(4*2):
    csv_dt.append(['']*6)

for (i0, x0) in [(1, 'o0'), (2, 'o1'), (3, 'o2'), (4, 'o3')]:
    for (i1, x1) in [(1, 'Hash_Matching'), (2, 'Hist_Region')]:
        i = (i0-1)*2+i1
        csv_dt[i][0] = x0
        csv_dt[i][1] = x1
        for (j,y) in [(2, 'o0'), (3, 'o1'), (4, 'o2'), (5, 'o3')]:
            file_path = projection_results_folder+'/'+x1+'/'+x0+'/'+y+'.csv'
            csv_dt[i][j] = str(compute_avg(file_path))+'%'

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ2.csv')
render_csv(csv_dt, base_dir+'/Summarized_Results/RQ2.png')

### RQ3

csv_dt = [['Heuristic', '-O0', '-O1', '-O2', '-O3']]
for i in range(3):
    csv_dt.append(['']*5)

for (j,y) in [(1, 'o0'), (2, 'o1'), (3, 'o2'), (4, 'o3')]:
    benchmarks = []
    with open(prediction_results_folder+'/LLM_Pred/'+y+'.csv') as file:
        dt = csv.reader(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
        next(dt)
        for row in dt:
            benchmarks.append((row[0], row[1], row[2]))
    for (i,x) in [(1, 'LLM_Pred'), (2, 'LLVM'), (3, 'Random')]:
        csv_dt[i][0] = x
        file_path = prediction_results_folder+'/'+x+'/'+y+'.csv'
        csv_dt[i][j] = str(compute_avg(file_path, benchmarks))+'%'

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ3.csv')
render_csv(csv_dt, base_dir+'/Summarized_Results/RQ3.png')

### RQ4

csv_dt = [['', 'Heuristic', '-O0', '-O1', '-O2', '-O3']]
for i in range(4*3):
    csv_dt.append(['']*6)

for (i0, x0) in [(1, 'o0'), (2, 'o1'), (3, 'o2'), (4, 'o3')]:
    for (j,y) in [(2, 'o0'), (3, 'o1'), (4, 'o2'), (5, 'o3')]:
        benchmarks = []
        with open(projection_results_folder+'/LLM_Proj/'+x0+'/'+y+'.csv') as file:
            dt = csv.reader(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
            next(dt)
            for row in dt:
                benchmarks.append((row[0], row[1], row[2]))
        for (i1, x1) in [(1, 'Hash_Matching'), (2, 'Hist_Region'), (3, 'LLM_Proj')]:
            i = (i0-1)*3+i1
            csv_dt[i][0] = x0
            csv_dt[i][1] = x1
            file_path = projection_results_folder+'/'+x1+'/'+x0+'/'+y+'.csv'
            csv_dt[i][j] = str(compute_avg(file_path, benchmarks))+'%'

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ4.csv')
render_csv(csv_dt, base_dir+'/Summarized_Results/RQ4.png')

### RQ5

csv_dt = [['Optimization', 'Hash_Matching', 'Hist_Region']]

hash_matching_dt = open(projection_results_folder+'/Hash_Matching/Opts/final_results.csv','r').readlines()
hist_region_dt = open(projection_results_folder+'/Hist_Region/Opts/final_results.csv','r').readlines()

labels = []
hash_matching_values = []
hist_region_values = []

for i in range(1,len(hist_region_dt)//2+1):
    hash_matching_row = hash_matching_dt[i].split(';')
    hist_region_row = hist_region_dt[i].split(';')
    labels.append(hist_region_row[0])
    hash_matching_values.append(float(hash_matching_row[2].replace(',','.')))
    hist_region_values.append(float(hist_region_row[2].replace(',','.')))
    csv_dt.append([hist_region_row[0], hash_matching_row[2], hist_region_row[2]])

w = 0.2
x = np.arange(len(labels))

fig, ax = plt.subplots(figsize=(10,5))

ax.bar(x - 3*w/4, hist_region_values, width=w, label='Hist Region')
ax.bar(x + 3*w/4, hash_matching_values, width=w, label='Hash Matching')

ax.set_xticks(x)
ax.set_xticklabels(labels, rotation=45, ha='right')
ax.set_yticks(np.arange(0, 1.1, 0.1))
ax.set_ylabel('Precision')
ax.set_title('RQ5')
ax.legend(loc='lower left', framealpha=1.0)

fig.savefig(base_dir+'/Summarized_Results/RQ5-1.png', dpi=300, bbox_inches='tight')
plt.close(fig)

labels = []
hash_matching_values = []
hist_region_values = []

for i in range(len(hist_region_dt)//2+1,len(hist_region_dt)):
    hash_matching_row = hash_matching_dt[i].split(';')
    hist_region_row = hist_region_dt[i].split(';')
    labels.append(hist_region_row[0])
    hash_matching_values.append(float(hash_matching_row[2].replace(',','.')))
    hist_region_values.append(float(hist_region_row[2].replace(',','.')))
    csv_dt.append([hist_region_row[0], hash_matching_row[2], hist_region_row[2]])

w = 0.2
x = np.arange(len(labels))

fig, ax = plt.subplots(figsize=(10,5))

ax.bar(x - 3*w/4, hist_region_values, width=w, label='Hist Region')
ax.bar(x + 3*w/4, hash_matching_values, width=w, label='Hash Matching')

ax.set_xticks(x)
ax.set_xticklabels(labels, rotation=45, ha='right')
ax.set_yticks(np.arange(0, 1.1, 0.1))
ax.set_ylabel('Precision')
ax.set_title('RQ5')
ax.legend(loc='lower left', framealpha=1.0)

fig.savefig(base_dir+'/Summarized_Results/RQ5-2.png', dpi=300, bbox_inches='tight')
plt.close(fig)

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ5.csv')

### RQ6

prediction_json_folder = base_dir+'/Experiments/Profile_Prediction/JSON_Files'
projection_json_folder = base_dir+'/Experiments/Profile_Projection/JSON_Files'

def compute_execution_time(file_path):
    s = 0.0
    dt = json.load(open(file_path,'r'))
    for bench in dt:
        s += dt[bench]['execution_time']
    return round(s,3)

## 6.1

csv_dt = [['Heuristic', '-O0', '-O1', '-O2', '-O3']]
for i in range(2):
    csv_dt.append(['']*5)

for (i,x) in [(1, 'LLVM'), (2, 'Random')]:
    csv_dt[i][0] = x
    for (j,y) in [(1, 'o0'), (2, 'o1'), (3, 'o2'), (4, 'o3')]:
        file_path = prediction_json_folder+'/'+x+'/'+y+'.json'
        csv_dt[i][j] = str(compute_execution_time(file_path))+'s'

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ6-1.csv')
render_csv(csv_dt, base_dir+'/Summarized_Results/RQ6-1.png')

## 6.2

csv_dt = [['', 'Heuristic', '-O0', '-O1', '-O2', '-O3']]
for i in range(4*2):
    csv_dt.append(['']*6)

for (i0, x0) in [(1, 'o0'), (2, 'o1'), (3, 'o2'), (4, 'o3')]:
    for (i1, x1) in [(1, 'Hash_Matching'), (2, 'Hist_Region')]:
        i = (i0-1)*2+i1
        csv_dt[i][0] = x0
        csv_dt[i][1] = x1
        for (j,y) in [(2, 'o0'), (3, 'o1'), (4, 'o2'), (5, 'o3')]:
            file_path = projection_json_folder+'/'+x1+'/'+x0+'/'+y+'.json'
            csv_dt[i][j] = str(compute_execution_time(file_path))+'s'

save_csv(csv_dt, base_dir+'/Summarized_Results/RQ6-2.csv')
render_csv(csv_dt, base_dir+'/Summarized_Results/RQ6-2.png')