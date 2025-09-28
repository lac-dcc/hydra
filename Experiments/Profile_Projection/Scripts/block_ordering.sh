#!/bin/bash

# export LLVM_INSTALL_DIR="/usr/local"
# export BASE_DIR="/home/jvf/Codes/hydra"

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
CLANG="$LLVM_INSTALL_DIR/bin/clang"

CURRENT_DIR=$(pwd)

PROFILE_PROJECTION_SCRIPT="$SCRIPTS_FOLDER/profile_projection.sh"
# CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

BENCH_DIR=$BASE_DIR/Benchmark/cBench
export RESULTS_FOLDER_PROFILE=$BASE_DIR/Results/cBench/Profile
export PROJECTION_JSON_FILE="$BASE_DIR/Experiments/Profile_Projection/JSON_Files/Ayupov/$EXP.json"

rm -rf $RESULTS_FOLDER_PROFILE

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

            rm -rf $BASE_DIR/Results/Profile/   
            
            START_TIME_PROFILE=`date +%s.%N`
            bash "$PROFILE_PROJECTION_SCRIPT" $BENCH_DIR/$d > /dev/null 2>&1
            ret_code=$?
            if [[ $ret_code -ne 0 ]]
            then
                echo "Profile Projection heuristic failed at benchmark $d"
                exit 1
            fi
            END_TIME_PROFILE=`date +%s.%N`
            RUNTIME_PROFILE=$( echo "$END_TIME_PROFILE - $START_TIME_PROFILE" | bc -l )

            mkdir -p $RESULTS_FOLDER_PROFILE/$d

            mv $BASE_DIR/Results/Profile/$d/*.txt $RESULTS_FOLDER_PROFILE/$d/.
            echo $RUNTIME_PROFILE > $RESULTS_FOLDER_PROFILE/$d/full_execution_time.txt

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