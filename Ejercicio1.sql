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

  /* No se puede crear la tabla ya que el campo referenciado de productos de la tabla de pedidos no tiene integridad referencial y por lo tanto, primero se debe alterar eso*/

ALTER TABLE pedidos
ADD CONSTRAINT unique_constraint_name UNIQUE (producto)

  /*Posteriormente, ya se puede crear la tabla de productos referenciandola a la tabla de pedidos a través del nombre del producto*/

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio DECIMAL (10,2),
	FOREIGN KEY (nombre) REFERENCES pedidos (producto)
)

