// npx --yes genaiscript run predictor <file path | folder path>
import * as fs from "fs";
// npm install js-tiktoken
import {encodingForModel} from "js-tiktoken";

script({
  temperature: 0,
  provider: "openai",
  model: "vision", //"github:openai/gpt-4o",//"vision",
});

const countTokens = (text: string): number => {
  const enc = encodingForModel("gpt-4-turbo-preview");
  const tokens = enc.encode(text).length;
  return tokens;
};

const clean = (s:string) => s.replace(/`/g, "");

const arraysHaveSameValues = (arr1: string[], arr2: string[]): boolean => {
  if (arr1.length !== arr2.length) return false;

  const sorted1 = [...arr1].map(s => clean(s.toLowerCase().trim())).sort();
  const sorted2 = [...arr2].map(s => clean(s.toLowerCase().trim())).sort();

  return sorted1.every((val, idx) => val === sorted2[idx]);
};


const saveJsonObjectToArrayFile = (filePath: string, newObj: any) => {
  let jsonArray: any[] = [];

  if (fs.existsSync(filePath)) {
    const existingContent = fs.readFileSync(filePath, "utf-8");
    try {
      jsonArray = JSON.parse(existingContent);
      if (!Array.isArray(jsonArray)) {
        throw new Error("Expected JSON array");
      }
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
  const hottestBBMatch = markdownContent.match(
    /\*\*Hottest Basic Block\*\*:\s*`?([a-zA-Z_][\w\.]*)`?/
  );
  const hottestBB = (hottestBBMatch?.[1] ?? "").replace(/`/g, "");

  const hotnessBlockMatch =
    markdownContent.match(/- \*\*Sorted Basic Blocks by Hotness\*\*:\s*```text\s*([\s\S]*?)```/m) ??
    markdownContent.match(/- \*\*Sorted Basic Blocks by Hotness\*\*:\s*([\s\S]+?)(?:- \*\*Additional Notes\*\*|$)/);

  let bbLines: string[] = [];

  if (hotnessBlockMatch?.[1]) {
    bbLines = hotnessBlockMatch[1] 
      .split("\n")
      .map((line) => line.trim())
      .filter((line) => /^\d+\.\s+/.test(line))
      .map((line) => line.replace(/^\d+\.\s+/, ""));
    bbLines = bbLines.map(name => name.replace(/`/g, ""));
  }

  let discrepancy = !arraysHaveSameValues(bbLines, bbSet);
  let exceed = tokenCount > 131072;
  const additionalNotesMatch = markdownContent.match(/- \*\*Additional Notes\*\*:\s*([\s\S]+)/);
  const additionalNotes = additionalNotesMatch ? (additionalNotesMatch[1] ?? "").trim() : "";

  const originalSet = bbSet.join(", ");
  const predictedSet = bbLines.join(", ");

  const jsonObj = {
    benchmarkInfo: {
      benchmarkName: fileNameWithoutExt,
      funcName,
      numBB,
      originalSet,
      predictedSet,
      tokenCount,
      discrepancy,
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
          exceed:{
            type: "boolean",
            enum: [exceed],
          }
        },
        required: ["benchmarkName", "funcName", "numBB", "originalSet", "predictedSet", "tokenCount", "discrepancy", "exceed"],
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
    required: ["benchmarkInfo","hottestBB", "bbOrderByHotness", "additionalNotes"],
  };

  return { jsonObj, jsonSchema };
};

// Main function for processing the files
const processFiles = async (env: ExpansionVariables) => {
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
    const funcSet = (file.content ?? "")
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

    let funCounter = 1;
    // Iterate over each function for deeper analysis
    for (const func of funcSet) {
      const funcNameMatch = func.match(/@([a-zA-Z_][\w\.]*)\(/m);
      const funcName = funcNameMatch?.[1];

      if (!funcName) {
        output.error("Function name not found");
        continue;
      }

      const bbSetMatch = func.match(/^([a-zA-Z_][\w\.]*):(?=\s|$)/gm);
      const bbSet = bbSetMatch ? bbSetMatch.map((id) => id.slice(0, -1)) : [];
      const numBB = bbSet.length;
      dbg(`bbSet: ${bbSet}`);

      output.heading(
        3,
        `${funCounter}) Analysis report of function: ${funcName}`
      );
      output.detailsFenced("Function being analized:", func);
      output.detailsFenced(
        `Function ${funcName} has ${numBB} blocks :`,
        bbSet.join(", ")
      );

      funCounter += 1;
      console.log("Function content: \n", func);

      let bbList = bbSet.join(", ");
      // Run the prompt for hot block estimation and ranking
      try {
        const res = await runPrompt(
          (ctxt) => {
            const completeFunc = ctxt.def("function", func, {
              maxTokens: 131072, //128k
            });
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
            This function has ${numBB} basic blocks: ${bbList}.
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
          {
            temperature: 0,
            model: "vision", //"github:openai/gpt-4o",//"vision",
            systemSafety: true,
            responseType: "text",
          }
        );

        const tokenCount = res.usage?.total ?? 0;
        output.detailsFenced("Token Count: ", `${tokenCount}`);
        output.detailsFenced("LLM Output Text:", res.text);

        const jsonObj = parseMarkdownToJson(
          res.text,
          fileNameWithoutExt,
          funcName,
          tokenCount,
          numBB,
          bbSet
        ).jsonObj;
        console.log("Response Json: ", jsonObj);
        // Define the output file name
        const outFileName = `${filePath}/${fileNameWithoutExt}.json`;
        // Save or append the results to the file
        saveJsonObjectToArrayFile(outFileName, jsonObj);
      } catch (error) {
        console.error("Error during prompt execution:", error);
        output.error("Error analyzing function");
      }
    }
  }
  output.heading(1, "End of benchmarking.");
};

await processFiles(env).catch((err) =>
  console.error("Error processing files:", err)
);
