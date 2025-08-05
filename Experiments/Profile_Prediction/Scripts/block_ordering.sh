#!/bin/bash

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
CLANG="$LLVM_INSTALL_DIR/bin/clang"

CURRENT_DIR=$(pwd)

PASS_FILE_RANDOM=$BASE_DIR/build/lib/libBlockOrderingRandom.so
PASS_FILE_PREDICTOR=$BASE_DIR/build/lib/libBlockOrderingPredictor.so

BENCH_DIR=$BASE_DIR/Benchmark/cBench
export RESULTS_FOLDER_RANDOM=$BASE_DIR/Results/cBench/Random
export RESULTS_FOLDER_PREDICTOR=$BASE_DIR/Results/cBench/Predictor
export RANDOM_JSON_FILE="$BASE_DIR/Experiments/Profile_Prediction/JSON_Files/Random/$EXP.json"
export PREDICTOR_JSON_FILE="$BASE_DIR/Experiments/Profile_Prediction/JSON_Files/LLVM/$EXP.json"

rm -rf $RESULTS_FOLDER_RANDOM
rm -rf $RESULTS_FOLDER_PREDICTOR

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

            $CLANG -Xclang -"$OPT_FLAG" -flto -emit-llvm -c $BENCH_DIR/$d/src_work/*.c
            $LLVM_LINK *.o -o $d.bc
            $LLVM_DIS $d.bc -o $d.ll
            $LLVM_OPT -S -passes="mem2reg,instnamer" $d.ll -o $d.ll

            # Apply other optmizations
            for PASS in $PASSES
            do
                $LLVM_OPT -S -passes="$PASS" $d.ll -o $d.ll
            done
            
            $LLVM_OPT -S -passes="loop-simplify,break-crit-edges" $d.ll -o $d.ll

            cp $d.ll $LL_FOLDER/$EXP/$d.ll

            START_TIME=`date +%s.%N`
            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_RANDOM -passes="block-ordering-random" $d.ll
            ret_code=$?
            if [[ $ret_code -ne 0 ]]
            then
                echo "Random heuristic failed at benchmark $d"
                exit 1
            fi
            END_TIME=`date +%s.%N`
            RUNTIME_RANDOM=$( echo "$END_TIME - $START_TIME" | bc -l )

            START_TIME=`date +%s.%N`
            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PREDICTOR -passes="block-ordering-predictor" $d.ll
            ret_code=$?
            if [[ $ret_code -ne 0 ]]
            then
                echo "LLVM Predictor heuristic failed at benchmark $d"
                exit 1
            fi
            END_TIME=`date +%s.%N`
            RUNTIME_PREDICTOR=$( echo "$END_TIME - $START_TIME" | bc -l )

            mkdir -p $RESULTS_FOLDER_RANDOM/$d
            mkdir -p $RESULTS_FOLDER_PREDICTOR/$d

            mv *-random.txt $RESULTS_FOLDER_RANDOM/$d/.
            echo $RUNTIME_RANDOM > $RESULTS_FOLDER_RANDOM/$d/execution_time.txt

            mv *-predictor.txt $RESULTS_FOLDER_PREDICTOR/$d/.
            echo $RUNTIME_PREDICTOR > $RESULTS_FOLDER_PREDICTOR/$d/execution_time.txt

            cd ..
            rm -rf tmp
        fi
    fi
done

python3 "$SCRIPTS_FOLDER/get_bo_json.py"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "JSON processing failed"
    exit 1
fi