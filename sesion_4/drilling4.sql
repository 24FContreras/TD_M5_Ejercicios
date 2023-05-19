-- 1. INSERTA UNA EMPRESA
INSERT INTO empresa VALUES(
	'31305987-7',
	'Herramientas Alto SPA', 
	'Exequiel Fernández 890', 
	'995553422',
	'ventas@herramientasalto.cl',
	'https://herramientasalto.cl'
);

-- 2. INSERTA 5 HERRAMIENTAS
INSERT INTO herramienta VALUES
		(1,'Generador elect. 4T 220V 7,1KW QEP7.5 ADH-AC', 12218),
		(2,'Compresor 100LT 2,0HP ADH-IN', 9990),
		(3,'Trompo BENC 4T TVD150B 5,5HP ADH-TM', 8990),
		(4,'Sierra Caladora 220V 25MM DW331K ADH-BD', 3890),
		(5,'Sierra Circular 220V 7" DWE575K ADH-BD', 3890);

-- 3. INSERTA 3 CLIENTES
INSERT INTO cliente VALUES
		('13433231-4', 'Rodolfo López', 'rodolfo.lopez@mail.com','Avda. Concha Y Toro 223', '995452111'),
		('19366332-7', 'María Pino', 'maria.pino@mail.com','Avda. Los Leones 2455', '998452212'),
		('18234194-1', 'Eduardo Mora', 'eduardo.mora@mail.com','Calle Maipú 48', '998562391');

-- 4. ELIMINA EL ÚLTIMO CLIENTE
DELETE FROM cliente WHERE rut = '18234194-1';

-- 5. ELIMINA LA PRIMERA HERRAMIENTA
DELETE FROM herramienta WHERE idherramienta = 1;

-- 6. INSERTA 2 ARRIENDOS PARA CADA CLIENTE
INSERT INTO arriendo VALUES
	(1, '2020-1-15', 2, 8990, 790000, 3, '13433231-4'),
	(2, '2020-1-15', 7, 3890, 140000, 5, '13433231-4'),
	(3, '2021-8-22', 4, 9990, 626000, 2, '19366332-7'),
	(4, '2022-12-13', 7, 3890, 180000, 4, '19366332-7');

-- 7. MODIFICA EL CORREO DEL PRIMER CLIENTE
UPDATE cliente SET correo = 'ro.lopez@mail.com' WHERE rut = '13433231-4';

-- 8. LISTA TODAS LAS HERRAMIENTAS
SELECT * FROM herramienta;

-- 9. LISTA LOS ARRIENDOS DEL SEGUNDO CLIENTE
SELECT * FROM arriendo WHERE cliente_rut = '19366332-7';

-- 10. LISTA LOS CLIENTES CUYO NOMBRE CONTENGA UNA 'a'
SELECT nombre FROM cliente WHERE nombre LIKE '%a%';

-- 11. LISTA EL NOMBRE DE LA SEGUNDA HERRAMIENTA INSERTADA
SELECT nombre FROM herramienta WHERE idherramienta = 2;

-- 12. MODIFICA LOS PRIMEROS 2 ARRIENDOS INSERTADOS CON FECHA 15/01/2020
UPDATE arriendo SET dias = 8 WHERE fecha = '2020-01-15' AND folio = 1;
UPDATE arriendo SET dias = 8 WHERE fecha = '2020-01-15' AND folio = 2;

-- 13. LISTA FOLIO, FECHA Y VALORDIA DE LOS ARRIENDOS DE ENERO 2020
SELECT folio, fecha, valordia FROM arriendo WHERE fecha >= '2020-1-1' AND fecha <= '2020-1-31';