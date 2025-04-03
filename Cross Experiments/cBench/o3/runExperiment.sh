#!/bin/bash

# Experiment for profile projection
# From:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify
# To:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify

export EXP_FOLDER="o3"
export PASSES=""

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"
CUR_DIR="$BASE_DIR/Cross Experiments/cBench/$EXP_FOLDER"

echo "Running nisse_all script"
bash "$CUR_DIR/cBench/nisse_all.sh"

echo "Running hot block prediction heuristics"
bash "$CUR_DIR/runHotBlock.sh"

echo "Running block ordering prediction heuristics"
bash "$CUR_DIR/runBlockOrdering.sh"

echo "Generating CSV files"
python3 "$CUR_DIR/genHBPCsv.py"
python3 "$CUR_DIR/genBOPCsv.py"