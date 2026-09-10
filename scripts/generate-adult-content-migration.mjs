import fs from "fs";
import path from "path";
import crypto from "crypto";

const CICDE_CONTENT_NAMESPACE = 'b6b8b0e0-c8f2-4b2a-a0a3-f0e0c0b8b8b8';

function generateUuidV5(name) {
  const nsBuffer = Buffer.from(CICDE_CONTENT_NAMESPACE.replace(/-/g, ''), 'hex');
  const nameBuffer = Buffer.from(name, 'utf8');
  const hash = crypto.createHash('sha1').update(nsBuffer).update(nameBuffer).digest();
  
  hash[6] = (hash[6] & 0x0f) | 0x50; // Version 5
  hash[8] = (hash[8] & 0x3f) | 0x80; // Variant RFC4122
  
  const hex = hash.toString('hex');
  return [
    hex.substring(0, 8),
    hex.substring(8, 12),
    hex.substring(12, 16),
    hex.substring(16, 20),
    hex.substring(20, 32),
  ].join("-");
}

const baseDir = path.join(process.cwd(), "content", "validated", "adult");
const expectedGlobal = Array.from(
  { length: 29 },
  (_, i) => `ADULT-${String(i + 1).padStart(2, "0")}`,
);

let sql = `-- CICDE Enfermeria 2026
-- Auto-generated migration for ADULT lessons and sources
-- Seed Data Phase 1
BEGIN;

`;

// Strategy:
// 1. Gather all unique sources globally.
// 2. Gather lessons and sections.

const uniqueSources = new Map(); // deduplication key -> source obj
const mappedSources = []; // array of unique source objects with UUID
const lessons = []; // array of lessons
const sections = []; // array of sections
const lessonSources = []; // array of lesson-source mappings

for (const folder of expectedGlobal) {
  const folderPath = path.join(baseDir, folder);
  const files = fs.readdirSync(folderPath);

  const mdFile = files.find((f) => f.endsWith("_VALIDADO.md"));
  const jsonFile = files.find((f) => f.endsWith("_SPEC.json"));

  const mdContent = fs.readFileSync(path.join(folderPath, mdFile), "utf8");
  let jsonContent;
  try {
    jsonContent = JSON.parse(
      fs.readFileSync(path.join(folderPath, jsonFile), "utf8"),
    );
  } catch (_e) {
    console.error(`Invalid JSON in ${folderPath}`);
    process.exit(1);
  }

  const topicCode = jsonContent.topic_code;
  const lessonId = generateUuidV5(`lesson:${topicCode}:v1`);

  // Lesson
  lessons.push({
    id: lessonId,
    topic_code: topicCode,
    title: jsonContent.title.replace(/'/g, "''"),
    summary: (jsonContent.summary || "").replace(/'/g, "''"),
    status: "REVIEW",
    version: 1,
    is_current: true,
  });

  // Sections (Split MD by markdown headings)
  const lines = mdContent.split("\n");
  let currentTitle = "Introducción";
  let currentBody = [];
  let sortOrder = 1;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    const match = line.match(/^(#{1,6})\s+(.*)$/);
    if (match) {
      if (currentBody.length > 0 || sortOrder > 1) {
        const sectionKey = `sec_${sortOrder}`;
        sections.push({
          id: generateUuidV5(`section:${topicCode}:v1:${sectionKey}`),
          lesson_id: lessonId,
          section_key: sectionKey,
          title: currentTitle.replace(/'/g, "''"),
          body: currentBody.join("\n").trim().replace(/'/g, "''"),
          sort_order: sortOrder,
        });
        sortOrder++;
        currentBody = [];
      }
      currentTitle = match[2].trim();
    } else {
      currentBody.push(line);
    }
  }
  if (currentBody.length > 0) {
    const sectionKey = `sec_${sortOrder}`;
    sections.push({
      id: generateUuidV5(`section:${topicCode}:v1:${sectionKey}`),
      lesson_id: lessonId,
      section_key: sectionKey,
      title: currentTitle.replace(/'/g, "''"),
      body: currentBody.join("\n").trim().replace(/'/g, "''"),
      sort_order: sortOrder,
    });
  }

  // Sources
  const rawSources = jsonContent.sources || jsonContent.source_records || [];
  for (const s of rawSources) {
    const stype = s.source_type || "COMPLEMENTARY";
    const title = (s.title || "").trim();
    const authors = (s.authors || "").trim();
    const org = (s.organization || "").trim();
    const pub = (s.publisher || "").trim();
    const year = s.publication_year || s.year || null;
    const edition = (s.edition || "").trim();
    const url = (s.url || "").trim();
    const notes = (s.usage || s.notes || "").trim(); // 'usage' mapped to 'notes' or ignored for deduplication

    // Exact deduplication string
    const dedupStr = `${stype}|${title.toLowerCase()}|${authors.toLowerCase()}|${org.toLowerCase()}|${pub.toLowerCase()}|${year}|${edition.toLowerCase()}|${url.toLowerCase()}`;

    let sourceId;
    if (uniqueSources.has(dedupStr)) {
      sourceId = uniqueSources.get(dedupStr).id;
    } else {
      sourceId = generateUuidV5(`source:${dedupStr}`);
      const sObj = {
        id: sourceId,
        source_type: stype,
        title: title.replace(/'/g, "''"),
        authors: authors ? authors.replace(/'/g, "''") : null,
        organization: org ? org.replace(/'/g, "''") : null,
        publisher: pub ? pub.replace(/'/g, "''") : null,
        publication_year: year || null,
        edition: edition ? edition.replace(/'/g, "''") : null,
        url: url ? url.replace(/'/g, "''") : null,
        citation_text: title.replace(/'/g, "''"), // fallback citation
      };
      uniqueSources.set(dedupStr, sObj);
      mappedSources.push(sObj);
    }

    lessonSources.push({
      lesson_id: lessonId,
      source_id: sourceId,
      reference_detail: null,
      usage_note: notes ? notes.replace(/'/g, "''") : null,
      is_primary: s.role === "primary" || false,
    });
  }
}

// Write SQL
sql += `-- 1. Insert Sources
`;
for (const s of mappedSources) {
  sql += `INSERT INTO public.sources (id, source_type, title, authors, organization, publisher, publication_year, edition, url, citation_text, verified)
VALUES ('${s.id}', '${s.source_type}', '${s.title}', ${s.authors ? "'" + s.authors + "'" : "NULL"}, ${s.organization ? "'" + s.organization + "'" : "NULL"}, ${s.publisher ? "'" + s.publisher + "'" : "NULL"}, ${s.publication_year || "NULL"}, ${s.edition ? "'" + s.edition + "'" : "NULL"}, ${s.url ? "'" + s.url + "'" : "NULL"}, '${s.citation_text}', false)
ON CONFLICT (id) DO NOTHING;\n`;
}

sql += `\n-- 2. Insert Lessons\n`;
for (const l of lessons) {
  sql += `INSERT INTO public.lessons (id, topic_id, title, summary, status, version, is_current)
SELECT '${l.id}', id, '${l.title}', '${l.summary}', '${l.status}', ${l.version}, ${l.is_current}
FROM public.topics WHERE code = '${l.topic_code}'
ON CONFLICT (topic_id, version) DO NOTHING;\n`;
}

sql += `\n-- 3. Insert Lesson Sections\n`;
for (const s of sections) {
  sql += `INSERT INTO public.lesson_sections (id, lesson_id, section_key, title, body, sort_order)
VALUES ('${s.id}', '${s.lesson_id}', '${s.section_key}', '${s.title}', '${s.body}', ${s.sort_order})
ON CONFLICT (lesson_id, section_key) DO NOTHING;\n`;
}

sql += `\n-- 4. Insert Lesson Sources\n`;
for (const ls of lessonSources) {
  sql += `INSERT INTO public.lesson_sources (lesson_id, source_id, reference_detail, usage_note, is_primary)
VALUES ('${ls.lesson_id}', '${ls.source_id}', ${ls.reference_detail ? "'" + ls.reference_detail + "'" : "NULL"}, ${ls.usage_note ? "'" + ls.usage_note + "'" : "NULL"}, ${ls.is_primary})
ON CONFLICT (lesson_id, source_id) DO NOTHING;\n`;
}

sql += `\nCOMMIT;\n`;

const migrationName = `20260910153959_seed_adult_lessons_sources.sql`;
const migrationPath = path.join(
  process.cwd(),
  "supabase",
  "migrations",
  migrationName,
);

fs.writeFileSync(migrationPath, sql);

console.log(`Generated migration: ${migrationName}`);

// Write Report
const reportPath = path.join(
  process.cwd(),
  "docs",
  "ADULT_CONTENT_IMPORT_REPORT.md",
);
const reportContent = `# Reporte de Importación de Contenido - Salud del Adulto

## Resumen de Ejecución
- **Migration Name:** \`${migrationName}\`
- **Lessons generadas:** ${lessons.length}
- **Lesson Sections generadas:** ${sections.length}
- **Lesson Sources referenciadas:** ${lessonSources.length}
- **Sources Únicas identificadas:** ${mappedSources.length}

## Estrategias Técnicas

### Deduplicación de Fuentes
Se construyó una clave hash determinista basada en \`source_type | title | authors | organization | publisher | publication_year | edition | url\` en minúsculas y sin espacios periféricos. Dos ediciones de años diferentes generan claves independientes.

### Estrategia de IDs
Se utilizó la especificación estándar **UUID v5** (RFC 4122) generada mediante la librería nativa \`crypto\` de Node.js, implementando un namespace estable documentado explícitamente en el script (\`CICDE_CONTENT_NAMESPACE\`). 

Las semillas deterministas obedecen al formato:
- Lessons: \`lesson:<topicCode>:v1\`
- Sections: \`section:<topicCode>:v1:sec_<sort_order>\`
- Sources: \`source:<canonicalSourceKey>\`

Esto permite ejecuciones repetidas y seguras de la misma migración en diferentes entornos, ya que los ID generados serán siempre idénticos y válidos para PostgreSQL, respetando los *version/variant bits* (v5).

### Estrategia frente a Conflictos
La migración se basa enteramente en \`ON CONFLICT DO NOTHING\`. Las constraints subyacentes del schema (e.g., \`lesson_id + source_id\` y \`topic_id + version\`) impiden sobrescribir o contaminar silenciosamente registros previos, bloqueando la inserción redundante. Se protege agresivamente la integridad de datos pre-existentes.

### Gestión de Estado
Todo el contenido importado se establece explícitamente en el estado **REVIEW**. Se impidió expresamente generar la bandera \`VERIFIED\` o inventar timestamps ficticios (\`reviewed_by\` y \`reviewed_at\` son \`NULL\`).

### Notas Adicionales
- Se omitieron del cliente todos los campos \`null\` no relevantes.
- La transacción \`BEGIN/COMMIT\` envuelve la inserción de las 4 tablas en masa.
- Las referencias a tópicos utilizan un \`SELECT\` on-the-fly para capturar UUIDs dinámicos a partir de su \`code\` estable (ej. \`ADULT-01\`).
`;

fs.writeFileSync(reportPath, reportContent);
console.log("Report written to docs/ADULT_CONTENT_IMPORT_REPORT.md");
