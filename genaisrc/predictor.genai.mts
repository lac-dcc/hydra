import * as fs from "fs";
script({
  temperature: 0,
  provider: "openai",
  model: "vision",
});

// Helper function to save or append to a file
const saveToFile = (filePath:string, content:string) => {
  if (!fs.existsSync(filePath)) {
    fs.writeFileSync(filePath, content);
  } else {
    fs.appendFileSync(filePath, content);
  }
};

// Main function for processing the files
const processFiles = async (env:ExpansionVariables) => {
  const dbg = env.dbg;
  const output = env.output;
  const files = env.files;
  const filesToAnalyze = files.filter((file) => file.filename.endsWith(".ll"));

  // Iterate over the filtered files
  for (const file of filesToAnalyze) {
    const filePath = path.dirname(file.filename);
    const fileName = path.basename(file.filename);
    const fileNameWithoutExt = path.basename(
      file.filename,
      path.extname(file.filename)
    );

    console.log(`Input file name: ${fileName}`);
    console.log(`Input file path: ${filePath}`);
    console.log(`Input file name without extension: ${fileNameWithoutExt}`);

    // Extract functions from the file content
    const funcSet = file.content
      .split(/; Function Attrs:/gm)
      .map((func) => {
        const match = func.match(/(define\s.*?\{[^}]*\})/s);
        return match ? match[0] : null;
      })
      .filter((name) => name !== null);

    console.log(funcSet);
    dbg(funcSet);

    output.heading(
      1,
      `Analyzing ${funcSet.length} functions of benchmark: ${fileNameWithoutExt}`
    );

    // Iterate over each function for deeper analysis
    for (const func of funcSet) {
      const funcNameMatch = func.match(/@([a-zA-Z_][\w\.]*)\(/m);
      const funcName = funcNameMatch ?.[1];

      if (!funcName) {
        output.error("Function name not found");
        continue;
      }

      const bbSetMatch = func.match(/^([a-zA-Z_][\w\.]*):(?=\s|$)/gm);
      const bbSet = bbSetMatch ? bbSetMatch.map((id) => id.slice(0, -1)) : [];
      dbg(`bbSet: ${bbSet}`);

      output.heading(3, `Analysis report of function: ${funcName}`);
      output.detailsFenced("Function being analized:",func);

      console.log("Function content: \n", func);

      // Run the prompt for hot block estimation and ranking
      try {
        const res = await runPrompt(
          (ctxt) => {
            const completeFunc = ctxt.def("function", func,{maxTokens:16000});
            ctxt.$` ## Role:
            You are a Compiler Engineer with over 20 years of experience 
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
            `;
          },
          {
            temperature: 0,
            model: "vision",
            systemSafety: true,
            responseType: "json_schema",
            responseSchema: {
              type: "object",
              properties: {
                benchmarkInfo: {
                  type: "object",
                  properties: {
                    benchmarkName: {
                      type: "string",
                      enum: [fileNameWithoutExt],
                    },
                    funcName: { type: "string", enum: [funcName] },
                  },
                  required: ["benchmarkName", "funcName"],
                },
                hottestBB: {
                  type: "object",
                  properties: {
                    bbName: { type: "string", enum: bbSet },
                    explanation: { type: "string" },
                  },
                  required: ["bbName", "explanation"],
                },
                bbOrderByHotness: {
                  type: "array",
                  items: {
                    type: "object",
                    properties: {
                      name: { type: "string", enum: bbSet },
                      explanation: { type: "string" },
                    },
                    required: ["name", "explanation"],
                  },
                },
                additionalNotes: { type: "string" },
              },
              required: ["hottestBB", "bbOrderByHotness"],
            },
          }
        );

        output.detailsFenced("LLM Output:",res.json);
        const data: {
          hottestBB: { explanation: string; name: string }[];
        } = res.json;

        console.log("Response Json: ", res.json);
        // Define the output file name
        const outFileName = `${filePath}/${fileNameWithoutExt}.json`;

        // Save or append the results to the file
        saveToFile(outFileName, res.text);
      } catch (error) {
        console.error("Error during prompt execution:", error);
        output.error("Error analyzing function");
      }
    }
  }
};

await processFiles(env).catch((err) =>
  console.error("Error processing files:", err)
);
