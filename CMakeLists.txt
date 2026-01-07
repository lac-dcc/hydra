cmake_minimum_required(VERSION 3.20)

project(Hydra)

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

add_library(WeightedProfileInference MODULE
    lib/Utils/WeightedProfileInference.cpp
)

add_library(BlockOrderingRandom MODULE
    lib/BlockOrdering/Random.cpp
    lib/BlockOrdering/RandomPlugin.cpp
)

add_library(BlockOrderingPredictor MODULE
    lib/BlockOrdering/Predictor.cpp
    lib/BlockOrdering/PredictorPlugin.cpp
)

add_library(BlockOrderingProfile MODULE
    lib/BlockOrdering/Profile.cpp
    lib/BlockOrdering/ProfilePlugin.cpp
)

add_library(BlockOrderingHistRegion MODULE
    lib/BlockOrdering/HistRegion.cpp
    lib/BlockOrdering/HistRegionPlugin.cpp)

add_library(BlockOrderingHashMatching MODULE
    lib/BlockOrdering/HashMatching.cpp
    lib/BlockOrdering/HashMatchingPlugin.cpp)

target_include_directories(WeightedProfileInference PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include/Utils"
)

target_include_directories(BlockOrderingRandom PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include/BlockOrdering"
)

target_include_directories(BlockOrderingPredictor PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include/BlockOrdering"
)

target_include_directories(BlockOrderingProfile PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include/BlockOrdering"
    "${CMAKE_CURRENT_SOURCE_DIR}/include/Utils"
)

target_include_directories(BlockOrderingHistRegion PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include/BlockOrdering"
    "${CMAKE_CURRENT_SOURCE_DIR}/include/Utils"
)

target_include_directories(BlockOrderingHashMatching PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/include/BlockOrdering"
    "${CMAKE_CURRENT_SOURCE_DIR}/include/Utils"
)
