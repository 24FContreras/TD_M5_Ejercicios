-- TABLA EMPRESA
CREATE TABLE Empresa (
	rut VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(120) NOT NULL,
	direccion VARCHAR(120) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	correo VARCHAR(80) NOT NULL,
	web VARCHAR(50) NOT NULL
)

-- TABLA CLIENTE
CREATE TABLE Cliente(
	rut VARCHAR(10) PRIMARY KEY,
	nombre VARCHAR(120) NOT NULL,
	correo VARCHAR(80) NOT NULL,
	direccion VARCHAR(120) NOT NULL,
	celular VARCHAR(15) NOT NULL,
	alta CHAR(1) NOT NULL
)

--TABLA TIPO DE VEHÍCULO
CREATE TABLE TipoVehiculo(
	IDTipoVehiculo INT PRIMARY KEY,
	Nombre VARCHAR(120) NOT NULL
)

-- TABLA MARCA
CREATE TABLE marca(
	IDMarca INT PRIMARY KEY,
	Nombre VARCHAR(120) NOT NULL
)

-- TABLAS CON RELACIONES

-- TABLA VEHICULO. MARCA NO FUE AGREGADA POR REDUNDANCIA	
CREATE TABLE Vehiculo(
	IDVehiculo INT PRIMARY KEY,
	Patente VARCHAR(10) NOT NULL,
	Modelo VARCHAR(20) NOT NULL,
	Color VARCHAR(15) NOT NULL,
	Precio INT NOT NULL,
	FrecuenciaMantencion INT,
	Marca_IDMarca INT,
	TipoVahiculo_IDTipoVehiculo INT,
	CONSTRAINT Vehiculo_TipoVahiculo_FK 
		FOREIGN KEY(TipoVahiculo_IDTipoVehiculo) 
		REFERENCES TipoVehiculo(IDTipoVehiculo),
	CONSTRAINT Vehiculo_Marca_FK 
		FOREIGN KEY(Marca_IDMarca) 
		REFERENCES Marca(IDMarca)
)

-- TABLA VENTA
CREATE TABLE Venta(
	Folio INT PRIMARY KEY,
	Fecha DATE DEFAULT current_date,
	Vehiculo_IDVehiculo INT NOT NULL UNIQUE,
	Cliente_RUT VARCHAR(10) NOT NULL,
	CONSTRAINT Venta_Cliente_FK 
		FOREIGN KEY(Cliente_RUT) 
		REFERENCES Cliente(RUT),
	CONSTRAINT Venta_Vehiculo_FK 
		FOREIGN KEY(Vehiculo_IDVehiculo) 
		REFERENCES Vehiculo(IDVehiculo)
)

--TABLA MANTENCIÓN
CREATE TABLE Mantencion(
	IDMantencion INT PRIMARY KEY,
	Fecha DATE DEFAULT current_date,
	TrabajosRealizados VARCHAR(1000),
	Venta_Folio INT,
	CONSTRAINT Mantencion_Venta_FK
		FOREIGN KEY(Venta_folio) 
		REFERENCES Venta(Folio)
)


