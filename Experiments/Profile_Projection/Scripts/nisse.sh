#!/usr/bin/env bash

# Example:
# ./mem_profiler.sh ../../tests/simple_array.c

if [ $# -lt 1 ]
then
    echo Syntax: regions_ex file.c
    exit 1
fi

# LLVM tools:
#
source "$BASE_DIR/Benchmark_Scripts/config.sh"

LLVM_OPT=$LLVM_INSTALL_DIR/bin/opt
LLVM_CLANG=$LLVM_INSTALL_DIR/bin/clang
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
PROFILER_IMPL=$NISSE_SOURCE_DIR/lib/prof.c
MY_LLVM_LIB=$NISSE_BUILD_DIR/lib/libNisse.so
PROP_BIN=$NISSE_BUILD_DIR/bin/propagation

# Move to folder where the file is:
#
DR_NAME="$(dirname $1)"
cd $DR_NAME
echo $(pwd)

# File names:
#
BENCH_NAME=$(basename $1)
PROF_DIR="$(pwd)/$BENCH_NAME.profiling"
BC_NAME="$BENCH_NAME.bc"
LL_NAME="$BENCH_NAME.ll"
PF_NAME="$BENCH_NAME.profiled.ll"
INFO_PROF="info.prof"
MAIN_PROF="main.prof"
PROF_SUF=".prof.full"
EXE_LOG="execution.log"

# Create the profiling folder:
#
if [ -d "$PROF_DIR" ]; then
  rm -r "$PROF_DIR"
fi
mkdir $PROF_DIR
cd $BENCH_NAME/src_work

# CLANG_FLAGS="-Xclang -disable-O0-optnone -std=c99 -c -S -emit-llvm"

# Generating a single bytecode for the benchmark in SSA form:
#
$LLVM_CLANG -Xclang -"$OLD_OPT" -flto -emit-llvm -c *.c
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
    echo "Compilation failed"
    cd -
    echo $BENCH_NAME >> err.txt
    exit $ret_code
fi
$LLVM_LINK *.o -o $BC_NAME
$LLVM_DIS $BC_NAME -o $PROF_DIR/$LL_NAME
cd $PROF_DIR
$LLVM_OPT -S -passes="mem2reg,instnamer" $LL_NAME -o $LL_NAME

for PASS in $PRE_PASSES
do
    $LLVM_OPT -S -passes="$PASS" $LL_NAME -o $LL_NAME
done

$LLVM_OPT -S -passes="loop-simplify,break-crit-edges" $LL_NAME -o $LL_NAME
$LLVM_OPT -S -load-pass-plugin $MY_LLVM_LIB -passes="nisse" -stats \
    $LL_NAME -o $PF_NAME
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
  echo "Compilation failed"
  cd -
  echo $BENCH_NAME >> err.txt
  exit $ret_code
fi


# Print the instrumented CFG
#
$LLVM_OPT -S -passes="dot-cfg" -stats \
    $LL_NAME -o $LL_NAME

# Compile the newly instrumented program, and link it against the profiler
#
$LLVM_CLANG -flto -fuse-ld=lld -lm \
  $PF_NAME $PROFILER_IMPL -o $BENCH_NAME
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
  echo "Compilation failed"
  cd -
  echo $BENCH_NAME >> err.txt
  exit $ret_code
fi

# Run the instrumented binary:
#
if [ $# -ge 2 ]
then
  $DR_NAME/$BENCH_NAME/src_work/__run $DR_NAME/$BENCH_NAME/src_work $2 $PROF_DIR/$BENCH_NAME
else
  $DR_NAME/$BENCH_NAME/src_work/__run $DR_NAME/$BENCH_NAME/src_work 1 $PROF_DIR/$BENCH_NAME
fi
ret_code=$?
if [ ! -f $INFO_PROF ] || [ ! -f $MAIN_PROF ]
then
  echo "Execution failed"
  cd -
  echo $FL_NAME >> err.txt
  exit $ret_code
fi

# Propagate the weights for each function:
#
$PROP_BIN $INFO_PROF $MAIN_PROF -o ".prof.full"

# Prepare the result folders
#
mkdir graphs profiles compiled partial_profiles dot

# Move the files to apropriate folders
#
for i in .*.dot; do
  mv $i dot/
done

for i in *.graph; do
  mv $i graphs/
done

for i in *.ll; do
  mv $i compiled/
done

for i in *.prof.full*; do
  mv $i profiles/
done

for i in *.prof; do
  mv $i partial_profiles/
done

mv $EXE_LOG profiles/

mv $BENCH_NAME compiled/

# Go back to the folder where you were before:
#
cd -