#!/bin/bash

LLVM_INSTALL_DIR="/usr/local"

echo "--------------------------------------------------------------------------------"
if [ ! -e "build" ]
then
    echo "Creating build directory"
    mkdir -p build
    echo "--------------------------------------------------------------------------------"

    echo "Building the CFG printer pass"
    cd build
    cmake -DCMAKE_BUILD_TYPE="Debug" -DLLVM_INSTALL_DIR=$LLVM_INSTALL_DIR -G "Unix Makefiles" ..
    cmake --build .
    cd ..

    echo "--------------------------------------------------------------------------------"
    echo "Done"
    echo "--------------------------------------------------------------------------------"
else
    echo "Build directory already exists"
    echo "--------------------------------------------------------------------------------"

    echo "Updating the CFG printer pass"
    cd build
    cmake --build .
    cd ..

    echo "--------------------------------------------------------------------------------"
    echo "Done"
    echo "--------------------------------------------------------------------------------"
fi