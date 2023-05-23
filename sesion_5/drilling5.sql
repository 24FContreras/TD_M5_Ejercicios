CREATE DATABASE peliculas

BEGIN TRANSACTION;
CREATE TABLE peliculas(
	id INT PRIMARY KEY, 
	pelicula VARCHAR(200),
	estreno INT,
	director VARCHAR(200)
);

CREATE TABLE reparto(
	id_pelicula INT,
	actor VARCHAR (200),
	CONSTRAINT fk_peliculas 
		FOREIGN KEY (id_pelicula) 
		REFERENCES peliculas(id) 
		ON DELETE CASCADE);
COMMIT;

-- POPULAR TABLAS (ejecutado en shell)
-- \COPY “peliculas” FROM ‘C:\Users\usuario\Desktop\Webdev\edutecno\ApoyoCSV\peliculas.csv’ WITH CSV;
-- \COPY “reparto” FROM ‘C:\Users\usuario\Desktop\Webdev\edutecno\ApoyoCSV\reparto.csv’ WITH CSV;

-- listar todos los actores que aparecen en la película "Titanic", 
-- indicando el título de la película, año de estreno, director y todo el reparto.
SELECT reparto.actor, peliculas.pelicula, peliculas.estreno, peliculas.director
	from peliculas
	LEFT JOIN reparto
	ON peliculas.id = reparto.id_pelicula
	WHERE id_pelicula = 2;


-- Listar los 10 directores más populares, indicando su nombre y 
-- cuántas películas aparecen en el top 100.
SELECT director, COUNT(peliculas) AS cantidad_peliculas FROM peliculas 
	GROUP BY director 
	ORDER BY cantidad_peliculas DESC
	LIMIT 10;
	

-- Indicar cuántos actores distintos hay.
SELECT COUNT(DISTINCT(actor)) AS numero_actores FROM reparto


-- Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos), 
--ordenadas por título de manera ascendente.
SELECT pelicula, estreno 
	FROM peliculas 
	WHERE estreno >= 1990 AND estreno <= 1999 
	ORDER BY pelicula ASC;


-- Listar los actores de la película más nueva.
SELECT actor FROM reparto  WHERE id_pelicula = (SELECT id from peliculas ORDER BY estreno DESC LIMIT 1);


-- Inserte los datos de una nueva película solo en memoria, y otra película en el disco duro.
BEGIN TRANSACTION;
INSERT INTO peliculas VALUES(101, 'Inside Out', 2015, 'Pete Docter');
SAVEPOINT moviesave;
INSERT INTO peliculas VALUES(102, 'Soul', 2020, 'Pete Docter');
ROLLBACK TO moviesave;
COMMIT;


-- Actualice 5 directores utilizando ROLLBACK
BEGIN TRANSACTION;
UPDATE peliculas 
	SET director = 'Director 1'
	WHERE id = 1;
	
UPDATE peliculas 
	SET director = 'Director 2'
	WHERE id = 2;
	
UPDATE peliculas 
	SET director = 'Director 3'
	WHERE id = 3;
	
UPDATE peliculas 
	SET director = 'Director 4'
	WHERE id = 4;
	
UPDATE peliculas 
	SET director = 'Director 5'
	WHERE id = 5;
ROLLBACK;


-- Inserte 3 actores a la película “Rambo” utilizando SAVEPOINT
BEGIN TRANSACTION;
INSERT INTO reparto VALUES
	(72, 'Actor 1'),
	(72, 'Actor 2'),
	(72, 'Actor 3');
SAVEPOINT actores_rambo;
COMMIT;


-- Elimina las películas estrenadas el año 2008 solo en memoria.
BEGIN TRANSACTION;
DELETE FROM peliculas WHERE estreno = 2008;
ROLLBACK;


select * from reparto where id_pelicula = 78
-- Inserte 2 actores para cada película estrenada el 2001
BEGIN TRANSACTION;
INSERT INTO reparto (id_pelicula, actor)
	SELECT id, 'Actor N°1' FROM peliculas AS pelis
	WHERE pelis.estreno = 2001;
INSERT INTO reparto (id_pelicula, actor)
	SELECT id, 'Actor N°2' FROM peliculas AS pelis
	WHERE pelis.estreno = 2001;
COMMIT;


-- Actualice la película “King Kong” por el nombre de “Donkey Kong”, 
-- sin efectuar cambios en disco duro.
BEGIN TRANSACTION;
UPDATE peliculas
	SET pelicula = 'Donkey Kong'
	WHERE pelicula = 'King Kong';
ROLLBACK;


