-- INSERTA UNA EMPRESA
INSERT INTO empresa VALUES(
	'11467309-2',
	'Credauto SPA', 
	'Santa Isabel 436', 
	'123456789',
	'ventas@credauto.cl',
	'https://credauto.cl'
);

-- INSERTA 2 TIPOS DE VEHÍCULO
INSERT INTO tipovehiculo VALUES(1, 'SUV'),(2, 'Pick Up');

-- INSERTA 3 CLIENTES
INSERT INTO cliente VALUES
		('11495234-1', 'Carlos Vega', 'carlos.vega@mail.com','Almirante Riveros 094', '991126867','N'),
		('20694681-K', 'sofia hernandez', 'sofia.hernandez@mail.com','Tocornal 1993', '995830347','Y'),
		('18435443-6', 'Daniel Sánchez', 'daniel.sanchez@mail.com','Carlos Condell 2394', '99345211','Y');

-- INSERTA 2 MARCAS
INSERT INTO marca VALUES(1,'Chevrolet'),(2, 'Mitsubishi');

-- INSERTA 5 VEHÍCULOS
INSERT INTO vehiculo VALUES
		(1,'FJ-DC-02', 'Eclipse Cross','Rojo', 20490000, 3,2, 1),
		(2,'GG-BA-45', 'Nueva Montana','Azul', 19028100, 5,1, 2),
		(3,'HE-JJ-89', 'Spin','Gris', 14690000, 6,1, 2),
		(4,'KB-EH-74', 'New Outlander','Negro', 26990000, 6,2, 1),
		(5,'LA-CD-38', 'L200 Dakar','Naranjo', 34974100, 4,2, 2);

-- ELIMINA EL ÚLTIMO CLIENTE
DELETE FROM cliente WHERE rut = '18435443-6';

-- INSERTA UNA VENTA POR CADA CLIENTE
INSERT INTO venta VALUES
		(1,'2023-03-10', 19028100, 2, '11495234-1'),
		(2,'2023-04-22', 34974100, 5, '20694681-K');

-- MODIFICA EL NOMBRE DEL SEGUNDO CLIENTE (CORRECCIÓN ORTOGRÁFICA)
UPDATE cliente SET nombre = 'Sofía Hernández' WHERE rut = '20694681-K';

-- LISTAR TODAS LAS VENTAS
SELECT * FROM venta;

-- LISTAR TODAS LAS VENTAS DEL PRIMER CLIENTE
SELECT * FROM venta WHERE cliente_rut = '11495234-1';

-- LISTAR TODAS LAS PATENTES DE LOS VEHÍCULOS
SELECT patente FROM vehiculo;