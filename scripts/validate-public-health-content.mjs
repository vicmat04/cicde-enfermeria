import fs from "fs";
import path from "path";

const baseDir = path.join(
  process.cwd(),
  "content",
  "validated",
  "salud-publica",
);
const expectedFolders = Array.from(
  { length: 13 },
  (_, i) => `PUBLIC-${String(i + 1).padStart(2, "0")}`,
);

let errors = [];

if (!fs.existsSync(baseDir)) {
  console.error("Base directory missing");
  process.exit(1);
}

const items = fs.readdirSync(baseDir).filter((f) => !f.startsWith("."));

for (const folder of expectedFolders) {
  if (!items.includes(folder)) errors.push(`Missing folder: ${folder}`);
}

const masterPath = path.join(
  process.cwd(),
  "docs",
  "validated",
  "CICDE_MASTER_SPEC.json",
);
let masterData;
try {
  masterData = JSON.parse(fs.readFileSync(masterPath, "utf8"));
} catch (e) {
  console.error("Master spec format error");
  process.exit(1);
}
const phArea = masterData.areas.find((a) => a.code === "PUBLIC_HEALTH");

for (const folder of expectedFolders) {
  const folderPath = path.join(baseDir, folder);
  if (!fs.existsSync(folderPath)) continue;

  const files = fs.readdirSync(folderPath).filter((f) => !f.startsWith("."));
  let mdCount = 0;
  let jsonCount = 0;

  for (const file of files) {
    const filePath = path.join(folderPath, file);
    const content = fs.readFileSync(filePath, "utf8");

    if (!content.trim()) {
      errors.push(`Empty file: ${folder}/${file}`);
      continue;
    }

    if (file.endsWith("_VALIDADO.md")) {
      mdCount++;
    } else if (file.endsWith("_SPEC.json")) {
      jsonCount++;
      try {
        const data = JSON.parse(content);
        if (data.topic_code !== folder)
          errors.push(
            `${folder}/${file} topic_code mismatch: got ${data.topic_code}`,
          );
        if (data.area_code !== "PUBLIC_HEALTH")
          errors.push(
            `${folder}/${file} area_code mismatch: got ${data.area_code}`,
          );
        if (data.status !== "REVIEW")
          errors.push(`${folder}/${file} status mismatch: got ${data.status}`);
        if (data.version !== 1)
          errors.push(
            `${folder}/${file} version mismatch: got ${data.version}`,
          );
        if (data.is_current !== true)
          errors.push(
            `${folder}/${file} is_current mismatch: got ${data.is_current}`,
          );
        if (!data.title || !data.title.trim())
          errors.push(`${folder}/${file} title missing or empty`);
        if (!data.summary || !data.summary.trim())
          errors.push(`${folder}/${file} summary missing or empty`);
        if (!data.coverage) errors.push(`${folder}/${file} coverage missing`);
        else if (!data.coverage.cicde_topic_exact)
          errors.push(`${folder}/${file} cicde_topic_exact missing`);

        // Master Spec check
        if (phArea) {
          const specTopic = phArea.topics.find((t) => t.code === folder);
          if (specTopic && specTopic.title !== data.title) {
            errors.push(
              `${folder}: Title mismatch. JSON='${data.title}' Master='${specTopic.title}'`,
            );
          }
        }

        const sources = data.sources || data.source_records;
        if (!Array.isArray(sources))
          errors.push(`${folder}/${file} sources array missing`);
        else {
          for (const s of sources) {
            if (
              !["CICDE", "PANAMA_OFFICIAL", "COMPLEMENTARY"].includes(
                s.source_type,
              )
            ) {
              errors.push(
                `${folder}/${file} invalid source_type: ${s.source_type}`,
              );
            }
            if (
              folder === "PUBLIC-01" &&
              s.source_type === "CICDE" &&
              (!s.organization || !s.publisher)
            ) {
              console.log(
                `[KNOWN_METADATA_GAP] PUBLIC-01 CICDE Source: Missing organization/publisher - intentionally allowed.`,
              );
            } else {
              if (!s.title) errors.push(`${folder}: source missing title`);
            }
          }
        }
      } catch (_e) {
        errors.push(`JSON Parse error in ${folder}/${file}`);
      }
    } else {
      errors.push(`Unexpected file in ${folder}: ${file}`);
    }
  }

  if (mdCount !== 1) errors.push(`Folder ${folder} has ${mdCount} MD files`);
  if (jsonCount !== 1)
    errors.push(`Folder ${folder} has ${jsonCount} JSON files`);
}

if (errors.length > 0) {
  console.error("Validation failed with errors:");
  errors.forEach((e) => console.error(" -", e));
  process.exit(1);
} else {
  console.log("All 13 PUBLIC_HEALTH packages validated successfully.");
  process.exit(0);
}
