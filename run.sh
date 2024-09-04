#!/bin/bash

LLVM_INSTALL_DIR=""
BASE_DIR=~/Codigos/hydra

LLVM_OPT="$LLVM_INSTALL_DIR/bin/opt"
CLANG="$LLVM_INSTALL_DIR/bin/clang"

PASS_FILE_RANDOM=$BASE_DIR/build/lib/libHotBlockRandom.so
PASS_FILE_NESTED=$BASE_DIR/build/lib/libHotBlockNested.so
CFLAGS="-Xclang -disable-O0-optnone -Wno-everything -std=c99 -c -S -emit-llvm"

BENCHMARK_DIR=$BASE_DIR/Benchmark/Jotai
RESULTS_FOLDER_RANDOM=$BASE_DIR/Results/Jotai/Random
RESULTS_FOLDER_NESTED=$BASE_DIR/Results/Jotai/Nested
export JSON_FOLDER="$BASE_DIR/JSON Files"
mkdir -p $RESULTS_FOLDER_RANDOM
mkdir -p $RESULTS_FOLDER_NESTED

rm -rf $RESULTS_FOLDER_RANDOM
rm -rf $RESULTS_FOLDER_NESTED

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
    mkdir -p $RESULTS_FOLDER_RANDOM/$FILE_NAME
    mkdir -p $RESULTS_FOLDER_NESTED/$FILE_NAME
    mv *-random.txt $RESULTS_FOLDER_RANDOM/$FILE_NAME/.
    mv *-nested.txt $RESULTS_FOLDER_NESTED/$FILE_NAME/.
done

rm $BENCHMARK_DIR/*.ll
cd ..
rm -rf tmp

python3 "$BASE_DIR/getHBPJSON.py"