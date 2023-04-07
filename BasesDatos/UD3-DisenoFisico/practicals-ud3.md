# BasesDatos — UD3: DDL // PRÁCTICAS


- [BasesDatos — UD3: DDL // PRÁCTICAS](#basesdatos--ud3-ddl--prácticas)
  - [1. "CATERING"](#1-catering)
  - [2. "JUGUETERIA"](#2-jugueteria)
  - [3. Índices "JUGUETERIA"](#3-índices-jugueteria)

```markdown
- [x] MySQL warning '1681': ~~`TINYINT(9)`~~ > `TINYINT`
- [ ] `CHECK` (EJ2)
```

## 1. "CATERING"

<details>

- Crear la Base de Datos "CATERING" siguiendo el Modelo Relacional proporcionado
  - <b>TRABAJADOR</b> (<u>DNI</u>, Nombre, Apellidos, TelFijo, TelMovil, NumSS)
  - <b>COCINERO</b> (<u>DNI</u>, AniosServ) donde DNI referencia TRABAJADOR
  - <b>PINCHE</b> (<u>DNI</u>, FechaNac, DNIjefe) donde DNI referencia TRABAJADOR y DNIjefe referencia COCINERO
  - <b>ALMACEN</b> (<u>NumAlmacen</u>, Nombre, Descripcion)
  - <b>ESTANTERIA</b> (<u>Letra</u>, <u>NumAlmacen</u>, Tamanio) donde NumAlmacen referencia ALMACEN
  - <b>INGREDIENTE</b> (<u>Nombre</u>, LetraEstanteria, NumAlmacen, Cantidad) donde LetraEstanteria y NumAlmacen referencian ESTANTERIA
  - <b>PLATO</b> (<u>IdPlato</u>, Nombre, Tipo)
  - <b>INGREDIENTES-PLATO</b> (<u>IdPlato</u>, <u>NombreIngrediente</u>, Cantidad) donde IdPlato referencia PLATO y NombreIngrediente referencia INGREDIENTE
  - <b>PLATO-COCINERO</b> (<u>IdPlato</u>, <u>DNIcocinero</u>) donde IdPlato referencia PLATO y DNIcocinero referencia COCINERO

![ERD-ejer1](/img/BasesDatos/ud3-ejer1.png)

</details>

> [MySQL-ejer1.sql](/BasesDatos/UD3-DisenoFisico/ud3-CATERING.sql)

```sql
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
```

## 2. "JUGUETERIA"

<details>

- Tenemos el siguiente modelo Relacional de una Base de Datos "JUGUETERIA":
  - <b>TIENDA</b> (<u>CodTienda</u>, Nombre, Direccion, Telefono, Localidad)
  - <b>CLIENTE</b> (<u>CodCliente</u>, Nombre, Apellidos, Telefono, Direccion, CodTienda) donde CodTienda referencia TIENDA
  - <b>TRABAJADOR</b> (<u>CodTrabajador</u>, Nombre, Apellidos, Direccion, Sueldo, TiendaAsignada) donde TiendaAsignada referencia TIENDA
  - <b>CATEGORIA</b> (<u>CodCategoria</u>, Descripcion)
  - <b>JUGUETE</b> (<u>Nombre</u>, Marca, Precio, Categoria) donde Categoria referencia CATEGORIA
  - <b>VENTA</b> (<u>CodCliente</u>, <u>NombreJuguete</u>, Cantidad, Fecha) donde CodCliente referencia CLIENTE y NombreJuguete referencia JUGUETE
- Hemos creado la Base de Datos lanzando las siguientes sentencias:

```sql
CREATE SCHEMA JUGUETERIA;
USE JUGUETERIA;

CREATE TABLE TIENDA (
CodTienda INTEGER AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Direccion VARCHAR(40) NOT NULL,
Telefono char(9) DEFAULT '919991111' CHECK (LEFT(Telefono,2)='91'),
Localidad VARCHAR(20));

CREATE TABLE CLIENTE (
CodCliente INTEGER AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellidos VARCHAR(30),
Telefono CHAR(9) NOT NULL,
Direccion VARCHAR(50),
CodTienda INTEGER,
FOREIGN KEY (CodTienda) REFERENCES TIENDA(CodTienda));

CREATE TABLE TRABAJADOR (
CodTrabajador INTEGER PRIMARY KEY,
Nombre VARCHAR(20) NOT NULL,
Apellidos VARCHAR(30) NOT NULL,
Direccion VARCHAR(50),
Sueldo REAL NOT NULL,
TiendaAsignada INTEGER,
FOREIGN KEY (TiendaAsignada) REFERENCES TIENDA(CodTienda));

CREATE TABLE CATEGORIA (
CodCategoria INTEGER AUTO_INCREMENT PRIMARY KEY,
Descripcion VARCHAR(50));

CREATE TABLE JUGUETE (
Nombre VARCHAR(20) PRIMARY KEY,
Marca VARCHAR(20) NOT NULL,
Precio REAL NOT NULL,
Categoria INTEGER NOT NULL,
FOREIGN KEY (Categoria) REFERENCES CATEGORIA(CodCategoria));

CREATE TABLE VENTA (
CodCliente INTEGER,
NombreJuguete VARCHAR(20),
Cantidad INTEGER NOT NULL,
Fecha DATE NOT NULL,
PRIMARY KEY (CodCliente, NombreJuguete), -- Al ser dos hay que especificarlo así
FOREIGN KEY (CodCliente) REFERENCES CLIENTE(CodCliente),
FOREIGN KEY (NombreJuguete) REFERENCES JUGUETE(Nombre));
```


- Realizar ahora las siguientes modificaciones utilizando la sentencia **ALTER TABLE**:
  - ~~Cambiar el nombre de todas las tablas de la Base de Datos a plural (en una única sentencia). Eg: Tabla JUGUETE -> JUGUETES~~
  - Añadir el campo CodPostal a la tabla TIENDAS.
  - Mover el campo CodPostal de la tabla TIENDAS y ponerlo detrás del campo Direccion.
  - ~~Cambiar el nombre del campo Direccion de la tabla TIENDAS a DirPostal, y que sea un VARCHAR(50) y que esté detrás del campo Teléfono (en una única sentencia).~~
  - Añadir los campos DNI e Email a la tabla CLIENTES (en una única sentencia).
  - Mover el campo DNI de la tabla CLIENTES y ponerlo detrás del campo CodCliente.
  - Modificar el campo Email de la tabla CLIENTES a un VARCHAR(30) y moverlo detrás de Teléfono (en una única sentencia).
  - ~~Borrar el campo DNI de la tabla CLIENTES.~~
  - ~~Añadir el campo Edad (INTEGER) a la tabla JUGUETES detrás del campo Precio.~~
  - Añadir un 1 como valor por defecto para el campo Cantidad de la tabla VENTAS.

</details>

```sql
ALTER TABLE TIENDA
	ADD COLUMN CodPostal CHAR(5) AFTER Direccion;

ALTER TABLE CLIENTE
	ADD COLUMN DNI CHAR(9) AFTER CodCliente,
    ADD COLUMN Email VARCHAR(30) AFTER Telefono;
    
ALTER TABLE VENTA
	ALTER COLUMN Cantidad SET DEFAULT 1;

```

## 3. Índices "JUGUETERIA"

- Según la Base de Datos JUGUETERIA creada en el ejercicio 2, elaborar un listado con los índices de cada tabla. (Ej.: Tabla CATEGORIAS: Índice en campo CodCategoria)

```sql
SELECT DISTINCT
    TABLE_NAME,
    COLUMN_NAME,
    INDEX_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'JUGUETERIA';
```

> @StackOverflow: [How to see indexes for a database or table in MySQL?](https://stackoverflow.com/questions/5213339/how-to-see-indexes-for-a-database-or-table-in-mysql)
>
> @MySQL: [4.24 The INFORMATION_SCHEMA STATISTICS Table](https://dev.mysql.com/doc/mysql-infoschema-excerpt/5.7/en/information-schema-statistics-table.html)