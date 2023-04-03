# BasesDatos — UD3: Diseño Físico

## ud3-teoria

```markdown
1. Orígenes y evolución de SQL (~SGBD)
   1. Tipos de sentencias SQL
   2. Notación sintaxis
   3. Tipos de Datos
      1. String...
      2. Numéricos...
      3. Fechas...
2. DDL — Lenguaje de Definición de Datos
   1. Reglas e indicaciones → nombrar objetos MySQL
   2. Comentarios en MySQL
   3. Motores de almacenamiento en MySQL
   4. CREACIÓN DE TABLAS
   5. ELIMINACIÓN de Tablas
   6. MODIFICACIÓN de la Estructura de las Tablas
   7. Modificación del nombre de las tablas
   8. ÍNDICES para Tablas
   9. Definición de VISTAS
      1.  Operaciones de Actualización de Vistas en MySQL
  10. Creación y Eliminación de Esquemas/BasesDatos en MySQL
```

---

> @GeeksForGeeks: [SQL | DDL, DQL, DML, DCL and TCL Commands](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/)
>
> @w3resource: [MySQL Data Types](https://www.w3resource.com/mysql/mysql-data-types.php)
>
> @MySQL: [FK Contraints](https://dev.mysql.com/doc/refman/8.0/en/create-table-foreign-keys.html)
>
> @w3schools: [MySQL ALTER TABLE Statement](https://www.w3schools.com/mysql/mysql_alter.asp) &emsp; // @MySQL: [ALTER TABLE Statement](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html)
>
> @StackOverflow: [Restricciones de integridad referencial: CASCADE vs SET NULL vs RESTRICT vs NO ACTION](https://es.stackoverflow.com/questions/105890/qu%C3%A9-significa-cascade-set-null-restrict-no-action-en-mysql)


- Análisis Requisitos > Diseño Conceptual > Diseño Lógico > [!]
1. **Orígenes y evolución de SQL (~SGBD)** == [...]
   1. **Tipos de sentencias SQL** == DDL || DML || TCL || DML || DQL
   2. *Notación sintaxis* == palabrasReservadas=mayúsculas, alternativas=|, opcionalidad=[], altObligatoria={}, repetición=...
   3. **Tipos de Datos**
      1. *String...*
         - `CHAR(255)` == FIJA ie. Corta = espacios // Larga = truncada
         - `VARCHAR(65535)` == VARIABLE con Max
         - `TEXT` == sin Max // Se almacena en sitio "distinto"... // `TINYTEXT` || `TEXT` || `MEDIUTEXT` || `LONGTEXT`
         - `ENUM('op1','op65535')` == si admite NULL, 'op1' populates &emsp; // 
      2. *Numéricos...*
          - `INT(M)` == `TINYINT` [1B] (-128/127 || 0/255 if `UNSIGNED`) || `SMALLINT` [2B] (0/65535) || `MEDIUMINT` [3B] || `INT` [4B] || `BIGINT` [8B]
          - `FLOAT(M,D)` VS `DOUBLE(M,D)` || `REAL(M,D)` == REDONDEO
          - `DECIMAL(M,D)` VS `NUMERIC(M,D)` == NO_REDONDEO
          - `BOOLEAN` == "TINYINT(1)"
      3. *Fechas...*
          - `DATE` == 'YYYY-MM-DD'
          - `DATETIME` == 'YYYY-MM-DD HH:MM:SS'
          - `TIMESTAMP` == "DATETIME" pero NULL => HORA SISTEMA!!
          - `TIME` == 'HHH:MM:SS' &emsp; // DIFF TIEMPO!!
          - `YEAR()` == 'YYYY' &emsp; (2) || (4)
2. **DDL — Lenguaje de Definición de Datos**
   1. *Reglas e indicaciones → nombrar objetos MySQL* == [...]
   2. *Comentarios en MySQL* == `# foo` || `-- foo` || `/* foo */`
   3. [ ] *Motores Almacenamiento* == [InnoDB](https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html)
   4. **CREACIÓN DE TABLAS**
      - *Constraints* == `PRIMARY KEY` || `NOT NULL` || `UNIQUE` || `CHECK (<cond.>)` || `AUTO_INCREMENT` || `COMMENT 'foo'`
      - *C. [FK](https://www.w3schools.com/sql/sql_foreignkey.asp)* == `FOREIGN KEY (col1,col2) REFERENCES <tabla> (col1,col2) [ON DELETE <accion>] [ON UPDATE <accion>]`
        - *Acciones* == `RESTRICT`/`NO ACTION` || `CASCADE` || `SET NULL`
   5. **ELIMINACIÓN de Tablas**
   6. **MODIFICACIÓN de la Estructura de las Tablas** == [10] ([SEE BELOW...](#26-modificación-→-alter-table))
   7. *Modificación nombre tablas* == `RENAME TABLE tal TO cual`
   8. *ÍNDICES para Tablas* == atajo Keys ('Btree' || 'HASH') &emsp; // ([SEE BELOW...](#28-indexes))
   9.  **Definición de VISTAS** == "tabla virtual" vacía-accesoFísica ([SEE BELOW...](#29-vistas))
          1.  Operaciones de *Actualización de Vistas* en MySQL == [?!]
   10.  Creación y Eliminación de Esquemas/BasesDatos en MySQL == [...]

<br>

---

> #### [2.6] Modificación → `ALTER TABLE`

```sql
-- 0. main Clause
ALTER [IGNORE] TABLE Schema.Table
    <OPERACIONES>

-- 1. ADD COLUMN
ADD ColA INT [FIRST | AFTER ColB]
ADD (ColC INT, ColD INT)

-- 2. DROP
DROP ColE

-- 3. MODIFY Data Type // CHANGE Name
MODIFY ColF INT [FIRST | AFTER ColG]
CHANGE ColH ColI INT [FIRST | AFTER ColJ] -- old > new

-- 4. ADD Constraints
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName); -- # https://www.w3schools.com/sql/sql_primarykey.ASP
ADD UNIQUE [INDEX|KEY] -- ...
ADD FOREIGN KEY -- ...

-- 5. DROP Constraints
DROP PRIMARY KEY
DROP {INDEX|KEY} <NomIndex>
DROP FOREIGN KEY <NomFK>

-- 6. ADD Index
ADD {INDEX|KEY} nomIndex tipoIndex nomCol [opcionesIndex]

-- 7. Habilitar / Deshabilitar Indexs
DISABLE KEYS
ENABLE KEYS

-- 8. RENAME Tabla
RENAME TO nuevoNom

-- 9. ORDER BY (?)
ORDER BY col1 [,col2 ,...]

-- 10. Cambiar valor DEFAULT
ALTER Col {SET DEFAULT <tal> | DROP DEFAULT}

```

#### [2.8] Indexes...

```sql
CREATE INDEX nomSchema.nomIndex
    ON nomTable (col1 [ASC|DESC], col2 [ASC|DESC]);

CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX nomIndex [USING {BTREE|HASH}]
    ON nomTable (col1 [longitud] [ASC|DESC]) [opciones_admin];

/*
    - MySQL == only ASC
    - MySQL == only UNIQUE
*/

DROP INDEX nomIndex on nomTable;

SHOW INDEXES FROM nomSchema.nomTable;
```

#### [2.9] Vistas...

```sql
CREATE [OR REPLACE] VIEW nomVista [(col1, col2)]
    AS <'SELECT ...'> [WITH [CASCADED|LOCAL] <checkOption>];

DROP VIEW nomVista [, nomVista2];

ALTER VIEW nomVista [(col1)] AS <'SELECT ...'>;

```

<br><br>

---

> EXTRA!!

```sql
--- Test FLOAT vs REAL vs DOUBLE
CREATE TABLE testin_floaties (
    floa FLOAT,
    rili REAL,
    dabol DOUBLE
);
    --- Alas, 'rili' is stored as DOUBLE :-) */

--- Test BOOL vs TINYINT
CREATE TABLE bulean (
    bul BOOL,
    bulean BOOLEAN,
    taini TINYINT(1)
);
    --- Alas, all stored as TINYINT(1) */
```

```sql
-- How-To FKs

CREATE TABLE justAkey (
	primie int PRIMARY KEY);

CREATE TABLE Restrizio (
	col1_PK_AU int AUTO_INCREMENT,
    col2_NN int NOT NULL,
    col3_Un int UNIQUE,
    col4_Co int COMMENT 'Supdawg',
    col5_FK int,
    -- colX_Ch int CHECK [1-9]{8}[A-Z]{1},
    FOREIGN KEY (col5_FK) REFERENCES justAkey (primie)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
	PRIMARY KEY (col1_PK_AU, col5_FK)
);
```

```sql
-- + ALTER TABLE ...

-- + CREATE INDEX .

-- + CREATE VIEW .
```