-- Database: sain

-- DROP DATABASE sain;

CREATE DATABASE sain
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Ecuador.1252'
       LC_CTYPE = 'Spanish_Ecuador.1252'
       CONNECTION LIMIT = -1;
	   
CREATE TABLE rol(
	id				SERIAL PRIMARY KEY NOT NULL,
	tipo			CHARACTER VARYING(20)	NOT NULL
);
CREATE TABLE empleado(
	id			SERIAL PRIMARY KEY NOT NULL,
	usuario 	CHARACTER VARYING(20)	NOT NULL,
	password 	CHARACTER VARYING(50)	NOT NULL,
	nombre 		CHARACTER VARYING(50)	NOT NULL,
	apellido	CHARACTER VARYING(50)	NOT NULL,
	estado		BOOLEAN
);

CREATE TABLE rolEmpleado(
	id			SERIAL 	PRIMARY KEY NOT NULL,
	idEmpleado	SERIAL 	REFERENCES empleado(id),
	idRol		SERIAL 	REFERENCES rol(id)
);

CREATE TABLE curso(
	id 			SERIAL PRIMARY KEY	NOT NULL,
	anioEGB		CHARACTER VARYING(20) 	NOT NULL,
	paralelo 	CHARACTER VARYING(20)	NOT NULL,
	periodo 	CHARACTER VARYING(20)	NOT NULL,
	jornada		CHARACTER VARYING(20)	NOT NULL
);
CREATE TABLE planificacion(
	id				SERIAL PRIMARY KEY NOT NULL,
	descripcion		CHARACTER VARYING(200) NOT NULL
);
CREATE TABLE materia(
	id 				SERIAL PRIMARY KEY	NOT NULL,
	nombre 			CHARACTER VARYING(80)	NOT NULL,
	idEmpleado		SERIAL REFERENCES empleado(id),
	idCurso			SERIAL REFERENCES curso(id),
	idPlanificacion	SERIAL REFERENCES planificacion(id)
);

CREATE TABLE estudiante(
	id 				SERIAL 	PRIMARY KEY,
	nombre 			CHARACTER VARYING(70)	NOT NULL,
	apellido 		CHARACTER VARYING(70)	NOT NULL,
	direccion 		CHARACTER VARYING(70)	NOT NULL,
	representante 	CHARACTER VARYING(70)	NOT NULL,
	telefono	 	CHARACTER VARYING(45)	NOT NULL
);
CREATE TABLE matricula(
	id 				SERIAL PRIMARY KEY			NOT NULL,
	idEstudiante 	SERIAL REFERENCES estudiante(id)	,
	idCurso 		SERIAL REFERENCES curso(id)		,
	calificacion	REAL						NOT NULL
);

CREATE TABLE asistencia(
	id		SERIAL PRIMARY KEY NOT NULL		NOT NULL,
	estado		BOOLEAN					,
	fecha		DATE,
	idMatricula	SERIAL REFERENCES matricula(id),
	idCurso		SERIAL REFERENCES curso(id)
);

CREATE TABLE parametro(
	id			SERIAL PRIMARY KEY NOT NULL,
	nombre		CHARACTER VARYING(70) 	NOT NULL,
	valor		CHARACTER VARYING(150)	NOT NULL
);

CREATE TABLE evidencia(
	id		SERIAL 	PRIMARY KEY		NOT NULL,
	tipoCitacion	CHARACTER VARYING(20)		NOT NULL,
	rutaRelativa	CHARACTER VARYING(100),
	idParametro	SERIAL REFERENCES parametro(id)
);

CREATE TABLE citacion(
	id 				SERIAL 	PRIMARY KEY			NOT NULL,
	descripcion 	CHARACTER VARYING(45)			NOT NULL,
	idEstudiante 	SERIAL REFERENCES estudiante(id)	,
	idInspector 	SERIAL REFERENCES empleado(id),
	idCurso			SERIAL REFERENCES curso(id),
	idEvidencia		SERIAL REFERENCES evidencia(id)
);

CREATE TABLE quimestre(
	id			SERIAL PRIMARY KEY NOT NULL,
	numero		INTEGER,
	examen		REAL,
	idMatricula SERIAL REFERENCES matricula(id),
	idMateria	SERIAL REFERENCES materia(id)
);

CREATE TABLE parcial(
	id				SERIAL PRIMARY KEY 		NOT NULL,
	numero			INTEGER NOT NULL,
	calificacion	REAL NOT NULL,
	idQuimestre		SERIAL REFERENCES quimestre(id)			
);

CREATE TABLE modulo(
	id					SERIAL PRIMARY KEY 	NOT NULL,
	nombre				CHARACTER VARYING(50)	NOT NULL,
	descripcion			CHARACTER VARYING(300)	NOT NULL,
	idPlanificacion		SERIAL REFERENCES planificacion(id)	
);

CREATE TABLE unidad(
	id		SERIAL PRIMARY KEY 		NOT NULL,
	nombre		CHARACTER VARYING(100)		NOT NULL,
	descripcion	CHARACTER VARYING(300)		NOT NULL,
	idModulo	SERIAL REFERENCES modulo(id) 	
);

/* INSERTANDO DATOS EN LA BASE DE DATOS*/

/* EMPLEADOS */

INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('mzavala','1111','Mauro','Zavala',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('csalas','1111','Carola','Salas',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('amendieta','1111','Alberto','Mendieta',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('msanchez','1111','Maria','Sanchez Morales',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('svelasquez','1111','Santa','Velasquez',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('ipaucar','1111','Ivan','Paucar',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('cchancay','1111','Cecilia','Chancay',TRUE);
INSERT INTO empleado(usuario,password,nombre,apellido,estado) VALUES ('fhuayamabe','1111','Freddy','Huayamabe',TRUE);

/* ROL */

INSERT INTO rol(tipo) VALUES ('Rector');
INSERT INTO rol(tipo) VALUES ('Vice-Rector');
INSERT INTO rol(tipo) VALUES ('Secretario');
INSERT INTO rol(tipo) VALUES ('Inspector');
INSERT INTO rol(tipo) VALUES ('Profesor');

/* ROL-EMPLEADO */

INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (1,1);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (1,5);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (2,2);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (2,5);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (3,3);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (4,4);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (4,5);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (5,5);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (6,5);
INSERT INTO rolEmpleado(idEmpleado,idRol) VALUES (7,5);

/* CURSO */
INSERT INTO curso(anioEGB,paralelo,periodo,jornada) VALUES ('8vo año basico','A','2014-2015','matutina');
INSERT INTO curso(anioEGB,paralelo,periodo,jornada) VALUES ('9vo año basico','A','2014-2015','matutina');
INSERT INTO curso(anioEGB,paralelo,periodo,jornada) VALUES ('10vo año basico','A','2014-2015','matutina');
INSERT INTO curso(anioEGB,paralelo,periodo,jornada) VALUES ('1ero de Bachillerato','A','2014-2015','matutina');
INSERT INTO curso(anioEGB,paralelo,periodo,jornada) VALUES ('2do de Bachillerato','A','2014-2015','matutina');
INSERT INTO curso(anioEGB,paralelo,periodo,jornada) VALUES ('3ero de Bachillerato','A','2014-2015','matutina');
/* PLANIFICACION */ 

INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Matematicas');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Estudios Sociales');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Marketing');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Contabilidad');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Contabilidad');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Matematicas');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Computacion');
INSERT INTO planificacion(descripcion) VALUES('Planificacion anual de Ciencias Naturales');

/* MATERIA */

INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Matematicas',8,1,1)
INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Estudios Sociales',1,1,1);
INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Marketing',2,6,2);
INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Contabilidad',4,1,3);
INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Contabilidad',5,3,4);
INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Computacion',6,1,6);
INSERT INTO materia(nombre,idEmpleado,idCurso,idPlanificacion) VALUES ('Ciencias Naturales',7,1,7);

/* ESTUDIANTE */

INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José Manuel', 'Paz', 'Avenida Inecuación 247, 3º 4ª', 'Paula Torres', '914-233-500');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ángel', 'Pérez', 'Paseo Dibujo Menguante 122, 4º 1ª', 'Daniel Salvatierra', '931-580-039');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Joaquín', 'Gómez', 'Paseo Implícito Sensible 124, 1', 'María Isabel Cerro', '920-187-513');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ángel', 'Lerma', 'Calle Erlemeyer Abstracto 220, 4º', 'Mónica Rodríguez', '927-494-754');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María', 'Villena', 'Paseo Trapezoide Honesto 38, 4º', 'Fernando Peña', '981-735-419');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Mercedes', 'Guerrero', 'Paseo la Desinencia Mala 144, 4', 'José Luis Gregorio', '914-764-316');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ana Isabel', 'Ferrer', 'Calle Abstinencia 217, 2º 3ª', 'Javier Medina', '968-821-915');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Enrique', 'Morales', 'Paseo Transfusión Baja 179, 2º 3ª', 'María Dolores Pérez', '967-255-866');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Pedro', 'González', 'Avenida Novela Triste 1, 5', 'José Luis Benito', '967-880-571');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Sergio', 'Alonso', 'Avenida Resolución Sensible 9, 1º 4ª', 'Concepción García', '953-188-960');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Marta', 'Sánchez', 'Avenida de la Tradición Malcriada 2 bis, 1', 'Miguel Bravo', '968-841-035');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Manuel', 'Guirao', 'Calle de la Intraespecífica 27, 5º', 'Francisco Del Olmo', '917-742-086');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Francisco Javier', 'Martínez', 'Paseo Transición Arriesgada 90, 4º', 'Jon Cazorla', '961-926-235');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Pilar', 'Ruiz', 'Plaza  Maleable Resplandeciente 100, 3º', 'Alberto Muñoz', '961-602-982');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Carlos', 'Da Silva', 'Plaza Oficial 43, 6', 'Ana María Martin', '939-805-278');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Francisca', 'García', 'Plaza Relación 44, 5', 'José Fernández', '945-368-925');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Jesús', 'Guerrero', 'Plaza Frontera Grande 221, 6', 'María Pilar Martínez', '917-721-561');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Adrián', 'Pozuelo', 'Calle la Incisión Joven 49, 5', 'Josefa Merchán', '981-259-247');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Manuel', 'Cruz', 'Paseo Aval 291, 1', 'Teresa Rodríguez', '934-446-462');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Núñez', 'Paseo Científica 230, 4º', 'Ángel Gómez', '926-941-470');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Catalina', 'Martínez', 'Avenida  Divisible 242, 3', 'José Ruiz', '934-800-766');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Muñoz', 'Avenida de  Aristocracia 81, 1º 6ª', 'Antonia Pacheco', '971-320-684');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Luisa', 'Fernández', 'Paseo la Predisposición 140, 2º 4ª', 'José María Duque', '967-753-137');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Jaime', 'García', 'Paseo  Predación Malcriada 75, 2º', 'Óscar Martínez', '941-122-505');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José Luis', 'Carrera', 'Paseo del Icónico Grande 93, 5º', 'Cristina Rodríguez', '922-479-818');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Salvador', 'Vargas', 'Paseo del Bivalente Inteligente 110, 5º 3ª', 'Roberto Menéndez', '919-829-288');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María', 'Ruiz', 'Plaza  Justicia Arriesgada 169, 4º 6ª', 'Antonio Tome', '947-673-586');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Cristina', 'Albert', 'Calle Microorganismo Ordenado 248, 6º 1ª', 'Mercedes Arana', '942-824-190');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ainhoa', 'Carrión', 'Avenida Vellosidad 84, 6º 5ª', 'Gabriel Vicente', '953-844-098');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Mercedes', 'Borras', 'Calle  Triptongo 207, 2', 'Juan Antonio Callejo', '931-946-044');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Juan Carlos', 'Martínez', 'Plaza del Sustantivo 49 bis, 4', 'Adrián Ramos', '953-212-770');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Pilar', 'Navarro', 'Calle de  Tradición Viajera 211, 3', 'Pedro Ramos', '956-292-370');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Teresa', 'González', 'Paseo Jurídico Caliente 43, 1', 'Javier Ortega', '967-438-812');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Miguel', 'Pita', 'Plaza de la Adherencia 111, 6º 5ª', 'Jesús Sanjuán', '958-077-492');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Rafael', 'Pérez', 'Paseo Asia 270, 5', 'Antonio Álvarez', '967-942-634');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Luisa', 'López', 'Paseo de  Función 118, 4º', 'Paula Alonso', '959-897-858');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Alonso', 'Avenida Hispanoamericano 1, 2º', 'Ana María Rodríguez', '922-364-334');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Jorge', 'Domínguez', 'Paseo  Bióxido Independiente 290, 5º', 'Antonia García', '954-307-408');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Antonio', 'Navarro', 'Calle Disociamiento Grande 243, 6º 2ª', 'Javier Polo', '977-643-956');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Daniel', 'Zhu', 'Calle Selectividad 208, 5', 'Rosa María Valls', '922-825-236');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Carlos', 'Rueda', 'Calle de  Nobiliario 296, 5º 4ª', 'Elena Armengol', '981-607-139');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Jesús', 'Vizcaíno', 'Calle la Resistencia Sensible 52, 2º', 'Carmen Saavedra', '926-156-985');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Josep', 'Macías', 'Plaza Vertebrado 211, 4º', 'Alejandro Cid', '919-797-011');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Isabel', 'Izquierdo', 'Calle Anorexia 49, 5º', 'Emilio Aragón', '911-610-950');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Yolanda', 'González', 'Avenida  Bisectriz Lenta 294, 3º 1ª', 'Teresa Pereira', '956-040-252');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Pablo', 'Zabala', 'Paseo la Frase 84, 2º', 'José Antonio Domínguez', '913-970-733');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Carlos', 'Martínez', 'Plaza Cívico 199, 1', 'María Luisa González', '916-036-913');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Milagros', 'Vila', 'Avenida Fábula Alta 81, 4º', 'Antonio Segura', '934-820-885');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José Antonio', 'Fernández', 'Plaza la Morfología Artística 96, 4º 5ª', 'Miguel Gutiérrez', '964-845-198');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Carmen', 'Latorre', 'Calle Habitación 126, 1', 'Elena Morales', '971-752-038');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Riera', 'Plaza  Hidrofílico Listo 81, 2', 'María José Jiménez', '931-012-384');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('David', 'Blasco', 'Calle del Antecesor 210, 3º', 'Ángel Hernández', '932-977-771');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Álvaro', 'Del Pozo', 'Paseo Excursión 142, 5º', 'Patricia Montero', '983-608-766');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Daniel', 'Velázquez', 'Avenida Vulnerable Inteligente 8, 5º 2ª', 'Encarnación Arce', '939-240-745');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Mercedes', 'Torres', 'Paseo Invasor Responsable 32, 1º 5ª', 'Antonio Navarro', '924-664-153');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Antonio', 'Navarro', 'Paseo Sustentación 63, 1º 5ª', 'María José García', '935-326-951');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Rosa', 'Carmona', 'Calle el Bípedo Audaz 300, 4º 6ª', 'Andrea Páez', '928-567-277');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Lucia', 'Gracia', 'Plaza Biosfera Baja 107, 1', 'José Manuel Pérez', '919-317-408');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Marta', 'Aznar', 'Avenida  Estratega Sincero 274, 3', 'Cristina Gordillo', '913-326-374');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Carmen', 'Vallejo', 'Calle Lúteo Abstracto 52, 3', 'Josefa Suarez', '955-633-504');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Luis', 'García', 'Avenida de  Aseverativo Albo 154, 4º', 'María Carmen Casas', '964-055-053');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Isabel', 'Morera', 'Paseo  Fenicia 250, 4', 'Francisca Martin', '950-082-903');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Juan Manuel', 'Jodar', 'Paseo Adversidad Fuerte 146, 3º 5ª', 'José Trujillo', '953-992-329');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Francisco', 'Oller', 'Calle Reminiscencia Amorosa 287, 2', 'David Jordán', '928-590-543');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Rosa', 'Lechuga', 'Avenida la Atribución Fría 66, 1', 'Juan Díaz', '968-390-054');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Teresa', 'López', 'Calle de  Justicia Moderna 106, 6º 1ª', 'Francisco Megias', '956-575-583');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Antonio', 'Pérez', 'Calle  Astronauta Fácil 195, 6º', 'Alejandro Viana', '941-755-339');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Concepción', 'Fernández', 'Avenida Selva Fácil 291, 3º', 'María Josefa Vasco', '976-752-635');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José María', 'Jodar', 'Paseo Monocárpico 234, 3', 'Santiago Beltrán', '918-794-836');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María', 'Martínez', 'Avenida Bulimia 85, 2º 3ª', 'Javier Pallas', '928-220-245');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Rafael', 'Gómez', 'Avenida de la Reserva Resplandeciente 49, 6º', 'María Cárdenas', '935-604-453');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Fernando', 'Díaz', 'Calle Aristocracia Prolija 112, 5º 5ª', 'Manuel De la Fuente', '987-206-941');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Ángeles', 'Fernández', 'Avenida de  Recesión Azul 116, 6º 6ª', 'Carlos Borrego', '987-276-967');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Alicia', 'Marín', 'Calle Nacionalismo 263 bis, 6º 1ª', 'Margarita Gómez', '922-714-248');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José Antonio', 'Vidal', 'Paseo Divulgación 281, 3', 'Paula Martínez', '976-594-426');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José Luis', 'Gómez', 'Paseo de  Construcción 64, 5', 'Juan Villar', '962-507-256');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Isabel', 'Jiménez', 'Calle Abastecimiento Malo 202, 1º', 'María Ángeles López', '923-076-455');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Juan Antonio', 'Romero', 'Plaza Lingüística Difícil 101, 2', 'Rafael González', '937-212-337');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Rosa María', 'Peña', 'Calle lo Covalente Negro 160, 5º 6ª', 'María Isabel Llopis', '935-012-172');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José Antonio', 'Asenjo', 'Plaza la Agresividad Dulce 219, 4', 'Álvaro Canosa', '918-699-275');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Martin', 'Plaza  Divulgación Generosa 227, 4º', 'Manuel Soriano', '919-669-631');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Rosa', 'Almeida', 'Paseo Audiovisual Nuevo 246, 1º 2ª', 'Sara Gómez', '945-137-308');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ana Belén', 'Domínguez', 'Plaza de la Recepción 52, 5º 1ª', 'Antonia Gallardo', '963-250-912');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Miguel Ángel', 'Vera', 'Avenida Delgadez 135 bis, 6º', 'Julia Alejo', '958-893-883');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Alcázar', 'Avenida Universo 178, 6', 'Rosario Vázquez', '936-946-362');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María', 'López', 'Plaza Abovedado Cauto 251, 5º', 'Juan Antonio Ramos', '950-804-756');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Ángeles', 'García', 'Plaza Bimestre Bonito 166, 1º', 'Andrea Gil', '975-419-215');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Rafael', 'Morante', 'Calle Selectividad 85, 2', 'Ana María Pedrosa', '987-846-686');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Sandra', 'García', 'Avenida de  División 213, 2º', 'Domingo Blasco', '939-729-058');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Iker', 'García', 'Avenida de la Contribución 245 bis, 3', 'Javier Pérez', '956-271-772');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Vázquez', 'Calle Nervadura 287, 5º 1ª', 'Rubén Álvarez', '967-206-513');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Teresa', 'Jiménez', 'Calle Diezmo 37, 1', 'María Mar Fuentes', '958-177-181');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ángel', 'Castro', 'Paseo de la Babilonia Fría 234, 6º', 'María Ruiz', '950-445-729');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Alberto', 'Álvarez', 'Plaza  Aceptación 300, 1º', 'Raquel Ruiz', '939-469-365');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Isabel', 'Dávila', 'Paseo Galaxia Nueva 280, 2º', 'Manuel Egido', '937-742-567');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Laia', 'Barrachina', 'Paseo Verosímil Enfermo 160, 2', 'Antonia Delgado', '985-846-522');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Ángel', 'Serrano', 'Avenida Instructivo Nueva 122, 6', 'David Carballo', '968-586-357');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('José', 'Alonso', 'Paseo Perezoso 120, 5º 1ª', 'Cristina Gómez', '945-338-973');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('María Teresa', 'Gutiérrez', 'Plaza Objeto Fuerte 197, 4º 3ª', 'José Ignacio Fuente', '911-446-321');
INSERT INTO estudiante(nombre,apellido,direccion,representante,telefono) VALUES ('Fernando', 'Ramos', 'Avenida de la Limnología 221, 3º 5ª','Antonio Rodero', '941-375-518');

/* MATRICULA */

INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (1,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (2,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (3,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (4,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (5,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (6,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (7,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (8,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (9,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (10,1,10);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (11,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (12,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (13,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (14,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (15,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (16,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (17,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (18,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (19,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (20,1,9);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (21,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (22,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (23,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (24,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (25,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (26,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (27,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (28,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (29,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (30,1,8);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (31,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (32,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (33,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (34,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (35,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (36,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (37,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (38,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (39,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (40,1,6);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (41,1,2);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (42,1,2);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (43,1,2);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (44,1,2);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (45,1,2);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (46,1,1);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (47,1,1);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (48,1,1);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (49,1,0);
INSERT INTO matricula(idEstudiante, idCurso, calificacion) VALUES (50,1,0);

/* ASISTENCIA */

INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',1,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',2,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',3,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',4,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',5,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',6,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',7,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',8,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',9,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',10,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',11,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',12,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',13,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',14,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',15,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',16,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',17,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',18,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',19,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',20,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',21,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',22,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',23,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',24,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',25,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',26,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',27,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',28,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',29,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',30,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',31,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',32,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',33,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',34,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',35,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',36,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',37,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',38,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (true,'2014-05-20',39,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',40,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',41,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',42,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',43,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',44,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',45,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',46,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',47,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',48,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',49,1);
INSERT INTO asistencia(estado, fecha, idMatricula, idCurso) VALUES (false,'2014-05-20',50,1);

/* PARAMETRO */

INSERT INTO parametro(nombre,valor) VALUES ('RutaAbs','C:\Users\Administrador');

/* EVIDENCIA */

INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Asistencia','\Evidencias\asistencia01.jpg',1);
INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Asistencia','\Evidencias\asistencia02.jpg',1);
INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Asistencia','\Evidencias\asistencia03.jpg',1);
INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Asistencia','\Evidencias\asistencia04.jpg',1);

INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Rendimiento','\Evidencias\rendimiento01.jpg',1);
INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Rendimiento','\Evidencias\rendimiento02.jpg',1);

INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Rendimiento','\Evidencias\rendimiento03.jpg',1);
INSERT INTO evidencia(tipoCitacion, rutaRelativa, idParametro) VALUES ('Rendimiento','\Evidencias\rendimiento04.jpg',1);

/* CITACION */

INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Faltas injustificadas en clases',60,4,1,1);
INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Faltas injustificadas en clases',72,4,1,2);
INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Faltas injustificadas en clases',80,4,1,3);
INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Faltas injustificadas en clases',60,4,1,4);

INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Baja en aprovechamiento',47,4,1,5);
INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Baja en aprovechamiento',48,4,1,6);
INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Baja en aprovechamiento',49,4,1,7);
INSERT INTO citacion(descripcion,idEstudiante,idInspector,idCurso,idEvidencia) VALUES ('Baja en aprovechamiento',50,4,1,8);

/* QUIMESTRE */

/* [1 - 10]*/

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,1,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,1,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,2,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,2,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,3,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,3,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,4,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,4,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,5,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,5,1)

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,6,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,6,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,7,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,7,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,8,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,8,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,9,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,9,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,10,10,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,10,10,1);

/* [11 - 20] */

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,11,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,11,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,12,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,12,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,12,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,12,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,13,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,13,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,14,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,14,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,15,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,15,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,16,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,16,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,17,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,17,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,18,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,18,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,19,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,19,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,7.5,20,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,7.5,20,1);

/* [21 - 30] */

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,21,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,21,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,22,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,22,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,23,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,23,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,24,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,24,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,25,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,25,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,26,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,26,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,27,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,27,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,28,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,28,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,29,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,29,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,5,30,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,5,30,1);

/* [31 - 40] */

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,31,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,31,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,32,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,32,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,33,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,33,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,34,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,34,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,35,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,35,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,36,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,36,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,37,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,37,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,38,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,38,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,39,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,39,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,2.5,40,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,2.5,40,1);

/* [41 - 45] */

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,41,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,41,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,42,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,42,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,43,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,43,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,44,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,44,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,45,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,45,1);

/* [46 - 48] */

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,46,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,46,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,47,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,47,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,48,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,48,1);

/* [49 - 50] */

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,49,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,49,1);

INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (1,0,50,1);
INSERT INTO quimestre(numero,examen,idMatricula,idMateria) VALUES (2,0,50,1);

/* PARCIAL */

/* [1 - 10]*/

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,1);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,1);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,1);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,2);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,2);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,2);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,3);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,3);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,3);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,4);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,4);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,4);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,5);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,5);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,5);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,6);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,6);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,6);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,7);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,7);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,7);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,8);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,8);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,8);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,9);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,9);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,9);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,10);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,10);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,10);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,11);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,11);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,11);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,12);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,12);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,12);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,13);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,13);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,13);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,14);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,14);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,14);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,15);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,15);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,15);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,16);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,16);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,16);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,17);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,17);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,17);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,18);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,18);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,18);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,19);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,19);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,19);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,10,20);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,10,20);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,10,20);

/* [11 - 20] */

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,21);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,21);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,21);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,22);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,22);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,22);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,23);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,23);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,23);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,24);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,24);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,24);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,25);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,25);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,25);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,26);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,26);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,26);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,27);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,27);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,27);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,28);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,28);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,28);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,29);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,29);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,29);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,30);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,30);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,30);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,31);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,31);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,31);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,32);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,32);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,32);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,33);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,33);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,33);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,34);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,34);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,34);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,35);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,35);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,35);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,36);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,36);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,36);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,37);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,37);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,37);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,38);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,38);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,38);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,39);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,39);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,39);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,9.375,40);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,9.375,40);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,9.375,40);

/* [21 - 30] */

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,41);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,41);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,41);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,42);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,42);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,42);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,43);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,43);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,43);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,44);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,44);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,44);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,45);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,45);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,45);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,46);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,46);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,46);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,47);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,47);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,47);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,48);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,48);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,48);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,49);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,49);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,49);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,50);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,50);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,50);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,51);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,51);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,51);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,52);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,52);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,52);


INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,53);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,53);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,53);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,54);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,54);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,54);


INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,55);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,55);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,55);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,56);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,56);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,56);


INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,57);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,57);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,57);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,58);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,58);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,58);


INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,59);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,59);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,59);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,8.75,60);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,8.75,60);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,8.75,60);

/* [31 - 40] */

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,61);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,61);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,61);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,62);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,62);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,62);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,63);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,63);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,63);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,64);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,64);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,64);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,65);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,65);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,65);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,66);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,66);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,66);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,67);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,67);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,67);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,68);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,68);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,68);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,69);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,69);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,69);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,70);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,70);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,70);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,71);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,71);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,71);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,72);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,72);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,72);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,73);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,73);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,73);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,74);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,74);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,74);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,75);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,75);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,75);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,76);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,76);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,76);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,77);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,77);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,77);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,78);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,78);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,78);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,79);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,79);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,79);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,6.875,80);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,6.875,80);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,6.875,80);

/* [41 - 45] */

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,81);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,81);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,81);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,82);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,82);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,82);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,83);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,83);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,83);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,84);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,84);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,84);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,85);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,85);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,85);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,86);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,86);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,86);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,87);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,87);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,87);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,88);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,88);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,88);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,89);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,89);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,89);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,2.5,90);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,2.5,90);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,2.5,90);

/* [46 - 48] */

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,1.25,91);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,1.25,91);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,1.25,91);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,1.25,92);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,1.25,92);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,1.25,92);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,1.25,93);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,1.25,93);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,1.25,93);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,1.25,94);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,1.25,94);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,1.25,94);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,1.25,95);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,1.25,95);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,1.25,95);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,1.25,96);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,1.25,96);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,1.25,96);

/* [49 - 50] */

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,0,97);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,0,97);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,0,97);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,0,98);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,0,98);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,0,98);

INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,0,99);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,0,99);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,0,99);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (1,0,100);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (2,0,100);
INSERT INTO parcial (numero, calificacion, idQuimestre) VALUES (3,0,100);

/* MODULO */

INSERT INTO modulo(nombre,descripcion,idPlanificacion) VALUES ('Modulo 1','Introduccion a los numeros reales',1);	
INSERT INTO modulo(nombre,descripcion,idPlanificacion) VALUES ('Modulo 2','Ecuaciones',1);
INSERT INTO modulo(nombre,descripcion,idPlanificacion) VALUES ('Modulo 3','Geometria',1);

/* UNIDAD */

INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Numeros reales','Definicion, y clasificacion',1);
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Numeros racionales','Definicion, operaciones y ejercicios',1);
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Numeros irracionales','Definicion, ejercicios',1);

INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Ecuacion de primer grado','Definicion, ejercicios',2);
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Ecuacion de segundo grado','Definicion, ejercicios',2);
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Ecuacion de tercer grado','Definicion, ejercicios',2);
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Ecuacion de grado n','Definicion, ejercicios',2);
	
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Figuras geometricas','Definicion, clasificacion, calculo de area y perimetro, ejercicios',3);
INSERT INTO unidad(nombre,descripcion,idModulo) VALUES ('Figuras tridimensionales','Definicion, clasificacion, calculo de area y superficie, ejercicios',3);	