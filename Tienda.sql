
CREATE DATABASE TiendaDB;
GO

USE TiendaDB;
GO

CREATE TABLE Clientes (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(150) NOT NULL,
    Direccion NVARCHAR(255),
	Correo NVARCHAR(100) NOT NULL DEFAULT '',
    Contrasena NVARCHAR(255) NOT NULL DEFAULT ''
);
GO

CREATE TABLE Tiendas (
    IdTienda INT IDENTITY(1,1) PRIMARY KEY,
    Sucursal NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(255)
);
GO

CREATE TABLE Articulos (
    IdArticulo INT IDENTITY(1,1) PRIMARY KEY,
    Codigo NVARCHAR(50) NOT NULL UNIQUE,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10,2) CHECK (Precio >= 0),
    Imagen NVARCHAR(255),
    Stock INT CHECK (Stock >= 0)
);
GO

CREATE TABLE Articulo_Tienda (
    IdArticulo INT NOT NULL,
    IdTienda INT NOT NULL,
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY (IdArticulo, IdTienda),
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo),
    FOREIGN KEY (IdTienda) REFERENCES Tiendas(IdTienda)
);
GO

CREATE TABLE Cliente_Articulo (
    IdCliente INT NOT NULL,
    IdArticulo INT NOT NULL,
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY (IdCliente, IdArticulo, Fecha),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo)
);
GO

CREATE TABLE Carrito (
    IdCarrito INT IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);
GO

CREATE TABLE CarritoDetalle (
    IdDetalle INT IDENTITY(1,1) PRIMARY KEY,
    IdCarrito INT NOT NULL,
    IdArticulo INT NOT NULL,
    Cantidad INT NOT NULL DEFAULT 1,
    FOREIGN KEY (IdCarrito) REFERENCES Carrito(IdCarrito),
    FOREIGN KEY (IdArticulo) REFERENCES Articulos(IdArticulo)
);