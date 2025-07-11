import csv
import os

csv_data = [
    ['Optimization', 'Upper Bound Hit Sum', 'Upper Bound Precision', 'Hydra Hit Sum', 'Hydra Precision', 'Staleness']
]

base_dir = os.environ.get('BASE_DIR', '/home/jvf/Codes/hydra/')
csv_files_dir = os.environ.get('CSV_FILES_DIR', '')
csv_file = os.environ.get('CSV_FILE', '')

for file_name in os.listdir(csv_files_dir):
    opt_name = file_name[:-4]
    csv_file_dt = open(csv_files_dir+'/'+file_name, 'r')
    dt = csv.reader(csv_file_dt, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    fields = next(dt)
    num_benchmarks = 0
    ub_sum = 0
    h_sum = 0
    for row in dt:
        ub_sum += float(row[-4].replace(',','.'))
        h_sum += float(row[-1].replace(',','.'))
        num_benchmarks += 1
    ub_precision = ub_sum/(num_benchmarks*1.0)
    h_precision = h_sum/(num_benchmarks*1.0)
    staleness = 1.0-h_precision/ub_precision
    csv_data.append([opt_name, f"{ub_sum:.4f}".replace('.',','), f"{ub_precision:.6f}".replace('.',','), f"{h_sum:.4f}".replace('.',','), f"{h_precision:.6f}".replace('.',','), f"{staleness:.6f}".replace('.',',')])
    csv_file_dt.close()
    

with open(csv_file, mode='w', newline='') as file:
    writer = csv.writer(file, delimiter=';', quoting=csv.QUOTE_MINIMAL)
    writer.writerows(csv_data)
