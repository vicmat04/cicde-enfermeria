# Reporte de Importación de Contenido - Salud del Adulto

## Resumen de Ejecución

- **Migration Name:** `20260910153959_seed_adult_lessons_sources.sql`
- **Lessons generadas:** 29
- **Lesson Sections generadas:** 2558
- **Lesson Sources referenciadas:** 211
- **Sources Únicas identificadas:** 147

## Estrategias Técnicas

### Deduplicación de Fuentes

Se construyó una clave hash determinista basada en `source_type | title | authors | organization | publisher | publication_year | edition | url` en minúsculas y sin espacios periféricos. Dos ediciones de años diferentes generan claves independientes.

### Estrategia de IDs

Se utilizó la especificación estándar **UUID v5** (RFC 4122) generada mediante la librería nativa `crypto` de Node.js, implementando un namespace estable documentado explícitamente en el script (`CICDE_CONTENT_NAMESPACE`).

Las semillas deterministas obedecen al formato:

- Lessons: `lesson:<topicCode>:v1`
- Sections: `section:<topicCode>:v1:sec_<sort_order>`
- Sources: `source:<canonicalSourceKey>`

Esto permite ejecuciones repetidas y seguras de la misma migración en diferentes entornos, ya que los ID generados serán siempre idénticos y válidos para PostgreSQL, respetando los *version/variant bits* (v5).

### Estrategia frente a Conflictos

La migración se basa enteramente en `ON CONFLICT DO NOTHING`. Las constraints subyacentes del schema (e.g., `lesson_id + source_id` y `topic_id + version`) impiden sobrescribir o contaminar silenciosamente registros previos, bloqueando la inserción redundante. Se protege agresivamente la integridad de datos pre-existentes.

### Gestión de Estado

Todo el contenido importado se establece explícitamente en el estado **REVIEW**. Se impidió expresamente generar la bandera `VERIFIED` o inventar timestamps ficticios (`reviewed_by` y `reviewed_at` son `NULL`).

### Notas Adicionales

- Se omitieron del cliente todos los campos `null` no relevantes.
- La transacción `BEGIN/COMMIT` envuelve la inserción de las 4 tablas en masa.
- Las referencias a tópicos utilizan un `SELECT` on-the-fly para capturar UUIDs dinámicos a partir de su `code` estable (ej. `ADULT-01`).
