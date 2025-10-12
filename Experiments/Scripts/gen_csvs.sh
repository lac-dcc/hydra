#!/bin/bash

SCRIPTS_FOLDER="$BASE_DIR/Experiments/Scripts"

# # Gen CSVs for opt flags experiments
for i in o0 o1 o2 o3
do
    export GT_JSON_FILE="$BASE_DIR/Experiments/Ground_Truth/JSON_Files/Flags/$i.json"
    # # Profile predictor heuristics
    # for j in Vespa # LLVM Random
    # do
    #     export H_JSON_FILE="$BASE_DIR/Experiments/Profile_Prediction/JSON_Files/$j/$i.json"
    #     export CSV_FILE="$BASE_DIR/Experiments/Profile_Prediction/CSV_Files/$j/$i.csv"
    #     python3 "$SCRIPTS_FOLDER/gen_csv_report.py" > /tmp/log_$i\_$j.txt
    # done
    # Profile projection heuristics
    for j in o0 o1 o2 o3
    do
        for k in Ayupov Beetle Hydra
        do
            export H_JSON_FILE="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/$k/$j/$i.json"
            export CSV_FILE="$BASE_DIR/Experiments/Profile_Projection/CSV_Files/$k/$j/$i.csv"
            python3 "$SCRIPTS_FOLDER/gen_csv_report.py" > /tmp/log_$i\_$j\_$k.txt
        done
    done
done

# # Gen CSVs for opt passes experiments

# for i in Random LLVM
# do
#     GT_FOLDER="$BASE_DIR/Experiments/Ground_Truth/JSON_Files/Opts"
#     H_FOLDER="$BASE_DIR/Experiments/Profile_Prediction/JSON_Files/$i/Opts/o0"
#     UB_FOLDER="$BASE_DIR/Experiments/Profile_Prediction/JSON_Files/Hydra/Opts/Upper_Bound"

#     export CSV_FILES_DIR="$BASE_DIR/Experiments/Profile_Prediction/CSV_Files/$i/Opts"

#     for j in $(ls $H_FOLDER)
#     do
#         export EXP_SETUP="$i"
#         export GT_JSON_FILE="$GT_FOLDER/$j"
#         export UB_JSON_FILE="$UB_FOLDER/$j"
#         export H_JSON_FILE="$H_FOLDER/$j"
#         export CSV_FILE="$CSV_FILES_DIR/${j%.json}.csv"

#         mkdir -p /tmp/$EXP
#         python3 "$SCRIPTS_FOLDER/gen_opt_csv_report.py" > /tmp/$EXP/log.txt
#     done

#     export CSV_FILE="$CSV_FILES_DIR/final_results.csv"
#     python3 "$SCRIPTS_FOLDER/gen_summarized_opt_csv_report.py"
# done


# for i in Ayupov # Hydra
# do
#     GT_FOLDER="$BASE_DIR/Experiments/Ground_Truth/JSON_Files/Opts"
#     H_FOLDER="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/$i/Opts/o0"
#     UB_FOLDER="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/Hydra/Opts/Upper_Bound"

#     export CSV_FILES_DIR="$BASE_DIR/Experiments/Profile_Projection/CSV_Files/$i/Opts"

#     for j in $(ls $H_FOLDER)
#     do
#         export EXP_SETUP="$i"
#         export GT_JSON_FILE="$GT_FOLDER/$j"
#         export UB_JSON_FILE="$UB_FOLDER/$j"
#         export H_JSON_FILE="$H_FOLDER/$j"
#         export CSV_FILE="$CSV_FILES_DIR/${j%.json}.csv"

#         mkdir -p /tmp/$EXP
#         python3 "$SCRIPTS_FOLDER/gen_opt_csv_report.py" > /tmp/$EXP/log.txt
#     done

#     export CSV_FILE="$CSV_FILES_DIR/final_results.csv"
#     python3 "$SCRIPTS_FOLDER/gen_summarized_opt_csv_report.py"
# done
