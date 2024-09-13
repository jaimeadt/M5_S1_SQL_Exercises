/*Ejercicio 3*/

/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico).*/

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
)

/* 2.  Inserta al menos cinco registros en la tabla "Productos"*/

INSERT INTO productos (nombre, precio)
VALUES ('guayaba',2)

/* 3. Actualiza el precio de un producto en la tabla "Productos"*/

UPDATE productos
SET precio = 20
WHERE nombre = 'manzana'

/* 4.  Elimina un producto de la tabla "Productos".*/

DELETE FROM productos
WHERE id = 5

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos").*/

	/* No se puede realizar este bullet hasta haber creado la tabla de pedidos en el ejercicio 4. Se salta a siguientes pasos hasta pòder realizar este bullet. Por favor, corregir en la documentación. Gracias*/

/*Ejercicio 4*/

/* 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	id_usuario INT,
	id_producto INT
)

