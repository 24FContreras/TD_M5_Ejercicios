-- 1. Listar los clientes sin ventas por medio de una subconsulta.
SELECT * FROM cliente WHERE rut NOT IN (SELECT cliente_rut FROM venta);


-- 2. Listar todas ventas con las siguientes columnas: Folio, Fecha, Monto, 
-- NombreCliente, RutCliente
SELECT folio AS "Folio", 
	   fecha AS "Fecha", 
	   monto AS "Monto", 
	   nombre AS "NombreCliente", 
	   rut AS "RutCliente" FROM venta
	LEFT JOIN cliente ON rut = cliente_rut;
	
-- 3. Clasificar los clientes
SELECT TO_CHAR(fecha, 'YYYY') AS "Anual",
	   nombre AS "Nombre_Cliente",
	   rut AS "Rut_Cliente", 
	   SUM(monto) AS "Total_Ventas",
	   CASE 
	   	 WHEN SUM(monto) <= 20000000 THEN 'Standar'
	     WHEN SUM(monto) <= 30000000 THEN 'Gold'
	   	 ELSE 'Premium' END AS Clasificacion
	   FROM cliente
	INNER JOIN venta ON rut = cliente_rut
	GROUP BY rut, TO_CHAR(fecha, 'YYYY');
	
	
-- Por medio de una subconsulta, listar las ventas con 
-- la marca de vehículo más vendido (lo tomé como la marca más vendida, en este caso la marca id 2 - mitsubishi)
SELECT venta.* FROM venta
	INNER JOIN vehiculo ON vehiculo_idvehiculo = idvehiculo
	INNER JOIN (
		SELECT marca.idmarca, COUNT(marca.idmarca) AS "Total_vendidos" FROM venta
		INNER JOIN vehiculo ON vehiculo_idvehiculo = idvehiculo
		INNER JOIN marca ON marca_idmarca = idmarca
		GROUP BY marca.idmarca
		ORDER BY COUNT(marca.idmarca) DESC
		LIMIT 1
	) AS topmarca ON marca_idmarca = idmarca