-- Crear tabla “editoriales”, con los atributos código y nombre.
-- Definir el código como llave primaria.
BEGIN TRANSACTION;
CREATE TABLE editoriales(
	codigo INT PRIMARY KEY, 
	nombre VARCHAR(150) NOT NULL
);
COMMIT;

-- 2. Crear tabla “libros”, con los atributos código, título, y codigoeditorial. 
--Definir el código como llave primaria, 
--definir codigoeditorial como llave foránea, referenciando a la tabla editoriales.
BEGIN TRANSACTION;
CREATE TABLE libros(
	codigo INT PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	codigoeditorial INT NOT NULL,
	FOREIGN KEY(codigoeditorial) REFERENCES editoriales(codigo)
);
COMMIT;

-- 3 Insertar editoriales y libros
BEGIN TRANSACTION;
INSERT INTO editoriales VALUES
	(1, 'Anaya'),
	(2, 'Andina'),
	(3, 'S.M.');
COMMIT;

BEGIN TRANSACTION;
INSERT INTO libros VALUES
	(1, 'Don Quijote de La Mancha I', 1),
	(2, 'El principito',2),
	(3, 'El príncipe', 3),
	(4, 'Diplomacia', 3),
	(5, 'Don Quijote de La Mancha II ', 1);
COMMIT;

-- Modificar la tabla “libros”, agregando la columna autor y precio.
BEGIN TRANSACTION;
ALTER TABLE libros 
	ADD COLUMN autor VARCHAR(150),
	ADD COLUMN precio INT;
COMMIT;

-- Agregar autor y precio a los libros ya ingresados.
BEGIN TRANSACTION;
UPDATE libros 
	SET autor = 'Miguel de Cervantes', 
	    precio = 150 
	WHERE codigo = 1;
	
UPDATE libros 
	SET autor = 'Antoine SaintExupery', 
	    precio = 120 
	WHERE codigo = 2;
	
UPDATE libros 
	SET autor = 'Maquiavelo', 
	    precio = 180 
	WHERE codigo = 3;
	
UPDATE libros 
	SET autor = 'Henry Kissinger', 
	    precio = 170 
	WHERE codigo = 4;
	
UPDATE libros 
	SET autor = 'Miguel de Cervantes', 
	    precio = 140 
	WHERE codigo = 5;
COMMIT;

-- Insertar 2 nuevos libros
BEGIN TRANSACTION;
INSERT INTO libros VALUES
	(6, 'El túnel', 2, 'Ernesto Sábato', 150),
	(7, '1984',3, 'George Orwell', 130);
COMMIT;

-- Eliminar los libros de la editorial Anaya(código 1), solo en memoria (ROLLBACK)
BEGIN TRANSACTION;
DELETE FROM libros WHERE codigoeditorial = 1
ROLLBACK

SELECT * FROM libros

-- Actualizar el nombre de la editorial Andina a Iberlibro en memoria,
--actualizar el nombre de la editorial S.M. a Mountain en disco duro 
-- (SAVEPOINT / ROLLBACK TO).
BEGIN TRANSACTION;
UPDATE editoriales SET nombre = 'Mountain' WHERE codigo = 3;
SAVEPOINT mountain;
UPDATE editoriales SET nombre = 'Iberlibro' WHERE codigo = 1;
ROLLBACK TO mountain;
COMMIT;

