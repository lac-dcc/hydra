<p align="center">
  <img alt="Project Banner" src="./assets/images/Banner.png" width="95%" height="auto"/></br>
</p>

Hydra is a collection of benchmarks and tools to test the ability of different techniques to predict the hottest spot in programs.
Each benchmark in this program runs with one or more different inputs.
We provide execution counts for all the edges of each program, plus scripts to extract and display these counts.

## Hotspot Yielding Dynamic Runtime Analysis

### How to produce the JSON file

In order to generate a JSON file, you will need two things:

- The Nisse profiler (https://github.com/lac-dcc/Nisse)
- Some benchmark (for now, we are using only https://github.com/lac-dcc/merlin/tree/main/test/jotai_benchmarks)

In the [config.sh](./Benchmark%20Scripts/config.sh) file, there is a variable called `NISSE_SOURCE_DIR`, that points to the Nisse source directory folder. Also, you may need to change `NISSE_BUILD_DIR` accordingly.

As for the benchmark, you may need to change the variable `BENCH_DIR` in the [nisse_all.sh](./Benchmark%20Scripts/Jotai/nisse_all.sh) file, pointing to the respectively benchmark folder. Note that this script is configured to run with any subset of the [Jotai benchmarks](https://github.com/lac-dcc/jotai-benchmarks).

### How to pretty print a JSON file

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