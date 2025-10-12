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

type ParsedResult = {
  jsonObj: {
    benchmarkInfo: {
      benchmarkName: string;
      funcName: string;
    };
    hottestBB: {
      bbName: string;
    };
    bbOrderByHotness: { name: string }[];
    additionalNotes: string;
  };
  jsonSchema: any;
};

export const parseMarkdownToJson = (
  markdownContent: string,
  fileNameWithoutExt: string,
  funcName: string,
  tokenCount:number,
  numBB: number,
  bbSet: string[]
): ParsedResult => {

  // -----------------------------
  //  Extract hottest BB
  // -----------------------------

  const hottestBBMatch = markdownContent.match(
    /\*\*Hottest Basic Block\*\*:\s*`?([A-Za-z_][A-Za-z0-9_.]*)`?/
  );
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
  // let discrepancy = !arraysHaveSameValues(bbLines, bbSet);
  const {duplicates, missing, extra, discrepancy} = compareBlockSets(bbSet, bbLines);
  if (discrepancy) {
    console.warn(
      `Discrepancy found in ${funcName}: ` +
      `Missing: [${missing.join(", ")}] | ` +
      `Extra: [${extra.join(", ")}] | ` +
      `Duplicates: [${duplicates.join(", ")}]`
    );
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
      exceed
    },
    hottestBB: {
      bbName: hottestBB,
    },
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
  const dbg = env.dbg;
  const output = env.output;
  const inputItems = env.files;

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
    const optLevel = path.basename(path.dirname(optFile)); 
    const benchmarkName = fileNameWithoutExt;

    const optContent = fs.readFileSync(optFile, "utf-8");
    const o0File = optFile.replace(`/New/${optLevel}/`, `/New/o0/`);

    const baseRoot = path.resolve(optFile, "../../../../"); 
    const profileDir = path.join(baseRoot, "Profiles", "o0", benchmarkName);

    if (!fs.existsSync(o0File)) {
      console.warn(`Skipping ${benchmarkName}: Missing -O0 version at ${o0File}`);
      continue;
    }

    const o0Content = fs.readFileSync(o0File, "utf-8");

    // Extract functions from the file content
    const optFuncSet = optContent
    .split(/; Function Attrs:/gm)
    .map((chunk) => {
        const match = chunk.match(/(define\s.*?\{[^}]*\})/s);
        return match ? match[0] : null;
    })
    .filter((fn): fn is string => fn !== null);

    console.log(optFuncSet);
    dbg(optFuncSet);

    output.heading(1, `Projecting O0 profile data onto ${optLevel.toUpperCase()} for ${benchmarkName}`);

    let funCounter = 1;
    for (const optFunc of optFuncSet) {
      const funcNameMatch = optFunc.match(/@([a-zA-Z_][\w\.]*)\(/m);
      const funcName = funcNameMatch?.[1];
      if (!funcName) {
        output.error("Function name not found");
        continue;
      }

      const bbSetMatch = optFunc.match(/^\s*([A-Za-z_][A-Za-z0-9_.]*):/gm);
      const bbSet = bbSetMatch ? bbSetMatch.map(l => l.trim().replace(/:$/, "")) : [];
      const numBB = bbSet.length;
      dbg(`bbSet: ${bbSet}`);

      const edgeProfilePath = `${profileDir}/${funcName}.prof.full.edges`;
      const bbProfilePath = `${profileDir}/${funcName}.prof.full.bb`;

      const hasEdges = fs.existsSync(edgeProfilePath);
      const hasBB = fs.existsSync(bbProfilePath);

      if (!hasEdges && !hasBB) {
        console.warn(`Skipping ${funcName}: Missing both edge and bb profiles`);
        continue;
      }

      const o0Func = extractFunction(o0Content, funcName);
      if (!o0Func) {
        console.warn(`Skipping ${funcName}: Not found in -O0 file (${o0File})`);
        continue;
      }

      const edgeContent = hasEdges ? fs.readFileSync(edgeProfilePath, "utf-8") : "";
      const bbContent = hasBB ? fs.readFileSync(bbProfilePath, "utf-8") : "";

      const bbList = bbSet.join(", ");

      output.heading(
        3,
        `${funCounter}) Analysis report of function: ${funcName}`
      );
      output.detailsFenced("Function being projected:", optFunc);
      output.detailsFenced(
        `Function ${funcName} has ${numBB} blocks:`,
        bbSet.join(", ")
      );

      funCounter += 1;
      console.log("Function content: \n", optFunc);

      try {
        const res = await runPrompt(
          (ctxt) => {
            const o0def = ctxt.def("original_function_o0", o0Func, { maxTokens: 65536 });
            const oNdef = ctxt.def("optimized_function", optFunc, { maxTokens: 65536 });
            if (hasBB) ctxt.def("bb_profile", bbContent, { maxTokens: 8192 });
            if (hasEdges) ctxt.def("edge_profile", edgeContent, { maxTokens: 16384 });

            ctxt.$` 
## Role:
You are a Compiler Engineer with over 20 years of experience 
in compiler construction, LLVM internals, and advanced optimization techniques. 
You have deep expertise in low-level code generation, IR transformations, and 
performance tuning for modern architectures, with a strong track record in static analysis, 
JIT compilation, and custom backend development.

## Task:
You are given a function that exists in two versions:
- Its original LLVM IR at -O0 (**${o0def}**)
${hasBB ? "- Its basic block counts (.bb profile)\n" : ""}${hasEdges ? "- Its edge-level profile (.edges profile)\n" : ""}- Its optimized LLVM IR at ${optLevel.toUpperCase()} (**${oNdef}**)

Your goal is to project the profile information from the -O0 version onto the optimized version.

I have two questions regarding this function:

**Question 1 — Hot Block Estimation:**
Estimate which basic block in the optimized function would be the *"hottest"*, 
where "hottest" means the block that is most likely to be executed most frequently.
Use the -O0 profile data (${hasBB ? "basic block counts" : ""}${hasBB && hasEdges ? " and " : ""}${hasEdges ? "edge counts" : ""}) to support your reasoning.

**Question 2 — Hotness Ranking:**
This optimized function has ${numBB} basic blocks: ${bbList}.
Could you sort this sequence of basic blocks by *hotness*?
That is, if a basic block \`bb_x\` appears ahead of another 
block \`bb_y\`, it means you think \`bb_y\` will not be executed 
more often than \`bb_x\`, though they might have equal frequency.

---

${hasBB ? `**Basic Block Profile (O0):**\n\`\`\`text\n${bbContent}\n\`\`\`\n` : ""}
${hasEdges ? `**Edge Profile (O0):**\n\`\`\`text\n${edgeContent}\n\`\`\`\n` : ""}

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

2) **Ensure that the “Sorted Basic Blocks by Hotness” section 
includes every one of the ${numBB} basic blocks listed in ${bbList}, 
without omission or duplication.**

3) After listing the sorted blocks, please provide a **summary line** 
confirming that the total number of blocks in your list is exactly ${numBB}.

4) If any block from ${bbList} is missing or duplicated in your 
sorted list, please explicitly acknowledge it and correct the list 
before finalizing your answer.

5) Do not repeat or fully echo the entire function. Focus on 
analysis. You may refer to specific lines or blocks but avoid 
copying the whole code.

Thank you!
`;
          },
          { temperature: 0, model: "vision", systemSafety: true, responseType: "text" }
        );

        const tokenCount = res.usage?.total ?? 0;
        output.detailsFenced("Token Count: ", `${tokenCount}`);
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
