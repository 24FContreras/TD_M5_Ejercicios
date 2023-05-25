-- 1. Listar todos los vehículos que no han sido vendidos.
SELECT VH.* FROM vehiculo AS VH
	LEFT JOIN venta AS VE
		ON VH.idvehiculo = VE.vehiculo_idvehiculo
	WHERE VE.folio IS NULL;


-- 2. Listar todas las ventas de enero del 2020 con las columnas: Folio, FechaVenta,
-- MontoVenta, NombreCliente, RutCliente, Patente, NombreMarca, y Modelo.
SELECT VE.folio AS "Folio", 
	   VE.fecha AS "FechaVenta",
	   VE.monto AS "MontoVenta",
	   CL.nombre AS "NombreCliente",
	   CL.rut AS "RutCliente",
	   VH.patente AS "Patente",
	   MA.nombre AS NombreMarca,
	   VH.Modelo AS "Modelo"
	   FROM venta AS VE
LEFT JOIN cliente AS CL ON VE.cliente_rut = CL.rut
LEFT JOIN vehiculo AS VH ON VH.idvehiculo = VE.vehiculo_idvehiculo
LEFT JOIN marca AS MA ON MA.idmarca = VH.marca_idmarca
WHERE TO_CHAR(fecha, 'YYYY-MM') = '2020-01'


-- 3. Sumar las ventas por mes y marca del año 2020.
SELECT TO_CHAR(fecha, 'YYYY-MM') AS "Mes",
	   SUM(VE.monto) AS "Monto_Ventas",
	   MA.nombre AS "Marca_Vehiculo"
	    FROM venta AS VE
	LEFT JOIN vehiculo AS VH ON VE.vehiculo_idvehiculo = VH.idvehiculo
	LEFT JOIN marca AS MA ON VH.marca_idmarca = MA.idmarca
		WHERE TO_CHAR(fecha, 'YYYY') = '2020'
		GROUP BY TO_CHAR(fecha, 'YYYY-MM'), MA.nombre

-- 3. Liste RUT y Nombre de las tablas empresa y cliente.
SELECT rut, nombre, 'Empresa' AS tipo FROM empresa
UNION
SELECT rut, nombre, 'Cliente' AS tipo FROM cliente;