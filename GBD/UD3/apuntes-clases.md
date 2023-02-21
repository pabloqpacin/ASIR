# UD3 - Diseño Físico de Bases de Datos

<details>
<summary>Table of Contents</summary>

- [UD3 - Diseño Físico de Bases de Datos](#ud3---diseño-físico-de-bases-de-datos)
  - [1. SQL Basic Concepts ](#1-sql-basic-concepts-)
    - [1.1 aproximación histórica](#11-aproximación-histórica)
    - [1.2 Tipos de Comandos SQL {D.M.Q.C} ](#12-tipos-de-comandos-sql-dmqc-)
    - [1.3 Notación Sintaxis SQL](#13-notación-sintaxis-sql)
    - [1.4 Dataypes ](#14-dataypes-)
  - [2. DDL - Data Definition Language \<!--CLASE-16!!\>](#2-ddl---data-definition-language---clase-16)
    - [2.1 Creación de Esquema/Base de Datos (BD) ](#21-creación-de-esquemabase-de-datos-bd-)
    - [2.2 Creación \& Borrado de Tablas y DBs](#22-creación--borrado-de-tablas-y-dbs)
    - [2.3 Restricciones ](#23-restricciones-)
    - [2.4 Integridad Referencial (Restricciones FKs)](#24-integridad-referencial-restricciones-fks)
    - [2.5 Modificación Estructura Tablas](#25-modificación-estructura-tablas)
    - [2.6 índices -aka Keys-](#26-índices--aka-keys-)
    - [2.7 Vistas](#27-vistas)

</details>

## 1. SQL Basic Concepts <!--CLASE-15!!-->

<details>
<summary>1. Categories, Syntax & Dataypes</summary>

### 1.1 aproximación histórica

- Fases (estamos en la cuarta ya!)
    1. Análisis (con clientes)
    2. Diseño conceptual (ERD)
    3. Diseño lógico (*Modelo Relacional* en nuestro caso) 
    4. **Diseño físico** (SQL)
- **SQL-86** unifica criterios

<!-- > Profe indica que "no programaremos" -->

### 1.2 Tipos de Comandos SQL {D.M.Q.C} <!--pregunta examen-->

| SQL | Siglas                   | Ejemplos | Usos           |
| --- | ---                      | ---      | ---            |
| DDL | Data Definition Language | `CREATE` `DROP`         | definir estructura tablas-índices-vistas
| DML | Data Manipulation Lang.  |          | cambiar datos en tablas
| DQL | Data Query Lang.         |          | sólo consulta
| DCL | Data Control Lang.       |          | control usuarios-permisos

<p align="center">
  <img src="/img/GBD/ud3-sql-commands-01.png" alt="SQL-commands" width="600"/>
</p>

> @GeeksForGeeks: [SQL | DDL, DQL, DML, DCL and TCL Commands](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/)

### 1.3 Notación Sintaxis SQL

| Elemento    | Significado |
| ---         | ---         |
| Mayúsculas  | Palabras reservadas (aparecen en azul en MySQL Workbench)
| `;`         | final comando
| `\|` 'Pipe' | alternativas (`OR`)
| `[ ]`       | elemento opcional
| `{ }`       | alternativa obligatoria
| `...`       | repetición último elemento

> **MySQL Workbench** > SQL Additions > Snippets

```sql
-- EJEMPLO
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name { LIKE old_tbl_name | (LIKE old_tbl_name)}
-- ACTUAL CODE
CREATE TABLE clientes LIKE clientes_originales;
```

### 1.4 Dataypes <!--10x-material-->

- Notas:
  - Cada SGBD puede usar distintos tipos de datos, según respectiva documentación
  - Según modelo relacional, una columna == un datatype {restricción frente a usuarios}
  - Argumento en funciones-procedimiento (UD6 ahead)

> @w3schools: [SQL Data Types for MySQL, SQL Server, and MS Access](https://www.w3schools.com/sql/sql_datatypes.asp)

<details>
<summary>Datatypes</summary>

| Strings                       | info
| ---                           | ---
| `CHAR(size)`                  | A FIXED length string (can contain letters, numbers, and special characters). The size parameter specifies the column length in characters - can be from 0 to 255. Default is 1
| `VARCHAR(size)`               | A VARIABLE length string (can contain letters, numbers, and special characters). The size parameter specifies the maximum string length in characters - can be from 0 to 65535
| `TINYTEXT`                    | Holds a string with a maximum length of 255 characters
| `TEXT(size)`                  | Holds a string with a maximum length of 65,535 bytes
| `MEDIUMTEXT`                  | Holds a string with a maximum length of 16,777,215 characters
| `LONGTEXT`                    | Holds a string with a maximum length of 4,294,967,295 characters
| `ENUM(val1,val2,val3,...)` | A string object that can have only one value, chosen from a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted. The values are sorted in the order you enter them

| Números            | info |
| ---                | ---  |
| `TINYINT(size)`    | A very small integer. Signed range is from -128 to 127. Unsigned range is from 0 to 255. The size parameter specifies the maximum display width (which is 255)
| `BOOL`             | 0 or 1
| `SMALLINT`         | A small integer. Signed range is from -32768 to 32767. Unsigned range is from 0 to 65535. The size parameter specifies the maximum display width (which is 255)
| `INT(size)`        | A medium integer. Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The size parameter specifies the maximum display width (which is 255)
| `real`             | '7 dígitos de precisión (simple)'
| `DOUBLE(size,d)`   | A normal-size floating point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter <!--15 dígitos (precisión doble)-->
| `DECIMAL(size,d)` | An exact fixed-point number. The total number of digits is specified in size. The number of digits after the decimal point is specified in the d parameter. The maximum number for size is 65. The maximum number for d is 30. The default value for size is 10. The default value for d is 0.
| `numeric(p,s)`     | valores decimales de precisión **fija** (eg. fracción tal cual 1/3)

> **Note:** All the numeric data types may have an extra option: `UNSIGNED` or `ZEROFILL`. If you add the `UNSIGNED` option, MySQL disallows negative values for the column. If you add the `ZEROFILL` option, MySQL automatically also adds the UNSIGNED attribute to the column.

| Fechas     | info |
| ---        | ---  |
| `DATE`     | YYYY-MM-DD
| `DATETIME` | YYYY-MM-DD hh:mm:ss
| `TIME`     | hh:mm:ss
| `YEAR`     | YYYY


> - @Microsoft: [int, bigint, smallint, and tinyint (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/data-types/int-bigint-smallint-and-tinyint-transact-sql?view=sql-server-ver16)

</details>

</details>

## 2. DDL - Data Definition Language <!--CLASE-16!!>

- Definición de:
  - Tablas: Columnas
  - Índices: Aliases
  - Vistas: Procedimientos
- Consideraciones
  - **OBJETOS** == tablas, columnas, índices, aliases, vistas, procedimientos
  - EVITAR: `-` `/` `\` `.` // USAR: `_`
  - Comentarios:

```sql
-- línea
# línea
/* multilínea
multilínea /*
```

### 2.1 Creación de Esquema/Base de Datos (BD) <!--2.4 según TEORÍA-->

```sql
/* 1. Crear BD
CREATE {SCHEMA | DATABASE} <nombre_BD>; */
CREATE DATABASE pedidos;

/* 2. Seleccionar BD
USE <nombre_BD>; */
USE pedidos;

-- UPDATE: Navigator > Schemas {!}
```

### 2.2 Creación & Borrado de Tablas y DBs

<!-- OJO!
- mind '<nombre_BS>.' to reference other Schemas
- Defaults: if create data with no value, value becomes table's column default datatype (columns)
- Botón Información en tabla!
-->

```sql
-- 3. Crear Tabla
CREATE TABLE pedido_articulo(
    NumPedido INT,
    NumArticulo INT,
    Cantidad INT,
    PRIMARY KEY (NumPedido, NumArticulo)
);

-- 4. Eliminar Tabla
DROP TABLE pedido_articulo;
DROP DATABASE pedidos;
```

### 2.3 Restricciones <!--Constraints-->

- Garantizan la integridad de los datos
- Se pueden definir bien durante bien tras la creación de la tabla <!-- con `ALTER TABLE` -->
- **Nombre único** para restricciones (eg. PK, FK1, FK2, ...)

| Restricción      | info |
| ---              | ---  |
| `PRIMARY KEY`    | 1 o varias `not null` columnas! (ie. misma línea o final CREATE command); `unique`!! [(w3-doc)](https://www.w3schools.com/sql/sql_primarykey.ASP)
| `UNIQUE`         | valores de este campo no se pueden repetir, 'las instancias de X no pueden coincidir'
| `NOT NULL`       | Obligatoriedad de valor, 'debe existir' <!--aunque sea 0-->
| `AUTO_INCREMENT` | (solo columnas numéricas) hace **max+1**
| `CHECK`          | **Condiciones de Comprobación** [(w3-doc)](https://www.w3schools.com/sql/sql_check.asp) // {UD4}
| `COMMENT "foo"`  | añade contexto
| `FOREGIN KEY`    | [(doc)](https://www.w3schools.com/sql/sql_foreignkey.asp) siempre al final // `FOREIGN KEY (col1, col2...) REFERENCES <tabla> (col1-PK, col2-PK...)`

<details>
<summary>Ejemplos [3]</summary>

```sql
-- Ejemplo PRIMARY KEY de w3shools
CREATE TABLE Persons (
    -- ID int NOT NULL PRIMARY KEY,
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
```

```sql
-- Primary & Foreign Keys

CREATE TABLE Articulos (
    NumArticulo SMALLINT PRIMARY KEY auto_increment,
    Descripcion VARCHAR(50)
);

CREATE TABLE Fabricas (
    NumFabrica CHAR(6) PRIMARY KEY COMMENT "EG. F004",
    Telefono CHAR(12)
);

CREATE TABLE Fabricantes (
    Codigo CHAR(6) PRIMARY KEY,
    Nombre VARCHAR(50)
);


CREATE TABLE Fabricacion (
    NumArticulo SMALLINT,
    NumFabrica CHAR(6),
    CodigoFabricante CHAR(6),
    Existencias INT,
    FOREIGN KEY (NumArticulo) REFERENCES Articulos (NumArticulo)
        ON UPDATE CASCADE -- meaning replicate changes in both instances
        ON DELETE CASCADE, -- meaning deleted NumArticulo > deleted Fabricacion (instances)
    FOREIGN KEY (NumFabrica) REFERENCES Fabricas (NumFabrica)
        ON UPDATE CASCADE
        ON DELETE SET NULL, -- meaning deleted factory only leaves this ref as NULL
    FOREIGN KEY (CodigoFabricante) REFERENCES Fabricantes (Codigo),
    PRIMARY KEY (NumArticulo, NumFabrica)
);

-- VERIFY: Navigator > 'i'
```

```sql
-- Awful confusing example provided by our 'teacher'...
CREATE TABLE clientes(
    NumCliente INT PRIMARY KEY auto_increment,
    Saldo REAL NOT NULL DEFAULT 0;
    LimCredito INT COMMENT "Según categoría cliente",
    Descuento SMALLINT,
    -- PRIMARY KEY (NumCliente, Saldo), // another option
    UNIQUE (LimCredito, Descuento), -- only if relevant... ffs
    CHECK (Descuento <= 60)
);

-- VERIFY: Navigator > Schemas > 'i'
```

</details>


### 2.4 Integridad Referencial (Restricciones FKs) 

<!-- Gestión de tablas cuyas columnas son claves foráneas en otras tablas -->

- Apartados-restricciones que pueden acompañar a `FOREIGN KEY`:
  - `ON UPDATE <accion>`
  - `ON DELETE <accion>`
  <!-- - NOTE: Una FK referenciada, muchas posibles **referencias** (restricción al referenciar) -->
- Posibles acciones:

| Acción                 | Política equivalente |
| ---                    | ---          |
| `NO ACTION / RESTRICT` | Política de restricción (default)
| `CASCADE`              | Actualización en cascada
| `SET NUL`              | Política de anulación (requiere poder admitir NULL)


```sql
-- Sintaxis
[CONSTRAINT <nombre_restricción>]
    FOREIGN KEY (col1, col2…) REFERENCES <tabla> (col1, col2…)
    [ON DELETE <acción>] [ON UPDATE <acción>];
```
<details>
<summary>Políticas de Integridad Referencial</summary>

```markdown
# Políticas de Integridad Referencial (UD2)

## 1. Política de restricción
Prohibe la operación de actualización de que se trate:
- BORRADO: no permitirá eliminar una tupla si su clave primaria (PK) está referenciada desde alguna clave foránea (FK).
- MODIFICACIÓN: no permitirá alterar el valor de ninguno de los atributos que forman la PK de una tupla, si ésta está referenciada desde alguna FK.

## 2. Actualización en cascada
Permite la operación de actualización, disponiendo al mismo tiempo una serie de operaciones compensatorias que propaguen en cascada las actualizaciones necesarias para que se mantenga la integridad referencial de las tuplas que referencian, desde los atributos que forman la FK, a la tupla objeto de actualización:
- BORRADO: se eliminarán todas los tuplas que hagan referencia a la tupla eliminada.
- MODIFICACIÓN: los valores de los atributos que formen parte de la FK de las tuplas que hagan referencia a la tupla modificada, se transformarán para continuar coincidiendo con los nuevos valores de la PK de la tupla a la que hacen referencia.

# 3. Política de anulación
Permite la operación de actualización de que se trate en una tupla determinada, otorgando valores nulos en todos los atributos que formen parte de las FKs de las tuplas que hagan referencia a la tupla objeto de actualización:
- BORRADO: los atributos de la FK de las tuplas que hagan referencia a la tupla borrada pasarán a tener valor nulo, y no indicarán ningún tipo de conexión.
- MODIFICACIÓN: los atributos de la FK de las tuplas que hagan referencia a la tupla modificada pasarán a tener valor nulo, y no indicarán ningún tipo de conexión.
(La política de anulación sólo puede aplicarse si los atributos de las FKs implicadas admiten los valores nulos.)
```
</details>

### 2.5 Modificación Estructura Tablas

- Objetivos
  - Modificar columnas
  - Modificar restricciones columnas
- Consideraciones
  - Si la tabla contiene datos, evitar contradicciones (datatypes, NULL, tamaño...)
  - 'Ignorar `IGNORE`'
  - `[FIRST | AFTER <col>]` generally accepted with other arguments...



| `ALTER TABLE`          | info                        | `FIRST\|AFTER` ? |
| ---                    | ---                         | ---              |
| `ADD COLUMN`           | Nueva                       | [x]
| `CHANGE COLUMN`        | Renombrar                   | [x]
| `RENAME`               | Renombrar
| `MODIFY COLUMN`        | Change Datatype(size)       | [x]
| `DROP COLUMN`          |                             |
| `ALTER COLUMN`         | Prep for...                 |
| ALTER > `SET DEFAULT`  | Cambiar *valor por defecto* |
| ALTER > `DROP DEFAULT` |                             |
| `ADD <restriccion>`    | PK, Unique, FK
| `DROP <restriccion>`   | PK, INDEX\|KEY, **FK**
| `ADD {INDEX\|KEY}`     | ...
| `ENABLE KEYS`          | ...
| `DISABLE KEYS`         | ...
| `ORDER BY`             | ('stable' tables)


```sql
/* CREATE TABLE Test (
    ColExisting INT,
    ColEliminada INT,
    ColValDefault INT DEFAULT 12,
    ColDatatype VARCHAR(30),
    ColVieja INT,
    LastColumn INT,
); */

ALTER TABLE Test
    ADD COLUMN ColNew INT AFTER ColExisting,
    ADD COLUMN (ColAnother INT,
        ColYetAnother INT),
    DROP ColEliminada,
    ALTER ColValDefault SET DEFAULT 0,
    MODIFY ColDatatype VARCHAR(50) AFTER LastColumn,
    CHANGE ColVieja ColNueva INT FIRST;
    -- ADD PRIMARY KEY ...
```

### 2.6 índices -aka Keys-

- DEFINICIÓN: punto a una fila de una determinada tabla; acceso más rápido a los datos.
- FUNCIONAMIENTO: consulta tabla Índices aparte
- TIPOS <!--según algoritmo-->
  - **Balanced-TREE**
  - **HASH**
- Columnas-objetivo: *PK* & *Unique*
- OJO: `INDEX` == `KEY`
- Ventajas VS Desventajas


```sql
-- CREAR
CREATE [UNIQUE] INDEX <nombreIndex>
    [USING {BTREE|HASH}] ON <tabla> (col1, col2...);

-- MOSTRAR
SHOW INDEXES FROM <tabla>;

-- ELIMINAR
DROP INDEX <nombreIndex> ON <tabla>;
```

### 2.7 Vistas

<!--w3schools: https://www.w3schools.com/sql/sql_view.asp -->

- DEFINICIÓN: tabla virtual de consulta, no contiene datos propios sino 'referencias' mediante sentencia `SELECT` (UD4!)

```sql
CREATE [OR REPLACE] VIEW <nombreVista> [(col1, col2...)];
-- ignoring the juicy stuff tho ffs
```



<!--
---

## n. OPERAR

```sql
INSERT INTO clientes VALUES
(1,25,50,1000,10);
```

<!--CLASE-17-->