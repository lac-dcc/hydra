#!/bin/bash

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
CLANG="$LLVM_INSTALL_DIR/bin/clang"

CURRENT_DIR=$(pwd)

HIST_REGION_PROJECTION_SCRIPT="$SCRIPTS_FOLDER/hist_region_projection.sh"
HASH_MATCHING_PROJECTION_SCRIPT="$SCRIPTS_FOLDER/hash_matching_projection.sh"
# CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

BENCH_DIR=$BASE_DIR/Benchmark/cBench
export RESULTS_FOLDER_HASH_MATCHING=$BASE_DIR/Results/cBench/Hash_Matching
export RESULTS_FOLDER_HIST_REGION=$BASE_DIR/Results/cBench/Hist_Region
export HASH_MATCHING_JSON_FILE="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/Hash_Matching/$EXP.json"
export HIST_REGION_JSON_FILE="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/Hist_Region/$EXP.json"

rm -rf $RESULTS_FOLDER_HASH_MATCHING
rm -rf $RESULTS_FOLDER_HIST_REGION

mkdir -p $(dirname $HASH_MATCHING_JSON_FILE)
mkdir -p $(dirname $HIST_REGION_JSON_FILE)

cd $BENCH_DIR
bash all__delete_work_dirs > /dev/null 2>&1
bash all__create_work_dirs > /dev/null 2>&1
# echo $CURRENT_DIR
cd "$CURRENT_DIR"

rm -rf $BENCH_DIR/*.profiling

for d in $(ls $BENCH_DIR)
do 
    if [ -d $BENCH_DIR/$d ]
    then
        # Runtime error with Nisse
        if [[ $d =~ ^"consumer" ]]; then continue; fi
        if [ "$d" = "security_rijndael_e" ]; then continue; fi

        # Compilation error
        if [ "$d" = "consumer_mad" ]; then continue; fi
        if [ "$d" = "office_ghostscript" ]; then continue; fi
        if [ "$d" = "office_ispell" ]; then continue; fi
        if [ "$d" = "office_rsynth" ]; then continue; fi
        if [ "$d" = "security_pgp_d" ]; then continue; fi
        if [ "$d" = "security_pgp_e" ]; then continue; fi
        if [ "$d" = "telecom_gsm" ]; then continue; fi

        if [ $(ls $BENCH_DIR/$d | grep src_work | wc -l) = 1 ]
        then
            rm -rf tmp
            
            mkdir -p tmp
            cd tmp
            echo "running benchmark $d"

            # Hash based matching

            rm -rf $BASE_DIR/Results/Hash_Matching/   
            
            START_TIME_HASH_MATCHING=`date +%s.%N`
            bash "$HASH_MATCHING_PROJECTION_SCRIPT" $BENCH_DIR/$d > /dev/null 2>&1
            ret_code=$?
            if [[ $ret_code -ne 0 ]]
            then
                echo "Profile Projection heuristic failed at benchmark $d"
                exit 1
            fi
            END_TIME_HASH_MATCHING=`date +%s.%N`
            RUNTIME_HASH_MATCHING=$( echo "$END_TIME_HASH_MATCHING - $START_TIME_HASH_MATCHING" | bc -l )

            # echo "Run hash based matching for $RUNTIME_HASH_MATCHING seconds"

            mkdir -p $RESULTS_FOLDER_HASH_MATCHING/$d

            mv $BASE_DIR/Results/Hash_Matching/$d/*.txt $RESULTS_FOLDER_HASH_MATCHING/$d/.
            echo $RUNTIME_HASH_MATCHING > $RESULTS_FOLDER_HASH_MATCHING/$d/full_execution_time.txt

            # Hist region based matching

            rm -rf $BASE_DIR/Results/Hist_Region/   
            
            START_TIME_HIST_REGION=`date +%s.%N`
            bash "$HIST_REGION_PROJECTION_SCRIPT" $BENCH_DIR/$d > /dev/null 2>&1
            ret_code=$?
            if [[ $ret_code -ne 0 ]]
            then
                echo "Profile Projection heuristic failed at benchmark $d"
                exit 1
            fi
            END_TIME_HIST_REGION=`date +%s.%N`
            RUNTIME_HIST_REGION=$( echo "$END_TIME_HIST_REGION - $START_TIME_HIST_REGION" | bc -l )

            # echo "Run hist-region based matching for $RUNTIME_HIST_REGION seconds"

            mkdir -p $RESULTS_FOLDER_HIST_REGION/$d

            mv $BASE_DIR/Results/Hist_Region/$d/*.txt $RESULTS_FOLDER_HIST_REGION/$d/.
            echo $RUNTIME_HIST_REGION > $RESULTS_FOLDER_HIST_REGION/$d/full_execution_time.txt

            cd ..
            rm -rf tmp
        fi
        # break
    fi
done

python3 "$SCRIPTS_FOLDER/get_bo_json.py"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "JSON processing failed"
    exit 1
fi