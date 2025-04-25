#!/bin/bash

# Experiment for profile projection
# From:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify
# To:
#   O0 + mem2reg, instnamer, break-crit-edges, loop-simplify

EXP_FOLDER="empty"
OLD_OPT="disable-O0-optnone"
NEW_OPT="disable-O0-optnone"
PRE_PASSES=""
PASSES=""

TEMP=$(getopt -o '' --long exp-folder:,old-opt:,new-opt:,pre-passes:,new-passes: -n "$0" -- "$@")

if [[ $? != 0 ]]
then
    echo "Terminating..." >&2
    exit 1
fi

eval set -- $TEMP

while true
do
    case "$1" in
        --exp-folder) EXP_FOLDER="$2"; shift 2 ;;
        --old-opt) OLD_OPT="$2"; shift 2 ;;
        --new-opt) NEW_OPT="$2"; shift 2 ;;
        --pre-passes) PRE_PASSES="$2"; shift 2 ;;
        --new-passes) PASSES="$2"; shift 2 ;;
        --) shift; break ;;
        *) echo "Internal error!"; exit 1 ;;
    esac
done

if [[ -z "$EXP_FOLDER" || -z "$OLD_OPT" || -z "$NEW_OPT" ]]
then
    echo "Usage: $0 --exp-folder <folder> --old-opt <opt flag> --new-opt <opt flag> --pre-passes <passes> --new-passes <passes>"
    exit 1
fi

echo "$EXP_FOLDER"
echo "$OLD_OPT"
echo "$NEW_OPT"
echo "$PRE_PASSES"
echo "$PASSES"

export EXP_FOLDER
export OLD_OPT
export NEW_OPT
export PRE_PASSES
export PASSES

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"
export SCRIPT_DIR="$BASE_DIR/Cross Experiments/cBench/scripts"
RESULT_DIR="$BASE_DIR/Cross Experiments/cBench/$EXP_FOLDER"

if [[ -d "$RESULT_DIR" ]]
then
    BACKUP_DIR="$BASE_DIR/Cross Experiments/cBench/backup"
    mkdir -p "$BACKUP_DIR/$EXP_FOLDER"
    CUR_BKP=1
    while [[ -d "$BACKUP_DIR/$EXP_FOLDER/$CUR_BKP" ]]
    do
        CUR_BKP=`expr $CUR_BKP + 1`
    done
    mv "$RESULT_DIR" "$BACKUP_DIR/$EXP_FOLDER/$CUR_BKP"
fi

mkdir -p "$RESULT_DIR/JSON Files"
mkdir -p "$RESULT_DIR/LL Files/pre"
mkdir -p "$RESULT_DIR/LL Files/opt"

echo "Running nisse_all script"
bash "$SCRIPT_DIR/cBench/nisse_all.sh"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "Internal error"
    echo "Terminating..."
    exit 1
fi

echo "Running hot block prediction heuristics"
bash "$SCRIPT_DIR/runHotBlock.sh"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "Internal error"
    echo "Terminating..."
    exit 1
fi

echo "Running block ordering prediction heuristics"
bash "$SCRIPT_DIR/runBlockOrdering.sh"
ret_code=$?
if [[ $ret_code -ne 0 ]]
then
    echo "Internal error"
    echo "Terminating..."
    exit 1
fi

echo "Generating CSV files"
python3 "$SCRIPT_DIR/genHBPCsv.py"
python3 "$SCRIPT_DIR/genBOPCsv.py"

echo "Saving elapsed time"
python3 "$SCRIPT_DIR/getExecutionTime.py" > "$RESULT_DIR/time.log"
