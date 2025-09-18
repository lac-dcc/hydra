// npx --yes genaiscript run projection <file|folder>
import * as fs from "fs";
import * as path from "path";

script({
  temperature: 0,
  provider: "openai",
  model: "vision",
});

const cleanName = (s: string) => s.replace(/`/g, "");

const compareBlockSets = (original: string[], predicted: string[]) => {
  const origClean = original.map(cleanName);
  const predClean = predicted.map(cleanName);
  const countOccurrences = (arr: string[]) =>
    arr.reduce((acc, name) => {
      acc[name] = (acc[name] ?? 0) + 1;
      return acc;
    }, {} as Record<string, number>);
  const origCounts = countOccurrences(origClean);
  const predCounts = countOccurrences(predClean);
  const duplicates = Object.entries(predCounts)
    .filter(([_, count]) => count > 1)
    .map(([name]) => name);
  const missing = origClean.filter(name => !(name in predCounts));
  const extra = predClean.filter(name => !(name in origCounts));
  const discrepancy = duplicates.length > 0 || missing.length > 0 || extra.length > 0;
  return { duplicates, missing, extra, discrepancy };
};

const saveJsonObjectToArrayFile = (filePath: string, newObj: any) => {
  let jsonArray: any[] = [];
  if (fs.existsSync(filePath)) {
    const existingContent = fs.readFileSync(filePath, "utf-8");
    try {
      jsonArray = JSON.parse(existingContent);
      if (!Array.isArray(jsonArray)) throw new Error("Expected JSON array");
    } catch (e) {
      console.error("Failed to parse existing JSON file:", e);
      return;
    }
  }
  jsonArray.push(newObj);
  fs.writeFileSync(filePath, JSON.stringify(jsonArray, null, 2));
};

const parseMarkdownToJson = (
  markdownContent: string,
  fileNameWithoutExt: string,
  funcName: string,
  tokenCount: number,
  numBB: number,
  bbSet: string[]
) => {

  // -----------------------------
  //  Extract hottest BB
  // -----------------------------  
  const hottestBBMatch = markdownContent.match(/\*\*Hottest Basic Block\*\*:\s*`?([A-Za-z_][A-Za-z0-9_.]*)`?/);
  const hottestBB = cleanName(hottestBBMatch?.[1] ?? "");
  
  
  // ---------------------------------
  //  Extract sorted BBs from markdown
  // --------------------------------- 
  const hotnessBlockMatch =
    markdownContent.match(/- \*\*Sorted Basic Blocks by Hotness\*\*:\s*```text\s*([\s\S]*?)```/m) ??
    markdownContent.match(/- \*\*Sorted Basic Blocks by Hotness\*\*:\s*([\s\S]+?)(?:- \*\*Additional Notes\*\*|$)/);

  let bbLines: string[] = [];
  if (hotnessBlockMatch?.[1]) {
    bbLines = hotnessBlockMatch[1]
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => /^\d+\.\s+/.test(line))
      .map((line) => cleanName(line.replace(/^\d+\.\s+/, "")));
  }

  // -----------------------------
  // Compare predicted vs original set
  // -----------------------------
  const { duplicates, missing, extra, discrepancy } = compareBlockSets(bbSet, bbLines);
  if (discrepancy) {
    console.warn(`Discrepancy in ${funcName}: Missing [${missing.join(", ")}], Extra [${extra.join(", ")}], Duplicates [${duplicates.join(", ")}]`);
  }

  // -----------------------------
  // Extract additional notes
  // -----------------------------
  const additionalNotesMatch = markdownContent.match(/- \*\*Additional Notes\*\*:\s*([\s\S]+)/);
  const additionalNotes = additionalNotesMatch ? cleanName(additionalNotesMatch[1] ?? "").trim() : "";

  // -----------------------------
  // Check token count against limit
  // ----------------------------- 
  const exceed = tokenCount > 131072;

  // -----------------------------
  // Build output object + schema
  // ----------------------------- 
  const originalSet = [...bbSet].sort().join(", ");
  const predictedSet = [...bbLines].sort().join(", ");

  const jsonObj = {
      benchmarkInfo: {
        benchmarkName: fileNameWithoutExt,
        funcName,
        numBB,
        originalSet,
        predictedSet,
        tokenCount,
        discrepancy,
        duplicates,
        missing,
        extra,
        exceed,
      },
      hottestBB: { bbName: hottestBB },
      bbOrderByHotness: bbLines.map((name) => ({ name })),
      additionalNotes,
    };

    const jsonSchema = {
    type: "object",
    properties: {
      benchmarkInfo: {
        type: "object",
        properties: {
          benchmarkName: {
            type: "string",
            enum: [fileNameWithoutExt],
          },
          funcName: {
            type: "string",
            enum: [funcName],
          },
          numBB: {
            type: "number",
            enum: [numBB],
          },
          originalSet: {
            type: "string",
            enum: [originalSet],
          },
          predictedSet: {
            type: "string",
            enum: [predictedSet],
          },
          tokenCount: {
            type: "number",
            enum: [tokenCount],
          },
          discrepancy:{
            type: "boolean",
            enum: [discrepancy],
          },
          duplicates: { 
            type: "array", 
            items: { type: "string" } 
          },
          missing: { 
            type: "array", 
            items: { type: "string" } 
          },
          extra: { 
            type: "array", 
            items: { type: "string" } 
          },
          exceed:{
            type: "boolean",
            enum: [exceed],
          }
        },
        required: [
          "benchmarkName", "funcName", "numBB", "originalSet", 
          "predictedSet", "tokenCount", "discrepancy", "duplicates", 
          "missing", "extra", "exceed"
        ],
      },
      hottestBB: {
        type: "object",
        properties: {
          bbName: {
            type: "string",
            enum: bbSet,
          },
        },
        required: ["bbName"],
      },
      bbOrderByHotness: {
        type: "array",
        items: {
          type: "object",
          properties: {
            name: {
              type: "string",
              enum: bbSet,
            },
          },
        },
        required: ["bbOrderByHotness"],
      },
      additionalNotes: {
        type: "string",
      },
    },
    required: [
      "benchmarkInfo","hottestBB", 
      "bbOrderByHotness", "additionalNotes"
    ],
  };

  return { jsonObj, jsonSchema };
};

const extractFunction = (fileContent: string, funcName: string): string => {
  const funcs = fileContent
    .split(/; Function Attrs:/gm)
    .map((f) => f.match(/(define\s.*?\{[\s\S]*?\})/s)?.[0] ?? "")
    .filter(Boolean);
  return funcs.find(f => f.includes(`@${funcName}(`)) ?? "";
};

const processFiles = async (env: ExpansionVariables) => {
  const output = env.output;
  const inputItems = env.files;

  // Accept folder or file
  const filesToAnalyze: string[] = [];
  for (const item of inputItems) {
    if (fs.statSync(item.filename).isDirectory()) {
      for (const f of fs.readdirSync(item.filename)) {
        if (f.endsWith(".ll")) filesToAnalyze.push(path.join(item.filename, f));
      }
    } else {
      filesToAnalyze.push(item.filename);
    }
  }

  for (const optFile of filesToAnalyze) {
    const filePath = path.dirname(optFile);
    const fileNameWithoutExt = path.basename(optFile, path.extname(optFile));
    const optLevel = path.basename(path.dirname(optFile)); // o0, o1, o2, o3
    const benchmarkName = fileNameWithoutExt;

    const optContent = fs.readFileSync(optFile, "utf-8");
    const o0File = optFile.replace(`/New/${optLevel}/`, `/New/o0/`);
    // const profileDir = `/home/anmoreira/hydra/Experiments/Profile_Projection/Profiles/o0/${benchmarkName}`;

    // Go up from .../LL_Files/New/o1/... to .../Profile_Projection
    const baseRoot = path.resolve(optFile, "../../../../"); 
    // Build the profile dir path
    const profileDir = path.join(baseRoot, "Profiles", "o0", benchmarkName);

    if (!fs.existsSync(o0File)) {
      console.warn(`Skipping ${benchmarkName}: Missing -O0 version at ${o0File}`);
      continue;
    }

    const o0Content = fs.readFileSync(o0File, "utf-8");

    const optFuncSet = optContent
      .split(/; Function Attrs:/gm)
      .map((func) => func.match(/(define\s.*?\{[^}]*\})/s)?.[0] ?? null)
      .filter((x) => x !== null);

    output.heading(1, `Projecting from ${optLevel} for ${benchmarkName}`);

    for (const optFunc of optFuncSet) {
      const funcNameMatch = optFunc.match(/@([a-zA-Z_][\w\.]*)\(/m);
      const funcName = funcNameMatch?.[1];
      if (!funcName) continue;

      const bbSetMatch = optFunc.match(/^\s*([A-Za-z_][A-Za-z0-9_.]*):/gm);
      const bbSet = bbSetMatch ? bbSetMatch.map(l => l.trim().replace(/:$/, "")) : [];
      const numBB = bbSet.length;

      const profilePath = `${profileDir}/${funcName}.prof.full.edges`;
      if (!fs.existsSync(profilePath)) {
        console.warn(`Skipping ${funcName}: Missing profile at ${profilePath}`);
        continue;
      }

      const o0Func = extractFunction(o0Content, funcName);
      if (!o0Func) {
        console.warn(`Skipping ${funcName}: Not found in -O0 file (${o0File})`);
        continue;
      }

      const profileContent = fs.readFileSync(profilePath, "utf-8");

      output.heading(3, `Function: ${funcName}`);

      try {
        const res = await runPrompt(
          (ctxt) => {
            const o0def = ctxt.def("original", o0Func, { maxTokens: 65536 });
            const oNdef = ctxt.def("optimized", optFunc, { maxTokens: 65536 });
            const profdef = ctxt.def("profile", profileContent, { maxTokens: 16384 });
            ctxt.$`
## Role
You are a Compiler Engineer with over 20 years of experience in compiler construction, LLVM internals, and profile-guided optimization.
You are an expert in CFG analysis, IR transformations, and mapping profile data across optimized code versions.

## Task
You are given:
- The original LLVM IR function compiled at -O0
- Its edge-level profile in the format \`SRC -> DST : COUNT\`
- The same function compiled at ${optLevel.toUpperCase()} (optimized LLVM IR)

### Step 1 — Build O0 block frequencies
Compute the approximate execution frequency of each basic block in the O0 function as:

\`\`\`
freq(bb) = sum(counts of all incoming edges to bb)
\`\`\`

If a block has no incoming edges (entry block), estimate its frequency from its outgoing edges.

### Step 2 — Project frequencies into ${optLevel.toUpperCase()}
Map the O0 basic blocks to their corresponding basic blocks in the optimized version.
- If an O0 block was split, distribute its count to all resulting optimized blocks.
- If several O0 blocks were merged into one optimized block, sum their counts.
- If any block disappeared, note it and distribute its weight to successors.

### Step 3 — Sort and output
Produce the list of all optimized basic blocks sorted by projected execution frequency.

---

**Original Function (-O0):**
\`\`\`llvm
${o0def}
\`\`\`

**Edge Profile (O0):**
\`\`\`text
${profdef}
\`\`\`

**Optimized Function (${optLevel.toUpperCase()}):**
\`\`\`llvm
${oNdef}
\`\`\`

---

## Expected Output Format

- **Hottest Basic Block**: \`<name of the hottest basic block in the optimized function>\`

- **Sorted Basic Blocks by Hotness**:
\`\`\`text
1. <basic_block_1>
2. <basic_block_2>
3. ...
\`\`\`

- **Additional Notes**: 
  - Show your computed O0 \`freq(bb)\` table
  - Explain how you mapped old blocks to new ones
  - Mention if any blocks were split, merged, or removed

- **Summary**: Confirm your list contains all optimized function blocks exactly once.
`;
          },
          { temperature: 0, model: "vision", systemSafety: true, responseType: "text" }
        );

        const tokenCount = res.usage?.total ?? 0;
        output.detailsFenced("LLM Output", res.text);

        const jsonObj = parseMarkdownToJson(res.text, benchmarkName, funcName, tokenCount, numBB, bbSet).jsonObj;
        const outFileName = `${filePath}/${benchmarkName}_${optLevel}_projection.json`;
        saveJsonObjectToArrayFile(outFileName, jsonObj);
      } catch (e) {
        console.error(`Error projecting profile for ${funcName}:`, e);
      }
    }
  }
  output.heading(1, "End of projection");
};

await processFiles(env).catch((err) =>
  console.error("Error processing files:", err)
);