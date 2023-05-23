-- 1. Listar todos los arriendos con las siguientes columnas: Folio, Fecha, Días, 
-- ValorDia, NombreCliente, RutCliente.
SELECT AR.folio AS "Folio",
	   AR.fecha AS "Fecha",
	   AR.dias AS "Dias",
	   AR.valordia AS "ValorDía",
	   CL.nombre AS "NombreCliente",
	   CL.Rut AS "RutCliente"
	   FROM arriendo AS AR
	   LEFT JOIN cliente AS CL ON AR.cliente_rut = CL.rut;
	   
	   
-- 2. Listar los clientes sin arriendos.
-- para mayor claridad insertaré un nuevo cliente sin arriendos
INSERT INTO cliente VALUES('11456234-K','Abel Lagos', 'a.lagos@mail.com', 'Hangaroa 23', '993451277');

SELECT CL.* FROM cliente as CL
LEFT JOIN arriendo AS AR ON cliente_rut = CL.rut
WHERE AR.folio IS NULL;


-- 3. Liste RUT y Nombre de las tablas empresa y cliente.
SELECT rut, nombre, 'Empresa' AS tipo FROM empresa
UNION
SELECT rut, nombre, 'Cliente' AS tipo FROM cliente;


-- 4. Liste la cantidad de arriendos por mes
SELECT TO_CHAR(fecha, 'YYYY-MM') AS "Mes",
	   COUNT(folio) AS "Cantidad_Arriendos"
	    from arriendo
		GROUP BY TO_CHAR(fecha, 'YYYY-MM');
