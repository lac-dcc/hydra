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
    bbs = re.findall(bb_pattern, func_content, re.MULTILINE)
    return [clean_name(bb) for bb in bbs]

def get_profile_data(profile_dir: Path, func_name: str) -> Tuple[bool, str, bool, str]:
    edge_path = profile_dir / f"{func_name}.prof.full.edges"
    bb_path = profile_dir / f"{func_name}.prof.full.bb"
    
    has_edges = edge_path.exists()
    has_bb = bb_path.exists()
    
    edge_content = edge_path.read_text() if has_edges else ""
    bb_content = bb_path.read_text() if has_bb else ""
    
    return has_edges, edge_content, has_bb, bb_content

def generate_prompt(
    func_name: str,
    o0_func: str,
    opt_func: str,
    bb_set: List[str],
    has_edges: bool,
    edge_content: str,
    has_bb: bool,
    bb_content: str,
    opt_level: str
) -> str:
    
    num_bb = len(bb_set)
    bb_list = ", ".join(bb_set)
    
    prompt = f"""## Role:
You are a Compiler Engineer with over 20 years of experience  in compiler construction, LLVM internals, and advanced optimization techniques. 
You have deep expertise in low-level code generation, IR transformations, and  performance tuning for modern architectures, with a strong track record in static analysis, 
JIT compilation, and custom backend development.

## Task:
You are given a function that exists in two versions:
- Its original LLVM IR at -O0 (**{o0_func}**)
{'- Its basic block counts (.bb profile)\n' if has_bb else ''}{'- Its edge-level profile (.edges profile)\n' if has_edges else ''}- Its optimized LLVM IR at {opt_level.upper()} (**{opt_func}**)

Your goal is to project the profile information from the -O0 version onto the optimized version.

I have two questions regarding this function:

**Question 1 — Hot Block Estimation:**
Estimate which basic block in the optimized function would be the *"hottest"*,  where "hottest" means the block that is most likely to be executed most frequently.
Use the -O0 profile data ({'basic block counts' if has_bb else ''}{' and ' if has_bb and has_edges else ''}{'edge counts' if has_edges else ''}) to support your reasoning.

**Question 2 — Hotness Ranking:**
This optimized function has {num_bb} basic blocks: {bb_list}.
Could you sort this sequence of basic blocks by *hotness*?
That is, if a basic block \`bb_x\` appears ahead of another  block \`bb_y\`, it means you think \`bb_y\` will not be executed  more often than \`bb_x\`, though they might have equal frequency.

---

{('**Basic Block Profile (O0):**:\n\`\`\`text\n' + bb_content + '\n\`\`\`\n') if has_bb else ''}
{('**Edge Profile (O0):**:\n\`\`\`text\n' + edge_content + '\n\`\`\`\n') if has_edges else ''}

---

** Expected Output Format**:

- **Hottest Basic Block**: \`<name of the hottest basic block>\`

- **Sorted Basic Blocks by Hotness**:
\`\`\`text
1. <basic_block_1>
2. <basic_block_2>
3. ...
\`\`\`

- **Additional Notes**: 
  - Explain how you mapped old blocks to new blocks
  - Show your computed O0 \`freq(bb)\` table
  - Mention if any blocks were split, merged, or removed

---

## Instructions:

1) Please respond using the format above. 

2) **Ensure that the “Sorted Basic Blocks by Hotness” section  includes every one of the {num_bb} basic blocks listed in {bb_list},  without omission or duplication.**

3) After listing the sorted blocks, please provide a **summary line**  confirming that the total number of blocks in your list is exactly {num_bb}.

4) If any block from {bb_list} is missing or duplicated in your  sorted list, please explicitly acknowledge it and correct the list  before finalizing your answer.

5) Do not repeat or fully echo the entire function. Focus on  analysis. You may refer to specific lines or blocks but avoid  copying the whole code.

Thank you!
"""
    return prompt





parser = argparse.ArgumentParser(
    description="Generate LLM prompts for profile projection analysis"
)
parser.add_argument("--o0_file", type=str, required=True, help="Path to the -O0 LLVM IR file")
parser.add_argument("--opt_file", type=str, required=True, help="Path to the optimized LLVM IR file")
parser.add_argument("--profile_dir", type=str, required=True, help="Path to the profile directory")
parser.add_argument("--output_dir", type=str, default="./projection_prompts", help="Directory to save generated prompts")
parser.add_argument("--opt_level", type=str, default="o3", help="Optimization level (default: o3)")
args = parser.parse_args()

output_dir = Path(args.output_dir)
output_dir.mkdir(parents=True, exist_ok=True)

o0_content = Path(args.o0_file).read_text()
opt_content = Path(args.opt_file).read_text()

o0_functions = extract_functions(o0_content)
opt_functions = extract_functions(opt_content)

benchmark_name = Path(args.opt_file).stem

prompts = {}

for func_name, opt_func in opt_functions.items():
    print(f"Processing function: {func_name}")
    
    if func_name not in o0_functions:
        print(f"  Warning: Function {func_name} not found in O0 file, skipping")
        continue
    
    o0_func = o0_functions[func_name]
    
    bb_set = extract_basic_blocks(opt_func)
    if not bb_set:
        print(f"  Warning: No basic blocks found for {func_name}, skipping")
        continue
    
    profile_dir = Path(args.profile_dir)
    has_edges, edge_content, has_bb, bb_content = get_profile_data(profile_dir, func_name)
    
    if not (has_edges or has_bb):
        print(f"  Warning: No profile data found for {func_name}, skipping")
        continue
    
    prompt = generate_prompt(
        func_name=func_name,
        o0_func=o0_func,
        opt_func=opt_func,
        bb_set=bb_set,
        has_edges=has_edges,
        edge_content=edge_content,
        has_bb=has_bb,
        bb_content=bb_content,
        opt_level=args.opt_level
    )
    
    output_file = output_dir / f"{benchmark_name}_{func_name}_prompt.txt"
    output_file.write_text(prompt)
    
    metadata = {
        "benchmark_name": benchmark_name,
        "function_name": func_name,
        "optimization_level": args.opt_level,
        "num_basic_blocks": len(bb_set),
        "basic_blocks": bb_set,
        "has_edge_profile": has_edges,
        "has_bb_profile": has_bb
    }

    prompts[func_name] = {'prompt': prompt, 'metadata': metadata}
    
    print(f"  Generated prompt: {output_file}")

if prompts:
    json_output = output_dir / f"projection_prompts.json"
    with open(json_output, 'w', encoding='utf-8') as f:
        json.dump(prompts, f, indent=2, ensure_ascii=False)
    print(f"\nAll prompts saved to: {json_output}")