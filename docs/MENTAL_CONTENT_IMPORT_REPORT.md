# Reporte de Importación de Contenido - Salud y Enfermedad Mental

## Resumen de Ejecución

- **Migration Name:** `20260910161000_seed_mental_lessons_sources.sql`
- **Lessons generadas:** 10
- **Lesson Sections generadas:** 983
- **Lesson Sources referenciadas:** 94
- **Sources Únicas identificadas:** 47

## Estrategias Técnicas

### Deduplicación de Fuentes

Se construyó una clave hash determinista basada en `source_type | title | authors | organization | publisher | publication_year | edition | url` en minúsculas y sin espacios periféricos. Las variaciones se conservan independientemente para evitar fusionar fuentes distintas que compartan metadatos genéricos (e.g. MINSA genérico vs MINSA con título específico).

### Estrategia de IDs

Se utilizó la especificación estándar **UUID v5** (RFC 4122) generada mediante `crypto` nativo, empleando el namespace `b6b8b0e0-c8f2-4b2a-a0a3-f0e0c0b8b8b8`.
Formato de las semillas:

- Lessons: `lesson:<topicCode>:v1`
- Sections: `section:<topicCode>:v1:sec_<sort_order>`
- Sources: `source:<canonicalSourceKey>`

### Gestión de Estado y Discrepancias

Todo el contenido importado se establece en **REVIEW**. No se establecen marcas `VERIFIED` ni revisores humanos ficticios.
Los títulos de las lecciones representan la **redacción normalizada** provista en el JSON de especificación. Los títulos originales exactos se preservan a nivel de `coverage.cicde_topic_exact` según la política del proyecto.

#### Discrepancias de títulos normalizados vs CICDE Exacto

- **MENTAL-01**: Título normalizado JSON `Estrategias de enfermería para fortalecer la autoestima y reforzar los valores` vs Título Oficial Exacto `Estrategias de enfermería para fortalecer la autoestima, reforzar los valores`
- **MENTAL-05**: Título normalizado JSON `Manejo de factores de riesgo: estrés, ansiedad, conflicto, frustración y mecanismos de defensa` vs Título Oficial Exacto `Manejo de factores de riesgo: stress, ansiedad, conflicto, frustración, mecanismo de defensa`
