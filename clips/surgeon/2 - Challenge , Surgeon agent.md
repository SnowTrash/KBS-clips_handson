# Run it

Para correr el programa cargamos los archivos dentro de clips
(load ../KBS-clips_handson/clips/surgeon/templates.clp)
(load ../KBS-clips_handson/clips/surgeon/facts.clp)
(load ../KBS-clips_handson/clips/surgeon/rules.clp)
(reset)
(run) ---->
 (: 

# Surgeon - Agent KBS

Para comenzar a trabajar con ello debemos definir 
nuestro resultado esperado y la problematica a enfrentar
queremos una lista de pasos y acciones a seguir obtenidas
del procesamiento de la información sobre una intervención
quirúrgica específica, para ello debemos conocer un poco acerca
de los pasos que se deben llevar a cabo y comenzar el modelado
de las reglas y facts que darán como resultado la lista de
pasos dependiendo la intervención.

### algunas páginas coinciden (tienen la misma informacion) sobree las cirugias más comnunes en méxico

Reducción abierta de fractura con fijación interna, fémur.
Laparotomía exploradora.
Salpingooforectomía unilateral.
Herniorrafía umbilical abierta.
Reparación unilateral de hernia inguinal.
Apendicectomía.
Incisión de piel y tejido subcutáneo.(muchas de las otras necesitan que esto pase)
Extirpación local o destrucción de lesión o tejido de piel y tejido subcutáneo.
Sustitución de derivación ventricular.
Reducción abierta de fractura con fijación interna, húmero.


#### Rutinas Pre-operatorias?

Descartar diversos padecimientos antes de operar en cualquier operación 

0.- Dar una respuesta distinta para cada cirugía pero siguiendo una base 
compartida, que son rutinarias independiente a la cirugía que se 
realiza y generalizar, acciones de las que solo dependa el IMC
o sexo de la persona a intervenir y no el paadecimiento directamente.


1.- un proveedor de atención médica tomará su historia clínica y realizará un examen físico. Necesitará imágenes de su fémur, probablemente con una radiografía o tomografía computarizada (TC)., Coméntele a su proveedor de atención médica sobre todos los medicamentos que toma, incluidos los medicamentos de venta libre como la aspirina. Además, hágale saber la última vez que comió

• Las enfermedades concomitantes.
• Alergia a anestésicos locales.
• Alteraciones de la coagulación.
• Antecedentes de cicatrización queloide o hipertrófica.
Trastornos circulatorios, inmunodeficiencias, hepatitis aguda o
crónica.
• Información sobre el procedimiento quirúrgico.
• Obtener el consentimiento del paciente.


## Cirugia

En el manual de cirugía uno de los primeros apartados habla sobre la homeostasis del paciente
la estabilización de las perdidas de distintos fluidos es algo que despreciaremos en el modelo puesto que no evaluaremos dinamicamente las cosas(TODO<<yet?>>).

cosas(estables/inestables/criticas);

p.p. - # 23
Mediante la Evaluación Subjetiva del Estado
Nutricional el paciente puede ser clasificado en:
1. Obeso.
2. Bien nutrido.
3. Riesgo de desnutrición.
4. Desnutrido.

	Aqui divide los intestinos operantes de los que no y con cuantos dias esta in/operatividad( <> 7 dias)

### Clasificacion basica de cirugías

1. Cirugia mayor
2. Cirugia mayor ambulatoria
3. Cirugia menor

### Top 9

#### 1.- Reducción abierta de fractura con fijación interna, fémur.
Esta clase de intervención se da en accidentes fuertes relacionados a las extremidades
inferiores, se les pone un sopore en su piernita, o recostados(boca arriba o abajo) se tiene acceso a la zona a intervenir, el abordaje dependerá del médico pero los más comunes son.

El abordaje debe considerar la patología, la técnica quirúrgica, la exposición y comodidad del cirujano.

	Vias de abordaje (depende de las incisiones que hará)?
1.- Lobenhoffer
2.- Anterolateral
3.- Anterior directa

Los autores desaconsejan la vía de abordaje anterior directa
con osteotomía de la tuberosidad anterior de la tibia,
porque esta vía de abordaje se asocia a una tasa alta de
seudoartrosis.

Después de preparar al paciente y personal, posicionarlo, anestesiarlo y asegurarse del estado optimo del equipo de trabajo y compañeros, se procede a intervenir.
Se usa un scalpelo (cuchillito de doctor)
	incisión de pi a pa
Acomodamos el hueso
Fijamos, por ser femur con puede involucrar tornillos, placas, varillas, alambres o clavos especiales y cinta scotch
suturas

post-ops


#### Laparotomía exploradora.

#### Salpingooforectomía unilateral.
#### Herniorrafía umbilical abierta.
#### Reparación unilateral de hernia inguinal.
#### Apendicectomía.
#### Extirpación local o destrucción de lesión o tejido de piel y tejido subcutáneo.
#### Sustitución de derivación ventricular.
#### Reducción abierta de fractura con fijación interna, húmero.

##### Building KBS

Se definen las plantillas,éstas deben corresponder a los
agentes que intervienen en las funciones a modelar,
se hace mayor enfasis en los agentes dinámicos que en los
estáticos, aunque el acceso o interacción con un agente estático
puede estar mediado por la acción de un agente dinámico, un cirujano impide
que la otro tenga el instrumento o material médico porque lo está utilizando.


Los principales agentes en la intervención son:

- Cirujano principal
- Cirujano auxiliar
- Anestesista
- Enfermera circulante
- Enfermero instrumentista


El instrumental medico puede ser:
			(usos)
	Básico o Especializado

hecho de(composicion):
- Acero inoxidable
- Titanio
- Vitalio
- Otros metales

con forma distinta:

 - De un solo cuerpo
 - Articulados
 - Con cierre
 - Con forceps
 - De fibra
 
y su función puede ser de:

 - Diéresis o corte.
 - Separación
 - Aprehensión 
 - Síntesis
 - Drenaje 


Tijeras:
Se debe disponer de unas tijeras
de corte (de Mayo) curvas de punta roma, de 14 cm de largo, y de unas
tijeras de disección (de Metzembaum) curvas de punta roma, de 11,5
cm de largo.


### Referencias web
#### 	1.- [ ]

Reducción abierta con fijación interna para la fractura del fémur
https://carefirst.staywellsolutionsonline.com/spanish/TestsProcedures/135,334es

Reducción abierta y fijación interna de la fractura de fémur
https://goodmood-photobooth.com/es/reduccion-abierta-y-fijacion-interna-de-la-fractura-de-femur/

¿Qué es la reducción abierta y fijación interna (RAFI) en la fractura de fémur?
https://myhealth.ucsd.edu/Spanish/RelatedItems/3,90322es

Cirugía de reducción abierta y fijación interna
https://www.cancercarewny.com/content.aspx?chunkiid=592618


### Referencias pdf

1.1 - Reducción abierta y fijación interna de las fracturas de la meseta tibial
https://campus.sanofi.es/dam/jcr:666e26f3-42b7-48d1-8aae-73628756ea8f/atlas_ch076.pdf

La cirugía de reducción abierta y fijación interna (ORIF) Folleto informativo
https://intermountainhealthcare.org/ckr-ext/Dcmnt?ncid=521422285


[1]Manual de Cirugía(Universidad de los Andes - 2016) : Joaquín,Krystel,Felipe,Rolando.
[2]Manual Práctico de cirugía menor - Grupo de Cirugía menor y dermatológica.
[3]Introducción a la cirugía general (Ediciones MAWIL - 2020) https://doi.org/10.26820/978-9942-826-33-6