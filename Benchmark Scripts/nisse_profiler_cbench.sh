#!/usr/bin/env bash

# Example:
# ./nisse_profiler_cbench.sh path/to/cBench/automotive_bitcount [dataset_number]

# if [ $# -lt 1 ]
# then
#     echo "Syntax: regions_ex file.c [INPUT]"
#     exit 1
# fi

# LLVM tools:
#
source "$BASE_DIR/Benchmark Scripts/config.sh"

LLVM_OPT=$LLVM_INSTALL_DIR/bin/opt
LLVM_CLANG=$LLVM_INSTALL_DIR/bin/clang
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis
PROFILER_IMPL=$NISSE_SOURCE_DIR/lib/prof.c
MY_LLVM_LIB=$NISSE_BUILD_DIR/lib/libNisse.so
PROP_BIN=$NISSE_BUILD_DIR/bin/propagation

# Move to folder where cBench is
#
DR_NAME="$(dirname $1)"
cd $DR_NAME
DR_NAME=$(pwd)
echo $(pwd)

# Some names:
#
BENCH_NAME=$(basename $1)
PROF_DIR="$(pwd)/$BENCH_NAME.profiling"
BC_NAME="$BENCH_NAME.bc"
LL_NAME="$BENCH_NAME.ll"
PF_NAME="$BENCH_NAME.profiled.ll"

# Create the profiling folder:
#
if [ -d "$PROF_DIR" ]; then
  rm -r "$PROF_DIR"
fi
mkdir $PROF_DIR

# Move to Benchmark source work directory
#
cd "$BENCH_NAME/src_work"

# Generating a single bytecode for the benchmark in SSA form:
#
$LLVM_CLANG -Xclang -disable-O0-optnone -flto -emit-llvm -c *.c
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

# Running the pass:
#
$LLVM_OPT -S -load-pass-plugin $MY_LLVM_LIB -passes="nisse" -stats \
    $LL_NAME -o $PF_NAME

# Print the instrumented CFG
#
$LLVM_OPT -S -passes="dot-cfg" -stats \
    $PF_NAME -o $PF_NAME

# Compile the newly instrumented program, and link it against the profiler.
# We are passing -no_pie to disable address space layout randomization:
#
$LLVM_CLANG -flto -fuse-ld=lld -Wall \
    $PF_NAME $PROFILER_IMPL -o $BENCH_NAME
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
    echo "Compilation failed"
    cd -
    echo $BENCH_NAME >> err.txt
    exit $ret_code
fi

if [ $# -ge 2 ]
then
  $DR_NAME/$BENCH_NAME/src_work/__run $DR_NAME/$BENCH_NAME/src_work $2 $PROF_DIR/$BENCH_NAME
else
  $DR_NAME/$BENCH_NAME/src_work/__run $DR_NAME/$BENCH_NAME/src_work 1 $PROF_DIR/$BENCH_NAME
fi

# Prepare the result folders
#
mkdir graphs profiles compiled partial_profiles dot

# Propagation Flags to use:
#
if [ $# -eq 3 ]
then
  PROP_FLAG="-s"
else
  PROP_FLAG=""
fi

# Propagate the weights for each function:
#
for i in *.prof; do
  echo $i
  PROF_NAME="$i.full"
  $PROP_BIN $i $PROP_FLAG -o $PROF_NAME
  mv $i partial_profiles/
  mv $PROF_NAME.edges profiles/
  mv $PROF_NAME.bb profiles/
done

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

mv $BENCH_NAME compiled/

cd -

exit 0


# Compile the newly instrumented program, and link it against the profiler.
# We are passing -no_pie to disable address space layout randomization:
#
$LLVM_CLANG -Wall -std=c99 $PF_NAME $PROFILER_IMPL -o $BS_NAME
ret_code=$?
if [[ $ret_code -ne 0 ]]; then
  echo "Compilation failed"
  cd -
  echo $FL_NAME >> err.txt
  exit $ret_code
fi

# Run the instrumented binary:
#
if [ $# -ge 2 ]
then
  ./$BS_NAME $2
else
  ./$BS_NAME 0
fi

# Prepare the result folders
#
mkdir graphs profiles compiled partial_profiles dot

# Propagation Flags to use:
#
if [ $# -eq 3 ]
then
  PROP_FLAG="-s"
else
  PROP_FLAG=""
fi

# Propagate the weights for each function:
#
for i in *.prof; do
  PROF_NAME="$i.full"
  $PROP_BIN $i $PROP_FLAG -o $PROF_NAME
  mv $i partial_profiles/
  mv $PROF_NAME.edges profiles/
  mv $PROF_NAME.bb profiles/
done

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

mv $BS_NAME compiled/

# Go back to the folder where you were before:
#
cd -