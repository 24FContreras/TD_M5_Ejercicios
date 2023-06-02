-- 1. Listar los clientes sin arriendos por medio de una subconsulta.
SELECT * FROM cliente WHERE rut NOT IN (SELECT cliente_rut FROM arriendo);


-- 2. Listar todos los arriendos con las siguientes columnas: Folio, Fecha, 
-- Dias, ValorDia, NombreCliente, RutCliente
SELECT folio AS "Folio", 
	   fecha AS "Fecha", 
	   dias AS "Dias", 
	   valordia AS "valorDia", 
	   nombre AS "NombreCliente",
	   rut AS "RutCliente" FROM arriendo
	LEFT JOIN cliente ON rut = cliente_rut;


-- 3. Clasificar los clientes
-- ariendos mensuales: 0-1 incluído: bajo, 1-3 excluído: medio, 3 o más: alto
SELECT TO_CHAR(fecha,'YYYY-MM') AS "Mes",
	   nombre AS "Nombre_Cliente",
	   rut AS "Rut_Cliente", 
	   COUNT(folio) as "Cantidad_Arriendos",
	   CASE
	   	WHEN COUNT(folio) BETWEEN 0 AND 1 THEN 'Bajo'
	   	WHEN COUNT(folio) BETWEEN 1 AND 3 THEN 'Medio'
	   	ELSE 'Alto' END AS Clasificacion
	   FROM cliente
	   LEFT JOIN arriendo ON rut = cliente_rut
	   GROUP BY rut, TO_CHAR(fecha, 'YYYY-MM');


-- 4. Por medio de una subconsulta, listar los clientes con el nombre de la 
-- herramienta más arrendada.
SELECT DISTINCT ON(cliente_rut)
	cliente.nombre AS "Cliente", 
	herramienta.nombre AS "Herramienta", 
	cantidadArriendos AS "Veces_Arrendada" 
	FROM(
		SELECT cliente_rut, herramienta_idherramienta, COUNT(herramienta_idherramienta) AS cantidadArriendos
		FROM arriendo
		GROUP BY cliente_rut, herramienta_idherramienta) AS cuenta
	INNER JOIN cliente ON cliente_rut = rut
	INNER JOIN herramienta ON idherramienta = herramienta_idherramienta
	ORDER BY cliente_rut, cantidadArriendos DESC;