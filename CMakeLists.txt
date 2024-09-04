cmake_minimum_required(VERSION 3.20)

project(HotBlockPrediction)

set(CMAKE_CXX_STANDARD 17 CACHE STRING "")

set(LLVM_INSTALL_DIR "" CACHE PATH "LLVM installation directory")
set(LLVM_CMAKE_CONFIG_DIR "" "${LLVM_INSTALL_DIR}/lib/cmake/llvm/")
list(APPEND CMAKE_PREFIX_PATH "${LLVM_CMAKE_CONFIG_DIR}")

find_package(LLVM REQUIRED CONFIG)

include_directories(${LLVM_INCLUDE_DIRS})

if(NOT LLVM_ENABLE_RTTI)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/lib")

add_library(HotBlockNested MODULE
    lib/HBPNested.cpp
    lib/HBPNestedPlugin.cpp
)

add_library(HotBlockRandom MODULE
    lib/HBPRandom.cpp
    lib/HBPRandomPlugin.cpp
)

target_include_directories(HotBlockNested PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

target_include_directories(HotBlockRandom PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
)