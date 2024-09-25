/* Ejercicio práctico SQL*/

/*Se crea la base de datos con la que se va a operar*/

CREATE DATABASE MiBaseDeDatos

/*Se crean todas las tablas que van a conformar el modelo de datos*/

CREATE TABLE IF NOT EXISTS alumnos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	apellido VARCHAR (255)
)

CREATE TABLE IF NOT EXISTS cursos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	duracion_semanas INT,
	fecha_inicio DATE
)

CREATE TABLE IF NOT EXISTS matriculaciones (
	id SERIAL PRIMARY KEY,
	alumno_id INT,
	curso_id INT
)

/*Para la tabla de participaciones priomero se debe de crear el catálogo de tipo de medio de participación*/

CREATE TYPE medio_participación
AS ENUM ('comunitarios','clases')

CREATE TABLE IF NOT EXISTS participaciones (
	id SERIAL PRIMARY KEY,
	alumno_id INT,
  curso_id INT,
	medio medio_participación,
	fecha DATE
)

/*Se establecen las relaciones entre las tablas del modelo*/

ALTER TABLE matriculaciones
ADD FOREIGN KEY (alumno_id) REFERENCES alumnos (id)

ALTER TABLE matriculaciones
ADD FOREIGN KEY (curso_id) REFERENCES cursos (id)

ALTER TABLE participaciones
ADD FOREIGN KEY (alumno_id) REFERENCES alumnos (id)

ALTER TABLE participaciones
ADD FOREIGN KEY (curso_id) REFERENCES cursos (id)

/*Se procede al poblado de las tablas con dos registros en cada una*/

INSERT INTO alumnos (nombre, apellido)
VALUES ('Alberto','perez')

INSERT INTO alumnos (nombre, apellido)
VALUES ('juan','rivas')

INSERT INTO cursos (nombre, duracion_semanas, fecha_inicio)
VALUES ('sql', 4,'01/01/2024')

INSERT INTO cursos (nombre, duracion_semanas, fecha_inicio)
VALUES ('python', 8,'01/07/2024')

INSERT INTO matriculaciones (alumno_id, curso_id)
VALUES (1,2)

INSERT INTO matriculaciones (alumno_id, curso_id)
VALUES (2,1)

INSERT INTO participaciones (alumno_id, curso_id, medio, fecha)
VALUES (1,2,'comunitarios','01/02/2024')

INSERT INTO participaciones (alumno_id, curso_id, medio, fecha)
VALUES (2,1,'clases','01/08/2024')

/*Se muestran las distintias consultas del modelo*/

  /*alumnos y matriculas*/

SELECT * FROM alumnos
LEFT JOIN matriculaciones
ON alumnos.id = matriculaciones.alumno_id

  /*alumnos y participaciones*/

SELECT * FROM alumnos
LEFT JOIN participaciones
ON alumnos.id = participaciones.alumno_id

  /*cursos y matriculaciones*/

SELECT * FROM cursos
LEFT JOIN matriculaciones
ON cursos.id = matriculaciones.curso_id

  /*cursos y participaciones*/

SELECT * FROM cursos
LEFT JOIN participaciones
ON cursos.id = participaciones.curso_id

  /*participaciones de alumnos en cursos mostrando los nombres de los alumnos y cursos*/

SELECT *
FROM participaciones
LEFT JOIN alumnos
ON participaciones.alumno_id = alumnos.id
LEFT JOIN cursos
ON participaciones.curso_id = cursos.id