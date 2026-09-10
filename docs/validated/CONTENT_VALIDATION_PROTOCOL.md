# Protocolo de validación clínica y académica — CICDE Enfermería 2026

## Propósito

Evitar omisiones, contenido desactualizado, atribuciones falsas y preguntas ambiguas en una plataforma destinada a preparar profesionales de enfermería.

## 1. Jerarquía de evidencia del proyecto

**Nivel 0 — Alcance del examen:** Lineamientos CICDE 2026. Define QUÉ estudiar. No se omite ningún tema ni subtema.

**Nivel 1 — Bibliografía CICDE:** libros y documentos citados expresamente por el Consejo. Se priorizan para explicar el contenido cuando están disponibles y verificables.

**Nivel 2 — Norma oficial Panamá vigente:** MINSA, Gaceta Oficial, ANEP, CSS u otra autoridad competente. Es obligatoria cuando el punto depende de normativa, esquema nacional, política pública, derechos, vacunación o protocolo vigente.

**Nivel 3 — Fuente primaria/autoridad internacional:** OMS/OPS, CIE y guías profesionales/institucionales reconocidas cuando complementan o actualizan.

**Nivel 4 — Fuente académica complementaria:** editoriales, textos académicos y literatura científica verificable.

## 2. Regla de no omisión

Antes de marcar un área como completa, se realiza comparación automática/manual contra `CICDE_MASTER_SPEC.json`:

- todos los topics presentes;
- todos los subtopics presentes;
- todos los puntos de competencias cubiertos transversalmente;
- ninguna sustitución silenciosa del lenguaje CICDE.

La cobertura se mide por **subtema**, no solo por área.

## 3. Regla de actualidad

Se aplica verificación de vigencia reforzada a:

- esquema de vacunación;
- políticas y programas de salud de Panamá;
- legislación y derechos del paciente;
- obstetricia y complicaciones del embarazo;
- farmacología y seguridad de medicamentos;
- urgencias y reanimación;
- enfermedades emergentes/transmisibles;
- salud sexual y reproductiva;
- protocolos MINSA/CSS.

Cuando CICDE cita una fuente antigua y existe una norma vigente distinta:

1. conservar la fuente CICDE en trazabilidad;
2. registrar la fuente vigente;
3. explicar la diferencia si afecta conducta clínica o respuesta de examen;
4. no enseñar una práctica desactualizada como recomendación actual.

## 4. Niveles de acceso a una fuente

- `FULL_TEXT_VERIFIED`: texto completo accesible y verificado.
- `PARTIAL_VERIFIED`: capítulos/páginas/preview verificables.
- `BIBLIOGRAPHIC_VERIFIED`: existencia, edición y metadatos confirmados, sin texto completo suficiente.
- `CICDE_ONLY`: solo consta en el lineamiento; aún no se verificó externamente.
- `SUPERSEDED`: referencia válida como antecedente pero reemplazada por norma/guía posterior.

Nunca atribuir una afirmación de capítulo/página a una fuente `BIBLIOGRAPHIC_VERIFIED` o `CICDE_ONLY`.

## 5. Plantilla obligatoria de cada lección VERIFIED

1. Alcance CICDE exacto.
2. Objetivos de aprendizaje.
3. Conceptos esenciales.
4. Valoración de enfermería.
5. Signos/síntomas y datos de alarma, cuando aplique.
6. Priorización y razonamiento clínico.
7. Intervenciones de enfermería.
8. Tratamiento contextual necesario para el cuidado, sin sustituir prescripción médica.
9. Medicamentos relevantes y seguridad, cuando aplique.
10. Complicaciones.
11. PAE: valoración, diagnóstico, planificación, ejecución y evaluación cuando corresponda.
12. Educación a paciente/familia/comunidad.
13. Bioseguridad, ética y legalidad cuando aplique.
14. Puntos de memoria.
15. Errores/confusiones frecuentes.
16. Enfoque de examen basado en situaciones.
17. Fuentes trazables por sección.
18. Fecha de última revisión clínica.

No todas las secciones tendrán contenido en todos los temas, pero una sección vacía debe ser deliberada, no olvidada.

## 6. Validación de preguntas

Una pregunta no pasa a `VERIFIED` si no cumple todo:

- vinculada a topic/subtopic CICDE;
- una respuesta inequívocamente correcta (salvo formato explícitamente distinto);
- distractores plausibles pero falsos en el contexto;
- explicación de la correcta;
- explicación o razón de descarte de distractores cuando sea útil;
- fuente asociada;
- sin depender de una cifra/protocolo desactualizado;
- sin pistas gramaticales obvias;
- nivel de dificultad etiquetado;
- tipo etiquetado (memoria, comprensión, caso, prioridad, PAE, farmacología, cálculo, ética);
- revisión de seguridad clínica.

La IA puede redactar un borrador, pero **no valida su propia pregunta**.

## 7. Casos clínicos

Los casos deben entrenar lo que el CICDE declara medir: aplicación de competencias en situaciones. Deben incorporar, según el tema:

- datos relevantes y datos distractores razonables;
- signos vitales/valoración cuando corresponda;
- prioridad de cuidado;
- seguridad del paciente;
- intervención inicial o siguiente acción;
- evaluación de respuesta;
- educación;
- razonamiento PAE.

## 8. Cálculos

Los ejercicios de cálculo se almacenan con:

- fórmula o método esperado;
- unidades explícitas;
- redondeo definido;
- resultado calculado por código cuando sea posible;
- verificación independiente antes de publicar.

Nunca confiar únicamente en cálculo generativo de IA para la respuesta correcta.

## 9. Discrepancias del documento rector

Errores tipográficos o metadatos dudosos del PDF no se corrigen silenciosamente. Ejemplos detectados:

- “Hinkler” frente a la autora verificada Janice L. Hinkle;
- “Sika” en el temario, aunque la denominación habitual de la enfermedad/virus es Zika;
- fechas editoriales que pueden variar entre ficha CICDE y editorial (p. ej., Wong 10.ª ed.);
- enlaces `file:///C:/...` que son rutas personales y no fuentes accesibles.

En la base de datos se puede normalizar metadata para búsqueda, pero se conserva una copia de la redacción CICDE y una nota de discrepancia.

## 10. Criterio de finalización

Un área solo se declara **lista para simulacro** cuando:

- 100% de topics/subtopics del CICDE tienen material;
- material crítico está VERIFIED;
- existe banco suficiente de preguntas distribuidas por subtema;
- existen casos de prioridad/razonamiento en temas clínicos;
- cifras/protocolos sensibles a fecha tienen revisión vigente;
- se ejecutó auditoría de cobertura contra el master spec.
