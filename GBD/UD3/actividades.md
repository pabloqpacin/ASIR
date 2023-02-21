# Actividades UD3 (DDL)


## 1. `CREATE` BD-CATERING

```markdown
- [x] TRABAJADOR (_DNI_, Nombre, Apellidos, TelFijo, TelMovil, NumSS)
- [x] COCINERO (_DNI_, AniosServ) donde DNI referencia TRABAJADOR
- [x] PINCHE (_DNI_, FechaNac, DNIjefe) donde DNI referencia TRABAJADOR y DNIjefe referencia COCINERO
- [x] ALMACEN (_NumAlmacen_, Nombre, Descripcion)
- [x] ESTANTERIA (_Letra_, _NumAlmacen_, Tamanio) donde NumAlmacen referencia ALMACEN
- [x] INGREDIENTE (_Nombre_, LetraEstanteria, NumAlmacen, Cantidad) donde LetraEstanteria y NumAlmacen referencian ESTANTERIA
- [x] PLATO (_IdPlato_, Nombre, Tipo)
- [x] INGREDIENTES-PLATO (_IdPlato_, _NombreIngrediente_, Cantidad) donde IdPlato referencia PLATO y NombreIngrediente referencia INGREDIENTE
- [x] PLATO-COCINERO (_IdPlato_, _DNIcocinero_) donde IdPlato referencia PLATO y DNIcocinero referencia COCINERO
```

```sql
CREATE DATABASE Catering;
USE Catering;

-- Should 'NumSS' be stored as plain text? I don't think so...


/* PERSONAS */
CREATE TABLE Trabajador (
    DNI CHAR(9),
    Nombre VARCHAR(55) NOT NULL,
    Apellidos VARCHAR(55) NOT NULL,
    TelFijo CHAR(12),
    TelMovil CHAR(12) NOT NULL,
    NumSS INT UNIQUE,
    PRIMARY KEY (DNI)
);

CREATE TABLE Cocinero (
    DNI CHAR(9) PRIMARY KEY,
    AnyosServ INT NOT NULL,
    FOREIGN KEY (DNI) REFERENCES Trabajador(DNI) ON DELETE CASCADE
);

CREATE TABLE Pinche (
    DNI CHAR(9) PRIMARY KEY,
    FechaNac DATE,
    DNIjefe CHAR(9) NOT NULL,
    FOREIGN KEY (DNI) REFERENCES Trabajador(DNI) ON DELETE CASCADE,
    FOREIGN KEY (DNIjefe) REFERENCES Cocinero(DNI) ON DELETE RESTRICT ON UPDATE CASCADE --explain?
);


/* PRODUCTOS */
CREATE TABLE Almacen (
    NumAlmacen INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(55) NOT NULL,
    Descripcion VARCHAR(255);
);

CREATE TABLE Estanteria (
    Letra CHAR(1),
    NumAlmacen INT,
    Tamanyo REAL comment '?',
    PRIMARY KEY (Letra, NumAlmacen),
    FOREIGN KEY (NumAlmacen) REFERENCES Almacen (NumAlmacen) ON DELETE RESTRICT --ojoVSprofe
);

CREATE TABLE Ingrediente (
    Nombre VARCHAR(55) PRIMARY KEY
    LetraEstantería CHAR(1),
    NumAlmacen INT,
    Cantidad REAL NOT NULL,
    FOREIGN KEY (LetraEstanteria, NumAlmacen) REFERENCES Estanteria (Letra, NumAlmacen) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Plato (
    IdPlato INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(255) NOT NULL,
    Tipo CHAR(255) NOT NULL
);

CREATE TABLE IngredientesPlato (
    IdPlato INT,
    NombreIngrediente VARCHAR(55),
    Cantidad REAL NOT NULL,
    PRIMARY KEY (IdPlato, NombreIngrediente),
    FOREIGN KEY (IdPlato) REFERENCES Plato (IdPlato) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (NombreIngrediente) REFERENCES Ingrediente (Nombre) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE PlatoCocinero (
    IdPlato INT,
    DNIcocinero CHAR(9),
    PRIMARY KEY (IdPlato, DNIcocinero),
    FOREIGN KEY IdPlato REFERENCES Plato (IdPlato) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY DNIcocinero REFERENCES Cocinero (DNI) ON DELETE CASCADE ON UPDATE CASCADE
);


/* NOTAS
    - ojo 'REAL'
    - ojo lógica!! 'ON DELETE/UPDATE'

*/
```

## 2. `ALTER` BD-JUGUETERÍA
## 3. `KEYS` BD-JUGUETERÍA