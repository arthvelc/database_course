-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS AerolineasDB;
USE AerolineasDB;

-- Crear la tabla de tipos de aviones
CREATE TABLE TipoAvion (
    TipoAvionID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Fabricante VARCHAR(50) NOT NULL,
    CantidadAsientos INT NOT NULL
);

-- Insertar datos en la tabla TipoAvion
INSERT INTO TipoAvion (Nombre, Fabricante, CantidadAsientos) VALUES
('Boeing 747', 'Boeing', 300),
('Airbus A380', 'Airbus', 500),
('Boeing 777', 'Boeing', 350),
('Airbus A320', 'Airbus', 200),
('Embraer E190', 'Embraer', 100);

-- Crear la tabla de empleados
CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NOT NULL,
    Puesto VARCHAR(50) NOT NULL
);

-- Insertar datos en la tabla Empleado
INSERT INTO Empleado (Nombre, ApellidoPaterno, ApellidoMaterno, Puesto) VALUES
('Juan', 'López', 'García', 'Piloto'),
('María', 'Martínez', 'Fernández', 'Azafata'),
('Pedro', 'González', 'Pérez', 'Mecánico'),
('Ana', 'Díaz', 'Rodríguez', 'Administrativo');

-- Crear la tabla de vuelos
CREATE TABLE Vuelo (
    VueloID INT PRIMARY KEY AUTO_INCREMENT,
    Origen VARCHAR(100) NOT NULL,
    Destino VARCHAR(100) NOT NULL,
    Fecha DATE NOT NULL,
    PrecioAsiento DECIMAL(10, 2) NOT NULL,
    LugaresDisponibles INT NOT NULL
);

-- Insertar datos en la tabla Vuelo
INSERT INTO Vuelo (Origen, Destino, Fecha, PrecioAsiento, LugaresDisponibles) VALUES
('Ciudad de México', 'Madrid', '2024-05-10', 1500.00, 200),
('Nueva York', 'París', '2024-05-12', 1200.00, 150),
('Los Ángeles', 'Tokio', '2024-05-15', 2000.00, 300),
('Londres', 'Roma', '2024-05-18', 1800.00, 180),
('Berlín', 'Sidney', '2024-05-20', 2500.00, 250);

-- Crear la tabla de clientes
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NOT NULL,
    TipoCliente VARCHAR(20) NOT NULL,
    FechaRegistro DATE NOT NULL
);

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (Nombre, ApellidoPaterno, ApellidoMaterno, TipoCliente, FechaRegistro) VALUES
('Carlos', 'Gómez', 'López', 'Platino', '2023-04-20'),
('Laura', 'Hernández', 'Martínez', 'Oro', '2023-06-15'),
('Roberto', 'Pérez', 'González', 'Oro', '2024-01-10'),
('Sofía', 'Rodríguez', 'Díaz', 'Platino', '2022-09-30'),
('Ana', 'Martínez', 'Sánchez', 'Normal', '2024-03-05');

-- Crear la tabla de aerolíneas
CREATE TABLE Aerolinea (
    AerolineaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50) NOT NULL
);

-- Insertar datos en la tabla Aerolinea
INSERT INTO Aerolinea (Nombre, Nacionalidad) VALUES
('Aeroméxico', 'México'),
('American Airlines', 'Estados Unidos'),
('Air France', 'Francia'),
('Lufthansa', 'Alemania'),
('Emirates', 'Emiratos Árabes Unidos');

-- Crear la tabla de compras
CREATE TABLE Compra (
    CompraID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT NOT NULL,
    VueloID INT NOT NULL,
    FechaCompra DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (VueloID) REFERENCES Vuelo(VueloID)
);

-- Insertar datos en la tabla Compra
INSERT INTO Compra (ClienteID, VueloID, FechaCompra) VALUES
(1, 1, '2024-05-05'),
(2, 3, '2024-04-25'),
(3, 4, '2024-05-01'),
(4, 2, '2024-04-30'),
(5, 5, '2024-05-02');

-- Crear la tabla de domicilios
CREATE TABLE Domicilio (
    DomicilioID INT PRIMARY KEY AUTO_INCREMENT,
    Calle VARCHAR(100) NOT NULL,
    Colonia VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100) NOT NULL,
    CodigoPostal VARCHAR(10) NOT NULL
);

-- Insertar datos en la tabla Domicilio
INSERT INTO Domicilio (Calle, Colonia, Ciudad, CodigoPostal) VALUES
('Av. Reforma', 'Centro', 'Ciudad de México', '06030'),
('Av. Juárez', 'Condesa', 'Ciudad de México', '06140'),
('Av. Insurgentes', 'Roma', 'Ciudad de México', '06700'),
('Calle 5', 'Juárez', 'Puebla', '72000'),
('Av. Constitución', 'Centro', 'Guadalajara', '44100');

-- Mostrar la base de datos creada
SHOW TABLES;

