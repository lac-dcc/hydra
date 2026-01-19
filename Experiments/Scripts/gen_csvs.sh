#!/bin/bash

SCRIPTS_FOLDER="$BASE_DIR/Experiments/Scripts"

# Gen CSVs for opt flags experiments
for i in o0 o1 o2 o3
do
    export GT_JSON_FILE="$BASE_DIR/Experiments/Ground_Truth/JSON_Files/Flags/$i.json"

    # Profile predictor heuristics
    for j in LLVM Random LLM_Pred
    do
        export H_JSON_FILE="$BASE_DIR/Experiments/Profile_Prediction/JSON_Files/$j/$i.json"
        export CSV_FILE="$BASE_DIR/Experiments/Profile_Prediction/CSV_Files/$j/$i.csv"
        mkdir -p $(dirname $CSV_FILE)
        python3 "$SCRIPTS_FOLDER/gen_csv_report.py" > /tmp/log_$i\_$j.txt
    done

    # Profile projection heuristics
    for j in o0 o1 o2 o3
    do
        for k in Hash_Matching Hist_Region LLM_Proj
        do
            export H_JSON_FILE="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/$k/$j/$i.json"
            export CSV_FILE="$BASE_DIR/Experiments/Profile_Projection/CSV_Files/$k/$j/$i.csv"
            mkdir -p $(dirname $CSV_FILE)
            python3 "$SCRIPTS_FOLDER/gen_csv_report.py" > /tmp/log_$i\_$j\_$k.txt
        done
    done
done

# Gen CSVs for opt passes experiments
for i in Hash_Matching Hist_Region
do
    GT_FOLDER="$BASE_DIR/Experiments/Ground_Truth/JSON_Files/Opts"
    H_FOLDER="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/$i/Opts/o0"

    export CSV_FILES_DIR="$BASE_DIR/Experiments/Profile_Projection/CSV_Files/$i/Opts"

    mkdir -p $CSV_FILES_DIR

    for j in $(ls $H_FOLDER)
    do
        export EXP_SETUP="$i"
        export GT_JSON_FILE="$GT_FOLDER/$j"
        export H_JSON_FILE="$H_FOLDER/$j"
        export CSV_FILE="$CSV_FILES_DIR/${j%.json}.csv"

        mkdir -p /tmp/$EXP_SETUP
        python3 "$SCRIPTS_FOLDER/gen_opt_csv_report.py" > /tmp/$EXP_SETUP/log.txt
    done

    export CSV_FILE="$CSV_FILES_DIR/final_results.csv"
    python3 "$SCRIPTS_FOLDER/gen_summarized_opt_csv_report.py"
done
