export EXP_FOLDER="lv"
export PASSES=""

export LLVM_INSTALL_DIR="/usr/local"
export BASE_DIR="/home/jvf/Codes/hydra"

LLVM_OPT=$LLVM_INSTALL_DIR/bin/opt
CLANG=$LLVM_INSTALL_DIR/bin/clang
LLVM_LINK=$LLVM_INSTALL_DIR/bin/llvm-link
LLVM_DIS=$LLVM_INSTALL_DIR/bin/llvm-dis

BENCH_DIR=$BASE_DIR/Benchmark/cBench

cd $BENCH_DIR
bash all__delete_work_dirs > /dev/null 2>&1
bash all__create_work_dirs > /dev/null 2>&1
# echo $CURRENT_DIR
cd "$CURRENT_DIR"

rm -rf $BENCH_DIR/*.profiling
rm -rf /tmp/functions_diff.txt

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
            rm -rf tmp
            mkdir -p tmp
            cd tmp

            $CLANG -Xclang -disable-O0-optnone -flto -emit-llvm -c $BENCH_DIR/$d/src_work/*.c
            $LLVM_LINK *.o -o $d.bc
            $LLVM_DIS $d.bc -o $d.ll
            $LLVM_OPT -S -passes="mem2reg,instnamer" $d.ll -o $d.ll
            $LLVM_OPT -S -passes="loop-simplify,break-crit-edges" $d.ll -o $d.ll
            $LLVM_OPT -S -passes="simplifycfg" $d.ll -o $d.ll
            $LLVM_OPT -S -passes="lcssa" $d.ll -o $d.ll
            $LLVM_OPT -S -passes="loop-rotate" $d.ll -o $d.ll
            $LLVM_OPT -S -passes="loop-vectorize,indvars,lcssa" $d.ll -o "$d"_vec.ll

            mkdir -p /tmp/$d/original
            mkdir -p /tmp/$d/vectorized
            cp $d.ll /tmp/$d/$d.ll
            cp "$d"_vec.ll /tmp/$d/"$d"_vec.ll

            export BENCH_NAME=$d

            # Remember to copy this file to /tmp
            python3 /tmp/splitLLFile.py

            for i in $(ls /tmp/$d/original)
            do
                export FUN_NAME=$i
                if [[ `diff /tmp/$d/original/$i /tmp/$d/vectorized` ]]
                then
                    # Also remember to copy this file to /tmp
                    python3 /tmp/getFunName.py >> /tmp/functions_diff.txt
                fi
            done

            cd ..
            rm -rf tmp
        fi
    fi
done