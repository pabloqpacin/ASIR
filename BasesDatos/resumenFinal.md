# BasesDatos - Resumen Total

<details>
<summary>Table of Contents</summary>

- [BasesDatos - Resumen Total](#basesdatos---resumen-total)
  - [UD1: Sistemas Almacenamiento Información](#ud1-sistemas-almacenamiento-información)
  - [UD2: Diseño Lógico](#ud2-diseño-lógico)
    - [1. Proceso Diseño](#1-proceso-diseño)
    - [2. Modelo Diagramas Entidad-Relación](#2-modelo-diagramas-entidad-relación)
    - [3. Modelo Relacional](#3-modelo-relacional)
      - [3.1 Intro](#31-intro)
      - [3.2 Reglas de Integridad](#32-reglas-de-integridad)
    - [4. Normalización](#4-normalización)
  - [UD3: Diseño Físico (DDL)](#ud3-diseño-físico-ddl)
    - [1. MySQL Intro](#1-mysql-intro)
    - [2. Defición Datos (DDL)](#2-defición-datos-ddl)
  - [UD4: Realización Consultas (DQL)](#ud4-realización-consultas-dql)
    - [1. Consultas Simples](#1-consultas-simples)
    - [2. Consultas Complejas](#2-consultas-complejas)
      - [2.1 Funciones Incorporadas](#21-funciones-incorporadas)
      - [2.2 Control Flujo](#22-control-flujo)
      - [2.3 Agrupamiento](#23-agrupamiento)
      - [2.4 Combinar Tablas](#24-combinar-tablas)
  - [UD5: Edición Datos (DML + TCL)](#ud5-edición-datos-dml--tcl)
    - [1. Manipulación Datos (DML)](#1-manipulación-datos-dml)
    - [2. Control Transacciones y Concurrencia (TCL)](#2-control-transacciones-y-concurrencia-tcl)
  - [UD6: Construcción Guiones](#ud6-construcción-guiones)
    - [1. Funciones](#1-funciones)
    - [2. Procedimientos](#2-procedimientos)
      - [2.1 Parámetros](#21-parámetros)
      - [2.2 Estructuras Condicionales](#22-estructuras-condicionales)
    - [3. Cursores](#3-cursores)
    - [4. Triggers](#4-triggers)
  - [UD7: Seguridad Datos (DCL)](#ud7-seguridad-datos-dcl)

</details>

## UD1: Sistemas Almacenamiento Información

- **Clasificación archivos según:**
  - *Organización:* secuenciales | accesoDirecto | indexados
  - *Contenido:* texto (config, src, web...) | binarios (img, video, ejecutables, comprimidos...)
  - *Temporalidad:* permanentes (maestros|constantes|históricos) | temporales (intermedios|maniobras|resultados)
- **'Mundos' Bases Datos:** real > conceptual > representaciones
- **Conceptos:** dato, entidad, relación, metadatos, tabla, campo/columna, PK, registro/tupla/fila, tipoDato, consulta, índice, vistsa, informe, guiones/scripts,  procedimientos
- **Generaciones:**
  - *1950s:* sistemas de ficheros; cintas magnéticas secuenciales
  - *1960s:* jerárquicas & en red; discos duros
  - *1970s:* Codd's relacionales + SQL
  - *1980s:* orientadas a objetos
  - *...:* distribuidas, Internet
- **Sistemas Gestores de Bases de Datos (DBMS):**
  - *Funciones:* DDL, DML, DCL (seguridad, integridad, concurrencia, recuperación, encriptado)
  - *Componentes:* GestorAlmacenamiento (autorizaciones, transacciones, archivos, buffer) & ProcesadorConsultas (intérpreteDDL, compiladorDML, motorEvaluaciónConsultas)
  - *Tipos:* jerárquico|relacional|OO — centralizado|distribuido

<hr>

## UD2: Diseño Lógico

### 1. Proceso Diseño

- **Fases diseño:**
  - *Análisis*: documento Especificación Requisitos Software
  - *Conceptual:* diagramas Entidad-Relación
  - *Lógico:* modelo relacional
  - *Físico:* SQL

### 2. Modelo Diagramas Entidad-Relación

- **Conceptos:**
  - *Entidad:* `▭` elemento del mundo real, distinguible del resto de cosas, del cual nos interesan algunas propiedades
    - *E-Instancia:* objeto concreto del mundo real (eg. alumno Foo)
    - *E-Tipo:* conjunto de E-Instancias (eg. alumno)
  - *Atributo:* `〇` característica que nos interesa de una Entidad
  - *Clave Primaria:* `_` atributo que identifica unívocamente una determinada E-Instancia
  - *Relación:* `◇` asociación de 2 o más entidades en un diagrama
- **Atributos:**
    - *Dominio:* valores aceptables que puede tomar un atributo en cada instancia
    - *Derivados:* `◌` se pueden inferir en base a otros atributos
    - Características:
      - Posible valor *nulo* en determinada instancia
      - Monovalentes | Polivalentes
      - Simples | Compuestos
  - *Cardinalidad:*
    - (0,1): `--O|` (eg. DNI)
    - (1,1): `--||` (eg. Apellido2)
    - (0,n): `--O{` (eg. Dirección)
    - (1,n): `--|{` (eg. Teléfono)
- **Relaciones:**
  - Pueden tener sus propios *atributos*
  - *Grado:* según num. entidades que asocie: binarias, ternarias, n-arias...
  - *Participación:*
    - (0,1): `--O|`
    - (1,1): `--||`
    - (0,n): `--O{`
    - (1,n): `--|{`
  - *Cardinalidad:*
    - 1:1: `←:→`
    - 1:N: `←:↠`
    - N:M: `↞:↠`
  - *Reflexivas:* relación asocia x instancias con y instancias de la misma entidad (eg. empleado > esJefe >> empleado)
- **Entidades fuertes|débiles en una relación (`1:N`):**
  - *Fuertes:* independientes
  - *Débiles:* `[[ ]]`no PK, necesitan E-Fuerte para ser identificadas
  - *Dependencia:*
    - *Existencia:* (eg. CuentaBancaria`<E>`Transacción)
    - *Identidad:* (eg. Autor`<I>`Libro)
  - *Especialización | Generalización:*
    - *Esp. Inclusiva:* `▽` superclase una/varias subclases
    - *Esp. Exclusiva:* `◁̲` superclase solo una posible subclase
    - *Esp. Parcial:* `▽` superclase no necesariamente subclase
    - *Esp. Total:* `⧊` superclase obligatoriamente una subclase

### 3. Modelo Relacional

#### 3.1 Intro

- **Intro:**
  - *Estructuración Datos:*
    - Relaciones=Tablas // Atributos=Columnas // Elementos-Instancia=Filas
  - *Dominio Atributos:* tipoDeDato + restricción
  - *Esquema:* conjunto de tablas/relaciones, 'base de datos'
  - *Grado:* numColumnas (Atributos)
  - *Cardinalidad:* numFilas (Instancias)
- **Claves:**
  - *Superclave:* fila que puede identificar unívocamente cada fila de una tabla
    - *Clave candidata:* ...
    - *Clave primaria:* `_` PK, identifica unívocamente cada fila
    - *Claves alternativas:* también podrían ser PK pero no
    - *Claves foráneas:* PK de una tabla en otra tabla como FK para establecer relación
- **Operaciones:**
  - *Actualización:* inserción | modificación | borrado
  - *Consulta*

#### 3.2 Reglas de Integridad

- *Integridad:* "propiedad de los datos, representar correctamente el mundo real"
- **Unicidad PK:** ninguna fila en la misma tabla puede repetir PK
- **Entidad PK:** no puede ser NULL
- **Integridad Referencial:** atributo FK coherente con PK referenciada o NULL si posible (SGBD chequea cuando inserción modificación y eliminación)
  - *Política Restricción `RESTRICT`:* no permitir actualización PK si es FK en algúna tabla
  - *Actualización Cascada `CASCADE`:* replicar actualización PK en FK
  - *Política Anulación `SET NULL`:* FK tomará valor nulo
  - *Estándar...:* `ON DELETE RESTRICT` `ON UPDATE CASCADE`
- **Integridad Dominio:** valores no nulos deben ser válidos según restricciones (tipoDato, dominio, etc.)

### 4. Normalización

- **Objetivos/Logros:**
  - Almacenar toda la información con mínimo redundancia
  - Mínimo núm. vínculos entre las relaciones para facilitar utilización
  - Fácil accesibilidad datos
  - Minimizar problemas actualización (altas,bajas,modificaciones)
- **Definiciones:**
  - *Normalización:* formas normales como indicadores de calidad entre las relaciones según restricciones (1FN < 5FN)
  - *Proceso Normalización:* más relaciones, menos redundancia, verificar coherencia modelo, se penalizan consultas; (atomizar tablas)
  - *Relación Universal:* una tabla con todos los atributos... 1FN, mala-praxis
  - *Dependencia Funcional:* att B depende de A (PK) en una misma relación; puede ser 'total' si todos atts dependen de PK; puede haber ' dependencia transitiva' (A>B>C)
- **Formas Normales:**
  - *1FN:* atributos/columnas indivisibles, atómicos
  - *2FN:* garantizar dependencia funcional total, nuevas tablas para atributos no dependientes
  - *3FN:* nueva tabla para dependencias transitivas (ajenas a PK)
  - *FN de Boyce-Codd:* separar claves candidatas...

<hr>

## UD3: Diseño Físico (DDL)

### 1. MySQL Intro

- **Tipos Sentencias:** DDL, DQL, DML, TCL, DCL
- **Tipos de Dato:**
  - *Numéricos:*
    - `INT`: `TINYINT` `SMALLINT` `MEDIUMINT` `INT` `BIGINT` (1byte,2,3,4,8; signed | unsigned)
    - `FLOAT`: 7 decimales
    - `DOUBLE`|`REAL`: 15 decimales
    - `DECIMAL`|`NUMERIC`: 65 decimales
    - "`BOOLEAN`": INT
  - *Texto:*
    - `CHAR()`: longitud fija, min1 max255
    - `VARCHAR()`: longitud variable, min1 max65535
    - `TEXT`: `TINYTEXT` `TEXT` `MEDIUMTEXT` `LONGTEXT`
    - `ENUM('foo','bar')`: defaults to foo
  - *Fechas:*
    - `DATE`: YYYY-MM-DD
    - `DATETIME`: YYYY-MM-DD HH:MM:SS
    - `TIMESTAMP`: DATETIME actual sistema
    - `TIME`: HH:MM:SS
    - `YEAR`: YYYY

### 2. Defición Datos (DDL)

- **Intro:**
  - *Objetos:* tablas, columnas, índices, alias, vistas, procedimientos
  - *Comentarios:* `#foo` `--foo` `/*foo*/`
- **Creación:**
  - *Base Datos:*
    - `CREATE SCHEMA|DATABASE mySchema;`
    - `USE mySchema;`
  - *Tabla:*
    - `CREATE TABLE mySchema.myTable (col datatype restriction);`
- **Restricciones:**
  - `PK`: misma línea | final declaración
  - `NOT NULL`: —
  - `UNIQUE`: índice...
  - `CHECK (cond)`: condición validación
  - `AUTO_INCREMENT`: —
  - `DEFAULT 'foo'`: —
  - `COMMENT 'foo'`: —
  - `FK`: `CONTRAINT foo FK (col) REFERENCES table (col)` `ON DELETE x ON UPDATE x`
    - x == `RESTRICT`|`NO ACTION`, `CASCADE`, `SET NULL`
- **Modificación Tablas:**
  - `ALTER TABLE mySchema.myTable ...;`
    - ...
    - `ADD COLUMN myCol INT [FIRST | AFTER otherCol];`
    - `DROP myCol;`
    - `MODIFY mCol newDatatype [F|A];`
    - `CHANGE myCol myNewCol datatype [F|A];`
    - `ADD PK|UNIQUE INDEX/KEY|FK ...;`
    - `DROP PK|INDEX/KEY|FK;`
    - `DISABLE|ENABLE KEYS;`
    - `RENAME TO newTable;`
    - `ORDER BY myCol1, myCol2;`
    - `ALTER myCol SET|DROP DEFAULT 'foo';`
  - `RENAME TABLE myTable TO myNewTable, myOtherTable TO myNewOtherTable;`
  - `CREATE INDEX mySchema.myIndex USING ... ON myTable (col1 ASC|DESC, col2 A|D);`
    - ... `BTREE` | `HASH`
- **Eliminación:**
  - `DROP INDEX myIndex ON myTable;`
  - `DROP TABLE mySchema.myTable IF EXISTS;`
  - `DROP SCHEMA mySchema;`
- **Vistas:**
  - `CREATE|REPLACE VIEW myView (col1,col2) AS [SELECT ...] WITH CASCADED|LOCAL [CHECK ...];`
  - `ALTER VIEW myView (col1,col2) AS [SELECT ...];`
  - `DROP VIEW myView;`


```sql
-- UD3: DDL
CREATE SCHEMA mySchema;
USE mySchema;

CREATE TABLE mySchema.myTable (
  col1 INT NOT NULL AUTO_INCREMENT,
  col2 INT NOT NULL,
  col3 VARCHAR(60) NOT NULL,
  col4 VARCHAR DEFAULT 'ES',
  PRIMARY KEY (col1),
  FOREIGN KEY (col2) REFERENCES anotherTable (col1)
) AUTO_INCREMENT = 1000 ;

SHOW INDEXES FROM mySchema.myTable;
```

<hr>

## UD4: Realización Consultas (DQL)

### 1. Consultas Simples

```sql
SELECT [DISTINCT]
  t1.myCol AS foo,
  t2.myCol AS bar
FROM
  myTable1 AS t1,
  myTable2 AS t2
ORDER BY
  t1.myCol ASC|DESC,
LIMIT 5;
```
```sql
SELECT * FROM myTable
  WHERE myCol
    = | != | > | < | >= | <= 'foo';
    [NOT] BETWEEN 'foo' AND 'bar';
    [NOT] IN ('foo', 'bar');
    LIKE '_foo%';
```

### 2. Consultas Complejas

#### 2.1 Funciones Incorporadas

```sql
-- Matemáticas
SELECT
  COUNT(*) AS 'foo'
  SUM(myCol)
  MIN(myCol)
  MAX(myCol)
  AVG(myCol)
  CAST(myCol AS REAL)
  ROUND(myCol)
  MOD(myCol,myOtherCol)
  TRUNCATE(myCol,5)
FROM
  myTable;
```
```sql
-- Cadenas Caracteres
SELECT
  UPPER(myCol)
  LOWER(myCol)
  -- SUBSTR(myCol,position,numChars)
  SUBSTR(myCol,3,2)
  CONCAT(myCol,myOtherCol)
FROM
  myTable;
```
```sql
-- Manipulación Fechas
SELECT
  NOW()
  TIME()
  DATE()
  YEAR()
  MONTH()
  DATE_FORMAT()
FROM
  myTable;
```

#### 2.2 Control Flujo

```sql
SELECT *
  IF myColumn = 'foo'
FROM myTable;
```
```sql
SELECT *
  CASE
    WHEN myCol = 0 THEN 'OFF'
    WHEN myCol = 1 THEN 'ON'
    ELSE NULL
  END AS caseCol
FROM myTable;
```

#### 2.3 Agrupamiento

```sql
SELECT myCol, COUNT(*) AS 'num_x'
FROM myTable
GROUP BY myCol;
```
```sql
SELECT myCol, COUNT(*) AS 'num_x'
FROM myTable
GROUP BY myCol
HAVING COUNT(*) > 5;
```

#### 2.4 Combinar Tablas

```sql
SELECT *
FROM myTable JOIN otherTable
WHERE myTable.myCol = otherTable.myCol;
```
```sql
SELECT * FROM myTable
UNION
SELECT * FROM otherTable;
```
```sql
SELECT * FROM myTable
WHERE myCol IN 
(SELECT AVG(myCol) FROM myTable);
```

<hr>

## UD5: Edición Datos (DML + TCL)

### 1. Manipulación Datos (DML)

```sql
INSERT INTO myTable (myCol, otherCol) VALUES
  ('foo', 6),
  ('bar', 9);
```
```sql
UPDATE myTable
SET myCol = 'foo'
WHERE otherCol = 'bar';
```
```sql
DELETE FROM myTable
WHERE myCol = 'foo';
```
```sql
-- REPLACE
```

### 2. Control Transacciones y Concurrencia (TCL)

> - [@MySQL](https://dev.mysql.com/doc/refman/8.0/en/lock-tables.html):
>   - "The correct way is to begin a transaction with `SET autocommit = 0`
>   - (not `START TRANSACTION`)
>   - followed by `LOCK TABLES`,
>   - and to not call `UNLOCK TABLES` until explicit `COMMIT`"

```sql
SET autocommit = 0;
-- FLUSH TABLES WITH READ LOCK;
-- START TRANSACTION;
LOCK TABLES t1 WRITE, t2 READ;
-- ...
SAVEPOINT justInCase;
-- ...
-- ROLLBACK [TO justInCase];
COMMIT;
UNLOCK TABLES;
```

<hr>

## UD6: Construcción Guiones

- [ ] `SELECT INTO`?

```sql
-- SHOW VARIABLES LIKE '@%';
SELECT * FROM performance_schema.user_variables_by_thread;
    SELECT @variable;
SHOW FUNCTION STATUS WHERE db = 'mySchema';
SHOW PROCEDURE STATUS WHERE db = 'mySchema';
```

### 1. Funciones

```sql
CREATE FUNCTION supdawg()
RETURNS VARCHAR(30) DETERMINISTIC
RETURN 'supdawg';

SELECT supdawg();
```
```sql
CREATE FUNCTION supdawg_input (input VARCHAR(30))
RETURNS VARCHAR(60) DETERMINISTIC
RETURN CONCAT('supdawg ',input);

SELECT supdawg_input('mate');
```
```sql
DELIMITER //
CREATE FUNCTION supdawg_input_complex (input VARCHAR(30))
RETURNS VARCHAR(60) DETERMINISTIC
BEGIN
	DECLARE output VARCHAR(60);
    SET output = CONCAT('supdawg ',input);
    RETURN output;
END //
DELIMITER ;

SELECT supdawg_input_complex('mate');
```

### 2. Procedimientos

#### 2.1 Parámetros

- **Conceptos:**
  - *Parámetros:* `IN` | `OUT` | `INOUT`
  - *Variables:*
    - `@@var_sistema` | `@var_usuario`
    - existen durante sesión (alojadas en memoria!!)
    - pueden interactuar con cualquier procedimiento

```sql
-- Sin parámetros
CREATE PROCEDURE supdawg()
SELECT 'supdawg';

CALL supdawg();
```
```sql
-- IN
CREATE PROCEDURE supdawg_in (IN input VARCHAR(30))
SELECT CONCAT('supdawg ', input) AS 'not much, wbu';

CALL supdawg_in(CURRENT_USER());
```
```sql
-- OUT + @var [simple]
CREATE PROCEDURE supdawg_out (OUT output VARCHAR(60))
SET output = CONCAT('supdawg ', CURRENT_USER());

CALL supdawg_out (@var_supdawg_out);
SELECT @var_supdawg_out;
```
```sql
-- OUT + @var [complex]
DELIMITER //
CREATE PROCEDURE supdawg_out (OUT output VARCHAR(60))
BEGIN
	SET output = CONCAT('supdawg ', CURRENT_USER());
    SELECT output;
END //
DELIMITER ;

CALL supdawg_out (@var_supdawg_out);
-- SELECT @var_supdawg_out
```

```sql
-- Entrada/Salida IN/OUT
SET @var_operasao_bin = 1;
DELIMITER //
CREATE PROCEDURE operasao_bin (INOUT x INT)
BEGIN
	SELECT CONCAT(x,' * 2 = ',x*2) AS operasao;
    SET x = x * 2;
END //
DELIMITER ;

CALL operasao_bin(@var_operasao_bin);
-- SELECT @var_operasao_bin;
```

#### 2.2 Estructuras Condicionales

- **Conceptos:**
  - *Estructuras condicionales:*
    - *Simple:* `IF ... THEN ... ENDIF;`
    - *Doble:* `IF THEN ... ELSE ... ENDIF;`
    - *Múltiple:* `IF THEN ... ELSEIF THEN ... ELSE ENDIF;`
    - *Case:* `CASE WHEN ... THEN ... WHEN THEN ... ELSE ... END CASE;`
  - *Estructuras iterativas:*
    - *WHILE:* `WHILE ... DO ... END WHILE;`
    - *REPEAT:* `REPEAT ... UNTIL ... END REPEAT;`
    - *LOOP:* `name:LOOP ... END LOOP name;`


```sql
-- IF ELSEIF (FUN)
SELECT num_compare_fun(6,6)

DELIMITER //
CREATE FUNCTION num_compare_fun(x INT, y INT)
RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
  DECLARE z VARCHAR(30);
  IF x > y THEN SET z = '>';
  	ELSEIF x = y THEN SET z = '=';
  	ELSE SET z = '<';
  END IF;
  SET z = CONCAT(x,' ',z,' ',y);
  RETURN z;
END //
DELIMITER ;
```
```sql
-- IF ELSEIF (PRO)
CALL num_compare_pro(9,9,@result)

DELIMITER //
CREATE PROCEDURE num_compare_pro (IN x INT,IN y INT,OUT xzy VARCHAR(30))
BEGIN
  DECLARE z CHAR(1);
  IF x > y THEN SET z = '>';
  	ELSEIF x < y THEN SET z = '<';
  	ELSEIF x = y THEN SET z = '=';
  	ELSE SET z = ' ?  ';
  END IF;
  SET xzy = CONCAT(x,' ',z,' ',y);
  SELECT xzy;
END //
DELIMITER ;
```

```sql
-- CASE
```
```sql
-- WHILE
CALL simple_while_loop_temp_table();

DELIMITER //
CREATE PROCEDURE simple_while_loop_temp_table()
BEGIN
  DECLARE counter INT DEFAULT 1;
  CREATE TEMPORARY TABLE temp_result (CounterValue INT);
  WHILE counter <= 10 DO
    -- Insert the counter value into the temporary table
	INSERT INTO temp_result (CounterValue) VALUES (counter); 
	SET counter = counter + 1;
	END WHILE;
  SELECT * FROM temp_result;
  DROP TEMPORARY TABLE IF EXISTS temp_result;
END//
DELIMITER ;
```
```sql
-- REPEAT
```
```sql
-- LOOP
CALL simple_loop_example();

DELIMITER //
CREATE PROCEDURE simple_loop_example()
BEGIN
  DECLARE counter INT DEFAULT 1;
  simple_loop: LOOP
	SELECT counter as 'CounterValue';
	SET counter = counter + 1;
	IF counter > 10 THEN
	  LEAVE simple_loop;
	END IF;
  END LOOP simple_loop;
END//
DELIMITER ;
```

### 3. Cursores

```markdown
- Declare
- Open
- Fetch
- Close
```

### 4. Triggers

```sql
DELIMITER //
CREATE TRIGGER trigger_name
[BEFORE | AFTER] [INSERT | UPDATE | DELETE]
ON myTable1 FOR EACH ROW
BEGIN
-- ...
END //
DELIMITER ;
```

## UD7: Seguridad Datos (DCL)

<hr><hr>

CLASE REPASO