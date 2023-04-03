CREATE SCHEMA IF NOT EXISTS CATERING;
USE CATERING; 

CREATE TABLE Trabajador (
	DNI CHAR(9),
    Nombre VARCHAR(20) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    TelFijo TINYINT,
    TelMovil VARCHAR(15) NOT NULL,
    NumSS VARCHAR(12) UNIQUE,
    PRIMARY KEY (DNI)
);

CREATE TABLE Cocinero (
	DNI CHAR(9),
    AniosServ TINYINT,
    FOREIGN KEY (DNI) REFERENCES Trabajador (DNI)
		ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (DNI)
);

CREATE TABLE Pinche (
	DNI CHAR(9),
    FechaNac DATE,
    DNIjefe CHAR(9) NOT NULL,
    FOREIGN KEY (DNI) REFERENCES Trabajador (DNI) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (DNIjefe) REFERENCES Cocinero (DNI) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (DNI)
);

-- ALTER TABLE Pinche MODIFY DNIjefe CHAR(9) NOT NULL;

CREATE TABLE Almacen (
	NumAlmacen TINYINT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(200),
    PRIMARY KEY (NumAlmacen)
);

CREATE TABLE Estanteria (
	Letra CHAR(3),
    NumAlmacen TINYINT,
    Tamanio VARCHAR(20),
    FOREIGN KEY (NumAlmacen) REFERENCES Almacen (NumAlmacen)
		ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (Letra, NumAlmacen)
);

CREATE TABLE Ingrediente (
	Nombre VARCHAR(50),
    LetraEstanteria CHAR(3),
    NumALmacen TINYINT,
    Cantidad FLOAT NOT NULL,
    FOREIGN KEY (LetraEstanteria, NumAlmacen) REFERENCES Estanteria (Letra, NumAlmacen)
		ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (Nombre)
);

CREATE TABLE Plato (
	IdPlato CHAR(9),
    Nombre VARCHAR(50) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (IdPlato)
);

CREATE TABLE Ingrediente_Plato (
	IdPlato CHAR(9),
    NombreIngrediente VARCHAR(50),
    Cantidad FLOAT NOT NULL,
    FOREIGN KEY (IdPlato) REFERENCES Plato (IdPlato) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (NombreIngrediente) REFERENCES Ingrediente (Nombre) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (IdPlato, NombreIngrediente)
);

CREATE TABLE Plato_Cocinero (
	IdPlato CHAR(9),
    DNIcocinero CHAR(9),
    FOREIGN KEY (IdPlato) REFERENCES Plato (IdPlato) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (DNIcocinero) REFERENCES Cocinero (DNI) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY (IdPlato, DNIcocinero)
);