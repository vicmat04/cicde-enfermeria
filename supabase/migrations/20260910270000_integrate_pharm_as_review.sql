BEGIN;

INSERT INTO topics (area_id, code, title, description, sort_order) VALUES
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-01','Conceptos básicos en farmacología','',1),
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-02','Normas generales para administración y dosificación','',2),
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-03','Sistema de conversión y equivalencias','',3),
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-04','Seguridad de medicamentos','',4),
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-05','Errores de medicación','',5),
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-06','Fluidos y balance electrolítico','',6),
((SELECT id FROM areas WHERE code='PHARMACOLOGY'),'PHARM-07','Metrología','',7);

INSERT INTO lessons (topic_id,title,status) VALUES
((SELECT id FROM topics WHERE code='PHARM-01'),'Conceptos básicos en farmacología','REVIEW'),
((SELECT id FROM topics WHERE code='PHARM-02'),'Normas generales para administración y dosificación','REVIEW'),
((SELECT id FROM topics WHERE code='PHARM-03'),'Sistema de conversión y equivalencias','REVIEW'),
((SELECT id FROM topics WHERE code='PHARM-04'),'Seguridad de medicamentos','REVIEW'),
((SELECT id FROM topics WHERE code='PHARM-05'),'Errores de medicación','REVIEW'),
((SELECT id FROM topics WHERE code='PHARM-06'),'Fluidos y balance electrolítico','REVIEW'),
((SELECT id FROM topics WHERE code='PHARM-07'),'Metrología','REVIEW');

INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Lineamientos para el Examen de Competencias de Profesionales de Enfermería','Lineamientos para el Examen de Competencias de Profesionales de Enfermería',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Lineamientos para el Examen de Competencias de Profesionales de Enfermería');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Farmacología en Enfermería. Teoría y casos prácticos','Farmacología en Enfermería. Teoría y casos prácticos',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Farmacología en Enfermería. Teoría y casos prácticos');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Pharmacology for Nurses: A Pathophysiologic Approach','Pharmacology for Nurses: A Pathophysiologic Approach',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Pharmacology for Nurses: A Pathophysiologic Approach');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Pharmacology for Nurses: A Pathophysiologic Approach, 7th edition','Pharmacology for Nurses: A Pathophysiologic Approach, 7th edition',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Pharmacology for Nurses: A Pathophysiologic Approach, 7th edition');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','A Better Prescription for Preparing Nursing Students to Practice Safely','A Better Prescription for Preparing Nursing Students to Practice Safely',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='A Better Prescription for Preparing Nursing Students to Practice Safely');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Nursing Interventions & Clinical Skills','Nursing Interventions & Clinical Skills',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Nursing Interventions & Clinical Skills');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Medication without harm: Policy brief','Medication without harm: Policy brief',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Medication without harm: Policy brief');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','ISMP List of High-Alert Medications in Acute Care Settings','ISMP List of High-Alert Medications in Acute Care Settings',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='ISMP List of High-Alert Medications in Acute Care Settings');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Medication safety for look-alike, sound-alike medicines','Medication safety for look-alike, sound-alike medicines',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Medication safety for look-alike, sound-alike medicines');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Medication Error Definition and Taxonomy','Medication Error Definition and Taxonomy',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Medication Error Definition and Taxonomy');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','NCC MERP Index for Categorizing Medication Errors','NCC MERP Index for Categorizing Medication Errors',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='NCC MERP Index for Categorizing Medication Errors');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Technical Series on Safer Primary Care: Medication errors','Technical Series on Safer Primary Care: Medication errors',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Technical Series on Safer Primary Care: Medication errors');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Intravenous fluid therapy in adults in hospital (CG174)','Intravenous fluid therapy in adults in hospital (CG174)',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Intravenous fluid therapy in adults in hospital (CG174)');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','International Vocabulary of Metrology – Basic and General Concepts and Associated Terms (VIM), JCGM 200:2012','International Vocabulary of Metrology – Basic and General Concepts and Associated Terms (VIM), JCGM 200:2012',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='International Vocabulary of Metrology – Basic and General Concepts and Associated Terms (VIM), JCGM 200:2012');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','NIST Policy on Metrological Traceability','NIST Policy on Metrological Traceability',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='NIST Policy on Metrological Traceability');

CREATE TEMP TABLE tmap (c TEXT PRIMARY KEY, l UUID NOT NULL) ON COMMIT DROP;
INSERT INTO tmap SELECT t.code,l.id FROM lessons l JOIN topics t ON t.id=l.topic_id WHERE t.code LIKE 'PHARM-%';

CREATE TEMP TABLE smap (c TEXT PRIMARY KEY, s UUID NOT NULL) ON COMMIT DROP;
INSERT INTO smap SELECT DISTINCT ON (citation_text) citation_text,id FROM sources WHERE citation_text IN ('Lineamientos para el Examen de Competencias de Profesionales de Enfermería','Farmacología en Enfermería. Teoría y casos prácticos','Pharmacology for Nurses: A Pathophysiologic Approach','Pharmacology for Nurses: A Pathophysiologic Approach, 7th edition','A Better Prescription for Preparing Nursing Students to Practice Safely','Nursing Interventions & Clinical Skills','Medication without harm: Policy brief','ISMP List of High-Alert Medications in Acute Care Settings','Medication safety for look-alike, sound-alike medicines','Medication Error Definition and Taxonomy','NCC MERP Index for Categorizing Medication Errors','Technical Series on Safer Primary Care: Medication errors','Intravenous fluid therapy in adults in hospital (CG174)','International Vocabulary of Metrology – Basic and General Concepts and Associated Terms (VIM), JCGM 200:2012','NIST Policy on Metrological Traceability') ORDER BY citation_text;

INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B1$El temario CICDE 2026 establece:

> **Conceptos básicos en farmacología**

con dos subtemas explícitos:

1. **Farmacocinética**
2. **Farmacodinámica**

Este material cubre ambos.

No desarrolla en profundidad:

- normas de administración y dosificación;
- conversiones y equivalencias;
- seguridad de medicamentos;
- errores de medicación;
- fluidos y balance electrolítico;
- metrología.

Esos contenidos corresponden a PHARM-02 a PHARM-07.

---$B1$,1 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B2$Al finalizar el tema, el estudiante debe poder:

1. Definir farmacología, fármaco y medicamento.
2. Explicar la diferencia entre farmacocinética y farmacodinámica.
3. Describir absorción, distribución, metabolismo y excreción.
4. Interpretar conceptualmente biodisponibilidad, vida media, aclaramiento y volumen de distribución.
5. Reconocer factores que modifican la farmacocinética.
6. Explicar receptor, agonista y antagonista.
7. Diferenciar potencia de eficacia.
8. Relacionar concentración, efecto terapéutico y toxicidad.
9. Reconocer variaciones farmacológicas relevantes para enfermería.
10. Aplicar los conceptos al seguimiento del paciente.

---$B2$,2 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concepto_de_farmacolog_a_2','Concepto de farmacología',$B3$La farmacología estudia las sustancias que interactúan con los sistemas biológicos y los efectos derivados de esas interacciones.

En la práctica clínica interesa comprender:

- qué hace el organismo al fármaco;
- qué hace el fármaco al organismo;
- qué respuesta se espera;
- qué factores modifican esa respuesta.

---$B3$,3 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'farmacolog_a_cl_nica_3','Farmacología clínica',$B4$La farmacología clínica estudia el uso y los efectos de los fármacos en seres humanos.

Relaciona:

- farmacocinética;
- farmacodinámica;
- eficacia;
- seguridad;
- características del paciente;
- objetivos terapéuticos.

---$B4$,4 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'farmacoterapia_4','Farmacoterapia',$B5$Farmacoterapia es el uso de medicamentos para:

- prevenir;
- diagnosticar;
- controlar;
- tratar;

una condición clínica.

Enfermería participa en valoración, administración, monitorización, educación y evaluación de resultados.

---$B5$,5 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'f_rmaco_y_medicamento_5','Fármaco y medicamento',$B6$**Fármaco:** sustancia activa capaz de producir un efecto biológico.

**Medicamento:** preparación que contiene uno o más principios activos junto con componentes necesarios para su formulación y uso.

No son conceptos idénticos.

---$B6$,6 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'principio_activo_6','Principio activo',$B7$Es el componente responsable del efecto farmacológico principal de una preparación.

Una presentación comercial puede contener:

- principio activo;
- excipientes;
- vehículo;
- recubrimientos u otros componentes.

---$B7$,7 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'nombres_de_los_medicamentos_7','Nombres de los medicamentos',$B8$Un mismo principio activo puede identificarse mediante:

- nombre genérico;
- nombre comercial.

Para el razonamiento farmacológico importa reconocer el **principio activo**, ya que diferentes marcas pueden contener el mismo fármaco.

---$B8$,8 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'formas_farmac_uticas_concepto_8','Formas farmacéuticas: concepto',$B9$La forma farmacéutica es la presentación preparada para permitir la administración del medicamento.

Ejemplos generales:

- tabletas;
- cápsulas;
- soluciones;
- suspensiones;
- inyectables;
- preparados tópicos.

La forma puede modificar la velocidad o el lugar en que el fármaco queda disponible.

---$B9$,9 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_de_administraci_n_y_comportamiento_del_f_rmaco_9','Vía de administración y comportamiento del fármaco',$B10$La vía influye en:

- absorción;
- velocidad de inicio;
- biodisponibilidad;
- exposición al metabolismo de primer paso.

El análisis detallado de administración corresponde a PHARM-02.

---$B10$,10 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respuesta_farmacol_gica_10','Respuesta farmacológica',$B11$La respuesta farmacológica es el cambio producido por el fármaco.

Puede ser:

- terapéutico;
- adverso;
- tóxico;
- insuficiente.

Una respuesta clínica depende tanto del medicamento como del paciente.

---$B11$,11 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'variabilidad_de_la_respuesta_11','Variabilidad de la respuesta',$B12$Dos personas pueden responder de manera diferente al mismo medicamento.

Influyen:

- edad;
- función renal;
- función hepática;
- genética;
- enfermedades;
- interacciones;
- adherencia;
- estado fisiológico.

---$B12$,12 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'farmacocin_tica_concepto_12','Farmacocinética: concepto',$B13$La farmacocinética describe **qué le ocurre al fármaco dentro del organismo a lo largo del tiempo**.

Se resume mediante:

> **A — Absorción**  
> **D — Distribución**  
> **M — Metabolismo**  
> **E — Excreción**

---$B13$,13 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'adme_13','ADME',$B14$ADME permite organizar el recorrido del fármaco.

**Absorción:** entrada a la circulación.

**Distribución:** desplazamiento hacia tejidos y líquidos.

**Metabolismo:** transformación química.

**Excreción:** eliminación del fármaco o sus metabolitos.

---$B14$,14 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'absorci_n_14','Absorción',$B15$Es el proceso por el cual un fármaco alcanza la circulación desde el sitio de administración.

No todas las vías requieren el mismo proceso de absorción.

---$B15$,15 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_que_modifican_la_absorci_n_15','Factores que modifican la absorción',$B16$Pueden influir:

- vía;
- formulación;
- solubilidad;
- flujo sanguíneo;
- superficie disponible;
- motilidad gastrointestinal;
- alimentos;
- pH;
- características físico-químicas del fármaco.

---$B16$,16 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'biodisponibilidad_16','Biodisponibilidad',$B17$La biodisponibilidad expresa la proporción del fármaco administrado que alcanza la circulación sistémica de forma disponible.

La administración intravenosa evita el proceso de absorción desde un sitio periférico y proporciona disponibilidad sistémica directa.

---$B17$,17 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'efecto_de_primer_paso_17','Efecto de primer paso',$B18$Algunos fármacos absorbidos por vía gastrointestinal pasan primero por hígado antes de alcanzar la circulación sistémica.

El metabolismo presistémico puede reducir la cantidad de fármaco disponible.

---$B18$,18 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'inicio_de_acci_n_18','Inicio de acción',$B19$Es el tiempo que transcurre hasta que aparece un efecto farmacológico clínicamente relevante.

No es sinónimo de vida media.

---$B19$,19 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concentraci_n_plasm_tica_19','Concentración plasmática',$B20$La concentración plasmática ayuda a comprender la exposición al fármaco.

La concentración por sí sola no determina siempre el efecto clínico: también intervienen sensibilidad del receptor y características del paciente.

---$B20$,20 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'distribuci_n_20','Distribución',$B21$Después de alcanzar la circulación, el fármaco puede distribuirse hacia:

- plasma;
- líquido intersticial;
- tejidos;
- órganos.

La distribución no es uniforme para todos los fármacos.

---$B21$,21 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'flujo_sangu_neo_y_distribuci_n_21','Flujo sanguíneo y distribución',$B22$Los tejidos con mayor perfusión suelen recibir el fármaco con mayor rapidez que los tejidos con menor perfusión.

La perfusión alterada puede modificar la distribución.

---$B22$,22 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'uni_n_a_prote_nas_plasm_ticas_22','Unión a proteínas plasmáticas',$B23$Algunos fármacos se unen a proteínas plasmáticas.

La fracción unida y la fracción libre mantienen una relación dinámica.

Los cambios en proteínas plasmáticas pueden modificar la fracción disponible de ciertos fármacos.

---$B23$,23 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fracci_n_libre_23','Fracción libre',$B24$La fracción no unida es la que puede:

- atravesar membranas;
- alcanzar sitios de acción;
- ser metabolizada;
- ser eliminada.

Esto no significa que todos los cambios de proteínas produzcan automáticamente toxicidad; depende del fármaco y del contexto.

---$B24$,24 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'volumen_aparente_de_distribuci_n_24','Volumen aparente de distribución',$B25$Es un parámetro farmacocinético que relaciona la cantidad de fármaco en el organismo con su concentración plasmática.

Es un **volumen aparente**, no un compartimento anatómico real.

Un valor alto suele sugerir distribución extensa fuera del plasma.

---$B25$,25 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'barreras_fisiol_gicas_25','Barreras fisiológicas',$B26$La distribución puede verse limitada por barreras como:

- barrera hematoencefálica;
- placenta.

La capacidad de atravesarlas depende del fármaco y de condiciones fisiológicas o patológicas.

---$B26$,26 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'metabolismo_o_biotransformaci_n_26','Metabolismo o biotransformación',$B27$Es la transformación química del fármaco por sistemas enzimáticos.

Puede producir:

- metabolitos inactivos;
- metabolitos activos;
- metabolitos con toxicidad.

---$B27$,27 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'h_gado_y_metabolismo_27','Hígado y metabolismo',$B28$El hígado es un órgano principal de metabolismo farmacológico.

La enfermedad hepática puede modificar el metabolismo de determinados medicamentos.

El efecto depende del fármaco específico, vía metabólica y grado de alteración.

---$B28$,28 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fases_i_y_ii_visi_n_conceptual_28','Fases I y II: visión conceptual',$B29$Las reacciones metabólicas suelen agruparse didácticamente en:

**Fase I:** modificación de la molécula.

**Fase II:** conjugación con otras sustancias.

No todos los fármacos tienen que pasar obligatoriamente por ambas fases en ese orden.

---$B29$,29 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sistema_cyp_concepto_29','Sistema CYP: concepto',$B30$El sistema del citocromo P450 comprende enzimas que participan en el metabolismo de numerosos fármacos.

Su actividad puede variar por:

- genética;
- otros medicamentos;
- sustancias;
- enfermedad.

---$B30$,30 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'inducci_n_enzim_tica_30','Inducción enzimática',$B31$La inducción aumenta la actividad o cantidad de determinadas enzimas metabólicas.

Puede acelerar el metabolismo de algunos sustratos y modificar su exposición.

El resultado clínico depende del fármaco involucrado.

---$B31$,31 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'inhibici_n_enzim_tica_31','Inhibición enzimática',$B32$La inhibición disminuye la actividad de determinadas enzimas.

Puede reducir el metabolismo de algunos fármacos y aumentar su exposición.

No debe asumirse la misma consecuencia para todos los medicamentos.

---$B32$,32 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prof_rmacos_32','Profármacos',$B33$Un profármaco se administra en una forma que necesita transformación en el organismo para generar una sustancia farmacológicamente activa.

Por ello, disminuir el metabolismo no siempre significa disminuir el efecto tóxico o aumentar el efecto terapéutico: depende de si el fármaco necesita activación.

---$B33$,33 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'excreci_n_33','Excreción',$B34$Es la eliminación del fármaco y/o de sus metabolitos.

Participan principalmente:

- riñón;
- vía biliar;
- heces;
- pulmones;

y, en menor grado para determinados compuestos, otras secreciones.

---$B34$,34 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ri_n_y_eliminaci_n_34','Riñón y eliminación',$B35$La función renal es fundamental para la eliminación de muchos medicamentos.

Cuando disminuye, ciertos fármacos pueden:

- eliminarse más lentamente;
- acumularse;
- prolongar sus efectos.

La necesidad de ajuste depende del medicamento y debe basarse en prescripción y guías pertinentes.

---$B35$,35 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'otras_v_as_de_excreci_n_35','Otras vías de excreción',$B36$Además del riñón, pueden intervenir:

- bilis;
- heces;
- aire espirado;
- leche materna;
- sudor y otras secreciones.

Su importancia clínica varía según la sustancia.

---$B36$,36 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'aclaramiento_o_clearance_36','Aclaramiento o clearance',$B37$El aclaramiento describe la capacidad del organismo para eliminar un fármaco de la circulación.

Puede considerarse:

- renal;
- hepático;
- total.

Aclaramiento reducido suele favorecer mayor exposición si los demás factores permanecen iguales.

---$B37$,37 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'vida_media_37','Vida media',$B38$La vida media es el tiempo necesario para que la concentración o cantidad del fármaco disminuya a la mitad bajo las condiciones farmacocinéticas consideradas.

Ayuda a comprender:

- duración de la exposición;
- acumulación;
- tiempo hacia estado estable;
- eliminación después de suspender un fármaco.

---$B38$,38 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_estable_38','Estado estable',$B39$Durante administración repetida, puede alcanzarse un punto en el que la entrada promedio del fármaco se equilibra con su eliminación promedio.

A esto se denomina **estado estable**.

No significa que la concentración sea totalmente inmóvil; puede fluctuar entre administraciones.

---$B39$,39 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acumulaci_n_39','Acumulación',$B40$Ocurre cuando una nueva exposición al fármaco sucede antes de que la cantidad previa haya sido suficientemente eliminada.

La acumulación depende de:

- intervalo;
- eliminación;
- vida media;
- dosis y características del paciente.

Los cálculos de dosificación corresponden a PHARM-02.

---$B40$,40 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cin_tica_lineal_concepto_40','Cinética lineal: concepto',$B41$En muchos fármacos, dentro de determinados rangos, los cambios de exposición guardan una relación predecible con los cambios de dosis.

Esto se describe como comportamiento aproximadamente lineal.

---$B41$,41 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cin_tica_no_lineal_concepto_41','Cinética no lineal: concepto',$B42$En algunos fármacos, procesos como metabolismo o transporte pueden saturarse.

Entonces un cambio de dosis puede producir un cambio no proporcional en la concentración.

Para CICDE interesa reconocer el concepto, no memorizar ecuaciones avanzadas.

---$B42$,42 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_que_modifican_la_farmacocin_tica_42','Factores que modifican la farmacocinética',$B43$Entre los más importantes:

- edad;
- masa corporal y composición;
- función renal;
- función hepática;
- perfusión;
- embarazo;
- interacciones;
- enfermedades;
- características genéticas.

---$B43$,43 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'edad_y_farmacocin_tica_43','Edad y farmacocinética',$B44$La edad puede modificar:

- distribución;
- metabolismo;
- eliminación.

Por ello, pediatría y adulto mayor requieren especial atención farmacológica.

No deben extrapolarse automáticamente parámetros de adultos jóvenes.

---$B44$,44 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funci_n_renal_44','Función renal',$B45$Antes y durante ciertos tratamientos, enfermería debe considerar datos de función renal cuando sean relevantes.

Un deterioro puede aumentar riesgo de acumulación de fármacos eliminados principalmente por riñón.

---$B45$,45 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funci_n_hep_tica_45','Función hepática',$B46$La función hepática puede modificar:

- metabolismo;
- proteínas plasmáticas;
- flujo hepático.

El efecto clínico depende del medicamento y del grado de enfermedad.

---$B46$,46 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'embarazo_y_lactancia_consideraciones_generales_46','Embarazo y lactancia: consideraciones generales',$B47$Durante embarazo cambian varios parámetros fisiológicos que pueden modificar la farmacocinética.

Algunos medicamentos o metabolitos también pueden pasar a leche materna.

La valoración debe ser específica para cada fármaco; no se deben generalizar riesgos.

---$B47$,47 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'farmacodin_mica_concepto_47','Farmacodinámica: concepto',$B48$La farmacodinámica estudia **qué hace el fármaco al organismo**.

Incluye:

- mecanismo de acción;
- interacción con receptores o dianas;
- intensidad del efecto;
- relación concentración-efecto;
- respuestas terapéuticas y adversas.

---$B48$,48 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diana_farmacol_gica_48','Diana farmacológica',$B49$Es la estructura biológica con la que interactúa un fármaco para producir o modificar una respuesta.

Puede ser:

- receptor;
- enzima;
- canal iónico;
- transportador;
- otra estructura molecular.

---$B49$,49 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'receptores_49','Receptores',$B50$Los receptores son estructuras capaces de reconocer ligandos y traducir esa interacción en una respuesta.

No todos los medicamentos actúan mediante receptores clásicos.

---$B50$,50 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'afinidad_50','Afinidad',$B51$Afinidad describe la tendencia de un fármaco a unirse a su diana o receptor.

La unión por sí sola no define la magnitud final de la respuesta.

---$B51$,51 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actividad_intr_nseca_51','Actividad intrínseca',$B52$Se refiere a la capacidad del fármaco unido para activar el receptor y producir respuesta.

Ayuda a diferenciar agonistas de antagonistas.

---$B52$,52 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'agonista_52','Agonista',$B53$Un agonista se une a un receptor y lo activa, generando una respuesta.

La magnitud depende de:

- concentración;
- afinidad;
- actividad intrínseca;
- sistema biológico.

---$B53$,53 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'agonista_parcial_53','Agonista parcial',$B54$Un agonista parcial activa el receptor, pero su efecto máximo puede ser menor que el de un agonista pleno en el mismo sistema.

Puede comportarse funcionalmente de manera distinta cuando ambos están presentes.

---$B54$,54 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'antagonista_54','Antagonista',$B55$Un antagonista se une o interfiere con un sistema receptor y disminuye o bloquea la acción de un agonista, sin producir por sí mismo la misma respuesta de activación.

---$B55$,55 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'antagonismo_competitivo_55','Antagonismo competitivo',$B56$En términos generales, un antagonista competitivo compite con el agonista por el mismo sitio de unión.

La relación dosis-respuesta puede desplazarse sin necesariamente reducir el efecto máximo alcanzable si se incrementa suficientemente el agonista.

---$B56$,56 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'antagonismo_no_competitivo_56','Antagonismo no competitivo',$B57$Un antagonismo no competitivo reduce la capacidad del sistema para alcanzar la misma respuesta máxima mediante mecanismos que no se revierten simplemente aumentando el agonista.

Es un concepto general; los mecanismos moleculares pueden variar.

---$B57$,57 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'relaci_n_dosis_respuesta_57','Relación dosis-respuesta',$B58$A medida que aumenta la exposición, la respuesta puede aumentar hasta alcanzar un límite.

Esta relación permite comparar:

- intensidad;
- potencia;
- eficacia;
- seguridad.

No significa que “más dosis siempre sea mejor”.

---$B58$,58 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'potencia_58','Potencia',$B59$Potencia se refiere a la cantidad o concentración necesaria para producir un efecto determinado.

Un fármaco más potente necesita menor cantidad para producir el mismo nivel de efecto, si se comparan adecuadamente.

---$B59$,59 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'eficacia_59','Eficacia',$B60$Eficacia, en farmacodinámica, se refiere a la capacidad de producir un efecto máximo.

No debe confundirse con potencia.

---$B60$,60 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'potencia_versus_eficacia_60','Potencia versus eficacia',$B61$Un medicamento puede ser **más potente** pero no tener un **efecto máximo mayor**.

Para la decisión clínica, mayor potencia no significa automáticamente mejor medicamento.

---$B61$,61 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'efecto_m_ximo_61','Efecto máximo',$B62$Es la respuesta máxima que puede alcanzar un fármaco en un sistema determinado.

Aumentar dosis más allá del punto útil puede aumentar toxicidad sin aportar beneficio adicional.

---$B62$,62 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ventana_terap_utica_62','Ventana terapéutica',$B63$Es el rango de exposición entre niveles asociados con eficacia y niveles en los que aumenta el riesgo de toxicidad.

Los fármacos con margen estrecho requieren vigilancia particularmente cuidadosa.

---$B63$,63 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_ndice_terap_utico_concepto_63','Índice terapéutico: concepto',$B64$Es una medida que compara exposición o dosis asociada con toxicidad frente a la asociada con efecto terapéutico.

En el estudio básico interesa comprender:

> margen más estrecho = menor separación entre efecto deseado y toxicidad.

No se requiere asumir un valor universal.

---$B64$,64 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tolerancia_64','Tolerancia',$B65$Es una disminución de la respuesta con el uso repetido, que puede requerir mayor exposición para producir un efecto similar.

Los mecanismos varían según el medicamento.

---$B65$,65 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'taquifilaxia_65','Taquifilaxia',$B66$Es una pérdida rápida de respuesta tras exposiciones repetidas en un periodo relativamente corto.

No es sinónimo exacto de toda forma de tolerancia.

---$B66$,66 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipersensibilidad_y_respuesta_idiosincr_tica_disti_66','Hipersensibilidad y respuesta idiosincrática: distinción',$B67$**Hipersensibilidad:** respuesta inmunológica exagerada frente a una sustancia.

**Respuesta idiosincrática:** respuesta inusual o impredecible relacionada con características individuales.

No deben utilizarse ambos términos como sinónimos.

---$B67$,67 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interacciones_farmacol_gicas_concepto_67','Interacciones farmacológicas: concepto',$B68$Una interacción ocurre cuando una sustancia modifica el efecto o la exposición de otra.

Puede ser:

- farmacocinética;
- farmacodinámica.

El análisis de seguridad detallado corresponde a PHARM-04.

---$B68$,68 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'adici_n_sinergismo_y_antagonismo_68','Adición, sinergismo y antagonismo',$B69$**Adición:** el efecto combinado se aproxima a la suma de efectos.

**Sinergismo:** el efecto combinado es mayor de lo esperado por simple suma.

**Antagonismo:** una sustancia reduce el efecto de otra.

---$B69$,69 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'farmacocin_tica_versus_farmacodin_mica_69','Farmacocinética versus farmacodinámica',$B70$| Pregunta | Farmacocinética | Farmacodinámica |
|---|---|---|
| Idea principal | Qué hace el organismo al fármaco | Qué hace el fármaco al organismo |
| Incluye | ADME | mecanismo y respuesta |
| Parámetros típicos | biodisponibilidad, Vd, clearance, vida media | afinidad, potencia, eficacia, efecto máximo |
| Ejemplo | eliminación renal reducida | bloqueo de un receptor |

---$B70$,70 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'razonamiento_de_enfermer_a_en_farmacolog_a_70','Razonamiento de enfermería en farmacología',$B71$Antes y después de administrar un medicamento, enfermería integra:

- indicación;
- antecedentes;
- función renal/hepática cuando sea relevante;
- respuesta esperada;
- signos de eficacia;
- signos de toxicidad;
- educación;
- reevaluación.

La comprensión PK/PD permite explicar **por qué** se vigilan determinados datos.

---$B71$,71 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_71','Integración con el PAE',$B72$## Valoración
Identificar factores que modifiquen exposición o respuesta.

## Diagnóstico
Reconocer problemas y riesgos relacionados con farmacoterapia.

## Planificación
Definir resultados observables y vigilancia.

## Ejecución
Administrar conforme a prescripción y normas aplicables.

## Evaluación
Comparar respuesta obtenida con efecto esperado y detectar eventos adversos.

---$B72$,72 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_conceptuales_frecuentes_72','Errores conceptuales frecuentes',$B73$1. Decir que farmacocinética es “lo que el fármaco hace al cuerpo”.
2. Confundir vida media con inicio de acción.
3. Confundir potencia con eficacia.
4. Suponer que un fármaco más potente siempre es mejor.
5. Pensar que toda fracción unida a proteínas está permanentemente inactiva.
6. Creer que volumen de distribución es un volumen anatómico real.
7. Asumir que inhibir metabolismo siempre disminuye el efecto.
8. Olvidar que un profármaco puede necesitar metabolismo para activarse.
9. Creer que todos los fármacos se eliminan por riñón.
10. Confundir tolerancia y taquifilaxia.
11. Pensar que todos los medicamentos actúan sobre receptores clásicos.
12. Aplicar el mismo comportamiento farmacocinético a todos los pacientes.

---$B73$,73 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_73','Situaciones originales tipo examen',$B74$## Caso 1 — Función renal
Paciente con deterioro renal recibe un medicamento eliminado principalmente por riñón.

**Interpretación:** puede existir menor eliminación y mayor riesgo de acumulación; debe vigilarse y comunicarse para valoración del régimen prescrito.

## Caso 2 — Primer paso
Dos formas del mismo principio activo producen distinta exposición porque una evita el tránsito gastrointestinal inicial.

**Concepto:** biodisponibilidad y efecto de primer paso.

## Caso 3 — Proteínas
Paciente presenta marcada alteración de proteínas plasmáticas y recibe un fármaco altamente unido.

**Interpretación:** la fracción libre puede modificarse; requiere valoración específica del fármaco y contexto.

## Caso 4 — Vida media
Un medicamento tiene eliminación lenta.

**Interpretación:** puede tardar más en acumularse y también más en eliminarse después de suspenderlo.

## Caso 5 — Estado estable
Paciente inicia tratamiento repetido y pregunta por qué el efecto sostenido no se valora inmediatamente.

**Concepto:** algunos regímenes necesitan tiempo para aproximarse al estado estable.

## Caso 6 — Metabolismo
Se añade un inhibidor importante de la enzima que metaboliza otro fármaco activo.

**Interpretación:** puede aumentar su exposición si esa vía es relevante.

## Caso 7 — Profármaco
Un medicamento necesita metabolismo para producir su forma activa.

**Interpretación:** disminuir su activación metabólica puede reducir el efecto terapéutico.

## Caso 8 — Potencia
Fármaco A produce el mismo efecto que B con una cantidad menor.

**Respuesta:** A es más potente para ese efecto; no demuestra necesariamente mayor eficacia.

## Caso 9 — Eficacia
Fármaco B puede alcanzar un efecto máximo mayor que A.

**Respuesta:** B presenta mayor eficacia máxima en esa comparación.

## Caso 10 — Antagonista
Un medicamento ocupa un receptor y reduce la acción de otro.

**Concepto:** antagonismo farmacodinámico.

## Caso 11 — Toxicidad
La dosis aumenta pero ya no mejora el beneficio y aparecen efectos dañinos.

**Interpretación:** aumentar dosis no implica beneficio ilimitado; debe considerarse ventana terapéutica.

## Caso 12 — Biodisponibilidad
Una vía permite que menos cantidad llegue intacta a circulación sistémica.

**Concepto:** menor biodisponibilidad.

## Caso 13 — Distribución
Paciente con perfusión muy reducida presenta cambios en llegada del fármaco a tejidos.

**Concepto:** la perfusión influye en distribución.

## Caso 14 — Respuesta rápida decreciente
Tras exposiciones repetidas muy cercanas, el efecto cae rápidamente.

**Concepto:** taquifilaxia.

## Caso 15 — Variabilidad
Dos pacientes reciben el mismo medicamento y responden de manera diferente.

**Respuesta:** la respuesta depende de factores farmacocinéticos, farmacodinámicos y propios del paciente.

## Caso 16 — Vd
Un fármaco presenta gran volumen aparente de distribución.

**Interpretación:** sugiere distribución extensa fuera del plasma; no representa un espacio anatómico literal.

## Caso 17 — Farmacocinética o farmacodinámica
Un medicamento reduce la actividad de un receptor.

**Respuesta:** fenómeno farmacodinámico.

## Caso 18 — Farmacocinética o farmacodinámica
La eliminación renal de un medicamento disminuye.

**Respuesta:** fenómeno farmacocinético.

---$B74$,74 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_74','Preguntas rápidas de repaso',$B75$**1. ¿Qué hace el organismo al fármaco?**  
Farmacocinética.

**2. ¿Qué hace el fármaco al organismo?**  
Farmacodinámica.

**3. ¿Qué significa ADME?**  
Absorción, distribución, metabolismo y excreción.

**4. ¿Qué expresa la vida media?**  
El tiempo para reducir a la mitad la cantidad o concentración bajo las condiciones consideradas.

**5. ¿Potencia y eficacia son iguales?**  
No.

**6. ¿Qué es un agonista?**  
Un fármaco que activa una diana/receptor y produce respuesta.

**7. ¿Qué es un antagonista?**  
Un fármaco que reduce o bloquea la acción del agonista en un sistema.

**8. ¿Qué parámetro describe capacidad de eliminación?**  
Aclaramiento o clearance.

---$B75$,75 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_75','Fuentes y validación',$B76$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

## Bibliografía farmacológica CICDE

2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020. ISBN 9788491102793.

   Su índice incluye en Farmacología General:
   - Introducción a la farmacología clínica.
   - Farmacocinética. Parámetros farmacocinéticos.
   - Normas generales para administración y dosificación.
   - Seguridad de medicamentos.
   - Errores de medicación.
   - Fluidos y balance electrolítico.

3. **Adams, M. P.; Holland, N.** *Pharmacology for Nurses: A Pathophysiologic Approach.* Referencia bibliográfica CICDE del proyecto.

## Verificación estructural complementaria

4. **Pearson.** *Pharmacology for Nurses: A Pathophysiologic Approach*, 7th ed. La edición contemporánea conserva capítulos nucleares separados para Introduction to Pharmacology, Pharmacokinetics y Pharmacodynamics.

---$B76$,76 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_76','Límites y actualización',$B77$- PHARM-01 no prescribe regímenes terapéuticos.
- No se incluyen dosis específicas.
- No se presentan valores universales de concentración terapéutica.
- Los ajustes por función renal o hepática dependen de cada medicamento y prescripción.
- Las interacciones específicas deben verificarse con fuentes farmacológicas actualizadas.
- Las normas de administración se desarrollarán en PHARM-02.
- Seguridad y errores se desarrollarán en PHARM-04 y PHARM-05.
- El material permanece en `REVIEW` hasta revisión humana.

---$B77$,77 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_77','Control de calidad',$B78$Este paquete:

- conserva el tema exacto CICDE;
- cubre **2/2 subtemas explícitos**;
- diferencia farmacocinética y farmacodinámica;
- desarrolla ADME y parámetros farmacocinéticos;
- desarrolla receptores y dosis-respuesta;
- diferencia potencia de eficacia;
- mantiene enfoque de enfermería;
- evita cálculos de dosis prematuros;
- contiene 18 situaciones originales;
- no declara revisión humana inexistente.

---$B78$,78 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_78','Estado para integración',$B79$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana académica;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular fuentes en el sistema;
- verificar coherencia con PHARM-02 a PHARM-07.

**Cobertura CICDE PHARM-01: 2/2 subtemas explícitos cubiertos.**

**Situaciones originales tipo examen: 18.**$B79$,79 FROM tmap WHERE c='PHARM-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B80$El temario CICDE 2026 incluye:

> **Normas generales para administración y dosificación**

CICDE no enumera subtemas explícitos para PHARM-02.

La bibliografía principal del proyecto, **Somoza, Cano y Guerra, 2.ª edición**, contiene un capítulo con correspondencia directa:

> **“Normas generales para la administración y dosificación de fármacos”.**

Este material desarrolla el proceso general de administración y dosificación sin duplicar:

- PHARM-03: conversiones y equivalencias;
- PHARM-04: seguridad de medicamentos;
- PHARM-05: errores de medicación;
- PHARM-06: fluidos y balance electrolítico;
- PHARM-07: metrología.

---$B80$,1 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B81$Al finalizar el tema, el estudiante debe poder:

1. Interpretar una orden de medicamentos antes de administrarla.
2. Reconocer cuándo una orden debe aclararse.
3. Realizar valoración previa pertinente.
4. Identificar correctamente al paciente.
5. Aplicar verificaciones esenciales de administración.
6. Preparar medicamentos de forma segura.
7. Resolver cálculos básicos cuando las unidades ya son compatibles.
8. Reconocer principios de dosificación por peso y dosis divididas.
9. Diferenciar normas generales según la vía de administración.
10. Educar al paciente y respetar su derecho a rechazar.
11. Vigilar respuesta terapéutica y eventos adversos.
12. Documentar de forma correcta y oportuna.

---$B81$,2 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'administraci_n_de_medicamentos_concepto_2','Administración de medicamentos: concepto',$B82$Administrar un medicamento es un **proceso clínico**, no solo entregar una sustancia.

Incluye:

- revisar la orden;
- valorar al paciente;
- preparar;
- verificar;
- administrar;
- educar;
- observar;
- documentar;
- evaluar la respuesta.

---$B82$,3 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosificaci_n_concepto_3','Dosificación: concepto',$B83$Dosificación es la determinación y aplicación del régimen de cantidad de medicamento que debe recibir una persona.

Puede considerar:

- dosis individual;
- intervalo;
- frecuencia;
- duración;
- peso;
- edad;
- función renal o hepática;
- respuesta clínica.

La enfermera no modifica por cuenta propia una prescripción fuera de su ámbito; identifica discrepancias y las comunica.

---$B83$,4 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_de_enfermer_a_4','Responsabilidad de enfermería',$B84$La enfermera es responsable de sus acciones durante el proceso de administración.

Esto incluye:

- verificar;
- reconocer límites;
- aclarar órdenes dudosas;
- utilizar juicio clínico;
- vigilar efectos;
- documentar.

Una orden prescrita no elimina la responsabilidad profesional de detectar una inconsistencia evidente.

---$B84$,5 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prescripci_n_u_orden_de_medicamentos_5','Prescripción u orden de medicamentos',$B85$La orden comunica el régimen farmacológico autorizado.

Antes de administrar debe comprobarse que corresponda al paciente y que pueda interpretarse sin ambigüedad.

---$B85$,6 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'elementos_de_una_orden_completa_6','Elementos de una orden completa',$B86$Según el sistema institucional, una orden debe permitir identificar con claridad:

- paciente;
- medicamento;
- dosis;
- vía;
- frecuencia u horario;
- fecha/hora cuando corresponda;
- prescriptor autorizado.

En órdenes PRN debe quedar clara la indicación y los parámetros pertinentes.

---$B86$,7 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'orden_incompleta_ilegible_o_dudosa_7','Orden incompleta, ilegible o dudosa',$B87$Nunca se debe “adivinar” una orden.

Ante:

- dosis ambigua;
- abreviatura dudosa;
- vía ausente;
- frecuencia contradictoria;
- medicamento no reconocido;
- posible dosis peligrosa;

la conducta correcta es **detener y aclarar antes de administrar**.

---$B87$,8 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tipos_de_orden_visi_n_general_8','Tipos de orden: visión general',$B88$En distintos sistemas pueden encontrarse categorías como:

- programada;
- dosis única;
- inmediata/urgente;
- PRN;
- protocolos u órdenes estandarizadas autorizadas.

La terminología exacta depende de la institución.

---$B88$,9 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_prn_9','Medicamentos PRN',$B89$PRN significa administración según necesidad bajo condiciones prescritas.

Antes de administrar, valorar:

- indicación;
- síntomas;
- intervalo desde la dosis previa;
- límites establecidos;
- respuesta a dosis anteriores.

Después se debe reevaluar el efecto.

---$B89$,10 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conciliaci_n_concepto_y_l_mite_con_pharm_04_10','Conciliación: concepto y límite con PHARM-04',$B90$La conciliación compara los medicamentos que el paciente utiliza con los que aparecen en transiciones de atención.

Es relevante para detectar:

- omisiones;
- duplicidades;
- discrepancias.

Su desarrollo como barrera de seguridad corresponde principalmente a PHARM-04.

---$B90$,11 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valoraci_n_previa_a_la_administraci_n_11','Valoración previa a la administración',$B91$La administración comienza antes de preparar el medicamento.

La valoración puede incluir:

- signos vitales;
- síntomas;
- alergias;
- laboratorio;
- capacidad de deglución;
- nivel de conciencia;
- función renal/hepática;
- respuesta previa.

No todos los medicamentos requieren los mismos parámetros.

---$B91$,12 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alergias_y_reacciones_previas_12','Alergias y reacciones previas',$B92$Antes de administrar, verificar alergias documentadas y antecedentes relevantes.

Diferenciar, cuando sea posible:

- alergia;
- intolerancia;
- efecto adverso;
- reacción desconocida.

Una alerta no debe ignorarse sin aclaración.

---$B92$,13 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'verificar_la_indicaci_n_13','Verificar la indicación',$B93$Conocer para qué se prescribe el medicamento ayuda a detectar incongruencias.

Si el fármaco no guarda relación aparente con la condición del paciente, se debe revisar la orden antes de administrarlo.

---$B93$,14 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'contraindicaciones_y_precauciones_14','Contraindicaciones y precauciones',$B94$La enfermera debe identificar datos que puedan requerir valoración adicional.

Ejemplos generales:

- alergia;
- función renal deteriorada;
- presión arterial muy baja antes de cierto medicamento;
- incapacidad para deglutir;
- interacción relevante conocida.

---$B94$,15 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'par_metros_cl_nicos_previos_15','Parámetros clínicos previos',$B95$Algunos medicamentos requieren comprobar datos antes de administrarlos.

Pueden incluir:

- presión arterial;
- frecuencia cardiaca;
- glucemia;
- dolor;
- nivel de sedación;
- electrolitos;
- función renal.

Los parámetros exactos dependen del medicamento y de la prescripción/protocolo.

---$B95$,16 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'identificaci_n_correcta_del_paciente_16','Identificación correcta del paciente',$B96$Antes de administrar, confirmar la identidad mediante los identificadores aceptados por la institución.

No es suficiente confiar únicamente en:

- número de habitación;
- ubicación;
- reconocimiento visual.

La identificación debe hacerse activamente.

---$B96$,17 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derechos_de_administraci_n_c_mo_estudiarlos_17','Derechos de administración: cómo estudiarlos',$B97$Diversos textos enseñan “5”, “6”, “10” u otros números de derechos.

No existe una única lista universal.

Para CICDE conviene comprender el **proceso**, no memorizar un número aislado.

ISMP advierte que los derechos son metas de seguridad y no sustituyen procedimientos y sistemas confiables.

---$B97$,18 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cinco_metas_cl_sicas_18','Cinco metas clásicas',$B98$Las cinco metas clásicas son:

1. paciente correcto;
2. medicamento correcto;
3. dosis correcta;
4. vía correcta;
5. tiempo correcto.

Son una base útil, pero incompleta si se usan solas.

---$B98$,19 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'elementos_ampliados_de_verificaci_n_19','Elementos ampliados de verificación',$B99$Otros elementos frecuentemente añadidos incluyen:

- indicación correcta;
- documentación correcta;
- evaluación/monitorización;
- educación;
- derecho a rechazar;
- respuesta esperada.

La denominación y cantidad varían entre fuentes.

---$B99$,20 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comprobaciones_del_medicamento_y_etiqueta_20','Comprobaciones del medicamento y etiqueta',$B100$La etiqueta debe revisarse durante el proceso de selección, preparación y antes de la administración conforme al procedimiento institucional.

El objetivo es confirmar que el medicamento preparado corresponde a la orden.

---$B100$,21 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'lectura_cr_tica_de_la_etiqueta_21','Lectura crítica de la etiqueta',$B101$Verificar:

- nombre del principio activo;
- concentración;
- forma farmacéutica;
- volumen/cantidad;
- vía cuando esté indicada;
- advertencias relevantes.

No confiar solo en color, tamaño o ubicación del envase.

---$B101$,22 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'caducidad_e_integridad_22','Caducidad e integridad',$B102$Antes de usar:

- verificar fecha de caducidad;
- inspeccionar integridad del envase;
- observar cambios visibles cuando sean relevantes;
- confirmar almacenamiento adecuado.

No utilizar un medicamento cuya seguridad sea dudosa.

---$B102$,23 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'almacenamiento_y_preparaci_n_23','Almacenamiento y preparación',$B103$Respetar condiciones específicas de:

- temperatura;
- luz;
- humedad;
- refrigeración;
- protección física;

cuando el medicamento lo requiera.

---$B103$,24 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'higiene_de_manos_24','Higiene de manos',$B104$La higiene de manos forma parte de la prevención de contaminación durante preparación y administración.

Debe aplicarse según el momento asistencial y la técnica utilizada.

---$B104$,25 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'t_cnica_as_ptica_25','Técnica aséptica',$B105$La preparación parenteral y otros procedimientos que lo requieran deben mantener técnica aséptica.

Evitar:

- contaminar puntos críticos;
- reutilizar material de un solo uso;
- manipular innecesariamente conexiones.

---$B105$,26 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interrupciones_y_distracciones_26','Interrupciones y distracciones',$B106$Las interrupciones pueden favorecer omisiones, selecciones incorrectas o pérdida de secuencia.

Durante preparación/administración:

- concentrarse;
- evitar tareas simultáneas innecesarias;
- reiniciar verificaciones si se pierde la secuencia.

---$B106$,27 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_lculo_de_dosis_marco_b_sico_27','Cálculo de dosis: marco básico',$B107$La dosis administrada debe corresponder a la dosis prescrita y a la concentración disponible.

Antes de calcular:

1. identificar qué se solicita;
2. identificar qué presentación existe;
3. comprobar unidades;
4. calcular;
5. valorar si el resultado es razonable.

---$B107$,28 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'f_rmula_b_sica_con_unidades_compatibles_28','Fórmula básica con unidades compatibles',$B108$Cuando las unidades son compatibles:

**Cantidad a administrar = (dosis prescrita / dosis disponible) × cantidad de presentación**

Ejemplo:

Orden: 500 mg.  
Disponible: 250 mg en 1 tableta.

500 / 250 × 1 = **2 tabletas**.

Esta fórmula no sustituye la valoración clínica.

---$B108$,29 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'compatibilidad_de_unidades_29','Compatibilidad de unidades',$B109$Nunca dividir cantidades expresadas en unidades diferentes sin convertirlas primero.

Ejemplo:

- mg con mg: compatible;
- mg con g: requiere conversión previa.

Las conversiones se desarrollan en PHARM-03.

---$B109$,30 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redondeo_y_precisi_n_30','Redondeo y precisión',$B110$El redondeo debe realizarse:

- al final del cálculo;
- según política institucional;
- considerando la precisión del dispositivo disponible.

Redondear demasiado pronto puede modificar el resultado final.

---$B110$,31 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cero_inicial_y_cero_final_31','Cero inicial y cero final',$B111$Para reducir errores de lectura:

- escribir **0.5**, no **.5**;
- evitar **5.0** cuando puede interpretarse como 50.

La presentación exacta debe seguir estándares institucionales.

---$B111$,32 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'decimales_y_lectura_segura_32','Decimales y lectura segura',$B112$Una posición decimal equivocada puede multiplicar o dividir una dosis por diez.

Antes de administrar, preguntar:

> ¿Este valor es clínicamente razonable?

---$B112$,33 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosificaci_n_basada_en_peso_33','Dosificación basada en peso',$B113$Algunas prescripciones se expresan como cantidad por kilogramo de peso.

Ejemplo conceptual:

10 mg/kg para un paciente de 20 kg:

10 × 20 = **200 mg**.

Después debe verificarse que la dosis resultante se encuentre dentro del régimen prescrito y límites aplicables.

---$B113$,34 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'peso_en_kilogramos_34','Peso en kilogramos',$B114$La dosificación por peso requiere utilizar la unidad indicada.

Si el peso está en otra unidad, debe convertirse correctamente antes del cálculo.

Las conversiones se practican en PHARM-03.

---$B114$,35 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosis_total_diaria_y_dosis_divididas_35','Dosis total diaria y dosis divididas',$B115$Debe diferenciarse:

- **dosis por administración**;
- **dosis total en 24 horas**.

Ejemplo:

600 mg/día divididos en 3 dosis:

600 / 3 = **200 mg por dosis**.

---$B115$,36 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosis_m_xima_36','Dosis máxima',$B116$Si existe una dosis máxima prescrita o establecida por la referencia utilizada, el cálculo no debe excederla.

Ante discrepancia:

**no administrar hasta aclarar.**

---$B116$,37 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'superficie_corporal_concepto_37','Superficie corporal: concepto',$B117$Algunos regímenes especializados utilizan superficie corporal.

PHARM-02 exige reconocer el concepto, pero no asumir fórmulas universales sin la referencia clínica correspondiente.

---$B117$,38 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosificaci_n_pedi_trica_38','Dosificación pediátrica',$B118$En pediatría es especialmente importante:

- peso actual;
- unidades correctas;
- concentración disponible;
- dosis máxima;
- doble revisión cuando la política lo requiera.

Nunca extrapolar automáticamente una dosis adulta.

---$B118$,39 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'adulto_mayor_39','Adulto mayor',$B119$Cambios fisiológicos asociados a la edad pueden modificar:

- distribución;
- metabolismo;
- eliminación;
- sensibilidad.

La enfermera debe vigilar respuesta y datos clínicos relevantes.

---$B119$,40 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funci_n_renal_y_hep_tica_40','Función renal y hepática',$B120$Algunos regímenes se ajustan por función renal o hepática.

La enfermera:

- identifica resultados relevantes;
- reconoce riesgo;
- comunica discrepancias;
- administra el régimen autorizado.

No modifica dosis por iniciativa propia fuera de su ámbito.

---$B120$,41 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'selecci_n_verificaci_n_de_la_v_a_41','Selección/verificación de la vía',$B121$La vía prescrita debe coincidir con:

- forma farmacéutica;
- condición del paciente;
- orden.

No intercambiar vías por conveniencia.

---$B121$,42 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_oral_42','Vía oral',$B122$Antes de administrar por vía oral valorar:

- capacidad para deglutir;
- nivel de conciencia;
- restricciones;
- relación con alimentos;
- forma farmacéutica.

---$B122$,43 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sublingual_y_bucal_43','Sublingual y bucal',$B123$Estas formas dependen del contacto con mucosa oral.

No deben tragarse o triturarse automáticamente si la formulación requiere absorción local específica.

---$B123$,44 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'administraci_n_por_sonda_enteral_44','Administración por sonda enteral',$B124$Antes de administrar:

- confirmar que la vía es apropiada;
- revisar la formulación;
- valorar compatibilidad con la sonda y nutrición;
- seguir protocolo de preparación y lavado.

No triturar cualquier tableta de forma automática.

---$B124$,45 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_que_no_deben_triturarse_sin_verificac_45','Medicamentos que no deben triturarse sin verificación',$B125$Algunas formulaciones pueden perder seguridad o eficacia al triturarse, por ejemplo ciertas:

- liberaciones modificadas;
- cubiertas entéricas;
- formulaciones especiales.

Ante duda, consultar una fuente farmacológica autorizada/farmacia.

---$B125$,46 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_t_pica_46','Vía tópica',$B126$Aplicar en el sitio indicado considerando:

- integridad de piel;
- extensión;
- cantidad;
- uso de guantes cuando corresponda;
- retiro de preparaciones previas según producto/protocolo.

---$B126$,47 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_transd_rmica_47','Vía transdérmica',$B127$Los sistemas transdérmicos liberan medicamento durante un periodo.

Antes de colocar uno nuevo:

- comprobar si existe un parche previo;
- respetar sitio/rotación según producto;
- registrar fecha/hora cuando corresponda.

No cortar un parche salvo que el producto específicamente lo permita.

---$B127$,48 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_oft_lmica_48','Vía oftálmica',$B128$Evitar contaminar el aplicador.

El medicamento debe administrarse en el ojo correcto.

No tocar directamente el ojo con la punta del envase.

---$B128$,49 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_tica_49','Vía ótica',$B129$Confirmar:

- oído correcto;
- preparación indicada para uso ótico;
- técnica apropiada según edad y producto.

No intercambiar preparados oftálmicos y óticos por apariencia.

---$B129$,50 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_nasal_50','Vía nasal',$B130$Valorar permeabilidad y técnica.

Evitar contaminación del aplicador y educar sobre posición/uso según el producto.

---$B130$,51 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_inhalatoria_51','Vía inhalatoria',$B131$La eficacia depende en gran medida de la técnica.

Enfermería debe:

- demostrar;
- observar retorno de demostración;
- corregir errores;
- verificar dispositivo.

---$B131$,52 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_as_rectal_y_vaginal_52','Vías rectal y vaginal',$B132$Requieren:

- privacidad;
- explicación;
- posición adecuada;
- técnica limpia/asepsia según procedimiento;
- respeto y consentimiento.

---$B132$,53 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_as_parenterales_53','Vías parenterales',$B133$Incluyen, entre otras:

- intradérmica;
- subcutánea;
- intramuscular;
- intravenosa.

Cada una tiene indicaciones, velocidades y riesgos diferentes.

---$B133$,54 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_intrad_rmica_54','Vía intradérmica',$B134$Administra pequeñas cantidades en la dermis.

Se utiliza en procedimientos específicos.

La técnica y volumen dependen del producto/protocolo.

---$B134$,55 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_subcut_nea_55','Vía subcutánea',$B135$Deposita medicamento en tejido subcutáneo.

Debe considerarse:

- sitio;
- tejido disponible;
- rotación cuando corresponda;
- características del medicamento.

---$B135$,56 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_intramuscular_56','Vía intramuscular',$B136$Antes de administrar valorar:

- medicamento;
- volumen;
- sitio;
- masa muscular;
- edad;
- riesgo de sangrado;
- técnica institucional.

No existe un volumen universal seguro para toda persona y todo sitio.

---$B136$,57 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_intravenosa_57','Vía intravenosa',$B137$La vía IV produce acceso directo a circulación y puede generar efectos rápidos.

Exige especial atención a:

- concentración;
- compatibilidad;
- dilución;
- velocidad;
- acceso venoso;
- monitorización.

---$B137$,58 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'compatibilidad_intravenosa_58','Compatibilidad intravenosa',$B138$No mezclar medicamentos o soluciones sin comprobar compatibilidad.

Las incompatibilidades pueden ser:

- físicas;
- químicas;
- terapéuticas.

Consultar fuentes específicas.

---$B138$,59 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'velocidad_de_administraci_n_59','Velocidad de administración',$B139$Algunos medicamentos requieren velocidades específicas.

Administrar demasiado rápido puede causar daño aun cuando paciente, fármaco y dosis sean correctos.

Por eso la velocidad debe verificarse cuando sea relevante.

---$B139$,60 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'horario_y_frecuencia_60','Horario y frecuencia',$B140$La frecuencia mantiene la exposición terapéutica prevista.

Interpretar correctamente:

- intervalos;
- relación con comidas;
- procedimientos;
- parámetros clínicos.

---$B140$,61 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'relaci_n_con_alimentos_61','Relación con alimentos',$B141$Algunos medicamentos:

- deben administrarse con alimentos;
- requieren ayuno;
- pueden verse afectados por determinados alimentos.

No generalizar: verificar cada medicamento.

---$B141$,62 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'adelantos_retrasos_y_omisiones_62','Adelantos, retrasos y omisiones',$B142$No compensar por cuenta propia una dosis omitida mediante:

- duplicación;
- cambio arbitrario de horario;
- aumento de dosis.

Seguir política institucional y consultar cuando corresponda.

---$B142$,63 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preparaci_n_para_un_paciente_a_la_vez_63','Preparación para un paciente a la vez',$B143$Preparar medicamentos manteniendo claramente vinculados:

- paciente;
- orden;
- producto.

Esto reduce confusiones entre pacientes.

---$B143$,64 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rotulado_de_preparaciones_64','Rotulado de preparaciones',$B144$Una preparación que no se administra inmediatamente debe identificarse conforme a la política aplicable.

Nunca utilizar una jeringa o recipiente cuyo contenido no pueda identificarse con certeza.

---$B144$,65 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preparaci_n_y_administraci_n_continuidad_65','Preparación y administración: continuidad',$B145$Cuando sea posible y conforme al sistema institucional, mantener continuidad entre quien prepara y quien administra reduce pérdida de información.

Si existe transferencia, debe existir trazabilidad clara.

---$B145$,66 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'educaci_n_al_paciente_66','Educación al paciente',$B146$Antes o durante la administración, explicar de forma apropiada:

- nombre/propósito;
- modo de administración;
- efectos esperados;
- precauciones relevantes.

El paciente informado puede ayudar a detectar discrepancias.

---$B146$,67 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derecho_a_rechazar_67','Derecho a rechazar',$B147$Un paciente capaz puede rechazar un medicamento.

La respuesta correcta es:

- explorar motivo;
- brindar información;
- valorar riesgo;
- comunicar;
- documentar.

No forzar ni ocultar el medicamento.

---$B147$,68 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confirmar_administraci_n_efectiva_68','Confirmar administración efectiva',$B148$Especialmente por vía oral/enteral, no debe documentarse como administrado algo que:

- no fue ingerido;
- fue vomitado inmediatamente;
- quedó sin administrar;
- fue rechazado.

La conducta posterior depende del medicamento y situación.

---$B148$,69 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'monitorizaci_n_posterior_69','Monitorización posterior',$B149$Después de administrar, evaluar según el medicamento:

- efecto terapéutico;
- signos vitales;
- síntomas;
- reacciones adversas;
- laboratorio;
- nivel de conciencia;
- dolor.

Administrar sin reevaluar deja incompleto el proceso.

---$B149$,70 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respuesta_terap_utica_70','Respuesta terapéutica',$B150$La pregunta no termina en:

> “¿Se administró?”

También debe preguntarse:

> “¿Produjo el efecto esperado?”

---$B150$,71 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reacciones_adversas_reconocimiento_inicial_71','Reacciones adversas: reconocimiento inicial',$B151$Ante una posible reacción:

1. valorar al paciente;
2. priorizar estabilidad;
3. detener la exposición cuando corresponda y sea seguro;
4. comunicar;
5. seguir protocolo;
6. documentar.

El análisis completo de seguridad corresponde a PHARM-04.

---$B151$,72 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentaci_n_de_la_administraci_n_72','Documentación de la administración',$B152$Registrar según sistema:

- medicamento;
- dosis;
- vía;
- hora;
- observaciones pertinentes;
- respuesta cuando corresponda.

La documentación debe reflejar lo ocurrido realmente.

---$B152$,73 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_documentar_antes_de_administrar_73','No documentar antes de administrar',$B153$Documentar anticipadamente puede generar un registro falso si finalmente el medicamento:

- se rechaza;
- se suspende;
- no está disponible;
- no se administra.

Primero administrar, luego documentar conforme al proceso.

---$B153$,74 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentar_omisi_n_o_rechazo_74','Documentar omisión o rechazo',$B154$Si no se administra:

- registrar la razón;
- comunicar cuando corresponda;
- documentar intervención;
- realizar seguimiento.

No ocultar la omisión.

---$B154$,75 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_de_alto_riesgo_principio_general_75','Medicamentos de alto riesgo: principio general',$B155$Algunos medicamentos tienen mayor potencial de causar daño grave si ocurre un error.

Esto exige barreras reforzadas.

La clasificación y prevención sistemática se desarrollan en PHARM-04.

---$B155$,76 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'doble_verificaci_n_independiente_cu_ndo_aplica_76','Doble verificación independiente: cuándo aplica',$B156$La doble verificación puede ser requerida para medicamentos/procesos específicos.

Debe ser **independiente** y seguir la política institucional.

No debe convertirse en una firma automática sin revisar.

---$B156$,77 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_digo_de_barras_y_tecnolog_a_77','Código de barras y tecnología',$B157$La tecnología puede ayudar a verificar:

- paciente;
- medicamento;
- registro.

Pero depende de:

- datos correctos;
- equipos funcionales;
- uso adecuado.

---$B157$,78 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tecnolog_a_no_sustituye_juicio_cl_nico_78','Tecnología no sustituye juicio clínico',$B158$Una alerta electrónica aceptada o una lectura de código de barras no hace segura una orden clínicamente inadecuada.

La enfermera debe continuar valorando:

- indicación;
- dosis;
- condición;
- respuesta.

---$B158$,79 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_79','Integración con el PAE',$B159$## Valoración
Alergias, indicación, signos, laboratorio, capacidad y antecedentes.

## Diagnóstico
Riesgos y respuestas relacionados con farmacoterapia.

## Planificación
Objetivos, vigilancia y educación.

## Ejecución
Verificación, preparación, administración y documentación.

## Evaluación
Respuesta terapéutica, efectos adversos y necesidad de seguimiento.

---$B159$,80 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_80','Errores frecuentes de examen',$B160$1. Administrar una orden incompleta “porque siempre se hace así”.
2. Identificar al paciente solo por habitación.
3. Memorizar “10 derechos” como si fueran una lista CICDE oficial.
4. Confiar en color del envase.
5. Dividir mg entre g sin conversión.
6. Confundir dosis diaria con dosis por administración.
7. Redondear al inicio del cálculo.
8. Escribir .5 en lugar de 0.5.
9. Triturar formulaciones sin verificar.
10. Cambiar vía por conveniencia.
11. Administrar IV sin revisar velocidad.
12. Documentar antes de administrar.
13. Duplicar una dosis omitida por iniciativa propia.
14. Forzar un medicamento rechazado.
15. Confiar en tecnología sin valorar al paciente.
16. Administrar PRN sin reevaluar el resultado.

---$B160$,81 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_81','Situaciones originales tipo examen',$B161$## Caso 1 — Orden dudosa
Orden: medicamento conocido, pero la dosis parece diez veces superior a la habitual.

**Respuesta:** no administrar hasta aclarar.

## Caso 2 — Identificación
Paciente responde al nombre esperado, pero no se verifica otro identificador aceptado.

**Respuesta:** completar identificación según protocolo antes de administrar.

## Caso 3 — Dosis básica
Orden: 500 mg. Disponible: 250 mg/tableta.

**Respuesta:** 2 tabletas.

## Caso 4 — Dosis diaria dividida
Orden: 900 mg/día en 3 dosis.

**Respuesta:** 300 mg por dosis.

## Caso 5 — Peso
Orden: 5 mg/kg. Paciente: 20 kg.

**Respuesta:** 100 mg, antes de comparar con límites y presentación disponible.

## Caso 6 — Unidades diferentes
Orden expresada en mg; presentación expresada en g.

**Respuesta:** convertir primero; no calcular con unidades incompatibles.

## Caso 7 — Alergia
El sistema muestra alergia al medicamento prescrito.

**Respuesta:** detener y aclarar antes de administrar.

## Caso 8 — PRN
Paciente solicita analgésico PRN, pero recibió una dosis hace poco.

**Respuesta:** revisar intervalo, indicación y valoración antes de administrar.

## Caso 9 — Tableta de liberación modificada
Paciente no puede deglutir y la enfermera considera triturarla.

**Respuesta:** no triturar hasta verificar si la formulación puede alterarse y buscar alternativa apropiada.

## Caso 10 — Parche
Se encuentra un parche previo aún colocado antes de aplicar uno nuevo.

**Respuesta:** verificar orden y producto; retirar/manejar el previo según indicación antes de duplicar exposición.

## Caso 11 — IV
La dosis es correcta, pero se desconoce la velocidad de administración IV.

**Respuesta:** verificar velocidad antes de administrar.

## Caso 12 — Rechazo
Paciente competente rechaza el medicamento.

**Respuesta:** explorar motivo, informar, comunicar y documentar; no forzar.

## Caso 13 — Registro
La enfermera aún no ha administrado, pero piensa marcar el medicamento como dado para “ganar tiempo”.

**Respuesta:** incorrecto; documentar después de la administración real.

## Caso 14 — Disfagia
Paciente presenta dificultad marcada para deglutir.

**Respuesta:** valorar seguridad de la vía oral y aclarar alternativas antes de administrar.

## Caso 15 — Tecnología
Código de barras coincide, pero la presión arterial está muy baja para un medicamento que requiere valoración previa.

**Respuesta:** el sistema no sustituye el juicio clínico; valorar y actuar según parámetros/orden.

## Caso 16 — Dosis omitida
Se descubre una dosis pasada no administrada.

**Respuesta:** no duplicar automáticamente; revisar medicamento, tiempo y protocolo y comunicar si corresponde.

## Caso 17 — Inhalador
Paciente recibe el medicamento pero utiliza mal el dispositivo.

**Respuesta:** enseñar y verificar técnica mediante demostración/retorno.

## Caso 18 — PRN y reevaluación
Se administra analgésico PRN y no se vuelve a valorar el dolor.

**Respuesta:** proceso incompleto; debe evaluarse la respuesta terapéutica.

---$B161$,82 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_82','Preguntas rápidas de repaso',$B162$**1. ¿Qué hacer ante una orden dudosa?**  
Aclarar antes de administrar.

**2. ¿Los “derechos” de administración tienen un número universal?**  
No.

**3. ¿Qué debe hacerse antes de un cálculo si las unidades difieren?**  
Convertirlas a unidades compatibles.

**4. ¿Cuándo se redondea normalmente?**  
Al final del cálculo, según precisión/política.

**5. ¿Puede cambiarse la vía por conveniencia?**  
No.

**6. ¿Debe documentarse antes de administrar?**  
No.

**7. ¿Qué hacer si el paciente rechaza?**  
Informar, valorar, comunicar y documentar; respetar su decisión dentro del marco aplicable.

**8. ¿La tecnología sustituye el juicio clínico?**  
No.

---$B162$,83 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_83','Fuentes y validación',$B163$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

## Bibliografía principal CICDE

2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020. ISBN 9788491102793.

El índice oficial incluye como capítulo 3:

**“Normas generales para la administración y dosificación de fármacos”.**

## Complementarias

3. **Institute for Safe Medication Practices (ISMP).** *A Better Prescription for Preparing Nursing Students to Practice Safely.* 2021.

4. **Elsevier.** Textos de habilidades clínicas de enfermería: preparación, órdenes, administración, registro, vías y proceso de enfermería.

---$B163$,84 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_84','Límites y actualización',$B164$- Este material no sustituye protocolos institucionales de administración.
- No existe un número universal de “derechos” que deba presentarse como regla CICDE.
- Las técnicas específicas pueden variar según dispositivo, medicamento y fabricante.
- Los medicamentos de alto riesgo se profundizan en PHARM-04.
- Los errores de medicación se profundizan en PHARM-05.
- Las conversiones y equivalencias se desarrollan en PHARM-03.
- No se proporcionan ajustes de dosis específicos para pacientes reales.
- El contenido permanece en `REVIEW` hasta revisión humana.

---$B164$,85 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_85','Control de calidad',$B165$Este paquete:

- conserva el alcance exacto CICDE;
- utiliza el capítulo homónimo de Somoza como fuente principal;
- no inventa subtemas oficiales;
- evita fijar un número universal de derechos;
- cubre orden, valoración, preparación, administración, monitorización y documentación;
- incluye dosificación básica sin invadir PHARM-03;
- cubre vías principales sin inventar volúmenes universales;
- contiene 18 situaciones originales;
- no declara revisión humana inexistente.

---$B165$,86 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_86','Estado para integración',$B166$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana académica;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente las fuentes;
- verificar consistencia con PHARM-01 y PHARM-03 a PHARM-07.

**Cobertura CICDE PHARM-02: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B166$,87 FROM tmap WHERE c='PHARM-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B167$El temario CICDE 2026 incluye:

> **Sistema de conversión y equivalencias**

CICDE no enumera subtemas específicos para PHARM-03. El módulo se concentra en las conversiones necesarias para interpretar y calcular medicamentos de forma segura.$B167$,1 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B168$Al finalizar el tema, el estudiante debe poder convertir masa, volumen, peso y tiempo; utilizar factores de conversión y análisis dimensional; interpretar concentraciones, porcentajes, UI, mEq y mmol; distinguir mg/kg/día de mg/kg/dosis; interpretar mL/h y gotas/min; y verificar la razonabilidad del resultado.$B168$,2 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conversi_n_y_equivalencia_conceptos_2','Conversión y equivalencia: conceptos',$B169$**Conversión** es expresar una misma magnitud en otra unidad. **Equivalencia** es la relación cuantitativa entre ambas expresiones.$B169$,3 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sistema_m_trico_si_en_farmacolog_a_3','Sistema métrico/SI en farmacología',$B170$Las unidades más frecuentes son kg, g, mg, mcg, ng, L y mL.$B170$,4 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prefijos_m_tricos_m_s_utilizados_4','Prefijos métricos más utilizados',$B171$| Prefijo | Símbolo | Relación |
|---|---|---:|
| kilo | k | 10³ |
| mili | m | 10⁻³ |
| micro | mcg o µg | 10⁻⁶ |
| nano | n | 10⁻⁹ |$B171$,5 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'kilogramos_y_gramos_5','Kilogramos y gramos',$B172$**1 kg = 1000 g**$B172$,6 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'gramos_y_miligramos_6','Gramos y miligramos',$B173$**1 g = 1000 mg**$B173$,7 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'miligramos_y_microgramos_7','Miligramos y microgramos',$B174$**1 mg = 1000 mcg**$B174$,8 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'microgramos_y_nanogramos_8','Microgramos y nanogramos',$B175$**1 mcg = 1000 ng**$B175$,9 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'litros_y_mililitros_9','Litros y mililitros',$B176$**1 L = 1000 mL**$B176$,10 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mililitro_y_cent_metro_c_bico_10','Mililitro y centímetro cúbico',$B177$**1 mL = 1 cm³**. Para medicación se prefiere escribir **mL**.$B177$,11 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'por_qu_evitar_la_abreviatura_cc_11','Por qué evitar la abreviatura cc',$B178$Aunque cc se ha usado históricamente, puede prestarse a confusión. Para volumen de medicamentos debe preferirse **mL**.$B178$,12 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conversi_n_decimal_12','Conversión decimal',$B179$Ejemplo: 1.5 g × 1000 mg/g = **1500 mg**. No basta mover el decimal sin comprender la dirección de la conversión.$B179$,13 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_de_conversi_n_13','Factores de conversión',$B180$Un factor de conversión expresa una equivalencia como fracción, por ejemplo 1000 mg/1 g.$B180$,14 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'an_lisis_dimensional_14','Análisis dimensional',$B181$Ejemplo: 0.75 g × 1000 mg/1 g = **750 mg**.$B181$,15 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cancelaci_n_de_unidades_15','Cancelación de unidades',$B182$La unidad original debe cancelarse y la unidad final debe coincidir con la solicitada.$B182$,16 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'raz_n_y_proporci_n_16','Razón y proporción',$B183$Ejemplo: 1 g : 1000 mg = 0.5 g : x mg → **x = 500 mg**.$B183$,17 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'m_todo_dosis_disponible_17','Método dosis disponible',$B184$**Cantidad = (dosis prescrita / dosis disponible) × cantidad disponible**

Ejemplo: 250 mg prescritos; 125 mg/5 mL disponibles → **10 mL**.$B184$,18 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comprobar_unidades_antes_de_calcular_18','Comprobar unidades antes de calcular',$B185$No dividir mg entre g sin convertir primero a unidades compatibles.$B185$,19 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'libras_y_kilogramos_19','Libras y kilogramos',$B186$Para cálculos clínicos puede usarse la aproximación **1 kg ≈ 2.2 lb**, por tanto kg ≈ lb/2.2.$B186$,20 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'kilogramos_y_libras_20','Kilogramos y libras',$B187$Conversión inversa aproximada: lb ≈ kg × 2.2.$B187$,21 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equivalencias_aproximadas_21','Equivalencias aproximadas',$B188$Son exactas dentro del SI: 1 kg = 1000 g; 1 g = 1000 mg; 1 mg = 1000 mcg; 1 L = 1000 mL. La relación 1 kg ≈ 2.2 lb es una aproximación clínica.$B188$,22 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medidas_caseras_precauciones_22','Medidas caseras: precauciones',$B189$Las medidas domésticas pueden variar. Para medicación real se prefieren dispositivos calibrados.$B189$,23 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cucharadita_y_mililitros_23','Cucharadita y mililitros',$B190$En ejercicios educativos suele usarse **1 cucharadita = 5 mL**. En práctica real debe usarse un dispositivo calibrado.$B190$,24 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cucharada_y_mililitros_24','Cucharada y mililitros',$B191$En ejercicios puede utilizarse **1 cucharada = 15 mL**. No confiar en una cuchara doméstica común para dosificación precisa.$B191$,25 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'onza_l_quida_y_mililitros_25','Onza líquida y mililitros',$B192$En cálculos clínicos educativos suele aproximarse **1 onza líquida ≈ 30 mL**.$B192$,26 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'taza_y_mililitros_26','Taza y mililitros',$B193$Las tazas domésticas varían entre sistemas. Si una pregunta requiere una equivalencia, debe utilizarse la relación definida por la fuente del problema.$B193$,27 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dispositivos_calibrados_27','Dispositivos calibrados',$B194$Ejemplos: jeringa oral, jeringa graduada y vaso dosificador.$B194$,28 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'jeringa_oral_28','Jeringa oral',$B195$Está diseñada para medicación oral/enteral y no debe conectarse a sistemas parenterales.$B195$,29 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sistema_apotecario_reconocimiento_hist_rico_29','Sistema apotecario: reconocimiento histórico',$B196$Puede aparecer en materiales antiguos, pero en la práctica moderna se prefieren unidades métricas estandarizadas.$B196$,30 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'grano_reconocimiento_y_riesgo_30','Grano: reconocimiento y riesgo',$B197$La unidad grano pertenece al sistema apotecario. Sus equivalencias históricas pueden variar; si aparece en una pregunta, debe utilizarse la equivalencia definida por la referencia autorizada.$B197$,31 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'minim_reconocimiento_hist_rico_31','Minim: reconocimiento histórico',$B198$Es una unidad histórica de volumen. No debe convertirse mediante una equivalencia memorizada sin verificar la referencia específica.$B198$,32 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'unidades_internacionales_32','Unidades internacionales',$B199$Algunos medicamentos expresan actividad biológica en **UI**.$B199$,33 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ui_no_es_una_unidad_m_trica_33','UI no es una unidad métrica',$B200$No existe una relación universal de UI a mg. La conversión depende de la sustancia.$B200$,34 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'unidades_por_mililitro_34','Unidades por mililitro',$B201$Ejemplo: 100 unidades/mL y orden de 20 unidades → **0.2 mL**.$B201$,35 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'porcentajes_concepto_35','Porcentajes: concepto',$B202$Una concentración porcentual expresa una cantidad de componente en relación con una cantidad total de preparación.$B202$,36 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'porcentaje_peso_volumen_36','Porcentaje peso/volumen',$B203$En **% p/v**, 1% significa **1 g/100 mL**. Por tanto, 1% p/v = **10 mg/mL**.$B203$,37 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'porcentaje_volumen_volumen_37','Porcentaje volumen/volumen',$B204$En **% v/v**, 1% significa **1 mL/100 mL**.$B204$,38 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'porcentaje_peso_peso_38','Porcentaje peso/peso',$B205$En **% p/p**, 1% significa **1 g/100 g**.$B205$,39 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concentraci_n_mg_ml_39','Concentración mg/mL',$B206$500 mg en 2 mL = **250 mg/mL**.$B206$,40 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interpretaci_n_g_100_ml_40','Interpretación g/100 mL',$B207$5 g/100 mL = 5000 mg/100 mL = **50 mg/mL**.$B207$,41 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diluciones_concepto_41','Diluciones: concepto',$B208$Diluir reduce la concentración añadiendo diluyente, sin cambiar la cantidad total de soluto si no hay pérdida.$B208$,42 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'proporciones_1_x_42','Proporciones 1:x',$B209$Expresiones como 1:1000 deben interpretarse según las unidades y el contexto del producto; no deben convertirse mecánicamente.$B209$,43 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'miliequivalentes_concepto_43','Miliequivalentes: concepto',$B210$El **mEq** expresa capacidad química equivalente y se usa especialmente con ciertos electrolitos.$B210$,44 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'milimoles_concepto_44','Milimoles: concepto',$B211$El **mmol** expresa cantidad de sustancia en términos molares.$B211$,45 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'meq_y_mmol_no_son_equivalentes_universales_45','mEq y mmol no son equivalentes universales',$B212$Su relación depende de la **valencia** del ion. No debe asumirse 1 mEq = 1 mmol para todas las sustancias.$B212$,46 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'insulina_y_unidades_46','Insulina y unidades',$B213$La insulina se prescribe en unidades. Debe verificarse la concentración del producto; no se convierte a mg mediante una regla universal.$B213$,47 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'heparina_y_unidades_47','Heparina y unidades',$B214$Puede presentarse en unidades/mL. Deben verificarse concentración y volumen; no todos los viales son iguales.$B214$,48 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conversi_n_previa_a_dosis_por_peso_48','Conversión previa a dosis por peso',$B215$Si la orden está en mg/kg y el peso está en libras, convertir primero a kg.$B215$,49 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mg_kg_d_a_49','mg/kg/día',$B216$Indica una **dosis total diaria** basada en peso. Ejemplo: 30 mg/kg/día para 20 kg = 600 mg/día.$B216$,50 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mg_kg_dosis_50','mg/kg/dosis',$B217$Indica la cantidad **por cada administración**. Ejemplo: 10 mg/kg/dosis para 20 kg = 200 mg por dosis.$B217$,51 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosis_divididas_51','Dosis divididas',$B218$Siempre identificar si el problema solicita dosis diaria total o dosis por administración.$B218$,52 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mcg_min_y_mcg_kg_min_lectura_dimensional_52','mcg/min y mcg/kg/min: lectura dimensional',$B219$En mcg/kg/min debe incorporarse el peso del paciente además del tiempo.$B219$,53 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mg_h_lectura_dimensional_53','mg/h: lectura dimensional',$B220$Expresa cantidad de fármaco por hora. Para convertir a mL/h se necesita conocer la concentración.$B220$,54 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ml_h_lectura_dimensional_54','mL/h: lectura dimensional',$B221$Expresa volumen por hora; no informa por sí sola cuántos mg/h recibe el paciente.$B221$,55 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'gotas_min_concepto_55','Gotas/min: concepto',$B222$Requiere volumen, tiempo y factor de goteo del equipo.$B222$,56 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factor_de_goteo_56','Factor de goteo',$B223$Se expresa en **gotas/mL** y depende del equipo; debe verificarse.$B223$,57 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'microgoteo_verificar_equipo_57','Microgoteo: verificar equipo',$B224$El cálculo debe basarse en el factor indicado por el dispositivo específico, no en una suposición.$B224$,58 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'bomba_de_infusi_n_y_unidades_58','Bomba de infusión y unidades',$B225$La unidad programada debe coincidir con la orden y la concentración disponible.$B225$,59 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conversi_n_de_tiempo_59','Conversión de tiempo',$B226$Los cálculos de infusión pueden exigir convertir horas, minutos y segundos.$B226$,60 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'horas_y_minutos_60','Horas y minutos',$B227$**1 hora = 60 minutos**$B227$,61 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'minutos_y_segundos_61','Minutos y segundos',$B228$**1 minuto = 60 segundos**$B228$,62 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_por_potencias_de_diez_62','Errores por potencias de diez',$B229$Confundir g↔mg, mg↔mcg o mcg↔ng puede generar errores de 1000 veces.$B229$,63 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'notaci_n_decimal_segura_63','Notación decimal segura',$B230$Una posición decimal equivocada puede producir errores de diez veces o más.$B230$,64 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cero_inicial_64','Cero inicial',$B231$Preferir **0.5 mg** a **.5 mg**.$B231$,65 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'evitar_cero_final_innecesario_65','Evitar cero final innecesario',$B232$Evitar **5.0 mg** cuando se quiere indicar 5 mg.$B232$,66 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'escritura_de_microgramo_66','Escritura de microgramo',$B233$Puede utilizarse **mcg** cuando el sistema institucional así lo establece para evitar confusión visual.$B233$,67 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estimaci_n_de_razonabilidad_67','Estimación de razonabilidad',$B234$Preguntar siempre: ¿el resultado es demasiado grande o pequeño? ¿La unidad final es la correcta?$B234$,68 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'verificaci_n_inversa_68','Verificación inversa',$B235$Si se calculan 10 mL de 125 mg/5 mL: 10 × 125/5 = **250 mg**, lo que confirma la dosis.$B235$,69 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'doble_c_lculo_en_situaciones_de_alto_riesgo_69','Doble cálculo en situaciones de alto riesgo',$B236$Cuando la política lo requiere, la segunda verificación debe ser independiente.$B236$,70 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'uso_seguro_de_calculadora_70','Uso seguro de calculadora',$B237$La calculadora no corrige unidades equivocadas ni una fórmula mal planteada.$B237$,71 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_71','Integración con el PAE',$B238$**Valoración:** peso, orden y presentación.  
**Diagnóstico:** riesgo de error de cálculo/unidades.  
**Planificación:** método de conversión y verificación.  
**Ejecución:** convertir y calcular.  
**Evaluación:** confirmar que la dosis calculada coincide con la prevista.$B238$,72 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_72','Errores frecuentes de examen',$B239$1. Dividir unidades incompatibles.  
2. Confundir mg con mcg.  
3. Confundir mg/kg/día con mg/kg/dosis.  
4. No convertir lb a kg.  
5. Convertir UI a mg sin referencia.  
6. Asumir que mEq y mmol siempre son iguales.  
7. Usar medidas caseras como método preciso.  
8. Confundir mL/h con mg/h.  
9. Asumir factor de goteo.  
10. Omitir unidades.  
11. Redondear demasiado pronto.  
12. No verificar razonabilidad.$B239$,73 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_73','Situaciones originales tipo examen',$B240$## Caso 1 — g a mg
0.75 g = **750 mg**.

## Caso 2 — mg a mcg
0.25 mg = **250 mcg**.

## Caso 3 — L a mL
0.8 L = **800 mL**.

## Caso 4 — lb a kg
44 lb ÷ 2.2 = **20 kg aproximadamente**.

## Caso 5 — dosis disponible
250 mg prescritos; 125 mg/5 mL disponibles → **10 mL**.

## Caso 6 — concentración
500 mg en 2 mL → **250 mg/mL**.

## Caso 7 — unidades incompatibles
Orden en mg y presentación en g.

**Respuesta:** convertir primero.

## Caso 8 — mg/kg/día
30 mg/kg/día para 20 kg, dividido en 3 dosis → 600 mg/día → **200 mg/dosis**.

## Caso 9 — mg/kg/dosis
10 mg/kg/dosis para 20 kg → **200 mg por dosis**.

## Caso 10 — UI
20 unidades con concentración 100 unidades/mL → **0.2 mL**.

## Caso 11 — mEq y mmol
“1 mEq siempre equivale a 1 mmol.”

**Respuesta:** falso; depende de la valencia.

## Caso 12 — porcentaje p/v
1% p/v = 1 g/100 mL = **10 mg/mL**.

## Caso 13 — gotas/min
Debe usarse el factor de goteo indicado por el equipo.

## Caso 14 — decimal
“.5 mg” debe escribirse **0.5 mg**.

## Caso 15 — cero final
“5.0 mg” debe evitarse cuando se quiere expresar 5 mg.

## Caso 16 — razonabilidad
Un cálculo produce 50 tabletas para una dosis ordinaria.

**Respuesta:** detener y revisar.

## Caso 17 — taza doméstica
No usar cualquier taza de cocina; preferir dispositivo calibrado.

## Caso 18 — verificación inversa
10 mL de 125 mg/5 mL = **250 mg**.$B240$,74 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_74','Preguntas rápidas de repaso',$B241$**1. 1 g = ?** 1000 mg.  
**2. 1 mg = ?** 1000 mcg.  
**3. 1 L = ?** 1000 mL.  
**4. lb → kg:** dividir aproximadamente entre 2.2.  
**5. ¿UI puede convertirse directamente a mg?** No, salvo equivalencia específica.  
**6. ¿mEq y mmol son siempre iguales?** No.  
**7. ¿Qué hacer si las unidades no coinciden?** Convertir antes de calcular.  
**8. ¿Qué revisar al final?** Unidad y razonabilidad.$B241$,75 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_75','Fuentes y validación',$B242$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.
2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020.
3. **Adams, M. P.; Holland, N.** *Pharmacology for Nurses: A Pathophysiologic Approach.* Referencia bibliográfica CICDE del proyecto.$B242$,76 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_76','Límites y actualización',$B243$- Las equivalencias métricas se tratan como relaciones estándar.
- lb↔kg se presenta como aproximación clínica.
- Las medidas domésticas no sustituyen dispositivos calibrados.
- UI no tiene una conversión universal a masa.
- mEq y mmol no son intercambiables universalmente.
- Los factores de goteo deben verificarse en el equipo.
- El contenido permanece en `REVIEW`.$B243$,77 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_77','Control de calidad',$B244$Este paquete conserva el tema exacto CICDE, no inventa subtemas oficiales, diferencia equivalencias exactas de aproximaciones, incorpora análisis dimensional y evita conversiones universales falsas para UI, mEq y mmol.$B244$,78 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_78','Estado para integración',$B245$**Estado:** `REVIEW`

Antes de `VERIFIED`: revisión humana, `reviewed_by`, `reviewed_at`, vinculación formal de fuentes y coherencia con PHARM-01/02/04-07.

**Cobertura CICDE PHARM-03: tema principal cubierto.**

**Situaciones originales tipo examen: 18.**$B245$,79 FROM tmap WHERE c='PHARM-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B246$El temario CICDE 2026 incluye expresamente:

> **Seguridad de medicamentos**

CICDE no enumera subtemas para PHARM-04.

La bibliografía principal del proyecto, **Somoza, Cano y Guerra, 2.ª edición**, contiene un capítulo independiente titulado **“Seguridad de los medicamentos”**, seguido por otro capítulo separado, **“Errores de medicación”**.

Por ello, este módulo se concentra en **prevención, barreras y prácticas seguras**, mientras que PHARM-05 desarrollará los errores de medicación.$B246$,1 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B247$Al finalizar el tema, el estudiante debe poder:

1. Explicar seguridad de medicamentos como responsabilidad de sistema.
2. Reconocer factores humanos y del entorno que aumentan riesgo.
3. Identificar medicamentos de alto riesgo.
4. Aplicar barreras para LASA, almacenamiento y etiquetado.
5. Explicar conciliación y seguridad en transiciones.
6. Reconocer riesgos de polifarmacia.
7. Utilizar tecnología sin sustituir juicio clínico.
8. Promover participación del paciente.
9. Diferenciar reacción adversa de error de medicación.
10. Reconocer el papel de farmacovigilancia.
11. Comprender el valor preventivo de los casi errores.
12. Aplicar seguridad al PAE.$B247$,2 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seguridad_de_medicamentos_concepto_2','Seguridad de medicamentos: concepto',$B248$La seguridad de medicamentos busca reducir el riesgo de daño prevenible durante todo el proceso de utilización de medicamentos.

No se limita al momento de administración.$B248$,3 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'proceso_de_uso_de_medicamentos_3','Proceso de uso de medicamentos',$B249$Incluye etapas como:

- prescripción;
- transcripción/comunicación;
- preparación;
- dispensación;
- administración;
- monitorización;
- conciliación;
- seguimiento.

Una falla puede originarse en cualquier etapa.$B249$,4 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfoque_de_sistema_4','Enfoque de sistema',$B250$La seguridad moderna no depende únicamente de que cada profesional “tenga cuidado”.

También requiere diseñar sistemas que:

- hagan difícil cometer errores;
- hagan visibles las discrepancias;
- incorporen redundancias apropiadas;
- detecten fallos antes de causar daño.$B250$,5 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_humanos_5','Factores humanos',$B251$El desempeño puede verse afectado por:

- fatiga;
- interrupciones;
- presión de tiempo;
- sobrecarga;
- tareas simultáneas;
- diseño confuso;
- memoria limitada.

Reconocer estos factores permite diseñar barreras.$B251$,6 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cultura_de_seguridad_6','Cultura de seguridad',$B252$Una cultura segura favorece:

- comunicación de riesgos;
- aprendizaje;
- reporte;
- respeto;
- responsabilidad;
- mejora continua.

Ocultar problemas impide aprender de ellos.$B252$,7 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_compartida_7','Responsabilidad compartida',$B253$Participan:

- prescriptores;
- enfermería;
- farmacia;
- pacientes;
- cuidadores;
- instituciones;
- sistemas de información.

La responsabilidad compartida no elimina la responsabilidad individual dentro de cada función.$B253$,8 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'oms_medicaci_n_sin_da_o_8','OMS: Medicación sin daño',$B254$La OMS mantiene la iniciativa **Medication Without Harm / Medicación sin daño** para reducir daño prevenible relacionado con medicamentos.

Su enfoque reconoce que las debilidades del sistema y los factores humanos pueden afectar prescripción, dispensación, administración y monitorización.$B254$,9 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_reas_prioritarias_de_la_oms_9','Áreas prioritarias de la OMS',$B255$La OMS destaca tres áreas clave:

1. **situaciones de alto riesgo**;
2. **polifarmacia**;
3. **transiciones de atención**.$B255$,10 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_de_alto_riesgo_10','Situaciones de alto riesgo',$B256$El riesgo aumenta cuando se combinan:

- medicamentos de alto riesgo;
- paciente vulnerable;
- entorno complejo;
- equipos/procesos inseguros;
- información incompleta.$B256$,11 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_de_alto_riesgo_11','Medicamentos de alto riesgo',$B257$Son medicamentos cuyo uso erróneo puede producir consecuencias especialmente graves.

No significa que generen errores con mayor frecuencia, sino que **el daño potencial del error es mayor**.$B257$,12 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ismp_2024_uso_como_referencia_12','ISMP 2024: uso como referencia',$B258$La lista ISMP 2024 incluye categorías como, entre otras:

- insulinas;
- anticoagulantes/antitrombóticos;
- opioides;
- agentes bloqueadores neuromusculares;
- quimioterapia;
- soluciones electrolíticas concentradas;
- algunos sedantes y medicamentos IV.

Esta lista es una **referencia internacional**, no una lista normativa panameña.$B258$,13 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'barreras_para_medicamentos_de_alto_riesgo_13','Barreras para medicamentos de alto riesgo',$B259$Pueden incluir:

- estandarización;
- acceso restringido;
- etiquetado especial;
- concentraciones estandarizadas;
- alertas;
- doble verificación cuando esté indicada;
- monitorización reforzada.$B259$,14 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'doble_verificaci_n_independiente_14','Doble verificación independiente',$B260$Una doble verificación verdadera implica que la segunda persona revise de manera independiente.

No es:

- mirar rápidamente;
- copiar el cálculo;
- firmar sin comprobar.

Tampoco debe aplicarse indiscriminadamente a todo; debe usarse donde aporte valor.$B260$,15 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estandarizaci_n_15','Estandarización',$B261$Reducir variaciones innecesarias disminuye oportunidades de confusión.

Ejemplos:

- concentraciones estandarizadas;
- protocolos;
- ordenes predefinidas bien diseñadas;
- etiquetado uniforme.$B261$,16 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concentraciones_estandarizadas_16','Concentraciones estandarizadas',$B262$Tener múltiples concentraciones innecesarias del mismo medicamento puede aumentar el riesgo.

La estandarización puede reducir errores de selección y preparación.$B262$,17 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'limitaci_n_de_acceso_17','Limitación de acceso',$B263$Algunos medicamentos de alto riesgo pueden requerir:

- almacenamiento restringido;
- acceso controlado;
- preparación centralizada;
- condiciones especiales.$B263$,18 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'almacenamiento_seguro_18','Almacenamiento seguro',$B264$Debe evitar:

- confusión;
- acceso indebido;
- mezcla de concentraciones;
- deterioro.

El almacenamiento debe respetar temperatura, luz y otras condiciones del producto.$B264$,19 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'separaci_n_f_sica_19','Separación física',$B265$Separar productos similares puede reducir errores por selección.

Es especialmente útil cuando existen:

- nombres similares;
- envases parecidos;
- concentraciones diferentes.$B265$,20 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_lasa_20','Medicamentos LASA',$B266$LASA significa **look-alike, sound-alike**:

- apariencia similar;
- nombre similar al pronunciarse.

Pueden confundirse durante selección, preparación o administración.$B266$,21 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tall_man_lettering_21','Tall Man lettering',$B267$La estrategia Tall Man utiliza mayúsculas selectivas para resaltar diferencias entre nombres similares.

Debe entenderse como una **barrera complementaria**, no suficiente por sí sola.$B267$,22 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'etiquetado_seguro_22','Etiquetado seguro',$B268$La etiqueta debe permitir identificar claramente:

- medicamento;
- concentración;
- forma;
- vía cuando corresponda;
- advertencias relevantes.$B268$,23 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rotulado_de_preparaciones_23','Rotulado de preparaciones',$B269$Toda preparación fuera de su envase original debe permanecer identificable conforme a políticas aplicables.

Una jeringa sin identificación segura **no debe utilizarse**.$B269$,24 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'abreviaturas_y_expresiones_de_riesgo_24','Abreviaturas y expresiones de riesgo',$B270$Abreviaturas ambiguas y símbolos pueden inducir errores.

La práctica segura favorece escritura clara y evita abreviaturas institucionalmente prohibidas.$B270$,25 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'decimales_seguros_25','Decimales seguros',$B271$Preferir:

- **0.5** en vez de **.5**;
- evitar **5.0** cuando significa 5.

Esto reduce errores de diez veces.$B271$,26 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'identificaci_n_del_paciente_26','Identificación del paciente',$B272$Debe utilizarse identificación activa mediante los identificadores aceptados.

No basta:

- habitación;
- apariencia;
- reconocimiento visual.$B272$,27 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alergias_y_alertas_27','Alergias y alertas',$B273$Las alertas deben:

- revisarse;
- interpretarse;
- aclararse cuando existan dudas.

No deben ignorarse automáticamente por “fatiga de alertas”.$B273$,28 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conciliaci_n_de_medicamentos_28','Conciliación de medicamentos',$B274$Consiste en comparar la medicación que el paciente realmente utiliza con la nueva lista indicada durante transiciones asistenciales.

Busca detectar discrepancias como:

- omisiones;
- duplicidades;
- dosis diferentes;
- medicamentos suspendidos que continúan apareciendo.$B274$,29 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'transiciones_de_atenci_n_29','Transiciones de atención',$B275$Momentos de alto riesgo:

- ingreso;
- traslado;
- cambio de unidad;
- alta;
- consulta posterior.

La información farmacológica puede perderse o modificarse.$B275$,30 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seguridad_al_alta_30','Seguridad al alta',$B276$El paciente debe comprender:

- qué medicamentos continúa;
- cuáles suspende;
- qué cambia;
- horarios;
- precauciones;
- seguimiento.$B276$,31 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'polifarmacia_31','Polifarmacia',$B277$Polifarmacia describe el uso de múltiples medicamentos.

No siempre es inapropiada.

El riesgo aumenta por:

- interacciones;
- duplicidades;
- complejidad;
- menor adherencia;
- eventos adversos.$B277$,32 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'revisi_n_de_la_medicaci_n_32','Revisión de la medicación',$B278$Debe valorar:

- indicación;
- eficacia;
- seguridad;
- duplicidad;
- interacciones;
- capacidad del paciente para utilizarla correctamente.$B278$,33 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'duplicidades_terap_uticas_33','Duplicidades terapéuticas',$B279$Dos medicamentos con efecto igual o muy similar pueden ser intencionales o accidentales.

Ante duda debe verificarse la indicación.$B279$,34 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interacciones_enfoque_de_seguridad_34','Interacciones: enfoque de seguridad',$B280$Una interacción puede alterar:

- concentración;
- efecto;
- toxicidad.

No todas las interacciones son clínicamente relevantes; deben valorarse según medicamento y paciente.$B280$,35 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'contraindicaciones_y_precauciones_35','Contraindicaciones y precauciones',$B281$La seguridad exige comparar la orden con:

- alergias;
- enfermedades;
- embarazo;
- función renal/hepática;
- otras medicaciones;
- laboratorio.$B281$,36 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funci_n_renal_y_hep_tica_36','Función renal y hepática',$B282$Una reducción de eliminación o metabolismo puede aumentar exposición.

La enfermera debe reconocer datos relevantes y comunicar discrepancias.$B282$,37 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_que_el_paciente_trae_de_casa_37','Medicamentos que el paciente trae de casa',$B283$No deben integrarse automáticamente al esquema hospitalario sin:

- identificación;
- conciliación;
- orden correspondiente;
- control institucional.$B283$,38 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autoadministraci_n_38','Autoadministración',$B284$Si un paciente se autoadministra medicamentos dentro de una institución, debe existir un proceso definido que garantice seguridad, documentación y responsabilidad.$B284$,39 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'educaci_n_al_paciente_39','Educación al paciente',$B285$La educación debe incluir, según el medicamento:

- nombre;
- propósito;
- forma de uso;
- efectos esperados;
- señales de alarma;
- interacciones relevantes;
- qué hacer ante una dosis omitida.$B285$,40 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'participaci_n_del_paciente_40','Participación del paciente',$B286$El paciente puede detectar:

- cambio de color;
- dosis distinta;
- medicamento nuevo;
- omisión de un medicamento habitual.

Escuchar sus preguntas es una barrera de seguridad.$B286$,41 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cinco_momentos_para_la_seguridad_de_medicamentos_41','Cinco momentos para la seguridad de medicamentos',$B287$La OMS propone una herramienta para que paciente/cuidador participe activamente en momentos clave del uso de medicamentos.

Su propósito es apoyar preguntas y comprobaciones durante inicio, uso, cambios, revisión y suspensión.$B287$,42 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conoce_comprueba_pregunta_42','Conoce, comprueba, pregunta',$B288$La campaña de la OMS resume la participación segura con:

- **conoce**;
- **comprueba**;
- **pregunta**.

La seguridad es una actividad compartida.$B288$,43 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_segura_43','Comunicación segura',$B289$La información farmacológica debe ser:

- completa;
- clara;
- oportuna;
- verificable.$B289$,44 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_rdenes_verbales_riesgo_y_control_44','Órdenes verbales: riesgo y control',$B290$Las órdenes verbales pueden aumentar riesgo de:

- mala audición;
- nombres similares;
- dosis ambiguas.

Deben limitarse y manejarse conforme a política institucional.$B290$,45 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'lectura_de_retorno_45','Lectura de retorno',$B291$Cuando se utiliza comunicación verbal de alto riesgo, repetir la información puede ayudar a confirmar que fue escuchada correctamente.$B291$,46 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'traspaso_de_informaci_n_46','Traspaso de información',$B292$Durante un handoff deben transmitirse datos relevantes como:

- medicamentos críticos;
- última dosis;
- infusiones activas;
- alergias;
- cambios recientes;
- vigilancia pendiente.$B292$,47 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentaci_n_47','Documentación',$B293$Debe reflejar:

- qué ocurrió;
- cuándo;
- respuesta;
- cambios;
- omisiones;
- comunicaciones pertinentes.$B293$,48 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registro_de_administraci_n_48','Registro de administración',$B294$El registro debe corresponder a la administración real.

Nunca documentar como administrado un medicamento que no fue dado.$B294$,49 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tecnolog_a_en_seguridad_49','Tecnología en seguridad',$B295$Puede reducir riesgos, pero también crear nuevas vulnerabilidades.

Ejemplos:

- prescripción electrónica;
- código de barras;
- bombas inteligentes;
- alertas;
- gabinetes automatizados.$B295$,50 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_digo_de_barras_50','Código de barras',$B296$Ayuda a verificar coincidencia entre:

- paciente;
- medicamento;
- orden.

No sustituye la valoración clínica.$B296$,51 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'bombas_de_infusi_n_inteligentes_51','Bombas de infusión inteligentes',$B297$Pueden incorporar bibliotecas de medicamentos y límites de dosis.

La seguridad depende de:

- configuración correcta;
- concentración correcta;
- biblioteca actualizada;
- programación adecuada.$B297$,52 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alertas_cl_nicas_52','Alertas clínicas',$B298$Pueden advertir sobre:

- alergias;
- interacciones;
- dosis;
- duplicidades;
- función renal.$B298$,53 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fatiga_por_alertas_53','Fatiga por alertas',$B299$Demasiadas alertas irrelevantes pueden hacer que los profesionales las ignoren de forma automática.

El sistema debe buscar alertas relevantes y accionables.$B299$,54 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'gabinetes_automatizados_54','Gabinetes automatizados',$B300$Pueden mejorar control y trazabilidad, pero requieren:

- configuración;
- reposición correcta;
- separación adecuada;
- acceso controlado.$B300$,55 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'anulaci_n_de_barreras_tecnol_gicas_55','Anulación de barreras tecnológicas',$B301$La posibilidad de “override” puede ser necesaria en algunas situaciones, pero elimina una barrera.

Debe utilizarse solo con justificación y conforme a política.$B301$,56 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'entorno_de_preparaci_n_56','Entorno de preparación',$B302$Un entorno seguro favorece:

- iluminación;
- orden;
- espacio;
- limpieza;
- acceso a información;
- menor interrupción.$B302$,57 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interrupciones_y_distracciones_57','Interrupciones y distracciones',$B303$Pueden contribuir a:

- selección incorrecta;
- pérdida de secuencia;
- omisión de comprobaciones.

La solución no depende solo de “poner atención”; también del diseño del trabajo.$B303$,58 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fatiga_y_carga_de_trabajo_58','Fatiga y carga de trabajo',$B304$La fatiga puede afectar:

- atención;
- memoria;
- juicio;
- velocidad de respuesta.

Es un problema de seguridad del sistema además de un factor individual.$B304$,59 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dotaci_n_y_organizaci_n_segura_59','Dotación y organización segura',$B305$Carga excesiva, falta de personal o distribución inadecuada pueden aumentar vulnerabilidad del proceso de medicamentos.

Este punto se relaciona con administración de enfermería.$B305$,60 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'competencia_y_entrenamiento_60','Competencia y entrenamiento',$B306$La seguridad exige:

- conocimiento;
- entrenamiento;
- actualización;
- reconocimiento de límites.

No se debe ejecutar un procedimiento que no se domina sin apoyo adecuado.$B306$,61 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'protocolos_y_ayudas_cognitivas_61','Protocolos y ayudas cognitivas',$B307$Protocolos, tablas y guías pueden disminuir dependencia de memoria.

Deben estar:

- actualizados;
- accesibles;
- claros.$B307$,62 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'listas_de_verificaci_n_62','Listas de verificación',$B308$Una checklist puede ayudar a no omitir pasos críticos.

No sustituye comprensión ni juicio clínico.$B308$,63 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'vigilancia_posterior_63','Vigilancia posterior',$B309$La seguridad continúa después de administrar.

Debe observarse:

- efecto;
- signos vitales;
- laboratorio;
- síntomas;
- toxicidad;
- deterioro.$B309$,64 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reacci_n_adversa_a_medicamentos_64','Reacción adversa a medicamentos',$B310$Es una respuesta nociva relacionada con un medicamento utilizado en condiciones apropiadas.

Puede ocurrir **sin que exista un error**.$B310$,65 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'evento_adverso_relacionado_con_medicamentos_65','Evento adverso relacionado con medicamentos',$B311$Es daño asociado al uso de medicamentos.

Puede ser:

- prevenible;
- no prevenible;

según su causa y contexto.$B311$,66 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_de_medicaci_n_versus_reacci_n_adversa_66','Error de medicación versus reacción adversa',$B312$**Error de medicación:** falla prevenible en el proceso de uso.

**Reacción adversa:** efecto nocivo que puede ocurrir aun con uso adecuado.

No son sinónimos.

PHARM-05 desarrollará los errores en profundidad.$B312$,67 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'farmacovigilancia_concepto_67','Farmacovigilancia: concepto',$B313$La farmacovigilancia busca detectar, evaluar, comprender y prevenir problemas relacionados con medicamentos, especialmente reacciones adversas.$B313$,68 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'notificaci_n_de_sospechas_de_reacciones_adversas_68','Notificación de sospechas de reacciones adversas',$B314$La sospecha de una reacción relevante debe comunicarse y documentarse conforme al sistema de farmacovigilancia aplicable.

No es necesario tener certeza absoluta para reconocer que una sospecha merece evaluación.$B314$,69 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'casi_error_valor_preventivo_69','Casi error: valor preventivo',$B315$Un casi error es una situación peligrosa detectada antes de causar daño.

Tiene valor porque revela vulnerabilidades antes de que afecten a un paciente.$B315$,70 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reporte_y_aprendizaje_70','Reporte y aprendizaje',$B316$Reportar permite identificar patrones y mejorar procesos.

El objetivo no debe limitarse a identificar quién cometió el último fallo.$B316$,71 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cultura_justa_71','Cultura justa',$B317$Una cultura justa diferencia entre:

- error humano;
- conductas de riesgo;
- conductas temerarias.

Promueve aprendizaje sin eliminar responsabilidad profesional.$B317$,72 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'an_lisis_de_vulnerabilidades_del_sistema_72','Análisis de vulnerabilidades del sistema',$B318$Preguntas útiles:

- ¿qué barrera falló?;
- ¿qué información faltaba?;
- ¿qué diseño favoreció confusión?;
- ¿qué cambio reduciría recurrencia?

El análisis formal de errores se profundiza en PHARM-05.$B318$,73 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'auditor_a_e_indicadores_73','Auditoría e indicadores',$B319$La seguridad puede evaluarse mediante:

- cumplimiento de conciliación;
- uso de barreras;
- incidentes;
- casi errores;
- alertas relevantes;
- cumplimiento de protocolos.

Los indicadores deben interpretarse con contexto.$B319$,74 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seguridad_en_pediatr_a_74','Seguridad en pediatría',$B320$Riesgos frecuentes:

- peso;
- concentraciones;
- cálculos;
- volúmenes pequeños;
- formulaciones.

Requiere especial precisión.$B320$,75 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seguridad_en_adulto_mayor_75','Seguridad en adulto mayor',$B321$Mayor riesgo por:

- polifarmacia;
- cambios farmacocinéticos;
- deterioro renal;
- múltiples prescriptores;
- dificultades cognitivas o visuales.$B321$,76 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'embarazo_y_lactancia_76','Embarazo y lactancia',$B322$La seguridad debe evaluarse específicamente para cada medicamento.

No generalizar que un medicamento es “seguro” o “prohibido” sin fuente actualizada.$B322$,77 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'urgencias_y_cuidados_cr_ticos_77','Urgencias y cuidados críticos',$B323$El riesgo aumenta por:

- velocidad;
- múltiples infusiones;
- medicamentos de alto riesgo;
- interrupciones;
- cambios rápidos.

Las barreras no deben omitirse simplemente por la presión del entorno.$B323$,78 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_78','Integración con el PAE',$B324$**Valoración:** medicación actual, alergias, función renal/hepática, riesgos y comprensión.  
**Diagnóstico:** riesgos relacionados con farmacoterapia y seguridad.  
**Planificación:** barreras, educación, monitorización y coordinación.  
**Ejecución:** administración segura y comunicación.  
**Evaluación:** respuesta, eventos adversos, discrepancias y necesidad de mejora.$B324$,79 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_79','Errores frecuentes de examen',$B325$1. Pensar que seguridad depende solo de “tener cuidado”.
2. Tratar medicamento de alto riesgo como sinónimo de medicamento que causa errores con mayor frecuencia.
3. Presentar la lista ISMP como normativa panameña.
4. Creer que doble verificación significa solo una segunda firma.
5. Confiar únicamente en Tall Man lettering.
6. Ignorar conciliación al ingreso/alta.
7. Creer que polifarmacia siempre es inapropiada.
8. Omitir educación al paciente.
9. Ignorar alertas por costumbre.
10. Confiar ciegamente en código de barras.
11. Considerar un casi error como “nada pasó”.
12. Confundir reacción adversa con error.
13. Ocultar problemas por miedo.
14. Pensar que la cultura justa elimina responsabilidad.
15. Administrar medicamentos del paciente sin conciliación/orden.
16. Usar override sin justificación.$B325$,80 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_80','Situaciones originales tipo examen',$B326$## Caso 1 — Alto riesgo
Paciente recibe insulina y la concentración disponible es distinta de la habitual.

**Respuesta:** reconocer alto riesgo, verificar concentración, orden y barreras antes de administrar.

## Caso 2 — LASA
Dos medicamentos con nombres muy similares están almacenados juntos.

**Respuesta:** separar y aplicar estrategias de diferenciación; no depender solo de memoria.

## Caso 3 — Conciliación
Al ingreso falta un medicamento crónico que el paciente afirma tomar.

**Respuesta:** identificar la discrepancia y aclararla mediante conciliación.

## Caso 4 — Alta
Paciente recibe una lista nueva pero no sabe qué medicamentos suspender.

**Respuesta:** aclarar el esquema antes del alta y verificar comprensión.

## Caso 5 — Doble verificación
Segunda enfermera firma sin repetir el cálculo.

**Respuesta:** no constituye verificación independiente.

## Caso 6 — Código de barras
El escáner confirma el medicamento, pero el paciente presenta un parámetro clínico que contraindica administrarlo en ese momento.

**Respuesta:** detener y aplicar juicio clínico.

## Caso 7 — Fatiga de alertas
Profesional cierra todas las alertas electrónicas sin leerlas.

**Respuesta:** conducta insegura; deben revisarse y el sistema debe optimizar alertas relevantes.

## Caso 8 — Polifarmacia
Adulto mayor utiliza 12 medicamentos de varios prescriptores.

**Respuesta:** requiere revisión sistemática de indicación, duplicidades e interacciones.

## Caso 9 — Medicamento de casa
Paciente toma una tableta que trajo sin informar al equipo.

**Respuesta:** valorar, identificar el medicamento y conciliarlo; evitar administración paralela no registrada.

## Caso 10 — Jeringa sin etiqueta
Se encuentra una jeringa preparada cuyo contenido nadie puede confirmar.

**Respuesta:** no utilizarla.

## Caso 11 — Interrupción
La enfermera es interrumpida varias veces durante preparación.

**Respuesta:** recuperar la secuencia y repetir comprobaciones necesarias; reducir interrupciones evitables.

## Caso 12 — Casi error
Se detecta antes de administrar que dos viales similares fueron intercambiados.

**Respuesta:** corregir y reportar como oportunidad de aprendizaje del sistema.

## Caso 13 — Reacción adversa
Paciente presenta reacción inesperada pese a administración correcta.

**Respuesta:** valorar y tratar según situación, comunicar y considerar farmacovigilancia; no asumir automáticamente error.

## Caso 14 — Cambio de unidad
Paciente llega con una infusión activa sin documentación clara de concentración.

**Respuesta:** no continuar a ciegas; verificar concentración, orden, velocidad y traspaso.

## Caso 15 — Paciente pregunta
Paciente dice: “esa tableta no se parece a la que tomo”.

**Respuesta:** detener y verificar; la participación del paciente es una barrera de seguridad.

## Caso 16 — Override
Se anula una alerta del sistema solo para ahorrar tiempo.

**Respuesta:** impropio si no existe justificación clínica/procedimental.

## Caso 17 — Función renal
Paciente con deterioro renal recibe medicamento de eliminación renal.

**Respuesta:** revisar datos relevantes y comunicar posible necesidad de ajuste prescrito.

## Caso 18 — Ambiente
Preparación ocurre en un espacio desordenado con interrupciones constantes.

**Respuesta:** reconocer un riesgo de sistema y mejorar el entorno, no atribuir toda la seguridad a memoria individual.$B326$,81 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_81','Preguntas rápidas de repaso',$B327$**1. ¿Qué prioriza la OMS en seguridad de medicamentos?**  
Situaciones de alto riesgo, polifarmacia y transiciones de atención.

**2. ¿Qué es un medicamento de alto riesgo?**  
Uno cuyo error puede producir daño especialmente grave.

**3. ¿ISMP es normativa panameña?**  
No; se utiliza aquí como referencia internacional complementaria.

**4. ¿Qué significa LASA?**  
Look-alike, sound-alike.

**5. ¿Qué busca la conciliación?**  
Detectar discrepancias entre listas de medicamentos durante transiciones.

**6. ¿La tecnología sustituye el juicio clínico?**  
No.

**7. ¿Una reacción adversa siempre implica error?**  
No.

**8. ¿Para qué sirve un casi error?**  
Para identificar y corregir vulnerabilidades antes de que produzcan daño.$B327$,82 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_82','Fuentes y validación',$B328$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020. Capítulo 5: **Seguridad de los medicamentos**.

3. **World Health Organization.** *Medication without harm: Policy brief.* 2024.

4. **World Health Organization.** *Medication safety in high-risk situations.* 2019.

5. **World Health Organization.** *Medication safety for look-alike, sound-alike medicines.* 2023.

6. **Institute for Safe Medication Practices (ISMP).** *ISMP List of High-Alert Medications in Acute Care Settings.* 2024.$B328$,83 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_83','Límites y actualización',$B329$- La lista ISMP se usa como **referencia internacional**, no como normativa panameña.
- Las políticas concretas de doble verificación, almacenamiento, overrides y tecnología dependen de la institución.
- Los medicamentos y riesgos específicos deben verificarse con fuentes actualizadas.
- PHARM-04 se centra en **prevención y sistemas**.
- PHARM-05 desarrollará el **error de medicación** en profundidad.
- No se incluyen recomendaciones de tratamiento específicas para pacientes reales.
- El paquete permanece en `REVIEW`.$B329$,84 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_84','Control de calidad',$B330$Este paquete:

- conserva el alcance exacto CICDE;
- mantiene separado PHARM-04 de PHARM-05;
- utiliza Somoza como fuente bibliográfica principal;
- incorpora OMS e ISMP como fuentes complementarias;
- distingue lista internacional de normativa local;
- cubre alto riesgo, LASA, conciliación, polifarmacia y transiciones;
- incorpora factores humanos y tecnología;
- diferencia reacción adversa de error;
- contiene 18 situaciones originales;
- no declara revisión humana inexistente.$B330$,85 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_85','Estado para integración',$B331$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana académica;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente fuentes;
- revisar consistencia con PHARM-01 a PHARM-03 y PHARM-05 a PHARM-07.

**Cobertura CICDE PHARM-04: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B331$,86 FROM tmap WHERE c='PHARM-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B332$El temario CICDE 2026 incluye expresamente:

> **Errores de medicación**

CICDE no enumera subtemas explícitos. La bibliografía principal del proyecto, Somoza, Cano y Guerra, separa **Seguridad de los medicamentos** (cap. 5) de **Errores de medicación** (cap. 6). Por ello PHARM-05 estudia el error, su clasificación, respuesta, análisis y aprendizaje, sin duplicar el enfoque preventivo de PHARM-04.$B332$,1 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B333$Al finalizar, el estudiante debe poder definir error de medicación; diferenciarlo de reacción adversa y evento adverso; reconocer tipos de error; interpretar el índice NCC MERP A-I; identificar factores contribuyentes; priorizar la respuesta clínica; reportar y documentar de forma adecuada; participar en análisis de causas y proponer barreras de prevención.$B333$,2 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'definici_n_de_error_de_medicaci_n_2','Definición de error de medicación',$B334$NCC MERP define el error de medicación como un **evento prevenible** que puede causar o conducir a uso inapropiado del medicamento o daño al paciente mientras el medicamento está bajo control del profesional, paciente o consumidor. Puede relacionarse con práctica profesional, productos, procedimientos y sistemas.$B334$,3 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'car_cter_prevenible_3','Carácter prevenible',$B335$La palabra **prevenible** es central. Una respuesta nociva inesperada pese al uso correcto puede ser una reacción adversa sin error. En cambio, una dosis incorrecta por cálculo equivocado es un error aunque no cause daño.$B335$,4 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_a_lo_largo_del_proceso_de_uso_4','Errores a lo largo del proceso de uso',$B336$Pueden producirse en prescripción, comunicación de la orden, etiquetado, preparación, dispensación, distribución, administración, educación, monitorización y uso por el paciente.$B336$,5 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_versus_evento_adverso_5','Error versus evento adverso',$B337$Un **evento adverso relacionado con medicamentos** implica daño. Un **error** puede o no llegar al paciente y puede o no producir daño. Por tanto, no son sinónimos.$B337$,6 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_versus_reacci_n_adversa_6','Error versus reacción adversa',$B338$Una reacción adversa puede ocurrir aun cuando el medicamento se haya utilizado correctamente. Un error es una falla prevenible del proceso.$B338$,7 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_no_equivale_autom_ticamente_a_negligencia_7','Error no equivale automáticamente a negligencia',$B339$La existencia de un error no determina por sí sola negligencia. Deben analizarse conducta, circunstancias, sistema, estándar profesional y consecuencias. En examen, primero se protege al paciente y luego se analiza el evento.$B339$,8 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_de_planificaci_n_y_de_ejecuci_n_8','Error de planificación y de ejecución',$B340$Puede fallar el **plan** elegido o puede ejecutarse mal un plan correcto. Ambos pueden producir error; identificar cuál ocurrió ayuda a prevenir recurrencia.$B340$,9 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'casi_error_o_near_miss_9','Casi error o near miss',$B341$Es una situación en la que existió potencial de error o el error fue interceptado antes de causar daño. Debe estudiarse porque revela vulnerabilidades del sistema.$B341$,10 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'condiciones_latentes_10','Condiciones latentes',$B342$Son debilidades presentes en el sistema que pueden permanecer ocultas: diseño confuso, almacenamiento inadecuado, políticas ambiguas, mala interfaz o falta de recursos.$B342$,11 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fallas_activas_11','Fallas activas',$B343$Son acciones u omisiones en contacto directo con el proceso, como seleccionar un vial equivocado o programar mal una bomba. Su análisis no debe detenerse en “quién lo hizo”.$B343$,12 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_contribuyentes_12','Factores contribuyentes',$B344$Un error suele tener múltiples contribuyentes. Deben buscarse factores del profesional, sistema, paciente, medicamento, comunicación y entorno.$B344$,13 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_humanos_13','Factores humanos',$B345$Fatiga, interrupciones, carga cognitiva, presión de tiempo, sesgos y memoria limitada pueden aumentar riesgo.$B345$,14 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_del_sistema_14','Factores del sistema',$B346$Ejemplos: órdenes poco claras, concentraciones múltiples, almacenamiento confuso, alertas ineficaces, capacitación insuficiente o procesos complejos.$B346$,15 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_relacionados_con_el_paciente_15','Factores relacionados con el paciente',$B347$Pueden incluir dificultad de comunicación, múltiples enfermedades, peso incorrecto/no actualizado, alergias no registradas o información incompleta.$B347$,16 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_relacionados_con_el_medicamento_16','Factores relacionados con el medicamento',$B348$Nombres similares, envases parecidos, concentraciones distintas, formulaciones especiales y margen terapéutico estrecho pueden aumentar vulnerabilidad.$B348$,17 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factores_del_entorno_17','Factores del entorno',$B349$Ruido, interrupciones, iluminación deficiente, espacio insuficiente, sobrecarga y disponibilidad limitada de información favorecen fallas.$B349$,18 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'taxonom_a_ncc_merp_prop_sito_18','Taxonomía NCC MERP: propósito',$B350$NCC MERP ofrece una taxonomía para utilizar lenguaje estructurado al registrar y analizar errores. No está diseñada para asignar culpa, sino para categorizar información y apoyar mejora.$B350$,19 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_por_omisi_n_19','Error por omisión',$B351$Falla en administrar una dosis ordenada antes de la siguiente dosis programada, según la definición operativa del sistema. Debe diferenciarse del rechazo del paciente o de una decisión clínica consciente de no administrar.$B351$,20 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosis_incorrecta_20','Dosis incorrecta',$B352$Incluye administración de una cantidad diferente de la prescrita o apropiada según el proceso autorizado.$B352$,21 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sobredosis_21','Sobredosis',$B353$La cantidad administrada supera la dosis pretendida. La respuesta depende del fármaco, magnitud y condición del paciente.$B353$,22 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'infradosis_22','Infradosis',$B354$La cantidad administrada es menor de la pretendida. Puede producir pérdida de eficacia o tratamiento insuficiente.$B354$,23 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dosis_extra_23','Dosis extra',$B355$Se administra una dosis adicional no prevista, por ejemplo por duplicación o falla de comunicación.$B355$,24 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concentraci_n_o_potencia_incorrecta_24','Concentración o potencia incorrecta',$B356$Se administra el medicamento correcto pero con una concentración/potencia distinta de la prevista.$B356$,25 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamento_incorrecto_25','Medicamento incorrecto',$B357$El paciente recibe un fármaco diferente del ordenado. Puede relacionarse con LASA, almacenamiento o selección.$B357$,26 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'forma_farmac_utica_incorrecta_26','Forma farmacéutica incorrecta',$B358$Se usa una formulación distinta de la indicada, por ejemplo liberación inmediata en lugar de una formulación modificada.$B358$,27 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'t_cnica_incorrecta_27','Técnica incorrecta',$B359$Incluye preparación o administración incorrecta, como triturar una formulación que no debe alterarse.$B359$,28 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_a_incorrecta_28','Vía incorrecta',$B360$El medicamento se administra por una vía diferente de la indicada. Puede producir daño grave.$B360$,29 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'velocidad_incorrecta_29','Velocidad incorrecta',$B361$Una infusión puede ser errónea aunque medicamento y dosis sean correctos si la velocidad es demasiado rápida o lenta.$B361$,30 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'duraci_n_incorrecta_30','Duración incorrecta',$B362$El tratamiento se mantiene por más o menos tiempo del previsto.$B362$,31 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tiempo_incorrecto_31','Tiempo incorrecto',$B363$La administración ocurre fuera del intervalo definido por la institución o régimen. El significado clínico depende del medicamento.$B363$,32 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paciente_incorrecto_32','Paciente incorrecto',$B364$El medicamento se administra a una persona diferente de aquella para quien fue prescrito.$B364$,33 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_de_monitorizaci_n_33','Error de monitorización',$B365$Puede ocurrir cuando no se revisan parámetros necesarios, no se detecta una contraindicación o no se responde a resultados relevantes.$B365$,34 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interacciones_alergias_y_contraindicaciones_no_rec_34','Interacciones, alergias y contraindicaciones no reconocidas',$B366$La taxonomía contempla errores de monitorización asociados con interacciones medicamento-medicamento, medicamento-alimento, alergias documentadas o interacciones medicamento-enfermedad.$B366$,35 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_prescripci_n_35','Errores de prescripción',$B367$Pueden involucrar selección incorrecta del fármaco, dosis, vía, frecuencia o instrucciones incompletas. Enfermería debe aclarar órdenes dudosas antes de ejecutar.$B367$,36 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_comunicaci_n_de_rdenes_36','Errores de comunicación de órdenes',$B368$Nombres similares, abreviaturas, mala audición o información incompleta pueden distorsionar la orden.$B368$,37 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_transcripci_n_37','Errores de transcripción',$B369$Ocurren cuando información correcta se copia o registra de manera incorrecta en otro sistema o documento.$B369$,38 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_dispensaci_n_38','Errores de dispensación',$B370$Pueden involucrar producto, concentración, forma o cantidad equivocada. La verificación al recibir medicamentos es una barrera adicional.$B370$,39 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_preparaci_n_39','Errores de preparación',$B371$Ejemplos: dilución incorrecta, cálculo equivocado, mezcla incompatible, rotulado inadecuado o contaminación.$B371$,40 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_administraci_n_40','Errores de administración',$B372$Incluyen paciente, fármaco, dosis, vía, tiempo, técnica o velocidad incorrectos, entre otros.$B372$,41 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_documentaci_n_41','Errores de documentación',$B373$Registrar como administrado algo no administrado, omitir una dosis real o documentar datos incorrectos puede crear nuevos riesgos.$B373$,42 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_educaci_n_al_paciente_42','Errores de educación al paciente',$B374$Información incorrecta o insuficiente puede llevar a uso equivocado en el hogar.$B374$,43 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_seguimiento_43','Errores de seguimiento',$B375$No reevaluar respuesta, laboratorio o toxicidad cuando corresponde puede permitir daño prevenible.$B375$,44 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_en_autoadministraci_n_44','Errores en autoadministración',$B376$El paciente también puede cometer errores por instrucciones confusas, envases similares, polifarmacia o dificultades de comprensión. La educación forma parte de la prevención.$B376$,45 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_ndice_de_severidad_ncc_merp_45','Índice de severidad NCC MERP',$B377$El índice NCC MERP clasifica la gravedad según si hubo capacidad de error, si el error ocurrió, si alcanzó al paciente y el grado de daño. Agrupa categorías **A a I**.$B377$,46 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_a_46','Categoría A',$B378$Circunstancias o eventos con capacidad de causar error, pero **no ocurrió un error**.$B378$,47 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_b_47','Categoría B',$B379$Ocurrió un error, pero **no alcanzó al paciente**. En errores de omisión, el análisis del alcance requiere la definición específica del índice.$B379$,48 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_c_48','Categoría C',$B380$El error alcanzó al paciente, pero **no causó daño**.$B380$,49 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_d_49','Categoría D',$B381$El error alcanzó al paciente y requirió monitorización para confirmar ausencia de daño y/o intervención para prevenirlo.$B381$,50 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_e_50','Categoría E',$B382$El error pudo contribuir o causar **daño temporal** que requirió intervención.$B382$,51 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_f_51','Categoría F',$B383$El error pudo contribuir o causar **daño temporal** que requirió hospitalización inicial o prolongación de la hospitalización.$B383$,52 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_g_52','Categoría G',$B384$El error pudo contribuir o causar **daño permanente**.$B384$,53 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_h_53','Categoría H',$B385$El error requirió una intervención necesaria para **sostener la vida**.$B385$,54 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'categor_a_i_54','Categoría I',$B386$El error pudo contribuir o resultar en la **muerte** del paciente.$B386$,55 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_el_error_alcanz_al_paciente__55','¿El error alcanzó al paciente?',$B387$Esta pregunta separa errores interceptados de aquellos que llegaron al paciente y orienta el análisis de severidad.$B387$,56 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'evaluaci_n_del_da_o_56','Evaluación del daño',$B388$Debe basarse en hechos clínicos: síntomas, signos, intervenciones requeridas, prolongación de estancia y secuelas. No se asigna gravedad solo por “lo peligroso que parecía”.$B388$,57 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respuesta_inmediata_ante_un_error_57','Respuesta inmediata ante un error',$B389$La prioridad es clínica. Secuencia general: **proteger al paciente → valorar → intervenir → comunicar → documentar → reportar → analizar**.$B389$,58 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'primero_proteger_al_paciente_58','Primero: proteger al paciente',$B390$Ante un error conocido o sospechado, no debe iniciarse discutiendo culpabilidad. Primero se reduce el riesgo de daño y se estabiliza al paciente.$B390$,59 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valoraci_n_cl_nica_posterior_al_error_59','Valoración clínica posterior al error',$B391$Valorar estado, signos vitales, síntomas, laboratorio y parámetros pertinentes al medicamento y tipo de error.$B391$,60 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_al_equipo_60','Comunicación al equipo',$B392$Informar oportunamente a los profesionales necesarios para decidir monitorización o tratamiento.$B392$,61 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_con_prescriptor_farmacia_seg_n_el_cas_61','Comunicación con prescriptor/farmacia según el caso',$B393$Dependiendo del evento, puede requerirse coordinación inmediata con prescriptor, farmacia u otros servicios.$B393$,62 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentar_hechos_cl_nicos_62','Documentar hechos clínicos',$B394$El expediente debe describir de forma objetiva lo ocurrido clínicamente, la valoración, intervenciones y respuesta.$B394$,63 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reporte_del_incidente_63','Reporte del incidente',$B395$El sistema de reporte institucional sirve para análisis de seguridad y aprendizaje. Debe completarse conforme a política aplicable.$B395$,64 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registro_cl_nico_versus_reporte_de_incidente_64','Registro clínico versus reporte de incidente',$B396$El expediente clínico documenta la atención al paciente; el reporte de incidente documenta información para gestión de seguridad. No son documentos intercambiables.$B396$,65 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_ocultar_ni_alterar_registros_65','No ocultar ni alterar registros',$B397$Nunca borrar, falsificar o modificar retrospectivamente para esconder un error. Las correcciones deben preservar trazabilidad.$B397$,66 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_con_paciente_familia_seg_n_pol_tica_y_66','Comunicación con paciente/familia según política y marco aplicable',$B398$La comunicación después de un evento debe seguir el marco ético-legal y la política institucional, con información veraz, coordinada y centrada en el paciente.$B398$,67 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preservar_informaci_n_relevante_67','Preservar información relevante',$B399$Conservar datos de orden, producto, concentración, bomba, horarios y registros puede ser necesario para analizar lo ocurrido.$B399$,68 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'an_lisis_de_causas_68','Análisis de causas',$B400$El objetivo es explicar **cómo y por qué** ocurrió, no detenerse en identificar a la última persona involucrada.$B400$,69 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'an_lisis_de_causa_ra_z_concepto_69','Análisis de causa raíz: concepto',$B401$Es un enfoque estructurado para identificar factores contribuyentes y causas sistémicas que permitan diseñar acciones preventivas.$B401$,70 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cinco_porqu_s_como_herramienta_70','Cinco porqués como herramienta',$B402$Preguntar repetidamente “¿por qué?” puede ayudar a pasar de una causa superficial a factores más profundos. No debe usarse mecánicamente ni como única herramienta.$B402$,71 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diagrama_de_ishikawa_71','Diagrama de Ishikawa',$B403$Puede organizar factores en categorías como personas, procesos, equipos, entorno, materiales y comunicación.$B403$,72 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'causa_pr_xima_versus_causa_sist_mica_72','Causa próxima versus causa sistémica',$B404$“Se equivocó de vial” describe una causa próxima. El análisis sistémico pregunta por qué los viales podían confundirse, cómo estaban almacenados y qué barreras faltaron.$B404$,73 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acciones_correctivas_73','Acciones correctivas',$B405$Deben dirigirse a las causas identificadas y tener responsables, plazos y seguimiento.$B405$,74 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'jerarqu_a_pr_ctica_de_barreras_74','Jerarquía práctica de barreras',$B406$Las acciones que dependen menos de memoria individual suelen ser más robustas: rediseño, estandarización, restricciones, automatización bien configurada y eliminación de opciones confusas.$B406$,75 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acciones_d_biles_75','Acciones débiles',$B407$Solo recordar, enviar un correo o pedir “más cuidado” puede ser insuficiente si el sistema mantiene la misma vulnerabilidad.$B407$,76 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acciones_m_s_fuertes_76','Acciones más fuertes',$B408$Ejemplos: retirar una concentración innecesaria, separar físicamente LASA, estandarizar, restringir acceso o cambiar diseño de proceso.$B408$,77 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mite_de_reentrenar_como_nica_soluci_n_77','Límite de “reentrenar” como única solución',$B409$Capacitar puede ser necesario, pero si el proceso está mal diseñado, reentrenar sin corregir el sistema puede no prevenir recurrencia.$B409$,78 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estandarizaci_n_78','Estandarización',$B410$Reducir variaciones innecesarias facilita detectar desviaciones y disminuye oportunidades de error.$B410$,79 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tecnolog_a_y_prevenci_n_79','Tecnología y prevención',$B411$Código de barras, prescripción electrónica y bombas inteligentes pueden ayudar, pero también fallar si se configuran mal o se sortean sus barreras.$B411$,80 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'workarounds_o_atajos_80','Workarounds o atajos',$B412$Un workaround elude un proceso diseñado. Puede aparecer cuando el sistema es poco funcional, pero puede eliminar barreras de seguridad y normalizar riesgo.$B412$,81 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reporte_y_aprendizaje_81','Reporte y aprendizaje',$B413$Un sistema de reporte útil transforma eventos y casi errores en cambios concretos. Reportar sin analizar ni actuar aporta poco.$B413$,82 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cultura_justa_82','Cultura justa',$B414$Busca una respuesta proporcional al tipo de conducta, diferenciando error humano, conducta de riesgo y conducta temeraria. Promueve reporte y aprendizaje sin eliminar responsabilidad.$B414$,83 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_humano_conducta_de_riesgo_y_conducta_temerar_83','Error humano, conducta de riesgo y conducta temeraria',$B415$**Error humano:** acción no intencional. **Conducta de riesgo:** elección que subestima o no reconoce riesgo. **Conducta temeraria:** desprecio consciente y sustancial del riesgo. La respuesta organizacional no debe ser idéntica para las tres.$B415$,84 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'impacto_del_error_en_profesionales_84','Impacto del error en profesionales',$B416$Los errores pueden producir culpa, ansiedad y estrés en profesionales involucrados. El apoyo debe coexistir con la atención al paciente, el análisis y la responsabilidad apropiada.$B416$,85 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'indicadores_y_tasas_de_error_85','Indicadores y tasas de error',$B417$Contar errores sin contexto puede inducir conclusiones erróneas. Debe definirse claramente numerador, denominador, periodo y fuente de datos.$B417$,86 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'importancia_del_denominador_86','Importancia del denominador',$B418$Ejemplo: “20 errores” no informa el riesgo si no sabemos cuántas dosis o pacientes estuvieron expuestos.$B418$,87 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'subregistro_87','Subregistro',$B419$Las tasas de reporte pueden reflejar tanto frecuencia de eventos como cultura de notificación. Un aumento de reportes no significa automáticamente que la atención sea menos segura.$B419$,88 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'aprender_de_casi_errores_88','Aprender de casi errores',$B420$Los near miss son especialmente útiles porque permiten identificar fallas antes de que produzcan daño.$B420$,89 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_de_medicaci_n_en_pediatr_a_89','Errores de medicación en pediatría',$B421$Riesgo aumentado por cálculos por peso, concentraciones, volúmenes pequeños y necesidad de convertir unidades con precisión.$B421$,90 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_en_adulto_mayor_90','Errores en adulto mayor',$B422$Polifarmacia, función renal, múltiples prescriptores y dificultades cognitivas o visuales pueden aumentar vulnerabilidad.$B422$,91 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_con_medicamentos_de_alto_riesgo_91','Errores con medicamentos de alto riesgo',$B423$El mismo tipo de error puede tener consecuencias más graves si involucra insulina, anticoagulantes, opioides, electrolitos concentrados u otras categorías de alto riesgo.$B423$,92 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_en_transiciones_de_atenci_n_92','Errores en transiciones de atención',$B424$Ingreso, traslado y alta son momentos en que pueden aparecer omisiones, duplicidades o discrepancias. La conciliación es una barrera clave.$B424$,93 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_93','Integración con el PAE',$B425$**Valoración:** identificar riesgos, medicamentos y datos relevantes. **Diagnóstico:** riesgos/respuestas relacionados con medicación. **Planificación:** barreras y vigilancia. **Ejecución:** administración segura y comunicación. **Evaluación:** respuesta, detección de error, reporte y aprendizaje.$B425$,94 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_94','Errores frecuentes de examen',$B426$1. Confundir error con reacción adversa.
2. Pensar que debe existir daño para que haya error.
3. Considerar near miss irrelevante.
4. Culpar antes de proteger al paciente.
5. Alterar el registro para ocultar.
6. Confundir reporte de incidente con nota clínica.
7. Creer que categoría A significa error que llegó al paciente.
8. Confundir B con C.
9. Clasificar gravedad por potencial y no por resultado real.
10. Usar “reentrenar” como única solución.
11. Ignorar causas sistémicas.
12. Interpretar aumento de reportes como prueba automática de menor seguridad.$B426$,95 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_95','Situaciones originales tipo examen',$B427$## Caso 1 — Dosis incorrecta
Se administran 10 mg en vez de 1 mg.

**Respuesta:** error de dosis; primero valorar al paciente y activar la respuesta clínica.

## Caso 2 — Interceptado
La farmacia detecta un medicamento equivocado antes de que llegue al paciente.

**Respuesta:** error interceptado/near miss; debe analizarse aunque no haya daño.

## Caso 3 — Reacción adversa
Paciente presenta una reacción inesperada a dosis correcta, sin falla del proceso.

**Respuesta:** puede ser reacción adversa y no necesariamente error.

## Caso 4 — Omisión
Una dosis programada no se administra ni existe decisión clínica de retenerla.

**Respuesta:** error por omisión.

## Caso 5 — Vía incorrecta
Medicamento destinado a vía oral se administra por otra vía.

**Respuesta:** error de vía; evaluar inmediatamente el riesgo y al paciente.

## Caso 6 — Velocidad
Infusión correcta se administra mucho más rápido de lo indicado.

**Respuesta:** error de velocidad.

## Caso 7 — Paciente equivocado
Se escanea a un paciente pero se administra la medicación destinada al compañero de habitación.

**Respuesta:** error de paciente; la tecnología no elimina la necesidad de verificación.

## Caso 8 — Categoría B
El error ocurre pero se intercepta antes de llegar al paciente.

**Respuesta:** NCC MERP B.

## Caso 9 — Categoría C
El error llega al paciente sin producir daño.

**Respuesta:** NCC MERP C.

## Caso 10 — Categoría D
El error llega al paciente y requiere monitorización adicional para confirmar que no hubo daño.

**Respuesta:** NCC MERP D.

## Caso 11 — Categoría E
El error produce daño temporal y requiere intervención.

**Respuesta:** NCC MERP E.

## Caso 12 — Categoría F
El error produce daño temporal y prolonga la hospitalización.

**Respuesta:** NCC MERP F.

## Caso 13 — Registro alterado
Tras un error, alguien propone borrar la nota y escribirla de nuevo.

**Respuesta:** incorrecto; debe preservarse trazabilidad.

## Caso 14 — Incidente vs expediente
Se completa reporte de incidente pero no se documentan valoración e intervenciones clínicas.

**Respuesta:** incompleto; el reporte no sustituye el expediente clínico.

## Caso 15 — Causa raíz
“Enfermera se equivocó” es la única conclusión del análisis.

**Respuesta:** insuficiente; deben explorarse causas sistémicas y contribuyentes.

## Caso 16 — Reentrenamiento
Se repite un error LASA y la única medida es enviar otro correo recordatorio.

**Respuesta:** acción débil; deben evaluarse cambios de almacenamiento, etiquetado y proceso.

## Caso 17 — Subregistro
Una unidad comienza a reportar más near miss después de una campaña de seguridad.

**Respuesta:** no prueba automáticamente que haya más errores; puede reflejar mejor cultura de reporte.

## Caso 18 — Prioridad
Después de descubrir una sobredosis, el equipo empieza a discutir quién tuvo la culpa.

**Respuesta:** prioridad incorrecta; primero valorar y proteger al paciente.$B427$,96 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_96','Preguntas rápidas de repaso',$B428$**1. ¿Debe haber daño para que exista error?** No.

**2. ¿Qué es un near miss?** Error o situación de riesgo interceptada antes de causar daño.

**3. ¿Qué categoría NCC MERP representa error que no alcanzó al paciente?** B.

**4. ¿Qué categoría implica muerte?** I.

**5. ¿Qué se hace primero tras detectar un error?** Proteger y valorar al paciente.

**6. ¿El reporte de incidente sustituye la nota clínica?** No.

**7. ¿Una reacción adversa siempre es error?** No.

**8. ¿Cuál es el objetivo del análisis de causa?** Entender cómo y por qué ocurrió para prevenir recurrencia.$B428$,97 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_97','Fuentes y validación',$B429$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.
2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020. Cap. 6: **Errores de medicación**.
3. **NCC MERP.** *Medication Error Definition; Taxonomy of Medication Errors; Index for Categorizing Medication Errors.* Índice revisado en 2022.
4. **World Health Organization.** *Technical Series on Safer Primary Care: Medication errors.* 2016.$B429$,98 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_98','Límites y actualización',$B430$- El índice NCC MERP se utiliza como marco internacional complementario, no como normativa panameña.
- Los procedimientos de reporte y divulgación dependen de políticas institucionales y normativa aplicable.
- No se asigna responsabilidad legal a partir de una categoría de severidad.
- PHARM-04 conserva el enfoque preventivo; PHARM-05 analiza errores y aprendizaje.
- El contenido permanece en `REVIEW` hasta revisión humana.$B430$,99 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_99','Control de calidad',$B431$Este paquete conserva el alcance CICDE, utiliza Somoza como bibliografía principal, incorpora definición/taxonomía/índice NCC MERP, diferencia error de reacción adversa, incluye respuesta clínica y análisis sistémico, y contiene 18 situaciones originales sin declarar revisión humana inexistente.$B431$,100 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_100','Estado para integración',$B432$**Estado:** `REVIEW`

Antes de `VERIFIED`: revisión humana académica, `reviewed_by`, `reviewed_at`, vinculación formal de fuentes y coherencia con PHARM-01 a PHARM-04 y PHARM-06/07.

**Cobertura CICDE PHARM-05: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B432$,101 FROM tmap WHERE c='PHARM-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B433$El temario CICDE 2026 incluye:

> **Fluidos y balance electrolítico**

CICDE no enumera subtemas explícitos para PHARM-06.

La bibliografía principal del proyecto, **Somoza, Cano y Guerra, 2.ª edición**, contiene el capítulo 7 con el mismo título: **“Fluidos y balance electrolítico”**.$B433$,1 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B434$Al finalizar el tema, el estudiante debe poder:

1. Explicar los principales compartimentos líquidos.
2. Diferenciar osmolaridad y tonicidad.
3. Reconocer soluciones isotónicas, hipotónicas e hipertónicas como conceptos.
4. Interpretar ingresos, egresos y tendencia del peso.
5. Reconocer signos compatibles con déficit o exceso de volumen.
6. Explicar los principios de la fluidoterapia IV.
7. Reconocer las cinco R de la terapia IV.
8. Describir funciones principales de sodio, potasio, calcio, magnesio, cloro y fosfato.
9. Reconocer manifestaciones generales de alteraciones electrolíticas.
10. Relacionar función renal con balance hídrico y electrolítico.
11. Vigilar al paciente que recibe fluidos IV.
12. Aplicar estos conceptos al PAE.$B434$,2 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'agua_corporal_y_homeostasis_2','Agua corporal y homeostasis',$B435$El agua corporal participa en:

- transporte;
- perfusión;
- regulación térmica;
- reacciones metabólicas;
- equilibrio ácido-base;
- mantenimiento del volumen celular y vascular.

La homeostasis depende de un balance continuo entre ingreso, distribución y pérdida.$B435$,3 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'compartimentos_l_quidos_corporales_3','Compartimentos líquidos corporales',$B436$El agua corporal se distribuye principalmente entre:

- líquido intracelular;
- líquido extracelular.

El extracelular incluye especialmente:

- espacio intersticial;
- espacio intravascular.$B436$,4 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_quido_intracelular_4','Líquido intracelular',$B437$Es el líquido contenido dentro de las células.

Su composición electrolítica difiere del líquido extracelular.$B437$,5 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_quido_extracelular_5','Líquido extracelular',$B438$Está fuera de las células.

Incluye plasma, líquido intersticial y otros compartimentos especializados.$B438$,6 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'espacio_intersticial_6','Espacio intersticial',$B439$Rodea las células y permite intercambio entre capilares y tejidos.

La acumulación excesiva puede manifestarse como edema.$B439$,7 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'espacio_intravascular_7','Espacio intravascular',$B440$Corresponde al líquido contenido dentro de los vasos sanguíneos.

Es esencial para mantener perfusión y transporte.$B440$,8 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'movimiento_del_agua_8','Movimiento del agua',$B441$El agua se desplaza según gradientes osmóticos y presiones físicas.

Los cambios de solutos pueden provocar desplazamientos entre compartimentos.$B441$,9 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_smosis_9','Ósmosis',$B442$Es el movimiento de agua a través de una membrana semipermeable hacia el compartimento con mayor concentración efectiva de solutos osmóticamente activos.$B442$,10 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'osmolaridad_y_osmolalidad_10','Osmolaridad y osmolalidad',$B443$Ambas describen concentración de partículas osmóticamente activas.

- **Osmolaridad:** por volumen de solución.
- **Osmolalidad:** por masa de solvente.

En clínica suelen relacionarse, pero no son términos idénticos.$B443$,11 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tonicidad_11','Tonicidad',$B444$Describe el efecto de una solución sobre el volumen celular.

Depende de solutos efectivos que no atraviesan libremente la membrana celular.$B444$,12 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'soluciones_isot_nicas_concepto_12','Soluciones isotónicas: concepto',$B445$Tienen una tonicidad cercana a la del líquido extracelular y tienden a producir menor cambio inmediato del volumen celular.$B445$,13 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'soluciones_hipot_nicas_concepto_13','Soluciones hipotónicas: concepto',$B446$Tienen menor tonicidad efectiva que el plasma y favorecen movimiento de agua hacia el interior celular.

Su uso requiere indicación y vigilancia.$B446$,14 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'soluciones_hipert_nicas_concepto_14','Soluciones hipertónicas: concepto',$B447$Tienen mayor tonicidad efectiva y favorecen salida de agua de las células hacia el compartimento extracelular.

Pueden producir cambios rápidos y requieren vigilancia estricta.$B447$,15 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cristaloides_15','Cristaloides',$B448$Son soluciones acuosas con electrolitos y/o moléculas pequeñas capaces de distribuirse en el espacio extracelular.

Son base frecuente de la fluidoterapia IV.$B448$,16 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'balance_h_drico_16','Balance hídrico',$B449$Compara:

**ingresos – egresos**

No debe interpretarse como una cifra aislada; debe correlacionarse con:

- peso;
- signos clínicos;
- función renal;
- laboratorio;
- tendencia temporal.$B449$,17 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ingresos_17','Ingresos',$B450$Pueden incluir:

- líquidos orales;
- nutrición enteral;
- fluidos IV;
- medicamentos IV;
- nutrición parenteral;
- sangre y hemoderivados.$B450$,18 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'egresos_18','Egresos',$B451$Pueden incluir:

- orina;
- heces líquidas;
- vómitos;
- drenajes;
- aspiración gastrointestinal;
- pérdidas medibles adicionales.$B451$,19 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'p_rdidas_insensibles_19','Pérdidas insensibles',$B452$Ocurren principalmente a través de:

- piel;
- respiración.

No siempre se miden directamente y pueden aumentar con ciertas condiciones como fiebre o taquipnea.$B452$,20 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'balance_positivo_y_negativo_20','Balance positivo y negativo',$B453$**Positivo:** ingresos mayores que egresos.

**Negativo:** egresos mayores que ingresos.

Ninguno es automáticamente bueno o malo; debe interpretarse según objetivo y condición clínica.$B453$,21 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'peso_y_tendencia_21','Peso y tendencia',$B454$El peso seriado puede ayudar a valorar cambios del volumen corporal.

La tendencia suele ser más útil que una medición aislada.$B454$,22 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valoraci_n_cl_nica_del_estado_de_volumen_22','Valoración clínica del estado de volumen',$B455$Puede incluir:

- presión arterial;
- pulso;
- perfusión periférica;
- mucosas;
- edema;
- yugulares;
- respiración;
- peso;
- diuresis;
- balance;
- función renal.$B455$,23 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipovolemia_23','Hipovolemia',$B456$Es disminución del volumen circulante efectivo.

Puede asociarse con:

- pérdidas gastrointestinales;
- hemorragia;
- diuresis excesiva;
- baja ingesta;
- pérdidas cutáneas.

La prioridad es reconocer compromiso de perfusión y escalar.$B456$,24 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sobrecarga_de_volumen_24','Sobrecarga de volumen',$B457$Puede manifestarse mediante:

- edema;
- aumento de peso;
- congestión;
- dificultad respiratoria;
- cambios hemodinámicos.

El riesgo aumenta en determinadas enfermedades cardiacas o renales.$B457$,25 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'edema_25','Edema',$B458$Es acumulación anormal de líquido en el intersticio.

Puede relacionarse con alteraciones de:

- presión hidrostática;
- presión oncótica;
- permeabilidad;
- drenaje linfático;
- sodio y agua.$B458$,26 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redistribuci_n_y_tercer_espacio_26','Redistribución y tercer espacio',$B459$El líquido puede desplazarse a zonas donde no contribuye adecuadamente al volumen circulante efectivo.

Por eso un paciente puede presentar edema y, al mismo tiempo, perfusión intravascular inadecuada.$B459$,27 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diuresis_como_dato_cl_nico_27','Diuresis como dato clínico',$B460$La diuresis aporta información sobre:

- función renal;
- perfusión;
- respuesta a fluidos/diuréticos;
- pérdidas.

Debe interpretarse con el contexto clínico.$B460$,28 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funci_n_renal_y_balance_28','Función renal y balance',$B461$Los riñones regulan:

- agua;
- sodio;
- potasio;
- hidrogeniones;
- bicarbonato;
- otros solutos.

La alteración renal puede favorecer acumulación o déficit.$B461$,29 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fluidoterapia_intravenosa_29','Fluidoterapia intravenosa',$B462$Consiste en administrar líquidos y electrolitos por vía IV cuando las necesidades no pueden cubrirse adecuadamente por otras vías o cuando existe una indicación clínica específica.$B462$,30 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'indicaciones_generales_de_fluidoterapia_iv_30','Indicaciones generales de fluidoterapia IV',$B463$Puede utilizarse para:

- resucitación;
- mantenimiento;
- reposición de pérdidas;
- corrección de determinadas alteraciones;
- administración de medicamentos.

La prescripción debe individualizarse.$B463$,31 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cinco_r_de_terapia_iv_31','Cinco R de terapia IV',$B464$NICE organiza la terapia IV en cinco conceptos:

1. **Resuscitation** — resucitación.
2. **Routine maintenance** — mantenimiento.
3. **Replacement** — reposición.
4. **Redistribution** — redistribución.
5. **Reassessment** — reevaluación.$B464$,32 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'resucitaci_n_concepto_32','Resucitación: concepto',$B465$Busca restaurar rápidamente volumen circulante cuando existe compromiso hemodinámico.

Requiere reevaluación frecuente.$B465$,33 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mantenimiento_concepto_33','Mantenimiento: concepto',$B466$Busca cubrir necesidades fisiológicas cuando el paciente no puede obtenerlas suficientemente por vía oral/enteral.$B466$,34 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reposici_n_concepto_34','Reposición: concepto',$B467$Busca reemplazar pérdidas anormales existentes o continuas.

Ejemplos:

- vómitos;
- diarrea;
- drenajes;
- pérdidas renales.$B467$,35 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redistribuci_n_concepto_35','Redistribución: concepto',$B468$Considera situaciones en las que el líquido está presente pero distribuido de forma anormal, por ejemplo edema importante o secuestro en terceros espacios.$B468$,36 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reevaluaci_n_36','Reevaluación',$B469$Toda fluidoterapia debe revisarse según:

- respuesta clínica;
- balance;
- peso;
- electrolitos;
- función renal;
- aparición de sobrecarga o déficit.$B469$,37 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'plan_de_fluidos_37','Plan de fluidos',$B470$Debe especificar de forma clara:

- tipo de solución;
- volumen;
- velocidad;
- objetivo;
- monitorización.$B470$,38 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preferencia_por_v_as_oral_enteral_cuando_son_sufic_38','Preferencia por vías oral/enteral cuando son suficientes',$B471$Los fluidos IV no deben mantenerse innecesariamente si las necesidades pueden cubrirse de forma segura por vía oral o enteral.$B471$,39 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cloruro_de_sodio_0_9_concepto_39','Cloruro de sodio 0.9%: concepto',$B472$Es un cristalóide que contiene sodio y cloro.

Su uso depende de la indicación y del estado del paciente.

Grandes exposiciones pueden aumentar la carga de cloro, por lo que la monitorización importa.$B472$,40 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cristaloides_balanceados_concepto_40','Cristaloides balanceados: concepto',$B473$Contienen una composición electrolítica diseñada para aproximarse más al perfil del plasma que una solución compuesta solo por sodio y cloro.

La elección depende del escenario clínico.$B473$,41 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'soluciones_con_glucosa_concepto_41','Soluciones con glucosa: concepto',$B474$Aportan glucosa y agua en distintas concentraciones.

No deben elegirse basándose únicamente en el nombre; importa su composición y efecto fisiológico.$B474$,42 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'glucosa_al_5_y_tonicidad_fisiol_gica_42','Glucosa al 5% y tonicidad fisiológica',$B475$Una solución de glucosa al 5% puede ser aproximadamente isotónica en el envase, pero después de metabolizarse la glucosa, el agua restante se comporta fisiológicamente como agua libre.

Por eso “isotónica en la bolsa” no siempre equivale al efecto final sobre compartimentos.$B475$,43 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'coloides_concepto_general_43','Coloides: concepto general',$B476$Contienen moléculas de mayor tamaño que buscan modificar la distribución intravascular del líquido.

Su selección depende de indicación clínica específica y no se asume superioridad universal sobre cristaloides.$B476$,44 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'electrolitos_concepto_44','Electrolitos: concepto',$B477$Son sustancias que en solución forman partículas con carga eléctrica.

Participan en:

- excitabilidad;
- contracción;
- balance hídrico;
- función neuromuscular;
- equilibrio ácido-base.$B477$,45 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sodio_45','Sodio',$B478$Es un catión predominante del líquido extracelular y participa de forma importante en volumen extracelular y osmolaridad.$B478$,46 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funciones_del_sodio_46','Funciones del sodio',$B479$Contribuye a:

- balance de agua;
- volumen extracelular;
- función nerviosa;
- función muscular.$B479$,47 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hiponatremia_reconocimiento_47','Hiponatremia: reconocimiento',$B480$Es una concentración sérica de sodio por debajo del rango de referencia del laboratorio.

Puede acompañarse de síntomas neurológicos, especialmente cuando es intensa o cambia rápidamente.

La causa y velocidad de desarrollo importan.$B480$,48 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipernatremia_reconocimiento_48','Hipernatremia: reconocimiento',$B481$Es una concentración sérica de sodio por encima del rango de referencia.

Suele reflejar una alteración relativa entre sodio y agua.

Puede asociarse con alteraciones neurológicas y del estado de hidratación.$B481$,49 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'correcci_n_del_sodio_principio_de_seguridad_49','Corrección del sodio: principio de seguridad',$B482$Las alteraciones importantes del sodio **no deben corregirse de forma improvisada o rápida sin protocolo**.

La velocidad de corrección depende de:

- gravedad;
- duración;
- síntomas;
- causa;
- comorbilidades.$B482$,50 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'potasio_50','Potasio',$B483$Es un catión predominante intracelular esencial para:

- excitabilidad neuromuscular;
- conducción cardiaca;
- función muscular.$B483$,51 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'funciones_del_potasio_51','Funciones del potasio',$B484$Participa en:

- potencial de membrana;
- contracción muscular;
- ritmo cardiaco;
- equilibrio ácido-base.$B484$,52 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipopotasemia_reconocimiento_52','Hipopotasemia: reconocimiento',$B485$Potasio bajo puede asociarse con:

- debilidad;
- alteraciones musculares;
- cambios electrocardiográficos;
- riesgo de arritmias.

Debe buscarse la causa.$B485$,53 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hiperpotasemia_reconocimiento_53','Hiperpotasemia: reconocimiento',$B486$Potasio elevado puede causar alteraciones graves de conducción cardiaca.

Una elevación importante o con cambios clínicos/ECG requiere valoración urgente.$B486$,54 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'potasio_intravenoso_alto_riesgo_54','Potasio intravenoso: alto riesgo',$B487$El potasio concentrado es un medicamento/electrolito de alto riesgo.

Principios de seguridad:

- nunca administrar concentrado IV de forma no diluida;
- verificar concentración y velocidad;
- utilizar protocolos;
- monitorizar según situación;
- respetar políticas institucionales.$B487$,55 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'calcio_55','Calcio',$B488$Participa en:

- contracción muscular;
- conducción nerviosa;
- coagulación;
- estructura ósea;
- señalización celular.$B488$,56 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipocalcemia_reconocimiento_56','Hipocalcemia: reconocimiento',$B489$Puede asociarse con:

- parestesias;
- espasmos;
- irritabilidad neuromuscular;
- alteraciones cardiacas.$B489$,57 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipercalcemia_reconocimiento_57','Hipercalcemia: reconocimiento',$B490$Puede asociarse con:

- debilidad;
- síntomas gastrointestinales;
- alteraciones neurológicas;
- cambios cardiacos;
- poliuria.$B490$,58 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'magnesio_58','Magnesio',$B491$Participa en numerosas reacciones enzimáticas y en función neuromuscular y cardiaca.$B491$,59 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipomagnesemia_reconocimiento_59','Hipomagnesemia: reconocimiento',$B492$Puede favorecer:

- temblor;
- hiperexcitabilidad;
- arritmias;
- alteraciones concomitantes de potasio o calcio.$B492$,60 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipermagnesemia_reconocimiento_60','Hipermagnesemia: reconocimiento',$B493$Puede asociarse con:

- debilidad;
- disminución de reflejos;
- hipotensión;
- depresión respiratoria en casos graves.

El riesgo aumenta con deterioro renal y exposición elevada.$B493$,61 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cloro_61','Cloro',$B494$Es un anión predominante extracelular y participa en:

- electroneutralidad;
- balance ácido-base;
- equilibrio de fluidos.$B494$,62 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipercloremia_y_fluidoterapia_62','Hipercloremia y fluidoterapia',$B495$Una carga elevada de cloro puede acompañarse de hipercloremia y alteraciones ácido-base.

NICE recomienda reevaluar la prescripción si aparece hipercloremia o acidaemia durante fluidoterapia rica en cloro.$B495$,63 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fosfato_63','Fosfato',$B496$Participa en:

- ATP;
- función muscular;
- membranas;
- hueso;
- metabolismo celular.$B496$,64 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'hipofosfatemia_reconocimiento_64','Hipofosfatemia: reconocimiento',$B497$Puede asociarse con:

- debilidad;
- disfunción muscular;
- deterioro respiratorio;
- alteraciones neurológicas.

Es particularmente relevante en determinados contextos nutricionales y metabólicos.$B497$,65 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'bicarbonato_y_equilibrio_cido_base_65','Bicarbonato y equilibrio ácido-base',$B498$El bicarbonato es un componente importante del sistema amortiguador del organismo.

Su concentración se interpreta junto con:

- pH;
- CO₂;
- contexto clínico.$B498$,66 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equilibrio_cido_base_relaci_n_con_fluidos_66','Equilibrio ácido-base: relación con fluidos',$B499$Los cambios de:

- perfusión;
- ventilación;
- función renal;
- cloro;
- bicarbonato;

pueden modificar el equilibrio ácido-base.$B499$,67 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acidosis_y_alcalosis_visi_n_general_67','Acidosis y alcalosis: visión general',$B500$**Acidosis:** proceso que tiende a reducir el pH.

**Alcalosis:** proceso que tiende a aumentarlo.

Pueden tener origen:

- metabólico;
- respiratorio.

La interpretación completa requiere análisis clínico y de laboratorio.$B500$,68 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interrelaci_n_entre_electrolitos_68','Interrelación entre electrolitos',$B501$Las alteraciones rara vez ocurren de forma aislada.

Ejemplos:

- magnesio bajo puede dificultar corrección de potasio;
- calcio y fosfato se relacionan;
- sodio se interpreta en relación con agua.$B501$,69 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'electrolitos_y_electrocardiograma_69','Electrolitos y electrocardiograma',$B502$Potasio, calcio y magnesio pueden producir cambios electrocardiográficos.

Cuando existe alteración importante, el ECG puede ser parte de la vigilancia.$B502$,70 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'p_rdidas_gastrointestinales_70','Pérdidas gastrointestinales',$B503$Pueden causar pérdida simultánea de:

- agua;
- sodio;
- potasio;
- cloro;
- bicarbonato u otros componentes,

según el sitio y tipo de pérdida.$B503$,71 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'v_mitos_71','Vómitos',$B504$Pueden contribuir a:

- pérdida de volumen;
- alteraciones de cloro;
- alteraciones de potasio;
- cambios ácido-base.$B504$,72 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diarrea_72','Diarrea',$B505$Puede producir:

- pérdida de agua;
- sodio;
- potasio;
- bicarbonato;

y alterar el equilibrio ácido-base.$B505$,73 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'drenajes_y_p_rdidas_externas_73','Drenajes y pérdidas externas',$B506$Drenajes, fístulas, sondas y aspiraciones pueden generar pérdidas importantes.

Deben cuantificarse cuando sea posible.$B506$,74 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'quemaduras_y_p_rdidas_de_fluidos_74','Quemaduras y pérdidas de fluidos',$B507$Las quemaduras extensas pueden producir grandes cambios de:

- permeabilidad;
- distribución;
- volumen.

Su manejo requiere protocolos específicos y no se reduce a una fórmula aislada.$B507$,75 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fiebre_y_taquipnea_75','Fiebre y taquipnea',$B508$Pueden aumentar pérdidas insensibles de agua.

El impacto depende de intensidad y duración.$B508$,76 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diur_ticos_y_balance_76','Diuréticos y balance',$B509$Los diuréticos modifican excreción renal de agua y electrolitos.

La respuesta debe vigilarse mediante:

- diuresis;
- presión;
- peso;
- electrolitos;
- función renal.$B509$,77 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'insuficiencia_cardiaca_y_l_quidos_77','Insuficiencia cardiaca y líquidos',$B510$Puede aumentar el riesgo de congestión y sobrecarga.

La fluidoterapia requiere individualización y vigilancia estrecha.$B510$,78 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfermedad_renal_78','Enfermedad renal',$B511$Puede alterar capacidad para manejar:

- volumen;
- sodio;
- potasio;
- magnesio;
- ácido-base.$B511$,79 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfermedad_hep_tica_79','Enfermedad hepática',$B512$Puede acompañarse de cambios en distribución de líquidos, edema y ascitis.

La valoración no debe basarse únicamente en ingresos y egresos.$B512$,80 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'adulto_mayor_80','Adulto mayor',$B513$Puede presentar mayor vulnerabilidad por:

- menor reserva fisiológica;
- cambios renales;
- sed menos evidente;
- comorbilidades;
- medicamentos.$B513$,81 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pediatr_a_81','Pediatría',$B514$Los niños tienen diferencias fisiológicas y de requerimientos respecto de adultos.

Las prescripciones pediátricas deben basarse en protocolos apropiados y peso actualizado.$B514$,82 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'monitorizaci_n_durante_fluidoterapia_82','Monitorización durante fluidoterapia',$B515$Debe incluir según contexto:

- signos vitales;
- perfusión;
- respiración;
- edema;
- balance;
- peso;
- diuresis;
- laboratorio;
- respuesta al tratamiento.$B515$,83 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'laboratorio_relevante_83','Laboratorio relevante',$B516$Puede incluir:

- sodio;
- potasio;
- cloro;
- bicarbonato;
- urea;
- creatinina;
- glucosa;
- calcio;
- magnesio;
- fosfato;

según la situación.$B516$,84 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'urea_y_creatinina_84','Urea y creatinina',$B517$Ayudan a valorar función renal y contexto del balance hídrico, pero no deben interpretarse de forma aislada.$B517$,85 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cloruro_y_soluciones_ricas_en_cloro_85','Cloruro y soluciones ricas en cloro',$B518$Durante exposición relevante a soluciones con alta carga de cloro, debe vigilarse la tendencia del cloruro y el estado ácido-base según indicación clínica.$B518$,86 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'velocidad_y_volumen_86','Velocidad y volumen',$B519$El mismo fluido puede tener efectos diferentes según:

- volumen;
- velocidad;
- estado cardiovascular;
- función renal;
- pérdidas;
- objetivo terapéutico.$B519$,87 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registro_de_balance_87','Registro de balance',$B520$Debe registrar de manera clara y acumulativa los ingresos y egresos relevantes.

El valor está en la **tendencia y precisión**, no en llenar una tabla por rutina.$B520$,88 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_en_registro_de_balance_88','Errores frecuentes en registro de balance',$B521$1. Omitir medicación IV como ingreso.
2. No registrar vómitos/drenajes.
3. Duplicar volúmenes.
4. Registrar estimaciones como si fueran mediciones exactas.
5. No totalizar por periodo.
6. No correlacionar con peso y clínica.$B521$,89 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medicamentos_como_fuente_de_l_quidos_89','Medicamentos como fuente de líquidos',$B522$Los medicamentos IV y sus diluyentes aportan volumen y deben considerarse en pacientes con balance estricto.$B522$,90 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'nutrici_n_y_hemoderivados_como_fuentes_de_volumen_90','Nutrición y hemoderivados como fuentes de volumen',$B523$También cuentan como ingreso:

- nutrición enteral;
- nutrición parenteral;
- sangre;
- componentes sanguíneos.$B523$,91 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'signos_de_alarma_durante_fluidoterapia_91','Signos de alarma durante fluidoterapia',$B524$Requieren valoración rápida:

- dificultad respiratoria nueva;
- edema rápidamente progresivo;
- deterioro de perfusión;
- oliguria importante;
- alteración neurológica;
- arritmia;
- cambios electrolíticos significativos.$B524$,92 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'educaci_n_al_paciente_92','Educación al paciente',$B525$Explicar:

- objetivo de fluidos;
- importancia de registrar ingesta cuando corresponda;
- restricciones si existen;
- signos de exceso o déficit;
- cuándo pedir ayuda.$B525$,93 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_93','Integración con el PAE',$B526$**Valoración:** historia de pérdidas/ingresos, peso, signos vitales, edema, diuresis, laboratorio.  
**Diagnóstico:** problemas de volumen/electrolitos dentro del marco de enfermería.  
**Planificación:** metas de balance, vigilancia y seguridad.  
**Ejecución:** administrar lo prescrito, medir, registrar, educar y comunicar.  
**Evaluación:** tendencia clínica, peso, balance, laboratorio y respuesta.$B526$,94 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_94','Errores frecuentes de examen',$B527$1. Confundir osmolaridad con tonicidad.
2. Interpretar balance positivo como siempre deseable.
3. Confiar solo en la tabla de ingresos/egresos.
4. Ignorar peso.
5. Pensar que edema equivale siempre a exceso intravascular.
6. Tratar hiponatremia como simple falta de sodio.
7. Corregir sodio rápidamente sin considerar duración/causa.
8. Administrar potasio concentrado IV sin dilución.
9. Confundir mEq con mmol universalmente.
10. Ignorar función renal.
11. No contar medicamentos IV como volumen.
12. Elegir soluciones solo por el nombre.
13. Mantener fluidos IV cuando la vía oral/enteral es suficiente.
14. No reevaluar.
15. Confundir D5W en bolsa con su efecto fisiológico final.
16. Aplicar fórmulas de reposición complejas sin protocolo.$B527$,95 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_95','Situaciones originales tipo examen',$B528$## Caso 1 — Balance positivo
Paciente recibe más volumen del que elimina y desarrolla edema y disnea.

**Respuesta:** valorar posible sobrecarga, revisar balance, signos y fluidoterapia y comunicar.

## Caso 2 — Vómitos
Paciente presenta vómitos persistentes.

**Interpretación:** riesgo de pérdida de volumen y alteraciones de cloro/potasio y ácido-base.

## Caso 3 — Diarrea
Paciente presenta diarrea abundante.

**Interpretación:** puede perder agua, sodio, potasio y bicarbonato.

## Caso 4 — Edema con perfusión baja
Paciente tiene edema marcado y signos de mala perfusión.

**Respuesta:** no asumir que el edema garantiza volumen intravascular suficiente; valorar redistribución.

## Caso 5 — Potasio alto
Laboratorio reporta potasio muy elevado y el paciente presenta cambios electrocardiográficos.

**Respuesta:** reconocer riesgo de arritmia y escalar de inmediato.

## Caso 6 — Potasio IV
Se recibe una ampolla de potasio concentrado para administrar directamente IV.

**Respuesta:** no administrar de forma no diluida; es un electrolito de alto riesgo y requiere protocolo.

## Caso 7 — Sodio bajo
Paciente con sodio bajo desarrolla síntomas neurológicos.

**Respuesta:** reconocer situación potencialmente grave y escalar; la corrección requiere manejo controlado.

## Caso 8 — D5W
Estudiante afirma que la glucosa al 5% se comporta siempre como isotónica en el organismo.

**Respuesta:** incorrecto; después de metabolizar glucosa, el agua disponible modifica su efecto fisiológico.

## Caso 9 — Función renal
Paciente con insuficiencia renal recibe fluidos y desarrolla edema.

**Respuesta:** revisar volumen, diuresis, peso y función renal; existe mayor riesgo de sobrecarga.

## Caso 10 — Registro incompleto
Balance omite 600 mL de medicación IV y diluyentes.

**Respuesta:** el balance es inexacto; esos volúmenes también son ingresos.

## Caso 11 — Peso
Paciente aumenta rápidamente de peso durante fluidoterapia.

**Respuesta:** interpretar junto con balance, edema, respiración y función renal.

## Caso 12 — Solución rica en cloro
Paciente desarrolla hipercloremia durante exposición significativa a una solución rica en cloro.

**Respuesta:** reevaluar fluidoterapia y estado ácido-base según el plan clínico.

## Caso 13 — Tercer espacio
Paciente con ascitis importante tiene presión baja.

**Respuesta:** líquido corporal total y volumen circulante efectivo no son equivalentes.

## Caso 14 — Mg bajo
Paciente con hipopotasemia persistente también presenta magnesio bajo.

**Respuesta:** reconocer que las alteraciones pueden estar relacionadas y comunicar para corrección integral.

## Caso 15 — Alta diuresis
Paciente recibe diurético y aumenta mucho la diuresis.

**Respuesta:** monitorizar volumen, presión, peso, electrolitos y función renal.

## Caso 16 — IV innecesaria
Paciente tolera adecuadamente líquidos por vía oral pero continúa fluidoterapia IV sin reevaluación.

**Respuesta:** revisar necesidad; la vía IV debe mantenerse solo mientras exista indicación.

## Caso 17 — Pediatría
Se intenta aplicar directamente una prescripción de mantenimiento de adulto a un niño.

**Respuesta:** incorrecto; pediatría requiere cálculo y protocolo específicos.

## Caso 18 — Reevaluación
Paciente recibe fluidos durante horas sin repetición de signos, balance ni laboratorio.

**Respuesta:** proceso incompleto; la reevaluación es parte esencial de la fluidoterapia.$B528$,96 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_96','Preguntas rápidas de repaso',$B529$**1. Principales compartimentos:** intracelular y extracelular.  
**2. ¿Qué compara el balance?** Ingresos y egresos.  
**3. ¿Edema implica siempre volumen intravascular alto?** No.  
**4. ¿Qué electrolito es especialmente importante para conducción cardiaca?** Potasio, entre otros.  
**5. ¿Puede administrarse potasio concentrado directamente IV?** No.  
**6. ¿Qué incluyen las cinco R?** Resucitación, mantenimiento, reposición, redistribución y reevaluación.  
**7. ¿La función renal importa en fluidos/electrolitos?** Sí.  
**8. ¿La fluidoterapia termina al conectar la solución?** No; exige monitorización y reevaluación.$B529$,97 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_97','Fuentes y validación',$B530$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020. Capítulo 7: **Fluidos y balance electrolítico**.

3. **National Institute for Health and Care Excellence (NICE).** *Intravenous fluid therapy in adults in hospital (CG174).* Principios de valoración, 5 R, planificación, monitorización y reevaluación.$B530$,98 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_98','Límites y actualización',$B531$- Este paquete enseña principios y reconocimiento, no prescribe tratamiento individual.
- No se incluyen velocidades universales de corrección de sodio.
- No se incluyen concentraciones o velocidades universales de potasio IV.
- La selección de soluciones depende del contexto clínico y del protocolo institucional.
- Los rangos de laboratorio deben interpretarse con la referencia del laboratorio y el contexto.
- En pediatría, embarazo, enfermedad renal/cardiaca/hepática y cuidados críticos se requieren protocolos específicos.
- El contenido permanece en `REVIEW`.$B531$,99 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_99','Control de calidad',$B532$Este paquete:

- conserva el tema exacto CICDE;
- usa el capítulo homónimo de Somoza como fuente principal;
- cubre fluidos y electrolitos sin invadir PHARM-07;
- diferencia compartimentos, osmolaridad y tonicidad;
- incluye valoración del volumen y monitorización;
- desarrolla sodio, potasio, calcio, magnesio, cloro y fosfato;
- evita esquemas de reposición universal no verificados;
- incorpora 18 situaciones originales tipo examen;
- no declara revisión humana inexistente.$B532$,100 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_100','Estado para integración',$B533$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana académica;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente las fuentes;
- revisar coherencia con PHARM-01 a PHARM-05 y PHARM-07.

**Cobertura CICDE PHARM-06: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B533$,101 FROM tmap WHERE c='PHARM-06';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B534$El temario CICDE 2026 incluye expresamente:

> **Metrología**

CICDE no enumera subtemas específicos para PHARM-07.

En este módulo, la metrología se estudia como la ciencia y práctica de la **medición**, aplicada a la administración de medicamentos y al cuidado de enfermería.

PHARM-03 se ocupa de **conversiones y equivalencias**; PHARM-07 se ocupa de **qué significa medir bien y cómo reconocer una medición confiable**.$B534$,1 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B535$Al finalizar el tema, el estudiante debe poder:

1. Definir metrología y medición.
2. Reconocer magnitud, mensurando, unidad y valor medido.
3. Diferenciar exactitud, veracidad y precisión.
4. Reconocer errores sistemáticos y aleatorios.
5. Explicar incertidumbre de medición.
6. Diferenciar calibración, ajuste y verificación.
7. Explicar trazabilidad metrológica.
8. Relacionar resolución del instrumento con la calidad del resultado.
9. Seleccionar dispositivos apropiados para masa y volumen.
10. Reconocer riesgos de paralaje, burbujas y estimación visual.
11. Interpretar tendencias y resultados inesperados.
12. Aplicar principios metrológicos a farmacoterapia y PAE.$B535$,2 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'metrolog_a_concepto_2','Metrología: concepto',$B536$La metrología comprende los aspectos científicos y prácticos relacionados con las mediciones.

Incluye:

- unidades;
- métodos;
- instrumentos;
- patrones;
- calibración;
- incertidumbre;
- trazabilidad;
- calidad del resultado.$B536$,3 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medici_n_concepto_3','Medición: concepto',$B537$Medir implica obtener experimentalmente uno o más valores que pueden atribuirse razonablemente a una magnitud.

En enfermería se mide, por ejemplo:

- peso;
- volumen;
- temperatura;
- presión arterial;
- glucemia;
- saturación de oxígeno;
- velocidad de infusión.$B537$,4 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'magnitud_4','Magnitud',$B538$Una magnitud es una propiedad que puede expresarse cuantitativamente mediante un número y una referencia/unidad.

Ejemplos:

- masa;
- volumen;
- tiempo;
- temperatura.$B538$,5 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mensurando_5','Mensurando',$B539$El **mensurando** es la magnitud que se pretende medir.

Ejemplo:

si pesamos a un paciente para calcular una dosis por kg, el mensurando es su masa corporal bajo las condiciones definidas.$B539$,6 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valor_medido_6','Valor medido',$B540$Es el valor obtenido y atribuido al mensurando como resultado del proceso de medición.

No debe registrarse sin su unidad.$B540$,7 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'unidad_de_medida_7','Unidad de medida',$B541$Es una referencia definida utilizada para expresar cuantitativamente una magnitud.

Ejemplos:

- kg;
- g;
- mL;
- s;
- °C.$B541$,8 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sistema_internacional_de_unidades_8','Sistema Internacional de Unidades',$B542$El SI proporciona un marco común para expresar mediciones.

En farmacología ayuda a reducir ambigüedad y facilita conversiones estandarizadas.$B542$,9 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'unidades_frecuentes_en_farmacolog_a_9','Unidades frecuentes en farmacología',$B543$Entre otras:

- kg, g, mg, mcg;
- L, mL;
- h, min, s;
- °C;
- unidades específicas del producto como UI.

No todas las unidades farmacológicas son unidades SI.$B543$,10 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'metrolog_a_versus_conversi_n_10','Metrología versus conversión',$B544$**Conversión:** 1 g = 1000 mg.

**Metrología:** determinar si el instrumento y el procedimiento permiten obtener una medición apropiada y confiable.

Por eso PHARM-03 y PHARM-07 son complementarios pero no equivalentes.$B544$,11 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'instrumento_de_medici_n_11','Instrumento de medición',$B545$Dispositivo utilizado para realizar mediciones, solo o junto con otros elementos.

Ejemplos:

- balanza;
- termómetro;
- jeringa graduada;
- bomba de infusión;
- glucómetro.$B545$,12 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sistema_de_medici_n_12','Sistema de medición',$B546$Puede incluir:

- instrumento;
- accesorios;
- software;
- reactivos;
- procedimiento;
- operador;
- condiciones ambientales.

Un resultado no depende únicamente del aparato.$B546$,13 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'indicaci_n_13','Indicación',$B547$Es el valor proporcionado por un instrumento o sistema antes de cualquier interpretación adicional necesaria.

Debe leerse en la unidad apropiada.$B547$,14 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'escala_y_graduaci_n_14','Escala y graduación',$B548$La escala organiza marcas o valores que permiten interpretar la indicación.

No todas las escalas permiten la misma precisión de lectura.$B548$,15 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'intervalo_de_medici_n_15','Intervalo de medición',$B549$Es el rango de valores que un instrumento o sistema puede medir bajo condiciones definidas.

Usar un instrumento fuera de su intervalo puede producir resultados no confiables.$B549$,16 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'resoluci_n_16','Resolución',$B550$La resolución se relaciona con el menor cambio de la magnitud que produce un cambio perceptible en la indicación.

Para volúmenes pequeños se necesita un dispositivo con graduaciones apropiadas.$B550$,17 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sensibilidad_concepto_17','Sensibilidad: concepto',$B551$La sensibilidad describe cómo cambia la indicación del sistema cuando cambia la magnitud medida.

No debe confundirse automáticamente con exactitud.$B551$,18 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'exactitud_de_medici_n_18','Exactitud de medición',$B552$Según el VIM, la exactitud expresa la cercanía entre un valor medido y el valor verdadero del mensurando.

No se expresa correctamente como una cantidad numérica única de “exactitud”.$B552$,19 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'veracidad_de_medici_n_19','Veracidad de medición',$B553$La veracidad se relaciona con la cercanía entre el promedio de muchas mediciones repetidas y un valor de referencia.

Está relacionada principalmente con componentes sistemáticos del error.$B553$,20 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'precisi_n_de_medici_n_20','Precisión de medición',$B554$La precisión es la concordancia entre valores obtenidos en mediciones repetidas bajo condiciones especificadas.

Un grupo de valores muy próximos entre sí puede ser preciso aunque esté desplazado respecto de la referencia.$B554$,21 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'exactitud_versus_precisi_n_21','Exactitud versus precisión',$B555$Ejemplo conceptual:

- mediciones muy juntas pero alejadas del valor de referencia → buena precisión, mala exactitud;
- mediciones cercanas a la referencia y entre sí → buena exactitud y precisión.

No deben usarse como sinónimos.$B555$,22 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'repetibilidad_22','Repetibilidad',$B556$Describe precisión cuando las mediciones se realizan bajo condiciones muy similares:

- mismo método;
- mismo operador;
- mismo equipo;
- corto intervalo.$B556$,23 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reproducibilidad_23','Reproducibilidad',$B557$Se refiere a la concordancia cuando cambian condiciones definidas, como operador, equipo o lugar.$B557$,24 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_de_medici_n_24','Error de medición',$B558$En el VIM, error de medición es la diferencia entre un valor medido y un valor de referencia.

No debe confundirse con “error de medicación”.$B558$,25 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_sistem_tico_25','Error sistemático',$B559$Componente del error que, en mediciones repetidas, permanece constante o cambia de manera predecible.

Ejemplo:

una balanza que sistemáticamente añade masa por un problema de cero.$B559$,26 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_aleatorio_26','Error aleatorio',$B560$Componente que varía de manera impredecible entre mediciones repetidas.

Puede producir dispersión de los resultados.$B560$,27 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equivocaci_n_humana_y_error_de_medici_n_27','Equivocación humana y error de medición',$B561$Una equivocación de lectura, transcripción o selección no es exactamente el mismo concepto metrológico que el error de medición.

Ejemplo:

leer 0.6 mL y registrar 6 mL es una equivocación, no una propiedad inevitable de la medición.$B561$,28 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sesgo_de_medici_n_28','Sesgo de medición',$B562$El sesgo refleja un desplazamiento sistemático respecto de una referencia.

Puede sugerir un problema persistente del método o sistema.$B562$,29 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'incertidumbre_de_medici_n_29','Incertidumbre de medición',$B563$La incertidumbre caracteriza la dispersión de valores que podrían atribuirse razonablemente al mensurando según la información disponible.

Toda medición real tiene incertidumbre.$B563$,30 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'incertidumbre_no_equivale_a_error_30','Incertidumbre no equivale a error',$B564$**Error:** diferencia respecto de un valor de referencia.

**Incertidumbre:** cuantifica la duda/dispersión asociada al resultado.

No son sinónimos.$B564$,31 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'calibraci_n_31','Calibración',$B565$La calibración establece, bajo condiciones especificadas, la relación entre valores proporcionados por patrones y las indicaciones del instrumento, considerando sus incertidumbres.

Permite utilizar esa relación para obtener resultados de medición.$B565$,32 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ajuste_32','Ajuste',$B566$El ajuste modifica un sistema de medición para que proporcione indicaciones apropiadas.

Puede realizarse después de detectar una desviación.$B566$,33 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'calibraci_n_versus_ajuste_33','Calibración versus ajuste',$B567$Calibrar no significa necesariamente “corregir” físicamente el instrumento.

La calibración **caracteriza** su relación con referencias.

El ajuste **modifica** el instrumento o sistema.$B567$,34 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'verificaci_n_34','Verificación',$B568$La verificación aporta evidencia de que se cumplen requisitos especificados.

Puede responder:

> ¿Este equipo cumple el criterio establecido para poder utilizarse?

No es sinónimo perfecto de calibración.$B568$,35 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'trazabilidad_metrol_gica_35','Trazabilidad metrológica',$B569$Es la propiedad de un resultado mediante la cual puede relacionarse con una referencia a través de una cadena documentada e ininterrumpida de calibraciones, cada una contribuyendo a la incertidumbre.$B569$,36 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cadena_de_trazabilidad_36','Cadena de trazabilidad',$B570$Conecta el resultado con referencias reconocidas mediante una secuencia de calibraciones.

No significa simplemente que “el aparato tiene una etiqueta”.$B570$,37 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'patr_n_de_medici_n_37','Patrón de medición',$B571$Es una referencia utilizada para realizar o conservar valores de una magnitud y compararlos con otros sistemas.$B571$,38 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'material_de_referencia_38','Material de referencia',$B572$Material suficientemente homogéneo y estable respecto de propiedades especificadas, utilizado en determinados procesos de medición y control.$B572$,39 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'aptitud_para_el_prop_sito_39','Aptitud para el propósito',$B573$Un resultado trazable no es automáticamente adecuado para cualquier uso.

La incertidumbre, rango y resolución deben ser suficientemente apropiados para la decisión clínica.$B573$,40 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_de_mediciones_40','Control de calidad de mediciones',$B574$Puede incluir:

- controles conocidos;
- comprobaciones funcionales;
- revisión de tendencias;
- mantenimiento;
- calibración/verificación;
- comparación con criterios definidos.$B574$,41 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'mantenimiento_preventivo_41','Mantenimiento preventivo',$B575$Busca reducir fallos mediante acciones planificadas antes de que el equipo deje de funcionar adecuadamente.$B575$,42 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equipo_fuera_de_servicio_42','Equipo fuera de servicio',$B576$Si existe sospecha razonable de funcionamiento incorrecto:

- retirar o identificar el equipo;
- evitar uso;
- notificar;
- solicitar evaluación.

No continuar porque “todavía enciende”.$B576$,43 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentaci_n_del_equipo_43','Documentación del equipo',$B577$Puede incluir:

- identificación;
- calibraciones;
- verificaciones;
- mantenimiento;
- reparaciones;
- fecha;
- responsable;
- estado.$B577$,44 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'condiciones_ambientales_44','Condiciones ambientales',$B578$Temperatura, humedad, vibración, posición y otras condiciones pueden afectar determinadas mediciones.

Deben respetarse las instrucciones del fabricante y procedimientos.$B578$,45 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medici_n_de_temperatura_45','Medición de temperatura',$B579$La calidad depende de:

- dispositivo;
- ubicación;
- técnica;
- tiempo;
- calibración/verificación;
- condiciones de medición.$B579$,46 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'temperatura_y_cadena_de_fr_o_46','Temperatura y cadena de frío',$B580$La temperatura de almacenamiento de medicamentos debe medirse con dispositivos apropiados y registrarse según el sistema de control.

Un valor fuera del rango requiere evaluación según producto y protocolo, no una decisión improvisada.$B580$,47 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'balanzas_y_b_sculas_47','Balanzas y básculas',$B581$Deben utilizarse en superficie y condiciones adecuadas, con capacidad y resolución apropiadas.$B581$,48 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tara_y_puesta_a_cero_48','Tara y puesta a cero',$B582$Antes de medir debe confirmarse que el sistema parte de la referencia apropiada.

La tara permite descontar el peso de recipientes u otros elementos cuando el método lo requiere.$B582$,49 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'peso_corporal_para_dosificaci_n_49','Peso corporal para dosificación',$B583$Cuando una dosis depende del peso, un dato incorrecto puede traducirse directamente en una dosis incorrecta.

Debe utilizarse un peso actual y confiable cuando clínicamente corresponda.$B583$,50 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redondeo_del_peso_50','Redondeo del peso',$B584$No debe redondearse de manera prematura si la precisión del cálculo requiere conservar más información.

El redondeo final depende del contexto y dispositivo.$B584$,51 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medici_n_de_volumen_51','Medición de volumen',$B585$El volumen debe medirse con un dispositivo cuya capacidad y graduación sean apropiadas para la cantidad requerida.$B585$,52 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dispositivos_para_medir_l_quidos_52','Dispositivos para medir líquidos',$B586$Pueden incluir:

- jeringas orales;
- jeringas graduadas;
- vasos dosificadores;
- cilindros/probetas en contextos apropiados.

No son intercambiables para toda situación.$B586$,53 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'jeringa_oral_53','Jeringa oral',$B587$Es útil para medir pequeños volúmenes por vía oral/enteral.

Reduce el riesgo de conexión a sistemas parenterales cuando se utilizan diseños no compatibles.$B587$,54 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'vaso_dosificador_54','Vaso dosificador',$B588$Puede ser apropiado para ciertos volúmenes, pero su graduación suele ser menos fina que la de una jeringa.

No es la mejor opción para volúmenes pequeños que exigen alta resolución.$B588$,55 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'jeringas_graduadas_55','Jeringas graduadas',$B589$La capacidad de la jeringa debe elegirse de modo que sus graduaciones permitan medir el volumen requerido con resolución apropiada.$B589$,56 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'selecci_n_del_dispositivo_56','Selección del dispositivo',$B590$Principio práctico:

> utilizar el dispositivo más adecuado al volumen y a la precisión necesaria, no simplemente el dispositivo disponible de mayor tamaño.$B590$,57 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'capacidad_y_resoluci_n_del_dispositivo_57','Capacidad y resolución del dispositivo',$B591$Una jeringa de gran capacidad puede tener graduaciones demasiado amplias para un volumen muy pequeño.

La resolución debe ser compatible con la medición requerida.$B591$,58 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'lectura_de_la_escala_58','Lectura de la escala',$B592$Debe hacerse según las marcas y el diseño del dispositivo.

No estimar cifras que el instrumento no puede resolver de manera confiable.$B592$,59 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'menisco_cu_ndo_aplica_59','Menisco: cuándo aplica',$B593$En recipientes graduados donde existe menisco visible, la lectura debe seguir la técnica correspondiente y realizarse al nivel adecuado.

No todas las jeringas o dispositivos se leen mediante el mismo criterio de menisco.$B593$,60 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_de_paralaje_60','Error de paralaje',$B594$Ocurre cuando la escala se observa desde un ángulo incorrecto.

Para recipientes graduados, colocar la vista al nivel apropiado reduce este error.$B594$,61 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'burbujas_de_aire_61','Burbujas de aire',$B595$Una burbuja puede alterar el volumen líquido realmente medido en determinados dispositivos.

Debe eliminarse o manejarse conforme a la técnica y vía correspondiente.$B595$,62 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'espacio_muerto_concepto_62','Espacio muerto: concepto',$B596$Es el volumen interno que puede retener líquido en ciertas conexiones o dispositivos.

Su relevancia depende del equipo y del volumen administrado.$B596$,63 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'bombas_de_infusi_n_63','Bombas de infusión',$B597$Son sistemas que controlan la administración de fluidos/medicamentos.

La precisión de la bomba depende de:

- mantenimiento;
- calibración/verificación;
- equipo compatible;
- configuración;
- condiciones de uso.$B597$,64 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'programaci_n_no_equivale_a_calibraci_n_64','Programación no equivale a calibración',$B598$Ingresar correctamente 10 mL/h en una bomba no demuestra que el equipo entregue exactamente ese flujo.

La programación y el desempeño metrológico son conceptos diferentes.$B598$,65 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equipos_de_goteo_65','Equipos de goteo',$B599$La administración por gravedad depende, entre otras cosas, del factor de goteo del equipo y de condiciones físicas del sistema.$B599$,66 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'factor_de_goteo_como_caracter_stica_del_equipo_66','Factor de goteo como característica del equipo',$B600$El factor debe verificarse en el equipo/envase correspondiente.

No asumirlo únicamente por memoria.

Los cálculos se estudian en PHARM-03.$B600$,67 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dispositivos_de_medici_n_junto_al_paciente_67','Dispositivos de medición junto al paciente',$B601$Incluyen equipos que generan resultados inmediatos cerca del paciente.

Requieren:

- control de calidad;
- reactivos apropiados;
- mantenimiento;
- capacitación;
- condiciones de uso.$B601$,68 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'gluc_metro_como_ejemplo_68','Glucómetro como ejemplo',$B602$Un resultado puede afectarse por:

- muestra;
- tiras/reactivos;
- caducidad;
- contaminación;
- condiciones del paciente;
- funcionamiento del equipo.

Un valor inesperado debe correlacionarse con la clínica y confirmarse cuando corresponda.$B602$,69 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'presi_n_arterial_como_medici_n_cl_nica_69','Presión arterial como medición clínica',$B603$Depende de:

- equipo;
- tamaño de manguito;
- posición;
- técnica;
- reposo;
- movimiento.

Una cifra aislada puede estar influida por el procedimiento.$B603$,70 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pulsioximetr_a_como_medici_n_cl_nica_70','Pulsioximetría como medición clínica',$B604$Puede verse afectada por:

- perfusión deficiente;
- movimiento;
- colocación;
- interferencias;
- características del dispositivo.

El número debe interpretarse junto con el paciente.$B604$,71 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'interferencias_y_condiciones_de_uso_71','Interferencias y condiciones de uso',$B605$Todo sistema tiene condiciones en las que su desempeño puede alterarse.

La enfermera debe conocer límites e instrucciones relevantes.$B605$,72 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'controles_internos_72','Controles internos',$B606$Algunos equipos requieren materiales de control que permitan comprobar si el sistema se comporta dentro de criterios definidos.$B606$,73 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'lotes_reactivos_y_caducidad_73','Lotes, reactivos y caducidad',$B607$En equipos dependientes de reactivos:

- verificar lote;
- almacenamiento;
- caducidad;
- compatibilidad;
- condiciones del fabricante.$B607$,74 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registrar_siempre_la_unidad_74','Registrar siempre la unidad',$B608$Un valor sin unidad puede ser ambiguo.

Incorrecto:

> “peso 60”

Correcto:

> “peso 60 kg”$B608$,75 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cifras_y_resoluci_n_cl_nica_75','Cifras y resolución clínica',$B609$No deben registrarse más cifras de las que el instrumento puede justificar.

Una báscula que solo resuelve 0.1 kg no respalda un peso de 70.123 kg.$B609$,76 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redondeo_seg_n_resoluci_n_76','Redondeo según resolución',$B610$El redondeo debe respetar:

- resolución del instrumento;
- necesidad clínica;
- reglas del procedimiento.$B610$,77 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'evitar_estimaci_n_visual_inadecuada_77','Evitar estimación visual inadecuada',$B611$No debe estimarse un volumen pequeño “a ojo” si existe un dispositivo graduado apropiado.$B611$,78 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'medidas_caseras_y_seguridad_78','Medidas caseras y seguridad',$B612$Cucharas y tazas domésticas varían y no constituyen instrumentos de medición fiables para dosis precisas.

Debe preferirse un dispositivo calibrado/graduado adecuado.$B612$,79 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registro_de_la_medici_n_79','Registro de la medición',$B613$Según contexto, registrar:

- valor;
- unidad;
- fecha/hora;
- condiciones relevantes;
- sitio o método cuando sea necesario.$B613$,80 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fecha_hora_y_contexto_80','Fecha, hora y contexto',$B614$Una medición es más útil cuando puede relacionarse con:

- medicación;
- intervención;
- posición;
- ayuno/comida;
- síntomas;
- momento clínico.$B614$,81 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tendencias_versus_valor_aislado_81','Tendencias versus valor aislado',$B615$Cambios repetidos pueden ser más informativos que una sola cifra.

Ejemplo:

peso diario creciente durante fluidoterapia puede sugerir retención, especialmente si coincide con otros signos.$B615$,82 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'resultado_inesperado_82','Resultado inesperado',$B616$Ante un valor incompatible con el estado clínico:

1. revisar técnica;
2. revisar equipo;
3. repetir si es apropiado;
4. comparar con datos previos;
5. confirmar por método alterno cuando corresponda;
6. actuar de inmediato si el paciente está inestable.$B616$,83 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cu_ndo_repetir_una_medici_n_83','Cuándo repetir una medición',$B617$Puede ser apropiado si:

- hubo movimiento;
- técnica dudosa;
- lectura imposible;
- resultado inesperado;
- interferencia identificada.

No debe repetirse indefinidamente para “obtener un número que guste”.$B617$,84 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confirmaci_n_por_m_todo_alterno_84','Confirmación por método alterno',$B618$Algunos resultados de dispositivos rápidos requieren confirmación mediante método de laboratorio o equipo de referencia, según contexto y política.$B618$,85 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'impacto_de_la_medici_n_en_farmacoterapia_85','Impacto de la medición en farmacoterapia',$B619$Las mediciones pueden modificar decisiones sobre:

- dosis;
- administración;
- suspensión;
- monitorización;
- respuesta terapéutica.

Por ello, la calidad metrológica puede convertirse en un problema de seguridad farmacológica.$B619$,86 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'metrolog_a_y_medicamentos_de_alto_riesgo_86','Metrología y medicamentos de alto riesgo',$B620$Cuando una dosis depende de una medición pequeña o precisa, un error de medición puede tener consecuencias mayores.

Ejemplos:

- insulina;
- anticoagulantes;
- electrolitos concentrados;
- infusiones potentes.$B620$,87 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'metrolog_a_en_pediatr_a_87','Metrología en pediatría',$B621$La pediatría exige especial cuidado porque:

- dosis dependen del peso;
- volúmenes pueden ser pequeños;
- pequeñas desviaciones relativas pueden ser importantes.$B621$,88 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'metrolog_a_en_adulto_mayor_88','Metrología en adulto mayor',$B622$Dificultades visuales, cognitivas o motoras pueden afectar la capacidad del paciente para medir medicamentos en casa.

La educación debe adaptarse y verificar la técnica.$B622$,89 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_89','Integración con el PAE',$B623$**Valoración:** identificar qué magnitud se necesita y qué condiciones pueden afectar la medición.  
**Diagnóstico:** reconocer riesgos derivados de datos poco confiables.  
**Planificación:** seleccionar dispositivo y procedimiento adecuados.  
**Ejecución:** medir, verificar y registrar.  
**Evaluación:** analizar tendencia, coherencia y respuesta clínica.$B623$,90 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_90','Errores frecuentes de examen',$B624$1. Confundir metrología con conversión de unidades.
2. Usar exactitud y precisión como sinónimos.
3. Creer que mayor número de decimales significa mejor medición.
4. Confundir calibración con ajuste.
5. Pensar que una etiqueta de calibración garantiza cualquier resultado.
6. Registrar valores sin unidad.
7. Medir un volumen pequeño con un dispositivo de graduación muy amplia.
8. Leer una escala en ángulo.
9. Ignorar burbujas.
10. Usar cucharas domésticas para dosis precisas.
11. Suponer que programar una bomba equivale a calibrarla.
12. Ignorar condiciones ambientales.
13. Registrar más cifras que las que permite el instrumento.
14. Repetir un valor hasta obtener el esperado.
15. Ignorar un resultado inesperado sin verificar técnica/equipo.
16. Confundir error de medición con error de medicación.$B624$,91 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_91','Situaciones originales tipo examen',$B625$## Caso 1 — Precisión sin exactitud
Una balanza produce repetidamente 70.8, 70.8 y 70.9 kg, pero un patrón adecuado demuestra un sesgo importante.

**Respuesta:** existe buena precisión relativa, pero la exactitud es deficiente por componente sistemático.

## Caso 2 — Resolución
Se necesitan 0.3 mL y solo hay un dispositivo con graduaciones muy amplias.

**Respuesta:** seleccionar un dispositivo con resolución adecuada antes de medir.

## Caso 3 — Paralaje
Una enfermera lee un vaso graduado desde arriba.

**Respuesta:** la lectura puede presentar error de paralaje; debe posicionarse la vista correctamente.

## Caso 4 — Balanza sin cero
La báscula marca 0.7 kg antes de que suba el paciente.

**Respuesta:** no utilizar el valor sin resolver la condición de cero/tara.

## Caso 5 — Calibración
Un equipo tiene certificado de calibración vigente, pero se utiliza fuera de sus condiciones especificadas.

**Respuesta:** el certificado no garantiza que ese resultado particular sea apto; deben respetarse las condiciones y propósito.

## Caso 6 — Ajuste
Tras calibración se detecta desviación y el servicio técnico modifica el equipo.

**Respuesta:** esa modificación es un ajuste; no es lo mismo que calibración.

## Caso 7 — Glucómetro
Resultado de glucosa es incompatible con el estado clínico y la muestra pudo estar contaminada.

**Respuesta:** revisar técnica y repetir/confirmar según protocolo sin retrasar atención si el paciente está inestable.

## Caso 8 — Peso pediátrico
La dosis depende de kg, pero se usa un peso antiguo en libras copiado de otro ingreso.

**Respuesta:** obtener/verificar peso actual y unidad antes del cálculo.

## Caso 9 — Volumen pequeño
Se intenta medir 0.5 mL en un vaso de gran capacidad.

**Respuesta:** utilizar un dispositivo graduado más apropiado, como una jeringa adecuada a la vía.

## Caso 10 — Registro
Se documenta “temperatura 38” sin unidad.

**Respuesta:** registro incompleto; debe incluir la unidad y contexto pertinente.

## Caso 11 — Bomba
La bomba está programada en 5 mL/h, pero presenta alerta de mantenimiento vencido.

**Respuesta:** no asumir que la programación garantiza desempeño; seguir procedimiento institucional para equipo no confiable.

## Caso 12 — Trazabilidad
Se pregunta si trazabilidad significa únicamente conocer el número de serie del instrumento.

**Respuesta:** no; metrológicamente implica relacionar el resultado con una referencia mediante una cadena documentada de calibraciones.

## Caso 13 — Incertidumbre
Estudiante afirma que una medición con incertidumbre es necesariamente incorrecta.

**Respuesta:** falso; toda medición tiene incertidumbre.

## Caso 14 — Más decimales
Una báscula con resolución 0.1 kg muestra 70.2 kg y alguien registra 70.2000 kg.

**Respuesta:** los ceros adicionales no añaden información real.

## Caso 15 — Cadena de frío
El termómetro de refrigeración muestra un valor fuera del límite aceptado.

**Respuesta:** verificar el sistema y seguir el procedimiento de excursión de temperatura; no decidir por intuición que el medicamento sigue utilizable.

## Caso 16 — Medida casera
Cuidador administra jarabe con una cuchara de cocina.

**Respuesta:** enseñar el uso de un dispositivo graduado apropiado.

## Caso 17 — Resultado repetido
Profesional repite la presión varias veces y descarta todas salvo la que “parece normal”.

**Respuesta:** práctica inadecuada; debe valorar técnica, condiciones y tendencia sin seleccionar arbitrariamente el resultado.

## Caso 18 — Alto riesgo
Una infusión potente depende de un peso corporal registrado incorrectamente.

**Respuesta:** la medición incorrecta puede propagarse al cálculo y causar daño; verificar el dato antes de dosificar.$B625$,92 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_92','Preguntas rápidas de repaso',$B626$**1. ¿Qué estudia la metrología?**  
Las mediciones y sus fundamentos científicos/prácticos.

**2. ¿Precisión significa cercanía al valor verdadero?**  
No necesariamente; se refiere a concordancia entre mediciones repetidas.

**3. ¿Qué es calibración?**  
Proceso que establece la relación entre referencias conocidas e indicaciones del sistema, considerando incertidumbre.

**4. ¿Calibrar es lo mismo que ajustar?**  
No.

**5. ¿Qué es trazabilidad metrológica?**  
Relación documentada de un resultado con una referencia mediante una cadena ininterrumpida de calibraciones.

**6. ¿Toda medición tiene incertidumbre?**  
Sí.

**7. ¿Más decimales garantizan una mejor medición?**  
No.

**8. ¿Qué debe acompañar siempre al valor registrado?**  
La unidad correspondiente.$B626$,93 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_93','Fuentes y validación',$B627$1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

2. **Somoza Hernández, B.; Cano González, M. V.; Guerra López, P. E.** *Farmacología en Enfermería. Teoría y casos prácticos.* 2.ª ed. Editorial Médica Panamericana, 2020. Fuente bibliográfica principal del área según CICDE/proyecto.

3. **Joint Committee for Guides in Metrology (JCGM) / BIPM.** *International Vocabulary of Metrology — Basic and General Concepts and Associated Terms (VIM), JCGM 200:2012.*

4. **National Institute of Standards and Technology (NIST).** *NIST Policy on Metrological Traceability.*$B627$,94 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_94','Límites y actualización',$B628$- CICDE no proporciona subtemas explícitos para “Metrología”.
- La expansión conceptual utiliza el VIM como referencia metrológica internacional.
- No se atribuyen a Somoza definiciones o capítulos concretos que no fueron verificados directamente.
- PHARM-03 conserva el desarrollo de conversiones y equivalencias.
- Los procedimientos de calibración/mantenimiento dependen del fabricante, equipo e institución.
- Los dispositivos clínicos deben usarse conforme a instrucciones y programas de control aplicables.
- Este material permanece en `REVIEW` hasta revisión humana.$B628$,95 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_del_paquete_95','Control de calidad del paquete',$B629$Este paquete:

- mantiene el alcance exacto CICDE;
- no inventa subtemas oficiales;
- diferencia metrología de conversiones;
- usa terminología metrológica internacional;
- distingue exactitud, precisión y veracidad;
- distingue error e incertidumbre;
- distingue calibración, ajuste y verificación;
- desarrolla trazabilidad;
- aplica los conceptos a dispositivos y farmacoterapia;
- incluye 18 situaciones originales tipo examen;
- no declara revisión humana inexistente.$B629$,96 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_96','Estado para integración',$B630$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana académica;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente fuentes;
- revisar coherencia final con PHARM-01 a PHARM-06.

**Cobertura CICDE PHARM-07: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 18.**$B630$,97 FROM tmap WHERE c='PHARM-07';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-01' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-01' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-01' AND s.c='Pharmacology for Nurses: A Pathophysiologic Approach';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-01' AND s.c='Pharmacology for Nurses: A Pathophysiologic Approach, 7th edition';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-02' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-02' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-02' AND s.c='A Better Prescription for Preparing Nursing Students to Practice Safely';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-02' AND s.c='Nursing Interventions & Clinical Skills';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-03' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-03' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-03' AND s.c='Pharmacology for Nurses: A Pathophysiologic Approach';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-04' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-04' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-04' AND s.c='Medication without harm: Policy brief';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-04' AND s.c='ISMP List of High-Alert Medications in Acute Care Settings';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-04' AND s.c='Medication safety for look-alike, sound-alike medicines';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-05' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-05' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-05' AND s.c='Medication Error Definition and Taxonomy';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-05' AND s.c='NCC MERP Index for Categorizing Medication Errors';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-05' AND s.c='Technical Series on Safer Primary Care: Medication errors';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-06' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-06' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-06' AND s.c='Intravenous fluid therapy in adults in hospital (CG174)';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='PHARM-07' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-07' AND s.c='Farmacología en Enfermería. Teoría y casos prácticos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-07' AND s.c='International Vocabulary of Metrology – Basic and General Concepts and Associated Terms (VIM), JCGM 200:2012';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='PHARM-07' AND s.c='NIST Policy on Metrological Traceability';

COMMIT;