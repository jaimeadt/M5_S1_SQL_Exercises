/*Ejercicio 5*/

/* 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto).*/

CREATE TABLE IF NOT EXISTS clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
)

/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes".*/

INSERT INTO clientes (nombre)
VALUES ('john')

/* 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes"*/

UPDATE clientes
SET nombre = 'John Doe'
WHERE id=1

/* 4.  Elimina el cliente con id=1 de la tabla "Clientes"*/

DELETE FROM clientes
WHERE id = 1

/* 5.  Lee todos los clientes de la tabla "Clientes".*/

SELECT * FROM clientes

/* 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero).*/

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	cliente_id INT
)

/* 7.  Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos".*/

INSERT INTO pedidos (cliente_id)
VALUES (1)

/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos"*/

UPDATE pedidos
SET cliente_id = 2
WHERE id = 1

/* 9.  Elimina el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM pedidos
WHERE id = 1

/* 10. Lee todos los pedidos de la tabla "Pedidos*/

SELECT * FROM pedidos

/* 11.  Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto).*/

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
)

/* 12.  Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/

INSERT INTO productos (nombre)
VALUES ('camisa')

/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos*/

UPDATE productos
SET nombre = 'pantalon'
WHERE id =1

/* 14.  Elimina el producto con id=1 de la tabla "Productos"*/

DELETE FROM productos
WHERE id = 1

/* 15.  Lee todos los productos de la tabla "Productos".*/

SELECT * productos

/* 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero)*/

CREATE TABLE IF NOT EXISTS detalles_pedido (
	id SERIAL PRIMARY KEY,
	producto_id INT
)

/* 17.  Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido".*/

INSERT INTO detalles_pedido (producto_id)
VALUES (1)

/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido".*/

UPDATE detalles_pedido
SET producto_id = 2
WHERE id = 1

/* 19.  Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido"*/

DELETE FROM detalles_pedido
WHERE id = 1

/* 20.  Lee todos los detalles de pedido de la tabla "DetallesPedido".*/

SELECT * detalles_pedido

/* 21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join.*/

  /* Primero se debe establecer la relación de Keys entre tablas*/

ALTER TABLE pedidos
ADD FOREIGN KEY (cliente_id) REFERENCES clientes (id)

  /*Posteriormente ya se ejecuta la consulta*/

SELECT * FROM pedidos
INNER JOIN clientes
ON cliente_id = clientes.id

/* 22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join.*/

SELECT * FROM pedidos
LEFT JOIN clientes
ON cliente_id = clientes.id