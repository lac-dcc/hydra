import re
import os
import argparse
import json
from pathlib import Path
from typing import List, Dict, Optional, Tuple

def clean_name(s: str) -> str:
    return s.replace("`", "") if s else ""

def extract_functions(file_content: str) -> Dict[str, str]:
    functions = {}
    
    function_pattern = r'define[^@]*@([a-zA-Z_][\w\.]*)\([^{]*\{[\s\S]*?\n\}'
    matches = re.finditer(function_pattern, file_content)
    
    for match in matches:
        func_name = match.group(1)
        func_body = match.group(0)
        functions[func_name] = func_body
    
    return functions

def extract_basic_blocks(func_content: str) -> List[str]:
    bb_pattern = r'^\s*([A-Za-z_][A-Za-z0-9_.]*):'
    matches = re.findall(bb_pattern, func_content, re.MULTILINE)
    return [clean_name(match.strip().rstrip(':')) for match in matches]

def generate_prompt(func_content: str, func_name: str, bb_set: List[str]) -> str:
    num_bb = len(bb_set)
    bb_list = ", ".join(bb_set)
    
    prompt = f"""## Role:
You are a Compiler Engineer with over 20 years of experience 
in compiler construction, LLVM internals, and advanced optimizations techniques. 
You have deep expertise in low-level code generation, IR transformations, and  performance tuning for modern architectures, with a strong track record in static analysis,  JIT compilation, and custom backend development.

## Task: You are given a function written in LLVM’s intermediate representation. You are asked to analyze the function and provide insights on its basic blocks.

I have two questions regarding this function **{func_content}**:

Question 1. *Hot Block Estimation*:
Could you guess which basic block would be the *"hottest"*, 
where "hottest" means the basic block that is more likely to 
be executed more often?

Question 2. *Hotness Ranking*:
This function has {num_bb} basic blocks: {bb_list}.
Could you sort this sequence of basic blocks by *hotness*?
That is, if a basic block \`bb_x\` appears ahead of another 
block \`bb_y\`, it means you think \`bb_y\` will not be executed 
more often than \`bb_x\`, though they might have equal frequency.

---

** Expected Output Format**:

- **Hottest Basic Block**: \`<name of the hottest basic block>\`

- **Sorted Basic Blocks by Hotness**:
\`\`\`text
1. <basic_block_1>
2. <basic_block_2> 
3. ...
\`\`\`

- **Additional Notes**: <any additional notes or comments>
---

## Instructions:

1) Please respond using the format above. 

2) **Ensure that the “Sorted Basic Blocks by Hotness” section 
includes every one of the {num_bb} basic blocks listed in {bb_list}, 
without omission or duplication.**

3) After listing the sorted blocks, please provide a **summary line** 
confirming that the total number of blocks in your list is exactly {num_bb}.

4) If any block from {bb_list} is missing or duplicated in your 
sorted list, please explicitly acknowledge it and correct the list 
before finalizing your answer.

5) Do not repeat or fully echo the entire function. Focus on 
analysis. You may refer to specific lines or blocks but avoid 
copying the whole code.

Thank you!
"""
    return prompt




parser = argparse.ArgumentParser(
    description="Generate LLM prompts for profile prediction analysis"
)
parser.add_argument("--ir_file", type=str, required=True, help="Path to the LLVM IR file")
parser.add_argument("--output_dir", type=str, default="./prediction_prompts", help="Directory to save generated prompts")
args = parser.parse_args()

output_dir = Path(args.output_dir)
output_dir.mkdir(parents=True, exist_ok=True)

ir_content = Path(args.ir_file).read_text()
ir_functions = extract_functions(ir_content)

benchmark_name = Path(args.ir_file).stem

prompts = {}

for func_name, func_body in ir_functions.items():
    print(f"Processing function: {func_name}")
    bb_set = extract_basic_blocks(func_body)
    if not bb_set:
        print(f"  Warning: No basic blocks found for {func_name}, skipping")
        continue
    
    prompt = generate_prompt(
        func_content=func_body,
        func_name=func_name,
        bb_set=bb_set
    )

    output_file = output_dir / f"{benchmark_name}_{func_name}_prompt.txt"
    output_file.write_text(prompt)

    metadata = {
        "benchmark_name": benchmark_name,
        "function_name": func_name,
        "num_basic_blocks": len(bb_set),
        "basic_blocks": bb_set
    }

    prompts[func_name] = {'prompt': prompt, 'metadata': metadata}

    print(f"  Generated prompt: {output_file}")

if prompts:
    json_output = output_dir / f"prediction_prompts.json"
    with open(json_output, 'w', encoding='utf-8') as f:
        json.dump(prompts, f, indent=2, ensure_ascii=False)
    print(f"\nAll prompts saved to: {json_output}")