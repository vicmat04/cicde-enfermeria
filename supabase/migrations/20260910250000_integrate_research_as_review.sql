BEGIN;

INSERT INTO topics (area_id, code, title, description, sort_order) VALUES
((SELECT id FROM areas WHERE code='RESEARCH'),'RESEARCH-01','Concepto de investigación','',1),
((SELECT id FROM areas WHERE code='RESEARCH'),'RESEARCH-02','Metodología de investigación','',2),
((SELECT id FROM areas WHERE code='RESEARCH'),'RESEARCH-03','Tipos de Investigación','',3);

INSERT INTO lessons (topic_id,title,status) VALUES
((SELECT id FROM topics WHERE code='RESEARCH-01'),'Concepto de investigación','REVIEW'),
((SELECT id FROM topics WHERE code='RESEARCH-02'),'Metodología de investigación','REVIEW'),
((SELECT id FROM topics WHERE code='RESEARCH-03'),'Tipos de Investigación','REVIEW');

INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Lineamientos para el Examen de Competencias de Profesionales de Enfermería','Lineamientos para el Examen de Competencias de Profesionales de Enfermería',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Lineamientos para el Examen de Competencias de Profesionales de Enfermería');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Metodología de la investigación','Metodología de la investigación',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Metodología de la investigación');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Research — Health research','Research — Health research',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Research — Health research');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Research','Research',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Research');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Ley 84 de 14 de mayo de 2019 — Que regula y promueve la investigación para la salud y establece su rectoría y gobernanza','Ley 84 de 14 de mayo de 2019 — Que regula y promueve la investigación para la salud y establece su rectoría y gobernanza',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Ley 84 de 14 de mayo de 2019 — Que regula y promueve la investigación para la salud y establece su rectoría y gobernanza');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Decreto Ejecutivo N.° 21 de 23 de abril de 2026 — Reglamenta los Títulos III y IV de la Ley 84 de 2019','Decreto Ejecutivo N.° 21 de 23 de abril de 2026 — Reglamenta los Títulos III y IV de la Ley 84 de 2019',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Decreto Ejecutivo N.° 21 de 23 de abril de 2026 — Reglamenta los Títulos III y IV de la Ley 84 de 2019');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Declaración de Helsinki — Principios éticos para la investigación médica con participantes humanos','Declaración de Helsinki — Principios éticos para la investigación médica con participantes humanos',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Declaración de Helsinki — Principios éticos para la investigación médica con participantes humanos');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','What Is Ethics in Research & Why Is It Important?','What Is Ethics in Research & Why Is It Important?',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='What Is Ethics in Research & Why Is It Important?');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Metodología de la Investigación','Metodología de la Investigación',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Metodología de la Investigación');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Ley 84 de 14 de mayo de 2019','Ley 84 de 14 de mayo de 2019',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Ley 84 de 14 de mayo de 2019');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Decreto Ejecutivo N.° 21 de 23 de abril de 2026','Decreto Ejecutivo N.° 21 de 23 de abril de 2026',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Decreto Ejecutivo N.° 21 de 23 de abril de 2026');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Regulación de Investigación para la Salud','Regulación de Investigación para la Salud',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Regulación de Investigación para la Salud');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Comité Nacional de Bioética de la Investigación','Comité Nacional de Bioética de la Investigación',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Comité Nacional de Bioética de la Investigación');

CREATE TEMP TABLE tmap (c TEXT PRIMARY KEY, l UUID NOT NULL) ON COMMIT DROP;
INSERT INTO tmap SELECT t.code,l.id FROM lessons l JOIN topics t ON t.id=l.topic_id WHERE t.code LIKE 'RESEARCH%';

CREATE TEMP TABLE smap (c TEXT PRIMARY KEY, s UUID NOT NULL) ON COMMIT DROP;
INSERT INTO smap SELECT DISTINCT ON (citation_text) citation_text,id FROM sources WHERE citation_text IN ('Lineamientos para el Examen de Competencias de Profesionales de Enfermería','Metodología de la investigación','Research — Health research','Research','Ley 84 de 14 de mayo de 2019 — Que regula y promueve la investigación para la salud y establece su rectoría y gobernanza','Decreto Ejecutivo N.° 21 de 23 de abril de 2026 — Reglamenta los Títulos III y IV de la Ley 84 de 2019','Declaración de Helsinki — Principios éticos para la investigación médica con participantes humanos','What Is Ethics in Research & Why Is It Important?','Metodología de la Investigación','Ley 84 de 14 de mayo de 2019','Decreto Ejecutivo N.° 21 de 23 de abril de 2026','Regulación de Investigación para la Salud','Comité Nacional de Bioética de la Investigación') ORDER BY citation_text;

INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B1$El temario CICDE 2026 incluye dentro del área **Investigación** el tema:

> **Concepto de investigación**

CICDE no enumera subtemas explícitos para RESEARCH-01. Por ello, este paquete desarrolla el concepto de investigación sin presentar una lista propia como si hubiera sido escrita por el Consejo.

La bibliografía principal señalada por CICDE para el área es **Hernández Sampieri, Fernández Collado y Baptista Lucio, _Metodología de la investigación_, 6.ª edición, McGraw-Hill, 2014**.

Este módulo se concentra en **qué es investigar, para qué se investiga, qué distingue a una investigación científica, qué papel cumple la investigación en enfermería y qué responsabilidades éticas implica**.

La metodología paso a paso se desarrolla en **RESEARCH-02** y la clasificación de los tipos de investigación en **RESEARCH-03**.

---$B1$,1 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B2$Al finalizar el tema, el estudiante debe poder:

1. Explicar el concepto de investigación y de investigación científica.
2. Diferenciar investigación de una búsqueda informal de información.
3. Reconocer características del conocimiento científico.
4. Explicar la relación entre investigación, evidencia y práctica de enfermería.
5. Distinguir investigación de práctica clínica, auditoría, mejora de calidad y práctica basada en evidencia.
6. Reconocer el valor del rigor, la transparencia y el pensamiento crítico.
7. Identificar situaciones en las que sesgos o conclusiones apresuradas afectan la interpretación de resultados.
8. Explicar el papel de enfermería como usuaria, colaboradora y productora de investigación.
9. Reconocer principios éticos aplicables a investigación con seres humanos.
10. Identificar la importancia del consentimiento informado, privacidad y revisión ética.
11. Reconocer la Ley 84 de 2019 como marco panameño de investigación para la salud.
12. Relacionar la investigación con mejora del cuidado, seguridad y toma de decisiones.

---$B2$,2 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concepto_de_investigaci_n_2','Concepto de investigación',$B3$Investigar implica realizar una **indagación organizada y crítica para producir, comprobar, ampliar o interpretar conocimiento**.

En salud, la OMS describe la investigación como la recolección o análisis sistemático de datos con la intención de desarrollar conocimiento generalizable para comprender problemas de salud y mejorar la respuesta frente a ellos.

### Idea central

La investigación busca responder una pregunta cuya respuesta **no debe decidirse de antemano**.

---$B3$,3 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_cient_fica_3','Investigación científica',$B4$La investigación científica utiliza procedimientos sistemáticos y explícitos para estudiar un fenómeno.

Implica, en términos generales:

- formular una pregunta o problema;
- utilizar un método coherente;
- obtener información o datos de forma organizada;
- analizarlos críticamente;
- interpretar los hallazgos;
- reconocer limitaciones;
- comunicar los resultados.

No significa que toda investigación produzca una verdad definitiva.

---$B4$,4 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conocimiento_cient_fico_4','Conocimiento científico',$B5$El conocimiento científico se construye mediante procedimientos que permiten examinar cómo se llegó a una conclusión.

Debe distinguirse de:

- opinión personal;
- tradición;
- intuición;
- autoridad sin evidencia;
- experiencia aislada.

La experiencia clínica es valiosa, pero por sí sola no sustituye la investigación sistemática.

---$B5$,5 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'caracter_sticas_del_conocimiento_cient_fico_5','Características del conocimiento científico',$B6$En términos generales, busca ser:

- sistemático;
- crítico;
- sustentado en evidencia;
- transparente;
- revisable;
- comunicable;
- coherente con los datos disponibles.

Una conclusión científica puede cambiar cuando aparece mejor evidencia.

---$B6$,6 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigar_no_es_solamente_buscar_informaci_n_6','Investigar no es solamente buscar información',$B7$Consultar libros o páginas web puede ser parte de una revisión, pero **buscar información no equivale automáticamente a realizar una investigación**.

Ejemplo:

- leer varios artículos sobre caídas hospitalarias = búsqueda/revisión de información;
- formular una pregunta, definir cómo medir caídas, recolectar datos y analizarlos para generar conocimiento = proceso de investigación.

---$B7$,7 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pregunta_problema_y_necesidad_de_conocimiento_7','Pregunta, problema y necesidad de conocimiento',$B8$La investigación comienza porque existe algo que necesita comprenderse mejor.

Puede surgir de:

- un problema clínico;
- una observación repetida;
- una diferencia entre práctica y resultados;
- una población poco estudiada;
- una incertidumbre terapéutica;
- una necesidad de salud pública;
- una pregunta teórica.

### Clave

Una buena investigación no comienza por “demostrar que tengo razón”, sino por **formular una pregunta que pueda examinarse de manera rigurosa**.

---$B8$,8 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'observaci_n_dato_e_interpretaci_n_8','Observación, dato e interpretación',$B9$**Observación:** lo que se aprecia o registra.

**Dato:** representación organizada de información obtenida mediante un procedimiento definido.

**Interpretación:** significado que se atribuye a los datos después del análisis.

### Error frecuente

Confundir un dato con una conclusión.

Ejemplo:

“20 de 100 pacientes presentaron una caída” es un dato descriptivo.

“Las caídas fueron causadas por falta de personal” es una interpretación causal que requiere evidencia adicional.

---$B9$,9 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'evidencia_e_incertidumbre_9','Evidencia e incertidumbre',$B10$La investigación no elimina toda incertidumbre.

Ayuda a reducirla mediante evidencia obtenida de forma sistemática.

Una decisión profesional debe reconocer:

- qué sabemos;
- qué no sabemos;
- qué tan sólida es la evidencia;
- a qué población se aplica;
- qué riesgos existen al extrapolarla.

---$B10$,10 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sistematicidad_10','Sistematicidad',$B11$Ser sistemático significa trabajar siguiendo un proceso planificado y coherente, no modificar las reglas según el resultado que se desea obtener.

Ejemplos:

- usar los mismos criterios para todos los participantes que correspondan;
- registrar cómo se obtuvieron los datos;
- aplicar procedimientos definidos;
- analizar de acuerdo con el plan apropiado.

---$B11$,11 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pensamiento_cr_tico_11','Pensamiento crítico',$B12$Investigar exige preguntar:

- ¿qué evidencia respalda esta afirmación?
- ¿cómo se obtuvo?
- ¿puede existir otra explicación?
- ¿la muestra representa a la población de interés?
- ¿hay sesgos?
- ¿los resultados justifican la conclusión?

El pensamiento crítico evita aceptar una conclusión solamente porque “parece lógica”.

---$B12$,12 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'transparencia_y_trazabilidad_12','Transparencia y trazabilidad',$B13$Una investigación debe permitir comprender:

- qué se hizo;
- por qué se hizo;
- con quién o con qué datos;
- cómo se analizaron los resultados;
- qué limitaciones existieron.

Ocultar procedimientos o resultados compromete la credibilidad científica.

---$B13$,13 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rigor_13','Rigor',$B14$El rigor es el cuidado con que se diseña, ejecuta, analiza e interpreta una investigación.

No significa utilizar siempre técnicas complejas.

Significa utilizar procedimientos apropiados para la pregunta y aplicarlos de forma consistente.

---$B14$,14 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sesgo_14','Sesgo',$B15$Un sesgo es una desviación sistemática que puede distorsionar los resultados o su interpretación.

Puede aparecer en:

- selección de participantes;
- medición;
- recolección de datos;
- análisis;
- interpretación;
- publicación.

### Clave de examen

Un estudio con muchos participantes puede seguir siendo poco confiable si tiene un sesgo importante.

---$B15$,15 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'asociaci_n_no_equivale_autom_ticamente_a_causalida_15','Asociación no equivale automáticamente a causalidad',$B16$Si dos variables aparecen relacionadas, eso no demuestra por sí solo que una cause la otra.

Ejemplo:

Si una unidad con mayor gravedad de pacientes tiene más eventos adversos, no puede concluirse automáticamente que el personal de esa unidad “causa” los eventos.

Se necesita analizar otras explicaciones y el diseño del estudio.

---$B16$,16 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_en_salud_16','Investigación en salud',$B17$La OMS señala que la investigación en salud busca generar conocimiento para comprender desafíos de salud y mejorar la respuesta frente a ellos.

Puede contribuir a:

- medir problemas;
- comprender causas y determinantes;
- desarrollar soluciones;
- trasladar evidencia a políticas y práctica;
- evaluar resultados.

---$B17$,17 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_en_enfermer_a_17','Investigación en enfermería',$B18$La investigación en enfermería utiliza preguntas relevantes para el cuidado, la experiencia humana, los servicios, la educación, la seguridad y los resultados de salud.

Puede estudiar, por ejemplo:

- prevención de lesiones por presión;
- experiencia del paciente;
- adherencia al tratamiento;
- educación sanitaria;
- carga de trabajo;
- continuidad del cuidado;
- seguridad de medicamentos;
- intervenciones de enfermería.

---$B18$,18 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_por_qu_investiga_enfermer_a__18','¿Por qué investiga enfermería?',$B19$Porque la profesión necesita saber:

- qué intervenciones funcionan;
- para quién funcionan;
- en qué condiciones;
- qué riesgos existen;
- cómo mejorar resultados;
- cómo usar recursos de forma segura;
- cómo responder a necesidades de personas, familias y comunidades.

---$B19$,19 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_y_calidad_del_cuidado_19','Investigación y calidad del cuidado',$B20$La investigación puede identificar prácticas asociadas con mejores resultados y ayudar a sustituir costumbres por decisiones más fundamentadas.

Sin embargo, un hallazgo de investigación no debe aplicarse automáticamente sin considerar:

- calidad de la evidencia;
- población estudiada;
- contexto;
- recursos;
- riesgos;
- normativa vigente.

---$B20$,20 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_y_seguridad_del_paciente_20','Investigación y seguridad del paciente',$B21$La investigación puede estudiar:

- eventos adversos;
- prevención de errores;
- comunicación;
- identificación de riesgos;
- efectividad de protocolos;
- factores humanos y organizativos.

El objetivo no es culpar, sino generar conocimiento que permita prevenir daño.

---$B21$,21 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_y_equidad_21','Investigación y equidad',$B22$La OPS destaca que la investigación puede ayudar a identificar desigualdades y desarrollar soluciones adaptadas a diferentes poblaciones.

Una investigación responsable debe considerar quiénes están representados y quiénes podrían quedar excluidos de sus beneficios.

---$B22$,22 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_y_contexto_22','Investigación y contexto',$B23$Un resultado obtenido en un lugar no necesariamente se aplica exactamente igual en todos los escenarios.

Debe considerarse:

- características de la población;
- sistema de salud;
- recursos;
- cultura;
- nivel de atención;
- condiciones sociales.

---$B23$,23 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_vs_pr_ctica_cl_nica_23','Investigación vs práctica clínica',$B24$**Práctica clínica:** busca beneficiar directamente a una persona concreta mediante atención profesional.

**Investigación:** busca generar conocimiento mediante un protocolo o proceso sistemático.

En algunos contextos pueden coexistir, pero sus objetivos no son idénticos.

---$B24$,24 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_vs_mejora_de_calidad_24','Investigación vs mejora de calidad',$B25$Una iniciativa de mejora de calidad suele buscar mejorar un proceso local.

Una investigación busca producir conocimiento sistemático que pueda trascender el caso local.

### Importante

La frontera puede ser compleja. No debe decidirse solo por el nombre del proyecto; deben revisarse propósito, métodos, uso de datos y requisitos regulatorios.

---$B25$,25 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_vs_auditor_a_25','Investigación vs auditoría',$B26$**Auditoría:** compara práctica o resultados con un estándar definido.

**Investigación:** busca responder una pregunta y generar conocimiento.

Ejemplo:

- “¿Se cumple el protocolo de identificación en 95 % de los casos?” → auditoría.
- “¿Qué factores se asocian con fallas de identificación y qué intervención reduce esas fallas?” → puede constituir investigación según diseño y finalidad.

---$B26$,26 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_vs_pr_ctica_basada_en_evidencia_26','Investigación vs práctica basada en evidencia',$B27$La **investigación** produce evidencia.

La **práctica basada en evidencia** integra evidencia disponible con juicio profesional, contexto y valores/preferencias de las personas atendidas.

No son sinónimos.

---$B27$,27 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'relaci_n_investigaci_n_evidencia_pr_ctica_27','Relación investigación → evidencia → práctica',$B28$Puede representarse así:

```text
Pregunta
   ↓
Investigación
   ↓
Resultados
   ↓
Conjunto de evidencia
   ↓
Valoración crítica
   ↓
Decisión profesional contextualizada
   ↓
Evaluación de resultados
```

No todo resultado aislado debe cambiar inmediatamente la práctica.

---$B28$,28 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'profesional_de_enfermer_a_como_consumidor_de_inves_28','Profesional de enfermería como consumidor de investigación',$B29$Todo profesional de enfermería necesita capacidad para:

- localizar evidencia;
- comprender resultados;
- reconocer limitaciones;
- diferenciar evidencia de opinión;
- evitar conclusiones exageradas;
- aplicar hallazgos pertinentes con seguridad.

---$B29$,29 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'profesional_de_enfermer_a_como_colaborador_de_inve_29','Profesional de enfermería como colaborador de investigación',$B30$Puede participar en:

- reclutamiento autorizado;
- educación de participantes;
- obtención de datos según protocolo;
- vigilancia de seguridad;
- documentación;
- coordinación del estudio.

Debe conocer exactamente su función y no excederla.

---$B30$,30 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'profesional_de_enfermer_a_como_investigador_30','Profesional de enfermería como investigador',$B31$Enfermería también formula preguntas y dirige estudios propios de la disciplina.

El investigador debe responsabilizarse por:

- rigor;
- ética;
- protección de participantes;
- integridad de datos;
- transparencia;
- comunicación responsable de resultados.

---$B31$,31 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_de_la_investigaci_n_31','Ética de la investigación',$B32$La ética de investigación protege:

- dignidad;
- derechos;
- seguridad;
- bienestar;
- privacidad;
- justicia.

La calidad científica y la ética están relacionadas: exponer personas a un estudio mal diseñado puede ser éticamente injustificable.

---$B32$,32 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_32','Autonomía',$B33$La participación debe respetar la capacidad de la persona para tomar decisiones libres e informadas.

Esto implica evitar:

- coerción;
- engaño injustificado;
- presión indebida;
- ocultamiento de información esencial.

---$B33$,33 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'beneficencia_y_no_maleficencia_33','Beneficencia y no maleficencia',$B34$El estudio debe valorar riesgos y beneficios previsibles.

No debe exponerse a participantes a riesgos innecesarios o desproporcionados respecto de la importancia de la pregunta.

---$B34$,34 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'justicia_34','Justicia',$B35$La selección de participantes y distribución de cargas/beneficios debe ser razonable y no discriminatoria.

No se debe escoger una población vulnerable simplemente porque sea más fácil de controlar o reclutar.

---$B35$,35 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'consentimiento_informado_35','Consentimiento informado',$B36$El consentimiento informado es un **proceso**, no solamente una firma.

Debe favorecer comprensión de aspectos relevantes como:

- propósito;
- procedimientos;
- riesgos;
- beneficios esperados;
- alternativas cuando correspondan;
- voluntariedad;
- posibilidad de retirarse según el marco aplicable;
- manejo de información.

---$B36$,36 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'privacidad_y_confidencialidad_36','Privacidad y confidencialidad',$B37$Investigar con datos de salud exige proteger:

- identidad;
- expedientes;
- archivos electrónicos;
- muestras;
- bases de datos;
- resultados individualizables.

Usar datos existentes no elimina automáticamente las obligaciones éticas y regulatorias.

---$B37$,37 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'personas_y_grupos_en_situaci_n_de_vulnerabilidad_37','Personas y grupos en situación de vulnerabilidad',$B38$Una persona puede requerir protección adicional por factores como:

- edad;
- capacidad de decisión limitada;
- dependencia;
- situación económica/social;
- institucionalización;
- emergencia;
- relaciones de poder.

La vulnerabilidad no significa excluir automáticamente; significa reconocer riesgos adicionales y proteger derechos.

---$B38$,38 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comit_s_de_bio_tica_de_investigaci_n_38','Comités de bioética de investigación',$B39$La revisión ética independiente ayuda a determinar si el estudio protege adecuadamente a participantes y cumple requisitos éticos y regulatorios.

La OMS señala que la investigación con seres humanos debe ser sometida a revisión ética apropiada.

En Panamá, la Ley 84 establece el marco de gobernanza de investigación para la salud y contempla comités de bioética de investigación.

---$B39$,39 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integridad_cient_fica_39','Integridad científica',$B40$La integridad exige conducta honesta durante todo el proceso.

Incluye:

- registrar datos de forma fiel;
- no ocultar resultados inconvenientes;
- describir métodos con honestidad;
- reconocer limitaciones;
- respetar autoría;
- declarar conflictos relevantes.

---$B40$,40 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fabricaci_n_falsificaci_n_y_plagio_40','Fabricación, falsificación y plagio',$B41$**Fabricación:** inventar datos o resultados que no existen.

**Falsificación:** manipular materiales, procedimientos o datos de modo que el registro de investigación deje de representar lo ocurrido.

**Plagio:** presentar ideas o palabras ajenas como propias sin atribución adecuada.

Las tres prácticas comprometen la credibilidad científica.

---$B41$,41 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conflictos_de_inter_s_41','Conflictos de interés',$B42$Existe conflicto de interés cuando intereses personales, económicos, profesionales o institucionales pueden influir —o parecer influir— en decisiones de investigación.

No todos los conflictos implican fraude, pero deben identificarse y gestionarse de forma transparente.

---$B42$,42 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_digo_de_n_remberg_42','Código de Núremberg',$B43$El Código de Núremberg es un antecedente histórico fundamental de la ética de investigación en seres humanos.

Para preparación CICDE interesa reconocer especialmente su relación con:

- consentimiento voluntario;
- protección frente a daño innecesario;
- justificación del estudio;
- responsabilidad del investigador.

El temario CICDE incluye el Código de Núremberg dentro de sus competencias básicas de investigación.

---$B43$,43 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'declaraci_n_de_helsinki_2024_43','Declaración de Helsinki 2024',$B44$La Asociación Médica Mundial señala que la **versión 2024** es la versión oficial vigente de la Declaración de Helsinki y que reemplaza las versiones anteriores.

Establece principios éticos para investigación médica con participantes humanos, incluyendo investigación que utiliza material humano o datos identificables.

### Importancia para el proyecto

Si un material de estudio utiliza Helsinki como referencia actual, debe utilizarse la versión 2024 y no citar una edición anterior como si fuera la vigente.

---$B44$,44 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'panam_ley_84_de_2019_44','Panamá — Ley 84 de 2019',$B45$La **Ley 84 de 14 de mayo de 2019** regula y promueve la investigación para la salud en Panamá y establece su rectoría y gobernanza.

La ley señala, entre otros objetivos:

- proteger integralmente la salud y los derechos humanos durante investigación;
- promover investigación para la salud;
- establecer buenas prácticas;
- coordinar actores del sistema de investigación e innovación para la salud.

También considera investigación para la salud el uso de información de la práctica médica para generar nuevo conocimiento mediante un protocolo que aplique metodología científica.

---$B45$,45 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'panam_decreto_ejecutivo_n_21_de_2026_45','Panamá — Decreto Ejecutivo N.° 21 de 2026',$B46$MINSA publicó el **Decreto Ejecutivo N.° 21 de 23 de abril de 2026**, que reglamenta los Títulos III y IV de la Ley 84 de 2019.

Para este módulo basta reconocer que el marco panameño de investigación para la salud **continúa reglamentándose y debe consultarse en su versión vigente**, particularmente en materias relacionadas con revisión ética y requisitos regulatorios.

Los detalles procedimentales específicos corresponden a formación más avanzada y a la normativa oficial aplicable al estudio concreto.

---$B46$,46 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'protocolo_de_investigaci_n_concepto_46','Protocolo de investigación: concepto',$B47$Un protocolo describe de manera organizada qué se propone estudiar y cómo se realizará.

Conceptualmente permite dejar explícitos:

- problema/pregunta;
- objetivos;
- procedimientos;
- participantes o datos;
- análisis;
- aspectos éticos;
- responsabilidades.

La elaboración detallada del protocolo corresponde a **RESEARCH-02**.

---$B47$,47 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ciclo_general_de_la_investigaci_n_47','Ciclo general de la investigación',$B48$Sin entrar todavía en metodología detallada:

```text
Problema o pregunta
      ↓
Planificación
      ↓
Revisión ética/regulatoria cuando corresponde
      ↓
Obtención de datos
      ↓
Análisis
      ↓
Interpretación
      ↓
Conclusiones
      ↓
Comunicación
      ↓
Aplicación / nuevas preguntas
```

La investigación suele generar nuevas preguntas además de respuestas.

---$B48$,48 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'resultados_conclusiones_y_l_mites_48','Resultados, conclusiones y límites',$B49$**Resultados:** lo que se obtuvo del análisis.

**Conclusiones:** interpretación sustentada por esos resultados.

**Limitaciones:** condiciones que reducen certeza, alcance o aplicabilidad.

### Error frecuente

Convertir una conclusión prudente en una afirmación absoluta.

---$B49$,49 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'divulgaci_n_de_resultados_49','Divulgación de resultados',$B50$CICDE incluye entre las competencias básicas la capacidad para divulgar resultados de investigación oralmente y por escrito.

Divulgar responsablemente significa:

- presentar resultados con fidelidad;
- diferenciar datos de opinión;
- reconocer limitaciones;
- proteger confidencialidad;
- evitar exagerar conclusiones.

---$B50$,50 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'inform_tica_y_gesti_n_de_datos_50','Informática y gestión de datos',$B51$CICDE también incluye la capacidad de utilizar informática en investigación.

La informática puede apoyar:

- búsqueda bibliográfica;
- captura de datos;
- bases de datos;
- análisis;
- visualización;
- comunicación de resultados.

Pero una herramienta digital no garantiza calidad: datos incorrectos producen análisis incorrectos.

---$B51$,51 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'aplicaci_n_de_resultados_a_la_pr_ctica_51','Aplicación de resultados a la práctica',$B52$Otra competencia CICDE consiste en aplicar resultados de investigaciones para mejorar el cuidado.

Antes de aplicar un resultado se pregunta:

1. ¿La evidencia es suficientemente confiable?
2. ¿La población se parece a nuestros pacientes?
3. ¿La intervención es segura?
4. ¿Existe normativa vigente?
5. ¿Hay recursos y competencia para implementarla?
6. ¿Cómo evaluaremos el resultado?

---$B52$,52 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_52','Errores frecuentes de examen',$B53$1. Creer que investigar equivale a buscar información en internet.
2. Confundir opinión de un experto con evidencia científica definitiva.
3. Suponer que una asociación demuestra causalidad.
4. Pensar que una muestra grande elimina todo sesgo.
5. Confundir investigación con auditoría.
6. Confundir investigación con práctica basada en evidencia.
7. Considerar el consentimiento como una simple firma.
8. Pensar que usar expedientes existentes elimina obligaciones éticas.
9. Creer que una conclusión puede ser más fuerte que los datos que la respaldan.
10. Ocultar resultados que contradicen la hipótesis.
11. Aplicar un estudio extranjero sin valorar contexto.
12. Citar una versión antigua de Helsinki como vigente cuando la WMA ya la reemplazó.

---$B53$,53 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_memorizar_53','Qué memorizar',$B54$- Investigación = indagación sistemática orientada a generar conocimiento.
- Investigación científica ≠ búsqueda informal de información.
- Dato ≠ interpretación.
- Asociación ≠ causalidad automática.
- Investigación produce evidencia; práctica basada en evidencia utiliza e integra evidencia.
- Rigor + transparencia + ética son inseparables.
- Consentimiento informado es un proceso.
- Fabricación, falsificación y plagio violan integridad científica.
- Panamá: **Ley 84 de 2019** regula y promueve investigación para la salud.
- En 2026, el **Decreto Ejecutivo N.° 21** reglamenta los Títulos III y IV de la Ley 84.
- Declaración de Helsinki vigente: **revisión 2024**.

---$B54$,54 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estrategia_cicde_para_research_01_54','Estrategia CICDE para RESEARCH-01',$B55$Ante una situación de examen:

**Paso 1:** identificar si realmente se está generando conocimiento o solo prestando atención/mejorando un proceso.  
**Paso 2:** separar dato, interpretación y conclusión.  
**Paso 3:** buscar riesgo de sesgo o conclusión exagerada.  
**Paso 4:** si hay personas/datos identificables, pensar en ética, privacidad y revisión correspondiente.  
**Paso 5:** escoger la conducta que conserve rigor, derechos e integridad científica.

---$B55$,55 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_55','Situaciones originales tipo examen',$B56$## Caso 1 — Búsqueda vs investigación
Una enfermera consulta cinco artículos para preparar una clase y afirma que “realizó una investigación científica”.

**Respuesta:** consultar literatura por sí solo no constituye necesariamente investigación científica; depende de que exista una pregunta y un proceso sistemático de generación/análisis de conocimiento.

## Caso 2 — Dato vs conclusión
En una sala se registraron más caídas durante el turno nocturno. El equipo concluye de inmediato que “el turno nocturno causa las caídas”.

**Respuesta:** la asociación observada no demuestra causalidad; deben analizarse otros factores y el diseño apropiado.

## Caso 3 — Evidencia contradictoria
Los resultados no apoyan la hipótesis del investigador.

**Conducta correcta:** reportar los hallazgos con fidelidad; no modificar ni ocultar datos para favorecer la hipótesis.

## Caso 4 — Investigación vs auditoría
Un hospital revisa 100 expedientes para determinar si se cumple un estándar institucional de documentación.

**Interpretación:** el objetivo principal descrito corresponde a auditoría; no debe llamarse automáticamente investigación.

## Caso 5 — Investigación vs práctica basada en evidencia
Una unidad revisa varios estudios, preferencias de pacientes y recursos antes de modificar un protocolo.

**Interpretación:** está utilizando un proceso de práctica basada en evidencia; la unidad no está necesariamente produciendo investigación nueva.

## Caso 6 — Consentimiento
Un participante firma un formulario sin comprender el estudio.

**Respuesta:** la firma por sí sola no asegura consentimiento informado válido; debe favorecerse comprensión y voluntariedad.

## Caso 7 — Datos de expedientes
Un estudiante quiere usar expedientes identificables para un proyecto y dice que no requiere revisión porque “no hablará con pacientes”.

**Respuesta:** incorrecto. El uso de datos identificables puede implicar investigación con seres humanos/datos personales y requiere valoración ética/regulatoria conforme al marco aplicable.

## Caso 8 — Muestra grande
Un estudio tiene 20 000 participantes pero seleccionó únicamente a personas de un grupo muy particular.

**Respuesta:** un tamaño grande no elimina sesgo de selección ni garantiza aplicabilidad a otras poblaciones.

## Caso 9 — Aplicación directa
Un solo estudio pequeño encuentra beneficio de una intervención y la jefa quiere convertirlo inmediatamente en norma institucional.

**Respuesta:** primero debe valorarse calidad, conjunto de evidencia, contexto, seguridad y normativa.

## Caso 10 — Integridad
Un investigador elimina registros que “dañan” la tendencia estadística sin criterio previamente definido.

**Respuesta:** manipular selectivamente datos compromete integridad y puede constituir falsificación.

## Caso 11 — Conflicto de interés
Una investigadora recibe financiamiento del fabricante del producto estudiado.

**Respuesta:** el vínculo debe declararse y gestionarse; no significa automáticamente fraude, pero puede influir en la investigación.

## Caso 12 — Población vulnerable
Se elige una población institucionalizada solo porque “será más fácil lograr que participe”.

**Respuesta:** es éticamente problemático; la selección debe justificarse científicamente y proteger frente a coerción o explotación.

## Caso 13 — Resultado local
Una intervención fue efectiva en un hospital altamente especializado y se quiere aplicar sin análisis en un centro rural con recursos distintos.

**Respuesta:** debe valorarse aplicabilidad y contexto antes de transferir el resultado.

## Caso 14 — Helsinki
Un material de estudio utiliza la Declaración de Helsinki 2013 como “versión vigente”.

**Respuesta:** debe actualizarse; la WMA establece que la versión oficial vigente es la revisión de 2024.

## Caso 15 — Panamá
Un proyecto de investigación para la salud en Panamá se diseña ignorando la Ley 84 de 2019 porque “es un estudio académico”.

**Respuesta:** incorrecto. La investigación para la salud debe ajustarse al marco regulatorio panameño aplicable.

## Caso 16 — Cuidado inmediato
Durante un estudio, un participante presenta una amenaza clínica aguda.

**Prioridad:** proteger la seguridad y bienestar de la persona; el cumplimiento del protocolo no justifica ignorar una urgencia clínica.

---$B56$,56 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_56','Preguntas rápidas de repaso',$B57$**1. ¿Qué distingue a la investigación científica de una búsqueda informal?**  
Un proceso sistemático, explícito y crítico orientado a generar conocimiento.

**2. ¿Dato e interpretación son lo mismo?**  
No.

**3. ¿Una asociación demuestra causalidad?**  
No necesariamente.

**4. ¿Qué produce la investigación?**  
Conocimiento/evidencia.

**5. ¿Qué hace la práctica basada en evidencia?**  
Integra evidencia con juicio profesional, contexto y valores/preferencias.

**6. ¿El consentimiento es solo una firma?**  
No; es un proceso de información, comprensión y decisión voluntaria.

**7. ¿Qué norma panameña regula y promueve investigación para la salud?**  
Ley 84 de 2019.

**8. ¿Qué decreto de 2026 reglamenta los Títulos III y IV de la Ley 84?**  
Decreto Ejecutivo N.° 21 de 23 de abril de 2026.

**9. ¿Cuál es la versión vigente de la Declaración de Helsinki?**  
La revisión 2024.

**10. ¿Qué prácticas violan claramente la integridad científica?**  
Fabricación, falsificación y plagio.

---$B57$,57 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_57','Fuentes y validación',$B58$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define RESEARCH-01 como **“Concepto de investigación”** y establece competencias básicas de investigación.

## Bibliografía principal indicada por CICDE

2. **Hernández Sampieri, R.; Fernández Collado, C.; Baptista Lucio, M. P.** _Metodología de la investigación_. 6.ª edición. McGraw-Hill Education, 2014. ISBN 9781456223960.  
   La edición y metadatos se verificaron mediante catálogos académicos, incluido el Sistema de Bibliotecas de la Universidad de Panamá. Este paquete no atribuye páginas específicas ni reproduce texto protegido del libro.

## Fuentes internacionales complementarias

3. **World Health Organization. Research — Health research.**  
   https://www.who.int/health-topics/health-research

4. **Pan American Health Organization. Research.**  
   https://www.paho.org/en/topics/research

5. **World Medical Association. Declaración de Helsinki — Investigación médica con participantes humanos. Revisión 2024.**  
   https://www.wma.net/es/que-hacemos/etica-medica/declaracion-de-helsinki/

6. **National Institute of Environmental Health Sciences (NIH). What Is Ethics in Research & Why Is It Important?**  
   https://www.niehs.nih.gov/research/resources/bioethics/whatis

## Panamá — fuentes oficiales

7. **Ley 84 de 14 de mayo de 2019.** Que regula y promueve la investigación para la salud y establece su rectoría y gobernanza.  
   Ministerio de Salud / Gaceta Oficial de Panamá.  
   https://minsa.gob.pa/normatividad/ley-84-de-2019

8. **Decreto Ejecutivo N.° 21 de 23 de abril de 2026.** Reglamenta los Títulos III y IV de la Ley 84 de 2019.  
   Ministerio de Salud de Panamá.  
   https://minsa.gob.pa/normatividad

---$B58$,58 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actualizaciones_y_l_mites_de_interpretaci_n_58','Actualizaciones y límites de interpretación',$B59$- CICDE no enumera subtemas para RESEARCH-01; las secciones de este paquete son una estructura pedagógica, no una transcripción de subtemas oficiales.
- No se desarrolla todavía el proceso metodológico completo; corresponde a RESEARCH-02.
- No se desarrolla la clasificación exhaustiva de tipos/diseños; corresponde a RESEARCH-03.
- La Ley 84 de 2019 sigue siendo referencia central del marco panameño de investigación para la salud; en 2026 MINSA publicó el Decreto Ejecutivo N.° 21 que reglamenta sus Títulos III y IV.
- La Declaración de Helsinki fue revisada en 2024. La WMA indica que esa versión reemplaza las anteriores para uso actual.
- Los requisitos concretos de un protocolo real deben comprobarse contra normativa, comité de bioética e institución aplicables; este material es preparación académica y no sustituye asesoría regulatoria.

---$B59$,59 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_59','Control de calidad',$B60$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- no se inventaron subtemas CICDE;
- bibliografía principal conservada: Hernández Sampieri 6.ª ed.;
- definición de investigación en salud contrastada con OMS/OPS;
- Ley 84 de 2019 contrastada con MINSA y Gaceta Oficial;
- actualización regulatoria 2026 identificada mediante Decreto Ejecutivo N.° 21;
- Declaración de Helsinki actualizada a revisión 2024;
- se diferencia investigación de auditoría, mejora de calidad y práctica basada en evidencia;
- ética e integridad científica integradas sin sustituir RESEARCH-02;
- situaciones tipo examen son originales;
- no se reproducen páginas o capítulos protegidos de Hernández Sampieri;
- no se declara revisión humana inexistente.

---$B60$,60 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_60','Estado para integración',$B61$**Estado:** `REVIEW`

Motivo:

- el alcance y contenido fueron sometidos a revisión documental/académica;
- todavía no existe revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` únicamente por revisión realizada por IA.

**Cobertura CICDE RESEARCH-01: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 16.**$B61$,61 FROM tmap WHERE c='RESEARCH-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B62$El temario CICDE 2026 incluye dentro del área **Investigación** el tema:

> **Metodología de investigación**

El lineamiento no subdivide RESEARCH-02 en subtemas explícitos. Para desarrollar el tema sin inventar una estructura CICDE inexistente, este material utiliza como referencia académica principal la obra citada por el propio lineamiento:

**Hernández Sampieri, Roberto; Fernández Collado, Carlos; Baptista Lucio, Pilar. _Metodología de la Investigación_. 6.ª edición. McGraw-Hill, 2014.**

La obra organiza el proceso de investigación alrededor de elementos como idea, planteamiento del problema, revisión de literatura, alcance, hipótesis cuando correspondan, diseño, muestra, recolección, análisis y reporte; además desarrolla procesos cuantitativos, cualitativos y mixtos.

Para investigación para la salud en Panamá se incorpora, como capa regulatoria vigente, la **Ley 84 de 14 de mayo de 2019** y el **Decreto Ejecutivo N.° 21 de 23 de abril de 2026**.

Este módulo no sustituye RESEARCH-03. Aquí interesa **cómo se construye y ejecuta metodológicamente una investigación**; la clasificación sistemática de tipos de investigación se profundizará en el tema siguiente.

---$B62$,1 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B63$Al finalizar el tema, el estudiante debe poder:

1. Explicar qué significa metodología de investigación.
2. Transformar una idea amplia en un problema investigable.
3. Formular preguntas y objetivos coherentes.
4. Justificar la relevancia y factibilidad de un estudio.
5. Reconocer la función de la revisión de literatura y del marco teórico.
6. Diferenciar hipótesis, variables, definiciones operacionales y categorías cualitativas.
7. Identificar población, unidad de análisis, muestra y estrategia de muestreo.
8. Reconocer la necesidad de un diseño congruente con la pregunta.
9. Seleccionar y valorar instrumentos de recolección de datos.
10. Explicar validez, confiabilidad y prueba piloto en términos aplicados.
11. Identificar riesgos de sesgo y problemas de calidad de datos.
12. Relacionar la recolección con un plan de análisis previamente definido.
13. Diferenciar análisis cuantitativo y cualitativo de manera conceptual.
14. Interpretar resultados sin confundir asociación con causalidad.
15. Reconocer la ética como parte del diseño y no como trámite final.
16. Aplicar principios básicos del marco panameño de investigación para la salud.
17. Comunicar resultados con transparencia, incluyendo limitaciones.
18. Resolver situaciones tipo CICDE sobre coherencia metodológica y seguridad de participantes.

---$B63$,2 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_es_metodolog_a_de_investigaci_n_2','Qué es metodología de investigación',$B64$La **metodología de investigación** es el conjunto organizado de decisiones y procedimientos que permiten responder una pregunta de manera sistemática, lógica, ética y verificable.

No consiste solamente en “aplicar una encuesta”. Incluye decidir:

- qué problema se estudiará;
- por qué importa;
- qué se sabe previamente;
- qué pregunta se responderá;
- qué información se necesita;
- de quién o de qué se obtendrá;
- cómo se recolectará;
- cómo se analizará;
- cómo se protegerá a los participantes;
- cómo se interpretarán y comunicarán los resultados.

---$B64$,3 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'m_todo_metodolog_a_y_t_cnica_3','Método, metodología y técnica',$B65$**Método:** ruta general y lógica utilizada para generar conocimiento.

**Metodología:** reflexión y organización de los métodos y decisiones utilizadas en un estudio concreto.

**Técnica:** procedimiento específico para obtener o trabajar información.

Ejemplos de técnicas:

- entrevista;
- observación;
- cuestionario;
- medición fisiológica;
- revisión de expedientes.

### Error frecuente

Confundir el instrumento o la técnica con toda la metodología.

---$B65$,4 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_proceso_no_es_una_receta_mec_nica_4','El proceso no es una receta mecánica',$B66$Un proyecto debe tener orden, pero la investigación real puede requerir ajustes.

La revisión de literatura puede modificar la pregunta.  
Una prueba piloto puede revelar problemas en el instrumento.  
El acceso real a la población puede obligar a revisar la estrategia de muestreo.

Lo importante es que los cambios sean:

- justificados;
- documentados;
- éticamente aceptables;
- coherentes con el objetivo;
- realizados antes de interpretar resultados de forma oportunista.

---$B66$,5 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'de_la_idea_al_problema_5','De la idea al problema',$B67$Una investigación puede comenzar con una idea amplia:

> “Quiero estudiar las caídas en adultos mayores hospitalizados.”

Eso todavía no constituye un problema de investigación delimitado.

Debe precisarse:

- qué aspecto de las caídas;
- en qué población;
- en qué contexto;
- durante qué periodo;
- qué relación, experiencia o fenómeno interesa comprender.

---$B67$,6 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_de_ideas_de_investigaci_n_6','Fuentes de ideas de investigación',$B68$Las ideas pueden surgir de:

- problemas observados en la práctica;
- preguntas de pacientes o familias;
- eventos adversos;
- resultados contradictorios;
- vacíos de conocimiento;
- literatura científica;
- programas de salud;
- cambios normativos;
- necesidades comunitarias;
- experiencias clínicas repetidas.

En enfermería, una dificultad cotidiana puede transformarse en una pregunta de investigación si se delimita de forma científica.

---$B68$,7 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'delimitaci_n_del_problema_7','Delimitación del problema',$B69$Delimitar significa hacer el problema investigable.

Puede requerir especificar:

- población;
- lugar;
- tiempo;
- variables o fenómeno;
- contexto clínico/social;
- disponibilidad de datos.

Un problema demasiado amplio produce objetivos vagos, instrumentos desorganizados y análisis poco útil.

---$B69$,8 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'planteamiento_del_problema_8','Planteamiento del problema',$B70$Un buen planteamiento explica:

- qué ocurre;
- qué se conoce;
- qué falta conocer;
- por qué importa;
- a quién afecta;
- qué pregunta concreta surge.

No es simplemente una introducción extensa. Debe conducir de forma lógica a la pregunta de investigación.

---$B70$,9 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pregunta_de_investigaci_n_9','Pregunta de investigación',$B71$La pregunta debe ser:

- clara;
- específica;
- investigable;
- ética;
- coherente con los recursos disponibles.

Ejemplo demasiado amplio:

> “¿Cómo está la enfermería?”

Ejemplo más investigable:

> “¿Cuál es la frecuencia de omisiones en el registro de valoración del dolor en pacientes adultos de una unidad determinada durante un periodo definido?”

---$B71$,10 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivo_general_10','Objetivo general',$B72$El objetivo general expresa **qué pretende lograr el estudio**.

Debe mantener correspondencia directa con la pregunta.

Ejemplo:

> Determinar la frecuencia de omisiones en el registro de valoración del dolor en pacientes adultos de la unidad X durante el periodo Y.

Evitar objetivos que prometan más de lo que el estudio puede demostrar.

---$B72$,11 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_espec_ficos_11','Objetivos específicos',$B73$Descomponen el objetivo general en logros concretos.

Pueden incluir:

- describir características;
- medir una variable;
- comparar grupos;
- identificar factores asociados;
- explorar experiencias;
- analizar percepciones;
- evaluar un proceso.

No deben ser una lista de actividades administrativas como “buscar artículos” o “aplicar encuestas”, salvo que esas actividades constituyan realmente un objetivo metodológico específico.

---$B73$,12 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'coherencia_entre_pregunta_objetivos_y_m_todo_12','Coherencia entre pregunta, objetivos y método',$B74$Esta es una de las reglas más importantes del módulo.

```text
Pregunta
   ↓
Objetivos
   ↓
Diseño
   ↓
Población/muestra
   ↓
Datos necesarios
   ↓
Instrumento
   ↓
Análisis
   ↓
Conclusión
```

Si la conclusión responde algo distinto de la pregunta original, existe una ruptura metodológica.

---$B74$,13 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'justificaci_n_13','Justificación',$B75$La justificación responde:

> ¿Por qué vale la pena hacer este estudio?

Puede considerar:

- relevancia clínica;
- relevancia social;
- seguridad del paciente;
- vacío de conocimiento;
- utilidad para gestión;
- impacto potencial en educación;
- contribución disciplinar;
- necesidad normativa o de política pública.

No basta decir “porque es importante”.

---$B75$,14 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'viabilidad_y_factibilidad_14','Viabilidad y factibilidad',$B76$Antes de comenzar se valora:

- tiempo;
- acceso a población;
- recursos humanos;
- presupuesto;
- equipos;
- permisos;
- competencia del equipo;
- posibilidad de reclutar participantes;
- capacidad para analizar datos;
- exigencias éticas y regulatorias.

Un estudio científicamente interesante puede ser inviable en un contexto determinado.

---$B76$,15 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'relevancia_para_enfermer_a_15','Relevancia para enfermería',$B77$La metodología debe ayudar a responder problemas que mejoren:

- cuidado;
- seguridad;
- educación;
- gestión;
- experiencia del paciente;
- resultados clínicos;
- salud comunitaria;
- trabajo del personal;
- políticas de enfermería.

La pregunta debe conectar con una necesidad real y no únicamente con la facilidad de obtener datos.

---$B77$,16 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'revisi_n_de_la_literatura_16','Revisión de la literatura',$B78$La revisión de literatura permite:

- conocer antecedentes;
- evitar duplicación innecesaria;
- identificar conceptos;
- reconocer métodos previos;
- detectar controversias;
- encontrar instrumentos;
- fundamentar la pregunta;
- interpretar resultados posteriormente.

No es una colección de citas sin relación.

---$B78$,17 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'b_squeda_bibliogr_fica_17','Búsqueda bibliográfica',$B79$Una búsqueda organizada requiere:

1. conceptos principales;
2. términos y sinónimos;
3. fuentes/bases pertinentes;
4. criterios de selección;
5. registro de lo buscado;
6. evaluación de pertinencia.

En una plataforma educativa, la búsqueda debe distinguir fuentes primarias, guías, normas, revisiones y textos académicos.

---$B79$,18 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'calidad_y_actualidad_de_las_fuentes_18','Calidad y actualidad de las fuentes',$B80$Valorar:

- autoridad;
- metodología;
- fecha;
- pertinencia;
- consistencia;
- contexto;
- conflicto de interés;
- nivel de acceso disponible.

Una fuente antigua puede seguir siendo válida para conceptos históricos, pero puede ser insuficiente para normas, tratamientos o políticas vigentes.

---$B80$,19 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'perspectiva_te_rica_y_marco_te_rico_19','Perspectiva teórica y marco teórico',$B81$La perspectiva teórica ayuda a interpretar el problema desde conceptos y conocimiento acumulado.

El marco teórico no debe convertirse en un “resumen de todo el tema”. Debe apoyar:

- variables o conceptos;
- relaciones esperadas;
- interpretación del fenómeno;
- selección metodológica.

---$B81$,20 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'antecedentes_del_problema_20','Antecedentes del problema',$B82$Los antecedentes resumen investigaciones relevantes previas.

Interesa identificar:

- qué estudiaron;
- en qué población;
- cómo lo estudiaron;
- qué encontraron;
- qué limitaciones tuvieron;
- qué queda pendiente.

Esto ayuda a justificar el nuevo estudio.

---$B82$,21 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'marco_conceptual_21','Marco conceptual',$B83$Cuando es necesario, se definen de manera clara los conceptos centrales.

Ejemplo:

Si se estudia “adherencia”, debe precisarse qué significa dentro del estudio y cómo se reconocerá o medirá.

No asumir que todos los lectores interpretan un término de la misma manera.

---$B83$,22 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_del_estudio_22','Alcance del estudio',$B84$La investigación debe dejar claro qué pretende lograr y qué no.

La 6.ª edición de Hernández Sampieri desarrolla alcances como exploración, descripción, asociación/correlación y explicación dentro del proceso cuantitativo.

En RESEARCH-03 se profundizarán las clasificaciones. Aquí la regla es:

> **el alcance condiciona el tipo de conclusión que puede defenderse.**

---$B84$,23 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hip_tesis_23','Hipótesis',$B85$Una hipótesis propone una respuesta o relación esperada que puede someterse a contraste cuando el diseño y la pregunta lo requieren.

Ejemplo conceptual:

> Mayor carga de trabajo se asocia con mayor frecuencia de omisiones de cuidado.

Debe existir coherencia entre:

- hipótesis;
- variables;
- medición;
- análisis.

---$B85$,24 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cu_ndo_no_corresponde_una_hip_tesis_formal_24','Cuándo no corresponde una hipótesis formal',$B86$No todo estudio necesita una hipótesis planteada desde el inicio.

En algunas investigaciones:

- el objetivo es describir;
- el fenómeno está poco estudiado;
- el proceso cualitativo busca comprender significados;
- las proposiciones pueden emerger durante el análisis.

### Error frecuente

Agregar una hipótesis únicamente porque “toda investigación debe tener una”.

---$B86$,25 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'variables_25','Variables',$B87$Una variable es una característica que puede asumir diferentes valores o categorías.

Ejemplos:

- edad;
- presión arterial;
- turno;
- satisfacción;
- ocurrencia de caída;
- nivel de conocimiento.

La variable debe estar vinculada al objetivo y al plan de análisis.

---$B87$,26 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'definici_n_conceptual_y_operacional_26','Definición conceptual y operacional',$B88$**Definición conceptual:** qué significa la variable teóricamente.

**Definición operacional:** cómo será observada o medida en el estudio.

Ejemplo:

“Adherencia al protocolo” no puede quedar como concepto abstracto si después debe medirse. Debe definirse qué acciones o criterios indicarán cumplimiento.

---$B88$,27 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'indicadores_y_medici_n_27','Indicadores y medición',$B89$Un indicador convierte un concepto en información observable.

Debe especificarse:

- qué representa;
- cómo se calcula o clasifica;
- fuente de datos;
- unidad;
- momento de medición.

No confundir un indicador con toda la variable si solo captura una parte del fenómeno.

---$B89$,28 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_as_en_investigaci_n_cualitativa_28','Categorías en investigación cualitativa',$B90$En investigación cualitativa el análisis puede organizarse mediante:

- códigos;
- categorías;
- temas;
- patrones;
- significados.

Las categorías pueden partir parcialmente del marco conceptual o emerger del material, dependiendo del enfoque y diseño.

No deben forzarse los datos dentro de categorías que no los representan.

---$B90$,29 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'poblaci_n_29','Población',$B91$La población es el conjunto de personas, registros, eventos u otras unidades sobre las que interesa producir conocimiento.

Debe definirse con precisión.

Ejemplo insuficiente:

> “Enfermeras de Panamá.”

Ejemplo más delimitado:

> “Enfermeras que laboran en determinadas unidades hospitalarias durante el periodo definido y cumplen criterios establecidos.”

---$B91$,30 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'poblaci_n_accesible_y_unidad_de_an_lisis_30','Población accesible y unidad de análisis',$B92$**Población objetivo:** grupo al que se desea aplicar el conocimiento.

**Población accesible:** parte de ese grupo a la cual el investigador realmente puede acceder.

**Unidad de análisis:** elemento del cual se obtendrá la información.

Puede ser:

- persona;
- familia;
- expediente;
- turno;
- procedimiento;
- institución;
- evento.

---$B92$,31 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'criterios_de_inclusi_n_y_exclusi_n_31','Criterios de inclusión y exclusión',$B93$Definen quién o qué puede formar parte del estudio.

Deben establecerse antes de seleccionar la muestra y justificarse metodológicamente.

No deben manipularse después de ver los resultados para favorecer una conclusión.

---$B93$,32 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'muestra_32','Muestra',$B94$La muestra es una parte de la población utilizada para obtener información.

La calidad de una muestra depende de:

- cómo fue seleccionada;
- tamaño;
- representatividad cuando corresponda;
- pérdidas/no respuesta;
- relación con el objetivo.

Una muestra grande no corrige automáticamente un muestreo sesgado.

---$B94$,33 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'muestreo_probabil_stico_33','Muestreo probabilístico',$B95$En el muestreo probabilístico, las unidades tienen una probabilidad conocida de selección según el procedimiento establecido.

Favorece determinadas inferencias hacia la población cuando el diseño, ejecución y análisis son adecuados.

No significa que el estudio quede libre de otros sesgos.

---$B95$,34 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'muestreo_no_probabil_stico_34','Muestreo no probabilístico',$B96$La selección puede basarse en:

- disponibilidad;
- criterios;
- propósito;
- acceso;
- características específicas.

Puede ser apropiada para determinados objetivos, pero limita ciertas generalizaciones.

### Clave de examen

No presentar una muestra por conveniencia como si fuera una muestra aleatoria.

---$B96$,35 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tama_o_de_muestra_35','Tamaño de muestra',$B97$El tamaño depende, entre otros factores, de:

- objetivo;
- diseño;
- variabilidad;
- precisión deseada;
- frecuencia esperada;
- análisis planeado;
- población disponible;
- pérdidas previstas.

No existe un único número correcto para todos los estudios.

---$B97$,36 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'muestreo_cualitativo_36','Muestreo cualitativo',$B98$En investigación cualitativa la selección suele orientarse a participantes o casos capaces de aportar información relevante sobre el fenómeno.

La suficiencia no se decide solamente por un número fijo universal.

Puede considerarse la riqueza de información y el punto en que nuevas incorporaciones dejan de aportar elementos sustancialmente nuevos, según el enfoque utilizado.

---$B98$,37 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sesgo_de_selecci_n_37','Sesgo de selección',$B99$Ocurre cuando el modo de seleccionar o retener participantes produce diferencias sistemáticas relevantes.

Ejemplo:

Estudiar satisfacción de pacientes incluyendo únicamente a quienes voluntariamente regresan a una reunión puede excluir sistemáticamente otras experiencias.

El sesgo debe anticiparse desde el diseño.

---$B99$,38 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_del_estudio_38','Diseño del estudio',$B100$El diseño es el plan que conecta la pregunta con la obtención de evidencia.

Debe especificar:

- qué se observará;
- cuándo;
- en quién;
- si existe intervención;
- cómo se comparará;
- qué datos se obtendrán;
- cómo se responderá el objetivo.

RESEARCH-03 profundizará las categorías de diseños.

---$B100$,39 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'temporalidad_y_secuencia_39','Temporalidad y secuencia',$B101$Es importante establecer:

- cuándo se mide la exposición;
- cuándo se observa el resultado;
- si los datos corresponden a un punto o varios momentos;
- si se utilizan datos previos o se sigue a participantes hacia adelante.

La secuencia temporal influye en la interpretación causal.

---$B101$,40 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'protocolo_de_investigaci_n_40','Protocolo de investigación',$B102$El protocolo documenta de manera anticipada cómo se realizará el estudio.

Suele incluir:

- título;
- antecedentes;
- problema;
- pregunta;
- objetivos;
- metodología;
- población/muestra;
- instrumentos;
- procedimientos;
- análisis;
- consideraciones éticas;
- cronograma;
- referencias;
- anexos necesarios.

Su estructura exacta puede variar por institución y normativa.

---$B102$,41 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'plan_de_recolecci_n_de_datos_41','Plan de recolección de datos',$B103$Debe especificar:

- quién recolecta;
- qué datos;
- con qué instrumento;
- cuándo;
- dónde;
- cuántas veces;
- qué hacer ante datos incompletos;
- cómo verificar calidad;
- cómo proteger información.

No dejar decisiones críticas para improvisarlas durante el trabajo de campo.

---$B103$,42 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'instrumentos_de_recolecci_n_42','Instrumentos de recolección',$B104$Ejemplos:

- cuestionario;
- escala;
- guía de entrevista;
- guía de observación;
- formulario de extracción de expedientes;
- equipo de medición.

Un instrumento debe corresponder a la variable o fenómeno que se desea estudiar.

---$B104$,43 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'validez_43','Validez',$B105$La validez se relaciona con el grado en que la evidencia respalda la interpretación que se hace de una medición o del estudio.

En términos prácticos:

> ¿Estamos midiendo o interpretando realmente aquello que afirmamos estudiar?

No debe tratarse como una etiqueta automática de “instrumento válido para todo”.

---$B105$,44 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confiabilidad_44','Confiabilidad',$B106$La confiabilidad se relaciona con la consistencia de la medición bajo condiciones definidas.

Una medición puede ser consistente y, sin embargo, no medir adecuadamente el concepto que interesa.

Por eso confiabilidad y validez no son sinónimos.

---$B106$,45 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prueba_piloto_45','Prueba piloto',$B107$La prueba piloto permite detectar problemas antes de la ejecución principal.

Puede revelar:

- preguntas ambiguas;
- tiempo excesivo;
- fallas de logística;
- campos faltantes;
- dificultades de comprensión;
- problemas del flujo de datos.

Los cambios posteriores deben quedar documentados.

---$B107$,46 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estandarizaci_n_de_procedimientos_46','Estandarización de procedimientos',$B108$Si distintas personas recolectan información, deben aplicar criterios comparables.

Puede requerir:

- manuales;
- definiciones operacionales;
- entrenamiento;
- calibración;
- instrucciones para situaciones especiales;
- supervisión.

Esto reduce variaciones evitables.

---$B108$,47 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'capacitaci_n_del_equipo_47','Capacitación del equipo',$B109$El equipo debe comprender:

- objetivo;
- procedimiento;
- instrumento;
- ética;
- confidencialidad;
- consentimiento;
- manejo de eventos inesperados;
- registro de desviaciones.

No asumir que conocer clínicamente un tema equivale a saber recolectar datos de investigación de forma estandarizada.

---$B109$,48 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'gesti_n_de_datos_48','Gestión de datos',$B110$Antes de recolectar se planifica:

- identificación/codificación;
- captura;
- almacenamiento;
- respaldo;
- control de acceso;
- limpieza;
- correcciones;
- conservación;
- eliminación cuando corresponda.

La gestión de datos es parte del método y de la ética.

---$B110$,49 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'calidad_de_datos_49','Calidad de datos',$B111$Evaluar:

- completitud;
- exactitud;
- coherencia;
- oportunidad;
- duplicados;
- valores imposibles;
- trazabilidad de cambios.

Una base de datos grande pero de mala calidad puede producir conclusiones incorrectas.

---$B111$,50 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'datos_faltantes_50','Datos faltantes',$B112$Los datos faltantes deben:

- identificarse;
- cuantificarse;
- investigarse cuando sea posible;
- manejarse mediante un plan coherente.

No deben inventarse valores para “completar” la base.

El patrón de ausencia puede introducir sesgo.

---$B112$,51 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confidencialidad_y_seguridad_de_datos_51','Confidencialidad y seguridad de datos',$B113$Medidas posibles:

- códigos en lugar de nombres cuando sea apropiado;
- acceso limitado;
- almacenamiento seguro;
- separación de identificadores;
- transmisión protegida;
- uso mínimo necesario de datos personales.

La confidencialidad no depende únicamente de “quitar el nombre”; una combinación de datos puede permitir reidentificación.

---$B113$,52 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'plan_de_an_lisis_52','Plan de análisis',$B114$Debe pensarse **antes** de recolectar los datos.

Relaciona:

- objetivo;
- variable/categoría;
- tipo de dato;
- comparación;
- método analítico;
- forma de presentación.

Recolectar información sin saber cómo responderá la pregunta genera datos innecesarios o insuficientes.

---$B114$,53 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'an_lisis_cuantitativo_53','Análisis cuantitativo',$B115$Puede incluir:

- organización de datos;
- frecuencias;
- porcentajes;
- medidas de tendencia central;
- dispersión;
- estimación;
- comparación;
- análisis de asociación;
- modelos cuando correspondan.

La técnica depende de la pregunta, el diseño y las características de los datos.

---$B115$,54 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'significancia_estad_stica_y_relevancia_cl_nica_54','Significancia estadística y relevancia clínica',$B116$Un resultado estadísticamente significativo no es automáticamente importante para el paciente o para la práctica.

También deben considerarse:

- magnitud del efecto;
- precisión;
- riesgo/beneficio;
- contexto;
- relevancia clínica;
- consistencia con otras evidencias.

---$B116$,55 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'asociaci_n_no_equivale_a_causalidad_55','Asociación no equivale a causalidad',$B117$Si dos variables se relacionan, no significa necesariamente que una cause a la otra.

Puede existir:

- confusión;
- causalidad inversa;
- sesgo;
- coincidencia;
- factores no medidos.

### Clave de examen

No usar lenguaje causal si el diseño solamente demuestra asociación.

---$B117$,56 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'an_lisis_cualitativo_56','Análisis cualitativo',$B118$El análisis cualitativo busca organizar e interpretar información como:

- entrevistas;
- relatos;
- observaciones;
- documentos.

Puede implicar:

1. familiarización;
2. codificación;
3. agrupación;
4. construcción de categorías/temas;
5. comparación;
6. interpretación;
7. revisión de coherencia con los datos.

---$B118$,57 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'triangulaci_n_y_credibilidad_57','Triangulación y credibilidad',$B119$La credibilidad puede fortalecerse utilizando estrategias apropiadas al enfoque, como:

- comparar diferentes fuentes;
- utilizar más de un investigador;
- contrastar métodos;
- documentar decisiones;
- revisar interpretaciones;
- buscar casos que contradigan una explicación sencilla.

No es una lista obligatoria idéntica para todo estudio.

---$B119$,58 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interpretaci_n_de_resultados_58','Interpretación de resultados',$B120$Interpretar significa responder:

- ¿qué significan los hallazgos?;
- ¿responden la pregunta?;
- ¿coinciden con estudios previos?;
- ¿qué explicaciones alternativas existen?;
- ¿qué implicaciones tienen?;
- ¿qué no puede concluirse?

No convertir una tabla en una conclusión sin razonamiento.

---$B120$,59 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'limitaciones_59','Limitaciones',$B121$Toda investigación tiene límites.

Pueden relacionarse con:

- selección;
- medición;
- muestra;
- pérdidas;
- datos faltantes;
- contexto;
- diseño;
- generalización;
- confusión.

Reconocerlas aumenta transparencia; no “arruina” automáticamente el estudio.

---$B121$,60 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_desde_el_dise_o_60','Ética desde el diseño',$B122$La ética comienza antes del consentimiento.

Preguntas esenciales:

- ¿el estudio tiene valor?;
- ¿la pregunta justifica exponer a personas a cargas o riesgos?;
- ¿el diseño puede responderla?;
- ¿la selección es justa?;
- ¿se minimizan riesgos?;
- ¿se protege privacidad?;
- ¿existe revisión ética cuando corresponde?

Un estudio metodológicamente incapaz de responder su pregunta también plantea un problema ético si expone participantes sin utilidad científica razonable.

---$B122$,61 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'consentimiento_informado_61','Consentimiento informado',$B123$El consentimiento es un **proceso**, no solo una firma.

Debe favorecer:

- información comprensible;
- voluntariedad;
- oportunidad de preguntar;
- comprensión;
- decisión sin coerción;
- documentación según corresponda.

Existen situaciones especiales que requieren considerar representación, asentimiento, urgencia u otras reglas específicas según normativa.

---$B123$,62 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'revisi_n_por_comit_de_bio_tica_62','Revisión por comité de bioética',$B124$Cuando corresponde, el protocolo debe ser revisado por un comité competente antes de iniciar actividades de investigación con participantes.

La revisión ética evalúa aspectos como:

- riesgos y beneficios;
- selección;
- consentimiento;
- privacidad;
- protección de grupos vulnerables;
- valor científico/social;
- manejo de datos.

La aprobación ética no sustituye la responsabilidad continua del investigador.

---$B124$,63 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'panam_ley_84_de_2019_y_decreto_ejecutivo_21_de_202_63','Panamá: Ley 84 de 2019 y Decreto Ejecutivo 21 de 2026',$B125$La **Ley 84 de 14 de mayo de 2019** regula y promueve la investigación para la salud y establece su rectoría y gobernanza en Panamá.

En 2026, el **Decreto Ejecutivo N.° 21 de 23 de abril de 2026** reglamentó los Títulos III y IV de dicha Ley.

Para preparación CICDE interesa comprender que la investigación para la salud en Panamá tiene un marco formal de:

- gobernanza;
- revisión ética;
- protección de participantes;
- gestión de proyectos;
- responsabilidades institucionales.

No debe presentarse un proyecto de investigación sanitaria como una actividad académica sin obligaciones regulatorias.

---$B125$,64 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registro_y_seguimiento_de_investigaci_n_para_la_sa_64','Registro y seguimiento de investigación para la salud en Panamá',$B126$MINSA mantiene una sección oficial de **Regulación de Investigación para la Salud** con la Ley 84, el Decreto Ejecutivo 21 de 2026 y procedimientos de registro y seguimiento.

El **Comité Nacional de Bioética de la Investigación (CNBI)** acredita y supervisa los comités institucionales competentes y participa en la protección de participantes y calidad ética del sistema.

### Regla

Los procedimientos exactos pueden actualizarse. Para un proyecto real deben consultarse los requisitos oficiales vigentes, no confiar únicamente en apuntes antiguos.

---$B126$,65 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reporte_y_divulgaci_n_65','Reporte y divulgación',$B127$El reporte debe permitir comprender:

- por qué se hizo el estudio;
- cómo se realizó;
- qué se encontró;
- qué limitaciones existen;
- qué significan los hallazgos.

Los resultados negativos o no esperados también forman parte del conocimiento y no deben ocultarse por conveniencia.

---$B127$,66 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integridad_y_trazabilidad_66','Integridad y trazabilidad',$B128$Debe ser posible reconstruir:

- qué protocolo se utilizó;
- qué versión del instrumento;
- quién recolectó;
- qué cambios se hicieron;
- cómo se limpiaron datos;
- cómo se analizó;
- qué decisiones metodológicas se tomaron.

Evitar:

- fabricación de datos;
- falsificación;
- manipulación selectiva;
- plagio;
- modificación oportunista de criterios después de observar resultados.

---$B128$,67 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_67','Errores frecuentes de examen',$B129$1. Empezar a recolectar datos sin una pregunta clara.
2. Confundir objetivo con actividad.
3. Utilizar un instrumento porque “ya existe” sin comprobar que mida el concepto requerido.
4. Definir la muestra después de ver quién respondió.
5. Llamar aleatorio a un muestreo por conveniencia.
6. Creer que una muestra grande elimina todo sesgo.
7. Forzar una hipótesis en cualquier estudio.
8. Confundir confiabilidad con validez.
9. Iniciar trabajo con participantes antes de las revisiones/aprobaciones requeridas.
10. Recolectar datos que no se relacionan con objetivos.
11. Cambiar criterios para favorecer resultados.
12. Interpretar asociación como causalidad.
13. Confundir significancia estadística con importancia clínica.
14. Omitir datos faltantes.
15. Concluir más allá de la población/diseño.
16. Ocultar limitaciones.
17. Pensar que ética = únicamente consentimiento.
18. Confundir RESEARCH-02 con una clasificación exhaustiva de tipos de investigación.

---$B129$,68 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estrategia_cicde_para_research_02_68','Estrategia CICDE para RESEARCH-02',$B130$Ante una situación metodológica:

**Paso 1:** identificar la pregunta u objetivo.  
**Paso 2:** determinar qué información hace falta.  
**Paso 3:** verificar si población, muestra e instrumento corresponden.  
**Paso 4:** buscar errores de sesgo, medición o procedimiento.  
**Paso 5:** comprobar que el análisis puede responder el objetivo.  
**Paso 6:** revisar protección ética y normativa.  
**Paso 7:** escoger la respuesta que preserve coherencia metodológica y seguridad de participantes.

---$B130$,69 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_69','Situaciones originales tipo examen',$B131$## Caso 1 — Problema demasiado amplio
Una estudiante propone: “Investigar la calidad de enfermería en Panamá”.

**Mejor siguiente paso:** delimitar población, contexto, dimensión de calidad y periodo antes de seleccionar instrumentos.

---

## Caso 2 — Objetivo desalineado
La pregunta busca conocer frecuencia de caídas, pero el objetivo dice “demostrar que la falta de personal causa caídas”.

**Problema:** el objetivo introduce causalidad que la pregunta inicial no establece y requiere un diseño diferente.

---

## Caso 3 — Variable sin operacionalización
El protocolo indica que medirá “buena comunicación”, pero no explica cómo.

**Corrección:** definir operacionalmente qué datos o indicadores representarán la comunicación.

---

## Caso 4 — Conveniencia y generalización
Se encuesta únicamente a las primeras 20 enfermeras disponibles y se afirma que representan a todas las enfermeras del país.

**Problema:** la estrategia de selección no sustenta esa generalización.

---

## Caso 5 — Instrumento popular
El equipo elige una escala porque “se usa mucho en internet”.

**Mejor conducta:** verificar pertinencia, evidencia de medición, población, idioma/contexto y condiciones de uso.

---

## Caso 6 — Prueba piloto
Durante el piloto, la mayoría interpreta una pregunta de dos formas diferentes.

**Conducta:** corregir el instrumento y documentar el cambio antes de la recolección principal.

---

## Caso 7 — Consentimiento firmado sin comprensión
Un participante firma rápidamente pero no comprende qué ocurrirá.

**Interpretación:** la firma por sí sola no garantiza un consentimiento informado adecuado.

---

## Caso 8 — Inicio antes de revisión ética
El investigador comienza entrevistas con pacientes mientras “espera la aprobación”.

**Conducta:** no iniciar actividades que requieren aprobación ética antes de obtenerla.

---

## Caso 9 — Datos identificables
La base elimina nombres pero conserva una combinación de datos que permite reconocer fácilmente a pacientes únicos.

**Problema:** persiste riesgo de reidentificación; deben revisarse las medidas de protección.

---

## Caso 10 — Resultado significativo
Una diferencia mínima produce p < 0,05.

**Interpretación:** además de significancia estadística debe evaluarse magnitud y relevancia clínica.

---

## Caso 11 — Correlación
Se observa asociación entre sobrecarga laboral y errores.

**Conclusión prudente:** existe asociación en los datos; no afirmar automáticamente que la sobrecarga es la única causa.

---

## Caso 12 — Datos faltantes
Un 30 % de participantes no respondió una sección del cuestionario.

**Conducta:** cuantificar, explorar el patrón y considerar su efecto; no rellenar datos arbitrariamente.

---

## Caso 13 — Cambiar criterio tras ver resultados
Después del análisis, el investigador excluye un grupo porque reduce la significancia.

**Problema:** cambio post hoc no justificado que puede sesgar los resultados.

---

## Caso 14 — Estudio cualitativo
Un equipo decide que siempre necesita 100 entrevistas porque “muestras grandes son mejores”.

**Respuesta:** en cualitativo la suficiencia depende del propósito, estrategia y riqueza de información; no existe un número universal.

---

## Caso 15 — Problema de enfermería
Se observan errores repetidos en educación al alta.

**Siguiente paso investigativo:** definir qué aspecto se desea comprender o medir y formular una pregunta específica antes de elegir un cuestionario.

---

## Caso 16 — Literatura antigua
Un protocolo sobre una política sanitaria vigente utiliza exclusivamente referencias de hace 15 años.

**Conducta:** conservar antecedentes útiles, pero actualizar la revisión con normativa y evidencia pertinente actual.

---

## Caso 17 — Sin plan de análisis
Se recolectan 60 variables “por si sirven después”.

**Problema:** falta coherencia entre objetivos, datos y análisis; aumenta carga y riesgo sin justificación clara.

---

## Caso 18 — Resultado negativo
El estudio no confirma la hipótesis y el equipo propone no publicar.

**Mejor conducta:** reportar de forma transparente resultados válidos y limitaciones; un resultado negativo también aporta conocimiento.

---$B131$,70 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_70','Preguntas rápidas de repaso',$B132$**1. ¿Qué debe preceder a la elección del instrumento?**  
La pregunta, objetivos y definición de los datos necesarios.

**2. ¿Pregunta y objetivo deben corresponder?**  
Sí.

**3. ¿Toda investigación necesita hipótesis formal?**  
No.

**4. ¿Qué es operacionalizar?**  
Definir cómo se observará o medirá una variable/concepto.

**5. ¿Muestra grande = muestra representativa?**  
No necesariamente.

**6. ¿Para qué sirve una prueba piloto?**  
Para detectar problemas del instrumento y procedimiento antes de la ejecución principal.

**7. ¿Validez y confiabilidad son sinónimos?**  
No.

**8. ¿Cuándo debe pensarse el análisis?**  
Antes de recolectar datos.

**9. ¿Asociación demuestra causalidad?**  
No por sí sola.

**10. ¿La ética comienza al solicitar consentimiento?**  
No; comienza desde el diseño del estudio.

**11. ¿Qué ley regula investigación para la salud en Panamá?**  
Ley 84 de 14 de mayo de 2019.

**12. ¿Qué norma reglamentó en 2026 sus Títulos III y IV?**  
Decreto Ejecutivo N.° 21 de 23 de abril de 2026.

---$B132$,71 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_71','Fuentes y validación',$B133$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define `RESEARCH-02 = Metodología de investigación`.

## Bibliografía principal indicada por CICDE

2. **Hernández Sampieri, R.; Fernández Collado, C.; Baptista Lucio, P.** _Metodología de la Investigación_. 6.ª edición. McGraw-Hill, 2014. ISBN 9781456223960.  
   La información bibliográfica y la tabla de contenidos confirman el desarrollo de enfoques cuantitativo/cualitativo, planteamiento del problema, perspectiva teórica, alcance, hipótesis, diseño, muestra, recolección, análisis y reporte.

## Panamá — marco oficial vigente

3. **República de Panamá. Ley 84 de 14 de mayo de 2019.** Regula y promueve la investigación para la salud y establece su rectoría y gobernanza.  
   https://infojuridica.procuraduria-admon.gob.pa/norma_screen.php?numsec=53010

4. **Ministerio de Salud de Panamá. Decreto Ejecutivo N.° 21 de 23 de abril de 2026.** Reglamenta los Títulos III y IV de la Ley 84 de 2019.  
   https://www.minsa.gob.pa/normatividad/decreto-ejecutivo-ndeg-21-jueves-23-de-abril-2026-que-reglamenta-los-titulos-iii-y-iv

5. **MINSA. Regulación de Investigación para la Salud.**  
   https://www.minsa.gob.pa/node/10704

6. **Comité Nacional de Bioética de la Investigación (CNBI).**  
   https://cnbi.senacyt.gob.pa/

---$B133$,72 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_72','Control de calidad',$B134$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- RESEARCH-02 no tiene subtemas explícitos en el lineamiento;
- expansión metodológica basada principalmente en la estructura verificable de Hernández Sampieri 6.ª edición;
- no se atribuyen páginas específicas no comprobadas;
- se mantiene la distinción entre RESEARCH-01 (concepto), RESEARCH-02 (proceso metodológico) y RESEARCH-03 (tipos de investigación);
- se evita afirmar que toda investigación requiere hipótesis;
- se diferencia variable cuantitativa/conceptual de categorías cualitativas;
- se evita presentar un tamaño de muestra universal;
- se evita confundir muestreo por conveniencia con selección aleatoria;
- se diferencia validez de confiabilidad;
- se enfatiza planificación previa del análisis;
- se evita inferir causalidad únicamente desde asociación;
- ética integrada desde el diseño;
- Ley 84 de 2019 y Decreto Ejecutivo 21 de 2026 incorporados como contexto panameño vigente;
- no se presentan los procedimientos regulatorios locales como pasos universales del método científico;
- 18 situaciones tipo examen son originales;
- no se declara revisión humana inexistente.

---$B134$,73 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_73','Estado para integración',$B135$**Estado:** `REVIEW`

Motivo:

- alcance, contenido y fuentes fueron sometidos a revisión documental/académica;
- todavía no existe revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión realizada únicamente mediante IA.

**Cobertura CICDE RESEARCH-02: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B135$,74 FROM tmap WHERE c='RESEARCH-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B136$El temario CICDE 2026 incluye dentro del área **Investigación** el tema:

> **Tipos de Investigación**

El lineamiento no enumera subtemas explícitos para RESEARCH-03. Para desarrollar el tema sin inventar una lista CICDE inexistente, este material utiliza como referencia académica principal:

**Hernández Sampieri, Roberto; Fernández Collado, Carlos; Baptista Lucio, Pilar. _Metodología de la Investigación_. 6.ª edición. McGraw-Hill, 2014.**

La obra distingue varias dimensiones de clasificación: enfoques cuantitativo, cualitativo y mixto; alcances del estudio cuantitativo; diseños experimentales y no experimentales; diseños cualitativos; y métodos mixtos.

### Regla central de este módulo

**“Tipo de investigación” no debe estudiarse como una única lista plana.** Un mismo estudio puede describirse simultáneamente por su enfoque, alcance, diseño y temporalidad.

Ejemplo:

> Estudio **cuantitativo**, de alcance **descriptivo**, **no experimental** y **transversal**.

Estas etiquetas no se contradicen; describen dimensiones diferentes del mismo estudio.

Este módulo completa el área de Investigación sin repetir RESEARCH-02: allí se estudió **cómo construir metodológicamente una investigación**; aquí interesa **cómo reconocer y diferenciar sus principales enfoques y diseños**.

---$B136$,1 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B137$Al finalizar el tema, el estudiante debe poder:

1. Explicar por qué existen varias formas de clasificar una investigación.
2. Diferenciar enfoque cuantitativo, cualitativo y mixto.
3. Distinguir enfoque, alcance, diseño y temporalidad.
4. Reconocer los alcances exploratorio, descriptivo, correlacional y explicativo.
5. Comprender que Hernández Sampieri no trata esos alcances como una lista simple de “tipos”.
6. Diferenciar investigación experimental y no experimental.
7. Reconocer preexperimentos, experimentos verdaderos y cuasiexperimentos en términos generales.
8. Diferenciar diseños transversales y longitudinales.
9. Reconocer tendencia, cohorte y panel como variantes longitudinales.
10. Identificar los principales diseños cualitativos.
11. Reconocer la lógica de los métodos mixtos concurrentes y secuenciales.
12. Evitar atribuir causalidad a diseños que no la sustentan.
13. Clasificar un estudio usando más de un eje cuando corresponda.
14. Seleccionar el diseño más coherente con una pregunta de enfermería.
15. Reconocer límites éticos y metodológicos relacionados con cada diseño.
16. Resolver situaciones tipo CICDE sobre identificación y selección de diseños.

---$B137$,2 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tipos_de_investigaci_n_no_es_una_sola_clasificaci_2','“Tipos de investigación” no es una sola clasificación',$B138$En lenguaje cotidiano se suele preguntar:

> “¿Qué tipo de investigación es?”

Pero la respuesta puede requerir varias etiquetas.

Por ejemplo, un estudio que mide satisfacción de pacientes una sola vez puede ser:

- cuantitativo;
- descriptivo;
- no experimental;
- transversal.

Un estudio sobre la experiencia de vivir con insuficiencia renal puede ser:

- cualitativo;
- fenomenológico.

Por eso, antes de memorizar nombres, debe identificarse **qué dimensión se está clasificando**.

---$B138$,3 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejes_para_clasificar_un_estudio_3','Ejes para clasificar un estudio',$B139$Una forma práctica de ordenar el tema es preguntar:

1. **¿Qué enfoque usa?**  
   Cuantitativo, cualitativo o mixto.

2. **¿Qué pretende lograr?**  
   En cuantitativo puede hablarse de alcance exploratorio, descriptivo, correlacional o explicativo.

3. **¿Manipula una intervención o variable?**  
   Experimental o no experimental.

4. **¿Cuándo se observan los datos?**  
   Transversal o longitudinal; además puede hablarse de orientación prospectiva o retrospectiva según el modo de reconstruir el tiempo.

5. **¿Qué abordaje cualitativo utiliza?**  
   Por ejemplo, fenomenológico, etnográfico, narrativo, teoría fundamentada o investigación-acción.

6. **¿Cómo integra datos cuantitativos y cualitativos?**  
   En métodos mixtos puede haber secuencias, concurrencia e integración.

---$B139$,4 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfoque_cuantitativo_4','Enfoque cuantitativo',$B140$El enfoque cuantitativo trabaja principalmente con:

- variables definidas;
- medición;
- datos numéricos;
- procedimientos estructurados;
- análisis estadístico;
- contraste de hipótesis cuando corresponda.

Puede utilizarse para preguntas como:

- ¿qué frecuencia tiene un evento?;
- ¿cuál es el promedio de una variable?;
- ¿existe asociación entre dos variables?;
- ¿una intervención produce diferencias medibles?

### Ejemplo en enfermería

Comparar la incidencia de flebitis antes y después de una intervención institucional.

---$B140$,5 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfoque_cualitativo_5','Enfoque cualitativo',$B141$El enfoque cualitativo busca comprender fenómenos desde:

- experiencias;
- significados;
- perspectivas;
- procesos sociales;
- contextos;
- discursos y narrativas.

Los datos pueden provenir de:

- entrevistas;
- observación;
- grupos de discusión;
- documentos;
- relatos.

### Ejemplo en enfermería

Comprender cómo viven los familiares el proceso de cuidado de una persona con enfermedad terminal.

---$B141$,6 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfoque_mixto_6','Enfoque mixto',$B142$Los métodos mixtos integran componentes cuantitativos y cualitativos dentro de un mismo programa de investigación.

No se justifican solamente por “usar más métodos”. Debe existir una razón para integrar ambas formas de información.

Pueden ayudar cuando se desea:

- medir un fenómeno y comprender su significado;
- explicar resultados numéricos con experiencias;
- desarrollar un instrumento a partir de información cualitativa;
- contrastar hallazgos desde perspectivas diferentes.

---$B142$,7 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comparaci_n_general_de_enfoques_7','Comparación general de enfoques',$B143$| Aspecto | Cuantitativo | Cualitativo | Mixto |
|---|---|---|---|
| Interés frecuente | Medición y relación entre variables | Significados y experiencias | Integración de ambas perspectivas |
| Datos predominantes | Numéricos | Textuales, narrativos, observacionales | Numéricos + cualitativos |
| Estructura | Generalmente más predefinida | Más flexible/emergente | Depende del diseño mixto |
| Análisis | Estadístico | Interpretativo/categorial | Ambos + integración |
| Producto | Estimaciones, asociaciones, efectos | Comprensión profunda/contextual | Inferencias integradas |

Ningún enfoque es “superior” por definición. La pregunta determina cuál es más apropiado.

---$B143$,8 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'elegir_el_enfoque_desde_la_pregunta_8','Elegir el enfoque desde la pregunta',$B144$**Pregunta:** “¿Qué porcentaje de pacientes comprende las indicaciones al alta?”  
→ Predomina un enfoque cuantitativo.

**Pregunta:** “¿Cómo describen los pacientes las dificultades para comprender las indicaciones al alta?”  
→ Predomina un enfoque cualitativo.

**Pregunta:** “¿Qué porcentaje comprende las indicaciones y qué razones explican las dificultades?”  
→ Puede justificar un enfoque mixto.

### Clave de examen

No se elige un enfoque porque “es más fácil”, sino porque responde mejor al problema.

---$B144$,9 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_no_equivale_a_tipo_9','Alcance no equivale a tipo',$B145$Hernández Sampieri distingue en el proceso cuantitativo cuatro **alcances**:

- exploratorio;
- descriptivo;
- correlacional;
- explicativo.

El propio texto advierte que **no deben considerarse simplemente “tipos de investigación”**, porque representan un continuo relacionado con el nivel de conocimiento y causalidad que se pretende alcanzar.

Un estudio puede incorporar elementos de más de un alcance.

---$B145$,10 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_exploratorio_10','Alcance exploratorio',$B146$Se utiliza cuando el problema:

- ha sido poco estudiado;
- presenta muchas preguntas abiertas;
- requiere identificar conceptos, variables o dimensiones relevantes;
- necesita una primera aproximación sistemática.

### Ejemplo

Explorar barreras percibidas por enfermeras ante la implementación de una tecnología nueva de la que existe poca experiencia local.

### No significa

“Investigar sin método”.

---$B146$,11 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_descriptivo_11','Alcance descriptivo',$B147$Busca especificar cómo es un fenómeno o cómo se distribuyen determinadas características.

Puede responder preguntas como:

- ¿cuántos?;
- ¿con qué frecuencia?;
- ¿qué características tienen?;
- ¿cómo se presenta el fenómeno?

### Ejemplo

Describir la prevalencia de lesiones por presión en pacientes hospitalizados durante un periodo definido.

No intenta necesariamente explicar por qué ocurre.

---$B147$,12 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_correlacional_12','Alcance correlacional',$B148$Busca conocer la relación o grado de asociación entre variables.

### Ejemplo

Analizar la relación entre horas de sueño y nivel de fatiga en personal de enfermería.

Puede mostrar que dos variables cambian conjuntamente, pero **no demuestra por sí solo que una cause la otra**.

---$B148$,13 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_explicativo_13','Alcance explicativo',$B149$Busca comprender por qué ocurre un fenómeno o bajo qué condiciones se produce.

Requiere mayor soporte teórico y metodológico para realizar inferencias explicativas.

### Clave

La intención explicativa exige más que encontrar una asociación estadística.

---$B149$,14 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'los_alcances_pueden_combinarse_o_evolucionar_14','Los alcances pueden combinarse o evolucionar',$B150$Una investigación puede comenzar explorando un fenómeno y luego desarrollar componentes descriptivos o correlacionales.

Por eso no debe imaginarse una regla rígida:

```text
Exploratorio → Descriptivo → Correlacional → Explicativo
```

como si todo estudio tuviera que atravesar obligatoriamente cada etapa.

La literatura disponible, la pregunta y el estado del conocimiento determinan el alcance apropiado.

---$B150$,15 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_es_dise_o_de_investigaci_n_15','Qué es diseño de investigación',$B151$El diseño es la estrategia general utilizada para obtener la información necesaria y responder la pregunta.

En investigación cuantitativa, una distinción fundamental es:

```text
Diseño cuantitativo
   ├── Experimental
   └── No experimental
```

La diferencia central es si el investigador **manipula deliberadamente** una variable/intervención bajo determinadas condiciones o si observa fenómenos sin esa manipulación.

---$B151$,16 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_experimental_16','Diseño experimental',$B152$En un diseño experimental el investigador introduce una intervención o manipulación para estudiar su efecto.

Puede comparar:

- grupos;
- condiciones;
- momentos;
- resultados asociados a la intervención.

La calidad de la inferencia depende de aspectos como:

- control;
- comparabilidad;
- asignación;
- medición;
- pérdidas;
- adherencia;
- sesgos.

---$B152$,17 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'manipulaci_n_y_control_17','Manipulación y control',$B153$Dos ideas son esenciales:

**Manipulación:** introducir deliberadamente una condición o intervención.

**Control:** reducir explicaciones alternativas y mantener condiciones comparables tanto como sea posible.

No todo estudio “con intervención” tiene el mismo nivel de control experimental.

---$B153$,18 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preexperimentos_18','Preexperimentos',$B154$Los preexperimentos tienen un grado limitado de control.

Ejemplo típico conceptual:

- se aplica una intervención a un solo grupo;
- se compara su situación antes y después;
- no existe un grupo equivalente que permita descartar fácilmente otras explicaciones.

### Consecuencia

Los resultados pueden sugerir un cambio, pero la atribución causal es débil.

---$B154$,19 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'experimentos_verdaderos_19','Experimentos verdaderos',$B155$Los experimentos verdaderos buscan un alto grado de control y utilizan mecanismos que permiten comparar condiciones de manera más rigurosa.

Una característica clásica es la **asignación aleatoria** a grupos cuando el diseño lo permite.

### Importante

Aleatorización no es lo mismo que seleccionar una muestra al azar.

- **Muestreo aleatorio:** cómo se seleccionan participantes de una población.
- **Asignación aleatoria:** cómo se distribuyen participantes entre condiciones o grupos.

---$B155$,20 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cuasiexperimentos_20','Cuasiexperimentos',$B156$Los cuasiexperimentos incluyen intervención/manipulación, pero no logran todas las condiciones de un experimento verdadero, frecuentemente porque los grupos ya existen o no es posible asignar aleatoriamente.

### Ejemplo en enfermería

Una unidad hospitalaria implementa un nuevo protocolo de prevención de caídas y otra unidad comparable continúa con práctica habitual, sin asignación individual aleatoria.

### Valor

Son importantes en servicios de salud cuando un experimento verdadero sería impráctico o no ético.

---$B156$,21 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_no_experimental_21','Diseño no experimental',$B157$En investigación no experimental el investigador observa fenómenos tal como ocurren, sin manipular deliberadamente la variable independiente.

Puede estudiar:

- frecuencias;
- características;
- asociaciones;
- cambios a lo largo del tiempo;
- diferencias naturales entre grupos.

No experimental **no significa** “sin rigor”.

---$B157$,22 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_transeccional_o_transversal_22','Diseño transeccional o transversal',$B158$Recolecta datos en un momento o periodo acotado para describir variables o analizar relaciones en ese punto temporal.

### Ejemplos

- prevalencia de dolor en pacientes hospitalizados hoy;
- satisfacción de usuarios durante un mes;
- relación entre fatiga y turno laboral en una medición.

### Ventaja

Permite obtener una fotografía del fenómeno.

### Límite

La secuencia temporal causa→efecto puede ser difícil de establecer.

---$B158$,23 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_longitudinal_o_evolutivo_23','Diseño longitudinal o evolutivo',$B159$Recolecta información en más de un momento para analizar cambio o evolución.

Puede responder:

- ¿cómo cambia una variable con el tiempo?;
- ¿qué ocurre después de una exposición?;
- ¿cómo evolucionan determinados grupos?

El seguimiento requiere considerar pérdidas de participantes y consistencia de las mediciones.

---$B159$,24 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'longitudinal_de_tendencia_24','Longitudinal de tendencia',$B160$Estudia cambios en una población general a través del tiempo, sin exigir que sean exactamente las mismas personas en cada medición.

### Ejemplo

Comparar cada año el porcentaje de estudiantes de enfermería que reporta determinadas conductas de autocuidado, usando muestras diferentes de la misma población objetivo.

---$B160$,25 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'longitudinal_de_evoluci_n_de_grupo_o_cohorte_25','Longitudinal de evolución de grupo o cohorte',$B161$Se interesa por un subgrupo definido por una característica compartida.

### Ejemplo

Seguir a quienes ingresaron a un programa de formación en un mismo año para observar cambios a lo largo del tiempo.

La composición específica de participantes puede variar según el diseño y las pérdidas.

---$B161$,26 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'longitudinal_de_panel_26','Longitudinal de panel',$B162$Evalúa a los **mismos participantes** en distintos momentos.

### Ventaja

Permite observar cambio individual.

### Riesgo

Las pérdidas durante el seguimiento pueden afectar los resultados.

---$B162$,27 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'transversal_vs_longitudinal_27','Transversal vs. longitudinal',$B163$| Pregunta | Transversal | Longitudinal |
|---|---|---|
| ¿Cuántas mediciones temporales? | Una fotografía temporal | Dos o más momentos |
| ¿Permite estudiar cambio? | Limitado | Sí |
| ¿Requiere seguimiento? | Generalmente no | Sí |
| Riesgo típico | Ambigüedad temporal | Pérdidas de seguimiento |

---$B163$,28 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'causalidad_y_dise_o_28','Causalidad y diseño',$B164$Para afirmar causalidad se necesita más que observar que dos variables están relacionadas.

Debe valorarse:

- temporalidad;
- control de explicaciones alternativas;
- diseño;
- calidad de medición;
- plausibilidad;
- consistencia con evidencia previa.

### Regla de examen

**Correlación ≠ causalidad.**

---$B164$,29 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'orientaci_n_prospectiva_y_retrospectiva_29','Orientación prospectiva y retrospectiva',$B165$En ciencias de la salud también se utilizan términos temporales complementarios.

**Prospectivo:** la investigación se organiza para observar información desde un punto de inicio hacia adelante.

**Retrospectivo:** utiliza información o exposiciones ocurridas previamente, por ejemplo mediante expedientes existentes.

### Importante

Prospectivo/retrospectivo describe una dimensión temporal y **no sustituye** categorías como cuantitativo, cualitativo, experimental o transversal.

---$B165$,30 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estudios_observacionales_en_salud_30','Estudios observacionales en salud',$B166$En salud se usa con frecuencia el término **observacional** para estudios donde el investigador no asigna deliberadamente una intervención.

En términos generales, se relaciona con diseños no experimentales.

Un estudio observacional puede ser:

- descriptivo;
- correlacional/analítico;
- transversal;
- longitudinal;
- prospectivo o retrospectivo según su estructura.

No debe asumirse que “observacional” significa simplemente mirar al paciente físicamente.

---$B166$,31 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_os_cualitativos_panorama_31','Diseños cualitativos: panorama',$B167$Hernández Sampieri presenta como diseños cualitativos principales:

- teoría fundamentada;
- etnográficos;
- narrativos;
- fenomenológicos;
- investigación-acción.

La elección depende de la naturaleza del fenómeno y del tipo de comprensión buscada.

---$B167$,32 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'teor_a_fundamentada_32','Teoría fundamentada',$B168$Busca desarrollar una explicación o teoría a partir de datos recolectados sistemáticamente en un contexto.

Es útil cuando se quiere comprender:

- procesos;
- interacciones;
- acciones;
- etapas de una experiencia.

### Ejemplo

Desarrollar una explicación sobre cómo las enfermeras nuevas aprenden a manejar situaciones de deterioro clínico durante sus primeros meses de trabajo.

---$B168$,33 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_etnogr_fico_33','Diseño etnográfico',$B169$Busca comprender un grupo o sistema social, incluyendo:

- prácticas;
- significados compartidos;
- normas;
- cultura;
- interacción cotidiana.

Suele apoyarse fuertemente en observación participante, entrevistas y documentos.

### Ejemplo

Comprender la cultura de seguridad de un servicio clínico a través de observación prolongada y entrevistas.

---$B169$,34 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_narrativo_34','Diseño narrativo',$B170$Se centra en historias y relatos de personas o acontecimientos.

Puede reconstruir:

- experiencias de vida;
- transiciones;
- trayectorias;
- secuencias significativas.

### Ejemplo

Reconstruir las trayectorias profesionales de enfermeras que participaron en la implementación de un programa comunitario.

---$B170$,35 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_o_fenomenol_gico_35','Diseño fenomenológico',$B171$Busca comprender la **experiencia vivida** de personas que han compartido un fenómeno.

### Ejemplo

Comprender la experiencia de pacientes sometidos a aislamiento prolongado durante una hospitalización.

### Clave

La pregunta se centra en cómo se experimenta y qué significado tiene el fenómeno, no en estimar su prevalencia.

---$B171$,36 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_acci_n_36','Investigación-acción',$B172$Busca comprender una problemática y contribuir a transformarla mediante participación y ciclos de acción/reflexión.

Puede utilizarse cuando un grupo o comunidad:

- identifica un problema;
- participa en su análisis;
- diseña acciones;
- evalúa cambios;
- vuelve a ajustar la intervención.

### Ejemplo

Equipo de enfermería identifica fallas en educación al alta, analiza colectivamente el proceso, implementa mejoras y vuelve a evaluarlo.

---$B172$,37 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estudio_de_caso_y_su_clasificaci_n_37','Estudio de caso y su clasificación',$B173$El término **estudio de caso** puede utilizarse de diferentes maneras según tradición metodológica.

Puede referirse al examen profundo de:

- una persona;
- una unidad;
- una institución;
- un evento;
- un programa.

### Precaución

No basta decir “estudio de caso” para conocer automáticamente el enfoque. Debe revisarse:

- pregunta;
- datos;
- estrategia;
- forma de análisis.

Puede existir trabajo de caso cuantitativo, cualitativo o combinado según el propósito.

---$B173$,38 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_os_mixtos_panorama_38','Diseños mixtos: panorama',$B174$Los métodos mixtos integran procesos cuantitativos y cualitativos.

La planificación debe definir:

- qué componente ocurre primero;
- si ocurren simultáneamente;
- cuál tiene mayor peso;
- dónde se integran los datos;
- cómo se generan conclusiones combinadas.

---$B174$,39 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_os_mixtos_concurrentes_39','Diseños mixtos concurrentes',$B175$Los componentes cuantitativo y cualitativo se desarrollan en un mismo periodo o de forma paralela.

Luego se comparan o integran los resultados.

### Ejemplo

Medir satisfacción con una escala y realizar entrevistas durante el mismo periodo para comprender los motivos de las puntuaciones.

---$B175$,40 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dise_os_mixtos_secuenciales_40','Diseños mixtos secuenciales',$B176$Una fase informa o precede a la otra.

Dos lógicas frecuentes:

**CUAL → CUAN**  
Primero se explora cualitativamente y después se mide o prueba en una muestra mayor.

**CUAN → CUAL**  
Primero se obtienen resultados cuantitativos y luego se profundiza cualitativamente para explicarlos.

---$B176$,41 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_en_m_todos_mixtos_41','Integración en métodos mixtos',$B177$La característica esencial es la **integración**.

Puede ocurrir al:

- construir una fase desde la anterior;
- comparar resultados;
- combinar bases de información;
- interpretar conjuntamente hallazgos;
- generar inferencias integradas.

Sin integración real, simplemente ejecutar una encuesta y unas entrevistas no garantiza un estudio mixto bien diseñado.

---$B177$,42 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mixto_no_significa_dos_estudios_separados_42','Mixto no significa dos estudios separados',$B178$Error frecuente:

> “Hice encuesta y entrevista, entonces automáticamente es mixto.”

No necesariamente.

Debe existir una lógica que explique:

- por qué se necesitan ambos componentes;
- cómo se relacionan;
- dónde se integran;
- qué aporta la combinación que no aportaría cada uno por separado.

---$B178$,43 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_mo_clasificar_un_estudio_por_m_ltiples_ejes_43','Cómo clasificar un estudio por múltiples ejes',$B179$Ante un estudio, complete mentalmente:

```text
Enfoque: ________
Alcance: ________  (si corresponde)
Diseño: ________
Temporalidad: ________
Abordaje específico: ________
```

Ejemplo:

> “Se mide una sola vez la relación entre carga laboral y agotamiento mediante escalas.”

Puede clasificarse como:

- cuantitativo;
- correlacional;
- no experimental;
- transversal.

---$B179$,44 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_prevalencia_de_un_problema_44','Ejemplo: prevalencia de un problema',$B180$Pregunta:

> ¿Cuál es la prevalencia de lesiones por presión en pacientes de una unidad durante el mes de septiembre?

Clasificación probable:

- cuantitativa;
- descriptiva;
- no experimental;
- transversal.

La palabra **prevalencia** orienta hacia descripción de frecuencia en una población/periodo definido.

---$B180$,45 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_asociaci_n_entre_variables_45','Ejemplo: asociación entre variables',$B181$Pregunta:

> ¿Existe relación entre sobrecarga percibida y agotamiento profesional?

Si ambas variables se miden sin intervención en un solo momento:

- cuantitativa;
- correlacional;
- no experimental;
- transversal.

No puede concluirse automáticamente que la sobrecarga cause el agotamiento.

---$B181$,46 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_intervenci_n_cuasiexperimental_46','Ejemplo: intervención cuasiexperimental',$B182$Una unidad adopta una estrategia educativa nueva y otra unidad comparable continúa con el procedimiento habitual. Los grupos ya existían y no hubo asignación aleatoria individual.

Clasificación:

- cuantitativa;
- experimental en sentido amplio de intervención;
- específicamente cuasiexperimental;
- longitudinal si se comparan mediciones a lo largo del tiempo.

---$B182$,47 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_estudio_experimental_47','Ejemplo: estudio experimental',$B183$Participantes elegibles son asignados aleatoriamente a dos intervenciones educativas y posteriormente se compara el resultado.

Clasificación principal:

- cuantitativa;
- experimental;
- con asignación aleatoria.

La pregunta causal está mejor respaldada que en un estudio puramente observacional, aunque siguen existiendo riesgos de sesgo y límites de generalización.

---$B183$,48 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_experiencia_de_pacientes_48','Ejemplo: experiencia de pacientes',$B184$Pregunta:

> ¿Cómo viven los pacientes la transición desde cuidados intensivos al hogar?

Si el interés está en la experiencia compartida:

- cualitativa;
- fenomenológica.

No tendría sentido elegir automáticamente una escala numérica si la pregunta busca significado vivido.

---$B184$,49 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_investigaci_n_acci_n_49','Ejemplo: investigación-acción',$B185$Un equipo identifica fallas en la entrega de turno, participa en el análisis, implementa una solución, evalúa el cambio y modifica nuevamente el proceso.

Clasificación:

- cualitativa o participativa según la estrategia;
- investigación-acción;
- orientada a comprensión y transformación local.

No debe confundirse automáticamente con auditoría rutinaria: la investigación-acción requiere un proceso sistemático de producción de conocimiento además de la mejora.

---$B185$,50 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ejemplo_estudio_mixto_secuencial_50','Ejemplo: estudio mixto secuencial',$B186$Primero se realizan entrevistas para descubrir por qué los pacientes abandonan un programa. A partir de los temas encontrados se desarrolla un cuestionario que luego se aplica a una muestra mayor.

Clasificación:

- mixto;
- secuencial;
- fase cualitativa seguida de fase cuantitativa.

La segunda fase se construye a partir de la primera.

---$B186$,51 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'t_rminos_que_no_son_sin_nimos_51','Términos que no son sinónimos',$B187$No confundir:

- cuantitativo ≠ experimental;
- cualitativo ≠ exploratorio en sentido automático;
- descriptivo ≠ transversal;
- correlacional ≠ causal;
- longitudinal ≠ prospectivo necesariamente;
- encuesta ≠ diseño;
- entrevista ≠ enfoque cualitativo por sí sola;
- estudio de caso ≠ cualitativo obligatoriamente;
- mixto ≠ usar dos instrumentos.

---$B187$,52 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'descriptivo_no_significa_necesariamente_transversa_52','Descriptivo no significa necesariamente transversal',$B188$Un estudio descriptivo puede:

- describir una población en un momento;
- describir cambios a través del tiempo.

Por eso “descriptivo” habla de **alcance**, mientras “transversal/longitudinal” habla de **estructura temporal**.

---$B188$,53 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'correlacional_no_demuestra_causa_53','Correlacional no demuestra causa',$B189$Si dos variables se asocian pueden existir:

- causalidad directa;
- causalidad inversa;
- una tercera variable;
- sesgo;
- coincidencia;
- mecanismos múltiples.

La conclusión debe respetar lo que el diseño permite afirmar.

---$B189$,54 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prospectivo_no_significa_autom_ticamente_longitudi_54','Prospectivo no significa automáticamente longitudinal',$B190$“Prospectivo” indica orientación hacia datos que se observarán hacia adelante desde un punto de inicio.

“Longitudinal” implica múltiples momentos de observación de cambio.

Aunque suelen relacionarse, no son palabras intercambiables.

---$B190$,55 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_tama_o_de_muestra_no_define_el_tipo_de_investig_55','El tamaño de muestra no define el tipo de investigación',$B191$Una muestra grande no convierte un estudio en cuantitativo por sí sola.

Una muestra pequeña no convierte automáticamente un estudio en cualitativo.

El tipo se determina por:

- pregunta;
- enfoque;
- diseño;
- datos;
- análisis.

---$B191$,56 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_instrumento_no_define_por_s_solo_el_dise_o_56','El instrumento no define por sí solo el diseño',$B192$**Encuesta** es una técnica/instrumento de recolección, no una clasificación completa.

**Entrevista** tampoco significa automáticamente investigación cualitativa.

Una entrevista estructurada puede producir datos cuantificables; una entrevista abierta puede formar parte de un estudio cualitativo.

### Clave

Primero identifique la lógica del estudio; después el instrumento.

---$B192$,57 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seleccionar_el_dise_o_seg_n_el_objetivo_57','Seleccionar el diseño según el objetivo',$B193$Si desea **estimar frecuencia** → diseño descriptivo apropiado.

Si desea **examinar asociación** → estrategia correlacional/analítica.

Si desea **evaluar efecto de una intervención** → considerar diseño experimental o cuasiexperimental según factibilidad y ética.

Si desea **comprender experiencia** → diseño cualitativo apropiado.

Si desea **comprender y medir** → puede justificarse un diseño mixto.

No se debe comenzar escogiendo una técnica favorita y luego forzar la pregunta para que encaje.

---$B193$,58 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'aplicaci_n_en_enfermer_a_58','Aplicación en enfermería',$B194$La investigación de enfermería puede estudiar:

- resultados de cuidados;
- seguridad del paciente;
- experiencia del paciente/familia;
- educación en salud;
- adherencia;
- organización de servicios;
- dotación;
- carga laboral;
- práctica profesional;
- calidad;
- salud comunitaria;
- implementación de intervenciones.

Cada problema puede requerir un diseño diferente.

### Ejemplo

“¿Funciona una intervención?” no se responde igual que “¿cómo la viven los pacientes?”

---$B194$,59 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_y_tipo_de_estudio_59','Ética y tipo de estudio',$B195$El diseño nunca elimina la obligación ética.

Debe considerarse:

- riesgo;
- consentimiento cuando corresponda;
- confidencialidad;
- justicia en selección;
- vulnerabilidad;
- carga para participantes;
- seguridad de la intervención;
- protección de datos.

Un estudio observacional puede tener riesgos importantes de privacidad. Un estudio experimental puede tener riesgos físicos o clínicos. Un estudio cualitativo puede generar malestar emocional o revelar información sensible.

---$B195$,60 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuerza_de_evidencia_y_l_mites_60','Fuerza de evidencia y límites',$B196$No existe una clasificación única donde “un tipo siempre sea mejor que otro”.

La fortaleza depende de:

- pregunta;
- diseño apropiado;
- ejecución;
- sesgos;
- medición;
- análisis;
- ética;
- contexto.

### Ejemplo

Para conocer la experiencia de duelo, una entrevista cualitativa bien diseñada puede responder mejor que un experimento.

Para estimar el efecto causal de una intervención, un diseño experimental adecuadamente realizado puede ofrecer ventajas.

---$B196$,61 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_61','Errores frecuentes de examen',$B197$1. Memorizar una sola lista de “tipos” y mezclar categorías de distinto nivel.
2. Llamar “tipo descriptivo” y asumir automáticamente que es transversal.
3. Confundir enfoque cuantitativo con experimental.
4. Afirmar que toda investigación cualitativa es exploratoria.
5. Interpretar correlación como causalidad.
6. Confundir muestreo aleatorio con asignación aleatoria.
7. Creer que un cuasiexperimento no tiene intervención.
8. Creer que un estudio no experimental carece de rigor.
9. Confundir cohorte longitudinal con panel.
10. Decir que una encuesta define el diseño.
11. Decir que una entrevista siempre implica enfoque cualitativo.
12. Clasificar como mixto un estudio sin integración real.
13. Confundir fenomenología con etnografía.
14. Confundir teoría fundamentada con “usar una teoría existente”.
15. Confundir investigación-acción con cualquier proyecto de mejora.
16. Usar el tamaño de muestra para decidir el enfoque.
17. Elegir el diseño antes de definir la pregunta.
18. Concluir causalidad más allá de lo permitido por el diseño.

---$B197$,62 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estrategia_cicde_para_research_03_62','Estrategia CICDE para RESEARCH-03',$B198$Ante una pregunta sobre tipos/diseños:

**Paso 1:** identifique qué quiere saber el estudio.  
**Paso 2:** determine el enfoque: cuantitativo, cualitativo o mixto.  
**Paso 3:** si es cuantitativo, identifique el alcance.  
**Paso 4:** determine si existe manipulación/intervención.  
**Paso 5:** identifique temporalidad: transversal o longitudinal.  
**Paso 6:** si es cualitativo, identifique qué experiencia/proceso/grupo se quiere comprender.  
**Paso 7:** descarte respuestas que mezclan dimensiones como si fueran excluyentes.  
**Paso 8:** elija la clasificación que mejor corresponde a la pregunta y al diseño descrito.

---$B198$,63 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_63','Situaciones originales tipo examen',$B199$## Caso 1 — Prevalencia
Se desea conocer qué porcentaje de pacientes presenta lesión por presión durante una medición institucional.

**Clasificación más apropiada:** cuantitativa, descriptiva, no experimental y transversal.

---

## Caso 2 — Asociación
Se mide simultáneamente carga laboral y agotamiento en enfermeras para conocer si están relacionados.

**Clasificación:** cuantitativa, correlacional, no experimental y transversal.

**Precaución:** asociación no demuestra causalidad.

---

## Caso 3 — Experiencia vivida
Se entrevista a pacientes para comprender cómo experimentaron el aislamiento hospitalario.

**Diseño más congruente:** cualitativo fenomenológico.

---

## Caso 4 — Cultura de una unidad
Investigadora permanece varios meses observando prácticas, lenguaje y normas informales de un servicio.

**Diseño:** etnográfico.

---

## Caso 5 — Proceso sin teoría suficiente
Se busca generar una explicación sobre cómo las enfermeras desarrollan confianza al iniciar trabajo en UCI.

**Diseño:** teoría fundamentada.

---

## Caso 6 — Historias profesionales
Se reconstruyen relatos de vida de enfermeras jubiladas para comprender cambios de la profesión.

**Diseño:** narrativo.

---

## Caso 7 — Cambio participativo
Un equipo identifica un problema de educación al alta, diseña acciones, las implementa y evalúa colectivamente.

**Diseño probable:** investigación-acción, si existe producción sistemática de conocimiento y participación más allá de una mejora rutinaria.

---

## Caso 8 — Un grupo antes y después
Se mide conocimiento antes y después de una capacitación en el mismo grupo, sin grupo de comparación.

**Clasificación:** preexperimental; la atribución causal es limitada.

---

## Caso 9 — Grupos existentes
Dos hospitales aplican estrategias diferentes y se comparan resultados, pero los participantes no fueron asignados aleatoriamente.

**Clasificación:** cuasiexperimental.

---

## Caso 10 — Asignación aleatoria
Participantes son distribuidos aleatoriamente entre dos intervenciones educativas.

**Clasificación:** experimental con asignación aleatoria.

---

## Caso 11 — Misma población, personas distintas
Cada año se encuesta una nueva muestra de estudiantes de enfermería de la misma universidad.

**Diseño longitudinal:** tendencia.

---

## Caso 12 — Misma cohorte
Se sigue al grupo que ingresó a enfermería en 2026 para observar su evolución académica.

**Diseño longitudinal:** evolución de grupo/cohorte.

---

## Caso 13 — Mismas personas
Se evalúa exactamente a los mismos profesionales cada seis meses durante tres años.

**Diseño longitudinal:** panel.

---

## Caso 14 — Dos fases conectadas
Primero se realizan entrevistas sobre barreras de vacunación y luego se construye un cuestionario basado en esos hallazgos.

**Diseño:** mixto secuencial CUAL → CUAN.

---

## Caso 15 — Datos paralelos
Durante el mismo periodo se aplica una escala de satisfacción y se realizan entrevistas; luego se integran ambos resultados.

**Diseño:** mixto concurrente.

---

## Caso 16 — “Encuesta = tipo”
Un estudiante responde que el tipo de investigación es “encuesta”.

**Corrección:** encuesta describe una técnica/instrumento; falta identificar enfoque, alcance, diseño y temporalidad.

---

## Caso 17 — Correlación fuerte
Dos variables presentan una correlación muy alta.

**Conclusión correcta:** existe asociación fuerte en esos datos; la causalidad requiere evidencia adicional y diseño apropiado.

---

## Caso 18 — Selección del diseño
Una enfermera quiere saber no solo cuántos pacientes abandonan un programa, sino también por qué lo hacen.

**Opción razonable:** combinar medición cuantitativa con exploración cualitativa mediante un diseño mixto bien integrado.

---$B199$,64 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_64','Preguntas rápidas de repaso',$B200$**1. ¿Cuáles son los tres enfoques generales desarrollados por Hernández Sampieri?**  
Cuantitativo, cualitativo y mixto.

**2. ¿Exploratorio, descriptivo, correlacional y explicativo son tratados simplemente como “tipos”?**  
No. Son alcances del proceso cuantitativo.

**3. ¿Qué diferencia central existe entre experimental y no experimental?**  
La manipulación deliberada de una intervención/variable y el grado de control.

**4. ¿Qué caracteriza un diseño transversal?**  
Recolectar datos en un momento o periodo acotado.

**5. ¿Qué caracteriza un diseño longitudinal?**  
Observar cambio a través de múltiples momentos.

**6. ¿Panel y cohorte son idénticos?**  
No. Panel sigue a las mismas personas; cohorte se centra en un grupo definido por una característica compartida.

**7. ¿Correlación demuestra causalidad?**  
No.

**8. ¿Qué diseño cualitativo estudia experiencia vivida?**  
Fenomenológico.

**9. ¿Qué diseño busca comprender una cultura o sistema social?**  
Etnográfico.

**10. ¿Qué diseño busca generar teoría desde los datos?**  
Teoría fundamentada.

**11. ¿Qué diseño busca comprender y transformar participativamente un problema?**  
Investigación-acción.

**12. ¿Qué hace que un estudio sea verdaderamente mixto?**  
La integración intencional de componentes cuantitativos y cualitativos.

---$B200$,65 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_65','Fuentes y validación',$B201$## Fuente rectora CICDE

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** _Lineamientos para el Examen de Competencias de Profesionales de Enfermería_. Tercera edición. Panamá, 2026.  
   Define `RESEARCH-03 = Tipos de Investigación`.

## Bibliografía principal indicada por CICDE

2. **Hernández Sampieri, R.; Fernández Collado, C.; Baptista Lucio, P.** _Metodología de la Investigación_. 6.ª edición. McGraw-Hill, 2014. ISBN 9781456223960.

   La estructura bibliográfica verificable de la obra incluye:

   - enfoques cuantitativo y cualitativo;
   - origen de proyectos cuantitativos, cualitativos o mixtos;
   - alcances exploratorio, descriptivo, correlacional y explicativo;
   - elección del diseño;
   - diseños experimentales y no experimentales;
   - diseños transeccionales y longitudinales;
   - diseños cualitativos;
   - métodos mixtos.

### Nota de precisión documental

La 6.ª edición señala expresamente que los alcances exploratorio, descriptivo, correlacional y explicativo **no deben tratarse como una clasificación simple de “tipos de investigación”**. Este paquete conserva esa distinción para evitar simplificaciones didácticas incorrectas.

---$B201$,66 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_66','Control de calidad',$B202$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- RESEARCH-03 no tiene subtemas explícitos en el lineamiento;
- expansión basada principalmente en Hernández Sampieri 6.ª edición, bibliografía indicada por CICDE;
- se diferencia enfoque, alcance, diseño y temporalidad;
- exploratorio/descriptivo/correlacional/explicativo se presentan como alcances y no como una lista plana equivalente a otros ejes;
- se diferencia experimental, cuasiexperimental y no experimental;
- se diferencia muestreo aleatorio de asignación aleatoria;
- se diferencia transversal de longitudinal;
- se distinguen tendencia, cohorte y panel;
- prospectivo/retrospectivo se presentan como dimensión temporal complementaria, no como sustituto de las clasificaciones principales;
- se incluyen los principales diseños cualitativos presentes en la obra;
- se explica que los métodos mixtos requieren integración;
- se evita equiparar correlación con causalidad;
- se evita clasificar un estudio solo por el instrumento utilizado;
- se mantiene la frontera con RESEARCH-01 y RESEARCH-02;
- las 18 situaciones tipo examen son originales;
- no se declara revisión humana inexistente.

---$B202$,67 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_67','Estado para integración',$B203$**Estado:** `REVIEW`

Motivo:

- alcance, contenido y fuentes fueron sometidos a revisión documental/académica;
- todavía no existe revisor humano con provenance;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` por revisión realizada únicamente mediante IA.

**Cobertura CICDE RESEARCH-03: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B203$,68 FROM tmap WHERE c='RESEARCH-03';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Metodología de la investigación';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Research — Health research';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Research';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Ley 84 de 14 de mayo de 2019 — Que regula y promueve la investigación para la salud y establece su rectoría y gobernanza';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Decreto Ejecutivo N.° 21 de 23 de abril de 2026 — Reglamenta los Títulos III y IV de la Ley 84 de 2019';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='Declaración de Helsinki — Principios éticos para la investigación médica con participantes humanos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-01' AND s.c='What Is Ethics in Research & Why Is It Important?';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='RESEARCH-02' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-02' AND s.c='Metodología de la Investigación';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-02' AND s.c='Ley 84 de 14 de mayo de 2019';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-02' AND s.c='Decreto Ejecutivo N.° 21 de 23 de abril de 2026';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-02' AND s.c='Regulación de Investigación para la Salud';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-02' AND s.c='Comité Nacional de Bioética de la Investigación';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='RESEARCH-03' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='RESEARCH-03' AND s.c='Metodología de la Investigación';

COMMIT;