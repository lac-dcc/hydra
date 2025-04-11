#!/bin/bash

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
CLANG="$LLVM_INSTALL_DIR/bin/clang"

PROFILE_PROJECTION_SCRIPT=$BASE_DIR/runHBProfileProjection.sh
PASS_FILE_RANDOM=$BASE_DIR/build/lib/libHotBlockRandom.so
PASS_FILE_NESTED=$BASE_DIR/build/lib/libHotBlockNested.so
PASS_FILE_PREDICTOR=$BASE_DIR/build/lib/libHotBlockPredictor.so
CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

BENCHMARK_DIR=$BASE_DIR/Benchmark/Jotai
RESULTS_FOLDER_RANDOM=$BASE_DIR/Results/Jotai/Random
RESULTS_FOLDER_NESTED=$BASE_DIR/Results/Jotai/Nested
RESULTS_FOLDER_PREDICTOR=$BASE_DIR/Results/Jotai/Predictor
RESULTS_FOLDER_PROFILE=$BASE_DIR/Results/Jotai/Profile
export JSON_FOLDER="$BASE_DIR/JSON Files"

rm -rf $RESULTS_FOLDER_RANDOM
rm -rf $RESULTS_FOLDER_NESTED
rm -rf $RESULTS_FOLDER_PREDICTOR
rm -rf $RESULTS_FOLDER_PROFILE

mkdir -p tmp
cd tmp
for FILE in $(ls $BENCHMARK_DIR/*.c)
do
    FILE_NAME=$(basename $FILE)
    FILE_NAME=${FILE_NAME%.*}
    $CLANG $CFLAGS $FILE -o $FILE.ll
    $LLVM_OPT -S -passes="mem2reg,instnamer" $FILE.ll -o $FILE.ll
    $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_RANDOM -passes="hotblock-random" $FILE.ll
    $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_NESTED -passes="hotblock-nested" $FILE.ll
    $LLVM_OPT -disable-output -load-pass-plugin $PASS_FILE_PREDICTOR -passes="hotblock-predictor" $FILE.ll
    rm -rf $BASE_DIR/Results/Profile/
    $PROFILE_PROJECTION_SCRIPT $FILE > /dev/null 2>&1
    mkdir -p $RESULTS_FOLDER_RANDOM/$FILE_NAME
    mkdir -p $RESULTS_FOLDER_NESTED/$FILE_NAME
    mkdir -p $RESULTS_FOLDER_PREDICTOR/$FILE_NAME
    mkdir -p $RESULTS_FOLDER_PROFILE/$FILE_NAME
    mv *-random.txt $RESULTS_FOLDER_RANDOM/$FILE_NAME/.
    mv *-nested.txt $RESULTS_FOLDER_NESTED/$FILE_NAME/.
    mv *-predictor.txt $RESULTS_FOLDER_PREDICTOR/$FILE_NAME/.
    mv $BASE_DIR/Results/Profile/$(basename $FILE)/*.txt $RESULTS_FOLDER_PROFILE/$FILE_NAME/.
    # break
done

rm $BENCHMARK_DIR/*.ll
cd ..
rm -rf tmp

python3 "$BASE_DIR/getHBPJSON.py"