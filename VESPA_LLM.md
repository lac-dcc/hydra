# Hot Basic Block Analysis Methodology (LLM Based approach)

Tooling:
--------
This analysis was implemented using [Microsoft GenAIScript](https://github.com/microsoft/genaiscript),
a TypeScript-based framework for composing prompt-driven AI workflows. It enables structured, 
repeatable prompts, programmatic control over prompt logic, and schema validation.

Model:
------
- Model Name: OpenAI GPT-4 Vision variant
- Deployment: Azure OpenAI Service
- Model Identifier: azure:gpt-4o_2024-11-20
- Mode: Text-only (no image input used)
- More Info: https://ai.azure.com/catalog/models/gpt-4o
- Parameters: Not publicly disclosed (as per OpenAI policy)
- Temperature: 0 (deterministic behavior)
- Response Type: JSON with enforced schema
- Max Tokens: 16,384

Methodology:
------------
1. The script filters `.ll` files from the input list and extracts LLVM IR functions using 
   regular expressions based on `define` blocks.
2. For each function, basic block labels are parsed via regex.
3. Each function and its corresponding basic blocks are used to dynamically generate a prompt.
   The prompt assigns the model the role of a seasoned compiler engineer and asks:
   - Which basic block is most likely the hottest (frequently executed)?
   - Can it rank all basic blocks by likely execution frequency?
4. The prompt is passed to GPT-4o via GenAIScript's `runPrompt` interface with a strict JSON schema:
   - `hottestBB`: block name + explanation
   - `bbOrderByHotness`: ordered list of blocks with explanations
   - `benchmarkInfo`: file/function identifiers
   - `additionalNotes`: optional
5. The LLM response is parsed and saved into a structured `.json` file, one per benchmark.

Prompt:
------------
```
## Role: You are a Compiler Engineer with over 20 years of experience 
in compiler construction, LLVM internals, and advanced optimizations techniques. 
You have deep expertise in low-level code generation, IR transformations, and 
performance tuning for modern architectures, with a strong track record in static analysis, 
JIT compilation, and custom backend development.

## Task: You are given a function written in LLVM’s intermediate representation.
You are asked to analyze the function and provide insights on its basic blocks.

I have two questions regarding this function **${completeFunc}**:

Question 1. *Hot Block Estimation*:
Could you guess which basic block would be the *"hottest"*, 
where "hottest" means the basic block that is more likely to 
be executed more often?

Question 2. *Hotness Ranking*:
This function has ${bbSet.length} basic blocks: ${bbSet.join(", ")}.
Could you sort this sequence of basic blocks by *hotness*?
That is, if a basic block \`bb_x\` appears ahead of another 
block \`bb_y\`, it means you think \`bb_y\` will not be executed 
more often than \`bb_x\`, though they might have equal frequency.

**Reasoning and Heuristics**:
    Please provide a brief explanation of your reasoning for the
    hottest basic block and the order of the other basic blocks as 
    you did. If relevant, include any insights from control-flow 
    structure, loop presence, loop header, branching behavior, or 
    any other heuristics you applied during your analysis.
```

## Diagram:
--------
```
        +---------------------------+
        |    .ll Benchmark Files    |
        +-------------+-------------+
                    |
                    v
        +---------------------------+
        |  GenAIScript Script Init  |
        |  (load files, set model)  |
        +-------------+-------------+
                    |
                    v
+-----------------------------------------------------------+
|                   For Each Benchmark                      |
|                                                           |
|        +---------------------------+                      |
|        | Extract Functions & BBs   |                      |
|        | - Regex for `define`      |                      |
|        | - Regex for labels        |                      |
|        +-------------+-------------+                      |
|                    |                                      |
|                    v                                      |
|   +----------------------------------------------+        |
|   |        For Each Function in Benchmark        |        |
|   |                                              |        |
|   |   +---------------------------+              |        |
|   |   | Build Prompt w/Context    |              |        |
|   |   | - Function as input       |              |        |
|   |   | - 2 questions for the LLM |              |        |
|   |   +-------------+-------------+              |        |
|   |                 |                            |        |
|   |                 v                            |        |
|   |   +---------------------------+              |        |
|   |   | Run GPT-4o via `runPrompt`|              |        |
|   |   | - Deterministic output    |              |        |
|   |   | - Schema validation       |              |        |
|   |   +-------------+-------------+              |        |
|   |                 |                            |        |
|   |                 v                            |        |
|   |   +---------------------------+              |        |
|   |   |   Parse and Save JSON     |              |        |
|   |   | - `hottestBB` & ranking   |              |        |
|   |   | - Justifications          |              |        |
|   |   +---------------------------+              |        |
|   +----------------------------------------------+        |
|                      |                                    |
|                      v                                    |
|           +---------------------------+                   |
|           | Generates JSON Report for |                   |
|           |   the Current Benchmark   |                   |
|           +---------------------------+                   |
+-----------------------------------------------------------+

```
