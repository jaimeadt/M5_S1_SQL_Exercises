/*EJERCICIO 1*/

/* 1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto). */

CREATE TABLE IF NOT EXISTS clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	email VARCHAR(255)
)

/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".*/

INSERT INTO clientes (nombre, email)
VALUES ('juan','juan@example.com')

/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/

UPDATE clientes
SET email = 'juan@gmail.com'
WHERE id = 1

/* 4. Eliminar el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM clientes
WHERE id = 1

/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero)*/

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	cliente_id INT,
	producto VARCHAR(255),
	cantidad INT,
	FOREIGN KEY (cliente_id) REFERENCES clientes (id)
)

/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.*/

  /*Primero se debe de incluir un cliente con id=2 ya que previamente lo hemos eliminado y si no se hace no se puede crear un pedido sobre un cliente que no existe.*/

INSERT INTO clientes (nombre, email)
VALUES ('juan', 'juan@gmail.com')

  /*Una vez creado el cliente de nuevo ya si que se puede crear el pedido asociado al mismo aunque el cliente_id debe de ser 2 ya que el id = 1 ya se usó en el primer registro que ha sido borrado*/

INSERT INTO pedidos (cliente_id, producto, cantidad)
VALUES (2, 'camiseta', 2)

/* 7. Actualizar la cantidad del pedido con id=1 a 3.*/

UPDATE pedidos
SET cantidad = 3
WHERE id = 3

/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos"*/

DELETE FROM pedidos
WHERE id = 3

/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal*/

 CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio DECIMAL (10,2)
	)

/* 10.  Insertar varios productos en la tabla "Productos" con diferentes valores.*/

INSERT INTO productos (nombre, precio)
VALUES ('platano',2)

/* 11. . Consultar todos los clientes de la tabla "Clientes".*/

SELECT * FROM clientes

/* 12.  Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes. */

SELECT pedidos.id,
pedidos.cliente_id,
pedidos.producto,
pedidos.cantidad, clientes.nombre
FROM pedidos
LEFT JOIN clientes
ON cliente_id = clientes.id

/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

SELECT * FROM productos
WHERE precio > 50

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/

SELECT * FROM pedidos
WHERE cantidad >= 5

/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A"*/

SELECT * FROM clientes
WHERE nombre LIKE 'a%'

/* 16.  Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.*/

SELECT nombre, COUNT(pedidos.producto)
FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre

/* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto*/

SELECT producto, SUM(cantidad) FROM pedidos
GROUP BY producto

/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

ALTER TABLE pedidos
ADD COLUMN fecha DATE

/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".*/

	/* Para poder hacerlo primero hay que restringir que el campo "nombre" de la tabla "productos" son valores únicos por consistenca e integridad*/

	ALTER TABLE productos
ADD CONSTRAINT unique_nombre UNIQUE (nombre)

	/* Posteriormente ya se puede referenciar la FK de la tabla "pedidos" a la tabla de "productos".*/

	ALTER TABLE pedidos
ADD CONSTRAINT fk_producto
FOREIGN KEY (producto) REFERENCES productos (nombre)

/* 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.*/

SELECT
clientes.nombre,
productos.nombre,
pedidos.cantidad
FROM pedidos
INNER JOIN clientes
ON pedidos.cliente_id = clientes.id
INNER JOIN productos
ON pedidos.producto = productos.nombre
