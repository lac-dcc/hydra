#!/bin/bash

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
CLANG="$LLVM_INSTALL_DIR/bin/clang"

CURRENT_DIR=$(pwd)

PROFILE_PROJECTION_SCRIPT="$BASE_DIR/Cross Experiments/cBench/$EXP_FOLDER/runHBProfileProjection.sh"
PASS_FILE_RANDOM=$BASE_DIR/build/lib/libHotBlockRandom.so
PASS_FILE_NESTED=$BASE_DIR/build/lib/libHotBlockNested.so
PASS_FILE_PREDICTOR=$BASE_DIR/build/lib/libHotBlockPredictor.so
# CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

BENCH_DIR=$BASE_DIR/Benchmark/cBench
export RESULTS_FOLDER_RANDOM=$BASE_DIR/Results/cBench/Random
export RESULTS_FOLDER_NESTED=$BASE_DIR/Results/cBench/Nested
export RESULTS_FOLDER_PREDICTOR=$BASE_DIR/Results/cBench/Predictor
export RESULTS_FOLDER_PROFILE=$BASE_DIR/Results/cBench/Profile
export JSON_FOLDER="$BASE_DIR/Cross Experiments/cBench/$EXP_FOLDER/JSON Files"

rm -rf $RESULTS_FOLDER_RANDOM
rm -rf $RESULTS_FOLDER_NESTED
rm -rf $RESULTS_FOLDER_PREDICTOR
rm -rf $RESULTS_FOLDER_PROFILE

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

            $CLANG -Xclang -O1 -flto -emit-llvm -c $BENCH_DIR/$d/src_work/*.c
            $LLVM_LINK *.o -o $d.bc
            $LLVM_DIS $d.bc -o $d.ll

            # Apply other optmizations
            for PASS in $PASSES
            do
                $LLVM_OPT -S -passes="$PASS" $d.ll -o $d.ll
            done

            $LLVM_OPT -S -passes="mem2reg,instnamer" $d.ll -o $d.ll
            $LLVM_OPT -S -passes="loop-simplify,break-crit-edges" $d.ll -o $d.ll


            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_RANDOM -passes="hotblock-random" $d.ll
            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_NESTED -passes="hotblock-nested" $d.ll
            $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PREDICTOR -passes="hotblock-predictor" $d.ll
            rm -rf $BASE_DIR/Results/Profile/   
            bash "$PROFILE_PROJECTION_SCRIPT" $BENCH_DIR/$d > /dev/null 2>&1
            mkdir -p $RESULTS_FOLDER_RANDOM/$d
            mkdir -p $RESULTS_FOLDER_NESTED/$d
            mkdir -p $RESULTS_FOLDER_PREDICTOR/$d
            mkdir -p $RESULTS_FOLDER_PROFILE/$d
            mv *-random.txt $RESULTS_FOLDER_RANDOM/$d/.
            mv *-nested.txt $RESULTS_FOLDER_NESTED/$d/.
            mv *-predictor.txt $RESULTS_FOLDER_PREDICTOR/$d/.
            mv $BASE_DIR/Results/Profile/$d/*.txt $RESULTS_FOLDER_PROFILE/$d/.         

            cd ..
            rm -rf tmp
        fi
    fi
done

python3 "$BASE_DIR/Cross Experiments/cBench/$EXP_FOLDER/getHBPJSON.py"