<p align="center">
  <img alt="Project Banner" src="./assets/images/Banner.png" width="95%" height="auto"/></br>
</p>

Hydra is a collection of benchmarks and tools to test the ability of different techniques to predict the hottest spot in programs.
Each benchmark consits of a single compilable C file that runs with one or more different inputs.
We provide execution counts for all the edges of each program, a [table](https://docs.google.com/spreadsheets/d/18C-DGg_l2gepRRfea_ivrW1o9qUde5fHHr6g3LIGn_I/edit?usp=sharing) that we call "*the Ground Truth*", plus scripts to extract and display these counts.

## How to produce the ground truth

If you want to regenerate the ground truth (which is located in [this file](./JSON%20Files/jotaiMerlinResults.json)), you must run the script [nisse_all.sh](./Benchmark%20Scripts/Jotai/nisse_all.sh), observing the following requirements:

- Clang 17 or newer
- A build of the [Nisse profiler](https://github.com/lac-dcc/Nisse)

Now, you need to adjust some parameters that suit your environment:

- In the [config.sh](./Benchmark%20Scripts/config.sh) configuration file:
  - `LLVM_INSTALL_DIR` (line 3): must point to your LLVM installation directory
  - `NISSE_SOURCE_DIR` (line 4): must point to your NISSE source directory
  - `NISSE_BUILD_DIR` (line 5): must point to your NISSE build directory
- In the [nisse_all.sh](./Benchmark%20Scripts/Jotai/nisse_all.sh) script:
  - `BASE_DIR` (line 3): must point to your hydra (this repository) source directory

With these configurations correctly set, running the script `nisse_all.sh` must generate a file named `jotaiMerlinResults2.json` in the folder `JSON Files`. You can compare it with the `jotaiMerlinResults.json` using `diff`.

## How to get the trivial heuristics results

There are two trivial heuristics implemented to guess the hottest blocks, which are:

- The random block heuristic: a random block from the program is considered the hottest block
- The most nested block heuristic: a random most nested loop header from the program is considered the hottest block

In order to run them, you must have the following requirements:

- CMake version 3.20 or newer
- Clang version 17 or newer

Also, there are some parameters to adjust:

- In the [build.sh](./build.sh) script:
  - `LLVM_INSTALL_DIR` (line 3): must point to your LLVM installation directory
- In the [run.sh](./run.sh) script:
  - `LLVM_INSTALL_DIR` (line 3): must point to your LLVM installation directory
  - `BASE_DIR` (line 4): must point to your hydra (this repository) source directory

With these configurations correctly set, you must run the scripts `build.sh` and `run.sh` in this order, and it must generate the JSONs `jotaiRandomBlock2.json` and `jotaiNestedBlock2.json` in the folder `JSON Files`. Also, they can be compared with their respective original files using `diff`.

## How to get the CSV table

With the `jotaiMerlinResults.json`, `jotaiRandomBlock.json` and `jotaiNestedBlock.json` files, you can generate a CSV file containing the detailed results by executing the `genCsv.py` python script.

## How to pretty print a JSON file

The script `print_jotai_json.py` receives a path to the JSON file as parameter and returns a pretty print of this file. For more options, run `python3 print_jotai_json.py --help`.

The output format is as follows:

Each file in the benchmark begins with its name, followed by a line with the number of executions of this file.

Then, for each execution, the following structure appears:

1. A line indicating the number of edges, denoted as `N`
2. `N` subsequent lines, each containing information about an edge. The format of each line is:
   - `u` -> `v` : `count`
   - Here, `u` and `v` represent the origin and destination blocks of the edge, respectively
   - `count` represents the number of times this edge is traversed during the execution.

There are also two other scripts in Python that are similar to `print_jotai_json.py`:

- The script `get_block_frequencies.py` takes the JSON input and compute the block frequencies based on the edges frequencies. The output is very similar to the `print_jotai_json.py` one, but for each block the output is only `u` : `count`. The critical edges blocks are omitted in the output.
- The script `get_hottest_block.py` not only compute the frequencies, but also compute what is the hottest blocks among every block in one execution. The output of one execution is a line, indicating the number `N` of hot blocks, followed by `N` lines, each one containing an ID of a hot block in that execution.
