#!/bin/bash

# Experiment for profile projection
# From:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify
# To:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify

EXP="empty"
OLD_OPT="disable-O0-optnone"
NEW_OPT="disable-O0-optnone"
PRE_PASSES=""
PASSES=""
THRESHOLD="0"
MAX_ITER="3"

TEMP=$(getopt -o '' --long exp-name:,old-opt:,new-opt:,pre-passes:,new-passes:,matching-threshold:,max-iterations: -n "$0" -- "$@")

if [[ $? != 0 ]]
then
    echo "Terminating..." >&2
    exit 1
fi

eval set -- $TEMP

while true
do
    case "$1" in
        --exp-name) EXP="$2"; shift 2 ;;
        --old-opt) OLD_OPT="$2"; shift 2 ;;
        --new-opt) NEW_OPT="$2"; shift 2 ;;
        --pre-passes) PRE_PASSES="$2"; shift 2 ;;
        --new-passes) PASSES="$2"; shift 2 ;;
        --matching-threshold) THRESHOLD="$2"; shift 2 ;;
        --max-iterations) MAX_ITER="$2"; shift 2 ;;
        --) shift; break ;;
        *) echo "Internal error!"; exit 1 ;;
    esac
done

if [[ -z "$EXP" || -z "$OLD_OPT" || -z "$NEW_OPT" ]]
then
    echo "Usage: $0 --exp-name <name> --old-opt <opt flag> --new-opt <opt flag> --pre-passes <passes> --new-passes <passes> --matching-threshold <threshold> --max-iterations <iterations>"
    exit 1
fi

echo "Running Profile Projection with the following parameters:"
echo "Experiment name: $EXP"
echo "Old optimization flag: $OLD_OPT"
echo "New optimization flag: $NEW_OPT"
echo "Old optimization passes: $PRE_PASSES"
echo "New optimization passes: $PASSES"
echo "Matching Threshold: $THRESHOLD"
echo "Number of matching iterations: $MAX_ITER"

export EXP
export OLD_OPT
export NEW_OPT
export PRE_PASSES
export PASSES
export THRESHOLD
export MAX_ITER

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"
export SCRIPTS_FOLDER="$BASE_DIR/Experiments/Profile_Projection/Scripts"

echo "Running block ordering profile projection heuristics"
bash "$SCRIPTS_FOLDER/block_ordering.sh"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "Internal error"
    echo "Terminating..."
    exit 1
fi