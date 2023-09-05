# ACTIVIDADES UD4 (Consultas SQL)


- [ACTIVIDADES UD4 (Consultas SQL)](#actividades-ud4-consultas-sql)
  - [1. MITIENDA](#1-mitienda)
  - [2. UNIVERSIDAD-01](#2-universidad-01)
  - [3. UNIVERSIDAD-02](#3-universidad-02)

## 1. MITIENDA

> [DB-MITIENDA](/BasesDatos/UD4-ConsultasSQL/db/MITIENDA_MySQL.sql)

- How-To maintain "CLIENTES (Edad)"? — Data must be a function tho right?

```sql
-- [1] ¿Qué nombres tienen nuestros clientes?
SELECT DISTINCT Nombre FROM CLIENTES;

-- [2] ¿Cuántos clientes nos han dado su teléfono?
SELECT COUNT(Telefono) FROM CLIENTES;

-- [3] ¿Cuáles son las distintas edades de nuestros clientes?
SELECT DISTINCT
	YEAR(CURRENT_DATE()) - YEAR(FechaNac)
    FROM CLIENTES ORDER BY FechaNac DESC;

-- [4] Supón que queremos enviarles una felicitación el día de su cumpleaños. ¿Cuántas tarjetas tenemos que comprar?
SELECT COUNT(FechaNac) FROM CLIENTES;

-- [5] Listado de clientes ordenados por fecha de nacimiento de menor a mayor.
SELECT * FROM CLIENTES ORDER BY FechaNac DESC;

-- [6] Listado de clientes ordenado por provincias, y dentro de cada provincia ordenado por apellidos.
SELECT * FROM CLIENTES
	ORDER BY Provincia, Apellidos;

-- [7] Clientes que se llamen Juan.
SELECT * FROM CLIENTES
	WHERE Nombre = 'Juan';

-- [8] Ventas en las que hayamos vendido carpetas.
SELECT * FROM VENTAS
	WHERE Producto = 'Carpeta';

-- [9] Clientes de Valencia.
SELECT * FROM CLIENTES
	WHERE Provincia = 'Valencia';

-- [10] Clientes de Madrid o Barcelona.
SELECT * FROM CLIENTES
	WHERE Provincia IN ('Madrid','Barcelona');

-- [11] Clientes menores de 25 años.
SELECT * FROM CLIENTES
	    WHERE TRUNCATE(DATEDIFF(CURRENT_DATE(), FechaNac) / 365, 0) < 25;

-- [12] Ventas hechas en el último mes.
SELECT * FROM VENTAS
    WHERE Fecha BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW();
    -- WHERE EXTRACT(YEAR_MONTH FROM CURRENT_DATE) - EXTRACT(YEAR_MONTH FROM Fecha) = 1;
	-- WHERE DATEDIFF(NOW(),Fecha) <=30;

-- [13] Nombre y número de puntos de los clientes que tengan más de 900 puntos y menos de 1000.
SELECT Nombre, Apellidos, Puntos FROM CLIENTES
    WHERE Puntos BETWEEN 900 AND 1000;

-- [14] Clientes cuyo nombre empiece por J.
SELECT * FROM CLIENTES
    WHERE Nombre LIKE 'J%';

-- [15] Clientes cuyo nombre no termine en vocal.
SELECT * FROM CLIENTES
	WHERE Nombre NOT RLIKE '[aeiouáéíóú]$';
	-- WHERE Nombre NOT REGEXP '[aeiouáéíóú]$';
	-- WHERE SUBSTRING(Nombre, -1) NOT IN ('a','e','i','o','u');

-- [16] Puntuación media de nuestros clientes.
SELECT AVG(Puntos) FROM CLIENTES;

-- [17] Puntos y tipo de carnet de cada cliente, sabiendo que los que tienen entre 800 y 850 puntos tienen carnet PLATA, entre 850 y 900, ORO, y más de 900 PLATINO. Los que tengan menos puntos no tienen carnet.
SELECT NumSocio, Puntos,
	CASE
		WHEN Puntos >= 900 THEN 'PLATINO'
        WHEN Puntos >= 850 AND Puntos < 900 THEN 'ORO'
		WHEN Puntos >= 800 AND Puntos < 850 THEN 'PLATA'
        -- ELSE NULL
        ELSE '-'
    END AS CarnetSocio
FROM CLIENTES;
    -- BETWEEN trickier due to "inclusive endpoints"
    -- (EG. 850 or 900 could be weirdly interpreted...)
    
```

## 2. UNIVERSIDAD-01

> [DB-UNIVERSIDAD](/BasesDatos/UD4-ConsultasSQL/db/UNIVERSIDAD_MySQL.sql)


```sql
-- [1.] Obtener los créditos de las asignaturas..
SELECT Creditos FROM ASIGNATURAS;

-- [2] Nombres y créditos de las asignaturas.
SELECT Nombre, Creditos	FROM ASIGNATURAS;

-- [3] Distintos posibles créditos de las asignaturas.
SELECT DISTINCT Creditos FROM ASIGNATURAS;

-- [4] Todos los datos de las personas.
SELECT * FROM personas;

-- [5] Suma de los créditos de las asignaturas llamando a la columna resultante ‘Total Créditos’.
SELECT SUM(Creditos) AS "Total Creditos"
    FROM ASIGNATURAS;

-- [6] Coste básico de la asignatura más cara.
SELECT *
	FROM ASIGNATURAS
	WHERE CosteBasico = (
	  SELECT MAX(CosteBasico) 
	  FROM ASIGNATURAS
	);

-- [7] Nombre y Apellido de las personas nacidas antes del 1 de enero de 1975.
SELECT Nombre, Apellido, DATE(FechaNacimiento) AS FechaNac
    FROM PERSONAS
	WHERE FechaNacimiento < '1975-01-01'
    ORDER BY FechaNac DESC;

-- [8] Nombre y coste básico de las asignaturas de más de 4.5 créditos.
SELECT Nombre, CosteBasico FROM ASIGNATURAS
	WHERE Creditos > 4.5;

-- [9] Nombre de las asignaturas cuyo coste básico esté entre 25 y 35 euros.
SELECT Nombre, CosteBasico FROM ASIGNATURAS
	WHERE CosteBasico BETWEEN 25 AND 30;

-- [10] Id de los alumnos matriculados en la asignaturas '150212' o en la '130113' o en ambas, no mostrándose repetidos.
SELECT DISTINCT IdAlumno FROM alumno_asignatura
	WHERE IdAsignatura IN (150212, 130133);

-- SELECT * FROM PERSONAS WHERE DNI IN
-- 	(SELECT DNI FROM ALUMNOS WHERE IdAlumno IN
-- 		(SELECT IdAlumno FROM alumno_asignatura
-- 			WHERE IdAsignatura IN (150212, 130133)));

SELECT p.*, aa.IdAsignatura
    FROM PERSONAS p
        INNER JOIN ALUMNOS a ON p.DNI = a.DNI
        INNER JOIN alumno_asignatura aa ON a.IdAlumno = aa.IdAlumno
    WHERE aa.IdAsignatura IN (150212, 130133);

-- SELECT p.*
-- 	FROM PERSONAS p, ALUMNOS a, ALUMNO_ASIGNATURA aa
--         WHERE p.DNI = a.DNI
--         AND a.IdAlumno = aa.IdAlumno
--         AND IdAsignatura IN (150212, 130133);


-- [11] Nombres de las asignaturas del 2º cuatrimestre que no sean de 6 créditos.
SELECT Nombre FROM ASIGNATURAS
    WHERE Cuatrimestre = 2 AND Creditos != 6;

-- [12] Nombre y apellido de las personas cuyo apellido comience por 'G'.
SELECT Nombre, Apellido 
	FROM PERSONAS
    WHERE UPPER(Apellido) LIKE 'G%';
    -- WHERE UPPER(SUBSTR(Apellido,1,1)) = 'G';

-- [13] Nombre de las asignaturas que tienen datos para el IdTitulacion.
SELECT Nombre FROM ASIGNATURAS
    WHERE IdTitulacion IS NOT NULL;

-- [14] Nombre de las asignaturas cuyo coste por crédito sea mayor que 8 euros.
SELECT Nombre FROM ASIGNATURAS
	WHERE (CosteBasico / Creditos) > 8;

-- [15] De cada persona, mostrar el nombre completo en una columna y la dirección completa en otra. Formato (Susana Miguez Alcala, 25 – Madrid).
SELECT
	CONCAT(Nombre,' ',Apellido) AS NombreCompleto,
    CONCAT(DireccionCalle,', ',DireccionNum,' - ',Ciudad) AS DireccionCompleta
    FROM PERSONAS;

-- [16] Datos de personas por orden alfabético de apellidos.
SELECT * FROM PERSONAS
	ORDER BY Apellido;

-- [17] (?) Datos de las asignaturas del 2º cuatrimestre por orden alfabético de IdTitulacion. Para cada titulación ordenar por coste mostrando primero las asignaturas más caras y para las asignaturas del mismo coste mostrar por orden alfabético de nombre de asignaturas.
SELECT * FROM ASIGNATURAS
	WHERE Cuatrimestre=2
	ORDER BY IdTitulacion, CosteBasico DESC, Nombre;

-- [18] DNI, Nombre y Apellido de los alumnos que viven en La Rioja. Como criterio usar el teléfono (el prefijo de La Rioja es 941).
SELECT p.DNI, Nombre, Apellido
	FROM PERSONAS p, ALUMNOS a
    WHERE p.DNI = a.DNI
	AND LEFT(Telefono,3) = 941
	-- AND SUBSTR(Telefono,1,3) = 941
    -- AND Telefono LIKE '941%'
    ;

-- [19] Id de las titulaciones en las que está matriculado el alumno con DNI 20202020A. Un alumno está matriculado en una titulación si está matriculado en una asignatura de la titulación.
SELECT DISTINCT asig.IdTitulacion
	FROM ASIGNATURAS asig, ALUMNO_ASIGNATURA aa, ALUMNOS alu
		WHERE asig.IdAsignatura = aa.IdAsignatura
		AND aa.IdAlumno = alu.IdAlumno
        AND alu.DNI = '20202020A';

-- SELECT DISTINCT asig.IdTitulacion
--     FROM ASIGNATURAS asig
--         INNER JOIN ALUMNO_ASIGNATURA aa
--             ON asig.IdAsignatura = aa.IdAsignatura
--         INNER JOIN ALUMNOS alu
--             ON aa.IdAlumno = alu.IdAlumno
--         WHERE alu.DNI = '20202020A';
 

-- [20] DNI, Nombre y Apellido de los alumnos matriculados en la asignatura ‘Seguridad Vial’.
SELECT p.DNI, p.Nombre, p.Apellido
	FROM PERSONAS p
		JOIN ALUMNOS a ON p.DNI = a.DNI
        JOIN ALUMNO_ASIGNATURA aa
			ON a.IdAlumno = aa.IdAlumno
		JOIN ASIGNATURAS asig
			ON aa.IdAsignatura = asig.IdAsignatura
		WHERE asig.Nombre = 'Seguridad Vial';
```


## 3. UNIVERSIDAD-02

- `date_add()`
<!-- - [40] == ?
- [43] == ! -->

```sql
-- [1] Nombres y apellidos de las personas.
SELECT Nombre, Apellido FROM PERSONAS;

-- [2] Códigos, nombres y créditos de las asignaturas.
SELECT IdAsignatura, Nombre, Creditos FROM ASIGNATURAS;

-- [3] Datos de las personas de la Base de Datos.
SELECT * FROM PERSONAS;

-- [4] Distintos posibles créditos de las asignaturas.
SELECT DISTINCT Creditos FROM ASIGNATURAS;

-- [5] Posibilidades de coste, de los distintos cursos de las asignaturas.
SELECT DISTINCT CosteBasico FROM ASIGNATURAS;

-- [6] Suma del coste de las asignaturas.
SELECT SUM(CosteBasico) FROM ASIGNATURAS;

-- [7] Cuantas asignaturas hay.
SELECT COUNT(*) AS TotalAsignaturas
	FROM ASIGNATURAS;

-- [8] Coste de la asignatura más cara.
SELECT Nombre, CosteBasico AS CosteMax
	FROM ASIGNATURAS
    WHERE CosteBasico = (
		SELECT MAX(CosteBasico) FROM ASIGNATURAS);

-- [9] Coste de la asignatura más barata.
SELECT MIN(CosteBasico) FROM ASIGNATURAS;

-- [10] Coste máximo, mínimo y medio de las asignaturas.
SELECT
	COUNT(*) AS NumAsignaturas,
	MAX(CosteBasico),
	MIN(CosteBasico),
	AVG(CosteBasico)
    FROM ASIGNATURAS;

-- [11] Cuantas posibilidades de créditos de asignatura hay.
SELECT COUNT(DISTINCT Creditos) AS NumPosiblesCreditos
	FROM ASIGNATURAS;

-- [12] Cuántos cursos hay.
SELECT COUNT(DISTINCT Curso) AS TotalCursos
	FROM ASIGNATURAS;

-- [13] Cuántas ciudades y nombres distintos hay.
    -- SELECT Ciudad, COUNT(*) AS "Ciudades"
    --     FROM PERSONAS
    --     GROUP BY Ciudad;
SELECT
	COUNT(DISTINCT Nombre) AS TotalNombres,
    COUNT(DISTINCT Ciudad) AS TotalCiudades
	FROM PERSONAS;

-- [14] Nombre y créditos de las asignaturas del primer cuatrimestre.
SELECT Nombre, Creditos FROM ASIGNATURAS
    WHERE Cuatrimestre = 1;

-- [15] Nombre y coste básico de las asignaturas de más de 4,5 créditos.
SELECT Nombre, CosteBasico FROM ASIGNATURAS
    WHERE Creditos > 4.5;

-- [16] Nombre de las asignaturas cuyo coste está entre 25 y 35 euros.
SELECT Nombre FROM ASIGNATURAS
    WHERE CosteBasico BETWEEN 25 AND 35;

-- [17] Mostrar el Id de los alumnos matriculados bien en la asignatura '150212' o bien en la '130113', o en ambas.
SELECT IdAlumno FROM ALUMNO_ASIGNATURA
    WHERE IdAsignatura IN ('130113','150212');

-- [18] Mostrar el Id de los alumnos matriculados en cualquier asignatura salvo la '150212' o la '130113'.
SELECT IdAlumno FROM ALUMNO_ASIGNATURA
    WHERE IdAsignatura NOT IN ('130113','150212');

-- [19] Nombre de las asignaturas del segundo cuatrimestre que no sean de 6 créditos.
SELECT Nombre FROM ASIGNATURAS
	WHERE Cuatrimestre = 2
    AND Creditos != 6;

-- [20] Mostrar el nombre de las asignaturas cuyo coste por crédito sea mayor de 8 euros.
SELECT Nombre, TRUNCATE(CosteBasico/Creditos,2) AS RatioCosteCredito
	FROM ASIGNATURAS
	WHERE CosteBasico / Creditos > 8;

-- [21] Nombre y número de horas de todas las asignaturas. (1cred = 10h).
SELECT Nombre, Creditos*10 AS NumHoras
	FROM ASIGNATURAS;

-- [22] Mostrar el nombre y el apellido de las personas cuyo apellido comience por la letra 'G'.
SELECT Nombre, Apellido
	FROM PERSONAS
    WHERE LEFT(Apellido,1) = 'G';

-- [23] Datos de las personas que hayan nacido en 1978.
SELECT * FROM PERSONAS
    WHERE YEAR(FechaNacimiento) = 1978;

-- [24] Mostrar el nombre de las personas de las que se desconoce la fecha de nacimiento.
SELECT * FROM PERSONAS
    WHERE FechaNacimiento IS NULL;

-- [25] Mostrar las asignaturas que no pertenecen a ninguna titulación.
SELECT * FROM ASIGNATURAS
    WHERE IdTitulacion IS NULL;

-- [26] Cuál es el día siguiente al día en que nacieron las personas de la B.D.
SELECT Nombre, DATE(FechaNacimiento),
	-- DAY(FechaNacimiento)+1,
    DAY(DATE_ADD(FechaNacimiento, INTERVAL 1 DAY))
    FROM PERSONAS;

-- [27] Listado de personas ordenadas por apellidos y nombre.
SELECT * FROM PERSONAS
	ORDER BY Apellido, Nombre;

-- [28] Listado de personas mayores de 25 años ordenadas por apellidos y nombre.
SELECT * FROM PERSONAS
	WHERE YEAR(NOW()) - YEAR(FechaNacimiento) > 25
    ORDER BY Apellido, Nombre;

-- [29] Listado que muestre las asignaturas con su coste por crédito ordenadas por su coste por crédito.
SELECT Nombre, TRUNCATE(CosteBasico/Creditos,2) AS RatioCosteCredito
	FROM ASIGNATURAS
	ORDER BY RatioCosteCredito
    
-- [30] Listado de alumnos matriculados que viven en La Rioja (Prefijo telefónico 941).
SELECT * FROM PERSONAS p
	JOIN ALUMNOS a
	WHERE p.DNI = a.DNI
    AND LEFT(p.Telefono,3) = 941;

-- [31] Listado de asignaturas impartidas por profesores de Logroño (Prefijo telefónico 941).
SELECT a.* FROM ASIGNATURAS a
	JOIN PROFESORES pro ON a.IdProfesor = pro.IdProfesor
    JOIN PERSONAS p ON pro.DNI = p.DNI
    WHERE LEFT(p.Telefono,3) = 941; 

-- [32] Listado de profesores que además son alumnos.
SELECT p.* FROM PERSONAS p
	-- JOIN PROFESORES pro ON p.DNI = pro.DNI
    NATURAL JOIN PROFESORES pro
    JOIN ALUMNOS a ON pro.DNI = a.DNI;

-- [33] Nombres completos de los profesores que además son alumnos.
SELECT CONCAT(Nombre,' ',UPPER(Apellido)) AS NombreCompleto
    FROM PERSONAS p
    NATURAL JOIN PROFESORES pro
    JOIN ALUMNOS a ON pro.DNI = a.DNI;

-- [34] Nombres completos de los alumnos que cursan la asignatura de "Seguridad Vial".
SELECT CONCAT(Nombre,' ',UPPER(Apellido)) AS NombreCompleto
	FROM PERSONAS p
    JOIN ALUMNOS a ON p.DNI = a.DNI
    JOIN ALUMNO_ASIGNATURA aa ON a.IdAlumno = aa.IdAlumno
    WHERE aa.IdAsignatura = (
		SELECT IdAsignatura FROM ASIGNATURAS
        WHERE Nombre = 'Seguridad Vial');

-- [35] Nombres completos de los alumnos que cursan alguna asignatura del 2° cuatrimestre.
SELECT CONCAT(p.Nombre,' ',UPPER(Apellido)) AS NombreCompleto
	FROM PERSONAS p
    JOIN ALUMNOS al ON p.DNI = al.DNI
    JOIN ALUMNO_ASIGNATURA aa ON al.IdAlumno = aa.IdAlumno
    JOIN ASIGNATURAS asig ON aa.IdAsignatura = asig.IdAsignatura
	    WHERE asig.Cuatrimestre = 2;

-- [36] Suma de los créditos de las asignaturas de Matemáticas.
SELECT SUM(Creditos)
	FROM ASIGNATURAS asig
	JOIN TITULACIONES t ON asig.IdTitulacion = t.IdTitulacion
	    WHERE t.Nombre = 'Matematicas';

-- [37] Número de asignaturas de la titulación de Matemáticas.
SELECT t.Nombre, COUNT(*)
	FROM ASIGNATURAS asig
	JOIN TITULACIONES t on asig.IdTitulacion = t.IdTitulacion
	-- WHERE t.Nombre = 'Matematicas'
		GROUP BY (t.Nombre);

-- [38] Listado de asignaturas que tengan más créditos que "Seguridad Vial".
SELECT *
	FROM ASIGNATURAS
    WHERE Creditos > (
		SELECT Creditos FROM ASIGNATURAS
        WHERE Nombre = 'Seguridad Vial');
        
-- [39] Listado de alumnos que son más viejos que el profesor de menos edad.
    -- SELECT p.*
    -- 	FROM PERSONAS p
    -- 		JOIN ALUMNOS al ON p.DNI = al.DNI
    --         WHERE FechaNacimiento < (
    -- 			SELECT MAX(p.FechaNacimiento)
    --             FROM PERSONAS p
    -- 				JOIN PROFESORES pro ON p.DNI = pro.DNI);
SELECT *
	FROM ALUMNOS
	NATURAL JOIN PERSONAS
	WHERE FechaNacimiento < (
		SELECT MAX(FechaNacimiento)
		FROM PROFESORES
		NATURAL JOIN PERSONAS);

-- [40] Cuál es el coste de la matrícula de cada titulación.
SELECT t.Nombre, SUM(a.CosteBasico) AS CosteMatricula
	FROM ASIGNATURAS a
    JOIN TITULACIONES t ON a.IdTitulacion = t.IdTitulacion
        GROUP BY t.IdTitulacion;

-- [41] Cuantos alumnos hay matriculados en cada asignatura, ordenado por IdAsignatura.
SELECT IdAsignatura, COUNT(IdAlumno) AS AlumnosAsignatura
	FROM ALUMNO_ASIGNATURA
	GROUP BY IdAsignatura
    ORDER BY AlumnosAsignatura DESC;

-- [42] Cuánto paga cada alumno por su matrícula.
SELECT IdAlumno,
	-- CONCAT(p.Nombre,' ',UPPER(Apellido)) AS NombreCompleto,
	COUNT(IdAsignatura) AS NumAsig,
    SUM(CosteBasico) AS CosteTotal
FROM ALUMNO_ASIGNATURA aa
	NATURAL JOIN ASIGNATURAS
    -- NATURAL JOIN ALUMNOS a
    -- JOIN PERSONAS p ON a.DNI = p.DNI
    GROUP BY IdAlumno
    ORDER BY CosteTotal DESC;

-- [43] Estadísticas (número y media de edad) de personas por ciudades y sexos.
SELECT Ciudad,
    CASE
	  WHEN Varon=1
        THEN 'Hombre'
        ELSE 'Mujer'
	  END AS Sexo,
	-- IF (Varon=1, 'Hombre', 'Mujer') AS Sexo,
    COUNT(*) AS NumPersona,
	-- TRUNCATE(AVG(YEAR(CURRENT_DATE()) - YEAR(FechaNacimiento)),2) AS MediaEdad,
	TRUNCATE(AVG(DATEDIFF(CURRENT_DATE(), FechaNacimiento) / 365),2) AS MediaEdad
FROM PERSONAS
	GROUP BY Ciudad, Sexo
    ORDER BY Ciudad, Sexo;

-- [44] Lo mismo que la anterior pero agrupado por mes de nacimiento, y sólo para los alumnos.
SELECT Ciudad,
	IF (Varon=1, 'Hombre', 'Mujer') AS Sexo,
    COUNT(*) AS NumPersona,
	TRUNCATE(AVG(DATEDIFF(CURRENT_DATE(), FechaNacimiento) / 365),2) AS MediaEdad,
	MONTH(FechaNacimiento) AS MesNacimiento
FROM ALUMNOS
NATURAL JOIN PERSONAS
	GROUP BY MesNacimiento
    ORDER BY MesNacimiento;

-- [45] Coste medio de las asignaturas de cada titulación para aquellas // titulaciones en las que el coste total de la matrícula sea mayor de 60 euros.
SELECT T.Nombre, AVG(A.CosteBasico) as CosteMedio
	FROM ASIGNATURAS A 
	INNER JOIN TITULACIONES T ON A.IdTitulacion = T.IdTitulacion
GROUP BY T.IdTitulacion
HAVING SUM(A.CosteBasico) > 60;

-- [46] Visualiza la asignatura con más créditos, la media de créditos, la suma de los créditos y la titulación a la que pertenecen, para titulaciones con más de 1 asignatura.
SELECT T.Nombre as Titulacion, 
       MAX(A.Creditos) as MaxCreditos, 
       AVG(A.Creditos) as MediaCreditos, 
       SUM(A.Creditos) as SumaCreditos 
FROM ASIGNATURAS A 
INNER JOIN TITULACIONES T ON A.IdTitulacion = T.IdTitulacion 
WHERE T.IdTitulacion IN (
    SELECT IdTitulacion FROM ASIGNATURAS 
    GROUP BY IdTitulacion HAVING COUNT(*) > 1)
GROUP BY T.Nombre;

-- [47] Qué alumnos (nombre completo) están matriculados al menos en dos asignaturas. Ordena el resultado alfabéticamente.
SELECT
	CONCAT(P.Nombre, ' ', P.Apellido) AS NombreCompleto,
    COUNT(aa.IdAlumno) AS NumAsignaturas
FROM PERSONAS P
	INNER JOIN ALUMNOS A ON P.DNI = A.DNI
	INNER JOIN ALUMNO_ASIGNATURA AA ON A.IdAlumno = AA.IdAlumno
GROUP BY A.IdAlumno
HAVING COUNT(DISTINCT AA.IdAsignatura) >= 2
ORDER BY P.Apellido, P.Nombre;

-- [48] Listado de alumnos cuya matrícula haya supuesto un coste superior a 50 euros.
    -- SELECT IdAlumno, SUM(CosteBasico) AS TotalMatricula
    -- 	FROM ALUMNO_ASIGNATURA
    --     NATURAL JOIN ASIGNATURAS
    -- GROUP BY IdAlumno
    -- HAVING SUM(CosteBasico) > 50;

SELECT AA.IdAlumno,
    CONCAT(P.Nombre,' ',Apellido) AS NombreCompleto,
    SUM(CosteBasico) AS TotalMatricula
FROM ALUMNO_ASIGNATURA AA
    NATURAL JOIN ASIGNATURAS
    JOIN ALUMNOS A ON AA.IdAlumno = A.IdAlumno
    JOIN PERSONAS P ON A.DNI = P.DNI
GROUP BY IdAlumno
HAVING SUM(CosteBasico) > 50
ORDER BY Apellido, P.Nombre;

-- [49] Clasifica las titulaciones por orden descendente en función del total de créditos necesarios para cursarlas.
SELECT T.IdTitulacion, T.Nombre, SUM(Creditos) AS TotalCreditos
	FROM TITULACIONES T
    JOIN ASIGNATURAS A ON T.IdTitulacion = A.IdTitulacion
	GROUP BY IdTitulacion
    ORDER BY SUM(Creditos) DESC;


-- [50] Edad del alumno más viejo de cada asignatura.
SELECT AA.IdAsignatura,	asig.Nombre,
	COUNT(AA.IdAlumno) AS NumAlumnos,
    MAX(YEAR(CURRENT_DATE()) - YEAR(FechaNacimiento)) AS MayorEdad
FROM ALUMNO_ASIGNATURA AA
	JOIN ASIGNATURAS asig ON AA.IdAsignatura = asig.IdAsignatura
	JOIN ALUMNOS A ON AA.IdAlumno = A.IdAlumno
    JOIN PERSONAS P ON A.DNI = P.DNI
GROUP BY AA.IdAsignatura;


---------------------------


-- -- [x] En cuántas materias cada alumno
-- SELECT IdAlumno, COUNT(IdAsignatura)
-- 	FROM ALUMNO_ASIGNATURA
--     GROUP BY IdAlumno

-- -- [ ] En cuántas titulaciones cada alumno
-- SELECT IdAlumno, COUNT(IdTitulacion)
-- 	FROM ALUMNO_ASIGNATURA aa
--     JOIN ASIGNATURAS a ON aa.IdAsignatura = a.IdAsignatura
--     GROUP BY IdAlumno

```


