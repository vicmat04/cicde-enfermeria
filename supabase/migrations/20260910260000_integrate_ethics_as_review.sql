BEGIN;

INSERT INTO topics (area_id, code, title, description, sort_order) VALUES
((SELECT id FROM areas WHERE code='ETHICS_LEGAL'),'ETHICS-01','Concepto de ética y bioética','',1),
((SELECT id FROM areas WHERE code='ETHICS_LEGAL'),'ETHICS-02','Dilemas éticos','',2),
((SELECT id FROM areas WHERE code='ETHICS_LEGAL'),'ETHICS-03','Principios éticos y sus características','',3),
((SELECT id FROM areas WHERE code='ETHICS_LEGAL'),'ETHICS-04','Código Deontológico de ANEP','',4),
((SELECT id FROM areas WHERE code='ETHICS_LEGAL'),'ETHICS-05','Derechos del paciente (Ley 68 de 20 de noviembre de 2003)','',5);

INSERT INTO lessons (topic_id,title,status) VALUES
((SELECT id FROM topics WHERE code='ETHICS-01'),'Concepto de ética y bioética','REVIEW'),
((SELECT id FROM topics WHERE code='ETHICS-02'),'Dilemas éticos','REVIEW'),
((SELECT id FROM topics WHERE code='ETHICS-03'),'Principios éticos y sus características','REVIEW'),
((SELECT id FROM topics WHERE code='ETHICS-04'),'Código Deontológico de ANEP','REVIEW'),
((SELECT id FROM topics WHERE code='ETHICS-05'),'Derechos del paciente (Ley 68 de 20 de noviembre de 2003)','REVIEW');

INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Lineamientos para el Examen de Competencias de Profesionales de Enfermería','Lineamientos para el Examen de Competencias de Profesionales de Enfermería',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Lineamientos para el Examen de Competencias de Profesionales de Enfermería');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Código Deontológico para Enfermeras de Panamá','Código Deontológico para Enfermeras de Panamá',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Código Deontológico para Enfermeras de Panamá');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Código de Ética del CIE para las Enfermeras','Código de Ética del CIE para las Enfermeras',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Código de Ética del CIE para las Enfermeras');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'COMPLEMENTARY','Declaración Universal sobre Bioética y Derechos Humanos','Declaración Universal sobre Bioética y Derechos Humanos',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Declaración Universal sobre Bioética y Derechos Humanos');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'CICDE','Valores y ética en el área de la salud','Valores y ética en el área de la salud',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Valores y ética en el área de la salud');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Ley 68 de 20 de noviembre de 2003','Ley 68 de 20 de noviembre de 2003',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Ley 68 de 20 de noviembre de 2003');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Decreto Ejecutivo 1458 de 6 de noviembre de 2012','Decreto Ejecutivo 1458 de 6 de noviembre de 2012',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Decreto Ejecutivo 1458 de 6 de noviembre de 2012');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Biblioteca de la Asociación Nacional de Enfermeras de Panamá','Biblioteca de la Asociación Nacional de Enfermeras de Panamá',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Biblioteca de la Asociación Nacional de Enfermeras de Panamá');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012','Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012');
INSERT INTO sources (source_type,title,citation_text,verified) SELECT 'PANAMA_OFFICIAL','Ley 33 de 25 de abril de 2013','Ley 33 de 25 de abril de 2013',false WHERE NOT EXISTS (SELECT 1 FROM sources WHERE citation_text='Ley 33 de 25 de abril de 2013');

CREATE TEMP TABLE tmap (c TEXT PRIMARY KEY, l UUID NOT NULL) ON COMMIT DROP;
INSERT INTO tmap SELECT t.code,l.id FROM lessons l JOIN topics t ON t.id=l.topic_id WHERE t.code LIKE 'ETHICS-%';

CREATE TEMP TABLE smap (c TEXT PRIMARY KEY, s UUID NOT NULL) ON COMMIT DROP;
INSERT INTO smap SELECT DISTINCT ON (citation_text) citation_text,id FROM sources WHERE citation_text IN ('Lineamientos para el Examen de Competencias de Profesionales de Enfermería','Código Deontológico para Enfermeras de Panamá','Código de Ética del CIE para las Enfermeras','Declaración Universal sobre Bioética y Derechos Humanos','Valores y ética en el área de la salud','Ley 68 de 20 de noviembre de 2003','Decreto Ejecutivo 1458 de 6 de noviembre de 2012','Biblioteca de la Asociación Nacional de Enfermeras de Panamá','Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012','Ley 33 de 25 de abril de 2013') ORDER BY citation_text;

INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B1$El temario CICDE 2026 incluye dentro del área **Aspectos Éticos y Legales** el tema:

> **Concepto de ética y bioética**

El lineamiento no enumera subtemas explícitos para ETHICS-01. Por ello, este material **no presenta una lista pedagógica propia como si fuera una subdivisión oficial del CICDE**. La expansión se apoya principalmente en el Código Deontológico para Enfermeras de Panamá de la ANEP, el Código de Ética del CIE para las Enfermeras (revisado en 2021) y la Declaración Universal sobre Bioética y Derechos Humanos de UNESCO.

Este módulo establece las bases conceptuales. Los contenidos que el CICDE separa como temas posteriores —dilemas éticos, principios éticos, Código Deontológico de ANEP y derechos del paciente— se introducen solo en la medida necesaria para comprender ETHICS-01 y se desarrollarán con mayor profundidad en ETHICS-02 a ETHICS-05.$B1$,1 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B2$Al finalizar el tema, el estudiante debe poder:

1. Explicar qué es ética y diferenciarla de moral, bioética y deontología.
2. Reconocer la relación entre valores, principios, deberes y conducta profesional.
3. Explicar por qué el cuidado de enfermería implica responsabilidad ética además de competencia técnica.
4. Relacionar dignidad, derechos humanos, respeto, equidad y no discriminación con el cuidado.
5. Reconocer la bioética como reflexión interdisciplinaria sobre problemas de las ciencias de la vida, la salud y tecnologías asociadas.
6. Identificar la función de los códigos profesionales sin confundirlos con la totalidad de la ética.
7. Aplicar un esquema básico de razonamiento ético a situaciones de enfermería.
8. Distinguir un problema ético de un problema exclusivamente técnico o administrativo.
9. Diferenciar ética de legalidad.
10. Reconocer cuándo una situación requiere consulta, aclaración o escalamiento.
11. Integrar la reflexión ética al PAE, la administración, la docencia y la investigación.
12. Resolver situaciones tipo examen utilizando conceptos y no solo definiciones memorizadas.$B2$,2 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'por_qu_importa_la_tica_en_enfermer_a_2','Por qué importa la ética en enfermería',$B3$Enfermería toma decisiones que afectan directamente la dignidad, seguridad, privacidad, autonomía, bienestar y derechos de las personas. Por eso, hacer una técnica correctamente **no agota la responsabilidad profesional**.

La ANEP señala que el profesional de enfermería adquiere un compromiso ético con el paciente y responsabilidades de protección, búsqueda del bien, defensa de derechos, veracidad y cumplimiento de obligaciones frente al paciente, familia, comunidad y compañeros de trabajo.

La ética aparece en todos los ámbitos de enfermería: atención directa, administración, docencia, investigación, salud pública y participación profesional.$B3$,3 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concepto_de_tica_3','Concepto de ética',$B4$Para este módulo, **ética** se entiende como la reflexión razonada sobre la conducta humana y profesional: qué debería hacerse, por qué, qué valores están en juego, a quién puede afectar una decisión y qué responsabilidades se derivan de ella.

La ética no es solamente “portarse bien” ni repetir reglas. Exige deliberar cuando existen intereses, deberes, riesgos, derechos o valores que deben ser considerados.$B4$,4 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_como_reflexi_n_pr_ctica_4','Ética como reflexión práctica',$B5$La ética tiene una dimensión práctica. En enfermería sirve para orientar decisiones como:

- proteger o no una información;
- actuar frente a una práctica insegura;
- respetar una decisión del paciente;
- distribuir tiempo y recursos limitados;
- reconocer límites de competencia;
- informar un error;
- manejar conflictos entre valores profesionales y personales.

**Clave:** la pregunta ética no es solo “¿qué puedo hacer?”, sino también “¿qué debo hacer y por qué?”.$B5$,5 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concepto_de_moral_5','Concepto de moral',$B6$La **moral** se refiere al conjunto de valores, creencias, normas y pautas de conducta que una persona o comunidad considera buenas, correctas o aceptables.

Puede estar influida por familia, cultura, educación, religión, experiencia y sociedad. En una comunidad plural pueden coexistir convicciones morales distintas.$B6$,6 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_y_moral_relaci_n_y_diferencia_6','Ética y moral: relación y diferencia',$B7$No son conceptos idénticos.

- **Moral:** valores, costumbres y normas vividas por personas o grupos.
- **Ética:** reflexión crítica y razonada sobre esas normas, valores y decisiones.

Una conducta puede ser aceptada socialmente y aun así requerir evaluación ética. Del mismo modo, una convicción moral personal no autoriza a imponerla al paciente.$B7$,7 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valores_7','Valores',$B8$Los **valores** expresan aquello que se considera importante o digno de protección. En enfermería aparecen, entre otros:

- dignidad;
- respeto;
- justicia;
- integridad;
- compasión;
- confiabilidad;
- responsabilidad;
- solidaridad;
- seguridad.

El CIE 2021 presenta valores profesionales que incluyen respeto, privacidad, confidencialidad, empatía, dignidad, compasión, justicia, solidaridad, integridad, responsabilidad y rendición de cuentas.$B8$,8 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'normas_principios_y_deberes_8','Normas, principios y deberes',$B9$Estos conceptos se relacionan, pero no son equivalentes:

- **Norma:** regla que orienta o exige determinada conducta.
- **Principio:** criterio general que ayuda a orientar decisiones y justificar acciones.
- **Deber:** obligación asociada a una función, relación o responsabilidad.
- **Valor:** aquello que se considera valioso y que orienta la conducta.

En una pregunta de examen, reconocer la categoría ayuda a entender qué se está evaluando.$B9$,9 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_profesional_9','Ética profesional',$B10$La **ética profesional** aplica la reflexión ética al ejercicio de una profesión. Considera:

- responsabilidades hacia las personas atendidas;
- competencia;
- límites profesionales;
- honestidad;
- confidencialidad;
- relaciones con colegas;
- obligaciones hacia la profesión y la sociedad.

No depende únicamente de la conciencia individual: también se expresa en estándares, códigos, normas profesionales y mecanismos de rendición de cuentas.$B10$,10 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'concepto_de_bio_tica_10','Concepto de bioética',$B11$El Código Deontológico de ANEP define la **bioética** como el estudio sistemático, desde una perspectiva interdisciplinaria y transdisciplinaria, de la conducta humana en las ciencias de la vida y la salud, examinada a la luz de valores y principios morales, con respeto y promoción de la persona, los seres vivos y el ambiente.

UNESCO sitúa la bioética en los problemas éticos planteados por la medicina, las ciencias de la vida y las tecnologías asociadas, vinculándola con dignidad, derechos humanos y libertades fundamentales.$B11$,11 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_de_la_bio_tica_11','Alcance de la bioética',$B12$La bioética puede involucrar asuntos como:

- decisiones sobre atención y tratamiento;
- investigación con seres humanos;
- tecnologías de salud;
- genética;
- reproducción;
- final de vida;
- salud pública;
- distribución de recursos;
- datos de salud;
- impacto de ciencias y tecnologías sobre personas y comunidades.

No se limita al hospital ni a situaciones extraordinarias.$B12$,12 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_y_bio_tica_relaci_n_y_diferencia_12','Ética y bioética: relación y diferencia',$B13$**Ética** es el campo más amplio de reflexión sobre lo correcto, lo debido y los valores de la conducta.

**Bioética** concentra esa reflexión en problemas vinculados con vida, salud, medicina, ciencias biológicas y tecnologías asociadas.

Por tanto:

> **Toda bioética es reflexión ética, pero no todo problema ético es necesariamente bioético.**$B13$,13 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'deontolog_a_13','Deontología',$B14$La **deontología** se centra especialmente en los deberes y obligaciones de una profesión.

La propia ANEP explica que la transición del “Código de Ética” al “Código Deontológico” buscó formular de manera explícita deberes y obligaciones exigibles en el desempeño profesional y recogidos por el colectivo profesional.$B14$,14 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_y_deontolog_a_relaci_n_y_diferencia_14','Ética y deontología: relación y diferencia',$B15$La deontología **no reemplaza** a la ética.

- La ética permite reflexionar y justificar qué conducta es correcta.
- La deontología expresa deberes y obligaciones propias de la profesión.

Un código profesional ayuda a orientar la conducta, pero ninguna lista puede anticipar por sí sola todas las situaciones clínicas o sociales posibles.$B15$,15 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_digo_deontol_gico_de_anep_contexto_15','Código Deontológico de ANEP: contexto',$B16$El Código Deontológico para Enfermeras de Panamá es una referencia profesional central del proyecto.

La versión disponible en ANEP indica una última revisión y aprobación durante el período **2014–2017**. El documento contiene principios y valores, deberes en las relaciones profesionales, elementos disciplinarios y definiciones.

Para ETHICS-01 se usa principalmente como marco conceptual. Su contenido específico será objeto de **ETHICS-04 — Código Deontológico de ANEP**.$B16$,16 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'compromiso_tico_profesional_de_enfermer_a_16','Compromiso ético profesional de enfermería',$B17$El Código de ANEP declara que ser profesional de enfermería implica un **compromiso ético** con la persona atendida.

Ese compromiso incluye, entre otros ejes:

- proteger;
- buscar el bien;
- defender derechos;
- actuar con veracidad;
- reconocer obligaciones;
- brindar atención de calidad;
- respetar dignidad y derechos;
- mantener competencia y responsabilidad.

La ética, por tanto, forma parte de la identidad profesional y no es un complemento opcional.$B17$,17 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dignidad_humana_17','Dignidad humana',$B18$La **dignidad humana** implica reconocer que cada persona posee valor propio y merece trato respetuoso, independientemente de enfermedad, edad, capacidad, origen, condición económica, creencias u otras características.

En la práctica se expresa al:

- proteger privacidad;
- evitar humillación;
- explicar antes de intervenir;
- usar lenguaje respetuoso;
- reconocer preferencias;
- no reducir a la persona a un diagnóstico.$B18$,18 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derechos_humanos_y_enfermer_a_18','Derechos humanos y enfermería',$B19$ANEP y CIE vinculan la enfermería con el respeto de los derechos humanos. El CIE 2021 mantiene como marco la dignidad, la elección, el respeto y la ausencia de discriminación.

Los derechos humanos sirven como referencia ética porque limitan el ejercicio arbitrario del poder profesional y recuerdan que la persona atendida no pierde su condición de sujeto de derechos por estar enferma o depender del sistema sanitario.$B19$,19 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respeto_19','Respeto',$B20$**Respeto** significa reconocer la dignidad, valores, preferencias y condición de persona del otro.

No implica estar de acuerdo con todas sus decisiones. Implica escuchar, informar, evitar trato degradante y relacionarse sin convertir diferencias culturales, religiosas o personales en motivos de maltrato o discriminación.$B20$,20 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_cuidado_como_relaci_n_tica_20','El cuidado como relación ética',$B21$El cuidado de enfermería ocurre dentro de una relación donde existe asimetría de conocimiento, acceso a información íntima y, en ocasiones, dependencia física o emocional.

Ese poder profesional crea obligaciones éticas especiales:

- no aprovecharse de la vulnerabilidad;
- mantener límites profesionales;
- proteger información;
- actuar con competencia;
- priorizar el bienestar y los derechos de la persona.$B21$,21 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'agencia_moral_y_juicio_profesional_21','Agencia moral y juicio profesional',$B22$La enfermera no es una ejecutora automática de órdenes. Posee responsabilidad y **juicio profesional**.

Actuar éticamente exige reconocer una situación problemática, valorar riesgos, aclarar información, identificar límites de competencia y tomar medidas razonables para proteger a la persona.

Seguir una instrucción no elimina la responsabilidad de reconocer un riesgo manifiesto.$B22$,22 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_profesional_22','Responsabilidad profesional',$B23$La **responsabilidad profesional** significa responder por las acciones y omisiones propias dentro del ámbito de competencia.

Incluye:

- actuar con conocimiento y cuidado;
- reconocer límites;
- solicitar ayuda cuando es necesario;
- comunicar riesgos;
- mantener registros veraces;
- participar en la prevención de daños.$B23$,23 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rendici_n_de_cuentas_23','Rendición de cuentas',$B24$La **rendición de cuentas** implica poder explicar y justificar las decisiones y actuaciones profesionales.

No se limita a “recibir una sanción”. Incluye transparencia, trazabilidad, aprendizaje y disposición para corregir cuando una acción produce o puede producir daño.

El CIE 2021 incluye explícitamente responsabilidad y rendición de cuentas dentro de sus valores profesionales.$B24$,24 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'competencia_como_deber_tico_24','Competencia como deber ético',$B25$La competencia técnica también tiene dimensión ética.

Realizar un procedimiento sin preparación suficiente puede exponer al paciente a riesgo. Por eso, mantener conocimientos, habilidades y juicio actualizados forma parte del deber profesional.

**En examen:** reconocer que “me lo asignaron” no convierte automáticamente una tarea en segura si no existe competencia suficiente.$B25$,25 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integridad_y_veracidad_25','Integridad y veracidad',$B26$**Integridad** significa mantener coherencia entre valores profesionales, decisiones y conducta.

**Veracidad** implica no engañar deliberadamente y comunicar información de manera honesta dentro del ámbito de competencia.

Ejemplos de conducta contraria:

- falsificar registros;
- ocultar deliberadamente un error;
- documentar una intervención no realizada;
- alterar información para evitar responsabilidad.$B26$,26 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confidencialidad_introducci_n_conceptual_26','Confidencialidad: introducción conceptual',$B27$La **confidencialidad** protege información obtenida en la relación de cuidado.

ANEP establece deberes de protección de privacidad y secreto profesional. El CIE 2021 también coloca privacidad y confidencialidad entre los valores profesionales.

En ETHICS-01 interesa comprender el fundamento ético: la información de salud no se vuelve de libre acceso porque la persona esté hospitalizada. Las reglas legales específicas se estudian en los temas correspondientes.$B27$,27 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_introducci_n_conceptual_27','Autonomía: introducción conceptual',$B28$La **autonomía** reconoce a la persona como capaz de participar y decidir conforme a sus valores y convicciones, dentro de los límites aplicables.

ANEP la vincula con respeto por las personas como individuos libres y con sus decisiones, valores y convicciones.

Aquí se introduce solo el concepto. ETHICS-03 desarrollará con mayor profundidad los principios éticos.$B28$,28 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'beneficencia_introducci_n_conceptual_28','Beneficencia: introducción conceptual',$B29$La **beneficencia** orienta a promover el bien y el bienestar de la persona atendida.

No significa que el profesional pueda imponer cualquier intervención “por su bien”. Debe relacionarse con respeto, información, competencia y demás obligaciones éticas.$B29$,29 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_maleficencia_introducci_n_conceptual_29','No maleficencia: introducción conceptual',$B30$La **no maleficencia** orienta a evitar daño evitable y a no ejecutar de forma irreflexiva acciones potencialmente peligrosas.

ANEP relaciona beneficencia y no maleficencia con hacer el bien, evitar el mal y proteger a la persona de daños asociados al quehacer propio o de otros profesionales.$B30$,30 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'justicia_introducci_n_conceptual_30','Justicia: introducción conceptual',$B31$La **justicia** se relaciona con trato imparcial, equidad y distribución razonable de beneficios, cargas y recursos.

En enfermería puede aparecer al priorizar atención según necesidad clínica, evitar discriminación o defender acceso equitativo al cuidado.$B31$,31 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equidad_y_no_discriminaci_n_31','Equidad y no discriminación',$B32$ANEP y CIE rechazan la discriminación en el cuidado.

**Equidad** no significa dar exactamente lo mismo a todos. Significa reconocer necesidades relevantes y evitar que prejuicios o características personales determinen injustamente la calidad o acceso al cuidado.$B32$,32 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'vulnerabilidad_y_protecci_n_32','Vulnerabilidad y protección',$B33$Una persona puede ser especialmente vulnerable por enfermedad grave, dependencia, edad, discapacidad, pobreza, violencia, barreras de comunicación, discriminación o limitada capacidad para defender sus intereses.

La vulnerabilidad exige mayor atención a:

- protección;
- comprensión de la información;
- ausencia de coerción;
- seguridad;
- representación legítima cuando corresponda;
- acceso a apoyo.$B33$,33 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pluralismo_cultura_y_creencias_33','Pluralismo, cultura y creencias',$B34$La atención ética reconoce que las personas pueden tener valores culturales, religiosos o espirituales diferentes a los del profesional.

UNESCO vincula bioética con dignidad, derechos humanos y respeto dentro de sociedades plurales. ANEP también exige respeto de usos y costumbres siempre dentro del marco de protección de la vida y el cuidado.

**Error:** confundir respeto cultural con aceptación automática de cualquier práctica sin valorar seguridad y derechos.$B34$,34 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'persona_familia_comunidad_y_poblaci_n_34','Persona, familia, comunidad y población',$B35$La responsabilidad ética de enfermería no se limita a la relación uno a uno.

El CIE 2021 reconoce responsabilidades hacia:

- personas;
- familias;
- comunidades;
- poblaciones.

Esto permite comprender por qué también existen problemas éticos en salud pública, gestión, asignación de recursos y políticas sanitarias.$B35$,35 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'relaci_n_interprofesional_35','Relación interprofesional',$B36$La ética también orienta la relación con colegas y otros profesionales.

Incluye:

- respeto;
- comunicación segura;
- colaboración;
- reconocimiento de competencias;
- manejo profesional de desacuerdos;
- actuación cuando una conducta pone en riesgo a la persona.

La lealtad al equipo nunca debe justificar ocultar un riesgo serio para el paciente.$B36$,36 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_en_tecnolog_a_y_datos_36','Ética en tecnología y datos',$B37$El uso de registros electrónicos, mensajería, fotografías, plataformas digitales y nuevas tecnologías no elimina las obligaciones éticas.

Deben mantenerse:

- privacidad;
- confidencialidad;
- seguridad de información;
- uso profesional;
- responsabilidad sobre lo documentado y compartido.

El CIE 2021 reforzó precisamente temas como protección de datos y cambios del entorno profesional.$B37$,37 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_en_investigaci_n_37','Ética en investigación',$B38$La investigación en salud plantea preguntas bioéticas relacionadas con:

- respeto a participantes;
- consentimiento;
- riesgos y beneficios;
- privacidad;
- justicia;
- integridad científica.

El área de Investigación del CICDE desarrolla estos contenidos con mayor detalle. Aquí importa reconocer que generar conocimiento no justifica ignorar derechos o seguridad.$B38$,38 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_en_administraci_n_de_enfermer_a_38','Ética en administración de enfermería',$B39$Quien administra servicios de enfermería también enfrenta responsabilidades éticas:

- distribuir recursos;
- asignar personal;
- proteger seguridad;
- evitar favoritismos;
- manejar información;
- crear un entorno ético.

El Código ANEP establece que la enfermera en funciones administrativas debe actuar con justicia y honestidad y contribuir a crear un entorno ético de la organización.$B39$,39 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_en_docencia_de_enfermer_a_39','Ética en docencia de enfermería',$B40$La docencia de enfermería requiere:

- respeto al estudiante y paciente;
- supervisión adecuada;
- límites de competencia;
- evaluación justa;
- protección de confidencialidad;
- enseñanza de conducta profesional.

Una práctica educativa no debe utilizar al paciente como “objeto de aprendizaje” ignorando dignidad, información o seguridad.$B40$,40 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'salud_global_y_bien_p_blico_40','Salud global y bien público',$B41$El CIE 2021 incorpora **las enfermeras y la salud global** como uno de sus cuatro elementos principales.

Esto amplía la reflexión ética hacia:

- equidad sanitaria;
- determinantes sociales;
- emergencias;
- sostenibilidad;
- cooperación;
- bien público;
- responsabilidades ante poblaciones.

La ética profesional también tiene una dimensión social.$B41$,41 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'razonamiento_tico_41','Razonamiento ético',$B42$El razonamiento ético es un proceso para analizar una situación antes de actuar.

No existe una fórmula matemática que resuelva todos los casos, pero una secuencia organizada ayuda a evitar decisiones impulsivas basadas solo en costumbre, jerarquía o preferencia personal.$B42$,42 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_1_identificar_el_problema_tico_42','Paso 1: identificar el problema ético',$B43$Preguntar:

- ¿qué conducta o decisión genera preocupación?
- ¿qué derecho, deber, valor o riesgo podría estar comprometido?
- ¿es realmente un problema ético o principalmente técnico, clínico, administrativo o legal?

Definir mal el problema conduce a respuestas equivocadas.$B43$,43 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_2_separar_hechos_valores_e_incertidumbres_43','Paso 2: separar hechos, valores e incertidumbres',$B44$Distinguir:

- **hechos conocidos**;
- información todavía incierta;
- interpretaciones;
- valores en conflicto;
- emociones personales.

Ejemplo: “el paciente rechazó la intervención” es un hecho; “está tomando una mala decisión” es una valoración que requiere más análisis.$B44$,44 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_3_identificar_a_las_personas_afectadas_44','Paso 3: identificar a las personas afectadas',$B45$Reconocer quién puede verse afectado:

- paciente;
- familia;
- comunidad;
- equipo;
- otros pacientes;
- institución.

También debe identificarse quién tiene autoridad legítima para decidir y qué capacidad tiene la persona para participar.$B45$,45 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_4_reconocer_deberes_principios_y_normas_45','Paso 4: reconocer deberes, principios y normas',$B46$Revisar qué orienta la conducta:

- deberes profesionales;
- principios éticos;
- derechos;
- código profesional;
- normas institucionales;
- legislación aplicable.

Una fuente no sustituye necesariamente a las demás; pueden complementarse.$B46$,46 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_5_valorar_opciones_y_consecuencias_46','Paso 5: valorar opciones y consecuencias',$B47$Antes de actuar, considerar:

- qué opciones existen;
- qué daño puede producir cada una;
- qué beneficios son razonables;
- qué derechos se afectan;
- si hay alternativa menos restrictiva o menos dañina;
- si la decisión puede justificarse profesionalmente.$B47$,47 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_6_decidir_comunicar_y_documentar_47','Paso 6: decidir, comunicar y documentar',$B48$La decisión ética debe convertirse en conducta concreta.

Según el caso puede requerir:

- actuar;
- detener una acción insegura;
- aclarar;
- informar;
- consultar;
- escalar;
- documentar objetivamente.

La buena intención sin una acción profesional adecuada puede ser insuficiente.$B48$,48 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_7_reevaluar_48','Paso 7: reevaluar',$B49$Después de actuar:

- valorar la respuesta;
- verificar si el riesgo disminuyó;
- reconsiderar si aparecen datos nuevos;
- documentar resultados;
- aprender de la situación.

La ética clínica y profesional también requiere capacidad de revisión.$B49$,49 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_tica_y_legalidad_no_son_sin_nimos_49','Ética y legalidad no son sinónimos',$B50$Ética y derecho se relacionan, pero **no son sinónimos**.

- Una ley establece obligaciones jurídicas.
- La ética analiza qué conducta es correcta y justificable desde valores, deberes y derechos.

Cumplir una norma legal no sustituye automáticamente todo razonamiento ético. Y una preferencia ética personal no autoriza a desobedecer una obligación legal válida.

Ante conflicto real entre deberes, normativa o derechos, se debe consultar por los canales apropiados.$B50$,50 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'problema_tico_no_siempre_significa_dilema_tico_50','Problema ético no siempre significa dilema ético',$B51$No todo problema ético es un **dilema ético**.

Puede haber:

- una conducta claramente contraria a un deber;
- incertidumbre sobre hechos;
- conflicto entre personas;
- falta de recursos;
- una orden insegura;
- o un verdadero conflicto entre obligaciones/valores relevantes.

ETHICS-02 profundizará específicamente en dilemas éticos.$B51$,51 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'consulta_y_escalamiento_51','Consulta y escalamiento',$B52$Cuando la situación excede la competencia o existe un conflicto importante, la respuesta profesional puede incluir:

- consultar a la jefatura;
- solicitar apoyo de otro profesional;
- utilizar comités o mecanismos institucionales disponibles;
- buscar asesoría ética o legal cuando corresponda.

Escalar no significa abandonar responsabilidad; significa utilizar recursos adecuados para resolver de forma segura.$B52$,52 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_proceso_de_atenci_n_de_enfermer_52','Integración con el Proceso de Atención de Enfermería',$B53$La ética atraviesa todo el PAE:

**Valoración:** privacidad, respeto, obtención de datos sin prejuicio.  
**Diagnóstico:** juicio basado en datos, evitando etiquetas discriminatorias.  
**Planificación:** participación de la persona y prioridades justificables.  
**Ejecución:** competencia, seguridad, consentimiento/participación cuando corresponda.  
**Evaluación:** honestidad sobre resultados, reevaluación y documentación veraz.

El PAE no es éticamente neutro: la forma de realizarlo también importa.$B53$,53 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'enfoque_de_examen_cicde_53','Enfoque de examen CICDE',$B54$En preguntas CICDE sobre conceptos éticos:

1. identificar qué concepto está realmente en juego;
2. separar la preferencia personal de la obligación profesional;
3. proteger seguridad y dignidad;
4. reconocer derechos y deberes;
5. evitar discriminación;
6. usar juicio profesional y canales apropiados;
7. no inventar excepciones legales que el caso no menciona.

Cuando dos opciones parecen correctas, suele ser mejor la que combina **seguridad, respeto, responsabilidad y actuación profesional justificable**.$B54$,54 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'diferencias_que_deben_memorizarse_54','Diferencias que deben memorizarse',$B55$| Concepto | Idea central |
|---|---|
| Ética | Reflexión razonada sobre lo correcto, lo debido y los valores |
| Moral | Valores, normas y creencias vividas por personas o grupos |
| Bioética | Reflexión ética sobre vida, salud, ciencias y tecnologías asociadas |
| Deontología | Deberes y obligaciones profesionales |
| Valor | Aquello que se considera importante o digno de protección |
| Principio | Criterio general que orienta decisiones |
| Norma | Regla que prescribe u orienta conducta |
| Responsabilidad | Responder por actos y omisiones |
| Rendición de cuentas | Poder explicar y justificar decisiones y actuaciones |$B55$,55 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_55','Errores frecuentes de examen',$B56$1. Usar ética, moral, bioética y deontología como sinónimos exactos.
2. Creer que ética significa únicamente obedecer órdenes.
3. Reducir bioética a investigación o final de vida.
4. Pensar que un código profesional resuelve automáticamente todos los casos.
5. Confundir una convicción personal con una obligación profesional.
6. Creer que actuar con buena intención basta aunque exista incompetencia o riesgo.
7. Considerar legalidad y ética como conceptos idénticos.
8. Llamar “dilema” a cualquier problema o desacuerdo.
9. Ignorar dignidad y derechos cuando el paciente depende físicamente del equipo.
10. Suponer que la confidencialidad desaparece dentro de un hospital.
11. Confundir equidad con dar exactamente lo mismo a todos.
12. Justificar discriminación por comodidad administrativa.
13. Ocultar un riesgo para proteger a un colega.
14. Pensar que la ética solo corresponde al cuidado directo y no a gestión, docencia o investigación.$B56$,56 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_56','Situaciones originales tipo examen',$B57$### Caso 1 — Preferencia personal
Una enfermera desaprueba moralmente una decisión de un paciente competente, pero la decisión no representa una práctica ilegal ni exige a la enfermera realizar un acto fuera de su marco profesional.

**Mejor enfoque:** separar la convicción personal de la obligación de brindar trato respetuoso y cuidado profesional.

### Caso 2 — Información en el pasillo
Dos profesionales comentan detalles identificables de un paciente en un área pública.

**Problema principal:** confidencialidad y privacidad.

### Caso 3 — Procedimiento que no domina
Una enfermera recibe la indicación de realizar por primera vez un procedimiento complejo sin supervisión y reconoce que no posee competencia suficiente.

**Mejor conducta:** reconocer el límite y solicitar apoyo/supervisión para proteger la seguridad.

### Caso 4 — Registro falso
Se pide modificar un registro para que parezca que una intervención se realizó a la hora prescrita.

**Respuesta:** no falsificar; mantener integridad y veracidad del registro y utilizar canales apropiados.

### Caso 5 — Trato discriminatorio
Dos pacientes tienen igual necesidad clínica, pero se propone retrasar a uno por su condición socioeconómica.

**Problema ético:** justicia, equidad y no discriminación.

### Caso 6 — Familia solicita datos
Un familiar insiste en recibir información clínica privada sin que el caso establezca autorización.

**Mejor enfoque:** proteger confidencialidad y verificar autorización/procedimiento aplicable.

### Caso 7 — Práctica insegura
La enfermera observa que un miembro del equipo realiza una acción que amenaza de forma inmediata la seguridad del paciente.

**Prioridad:** proteger al paciente y activar los canales profesionales correspondientes.

### Caso 8 — Cultura
Una práctica cultural solicitada por la persona no interfiere con la seguridad ni con el tratamiento.

**Mejor conducta:** respetarla e integrarla cuando sea posible.

### Caso 9 — Tecnología
Una enfermera fotografía una lesión con su teléfono personal para “recordarla”, sin proceso autorizado.

**Problema:** privacidad, confidencialidad y uso profesional de datos/imágenes.

### Caso 10 — Administración
Una jefatura distribuye repetidamente oportunidades y cargas según favoritismo personal.

**Problema:** justicia, integridad y ética de la gestión.

### Caso 11 — Investigación
Se presiona a una persona para participar en un estudio porque “su médico lo recomienda”.

**Problema bioético:** respeto a la autonomía y ausencia de coerción.

### Caso 12 — Error propio
Una enfermera detecta que cometió un error con posible impacto clínico.

**Prioridad ética:** proteger al paciente, comunicar de forma apropiada y actuar con integridad; no ocultarlo.

### Caso 13 — Dignidad
Durante un procedimiento se deja al paciente innecesariamente expuesto frente a varias personas.

**Problema:** dignidad y privacidad.

### Caso 14 — Orden de autoridad
Un estudiante responde que una acción es correcta “porque la ordenó el superior”.

**Corrección:** la jerarquía no sustituye el juicio profesional ni convierte una acción insegura en ética.

### Caso 15 — Diferencia de opiniones
Dos profesionales discrepan sobre el mejor horario para una actividad sin que existan derechos, deberes o riesgos significativos comprometidos.

**Interpretación:** puede ser un desacuerdo operativo, no necesariamente un dilema ético.

### Caso 16 — Recursos limitados
Durante una situación de alta demanda, el equipo prioriza según necesidad clínica y riesgo en lugar de influencia social.

**Fundamento:** justicia, equidad y responsabilidad profesional.$B57$,57 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_57','Preguntas rápidas de repaso',$B58$**1. ¿Ética y moral son exactamente lo mismo?**  
No. Se relacionan, pero la ética implica reflexión crítica sobre valores y normas morales.

**2. ¿Qué estudia la bioética?**  
Problemas éticos relacionados con vida, salud, ciencias y tecnologías asociadas.

**3. ¿Qué enfatiza la deontología?**  
Deberes y obligaciones profesionales.

**4. ¿La ética profesional se limita al cuidado directo?**  
No. También alcanza administración, docencia, investigación y otras funciones.

**5. ¿Qué es dignidad?**  
Reconocimiento del valor intrínseco de la persona y de su derecho a trato respetuoso.

**6. ¿Competencia técnica tiene dimensión ética?**  
Sí. Actuar sin competencia suficiente puede generar daño evitable.

**7. ¿Legalidad y ética son sinónimos?**  
No.

**8. ¿Todo problema ético es un dilema?**  
No.

**9. ¿Qué debe hacerse ante una práctica insegura?**  
Proteger a la persona y utilizar los canales profesionales apropiados.

**10. ¿Qué debe evitarse al analizar un caso?**  
Imponer preferencias personales como si fueran deberes profesionales.$B58$,58 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_58','Fuentes y validación',$B59$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Tercera edición. Panamá, 2026.  
   Define el alcance: **ETHICS-01 — Concepto de ética y bioética**.

## Fuente profesional panameña

2. **Asociación Nacional de Enfermeras de Panamá (ANEP).** *Código Deontológico para Enfermeras de Panamá*. Última revisión/aprobación indicada en el documento: período 2014–2017.  
   https://www.anep.org.pa/books/CODIGO%20DEONTOLOGICO%20NUEVO.pdf

   Se utiliza para compromiso ético profesional, deberes, dignidad, derechos, bioética, autonomía, beneficencia/no maleficencia, confidencialidad, competencia y responsabilidad.

## Fuente profesional internacional

3. **Consejo Internacional de Enfermeras (CIE).** *Código de Ética del CIE para las Enfermeras*, revisión 2021.  
   https://www.icn.ch/es/recursos/publicaciones-e-informes/codigo-de-etica-del-cie-para-las-enfermeras

   Se utiliza como marco internacional actualizado de valores, responsabilidades, rendición de cuentas y ámbitos éticos de la enfermería.

## Fuente internacional de bioética

4. **UNESCO.** *Declaración Universal sobre Bioética y Derechos Humanos*. Adoptada el 19 de octubre de 2005.  
   https://www.unesco.org/es/ethics-science-technology/bioethics-and-human-rights

   Se utiliza para ubicar la bioética en relación con medicina, ciencias de la vida, tecnologías, dignidad y derechos humanos.

## Bibliografía indicada por CICDE

5. **Díaz Barzola, A.; Mancero Arias, M. G.** *Valores y ética en el área de la salud*. 2019.  
   Estado del proyecto: **verificada bibliográficamente**. Se conserva como bibliografía CICDE, sin atribuir páginas o contenido específico no comprobado en texto completo.$B59$,59 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actualizaciones_y_l_mites_de_interpretaci_n_59','Actualizaciones y límites de interpretación',$B60$- CICDE define el **alcance** del tema, no una lista de subtemas para ETHICS-01.
- El Código ANEP disponible públicamente indica revisión/aprobación 2014–2017. No se presenta como si hubiera sido revisado en 2026.
- El Código CIE usado como actualización internacional es la revisión **2021**, que continúa publicada oficialmente por el CIE.
- La Declaración UNESCO de Bioética y Derechos Humanos es de **2005** y funciona como marco internacional de bioética y derechos humanos.
- ETHICS-01 introduce autonomía, beneficencia, no maleficencia y justicia, pero **ETHICS-03** los desarrollará en profundidad.
- **ETHICS-04** desarrollará específicamente el Código Deontológico ANEP.
- **ETHICS-05** desarrollará derechos del paciente y la Ley 68 de 2003.
- No se inventan artículos, excepciones legales, sanciones o procedimientos disciplinarios que no hayan sido verificados.$B60$,60 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_60','Control de calidad',$B61$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra CICDE 2026;
- se conserva el título oficial ETHICS-01;
- no se inventan subtemas CICDE;
- conceptos de bioética y deber profesional se contrastan con ANEP;
- marco profesional internacional actualizado con CIE 2021;
- bioética y derechos humanos complementados con UNESCO;
- se diferencia ética, moral, bioética y deontología;
- principios éticos se introducen sin reemplazar ETHICS-03;
- Código ANEP se introduce sin reemplazar ETHICS-04;
- derechos del paciente se mencionan sin reemplazar ETHICS-05;
- casos tipo examen son originales y no se presentan como preguntas oficiales;
- no se atribuyen páginas o contenido específico a bibliografía CICDE disponible solo a nivel bibliográfico;
- no se declara revisión humana inexistente.$B61$,61 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_61','Estado para integración',$B62$**Estado:** `REVIEW`

Motivo:

- alcance y fuentes fueron revisados documentalmente;
- todavía no existe revisor humano con provenance registrado;
- `reviewed_at` debe permanecer `NULL`;
- `reviewed_by` debe permanecer `NULL`;
- ninguna fuente debe marcarse `verified=true` únicamente por revisión de IA.

**Cobertura CICDE ETHICS-01:** tema principal cubierto conforme al alcance disponible.  
**Situaciones originales tipo examen:** 16.$B62$,62 FROM tmap WHERE c='ETHICS-01';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B63$El temario CICDE 2026 incluye dentro del área **Aspectos Éticos y Legales** el tema exacto **“Dilemas éticos”** (`ETHICS-02`). El lineamiento no enumera subtemas explícitos para este punto.

Por ello, este paquete desarrolla el concepto de dilema ético y su resolución aplicada a enfermería sin presentar como “subtemas CICDE” categorías que el documento rector no enumera. Se mantiene además la separación con:

- **ETHICS-01:** concepto de ética y bioética;
- **ETHICS-03:** principios éticos y sus características;
- **ETHICS-04:** Código Deontológico de ANEP;
- **ETHICS-05:** derechos del paciente y Ley 68 de 2003.

El enfoque del módulo es práctico: reconocer cuándo existe un dilema, identificar los valores y deberes en tensión, razonar entre alternativas y actuar de forma segura, profesional, justificable y trazable.$B63$,1 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B64$Al finalizar el tema, el estudiante debe poder:

1. Definir qué es un dilema ético y diferenciarlo de un problema clínico o administrativo.
2. Reconocer conflictos entre valores, deberes, derechos y consecuencias.
3. Distinguir dilema ético, incertidumbre moral y sufrimiento moral.
4. Identificar a las personas afectadas por una decisión.
5. Separar hechos, opiniones, preferencias y juicios de valor.
6. Analizar alternativas considerando seguridad, dignidad, autonomía, bienestar y justicia.
7. Reconocer cuándo una situación exige consulta, escalamiento o revisión institucional.
8. Integrar Código Deontológico, normativa aplicable y políticas institucionales sin sustituir el juicio profesional.
9. Comunicar desacuerdos éticos de manera profesional.
10. Documentar hechos relevantes sin manipular ni ocultar información.
11. Aplicar razonamiento ético en situaciones clínicas, administrativas y de trabajo en equipo.
12. Resolver situaciones tipo CICDE evitando respuestas automáticas o absolutas.$B64$,2 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_es_un_dilema_tico_2','Qué es un dilema ético',$B65$Un **dilema ético** aparece cuando una situación obliga a elegir entre alternativas que comprometen valores, deberes o principios moralmente relevantes y ninguna opción resulta completamente libre de costos éticos.

No significa simplemente que una decisión sea difícil. En un verdadero dilema hay una **tensión moral real**: proteger un valor puede limitar otro, cumplir un deber puede entrar en conflicto con otro deber, o dos cursos de acción pueden tener razones éticas defendibles.

En enfermería, el reto no consiste en buscar una “palabra mágica”, sino en construir una decisión razonada y defendible dentro del marco profesional, legal e institucional.$B65$,3 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dilema_tico_vs_problema_3','Dilema ético vs. problema',$B66$Un **problema** puede resolverse principalmente con conocimiento técnico, recursos o procedimientos.

Ejemplo: falta un equipo necesario para realizar un procedimiento. La respuesta inicial puede ser administrativa: localizar otro equipo seguro o reorganizar el cuidado.

Un **dilema ético** exige además valorar qué debe hacerse cuando existen obligaciones o valores en tensión.

Ejemplo: un paciente competente rechaza una intervención que el equipo considera beneficiosa. Aquí no basta saber cómo realizar el procedimiento; hay que analizar la tensión entre bienestar, autonomía, información y seguridad.$B66$,4 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dilema_tico_vs_conflicto_interpersonal_4','Dilema ético vs. conflicto interpersonal',$B67$Un conflicto entre profesionales puede deberse a:

- comunicación deficiente;
- diferencias de rol;
- jerarquía;
- carga laboral;
- estilos personales.

No todo conflicto interpersonal es un dilema ético. Se convierte en un problema ético cuando afecta derechos, dignidad, seguridad, justicia, confidencialidad, integridad profesional u otras obligaciones relevantes.

**Clave de examen:** primero identificar qué está realmente en juego. Una discusión entre colegas no se resuelve igual que una amenaza a la seguridad del paciente.$B67$,5 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'incertidumbre_moral_5','Incertidumbre moral',$B68$Existe **incertidumbre moral** cuando el profesional percibe que hay un problema ético, pero todavía no tiene claro:

- qué valores están en tensión;
- qué norma aplica;
- quién debe decidir;
- qué opción es más justificable.

La respuesta apropiada no es improvisar. Se recopilan hechos, se aclaran responsabilidades, se consultan fuentes profesionales o legales pertinentes y se busca apoyo cuando sea necesario.$B68$,6 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sufrimiento_moral_6','Sufrimiento moral',$B69$El **sufrimiento moral** puede aparecer cuando el profesional considera que sabe cuál sería la actuación éticamente apropiada, pero siente que obstáculos institucionales, jerárquicos, legales, de recursos o de poder le impiden actuar de esa manera.

No debe confundirse automáticamente con dilema ético.

En enfermería puede manifestarse como frustración, culpa, impotencia o desgaste. Su presencia merece atención porque puede afectar al profesional, al equipo y a la calidad del cuidado.$B69$,7 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reconocimiento_del_problema_tico_7','Reconocimiento del problema ético',$B70$Preguntas útiles:

- ¿Quién puede resultar beneficiado o perjudicado?
- ¿Qué derecho, deber o valor está comprometido?
- ¿Hay riesgo para la seguridad o dignidad?
- ¿La persona ha expresado sus preferencias?
- ¿Existe presión, coerción o conflicto de intereses?
- ¿La decisión es reversible?
- ¿Hay una norma legal o profesional aplicable?
- ¿Falta información crítica?

Reconocer correctamente el problema evita resolver la situación equivocada.$B70$,8 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'por_qu_surgen_dilemas_en_enfermer_a_8','Por qué surgen dilemas en enfermería',$B71$La enfermería se encuentra cerca del paciente durante gran parte del proceso asistencial. Por ello puede observar tensiones entre:

- preferencias del paciente y recomendaciones clínicas;
- bienestar y autonomía;
- privacidad y necesidad de compartir información;
- lealtad al equipo y deber de proteger al paciente;
- recursos limitados y necesidades múltiples;
- creencias personales y obligaciones profesionales;
- protocolos y circunstancias individuales;
- eficiencia institucional y cuidado humanizado.

El contacto continuo hace que la enfermera sea frecuentemente quien identifica primero un conflicto ético.$B71$,9 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'primero_los_hechos_9','Primero los hechos',$B72$Antes de emitir un juicio ético se deben aclarar los hechos relevantes.

Preguntar:

- ¿Qué ocurrió realmente?
- ¿Qué información está confirmada?
- ¿Qué datos faltan?
- ¿Qué parte proviene de observación directa?
- ¿Qué parte es interpretación o rumor?

Una decisión ética basada en hechos incorrectos puede producir una respuesta incorrecta aunque el razonamiento posterior sea coherente.$B72$,10 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'personas_y_grupos_afectados_10','Personas y grupos afectados',$B73$Identificar a quienes pueden verse afectados:

- paciente;
- familia o persona de apoyo;
- enfermera;
- otros profesionales;
- otros pacientes;
- institución;
- comunidad, cuando corresponda.

No todos tienen el mismo rol decisorio ni el mismo nivel de autoridad. Identificar interesados no significa que todos puedan decidir por el paciente.$B73$,11 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valores_y_deberes_en_tensi_n_11','Valores y deberes en tensión',$B74$En un dilema pueden entrar en tensión elementos como:

- autonomía;
- bienestar;
- prevención del daño;
- justicia;
- veracidad;
- fidelidad;
- confidencialidad;
- dignidad;
- responsabilidad;
- seguridad;
- equidad.

ETHICS-03 profundizará las características de los principios. Aquí el objetivo es reconocer que varios pueden coexistir y competir dentro de una misma situación.$B74$,12 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'deber_profesional_12','Deber profesional',$B75$El razonamiento ético de enfermería no depende únicamente de preferencias personales.

El profesional debe considerar:

- deberes deontológicos;
- competencia profesional;
- seguridad;
- responsabilidad por actos y omisiones;
- respeto de derechos;
- confidencialidad;
- obligación de intervenir ante prácticas inseguras o contrarias a la ética.

El Código Deontológico de ANEP establece la protección del bienestar y dignidad de las personas como responsabilidad primordial y exige protegerlas frente a prácticas deshonestas, incompetentes, ilegales o contrarias a la ética.$B75$,13 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'valores_y_preferencias_del_paciente_13','Valores y preferencias del paciente',$B76$Una decisión clínicamente razonable puede ser éticamente inadecuada si ignora por completo los valores de la persona.

Explorar, cuando corresponda:

- qué entiende el paciente;
- qué le preocupa;
- qué resultados considera aceptables;
- sus creencias y valores;
- sus prioridades;
- a quién desea involucrar.

Escuchar preferencias no significa prometer cualquier intervención solicitada; significa incorporarlas al análisis dentro de límites clínicos, legales y profesionales.$B76$,14 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'contexto_cl_nico_y_urgencia_14','Contexto clínico y urgencia',$B77$La urgencia modifica el tiempo disponible para deliberar, pero no elimina la dimensión ética.

Una situación con riesgo inmediato exige priorizar seguridad y estabilización según corresponda. Una situación no urgente permite mayor deliberación, consulta y participación.

**Error frecuente:** aplicar el mismo ritmo de decisión a una emergencia y a una decisión programada.$B77$,15 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'marco_legal_e_institucional_15','Marco legal e institucional',$B78$El análisis ético debe distinguir entre:

- lo éticamente deseable;
- lo profesionalmente exigible;
- lo legalmente permitido u obligatorio;
- lo establecido por políticas institucionales.

Estas dimensiones pueden relacionarse, pero no son idénticas.

Cuando una decisión depende de consentimiento, confidencialidad, representación, capacidad legal, investigación u otro punto regulado, debe consultarse la normativa vigente correspondiente. ETHICS-05 profundizará los derechos del paciente en Panamá.$B78$,16 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'consulta_interdisciplinaria_16','Consulta interdisciplinaria',$B79$Los dilemas complejos rara vez deben resolverse en aislamiento.

Según la situación puede ser útil consultar:

- jefatura de enfermería;
- profesional tratante;
- equipo interdisciplinario;
- trabajo social;
- psicología;
- asesoría legal institucional;
- comité de bioética asistencial, cuando exista y corresponda.

El Decreto Ejecutivo 1458 de 2012, que reglamenta la Ley 68, reconoce al Comité de Bioética Asistencial como grupo interdisciplinario capacitado para ayudar a reflexionar y tomar decisiones ante problemas bioéticos.$B79$,17 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'m_todo_pr_ctico_de_an_lisis_tico_17','Método práctico de análisis ético',$B80$Un esquema útil para examen y práctica:

1. identificar el problema ético;
2. reunir hechos relevantes;
3. identificar personas afectadas;
4. reconocer valores, deberes y derechos en tensión;
5. generar alternativas razonables;
6. analizar beneficios, daños y justicia;
7. revisar normas profesionales, legales e institucionales;
8. consultar cuando sea necesario;
9. decidir y actuar;
10. comunicar y documentar;
11. reevaluar el resultado.

No es una fórmula matemática; es una estructura para evitar decisiones impulsivas.$B80$,18 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_1_definir_el_dilema_18','Paso 1 — Definir el dilema',$B81$Formularlo en una frase clara.

Ejemplo:

> “¿Cómo respetar la decisión de un paciente competente que rechaza una intervención recomendada, garantizando a la vez información suficiente y seguridad?”

Una formulación clara evita convertir el dilema en una acusación contra una persona.$B81$,19 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_2_reunir_datos_19','Paso 2 — Reunir datos',$B82$Aclarar:

- diagnóstico y situación clínica relevante;
- urgencia;
- comprensión del paciente;
- preferencias expresadas;
- participantes involucrados;
- alternativas disponibles;
- normas aplicables;
- riesgos previsibles.

No rellenar vacíos con suposiciones.$B82$,20 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_3_generar_alternativas_20','Paso 3 — Generar alternativas',$B83$Evitar el falso dilema de creer que solo existen dos opciones extremas.

Preguntar:

- ¿hay una alternativa menos restrictiva?
- ¿puede aclararse la información?
- ¿es posible ganar tiempo sin aumentar riesgo?
- ¿puede participar otra persona del equipo?
- ¿existe una solución que proteja mejor varios valores a la vez?$B83$,21 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_4_analizar_beneficios_y_da_os_21','Paso 4 — Analizar beneficios y daños',$B84$Para cada alternativa:

- beneficios probables;
- daños probables;
- gravedad;
- reversibilidad;
- probabilidad;
- impacto sobre la persona y terceros.

Evitar evaluar solo consecuencias físicas. También importan dignidad, confianza, privacidad, sufrimiento y equidad.$B84$,22 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_5_examinar_justicia_y_equidad_22','Paso 5 — Examinar justicia y equidad',$B85$Preguntar:

- ¿se aplicaría el mismo criterio a personas comparables?
- ¿hay discriminación o prejuicio?
- ¿los recursos se asignan según criterios defendibles?
- ¿una persona vulnerable está siendo desfavorecida injustamente?

UNESCO vincula la bioética con dignidad, derechos humanos y libertades fundamentales, por lo que el análisis no debe reducirse a utilidad clínica individual.$B85$,23 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_6_examinar_autonom_a_y_participaci_n_23','Paso 6 — Examinar autonomía y participación',$B86$Considerar:

- información disponible;
- comprensión;
- voluntariedad;
- preferencias;
- oportunidad de hacer preguntas;
- participación apropiada en decisiones.

La enfermera no debe sustituir automáticamente la decisión de una persona capaz solo porque discrepa con ella.$B86$,24 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_7_revisar_normas_profesionales_24','Paso 7 — Revisar normas profesionales',$B87$Preguntar:

- ¿qué exige el Código Deontológico?
- ¿qué responsabilidades corresponden al rol de enfermería?
- ¿la actuación está dentro de competencia?
- ¿existe riesgo de abandono, negligencia o práctica insegura?

Los códigos profesionales orientan la conducta, pero la aplicación exige interpretar la situación concreta.$B87$,25 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_8_decidir_y_actuar_25','Paso 8 — Decidir y actuar',$B88$La decisión final debe ser:

- clínicamente razonable;
- éticamente justificable;
- compatible con responsabilidades profesionales;
- conforme al marco legal aplicable;
- proporcional al riesgo;
- lo menos restrictiva posible cuando existan varias alternativas seguras.

En examen, suele ser mejor una acción que protege seguridad inmediata y al mismo tiempo conserva participación, dignidad y comunicación.$B88$,26 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_9_comunicar_la_decisi_n_26','Paso 9 — Comunicar la decisión',$B89$La comunicación debe ser:

- respetuosa;
- clara;
- centrada en hechos;
- no acusatoria;
- proporcional al rol profesional.

Explicar razones relevantes favorece confianza y continuidad del cuidado.$B89$,27 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paso_10_documentar_y_reevaluar_27','Paso 10 — Documentar y reevaluar',$B90$Registrar hechos pertinentes según política y responsabilidad profesional:

- valoración;
- información relevante;
- decisiones comunicadas;
- personas notificadas;
- acciones realizadas;
- respuesta del paciente.

No utilizar el registro para castigar, culpar o justificar retrospectivamente una decisión. Reevaluar si aparecen nuevos datos.$B90$,28 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_vs_beneficencia_28','Autonomía vs. beneficencia',$B91$Uno de los conflictos clásicos aparece cuando el profesional considera que una intervención beneficiaría al paciente y este no la desea.

La respuesta no es “beneficencia siempre gana” ni “autonomía siempre gana”. Hay que valorar:

- competencia/capacidad pertinente;
- información y comprensión;
- voluntariedad;
- urgencia;
- marco legal aplicable;
- riesgos y alternativas.

**Clave:** evitar paternalismo automático.$B91$,29 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rechazo_de_atenci_n_o_tratamiento_29','Rechazo de atención o tratamiento',$B92$Ante un rechazo:

1. confirmar qué se está rechazando;
2. explorar comprensión y motivos;
3. verificar que se haya brindado información apropiada dentro del rol profesional;
4. identificar coerción o barreras de comunicación;
5. comunicar al profesional/equipo responsable;
6. respetar el marco legal aplicable;
7. documentar de forma objetiva.

La Ley 68 de 2003 regula en Panamá la información y decisión libre e informada. ETHICS-05 profundizará este marco.$B92$,30 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'capacidad_y_apoyo_a_la_decisi_n_30','Capacidad y apoyo a la decisión',$B93$No debe asumirse incapacidad solo porque la persona:

- tiene diagnóstico psiquiátrico;
- es adulta mayor;
- toma una decisión que el equipo no comparte;
- tiene discapacidad.

La capacidad decisoria puede depender de la decisión y del contexto. Enfermería observa comprensión, comunicación y cambios cognitivos, y comunica preocupaciones al equipo correspondiente. Las determinaciones formales deben seguir la normativa y competencia profesional aplicables.$B93$,31 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'familia_en_desacuerdo_con_el_paciente_31','Familia en desacuerdo con el paciente',$B94$Una familia puede estar angustiada y desear una decisión diferente a la del paciente.

La enfermera debe:

- escuchar;
- aclarar roles;
- mantener privacidad y confidencialidad;
- facilitar comunicación con el equipo;
- evitar entregar a la familia autoridad decisoria que no le corresponda.

El apoyo familiar es valioso, pero no sustituye automáticamente la voluntad del paciente.$B94$,32 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'veracidad_y_comunicaci_n_dif_cil_32','Veracidad y comunicación difícil',$B95$Puede surgir tensión cuando familiares piden “no decirle” al paciente un diagnóstico o pronóstico.

El análisis considera:

- derechos y preferencias de información;
- obligaciones del equipo;
- capacidad del paciente;
- contexto cultural;
- riesgo de daño;
- normativa aplicable.

La enfermera no debe mentir deliberadamente para evitar una conversación difícil.$B95$,33 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confidencialidad_33','Confidencialidad',$B96$Un dilema puede aparecer cuando compartir información parece beneficioso, pero existe deber de confidencialidad.

Principios prácticos:

- acceder solo a información necesaria;
- compartir con personas legítimamente involucradas;
- utilizar el mínimo necesario;
- verificar autorización cuando corresponda;
- conocer excepciones legales aplicables.

El Código Deontológico de ANEP protege expresamente privacidad y secreto profesional.$B96$,34 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redes_sociales_y_privacidad_34','Redes sociales y privacidad',$B97$La ausencia del nombre del paciente no garantiza anonimato.

Fotografías, horarios, lugar, diagnóstico, edad, circunstancias o comentarios pueden permitir identificación indirecta.

**Regla de seguridad:** no publicar información clínica o imágenes del paciente fuera de los canales autorizados y del marco aplicable.$B97$,35 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'orden_o_indicaci_n_potencialmente_insegura_35','Orden o indicación potencialmente insegura',$B98$Si una indicación parece errónea o peligrosa, la obligación profesional no consiste en ejecutarla mecánicamente.

La enfermera debe:

- detener la acción insegura cuando corresponda;
- verificar la indicación;
- comunicar la preocupación;
- escalar si no se resuelve y persiste el riesgo;
- documentar de acuerdo con política.

La lealtad jerárquica no está por encima de la seguridad del paciente.$B98$,36 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_asistencial_36','Error asistencial',$B99$Ante un error real o sospechado, el primer objetivo es proteger al paciente.

Secuencia general:

1. valorar al paciente;
2. tomar medidas clínicas dentro del rol;
3. comunicar por los canales pertinentes;
4. documentar hechos clínicos de forma veraz;
5. seguir el sistema institucional de reporte;
6. participar en medidas preventivas.

Ocultar, alterar registros o culpar sin análisis son respuestas éticamente inadecuadas.$B99$,37 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'delegaci_n_y_competencia_37','Delegación y competencia',$B100$Un dilema puede surgir cuando existe presión para delegar una tarea a alguien sin competencia suficiente.

Considerar:

- condición del paciente;
- complejidad de la tarea;
- formación y competencia;
- supervisión disponible;
- consecuencias de una ejecución incorrecta.

La falta de personal no convierte automáticamente una delegación insegura en aceptable.$B100$,38 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'recursos_limitados_38','Recursos limitados',$B101$Cuando los recursos son insuficientes, la respuesta ética requiere criterios transparentes y clínicamente defendibles.

Evitar asignación basada en:

- favoritismo;
- influencia social;
- prejuicio;
- capacidad de presionar al personal.

Debe procurarse equidad, proporcionalidad y priorización basada en necesidades relevantes.$B101$,39 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'priorizaci_n_cl_nica_y_tica_39','Priorización clínica y ética',$B102$Priorizar no es “atender primero al que llegó primero” en todas las circunstancias.

En contextos clínicos, la urgencia y el riesgo pueden justificar modificar el orden.

En examen:

- amenaza vital inmediata suele desplazar necesidades no urgentes;
- la decisión debe poder justificarse con criterios clínicos, no personales.$B102$,40 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'decisiones_al_final_de_la_vida_40','Decisiones al final de la vida',$B103$El final de la vida puede generar tensiones entre:

- prolongación de intervenciones;
- alivio del sufrimiento;
- preferencias del paciente;
- expectativas familiares;
- proporcionalidad;
- objetivos de cuidado.

Enfermería contribuye mediante valoración, confort, comunicación, respeto, documentación y coordinación con el equipo. Las decisiones específicas deben seguir la normativa, las órdenes clínicas válidas y las políticas institucionales aplicables.$B103$,41 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'proporcionalidad_del_tratamiento_41','Proporcionalidad del tratamiento',$B104$Una intervención puede ofrecer algún beneficio y, al mismo tiempo, imponer cargas importantes.

El análisis considera:

- objetivo realista;
- probabilidad de beneficio;
- carga física y emocional;
- preferencias de la persona;
- reversibilidad;
- alternativas.

La enfermera no decide unilateralmente retirar tratamientos médicos, pero sí puede identificar sufrimiento, dudas, discordancia con objetivos y necesidad de deliberación.$B104$,42 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dolor_y_sufrimiento_42','Dolor y sufrimiento',$B105$Aliviar sufrimiento es un deber importante, pero puede coexistir con preocupaciones sobre efectos adversos, sedación, seguridad o preferencias.

La respuesta requiere:

- valorar dolor y síntomas;
- usar intervenciones indicadas y seguras;
- vigilar respuesta;
- comunicar cambios;
- evitar infratratamiento por miedo no fundamentado.$B105$,43 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'creencias_culturales_y_religiosas_43','Creencias culturales y religiosas',$B106$Las creencias deben explorarse con respeto, no presumirse.

Preguntar qué significa para la persona una práctica o restricción.

Cuando una preferencia no genera riesgo significativo, puede integrarse al cuidado. Si existe conflicto con seguridad o normativa, se busca una alternativa respetuosa y se involucra al equipo apropiado.$B106$,44 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conflicto_de_conciencia_del_profesional_44','Conflicto de conciencia del profesional',$B107$El Código Deontológico de ANEP contempla que, si un procedimiento entra en conflicto con convicciones religiosas o éticas del profesional, debe informarse oportunamente al superior para asegurar la atención del paciente.

Por tanto:

- la convicción personal merece manejo profesional;
- no justifica humillar ni discriminar;
- no debe traducirse en abandono;
- debe garantizarse continuidad segura según el marco aplicable.$B107$,45 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'sexualidad_y_salud_reproductiva_45','Sexualidad y salud reproductiva',$B108$Estos temas pueden generar tensiones entre valores personales, preferencias del paciente, obligaciones profesionales y normas vigentes.

En enfermería:

- evitar juicios personales;
- brindar cuidado respetuoso;
- mantener confidencialidad según corresponda;
- comunicar límites del propio rol;
- consultar normativa vigente cuando sea decisiva.

No utilizar convicciones personales para negar trato digno.$B108$,46 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'pediatr_a_y_adolescencia_46','Pediatría y adolescencia',$B109$En menores pueden coexistir:

- responsabilidades de padres/tutores;
- interés superior y seguridad;
- desarrollo progresivo;
- participación del niño o adolescente;
- confidencialidad con límites.

La respuesta concreta depende de edad, madurez, situación clínica y normativa. En examen, escuchar al menor apropiadamente y proteger su seguridad suele ser parte esencial del cuidado.$B109$,47 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'salud_mental_riesgo_y_restricci_n_47','Salud mental, riesgo y restricción',$B110$En salud mental pueden tensionarse autonomía, seguridad y uso de medidas restrictivas.

Principios generales:

- usar la alternativa menos restrictiva compatible con seguridad;
- valorar riesgo real;
- evitar coerción por conveniencia;
- seguir normas y órdenes válidas;
- reevaluar continuamente;
- preservar dignidad.

Las reglas específicas dependen de legislación y protocolo vigente.$B110$,48 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'personas_en_situaci_n_de_vulnerabilidad_48','Personas en situación de vulnerabilidad',$B111$La vulnerabilidad puede relacionarse con edad, discapacidad, pobreza, dependencia, violencia, migración, aislamiento u otras condiciones.

No significa incapacidad automática.

La respuesta ética busca evitar explotación, discriminación y exclusión, y fortalecer comprensión, participación y acceso equitativo.$B111$,49 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dilemas_ticos_en_investigaci_n_49','Dilemas éticos en investigación',$B112$Pueden surgir tensiones entre generación de conocimiento y protección de participantes.

Aspectos frecuentes:

- consentimiento;
- privacidad;
- riesgos y beneficios;
- selección justa;
- poblaciones vulnerables;
- conflicto de intereses;
- integridad de datos.

El área de Investigación del proyecto desarrolla con mayor profundidad la Ley 84 de 2019 y la ética de investigación.$B112$,50 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dilemas_ticos_en_administraci_n_de_enfermer_a_50','Dilemas éticos en administración de enfermería',$B113$Ejemplos:

- presión para ocultar un indicador desfavorable;
- asignación de personal insuficiente;
- favoritismo en turnos;
- evaluación injusta;
- uso inadecuado de datos;
- órdenes administrativas que comprometen seguridad.

La función administrativa no elimina la responsabilidad ética hacia pacientes y personal.$B113$,51 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conducta_insegura_de_un_colega_51','Conducta insegura de un colega',$B114$Si un profesional observa una práctica que pone al paciente en riesgo:

1. proteger al paciente;
2. intervenir dentro del rol cuando sea necesario;
3. comunicar de forma profesional;
4. utilizar cadena de escalamiento;
5. documentar hechos según corresponda.

Cubrir una conducta insegura por compañerismo no es lealtad ética.$B114$,52 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estudiantes_y_personal_en_formaci_n_52','Estudiantes y personal en formación',$B115$El aprendizaje no justifica exponer al paciente a riesgos evitables.

Debe existir:

- supervisión apropiada;
- consentimiento/información cuando aplique;
- asignación acorde con competencia;
- oportunidad de pedir ayuda;
- protección de confidencialidad.

La seguridad del paciente prevalece sobre la necesidad de “practicar”.$B115$,53 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tecnolog_a_datos_e_inteligencia_artificial_53','Tecnología, datos e inteligencia artificial',$B116$Las nuevas herramientas pueden crear dilemas sobre:

- privacidad;
- sesgo;
- errores automatizados;
- responsabilidad;
- dependencia tecnológica;
- uso secundario de datos.

La tecnología apoya, pero no reemplaza la responsabilidad profesional. Una recomendación automatizada que contradice la valoración clínica debe ser revisada, no obedecida ciegamente.$B116$,54 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comit_de_bio_tica_asistencial_54','Comité de bioética asistencial',$B117$Puede ser útil cuando:

- persiste desacuerdo importante;
- los valores en tensión no están claros;
- existe conflicto entre equipo y familia;
- se requiere deliberación interdisciplinaria;
- la decisión tiene consecuencias complejas.

El comité orienta la deliberación; no sustituye automáticamente las responsabilidades legales o profesionales de quienes intervienen.$B117$,55 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'c_mo_comunicar_desacuerdo_tico_55','Cómo comunicar desacuerdo ético',$B118$Una comunicación profesional puede seguir esta lógica:

1. describir el hecho;
2. explicar la preocupación concreta;
3. vincularla con seguridad, derecho o deber;
4. proponer una acción;
5. confirmar respuesta;
6. escalar si el riesgo persiste.

Evitar ataques personales como “usted es irresponsable”. Describir conductas y riesgos es más útil y defendible.$B118$,56 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'escalamiento_56','Escalamiento',$B119$Escalar significa utilizar niveles apropiados cuando una preocupación no se resuelve.

Puede incluir:

- aclaración directa;
- enfermera responsable;
- jefatura;
- médico responsable;
- dirección correspondiente;
- gestión de riesgo;
- bioética;
- asesoría legal, según caso.

**Clave:** escalar no es abandonar el problema; es buscar una instancia con capacidad para resolverlo.$B119$,57 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentaci_n_tica_57','Documentación ética',$B120$La documentación debe ser:

- objetiva;
- cronológica;
- pertinente;
- veraz;
- sin alteraciones retrospectivas engañosas.

Registrar hechos, intervenciones y comunicaciones relevantes. Evitar insultos, interpretaciones no sustentadas o lenguaje punitivo.$B120$,58 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_58','Integración con el PAE',$B121$### Valoración
Identificar preferencias, comprensión, riesgos, apoyos, valores y posibles conflictos.

### Diagnóstico/juicio de enfermería
Reconocer problemas de seguridad, afrontamiento, conocimiento, comunicación u otros dentro del lenguaje profesional aplicable.

### Planificación
Incorporar participación del paciente, objetivos realistas, seguridad y coordinación.

### Ejecución
Actuar dentro de competencia, comunicar y escalar cuando corresponda.

### Evaluación
Valorar respuesta, consecuencias no previstas y necesidad de modificar el plan.$B121$,59 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'razonamiento_tipo_examen_59','Razonamiento tipo examen',$B122$Ante un caso ético:

**Paso 1:** identificar riesgo inmediato.  
**Paso 2:** determinar quién es el paciente y quién puede decidir.  
**Paso 3:** identificar valor/deber en tensión.  
**Paso 4:** buscar la respuesta menos coercitiva y más segura.  
**Paso 5:** respetar confidencialidad y límites del rol.  
**Paso 6:** comunicar/escalar si es necesario.  
**Paso 7:** documentar cuando corresponda.

La mejor respuesta suele ser la que protege al paciente sin eliminar innecesariamente su participación o dignidad.$B122$,60 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'distractores_frecuentes_en_preguntas_60','Distractores frecuentes en preguntas',$B123$Desconfíe de opciones que:

- obedecen una orden claramente insegura sin verificar;
- revelan información a familiares solo por parentesco;
- esconden un error;
- humillan al paciente;
- sustituyen la decisión de un adulto competente sin razón;
- prometen confidencialidad absoluta en cualquier circunstancia;
- abandonan al paciente por conflicto personal;
- usan la jerarquía como excusa para no actuar ante un riesgo;
- aplican reglas absolutas sin considerar contexto.$B123$,61 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_61','Errores frecuentes',$B124$1. Llamar dilema ético a cualquier problema difícil.
2. Creer que ética y ley son sinónimos.
3. Resolver desde preferencias personales.
4. Ignorar hechos clínicos.
5. Suponer que familia siempre decide.
6. Considerar incapaz a quien toma una decisión diferente.
7. Confundir desacuerdo con negligencia.
8. Priorizar obediencia jerárquica sobre seguridad.
9. Confundir confidencialidad con silencio absoluto ante cualquier riesgo.
10. No consultar ante situaciones complejas.
11. Documentar opiniones como hechos.
12. Usar principios como reglas aisladas sin ponderación.$B124$,62 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_memorizar_para_cicde_62','Qué memorizar para CICDE',$B125$- **Dilema ético:** conflicto entre alternativas con valores/deberes moralmente relevantes.
- No todo problema difícil es un dilema.
- Primero hechos; después análisis.
- Identificar paciente, decisores legítimos y personas afectadas.
- Autonomía no significa abandono; beneficencia no justifica paternalismo automático.
- Seguridad del paciente tiene prioridad frente a obediencia ciega.
- Confidencialidad exige proteger información y conocer excepciones aplicables.
- Ante conflicto de conciencia, asegurar continuidad de atención.
- Escalar cuando un riesgo persiste y no puede resolverse en el nivel inicial.
- Documentar hechos de forma veraz.
- Los comités de bioética pueden apoyar deliberación compleja.$B125$,63 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_63','Situaciones originales tipo examen',$B126$### Caso 1 — Rechazo de intervención
Paciente adulto, orientado y con información disponible rechaza una intervención recomendada.

**Mejor conducta:** explorar comprensión y motivos, comunicar al equipo responsable, respetar el proceso de decisión conforme al marco aplicable y documentar.

### Caso 2 — Familiar pide ocultar diagnóstico
La familia pide a la enfermera que mienta al paciente para “protegerlo”.

**Mejor conducta:** no mentir; explorar la preocupación familiar y coordinar con el equipo cómo respetar derechos y preferencias de información.

### Caso 3 — Orden dudosa
Una dosis prescrita parece muy superior a la habitual.

**Prioridad:** detener la administración hasta verificar la indicación y comunicar la preocupación.

### Caso 4 — Error de medicación
La enfermera descubre que administró un medicamento equivocado.

**Prioridad:** valorar/proteger al paciente, comunicar por los canales clínicos y seguir el proceso de reporte; no ocultar.

### Caso 5 — Confidencialidad
Un familiar pregunta por resultados sin autorización conocida del paciente.

**Conducta:** proteger información y verificar autorización/rol antes de divulgar.

### Caso 6 — Recurso limitado
Dos pacientes necesitan atención simultánea; uno presenta deterioro respiratorio y otro solicita medicación no urgente.

**Conducta:** priorizar la amenaza fisiológica inmediata y reorganizar el resto del cuidado.

### Caso 7 — Delegación insegura
Se pide a una persona no entrenada realizar una tarea compleja por falta de personal.

**Conducta:** no delegar de forma insegura; escalar la necesidad de cobertura.

### Caso 8 — Conflicto de conciencia
Una intervención permitida entra en conflicto con las convicciones personales de la enfermera.

**Conducta:** informar oportunamente al superior y asegurar continuidad de cuidado sin discriminar al paciente.

### Caso 9 — Redes sociales
Profesional quiere publicar una fotografía sin nombre, pero se reconoce habitación y contexto.

**Conducta:** no publicarla. La identificación indirecta también vulnera privacidad.

### Caso 10 — Paciente con diagnóstico psiquiátrico
Paciente con trastorno mental expresa una preferencia clara y coherente. Un colega dice que “por su diagnóstico no puede decidir nada”.

**Conducta:** no asumir incapacidad automáticamente; valorar situación y seguir el proceso correspondiente.

### Caso 11 — Familia y paciente discrepan
Paciente competente no desea que su familia conozca información clínica.

**Conducta:** respetar confidencialidad y facilitar comunicación solo con autorización o base legal aplicable.

### Caso 12 — Colega inseguro
La enfermera observa que un colega intenta usar un equipo que sabe que está defectuoso.

**Conducta:** intervenir para proteger al paciente y escalar el riesgo.

### Caso 13 — Final de vida
Paciente con enfermedad avanzada expresa una meta de confort, mientras familiares exigen “hacer todo” sin conocer sus preferencias.

**Conducta:** comunicar las preferencias conocidas del paciente y facilitar deliberación del equipo y familia dentro del marco aplicable.

### Caso 14 — Investigación
Participante cree que debe aceptar un estudio para seguir recibiendo atención.

**Conducta:** identificar posible coerción y asegurar que la participación voluntaria se maneje mediante el proceso ético de investigación correspondiente.

### Caso 15 — Registro alterado
Una jefatura sugiere modificar retrospectivamente una nota para que un evento “no parezca error”.

**Conducta:** no falsificar ni alterar engañosamente el registro; seguir canales institucionales apropiados.

### Caso 16 — Barrera cultural
Paciente solicita una práctica cultural compatible con la seguridad.

**Conducta:** respetarla e integrarla cuando sea posible.

### Caso 17 — Algoritmo vs. valoración
Una herramienta digital clasifica a un paciente como de bajo riesgo, pero la enfermera observa deterioro evidente.

**Conducta:** priorizar valoración clínica, reevaluar y escalar; no obedecer automáticamente al algoritmo.

### Caso 18 — Desacuerdo entre profesionales
Dos profesionales discuten sobre una decisión y el tono se vuelve hostil frente al paciente.

**Conducta:** proteger al paciente del conflicto, comunicar de forma profesional y llevar el desacuerdo al canal apropiado.$B126$,64 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_64','Preguntas rápidas de repaso',$B127$**1. ¿Todo problema difícil es un dilema ético?**  
No.

**2. ¿Qué debe aclararse primero?**  
Los hechos relevantes.

**3. ¿Qué distingue al sufrimiento moral?**  
Percibir una acción correcta pero sentirse impedido de realizarla por restricciones relevantes.

**4. ¿La familia siempre decide por el paciente?**  
No.

**5. ¿La jerarquía elimina la responsabilidad profesional?**  
No.

**6. ¿Un diagnóstico psiquiátrico equivale automáticamente a incapacidad?**  
No.

**7. ¿Qué hacer ante una orden insegura?**  
Verificar, comunicar y no ejecutar mecánicamente.

**8. ¿Qué hacer ante conflicto de conciencia?**  
Informar oportunamente y asegurar continuidad de cuidado según el marco aplicable.

**9. ¿El comité de bioética sustituye todas las decisiones clínicas?**  
No; apoya la deliberación.

**10. ¿Qué cualidad debe tener la documentación?**  
Ser objetiva y veraz.$B127$,65 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_65','Fuentes y validación',$B128$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Tercera edición. Panamá, 2026. Define `ETHICS-02 = Dilemas éticos`.

## Fuente profesional panameña

2. **Asociación Nacional de Enfermeras de Panamá (ANEP). Código Deontológico para Enfermeras de Panamá.** Última revisión/aprobación indicada en el documento: período 2014–2017. Se utiliza para deberes hacia paciente, familia, comunidad, colegas, privacidad, autodeterminación, protección frente a prácticas inseguras y manejo de conflictos de conciencia.

## Fuente profesional internacional

3. **Consejo Internacional de Enfermeras (CIE/ICN). Código de Ética del CIE para las Enfermeras. 2021.** Marco internacional de valores, responsabilidades y rendición de cuentas profesional.

## Bioética y derechos humanos

4. **UNESCO. Declaración Universal sobre Bioética y Derechos Humanos. 2005.** Marco de dignidad, derechos humanos, libertades fundamentales y principios bioéticos.

## Contexto legal panameño relacionado

5. **Ley 68 de 20 de noviembre de 2003.** Regula derechos y obligaciones de los pacientes en materia de información y decisión libre e informada.
6. **Decreto Ejecutivo 1458 de 6 de noviembre de 2012.** Reglamenta la Ley 68 y define, entre otros conceptos, autonomía, bioética, confidencialidad, consentimiento informado, conflicto de intereses y Comité de Bioética Asistencial.

## Bibliografía indicada por CICDE

7. **Díaz Barzola, A.; Mancero Arias, M. G. (2019). Valores y ética en el área de la salud.** Fuente verificada bibliográficamente en el registro del proyecto. No se atribuyen páginas ni contenidos específicos no comprobados en texto completo.$B128$,66 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_actualizaci_n_66','Límites y actualización',$B129$- Este material enseña razonamiento ético; no sustituye asesoría legal ni protocolos institucionales.
- Las reglas sobre representación, consentimiento, menores, salud mental, investigación, final de vida y confidencialidad pueden depender de normativa específica vigente.
- ETHICS-05 desarrollará con mayor profundidad derechos del paciente y Ley 68.
- ETHICS-04 desarrollará directamente el Código Deontológico ANEP.
- No se presentan los principios como algoritmos absolutos: deben interpretarse en contexto.
- No se atribuyen páginas de fuentes cuya versión completa no haya sido verificada para esa afirmación.$B129$,67 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_67','Control de calidad',$B130$Este paquete fue construido con las siguientes reglas:

- alcance cotejado contra el temario CICDE 2026;
- CICDE no enumera subtemas explícitos para ETHICS-02;
- se distingue dilema, problema, incertidumbre y sufrimiento moral;
- se prioriza aplicación a enfermería;
- el Código Deontológico ANEP se utiliza como marco profesional primario panameño;
- CIE y UNESCO se utilizan como marcos internacionales complementarios;
- Ley 68/Decreto 1458 se incorporan solo donde aportan contexto y sin adelantar ETHICS-05;
- se evita presentar convicciones personales como norma profesional;
- se incluyen 18 situaciones pedagógicas originales;
- las situaciones no son preguntas oficiales CICDE;
- no se declara revisión humana inexistente.$B130$,68 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_68','Estado para integración',$B131$**Estado recomendado:** `REVIEW`

Motivo:

- alcance y fuentes fueron sometidos a revisión documental/académica;
- no existe todavía revisor humano con provenance registrado;
- `reviewed_by` debe permanecer `NULL`;
- `reviewed_at` debe permanecer `NULL`;
- las fuentes no deben marcarse `verified=true` exclusivamente por revisión de IA.

**Cobertura CICDE ETHICS-02:** tema principal cubierto conforme al alcance disponible.  
**Situaciones originales tipo examen:** 18.$B131$,69 FROM tmap WHERE c='ETHICS-02';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B132$El temario CICDE 2026 incluye expresamente:

> **“Principios éticos y sus características”.**

El lineamiento no enumera subtemas específicos para ETHICS-03. Por ello, este material no presenta una lista ampliada como si fuera una enumeración literal de CICDE.

El desarrollo se apoya en:

- el **Código Deontológico para Enfermeras de Panamá (ANEP)**;
- el **Código de Ética del CIE para las Enfermeras, revisión 2021**;
- la **Declaración Universal sobre Bioética y Derechos Humanos de UNESCO**;
- el enfoque general de derechos humanos y responsabilidad profesional aplicable al cuidado de enfermería.

---$B132$,1 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B133$Al finalizar el tema, el estudiante debe poder:

1. Explicar qué es un principio ético.
2. Diferenciar principios, valores y normas.
3. Reconocer dignidad, autonomía, beneficencia, no maleficencia y justicia.
4. Relacionar veracidad, confidencialidad, fidelidad, responsabilidad, prudencia e integridad con la práctica de enfermería.
5. Identificar cuándo dos principios pueden entrar en tensión.
6. Evitar aplicar los principios como reglas automáticas aisladas.
7. Analizar situaciones de cuidado considerando persona, contexto, riesgo, derechos y responsabilidades profesionales.
8. Integrar principios éticos al Proceso de Atención de Enfermería.
9. Priorizar seguridad, dignidad y derechos en escenarios tipo examen.
10. Reconocer cuándo una situación requiere deliberación o escalamiento.

---$B133$,2 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_es_un_principio_tico_2','Qué es un principio ético',$B134$Un principio ético es una orientación general que ayuda a valorar qué conducta resulta moralmente justificable en una situación determinada.

No funciona como una fórmula matemática.

Sirve para:

- orientar decisiones;
- comparar alternativas;
- justificar acciones;
- reconocer conflictos;
- proteger a las personas;
- establecer límites a la conducta profesional.

---$B134$,3 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'principios_valores_y_normas_3','Principios, valores y normas',$B135$**Principio:** orientación ética general.

**Valor:** cualidad considerada importante, como respeto, honestidad o solidaridad.

**Norma:** regla concreta que establece o prohíbe una conducta.

Ejemplo:

- valor: respeto;
- principio: autonomía;
- norma: obtener el consentimiento cuando corresponde.

---$B135$,4 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'caracter_sticas_generales_de_los_principios_ticos_4','Características generales de los principios éticos',$B136$Los principios éticos:

- orientan, no sustituyen el juicio;
- deben aplicarse al contexto;
- pueden entrar en tensión;
- exigen justificar decisiones;
- se relacionan con derechos y deberes;
- no eliminan la responsabilidad profesional;
- requieren considerar consecuencias previsibles;
- deben aplicarse sin discriminación.

---$B136$,5 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dignidad_humana_5','Dignidad humana',$B137$La dignidad reconoce que toda persona posee valor propio y merece respeto independientemente de:

- edad;
- diagnóstico;
- discapacidad;
- dependencia;
- condición económica;
- origen;
- sexo;
- cultura;
- conducta;
- pronóstico.

En enfermería, la dignidad se protege mediante trato respetuoso, privacidad, comunicación adecuada y cuidado no humillante.

---$B137$,6 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respeto_por_la_persona_6','Respeto por la persona',$B138$Respetar a la persona implica reconocer:

- su individualidad;
- su historia;
- sus preferencias;
- sus valores;
- su intimidad;
- su derecho a participar;
- sus límites.

La persona no debe reducirse a “la cama”, “el diagnóstico” o “el procedimiento”.

---$B138$,7 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_concepto_7','Autonomía: concepto',$B139$La autonomía se relaciona con la capacidad de la persona para participar en decisiones sobre su vida y atención conforme a sus valores y preferencias.

En la práctica incluye:

- recibir información;
- expresar preferencias;
- aceptar;
- rechazar;
- formular preguntas;
- participar en decisiones.

---$B139$,8 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_caracter_sticas_8','Autonomía: características',$B140$La autonomía exige:

- voluntariedad;
- información suficiente;
- comprensión;
- ausencia de coerción indebida;
- posibilidad real de decidir;
- respeto por preferencias.

No significa abandonar al paciente ni aceptar cualquier solicitud sin valorar seguridad, legalidad y competencia profesional.

---$B140$,9 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_y_capacidad_para_decidir_9','Autonomía y capacidad para decidir',$B141$La capacidad para decidir puede depender de la situación y de la decisión concreta.

No debe asumirse incapacidad solamente por:

- edad avanzada;
- diagnóstico psiquiátrico;
- discapacidad;
- bajo nivel educativo;
- desacuerdo con el equipo.

Cuando existe duda, debe seguirse el proceso clínico y legal correspondiente.

---$B141$,10 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_y_consentimiento_10','Autonomía y consentimiento',$B142$El consentimiento éticamente válido requiere más que una firma.

Implica un proceso de:

- información;
- comprensión;
- voluntariedad;
- decisión.

La enfermera favorece comprensión, identifica dudas y evita coerción, respetando su ámbito profesional.

---$B142$,11 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_y_rechazo_de_cuidados_o_tratamiento_11','Autonomía y rechazo de cuidados o tratamiento',$B143$Un paciente capaz puede rechazar una intervención.

La respuesta profesional no debe ser:

- castigar;
- amenazar;
- ridiculizar;
- abandonar.

Se debe:

- valorar comprensión;
- aclarar información;
- explorar motivos;
- comunicar al equipo;
- documentar apropiadamente;
- respetar el marco legal aplicable.

---$B143$,12 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_y_contexto_de_la_autonom_a_12','Límites y contexto de la autonomía',$B144$La autonomía no opera de manera aislada.

Puede interactuar con:

- seguridad de terceros;
- capacidad decisional;
- urgencia;
- deberes legales;
- protección de menores;
- salud pública;
- riesgo grave.

Por eso requiere análisis contextual.

---$B144$,13 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'beneficencia_concepto_13','Beneficencia: concepto',$B145$Beneficencia significa actuar buscando el bienestar de la persona.

Puede expresarse mediante:

- aliviar sufrimiento;
- prevenir complicaciones;
- promover recuperación;
- apoyar función;
- favorecer bienestar;
- brindar educación;
- facilitar acceso a recursos.

---$B145$,14 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'beneficencia_caracter_sticas_14','Beneficencia: características',$B146$La beneficencia:

- requiere conocer necesidades reales;
- no autoriza imponer cualquier intervención “por su bien”;
- debe equilibrarse con autonomía;
- exige considerar beneficios razonables;
- debe adaptarse a valores y contexto de la persona.

---$B146$,15 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'beneficencia_en_el_cuidado_de_enfermer_a_15','Beneficencia en el cuidado de enfermería',$B147$Ejemplos:

- prevenir lesiones por presión;
- controlar dolor;
- educar antes del alta;
- facilitar movilización segura;
- identificar deterioro;
- promover alimentación adecuada;
- apoyar afrontamiento.

---$B147$,16 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_maleficencia_concepto_16','No maleficencia: concepto',$B148$No maleficencia significa evitar causar daño innecesario o injustificado.

En enfermería incluye:

- no ejecutar una indicación claramente insegura sin aclararla;
- verificar medicamentos;
- prevenir infecciones;
- usar equipos adecuados;
- reconocer límites de competencia;
- intervenir ante deterioro.

---$B148$,17 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_maleficencia_caracter_sticas_17','No maleficencia: características',$B149$No maleficencia implica:

- anticipar riesgos;
- prevenir daño;
- minimizar riesgos inevitables;
- evitar negligencia;
- detener conductas inseguras;
- reevaluar cuando una intervención produce daño.

---$B149$,18 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prevenci_n_del_da_o_18','Prevención del daño',$B150$La prevención requiere:

- identificar riesgos;
- aplicar barreras de seguridad;
- verificar;
- supervisar;
- comunicar;
- documentar;
- reevaluar.

La omisión también puede causar daño.

---$B150$,19 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'riesgo_y_beneficio_19','Riesgo y beneficio',$B151$Muchas intervenciones tienen beneficios y riesgos.

La decisión ética exige considerar:

- magnitud del beneficio esperado;
- probabilidad de daño;
- gravedad del daño;
- alternativas;
- preferencias del paciente.

---$B151$,20 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'justicia_concepto_20','Justicia: concepto',$B152$Justicia implica tratar a las personas de manera justa y distribuir beneficios, cargas y recursos con criterios éticamente defendibles.

No significa dar exactamente lo mismo a todos.

---$B152$,21 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'justicia_caracter_sticas_21','Justicia: características',$B153$La justicia exige:

- criterios transparentes;
- ausencia de favoritismo;
- no discriminación;
- prioridad según necesidad cuando corresponda;
- distribución razonable de recursos;
- igualdad moral de las personas.

---$B153$,22 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equidad_y_justicia_22','Equidad y justicia',$B154$**Igualdad:** ofrecer lo mismo.

**Equidad:** adaptar recursos o apoyo según necesidades relevantes.

En salud, la equidad puede exigir más apoyo para quien enfrenta mayores barreras.

---$B154$,23 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'asignaci_n_de_recursos_23','Asignación de recursos',$B155$Cuando los recursos son limitados, las decisiones deben evitar:

- favoritismo;
- castigo moral;
- discriminación;
- criterios arbitrarios.

La enfermera debe aplicar criterios institucionales y clínicos transparentes.

---$B155$,24 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_discriminaci_n_24','No discriminación',$B156$No debe disminuirse la calidad del cuidado por:

- diagnóstico;
- edad;
- pobreza;
- nacionalidad;
- discapacidad;
- identidad;
- religión;
- estilo de vida;
- estigma.

El trato respetuoso es una obligación profesional.

---$B156$,25 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'veracidad_25','Veracidad',$B157$Veracidad significa comunicar información verdadera dentro del ámbito profesional.

Exige:

- no mentir;
- no falsificar;
- no ocultar deliberadamente datos clínicamente relevantes;
- reconocer incertidumbre;
- corregir información errónea.

---$B157$,26 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confidencialidad_26','Confidencialidad',$B158$Confidencialidad significa proteger la información conocida durante el cuidado.

La información se comparte:

- con quienes legítimamente participan;
- en la medida necesaria;
- conforme a ley y política.

No se justifica divulgar por curiosidad.

---$B158$,27 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'privacidad_27','Privacidad',$B159$Privacidad se refiere al control y protección del espacio personal, cuerpo, conversaciones y datos.

Puede vulnerarse aunque no se revele un diagnóstico.

Ejemplos:

- exposición corporal innecesaria;
- conversación audible en pasillo;
- pantalla visible a terceros.

---$B159$,28 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fidelidad_28','Fidelidad',$B160$Fidelidad implica cumplir compromisos propios de la relación profesional.

Incluye:

- mantener confianza;
- cumplir acuerdos razonables;
- realizar lo prometido;
- no abandonar deberes.

---$B160$,29 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_profesional_29','Responsabilidad profesional',$B161$Responsabilidad significa responder por:

- acciones;
- decisiones;
- omisiones;
- cumplimiento de deberes;
- límites de competencia.

Una orden de otro profesional no elimina automáticamente la responsabilidad propia.

---$B161$,30 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rendici_n_de_cuentas_30','Rendición de cuentas',$B162$La rendición de cuentas implica poder explicar y justificar la propia actuación profesional.

Incluye:

- documentar;
- comunicar;
- reconocer errores;
- participar en mejora;
- aceptar supervisión y evaluación.

---$B162$,31 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prudencia_31','Prudencia',$B163$Prudencia significa actuar con juicio, anticipando consecuencias previsibles.

No es pasividad.

Puede exigir:

- detener una acción;
- consultar;
- verificar;
- pedir ayuda;
- escalar una preocupación.

---$B163$,32 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integridad_32','Integridad',$B164$Integridad es coherencia entre valores profesionales y conducta.

Incluye:

- honestidad;
- transparencia;
- rechazo a falsificación;
- consistencia ética;
- evitar conflictos de interés no gestionados.

---$B164$,33 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respeto_cultural_y_pluralismo_33','Respeto cultural y pluralismo',$B165$Las diferencias culturales y religiosas deben respetarse mientras no produzcan daño grave ni contradigan obligaciones legales esenciales.

Enfermería debe evitar:

- imponer creencias personales;
- ridiculizar prácticas;
- asumir preferencias sin preguntar.

---$B165$,34 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'vulnerabilidad_y_protecci_n_34','Vulnerabilidad y protección',$B166$Algunas personas pueden tener mayor riesgo de daño o menor capacidad para defender sus intereses.

Ejemplos:

- niños;
- personas con deterioro cognitivo;
- personas dependientes;
- víctimas de violencia;
- personas con barreras de comunicación.

La protección adicional no debe convertirse automáticamente en paternalismo.

---$B166$,35 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'solidaridad_35','Solidaridad',$B167$Solidaridad reconoce responsabilidad hacia otras personas y comunidades.

En salud puede expresarse mediante:

- apoyo mutuo;
- acción comunitaria;
- respuesta a emergencias;
- protección de poblaciones vulnerables;
- cooperación profesional.

---$B167$,36 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'proporcionalidad_36','Proporcionalidad',$B168$La proporcionalidad pregunta si la carga o riesgo de una intervención guarda relación razonable con el beneficio esperado.

Es útil en:

- cuidados intensivos;
- tratamientos invasivos;
- final de vida;
- medidas restrictivas.

---$B168$,37 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'doble_efecto_uso_prudente_del_concepto_37','Doble efecto: uso prudente del concepto',$B169$Algunas decisiones pueden producir un efecto beneficioso y otro previsible pero no deseado.

El análisis ético exige valorar:

- intención;
- proporcionalidad;
- alternativas;
- riesgo;
- contexto.

No debe usarse como excusa automática para justificar daño.

---$B169$,38 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conflicto_entre_principios_38','Conflicto entre principios',$B170$Ejemplos:

- autonomía vs. beneficencia;
- confidencialidad vs. protección frente a daño;
- justicia vs. preferencia individual;
- beneficencia vs. no maleficencia.

El conflicto requiere deliberación, no selección mecánica de una palabra.

---$B170$,39 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ning_n_principio_funciona_como_regla_autom_tica_39','Ningún principio funciona como regla automática',$B171$Error frecuente:

> “Autonomía siempre gana.”

o:

> “Beneficencia significa hacer lo que el profesional piensa que es mejor.”

Los principios deben ponderarse según hechos, derechos, riesgos, responsabilidades y contexto.

---$B171$,40 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'priorizaci_n_tica_en_enfermer_a_40','Priorización ética en enfermería',$B172$Cuando varias obligaciones compiten, valorar primero:

1. amenaza inmediata a vida/seguridad;
2. derechos y dignidad;
3. voluntad de la persona cuando corresponde;
4. riesgos previsibles;
5. obligaciones profesionales;
6. justicia y disponibilidad de recursos;
7. necesidad de escalar.

---$B172$,41 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seguridad_del_paciente_41','Seguridad del paciente',$B173$La seguridad expresa principalmente:

- no maleficencia;
- beneficencia;
- responsabilidad;
- prudencia.

Una práctica insegura no debe normalizarse por costumbre.

---$B173$,42 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'delegaci_n_y_principios_ticos_42','Delegación y principios éticos',$B174$Antes de delegar:

- valorar complejidad;
- competencia;
- estabilidad del paciente;
- necesidad de supervisión;
- resultado esperado.

Delegar sin condiciones adecuadas puede vulnerar no maleficencia y responsabilidad.

---$B174$,43 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentaci_n_tica_43','Documentación ética',$B175$La documentación debe ser:

- veraz;
- objetiva;
- oportuna;
- pertinente;
- trazable.

Falsificar registros vulnera integridad, veracidad y responsabilidad.

---$B175$,44 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_y_principios_ticos_44','Comunicación y principios éticos',$B176$Una comunicación ética debe:

- respetar dignidad;
- ser comprensible;
- evitar engaño;
- proteger confidencialidad;
- permitir preguntas;
- reconocer incertidumbre.

---$B176$,45 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'trabajo_en_equipo_45','Trabajo en equipo',$B177$Los principios también se aplican entre profesionales.

Incluyen:

- respeto;
- colaboración;
- comunicación segura;
- reconocimiento de límites;
- reporte de riesgos;
- resolución profesional de conflictos.

---$B177$,46 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tecnolog_a_datos_y_tica_46','Tecnología, datos y ética',$B178$El uso de tecnología debe proteger:

- privacidad;
- confidencialidad;
- seguridad;
- dignidad;
- trazabilidad.

La facilidad técnica para acceder a un dato no significa que exista autorización ética para consultarlo o compartirlo.

---$B178$,47 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'principios_ticos_en_investigaci_n_47','Principios éticos en investigación',$B179$En investigación son centrales:

- respeto a personas;
- consentimiento;
- riesgo-beneficio;
- justicia;
- privacidad;
- confidencialidad;
- protección de vulnerables;
- integridad científica.

---$B179$,48 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'principios_ticos_en_salud_p_blica_48','Principios éticos en salud pública',$B180$En salud pública pueden aparecer tensiones entre:

- autonomía individual;
- protección comunitaria;
- justicia;
- proporcionalidad;
- transparencia.

Las restricciones deben justificarse y ser proporcionales al objetivo legítimo.

---$B180$,49 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'principios_ticos_en_administraci_n_de_enfermer_a_49','Principios éticos en administración de enfermería',$B181$La gestión ética exige:

- asignación justa;
- seguridad;
- no discriminación;
- transparencia;
- responsabilidad;
- protección del personal y pacientes;
- uso prudente de recursos.

---$B181$,50 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_50','Integración con el PAE',$B182$**Valoración:** privacidad, respeto y datos suficientes.

**Diagnóstico:** evitar etiquetas discriminatorias.

**Planificación:** incorporar metas y preferencias.

**Ejecución:** actuar con competencia, seguridad y respeto.

**Evaluación:** reconocer resultados, errores y necesidad de ajustar.

---$B182$,51 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'m_todo_pr_ctico_para_aplicar_principios_51','Método práctico para aplicar principios',$B183$Ante un caso:

1. identificar hechos;
2. determinar quiénes están afectados;
3. reconocer derechos y obligaciones;
4. identificar principios en juego;
5. definir riesgos;
6. comparar alternativas;
7. actuar dentro del marco profesional;
8. documentar y reevaluar.

---$B183$,52 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comparaci_n_r_pida_de_principios_52','Comparación rápida de principios',$B184$| Principio | Pregunta guía |
|---|---|
| Dignidad | ¿Estoy tratando a la persona con respeto inherente? |
| Autonomía | ¿Puede participar libre e informadamente? |
| Beneficencia | ¿Qué beneficio razonable busco? |
| No maleficencia | ¿Qué daño debo prevenir? |
| Justicia | ¿El criterio es justo y no discriminatorio? |
| Veracidad | ¿Estoy comunicando con honestidad? |
| Confidencialidad | ¿Estoy protegiendo información privada? |
| Fidelidad | ¿Estoy cumpliendo compromisos profesionales? |
| Responsabilidad | ¿Puedo justificar y responder por mi actuación? |
| Prudencia | ¿He anticipado riesgos previsibles? |

---$B184$,53 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_53','Errores frecuentes de examen',$B185$1. Confundir autonomía con “hacer cualquier cosa que el paciente pida”.
2. Confundir beneficencia con paternalismo.
3. Pensar que no maleficencia significa “no hacer nada”.
4. Confundir justicia con igualdad absoluta.
5. Revelar información a familiares por parentesco.
6. Ejecutar una orden insegura para “obedecer”.
7. Creer que delegar elimina responsabilidad.
8. Considerar la dignidad solo como trato amable.
9. Aplicar un principio sin considerar contexto.
10. Ignorar vulnerabilidad.
11. Ocultar un error para “evitar preocupación”.
12. Suponer que legalidad y ética son idénticas.

---$B185$,54 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_54','Situaciones originales tipo examen',$B186$## Caso 1 — Autonomía
Paciente competente rechaza una intervención después de recibir información suficiente.

**Respuesta:** respetar la decisión, verificar comprensión, comunicar y documentar.

## Caso 2 — Beneficencia
Paciente con dolor intenso no tratado.

**Respuesta:** valorar y activar medidas apropiadas para aliviar sufrimiento.

## Caso 3 — No maleficencia
Orden de medicación contiene una dosis que parece peligrosa.

**Respuesta:** detener la administración hasta verificar.

## Caso 4 — Justicia
Dos pacientes necesitan atención, pero uno presenta amenaza inmediata para la vida.

**Respuesta:** priorizar según necesidad clínica, no por orden social o favoritismo.

## Caso 5 — Confidencialidad
Familiar solicita información sin autorización del paciente adulto.

**Respuesta:** proteger la confidencialidad y verificar autorización.

## Caso 6 — Veracidad
La enfermera detecta que documentó un dato incorrecto.

**Respuesta:** corregir conforme al procedimiento, preservando trazabilidad.

## Caso 7 — Fidelidad
Se prometió volver a reevaluar el dolor en 30 minutos.

**Respuesta:** cumplir la reevaluación o asegurar continuidad si surge una emergencia.

## Caso 8 — Responsabilidad
Una tarea fue delegada y el resultado es anormal.

**Respuesta:** la enfermera responsable debe valorar, intervenir y escalar según corresponda.

## Caso 9 — Prudencia
La enfermera no domina un procedimiento.

**Respuesta:** solicitar ayuda/supervisión antes de ejecutarlo inseguramente.

## Caso 10 — Dignidad
Paciente dependiente necesita higiene.

**Respuesta:** preservar privacidad, explicar y evitar exposición innecesaria.

## Caso 11 — Equidad
Paciente con barrera lingüística no comprende instrucciones.

**Respuesta:** adaptar la comunicación y buscar apoyo adecuado para permitir comprensión.

## Caso 12 — Vulnerabilidad
Persona con deterioro cognitivo muestra signos de posible abuso.

**Respuesta:** priorizar protección, valoración objetiva y rutas institucionales/legales.

## Caso 13 — Tecnología
Profesional consulta la historia de un conocido por curiosidad.

**Respuesta:** impropio; el acceso técnico no autoriza acceso ético.

## Caso 14 — Recursos
Solo existe un recurso inmediato para dos pacientes.

**Respuesta:** aplicar criterios clínicos y transparentes, no favoritismo.

## Caso 15 — Conflicto de principios
Paciente rechaza una medida que el equipo considera beneficiosa.

**Respuesta:** explorar comprensión, valores y riesgos; no sustituir autonomía automáticamente por beneficencia.

## Caso 16 — Seguridad
Una colega realiza una práctica con riesgo inmediato.

**Respuesta:** proteger primero al paciente y escalar por los canales profesionales.

---$B186$,55 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_55','Preguntas rápidas de repaso',$B187$**1. ¿Qué principio protege la capacidad de decidir?**  
Autonomía.

**2. ¿Qué principio busca promover el bien?**  
Beneficencia.

**3. ¿Qué principio exige evitar daño?**  
No maleficencia.

**4. ¿Qué principio se relaciona con trato y distribución justa?**  
Justicia.

**5. ¿Qué protege la información del paciente?**  
Confidencialidad.

**6. ¿Qué exige decir la verdad?**  
Veracidad.

**7. ¿Qué implica cumplir compromisos profesionales?**  
Fidelidad.

**8. ¿Qué obliga a responder por acciones y omisiones?**  
Responsabilidad profesional.

---$B187$,56 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_56','Fuentes y validación',$B188$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

## Panamá

2. **Asociación Nacional de Enfermeras de Panamá (ANEP).** *Código Deontológico para Enfermeras de Panamá.*  
   https://www.anep.org.pa/biblioteca/codigo-deontologico/

## Marco profesional internacional

3. **Consejo Internacional de Enfermeras.** *Código de Ética del CIE para las Enfermeras.* Revisión 2021.  
   https://www.icn.ch/es/recursos/publicaciones-e-informes/codigo-de-etica-del-cie-para-las-enfermeras

## Bioética y derechos humanos

4. **UNESCO.** *Declaración Universal sobre Bioética y Derechos Humanos.* 2005.  
   https://www.unesco.org/en/ethics-science-technology/bioethics-and-human-rights

---$B188$,57 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actualizaciones_y_l_mites_documentales_57','Actualizaciones y límites documentales',$B189$- CICDE no enumera cuáles principios deben memorizarse dentro de ETHICS-03.
- La organización empleada en este material es pedagógica.
- ANEP es la referencia profesional panameña principal del paquete.
- El CIE 2021 complementa el marco profesional internacional.
- UNESCO aporta principios de bioética y derechos humanos.
- Los contenidos específicos del Código Deontológico se desarrollarán en ETHICS-04.
- Los derechos del paciente y la Ley 68 se desarrollarán específicamente en ETHICS-05.

---$B189$,58 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_58','Control de calidad',$B190$Este paquete:

- mantiene el alcance literal CICDE;
- no inventa subtemas oficiales;
- diferencia principios, valores y normas;
- desarrolla autonomía, beneficencia, no maleficencia y justicia;
- añade principios profesionales solo como expansión respaldada;
- integra contexto de enfermería;
- evita presentar un principio como regla absoluta;
- incluye conflictos entre principios;
- contiene 16 situaciones originales;
- no declara revisión humana inexistente.

---$B190$,59 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_59','Estado para integración',$B191$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente las fuentes en `lesson_sources`;
- revisar consistencia con ETHICS-01, ETHICS-02, ETHICS-04 y ETHICS-05.

**Cobertura CICDE ETHICS-03: tema principal cubierto conforme al alcance disponible.**

**Situaciones originales tipo examen: 16.**$B191$,60 FROM tmap WHERE c='ETHICS-03';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B192$El temario CICDE 2026 incluye expresamente:

> **“Código Deontológico de ANEP”.**

Este módulo estudia el **Código Deontológico para Enfermeras de Panamá**, publicado por la Asociación Nacional de Enfermeras de Panamá (ANEP), respetando su estructura general y sus deberes profesionales.

El documento disponible en la biblioteca institucional de ANEP indica como **última revisión y aprobación el período 2014–2017**.

---$B192$,1 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B193$Al finalizar el tema, el estudiante debe poder:

1. Explicar el propósito del Código Deontológico de ANEP.
2. Reconocer su estructura general.
3. Identificar los deberes de enfermería hacia paciente, familia y comunidad.
4. Aplicar las obligaciones sobre privacidad y secreto profesional.
5. Reconocer responsabilidades en delegación, supervisión y ejercicio profesional.
6. Identificar la conducta esperada frente a órdenes dudosas, errores y prácticas inseguras.
7. Reconocer los deberes hacia colegas y otras disciplinas.
8. Explicar la relación profesional con ANEP.
9. Distinguir obligaciones deontológicas de normas legales.
10. Reconocer la función general del Tribunal de Honor y del régimen disciplinario.
11. Aplicar el Código a situaciones tipo examen.

---$B193$,2 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'qu_es_el_c_digo_deontol_gico_de_anep_2','Qué es el Código Deontológico de ANEP',$B194$Es un instrumento profesional que formula **deberes y obligaciones** de la enfermera panameña.

Su finalidad no es solo describir valores deseables.

También establece conductas esperadas en:

- cuidado;
- relación profesional;
- responsabilidad;
- confidencialidad;
- delegación;
- docencia;
- administración;
- relaciones interdisciplinarias;
- vida gremial.

---$B194$,3 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'deontolog_a_y_tica_relaci_n_3','Deontología y ética: relación',$B195$La ética analiza valores, principios y decisiones morales.

La deontología traduce esos fundamentos en **deberes profesionales concretos**.

En ETHICS-04, la pregunta principal ya no es solamente:

> “¿Qué principio está involucrado?”

También es:

> “¿Qué deber profesional establece el Código para la enfermera?”

---$B195$,4 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estructura_general_del_c_digo_4','Estructura general del Código',$B196$El documento se organiza en tres grandes títulos.

## Título I
Principios y valores.

## Título II
Elementos principales del Código y su aplicación:

- paciente, familia y comunidad;
- ejercicio profesional y estudiantes;
- colegas y otras disciplinas;
- relación con la Asociación;
- definiciones relacionadas con principios y valores.

## Título III
Procedimientos disciplinarios, transgresiones, sanciones y recursos.

---$B196$,5 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'antecedentes_hist_ricos_del_c_digo_en_panam__5','Antecedentes históricos del Código en Panamá',$B197$El documento describe una evolución de la ética profesional de enfermería en Panamá.

Entre los hitos que consigna se encuentran:

- incorporación temprana de ética en la formación de enfermería;
- interés gremial por normas de conducta;
- adopción histórica del Código del CIE;
- elaboración y aprobación de códigos nacionales;
- evolución desde “Código de Ética” hacia “Código Deontológico”;
- creación y participación del Tribunal de Honor.

Para el examen interesa comprender la evolución, no memorizar cada fecha salvo que sea expresamente requerida.

---$B197$,6 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tribunal_de_honor_6','Tribunal de Honor',$B198$El Código se vincula con el **Tribunal de Honor de ANEP**.

Su existencia permite que las obligaciones profesionales no sean únicamente declaraciones abstractas.

El Código contempla:

- denuncias;
- investigación/procedimiento;
- derecho de defensa;
- sanciones;
- recursos.

No debe confundirse el procedimiento gremial con un proceso penal o civil.

---$B198$,7 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'t_tulo_i_principios_y_valores_7','Título I: principios y valores',$B199$El Código comienza declarando que el profesional de enfermería adquiere un compromiso ético con el paciente.

Ese compromiso se expresa en:

- proteger;
- buscar el bien;
- defender derechos;
- actuar con veracidad;
- cumplir obligaciones hacia paciente, familia, comunidad y compañeros.

---$B199$,8 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'compromiso_tico_profesional_8','Compromiso ético profesional',$B200$Ser enfermera implica asumir responsabilidades que van más allá de ejecutar técnicas.

La conducta profesional debe integrar:

- conocimiento;
- habilidad;
- responsabilidad;
- valores;
- juicio;
- sentido humano.

---$B200$,9 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'prop_sito_primario_de_la_enfermer_a_9','Propósito primario de la enfermería',$B201$El Código orienta la enfermería hacia una atención integral de la persona, familia y comunidad.

La calidad del cuidado no debe restringirse por características personales o sociales.

---$B201$,10 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidades_fundamentales_10','Responsabilidades fundamentales',$B202$El documento reconoce responsabilidades en:

- promoción de la salud;
- prevención de la enfermedad;
- restauración de la salud;
- alivio del sufrimiento;
- rehabilitación;
- integración social.

Además, ubica responsabilidades en:

- atención;
- docencia;
- administración;
- investigación.

---$B202$,11 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'dignidad_y_derechos_humanos_11','Dignidad y derechos humanos',$B203$La enfermera debe reconocer la dignidad intrínseca de la persona.

Esto se traduce en:

- respeto;
- trato humano;
- protección;
- no discriminación;
- consideración integral de la persona.

---$B203$,12 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'competencia_y_responsabilidad_profesional_12','Competencia y responsabilidad profesional',$B204$El Código relaciona el cumplimiento profesional con:

- competencia;
- habilidad;
- destreza;
- responsabilidad;
- conocimiento;
- conciencia moral.

Una conducta bien intencionada no sustituye la competencia profesional.

---$B204$,13 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'t_tulo_ii_relaci_n_con_paciente_familia_y_comunida_13','Título II: relación con paciente, familia y comunidad',$B205$Este capítulo contiene deberes directamente aplicables al cuidado.

La enfermera debe orientar su práctica hacia:

- bienestar;
- dignidad;
- autonomía;
- privacidad;
- seguridad;
- participación;
- equidad.

---$B205$,14 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'protecci_n_del_bienestar_y_dignidad_14','Protección del bienestar y dignidad',$B206$El Código coloca como responsabilidad primordial proteger y aumentar el bienestar y la dignidad de quienes reciben cuidados.

La dignidad no depende de:

- pronóstico;
- dependencia;
- conducta;
- condición social;
- diagnóstico.

---$B206$,15 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'autonom_a_autorespeto_y_autodeterminaci_n_15','Autonomía, autorespeto y autodeterminación',$B207$La enfermera debe ayudar a la persona a mantener o desarrollar:

- autonomía personal;
- autorespeto;
- autodeterminación.

Esto exige favorecer participación y evitar decisiones paternalistas innecesarias.

---$B207$,16 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'secreto_profesional_16','Secreto profesional',$B208$El Código reconoce el secreto profesional como un derecho del paciente con implicaciones éticas y legales.

La enfermera debe evitar revelar directa o indirectamente información confiada durante la atención.

---$B208$,17 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'privacidad_17','Privacidad',$B209$Proteger privacidad implica más que guardar un diagnóstico.

También incluye:

- conversaciones;
- cuerpo;
- registros;
- datos;
- imágenes;
- información familiar.

---$B209$,18 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derechos_del_paciente_puente_con_ethics_05_18','Derechos del paciente: puente con ETHICS-05',$B210$El Código reconoce expresamente el derecho del paciente a aceptar, rechazar o poner término a la atención de salud y remite a la Ley 68.

Este punto se desarrolla en profundidad en:

**ETHICS-05 — Derechos del paciente.**

Aquí debe memorizarse la relación:

> Código Deontológico → reconoce y protege derechos.  
> Ley 68 → desarrolla el marco legal específico.

---$B210$,19 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'protecci_n_frente_a_pr_cticas_inseguras_19','Protección frente a prácticas inseguras',$B211$La enfermera debe proteger a paciente, familia y comunidad cuando la salud o seguridad sean amenazadas por prácticas:

- deshonestas;
- incompetentes;
- ilegales;
- contrarias a la ética.

La lealtad profesional nunca justifica encubrir peligro.

---$B211$,20 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'inter_s_del_paciente_frente_al_inter_s_personal_20','Interés del paciente frente al interés personal',$B212$El bienestar de la persona atendida debe anteponerse a conveniencias o intereses personales.

Ejemplo:

No retrasar una intervención necesaria porque resulte incómoda para el profesional.

---$B212$,21 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'religi_n_ideolog_a_y_concepto_de_vida_y_muerte_21','Religión, ideología y concepto de vida y muerte',$B213$El Código exige respeto por el concepto que el paciente tenga de la vida y la muerte según sus convicciones.

El respeto debe integrarse con:

- seguridad;
- marco legal;
- competencia profesional.

---$B213$,22 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'no_discriminaci_n_22','No discriminación',$B214$El Código exige brindar cuidados sin discriminación.

La calidad del cuidado no debe disminuir por:

- sexo;
- credo;
- etnia;
- posición política;
- condición socioeconómica;
- naturaleza de la enfermedad.

---$B214$,23 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paciente_en_fase_terminal_23','Paciente en fase terminal',$B215$El Código reconoce a familiares y personas significativas como parte importante de la atención al paciente terminal.

Enfermería debe brindar:

- cuidado;
- apoyo;
- comunicación;
- sostén a la familia.

---$B215$,24 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_y_participaci_n_del_paciente_y_famili_24','Comunicación y participación del paciente y familia',$B216$La enfermera debe favorecer la comunicación entre:

- paciente;
- familia;
- equipo de salud.

El objetivo es facilitar participación en decisiones que afecten a la persona.

---$B216$,25 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'informaci_n_dentro_del_mbito_de_competencia_25','Información dentro del ámbito de competencia',$B217$La enfermera debe informar y orientar sobre cuidados y tratamientos planificados **dentro de su competencia**.

Error frecuente:

Creer que la enfermera debe responder cualquier pregunta médica aunque exceda su ámbito profesional.

---$B217$,26 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'educaci_n_sin_inter_s_comercial_26','Educación sin interés comercial',$B218$Durante la educación al paciente, familia o comunidad, la función profesional no debe convertirse en promoción comercial interesada.

La recomendación educativa debe orientarse al bienestar y a información profesional.

---$B218$,27 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conflictos_laborales_circunstancias_especiales_y_d_27','Conflictos laborales, circunstancias especiales y desastres',$B219$El Código reconoce responsabilidad de mantener cobertura de atención incluso ante circunstancias especiales.

Esto no elimina derechos laborales.

El principio central para examen es que la protección de la comunidad y continuidad segura del cuidado deben considerarse.

---$B219$,28 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'usos_y_costumbres_28','Usos y costumbres',$B220$La enfermera debe respetar usos y costumbres de grupos o comunidades mientras no comprometan la vida.

Esto exige:

- sensibilidad cultural;
- diálogo;
- evitar prejuicios;
- reconocer límites de seguridad.

---$B220$,29 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equidad_y_justicia_social_29','Equidad y justicia social',$B221$El Código atribuye a enfermería responsabilidad en la defensa de:

- equidad;
- justicia social;
- acceso a cuidados;
- distribución de recursos.

---$B221$,30 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_con_poblaciones_vulnerables_30','Responsabilidad con poblaciones vulnerables',$B222$La enfermera comparte responsabilidad con la comunidad en acciones dirigidas a necesidades de salud y sociales, especialmente de poblaciones vulnerables.

---$B222$,31 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cap_tulo_iii_ejercicio_de_la_profesi_n_y_estudiant_31','Capítulo III: ejercicio de la profesión y estudiantes',$B223$Este capítulo traslada los valores a responsabilidades concretas en el trabajo.

Incluye aspectos como:

- responsabilidad profesional;
- delegación;
- confidencialidad;
- errores;
- actualización;
- indicaciones médicas;
- administración;
- estudiantes;
- tecnología.

---$B223$,32 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_legal_y_profesional_32','Responsabilidad legal y profesional',$B224$La enfermera responde por acciones y criterios de atención que se encuentran bajo su control.

No basta decir:

> “Me lo ordenaron.”

Cada profesional debe ejercer juicio dentro de su competencia.

---$B224$,33 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'delegaci_n_y_supervisi_n_33','Delegación y supervisión',$B225$El Código establece que, al delegar actividades al personal colaborador, la enfermera conserva responsabilidad de supervisión.

Antes de delegar debe considerar:

- competencia;
- complejidad;
- riesgo;
- estabilidad del paciente;
- supervisión necesaria.

---$B225$,34 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confidencialidad_dentro_del_equipo_34','Confidencialidad dentro del equipo',$B226$La información puede compartirse dentro del equipo cuando sea necesaria para el cuidado.

El Código indica limitarse a lo que realmente interesa conocer.

Principio práctico:

> acceso profesional ≠ curiosidad profesional.

---$B226$,35 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'reconocimiento_y_manejo_de_errores_35','Reconocimiento y manejo de errores',$B227$El Código exige reconocer los errores propios y utilizar recursos disponibles para evitarlos o subsanarlos.

Ante un error:

1. proteger al paciente;
2. valorar consecuencias;
3. comunicar;
4. actuar para limitar daño;
5. documentar según corresponda;
6. prevenir recurrencia.

---$B227$,36 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actualizaci_n_y_progreso_profesional_36','Actualización y progreso profesional',$B228$La enfermera tiene responsabilidad de mantenerse actualizada en:

- conocimientos;
- habilidades técnicas;
- principios;
- valores.

La competencia profesional requiere aprendizaje continuo.

---$B228$,37 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conocimiento_de_legislaci_n_y_pol_ticas_institucio_37','Conocimiento de legislación y políticas institucionales',$B229$El Código exige conocer y cumplir:

- legislación relacionada con salud;
- normas profesionales;
- políticas de la institución.

El desconocimiento no elimina responsabilidad.

---$B229$,38 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_con_estudiantes_38','Responsabilidad con estudiantes',$B230$La enfermera comparte responsabilidad en la formación de estudiantes.

Debe preocuparse por:

- calidad de enseñanza;
- supervisión;
- conducta ética;
- seguridad del paciente.

Un estudiante no debe recibir tareas sin considerar su nivel de formación y supervisión.

---$B230$,39 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'indicaciones_m_dicas_y_juicio_cr_tico_39','Indicaciones médicas y juicio crítico',$B231$El Código exige colaboración entre medicina y enfermería, pero no obediencia mecánica.

La enfermera debe aplicar juicio crítico.

Si existe razón para creer que una indicación contiene un error, debe aclararse.

---$B231$,40 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'orden_o_indicaci_n_dudosa_40','Orden o indicación dudosa',$B232$Principio tipo examen:

> ante una indicación dudosa, **aclarar antes de ejecutar**.

No se debe administrar o realizar automáticamente una intervención potencialmente dañina.

---$B232$,41 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'equipos_defectuosos_y_acciones_inseguras_41','Equipos defectuosos y acciones inseguras',$B233$El Código indica evitar el uso de equipos defectuosos que puedan producir daño.

Aplicación:

- detener uso;
- proteger al paciente;
- notificar;
- seguir canales institucionales.

---$B233$,42 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'canales_de_escalamiento_42','Canales de escalamiento',$B234$Cuando una situación amenaza seguridad física o moral, el Código contempla utilizar canales apropiados.

Según la naturaleza del problema pueden incluir:

- superior jerárquico;
- organización profesional;
- Tribunal de Honor;
- vías legales correspondientes.

La respuesta debe ser proporcional y documentada.

---$B234$,43 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'conducta_tica_en_cargos_administrativos_43','Conducta ética en cargos administrativos',$B235$Cuando una enfermera ocupa una posición administrativa debe actuar con:

- justicia;
- honestidad;
- autoridad moral;
- respeto;
- confianza.

El cargo no reduce las obligaciones deontológicas.

---$B235$,44 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'evaluaci_n_objetiva_del_personal_44','Evaluación objetiva del personal',$B236$Al evaluar a personal bajo supervisión se debe evitar:

- represalias;
- favoritismo;
- prejuicios.

La evaluación debe favorecer desarrollo personal y profesional.

---$B236$,45 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'uso_de_medios_de_comunicaci_n_45','Uso de medios de comunicación',$B237$Cuando se informe públicamente sobre la profesión deben utilizarse fuentes fidedignas.

La visibilidad pública no autoriza:

- divulgar información protegida;
- hablar sin evidencia;
- atribuir a ANEP opiniones no autorizadas.

---$B237$,46 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'uniforme_e_identidad_profesional_46','Uniforme e identidad profesional',$B238$El Código regula el uso profesional del uniforme y restringe su empleo en actividades que puedan confundir la identidad profesional con fines partidistas, comerciales o de explotación.

Esto no elimina el derecho ciudadano de participación individual.

---$B238$,47 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'salud_del_profesional_47','Salud del profesional',$B239$La enfermera debe mantener un nivel de salud que no comprometa su capacidad para brindar cuidados.

Si una condición afecta seguridad:

- reconocer límites;
- buscar atención;
- solicitar apoyo;
- evitar exponer al paciente.

---$B239$,48 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tecnolog_a_seguridad_y_dignidad_48','Tecnología, seguridad y dignidad',$B240$El Código exige verificar que el uso de tecnología y avances científicos sea compatible con:

- seguridad;
- dignidad;
- derechos de las personas.

Tecnología disponible no significa tecnología éticamente apropiada en toda circunstancia.

---$B240$,49 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'entorno_tico_de_trabajo_49','Entorno ético de trabajo',$B241$La enfermera debe contribuir a crear un ambiente ético y oponerse a prácticas o contextos no éticos.

Esto incluye:

- no normalizar conductas inseguras;
- promover cultura de respeto;
- comunicar riesgos;
- apoyar mejoras.

---$B241$,50 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cap_tulo_iv_colegas_y_otras_disciplinas_50','Capítulo IV: colegas y otras disciplinas',$B242$El Código exige relaciones basadas en:

- respeto mutuo;
- confianza;
- cooperación;
- intercambio profesional;
- calidad del servicio.

---$B242$,51 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respeto_mutuo_entre_colegas_51','Respeto mutuo entre colegas',$B243$No deben utilizarse:

- ataques personales;
- difamación;
- rumores maliciosos;
- desacreditación injustificada.

El desacuerdo profesional debe centrarse en hechos y seguridad.

---$B243$,52 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'privacidad_de_colegas_52','Privacidad de colegas',$B244$La privacidad también se aplica a información personal confiada por colegas.

No debe confundirse respeto a privacidad con encubrir una conducta que pone en peligro al paciente.

---$B244$,53 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actuaci_n_impropia_o_insegura_de_colegas_53','Actuación impropia o insegura de colegas',$B245$Ante práctica impropia, deshonesta, contraria a la ética o error que amenaza al paciente:

**prioridad: proteger al paciente.**

Después:

- comunicar;
- utilizar canales adecuados;
- documentar hechos;
- evitar encubrimiento.

---$B245$,54 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'colaboraci_n_interdisciplinaria_54','Colaboración interdisciplinaria',$B246$La enfermera debe colaborar con otras disciplinas cuando ello beneficie al paciente, familia y comunidad.

La colaboración incluye:

- compartir información relevante;
- respetar competencias;
- integrar recursos;
- coordinar.

---$B246$,55 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'delimitaci_n_de_funciones_55','Delimitación de funciones',$B247$Trabajar en equipo no significa borrar límites profesionales.

Cada disciplina conserva:

- competencias;
- responsabilidades;
- deberes.

La enfermera debe reconocer funciones propias y áreas compartidas.

---$B247$,56 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'tensiones_y_gesti_n_de_conflictos_56','Tensiones y gestión de conflictos',$B248$El Código reconoce que pueden existir tensiones interdisciplinarias.

La respuesta profesional incluye:

- comunicación;
- respeto;
- clarificación de funciones;
- estrategias de manejo del conflicto;
- prioridad en seguridad.

---$B248$,57 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cap_tulo_v_relaci_n_con_anep_57','Capítulo V: relación con ANEP',$B249$El Código también regula deberes hacia la organización profesional.

La participación gremial debe realizarse con:

- dignidad;
- honestidad;
- responsabilidad;
- respeto;
- compromiso profesional.

---$B249$,58 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'participaci_n_gremial_58','Participación gremial',$B250$ANEP no aparece solo como organización administrativa.

El Código relaciona la participación profesional con:

- fortalecimiento de la profesión;
- formación;
- condiciones de trabajo;
- calidad;
- ética;
- derechos humanos.

---$B250$,59 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'informaci_n_p_blica_sobre_la_asociaci_n_59','Información pública sobre la Asociación',$B251$Cuando se emite información pública en nombre de la organización debe utilizarse:

- información auténtica;
- autorización correspondiente;
- comunicación institucional apropiada.

No debe presentarse una opinión personal como posición oficial de ANEP.

---$B251$,60 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comunicaci_n_de_violaciones_al_c_digo_60','Comunicación de violaciones al Código',$B252$El documento establece responsabilidad de informar violaciones al Código por los canales de la Asociación.

La actuación debe basarse en:

- hechos;
- documentación;
- confidencialidad;
- procedimiento.

---$B252$,61 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'ambiente_sano_y_formaci_n_continua_61','Ambiente sano y formación continua',$B253$Entre los deberes gremiales se incluyen:

- promover ambiente saludable;
- favorecer formación continua;
- apoyar estándares de calidad;
- promover lugares de trabajo saludables;
- favorecer derechos humanos y normas éticas.

---$B253$,62 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'definiciones_ticas_incluidas_en_el_c_digo_62','Definiciones éticas incluidas en el Código',$B254$El propio Código contiene definiciones de conceptos como:

- autonomía;
- beneficencia/no maleficencia;
- bioética;
- calidad;
- confiabilidad;
- diligencia;
- fidelidad;
- honestidad.

Estas definiciones deben estudiarse en conexión con ETHICS-01 y ETHICS-03.

---$B254$,63 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'r_gimen_disciplinario_63','Régimen disciplinario',$B255$El Código incluye un sistema para abordar transgresiones.

Esto demuestra que la deontología profesional incluye:

- deberes;
- procedimientos;
- responsabilidad;
- consecuencias.

No debe aprenderse el régimen disciplinario como si sustituyera las leyes del país.

---$B255$,64 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'faltas_y_sanciones_64','Faltas y sanciones',$B256$El documento clasifica faltas disciplinarias por gravedad e incluye sanciones aplicables dentro del ámbito gremial.

Para preparación CICDE interesa reconocer que:

- las faltas tienen distinta gravedad;
- existe procedimiento;
- la sanción no es arbitraria;
- existe documentación.

No es necesario extrapolar estas categorías a sanciones penales o laborales.

---$B256$,65 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derecho_a_defensa_y_recursos_65','Derecho a defensa y recursos',$B257$El procedimiento contempla mecanismos de:

- descargo;
- reconsideración;
- apelación según corresponda.

Principio general:

> la responsabilidad disciplinaria requiere procedimiento y derecho de defensa.

---$B257$,66 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_c_digo_no_sustituye_la_legislaci_n_66','El Código no sustituye la legislación',$B258$La enfermera debe conocer además:

- Constitución;
- leyes vigentes;
- legislación profesional;
- normas institucionales;
- reglamentaciones de enfermería.

Una conducta puede tener simultáneamente consecuencias:

- deontológicas;
- administrativas;
- civiles;
- penales;

dependiendo del caso.

---$B258$,67 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_67','Integración con el PAE',$B259$## Valoración
Proteger privacidad, dignidad y confidencialidad.

## Diagnóstico
Evitar prejuicios y etiquetas impropias.

## Planificación
Incluir necesidades y participación del paciente.

## Ejecución
Actuar dentro de competencia, verificar indicaciones y proteger seguridad.

## Evaluación
Reevaluar resultados, reconocer errores y documentar.

---$B259$,68 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estrategia_cicde_para_ethics_04_68','Estrategia CICDE para ETHICS-04',$B260$Ante una situación:

**Paso 1:** identificar a quién afecta.  
**Paso 2:** identificar el deber profesional.  
**Paso 3:** valorar seguridad y dignidad.  
**Paso 4:** reconocer límites de competencia.  
**Paso 5:** actuar o escalar según corresponda.  
**Paso 6:** documentar y proteger confidencialidad.

---$B260$,69 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_69','Errores frecuentes de examen',$B261$1. Confundir Código Deontológico con Ley 68.
2. Creer que secreto profesional impide compartir información necesaria con el equipo.
3. Ejecutar automáticamente una indicación dudosa.
4. Pensar que delegar elimina responsabilidad.
5. Encubrir una práctica insegura para proteger a una colega.
6. Divulgar información a familiares sin considerar autorización.
7. Utilizar el uniforme para hacer parecer institucional una actividad personal.
8. Evaluar personal con represalias.
9. Creer que actualización profesional es opcional.
10. Suponer que el Código reemplaza la legislación.
11. Ignorar la responsabilidad con estudiantes.
12. Confundir respeto a colegas con silencio ante daño.

---$B261$,70 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_70','Situaciones originales tipo examen',$B262$## Caso 1 — Familiar solicita información
Familiar de paciente adulto pide diagnóstico sin constancia de autorización.

**Respuesta:** proteger secreto profesional y privacidad; verificar autorización y compartir solo lo permitido.

## Caso 2 — Orden dudosa
La enfermera recibe una dosis que parece muy superior a la habitual.

**Respuesta:** aclarar la indicación antes de ejecutarla.

## Caso 3 — Delegación
Se delega una tarea a personal colaborador.

**Respuesta:** la enfermera debe valorar competencia y supervisar el resultado.

## Caso 4 — Error propio
La enfermera detecta que cometió un error.

**Respuesta:** proteger al paciente, reconocerlo, comunicar y utilizar recursos para evitar o limitar daño.

## Caso 5 — Equipo defectuoso
Un equipo muestra fallas pero el servicio está muy ocupado.

**Respuesta:** no utilizarlo si puede causar daño; activar el procedimiento correspondiente.

## Caso 6 — Colega insegura
Una colega realiza una práctica que pone en peligro inmediato al paciente.

**Respuesta:** proteger al paciente y utilizar los canales profesionales apropiados.

## Caso 7 — Redes sociales
Una enfermera publica información clínica que permite identificar a un paciente.

**Respuesta:** vulnera deberes de privacidad y secreto profesional.

## Caso 8 — Estudiante
Un estudiante sin competencia demostrada recibe una tarea compleja sin supervisión.

**Respuesta:** inadecuado; debe garantizarse supervisión y seguridad.

## Caso 9 — Objeción personal
Una enfermera tiene conflicto ético con un procedimiento.

**Respuesta:** comunicar oportunamente al superior para asegurar continuidad de la atención; no abandonar al paciente.

## Caso 10 — Evaluación de personal
Jefatura reduce una evaluación por conflicto personal.

**Respuesta:** contrario al deber de evaluación objetiva y sin represalias.

## Caso 11 — Información innecesaria
Un miembro del equipo pide datos privados que no necesita para el cuidado.

**Respuesta:** no compartir información innecesaria.

## Caso 12 — Cultura
Una práctica cultural no produce daño ni interfiere con seguridad.

**Respuesta:** respetarla e integrarla cuando sea posible.

## Caso 13 — Información pública
Enfermera quiere hablar públicamente en nombre de ANEP sin autorización.

**Respuesta:** no debe presentar una opinión personal como posición oficial de la Asociación.

## Caso 14 — Tecnología
Un dispositivo novedoso compromete privacidad o seguridad.

**Respuesta:** evaluar compatibilidad con derechos, dignidad y seguridad antes de utilizarlo.

## Caso 15 — Desastre
Existe una emergencia comunitaria con gran necesidad asistencial.

**Respuesta:** mantener la responsabilidad profesional de contribuir a cobertura segura conforme a organización y recursos disponibles.

## Caso 16 — Conducta ilegal
Una práctica del equipo parece ilegal y amenaza al paciente.

**Respuesta:** proteger al paciente y escalar mediante los canales pertinentes; el compañerismo no justifica encubrimiento.

---$B262$,71 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_71','Preguntas rápidas de repaso',$B263$**1. ¿Qué enfatiza la deontología?**  
Deberes y obligaciones profesionales.

**2. ¿Qué protege el secreto profesional?**  
La información confiada o conocida durante la atención.

**3. ¿Delegar elimina responsabilidad?**  
No. La enfermera mantiene responsabilidad de supervisión según la tarea y contexto.

**4. ¿Qué hacer ante una indicación dudosa?**  
Aclararla antes de ejecutarla.

**5. ¿Qué hacer ante práctica insegura de un colega?**  
Proteger al paciente y escalar por canales apropiados.

**6. ¿La actualización profesional es un deber?**  
Sí.

**7. ¿El Código sustituye las leyes?**  
No.

**8. ¿Qué organismo gremial participa en los procesos disciplinarios del Código?**  
El Tribunal de Honor de ANEP.

---$B263$,72 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_72','Fuentes y validación',$B264$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

## Fuente primaria del tema

2. **Asociación Nacional de Enfermeras de Panamá (ANEP).** *Código Deontológico para Enfermeras de Panamá.*  
   Documento disponible en la biblioteca oficial de ANEP.  
   https://www.anep.org.pa/books/CODIGO%20DEONTOLOGICO%20NUEVO.pdf

3. **ANEP. Biblioteca institucional.**  
   https://anep.org.pa/biblioteca/

---$B264$,73 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actualizaciones_y_l_mites_documentales_73','Actualizaciones y límites documentales',$B265$- El PDF de ANEP consultado indica que su última revisión/aprobación fue en el período 2014–2017.
- La biblioteca oficial de ANEP continúa publicándolo como **Código Deontológico**.
- El propio Código reproduce referencias históricas del Código del CIE previas a 2021. Para estudiar **ETHICS-04**, estas se conservan como parte del documento de ANEP y no se “corrigen” silenciosamente.
- El Código de Ética del CIE vigente puede utilizarse como complemento contemporáneo, pero no reemplaza el texto panameño de ANEP.
- La Ley 68 se desarrollará específicamente en ETHICS-05.
- Este material resume y organiza el Código para estudio; no sustituye el documento original.

---$B265$,74 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_74','Control de calidad',$B266$Este paquete:

- mantiene el alcance literal CICDE;
- utiliza el Código publicado por ANEP como fuente primaria;
- preserva la estructura principal del documento;
- diferencia deontología de legislación;
- cubre paciente/familia/comunidad;
- cubre ejercicio profesional y estudiantes;
- cubre colegas y otras disciplinas;
- cubre relación con ANEP;
- incorpora Tribunal de Honor y régimen disciplinario;
- evita inventar obligaciones no presentes en la fuente;
- contiene 16 situaciones originales tipo examen;
- no declara revisión humana inexistente.

---$B266$,75 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_75','Estado para integración',$B267$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- registrar revisión humana;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente las fuentes;
- contrastar coherencia con ETHICS-01, ETHICS-02, ETHICS-03 y ETHICS-05.

**Cobertura CICDE ETHICS-04: tema principal cubierto conforme al Código Deontológico publicado por ANEP.**

**Situaciones originales tipo examen: 16.**$B267$,76 FROM tmap WHERE c='ETHICS-04';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alcance_oficial_cicde_0','Alcance oficial CICDE',$B268$El temario CICDE 2026 incluye expresamente:

> **“Derechos del paciente (Ley 68 del 20 noviembre de 2003, que reglamento los derechos y deberes del paciente)”**

La denominación jurídica exacta de la norma es:

**Ley 68 de 20 de noviembre de 2003, que regula los derechos y obligaciones de los pacientes, en materia de información y de decisión libre e informada.**

Este paquete incorpora también:

- su reglamentación mediante **Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012**;
- la modificación del **artículo 38** por la **Ley 33 de 25 de abril de 2013**;
- referencias oficiales recientes que confirman que la Ley 68 continúa formando parte del marco sanitario panameño.

---$B268$,1 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objetivos_de_aprendizaje_1','Objetivos de aprendizaje',$B269$Al finalizar el tema, el estudiante debe poder:

1. Explicar el propósito de la Ley 68.
2. Reconocer al paciente como titular principal de su información clínica.
3. Diferenciar información, decisión libre e informada y consentimiento informado.
4. Identificar el derecho a aceptar o rechazar intervenciones.
5. Proteger confidencialidad y privacidad.
6. Reconocer requisitos básicos del expediente clínico.
7. Comprender la importancia de trazabilidad documental.
8. Explicar el propósito de las voluntades anticipadas.
9. Reconocer obligaciones del paciente.
10. Aplicar el marco legal al rol de enfermería.
11. Distinguir este marco deontológico-legal del contenido del Código de ANEP.
12. Resolver situaciones tipo examen.

---$B269$,2 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'marco_legal_principal_2','Marco legal principal',$B270$El marco central de ETHICS-05 está formado por:

1. **Ley 68 de 2003.**
2. **Decreto Ejecutivo 1458 de 2012.**
3. **Ley 33 de 2013**, que modifica el artículo 38.
4. Normas sanitarias posteriores que continúan utilizando la Ley 68 como fundamento legal.

---$B270$,3 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'objeto_de_la_ley_68_3','Objeto de la Ley 68',$B271$La Ley 68 regula derechos y obligaciones relacionados con:

- pacientes;
- personas sanas;
- profesionales;
- centros y servicios de salud públicos y privados.

Su eje es:

- información;
- autonomía;
- decisión libre e informada;
- confidencialidad;
- documentación clínica.

---$B271$,4 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'_mbito_de_aplicaci_n_4','Ámbito de aplicación',$B272$No es una norma exclusiva de hospitales públicos.

Su alcance incluye servicios:

- públicos;
- privados;
- ambulatorios;
- hospitalarios;
- de urgencia;

dentro del marco asistencial definido por la legislación panameña.

---$B272$,5 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'principios_generales_5','Principios generales',$B273$La norma protege especialmente:

- autonomía;
- información;
- confidencialidad;
- privacidad;
- participación en decisiones;
- documentación;
- libre elección entre opciones presentadas.

---$B273$,6 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_paciente_como_titular_de_la_informaci_n_6','El paciente como titular de la información',$B274$La información sobre el estado de salud pertenece primariamente al paciente.

Consecuencia práctica:

> un familiar no se convierte automáticamente en titular de la información por el solo hecho del parentesco.

---$B274$,7 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derecho_a_la_informaci_n_7','Derecho a la información',$B275$El paciente tiene derecho a recibir información sobre su estado de salud y el proceso asistencial.

La información debe permitirle participar en decisiones.

---$B275$,8 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'caracter_sticas_de_la_informaci_n_8','Características de la información',$B276$La información debe ser:

- verdadera;
- comprensible;
- adecuada a las necesidades del paciente;
- suficiente para la decisión;
- compatible con su contexto intelectual, emocional y cultural.

Información técnicamente correcta pero incomprensible no cumple adecuadamente su función.

---$B276$,9 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derecho_a_no_ser_informado_9','Derecho a no ser informado',$B277$La normativa reconoce que una persona puede manifestar que no desea recibir determinada información sobre su estado de salud.

Esta decisión debe:

- respetarse dentro del marco aplicable;
- quedar documentada;
- manejarse cuidadosamente cuando exista riesgo o necesidad legal de información.

---$B277$,10 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'informaci_n_a_familiares_y_allegados_10','Información a familiares y allegados',$B278$Las personas vinculadas al paciente pueden recibir información en la medida en que:

- el paciente lo permita;
- exista representación válida;
- concurra una situación contemplada por la normativa.

El parentesco por sí solo no equivale a autorización universal.

---$B278$,11 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_del_m_dico_responsable_11','Responsabilidad del médico responsable',$B279$La reglamentación atribuye al médico responsable un papel central para garantizar el derecho a la información.

Esto incluye asegurar que el proceso informativo sea adecuado y quede documentado.

---$B279$,12 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rol_de_enfermer_a_en_el_proceso_de_informaci_n_12','Rol de enfermería en el proceso de información',$B280$La enfermera debe:

- explicar cuidados dentro de su ámbito;
- verificar comprensión;
- identificar dudas;
- facilitar preguntas;
- comunicar necesidades de aclaración;
- no ofrecer información diagnóstica o pronóstica fuera de su competencia;
- documentar la educación y orientación brindadas.

---$B280$,13 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'decisi_n_libre_e_informada_13','Decisión libre e informada',$B281$Una decisión es libre e informada cuando la persona:

- recibe información suficiente;
- comprende razonablemente;
- puede elegir;
- no es sometida a coerción indebida.

---$B281$,14 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'consentimiento_informado_14','Consentimiento informado',$B282$El Decreto 1458 define el consentimiento informado como documento que acredita por escrito la voluntad libre y consciente del paciente o representante, después de recibir información adecuada, en las situaciones que así lo requieren.

---$B282$,15 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_que_requieren_consentimiento_escrito_15','Situaciones que requieren consentimiento escrito',$B283$La reglamentación lo contempla, entre otros, para:

- intervenciones quirúrgicas;
- procedimientos diagnósticos invasores;
- procedimientos que pueden afectar significativamente la salud.

Debe seguirse además la normativa específica aplicable a cada procedimiento.

---$B283$,16 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'el_consentimiento_no_es_solo_una_firma_16','El consentimiento no es solo una firma',$B284$Error frecuente:

> “Si firmó, ya está informado.”

El consentimiento es un **proceso**.

La firma documenta una decisión, pero no sustituye:

- información;
- comprensión;
- voluntariedad.

---$B284$,17 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'voluntariedad_y_ausencia_de_coerci_n_17','Voluntariedad y ausencia de coerción',$B285$La persona debe decidir sin:

- amenazas;
- engaño;
- presión indebida;
- manipulación.

Explicar riesgos no equivale a coaccionar.

---$B285$,18 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comprensi_n_18','Comprensión',$B286$Antes de asumir que el paciente comprendió:

- usar lenguaje apropiado;
- permitir preguntas;
- verificar entendimiento;
- adaptar comunicación si existen barreras.

---$B286$,19 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'revocaci_n_y_rechazo_19','Revocación y rechazo',$B287$Aceptar inicialmente una intervención no significa renunciar para siempre a la autonomía.

El paciente puede manifestar rechazo o cambio de decisión dentro del marco legal y clínico aplicable.

---$B287$,20 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'decisi_n_por_representaci_n_20','Decisión por representación',$B288$Cuando el paciente no puede decidir por sí mismo, puede intervenir un representante conforme a la ley y la situación clínica.

La representación debe orientarse al interés y voluntad del paciente, no a intereses personales del representante.

---$B288$,21 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'menores_de_edad_21','Menores de edad',$B289$Las decisiones en menores requieren considerar:

- representación legal;
- edad y madurez;
- urgencia;
- interés superior;
- normativa específica aplicable.

La participación del menor debe favorecerse según capacidad de comprensión.

---$B289$,22 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'paciente_sin_capacidad_para_decidir_22','Paciente sin capacidad para decidir',$B290$No debe asumirse incapacidad únicamente por diagnóstico o edad.

Cuando el paciente realmente no puede comprender o decidir, se aplican las reglas de representación y protección previstas.

---$B290$,23 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'urgencia_y_necesidad_terap_utica_23','Urgencia y necesidad terapéutica',$B291$En situaciones de urgencia vital o necesidad terapéutica pueden existir excepciones al proceso ordinario de consentimiento.

La situación y la justificación deben quedar documentadas.

---$B291$,24 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'confidencialidad_24','Confidencialidad',$B292$La confidencialidad protege la información de salud contra acceso o divulgación no autorizados.

Obliga a quienes acceden por razón de sus funciones.

---$B292$,25 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'art_culos_13_y_14_confidencialidad_y_protecci_n_de_25','Artículos 13 y 14: confidencialidad y protección de datos',$B293$La Ley 68 establece que la persona tiene derecho a que se respete la confidencialidad de los datos relacionados con su salud y que los centros sanitarios deben adoptar medidas para protegerlos.

Esto exige:

- control de acceso;
- políticas;
- procedimientos;
- custodia.

---$B293$,26 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acceso_m_nimo_necesario_26','Acceso mínimo necesario',$B294$Dentro del equipo de salud, el acceso debe limitarse a la información necesaria para cumplir la función asistencial o administrativa legítima.

---$B294$,27 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'parentesco_no_equivale_a_autorizaci_n_27','Parentesco no equivale a autorización',$B295$Caso clásico de examen:

Un familiar pide resultados de un paciente adulto competente.

**Conducta:** verificar autorización antes de divulgar.

---$B295$,28 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'expediente_cl_nico_28','Expediente clínico',$B296$El expediente clínico reúne documentación de valor médico-legal sobre el proceso asistencial.

Permite conocer:

- valoración;
- evolución;
- intervenciones;
- responsables;
- decisiones;
- resultados.

---$B296$,29 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'contenido_del_expediente_cl_nico_29','Contenido del expediente clínico',$B297$Según la reglamentación, puede incorporar, según el caso:

- identificación;
- antecedentes;
- historia clínica;
- examen físico;
- procedimientos;
- resultados;
- curso clínico;
- tratamientos;
- consentimientos;
- informes;
- altas;
- documentación de otros profesionales.

---$B297$,30 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'registros_de_enfermer_a_30','Registros de enfermería',$B298$Las notas de enfermería forman parte de la documentación asistencial.

Deben registrar:

- valoración;
- intervención;
- respuesta;
- educación;
- comunicación relevante;
- reevaluación.

---$B298$,31 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'trazabilidad_e_identificaci_n_profesional_31','Trazabilidad e identificación profesional',$B299$La documentación debe permitir identificar quién realizó cada registro.

Regla práctica:

- fecha;
- hora cuando corresponda;
- identificación profesional;
- contenido claro.

---$B299$,32 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'art_culo_38_actualizado_por_ley_33_de_2013_32','Artículo 38 actualizado por Ley 33 de 2013',$B300$La Ley 33 de 2013 modificó el artículo 38 de la Ley 68.

La actualización reconoce expresamente expedientes en:

- papel;
- soporte audiovisual;
- soporte informático.

También exige garantizar:

- autenticidad;
- reproducibilidad;
- registro de cambios;
- identificación de quienes realizan modificaciones.

---$B300$,33 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'expediente_cl_nico_digital_33','Expediente clínico digital',$B301$El expediente digital no elimina las obligaciones del expediente tradicional.

Debe garantizar:

- integridad;
- seguridad;
- validez;
- autenticidad;
- control de acceso;
- trazabilidad.

---$B301$,34 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integridad_y_autenticidad_34','Integridad y autenticidad',$B302$Un expediente no debe permitir modificaciones invisibles.

Toda modificación debe poder atribuirse y rastrearse.

Nunca debe:

- borrar un error para ocultarlo;
- reescribir retrospectivamente sin trazabilidad;
- falsificar una intervención.

---$B302$,35 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'acceso_del_paciente_a_su_expediente_35','Acceso del paciente a su expediente',$B303$El paciente puede solicitar información clínica y copia de su expediente conforme al procedimiento establecido.

Los servicios deben facilitar mecanismos adecuados para ejercer este derecho.

---$B303$,36 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'solicitud_de_informaci_n_cl_nica_36','Solicitud de información clínica',$B304$La reglamentación desarrolla requisitos para solicitudes de información y representación.

Para examen, el principio central es:

> el paciente puede ejercer su derecho de acceso y la institución debe verificar identidad, legitimidad y alcance de la solicitud.

---$B304$,37 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'custodia_del_expediente_37','Custodia del expediente',$B305$La institución tiene responsabilidad de:

- conservar;
- proteger;
- evitar pérdida;
- impedir accesos indebidos;
- preservar integridad.

---$B305$,38 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'accesos_autorizados_y_excepciones_38','Accesos autorizados y excepciones',$B306$Existen situaciones en las que el acceso puede permitirse sin constituir una divulgación arbitraria, siempre dentro del marco legal.

Pueden incluir:

- autoridad competente;
- salud pública;
- investigación judicial;
- inspección sanitaria;
- investigación científica bajo condiciones de protección.

---$B306$,39 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'investigaci_n_y_docencia_39','Investigación y docencia',$B307$El uso de información clínica para investigación o docencia exige protección de identidad y cumplimiento del marco ético y legal correspondiente.

---$B307$,40 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'inspecci_n_y_autoridad_sanitaria_40','Inspección y autoridad sanitaria',$B308$El personal autorizado de la autoridad sanitaria puede acceder a expedientes dentro de sus funciones legales de inspección y control.

Esto no significa acceso irrestricto para cualquier funcionario.

---$B308$,41 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documento_de_voluntades_anticipadas_41','Documento de voluntades anticipadas',$B309$La Ley 68 contempla un documento mediante el cual una persona expresa previamente sus deseos sobre actuaciones médicas para una situación futura en la que no pueda expresar su voluntad.

---$B309$,42 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'contenido_de_voluntades_anticipadas_42','Contenido de voluntades anticipadas',$B310$Puede incluir decisiones sobre:

- actuaciones médicas;
- situaciones críticas e irreversibles;
- medidas paliativas;
- rechazo de prolongación artificial desproporcionada;
- designación de representante;
- donación de órganos conforme a la norma.

---$B310$,43 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'formalizaci_n_43','Formalización',$B311$La Ley establece mecanismos formales para otorgar el documento de voluntades anticipadas.

Entre ellos:

- ante notario;
- ante testigos, cumpliendo requisitos legales.

---$B311$,44 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'l_mites_de_las_voluntades_anticipadas_44','Límites de las voluntades anticipadas',$B312$No deben aplicarse instrucciones:

- contrarias al ordenamiento jurídico;
- contrarias a buena práctica clínica;
- incompatibles con evidencia disponible;
- que no correspondan a la situación prevista.

La razón debe documentarse.

---$B312$,45 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'incorporaci_n_al_expediente_45','Incorporación al expediente',$B313$El documento debe incorporarse al expediente clínico para que el equipo pueda conocerlo y respetarlo cuando corresponda.

---$B313$,46 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'cuidados_paliativos_46','Cuidados paliativos',$B314$La normativa reconoce cuidados orientados al control de:

- dolor;
- otros síntomas;
- necesidades psicosociales;
- necesidades espirituales;

en enfermedad avanzada y progresiva.

---$B314$,47 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'eutanasia_l_mite_legal_47','Eutanasia: límite legal',$B315$La Ley 68 prohíbe la eutanasia.

Esto debe diferenciarse de:

- cuidados paliativos;
- limitación de medidas desproporcionadas;
- voluntades anticipadas dentro de la ley.

---$B315$,48 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'derechos_y_obligaciones_48','Derechos y obligaciones',$B316$La Ley no regula únicamente derechos.

También establece obligaciones para:

- pacientes;
- profesionales;
- instituciones.

---$B316$,49 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'obligaciones_del_paciente_49','Obligaciones del paciente',$B317$El paciente debe colaborar con el proceso asistencial.

Entre las obligaciones relevantes está proporcionar información veraz sobre su estado y antecedentes dentro de sus posibilidades.

---$B317$,50 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'veracidad_de_la_informaci_n_suministrada_50','Veracidad de la información suministrada',$B318$Información incompleta o falsa puede afectar:

- diagnóstico;
- tratamiento;
- seguridad.

La comunicación debe ser honesta en ambos sentidos.

---$B318$,51 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'colaboraci_n_con_el_proceso_asistencial_51','Colaboración con el proceso asistencial',$B319$El paciente debe cooperar razonablemente con las medidas acordadas y con el funcionamiento del servicio, respetando su derecho a decidir.

---$B319$,52 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'respeto_de_normas_institucionales_52','Respeto de normas institucionales',$B320$Los derechos del paciente no significan que pueda ignorar cualquier norma de seguridad o convivencia de una instalación de salud.

---$B320$,53 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'alta_voluntaria_53','Alta voluntaria',$B321$Cuando una persona decide abandonar una atención contra recomendación, debe seguirse el proceso previsto:

- información;
- valoración de capacidad;
- explicación de riesgos;
- documentación;
- instrucciones de seguridad cuando sea posible.

---$B321$,54 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'rechazo_de_tratamiento_54','Rechazo de tratamiento',$B322$Un rechazo informado no debe confundirse con abandono del paciente.

La enfermera debe continuar brindando los cuidados que correspondan y comunicar la decisión.

---$B322$,55 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'documentaci_n_del_rechazo_55','Documentación del rechazo',$B323$Registrar:

- información brindada;
- decisión;
- comprensión;
- comunicación al equipo;
- conducta posterior.

---$B323$,56 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'elecci_n_y_opciones_terap_uticas_56','Elección y opciones terapéuticas',$B324$La Ley protege la autonomía respecto de opciones de tratamiento presentadas.

Esto exige que la decisión sea real y no meramente formal.

---$B324$,57 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'comit_de_bio_tica_asistencial_57','Comité de Bioética Asistencial',$B325$El Decreto 1458 define el Comité de Bioética Asistencial como grupo interdisciplinario que ayuda a reflexionar sobre conflictos éticos de la asistencia clínica.

No sustituye:

- la decisión legal competente;
- el juicio clínico;
- los tribunales.

---$B325$,58 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'deliberaci_n_en_conflictos_58','Deliberación en conflictos',$B326$Puede ser útil cuando existen conflictos complejos entre:

- paciente;
- familia;
- equipo;
- valores;
- tratamientos;
- proporcionalidad.

---$B326$,59 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_de_los_profesionales_59','Responsabilidad de los profesionales',$B327$Cada profesional responde por su participación dentro de su ámbito.

El trabajo en equipo no elimina responsabilidad individual.

---$B327$,60 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'responsabilidad_espec_fica_de_enfermer_a_60','Responsabilidad específica de enfermería',$B328$La enfermera debe:

- respetar derechos;
- proteger confidencialidad;
- documentar;
- favorecer comprensión;
- verificar consentimientos cuando corresponda al proceso;
- comunicar cambios;
- no actuar fuera de competencia.

---$B328$,61 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'seguridad_del_paciente_61','Seguridad del paciente',$B329$Los derechos del paciente incluyen atención compatible con seguridad y dignidad.

Una decisión administrativa no debe justificar prácticas inseguras.

---$B329$,62 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'error_asistencial_62','Error asistencial',$B330$Ante un error:

1. proteger al paciente;
2. valorar;
3. comunicar;
4. seguir protocolos;
5. documentar con veracidad;
6. evitar ocultamiento.

---$B330$,63 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'privacidad_f_sica_63','Privacidad física',$B331$Además de los datos, debe protegerse:

- cuerpo;
- conversaciones;
- procedimientos;
- espacios.

---$B331$,64 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'redes_sociales_e_im_genes_64','Redes sociales e imágenes',$B332$No publicar:

- fotografías;
- videos;
- diagnósticos;
- historias;

cuando puedan identificar al paciente sin autorización válida y fundamento legítimo.

Eliminar el nombre no siempre garantiza anonimato.

---$B332$,65 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'telesalud_y_derechos_del_paciente_65','Telesalud y derechos del paciente',$B333$La atención por medios digitales no elimina:

- consentimiento;
- confidencialidad;
- documentación;
- seguridad;
- responsabilidad.

La legislación posterior sobre telesalud debe aplicarse de forma compatible con el marco de derechos del paciente.

---$B333$,66 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'protecci_n_de_datos_de_salud_66','Protección de datos de salud',$B334$Los datos de salud requieren un nivel alto de protección.

La regla práctica para enfermería:

> acceder solo cuando exista una razón profesional legítima y compartir solo lo necesario.

---$B334$,67 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'relaci_n_con_c_digo_deontol_gico_anep_67','Relación con Código Deontológico ANEP',$B335$El Código de ANEP exige proteger:

- autonomía;
- privacidad;
- secreto profesional;
- seguridad;
- dignidad.

La Ley 68 aporta el marco legal específico.

---$B335$,68 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'integraci_n_con_el_pae_68','Integración con el PAE',$B336$## Valoración
Obtener datos respetando privacidad y explicando propósito.

## Diagnóstico
Evitar juicios discriminatorios.

## Planificación
Incorporar preferencias y decisiones.

## Ejecución
Respetar consentimiento, competencia y seguridad.

## Evaluación
Reevaluar respuesta, documentar y comunicar.

---$B336$,69 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estrategia_cicde_para_ethics_05_69','Estrategia CICDE para ETHICS-05',$B337$Ante un caso:

**Paso 1:** ¿Quién es titular de la información?  
**Paso 2:** ¿El paciente puede decidir?  
**Paso 3:** ¿Existe información suficiente?  
**Paso 4:** ¿Se requiere consentimiento?  
**Paso 5:** ¿Hay riesgo inmediato?  
**Paso 6:** ¿Qué debe documentarse?  
**Paso 7:** ¿Existe deber de confidencialidad o una excepción legal?

---$B337$,70 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'errores_frecuentes_de_examen_70','Errores frecuentes de examen',$B338$1. Pensar que un familiar tiene acceso automático a toda la información.
2. Confundir consentimiento con una firma.
3. Informar fuera del ámbito profesional.
4. Compartir datos por curiosidad.
5. Creer que un expediente digital puede modificarse sin trazabilidad.
6. Ignorar el derecho a rechazar una intervención.
7. Ocultar un error.
8. Confundir cuidados paliativos con eutanasia.
9. Asumir incapacidad por edad o diagnóstico.
10. No documentar la negativa del paciente.
11. Entregar información sin verificar legitimidad.
12. Pensar que la Ley 68 solo aplica al sector público.

---$B338$,71 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'situaciones_originales_tipo_examen_71','Situaciones originales tipo examen',$B339$## Caso 1 — Familiar
La hija de un paciente adulto pide resultados sin autorización.

**Respuesta:** proteger confidencialidad y verificar autorización.

## Caso 2 — Firma sin comprensión
Paciente firma un consentimiento pero dice que nadie le explicó el procedimiento.

**Respuesta:** detener y asegurar que reciba información adecuada antes de continuar.

## Caso 3 — Rechazo
Paciente competente rechaza una intervención.

**Respuesta:** verificar comprensión, respetar la decisión dentro del marco legal, comunicar y documentar.

## Caso 4 — Derecho a no saber
Paciente expresa que no desea recibir determinada información.

**Respuesta:** documentar su voluntad y actuar conforme a la normativa y situación clínica.

## Caso 5 — Orden insegura
La enfermera detecta una indicación que parece peligrosa.

**Respuesta:** aclarar antes de ejecutar; la seguridad y responsabilidad profesional permanecen.

## Caso 6 — Redes sociales
Se publica una imagen “sin nombre”, pero permite identificar al paciente.

**Respuesta:** puede vulnerar privacidad y confidencialidad.

## Caso 7 — Expediente digital
Profesional modifica una nota antigua sin dejar rastro.

**Respuesta:** incorrecto; debe preservarse trazabilidad.

## Caso 8 — Estudiante
Estudiante accede al expediente de un paciente que no participa en su actividad docente.

**Respuesta:** acceso no justificado.

## Caso 9 — Investigación
Investigador solicita expedientes para un estudio.

**Respuesta:** debe cumplir autorización, ética, confidencialidad y condiciones legales de acceso.

## Caso 10 — Urgencia
Paciente inconsciente llega con riesgo vital y no hay representante disponible.

**Respuesta:** activar atención de urgencia conforme al marco aplicable y documentar la situación.

## Caso 11 — Voluntad anticipada
Paciente tiene documento válido incorporado al expediente.

**Respuesta:** debe considerarse y respetarse dentro de sus límites legales y clínicos.

## Caso 12 — Alta voluntaria
Paciente capaz desea retirarse pese a recomendación médica.

**Respuesta:** explicar riesgos, documentar y mantener orientación de seguridad; no retener arbitrariamente.

## Caso 13 — Información innecesaria
Empleado administrativo consulta diagnóstico por curiosidad.

**Respuesta:** acceso improcedente.

## Caso 14 — Menor
Adolescente comprende la situación y quiere participar en decisiones.

**Respuesta:** favorecer su participación según edad, madurez y marco legal, sin ignorar la representación correspondiente.

## Caso 15 — Error
La enfermera administra una dosis incorrecta.

**Respuesta:** valorar al paciente primero, comunicar y documentar de forma veraz.

## Caso 16 — Imagen clínica
Equipo desea usar una fotografía del paciente en docencia.

**Respuesta:** requiere cumplir autorización, privacidad y procedimiento correspondiente.

## Caso 17 — Paciente fallecido
Un familiar solicita copia del expediente.

**Respuesta:** verificar legitimidad conforme al procedimiento legal; el fallecimiento no elimina automáticamente la confidencialidad.

## Caso 18 — Cuidados paliativos
Paciente con enfermedad irreversible solicita control de síntomas y evitar medidas desproporcionadas conforme a su voluntad anticipada.

**Respuesta:** diferenciar cuidado paliativo y limitación proporcionada de la eutanasia, que está prohibida por la Ley 68.

---$B339$,72 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'preguntas_r_pidas_de_repaso_72','Preguntas rápidas de repaso',$B340$**1. ¿Cuál es la norma principal?**  
Ley 68 de 20 de noviembre de 2003.

**2. ¿Qué norma la reglamenta?**  
Decreto Ejecutivo 1458 de 2012.

**3. ¿Qué ley modificó su artículo 38?**  
Ley 33 de 25 de abril de 2013.

**4. ¿Quién es titular principal de la información clínica?**  
El paciente.

**5. ¿Consentimiento informado equivale solo a firma?**  
No.

**6. ¿Puede un familiar recibir automáticamente toda la información?**  
No.

**7. ¿Puede usarse expediente electrónico?**  
Sí, con autenticidad, seguridad, integridad y trazabilidad.

**8. ¿La Ley 68 permite eutanasia?**  
No.

---$B340$,73 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'fuentes_y_validaci_n_73','Fuentes y validación',$B341$## Fuente rectora

1. **IV Consejo Interinstitucional de Certificación Básica de Enfermería.** *Lineamientos para el Examen de Competencias de Profesionales de Enfermería*. Panamá, 2026.

## Panamá — marco legal principal

2. **Ley 68 de 20 de noviembre de 2003.** Que regula los derechos y obligaciones de los pacientes, en materia de información y de decisión libre e informada. Gaceta Oficial No. 24935, 25 de noviembre de 2003.

3. **Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012.** Reglamenta la Ley 68 de 2003. Gaceta Oficial No. 27160-A, 9 de noviembre de 2012.

4. **Ley 33 de 25 de abril de 2013.** Modifica el artículo 38 de la Ley 68, en materia de expediente clínico y soporte electrónico.

## Fuente profesional

5. **Asociación Nacional de Enfermeras de Panamá.** *Código Deontológico para Enfermeras de Panamá.*

---$B341$,74 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'actualizaciones_y_l_mites_documentales_74','Actualizaciones y límites documentales',$B342$- La **Ley 68 continúa siendo citada en normativa oficial MINSA de 2026**.
- El registro oficial de la Procuraduría la identifica con vigencia desde su promulgación y documenta que fue **modificada parcialmente** por la Ley 33 de 2013.
- El **artículo 38** no debe estudiarse únicamente en su versión original de 2003.
- El Decreto 1458 de 2012 desarrolla procedimientos y definiciones para aplicar la Ley.
- Este material es una síntesis educativa; en una controversia legal real debe consultarse el texto vigente completo y asesoría jurídica competente.
- No se han inventado artículos, plazos o requisitos cuando no pudieron verificarse directamente.

---$B342$,75 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'control_de_calidad_75','Control de calidad',$B343$Este paquete:

- mantiene el alcance CICDE;
- utiliza la Ley 68 como fuente principal;
- incorpora su reglamentación;
- incorpora la modificación del artículo 38;
- confirma uso vigente del marco en 2026;
- diferencia información, consentimiento y decisión;
- cubre confidencialidad y expediente clínico;
- cubre voluntades anticipadas;
- integra rol de enfermería;
- diferencia cuidados paliativos de eutanasia;
- contiene 18 situaciones originales tipo examen;
- no declara revisión humana inexistente.

---$B343$,76 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sections (lesson_id,section_key,title,body,sort_order) SELECT l,'estado_para_integraci_n_76','Estado para integración',$B344$**Estado:** `REVIEW`

Antes de `VERIFIED`:

- revisión humana legal/académica;
- registrar `reviewed_by`;
- registrar `reviewed_at`;
- vincular formalmente fuentes;
- verificar consistencia final con ETHICS-01 a ETHICS-04.

**Cobertura CICDE ETHICS-05: tema principal cubierto.**

**Situaciones originales tipo examen: 18.**$B344$,77 FROM tmap WHERE c='ETHICS-05';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='ETHICS-01' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-01' AND s.c='Código Deontológico para Enfermeras de Panamá';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-01' AND s.c='Código de Ética del CIE para las Enfermeras';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-01' AND s.c='Declaración Universal sobre Bioética y Derechos Humanos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-01' AND s.c='Valores y ética en el área de la salud';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Código Deontológico para Enfermeras de Panamá';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Código de Ética del CIE para las Enfermeras';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Declaración Universal sobre Bioética y Derechos Humanos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Ley 68 de 20 de noviembre de 2003';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Decreto Ejecutivo 1458 de 6 de noviembre de 2012';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-02' AND s.c='Valores y ética en el área de la salud';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='ETHICS-03' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-03' AND s.c='Código Deontológico para Enfermeras de Panamá';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-03' AND s.c='Código de Ética del CIE para las Enfermeras';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-03' AND s.c='Declaración Universal sobre Bioética y Derechos Humanos';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='ETHICS-04' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-04' AND s.c='Código Deontológico para Enfermeras de Panamá';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-04' AND s.c='Biblioteca de la Asociación Nacional de Enfermeras de Panamá';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,true FROM tmap t, smap s WHERE t.c='ETHICS-05' AND s.c='Lineamientos para el Examen de Competencias de Profesionales de Enfermería';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-05' AND s.c='Ley 68 de 20 de noviembre de 2003';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-05' AND s.c='Decreto Ejecutivo No. 1458 de 6 de noviembre de 2012';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-05' AND s.c='Ley 33 de 25 de abril de 2013';
INSERT INTO lesson_sources (lesson_id,source_id,is_primary) SELECT t.l,s.s,false FROM tmap t, smap s WHERE t.c='ETHICS-05' AND s.c='Código Deontológico para Enfermeras de Panamá';

COMMIT;