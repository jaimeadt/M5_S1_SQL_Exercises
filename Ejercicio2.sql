/* Ejercicio 2*/

/* 1.  Crea una base de datos llamada "MiBaseDeDatos".*/

CREATE DATABASE MiBaseDeDatos

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero).*/

CREATE TABLE IF NOT EXISTS usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)

/* 3.  Inserta dos registros en la tabla "Usuarios"*/

INSERT INTO usuarios (nombre, edad)
VALUES ('lucia',16)

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios"*/

UPDATE usuarios
SET edad = 25
WHERE nombre = 'lucia'

/* 5. . Elimina un usuario de la tabla "Usuarios".*/

DELETE FROM usuarios
WHERE id = 1

/* 1- Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto).*/

CREATE TABLE ciudades (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
)

/* 2.  Inserta al menos tres registros en la tabla "Ciudades"*/

INSERT INTO ciudades (nombre, pais)
VALUES ('paris','holanda')

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades".*/

ALTER TABLE usuarios
ADD COLUMN ciudad_id INT

ALTER TABLE usuarios
ADD FOREIGN KEY (ciudad_id) REFERENCES ciudades (id)

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN).*/

  /*Se añade un valor sin ciudad_id informado para ver las diferencias entre LEFT JOIN y INNER JOIN*/

INSERT INTO usuarios (nombre, edad)
VALUES ('miguel',45)

SELECT usuarios.nombre,
ciudades.nombre,
ciudades.pais
FROM usuarios
LEFT JOIN ciudades
ON usuarios.ciudad_id = ciudades.id

/* 5.  Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN).*/

SELECT usuarios.nombre,
ciudades.nombre,
ciudades.pais
FROM usuarios
INNER JOIN ciudades
ON usuarios.ciudad_id = ciudades.id
