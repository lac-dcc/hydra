#!/bin/bash

LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
CLANG="$LLVM_INSTALL_DIR/bin/clang"

CURRENT_DIR=$(pwd)

PASS_FILE_RANDOM=$BASE_DIR/build/lib/libBlockOrderingRandom.so
# PASS_FILE_NESTED=$BASE_DIR/build/lib/libBlockOrderingNested.so
PASS_FILE_PREDICTOR=$BASE_DIR/build/lib/libBlockOrderingPredictor.so
# CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

BENCH_DIR=$BASE_DIR/Benchmark/cBench
RESULTS_FOLDER_RANDOM=$BASE_DIR/Results/cBench/Random
# RESULTS_FOLDER_NESTED=$BASE_DIR/Results/cBench/Nested
RESULTS_FOLDER_PREDICTOR=$BASE_DIR/Results/cBench/Predictor
export JSON_FOLDER="$BASE_DIR/JSON Files"

rm -rf $RESULTS_FOLDER_RANDOM
# rm -rf $RESULTS_FOLDER_NESTED
rm -rf $RESULTS_FOLDER_PREDICTOR

cd $BENCH_DIR
bash all__delete_work_dirs > /dev/null 2>&1
bash all__create_work_dirs > /dev/null 2>&1
# echo $CURRENT_DIR
cd "$CURRENT_DIR"

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
            mkdir -p tmp
            cd tmp
            echo "running benchmark $d"
            $CLANG -Xclang -disable-O0-optnone -flto -emit-llvm -c $BENCH_DIR/$d/src_work/*.c
            $LLVM_LINK *.o -o $d.bc
            $LLVM_DIS $d.bc -o $d.ll
            $LLVM_OPT -S -passes="mem2reg,instnamer" $d.ll -o $d.ll
            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_RANDOM -passes="block-ordering-random" $d.ll
            # $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_NESTED -passes="block-ordering-nested" $d.ll
            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PREDICTOR -passes="block-ordering-predictor" $d.ll
            mkdir -p $RESULTS_FOLDER_RANDOM/$d
            # mkdir -p $RESULTS_FOLDER_NESTED/$d
            mkdir -p $RESULTS_FOLDER_PREDICTOR/$d
            mv *-random.txt $RESULTS_FOLDER_RANDOM/$d/.
            # mv *-nested.txt $RESULTS_FOLDER_NESTED/$d/.
            mv *-predictor.txt $RESULTS_FOLDER_PREDICTOR/$d/.
            cd ..
            rm -rf tmp
        fi
    fi
done

cd $BASE_DIR
python3 cBench\ Scripts/getBOPJSON.py