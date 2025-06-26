#!/bin/bash

BASE_DIR="/home/jvf/Codes/hydra"

# # simplifycfg
# "$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="simplifycfg" --new-passes="simplifycfg lcssa loop-rotate" --matching-threshold="9"

# # simplifycfg -> oX
# "$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="scfg-o1" --pre-passes="simplifycfg lcssa loop-rotate" --new-opt="O1" --matching-threshold="10"

# "$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="scfg-o2" --pre-passes="simplifycfg lcssa loop-rotate" --new-opt="O2" --matching-threshold="10"

# "$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="scfg-o3" --pre-passes="simplifycfg lcssa loop-rotate" --new-opt="O3" --matching-threshold="10"

# empty
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh"

# iv-licm
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="iv-licm" --new-passes="indvars licm" --matching-threshold="10"

# loop-vectorize
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="lv" --pre-passes="simplifycfg lcssa loop-rotate" --new-passes="loop-vectorize indvars lcssa" --matching-threshold="10"

# inlining
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="inlining" --pre-passes="simplifycfg lcssa loop-rotate globalopt dce" --new-passes="inline" --matching-threshold="10"

# O1
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="o1" --new-opt="O1" --matching-threshold="25"

# O2
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="o2" --new-opt="O2" --matching-threshold="25"

# O3
"$BASE_DIR/Cross_Experiments/cBench/scripts/runExperiment.sh" --exp-folder="o3" --new-opt="O3" --matching-threshold="25"
