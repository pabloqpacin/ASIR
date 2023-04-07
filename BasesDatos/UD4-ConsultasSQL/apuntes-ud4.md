# BasesDatos — UD4: Consultas SQL (DQL)

```markdown
1. Consultas de Selección simples
   1. Cláusulas SELECT y FROM
   2. Cláusulas ORDER BY
   3. Cláusula LIMIT X
   4. Cláusula WHERE + Operadores
2. Consultas de Selección complejas
   1. Funciones incorporadas a los SGBD
      1. Funciones Matemáticas
      2. Fd. Cadenas de Caracteres
      3. Fd. Manipulación de Fechas
      4. Fd. Control de Flujo
   2. Agrupamientos de filas — Cláusulas GROUP BY y HAVING
   3. Combinaciones entre tablas (JOIN)
   4. Unión, intersección y diferencia de sentencias SELECT
   5. Subconsultas
```

> @MySQL: [3.3.4.7 Pattern Matching (`LIKE`)](https://dev.mysql.com/doc/refman/8.0/en/pattern-matching.html)
>
> @w3schools: [SQL IN Operator // Recursion!](https://www.w3schools.com/sql/sql_in.asp)
>
> @w3schools: [MySQL Functions](https://www.w3schools.com/mysql/mysql_ref_functions.asp) &emsp; //
> @w3schools: [MySQL CAST() Function](https://www.w3schools.com/sql/func_mysql_cast.asp)
>
> @MySQL: [12.7 Date and Time Functions](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html) &emsp; // @w3schools: [MySQL DATE_FORMAT() Function](https://www.w3schools.com/sql/func_mysql_date_format.asp)


1. **Consultas de Selección simples**
   1. *Cláusulas `SELECT` y `FROM`* == `SELECT [DISTINCT] [tab.]{col|*|expr} [,...] [AS 'alias'] FROM tab [AS 'alias'] [,...];` &emsp; // *NO_FILTRADO!!*
   2. *Cláusulas `ORDER BY`* == `SELECT col FROM tab [ORDER BY col [ASC|DESC] [, col ...]]`
   3. *Cláusula `LIMIT x`*
   4. **Cláusula `WHERE` + Operadores**
       - *Comparación* == `=` `!=` `>` `>=` `<` `<=` &ensp; // `[NOT] BETWEEN val1 AND val2` &ensp; // `[NOT] IN (val1, val2)` &ensp; // `[NOT] LIKE 'pattern'`
       - *Aritméticos* == `+` `-` `*` `/`
       - *Lógicos* == `AND` `OR` `NOT` `IS NULL`
       - *Fechas* == (+ Aritméticos)
2. **Consultas de Selección complejas**
   1. **Funciones** incorporadas a los SGBD
       - *Funciones Matemáticas* == (agregación/...) — `COUNT(col)` - `SUM(col)` - `MIN/MAX(col)` // `AVG(col)` - `CAST(val AS tipo)` - `ROUND(x)` - `MOD(x,y)` - `TRUNCATE(x,d)`
       - *Fd. Cadenas de Caracteres* == `UPPER/LOWER(col)` - `SUBSTR(col,inicio,[tamano])` - `CONCAT(cad1,cad2)`
       - *Fd. Manipulación de Fechas* == `DATE(fecha)` - `TIME(fecha) ` - `YEAR(fecha) ` - `NOW()` - `DATE_FORMAT(fecha,'format')`
       - *Fd. Control de Flujo* == `IF(cond,expr-T,expr-F)` — `CASE` — `IFNULL`
   2. *Agrupamiento filas* == `GROUP BY` - `HAVING`
   3. *Combinacion tablas* == `[NATURAL] [INNER|LEFT|RIGHT] JOIN ON` &emsp; // `NATURAL`==diffTab,sameCol; `INNER`==(...); `LEFT`==(...); `RIGHT`==(...);
   4. *Unión, intersección y diferencia* == `UNION` - ~~`INTERSECT`~~ - ~~`EXCEPT`~~
   5. **Subconsultas**



<br>

---

> @StackOverflow: [Select From all tables - MySQL](https://stackoverflow.com/questions/14931001/select-from-all-tables-mysql) &emsp; //  @MySQL: [INFORMATION_SCHEMA.COLUMNS](https://dev.mysql.com/doc/mysql-infoschema-excerpt/5.7/en/information-schema-columns-table.html)

```sql
-- [0]
SELECT
	TABLE_NAME,
    COLUMN_NAME,
    COLUMN_TYPE,
    COLUMN_KEY
    -- IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'UNIVERSIDAD';

-- [1.1]
SELECT * FROM personas;
SELECT Nombre AS 'Tha Namey' FROM personas;

SELECT PE.NOMBRE, ASIG.NOMBRE FROM PERSONAS AS PE, ASIGNATURAS AS ASIG;
    -- [!] Cruce filas PE + ASIG!!
	SELECT NOMBRE FROM PERSONAS;
	SELECT NOMBRE FROM ASIGNATURAS;

-- [1.2]
SELECT DNI, Nombre, Apellido, Ciudad, DireccionCalle
	FROM PERSONAS ORDER BY Nombre, Apellido;

-- [1.3]
SELECT FechaNacimiento FROM PERSONAS
    ORDER BY FechaNacimiento DESC LIMIT 3;

-- [1.4]
SELECT * FROM Asignaturas
	WHERE Creditos > 5;

SELECT * FROM Personas
	WHERE DireccionNum BETWEEN 10 AND 20
	    AND DireccionCalle BETWEEN 'B%' AND 'N%'
    ORDER BY Nombre;

SELECT * FROM Personas
	WHERE DNI LIKE '1%'	AND Nombre LIKE '____';

-- SELECT * FROM Personas
-- 	WHERE FechaNacimiento LIKE '196%' OR FechaNacimiento LIKE '197%';

SELECT * FROM PERSONAS
	WHERE DNI IN (SELECT DNI FROM ALUMNOS);

SELECT * FROM PERSONAS WHERE DNI IN
	(SELECT DNI FROM PROFESORES WHERE IdProfesor IN
		(SELECT IdProfesor FROM ASIGNATURAS WHERE Nombre LIKE 'Programac%')
    );

----------------------------

-- [2.1.1]
SELECT COUNT(*)/ (SELECT COUNT(*) FROM PROFESORES)
    AS ratio_estu_prof FROM ALUMNOS;

SELECT SUM(Creditos) AS 'TotalCreditos Cuatr1'
	FROM ASIGNATURAS
    WHERE Cuatrimestre = 1;

SELECT MAX(FechaNacimiento) FROM PERSONAS;

SELECT AVG(Varon) FROM PERSONAS	WHERE DNI IN
	(SELECT DNI FROM profesores);

SELECT Nombre, CAST(FechaNacimiento AS DATE)
    FROM PERSONAS
    ORDER BY FechaNacimiento DESC;

-- ROUND(x)
-- MOD(x,y)
-- TRUNCATE(x,d)

-- [2.1.2]
SELECT UPPER(Apellido), Nombre, Ciudad,
	LEFT(Telefono,3) AS PrefijoTelef
    YEAR(FechaNacimiento) -- SUBSTR(FechaNacimiento,1,4),
    FROM PERSONAS
    WHERE FechaNacimiento BETWEEN '1970-01-01' AND '1989-12-31'
    -- WHERE FechaNacimiento LIKE '197%' OR FechaNacimiento LIKE '198%'
    ORDER BY Telefono;

SELECT CONCAT(Nombre,' ',UPPER(Apellido)) AS NombreCompletoProfs,
    Ciudad, Telefono, DATE(FechaNacimiento) AS Bday
    FROM PERSONAS
    WHERE DNI IN (SELECT DNI FROM PROFESORES)
    ORDER BY Bday DESC;

-- [2.1.3]
SELECT Nombre, 
    DATE_FORMAT(FechaNacimiento, '%a-%u-%Y') AS FechaNacimientoFormato
	FROM PERSONAS
	ORDER BY DATE_FORMAT(FechaNacimiento, '%u');

-- [2.1.4]
SELECT
	CONCAT(Nombre,' ',UPPER(Apellido)) AS NombreCompleto,
	DATE(FechaNacimiento) AS FechaNac,
		IF (MONTH(FechaNacimiento)=MONTH(NOW()) AND 
		DAY(FechaNacimiento)=DAY(NOW()),'Sí','No') AS "Es su cumpleaños"
	FROM PERSONAS
    ORDER BY DATE_FORMAT(FechaNac,'%m');

SELECT FechaNacimiento,
        (CASE WHEN FechaNacimiento>='1976-01-01' THEN "Carnet joven" 
	     ELSE "Carnet ordinario" END) AS "Tipo carnet" 
	FROM PERSONAS
	ORDER BY FechaNacimiento DESC; 

-- IFNULL(expr,valRet)

----------------------------

-- [2.2]
SELECT Ciudad, COUNT(*) AS "Ciudades"
	FROM PERSONAS
    GROUP BY Ciudad
    HAVING COUNT(*) >= 2;

-- [2.3]
SELECT p.*
	FROM PERSONAS p
		JOIN PROFESORES pr ON p.DNI = pr.DNI
		JOIN ASIGNATURAS a ON pr.IdProfesor = a.IdProfesor
	WHERE a.Nombre LIKE 'Programac%';

-- [2.4]
SELECT IdProfesor AS IDs, DNI FROM PROFESORES
    UNION
    SELECT * FROM ALUMNOS


----------------------------

DESCRIBE PERSONAS;
SHOW INDEX FROM ALUMNO_ASIGNATURA;

```