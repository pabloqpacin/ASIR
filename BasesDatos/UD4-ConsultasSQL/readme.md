# BasesDatos — UD4: Realización de Consultas (DQL)

## Campus Virtual

- Teoría
  - ud4-teoria
  - ud4-presentacion
- Actividades (DQL) [3.n]
- Cuestionario

> [apuntes-ud4](/BasesDatos/UD4-ConsultasSQL/apuntes-ud4.md)
>
> [practicals-ud4](/BasesDatos/UD4-ConsultasSQL/practicals-ud4.md)


### Cuestionario


| index | cuestionario |
| ---   | --- |
| Q1    | Las bases de datos de MySQL se basan en un modelo:
| A1    | — relacional
| Q2    | Cuando en la sintaxis de una sentencia nos encontramos lo siguiente: `{CASCADE | RESTRICT | SETNULL}` significa:
| A2    | — Alternativa obligatoria, se debe incluir una de las 3 palabras en la sentencia
| Q3    | ¿Qué afirmación es correcta sobre los alias en las columnas?
| A3    | — Los alias de columnas se especifican entre comillas y detrás del nombre de la columna
| Q4    | Si utilizando operadores de comparación de cadenas quiero obtener los datos de mis EMPLEADOS cuyo DNI acabe en Z, utilizaría:
| A4    | — `SELECT * FROM EMPLEADOS WHERE DNI LIKE '%Z';`
| Q5    | ¿Cuáles de éstas son funciones de MySQL?
| A5    | — SUM, MIN, MAX
| Q6    | ¿Qué valor devuelve la función: `INSTR ('García Pérez, Francisco', 'c')`?
| A6    | — 4
| Q7    | Si en una consulta de selección quiero aplicar un filtro sobre una condición de grupos, utilizaré:
| A7    | — HAVING
| Q8    | Si quiero seleccionar datos de dos tablas que tienen la siguiente estructura: <br> - HOSPITAL(<u>IdHospital</u>,Direccion,Localidad) <br> - MEDICO(<u>IdMedico</u>,NumColegiado,Nombre,Apellidos,IdHospital)
| A8 !  | — *Haciendo un JOIN o un NATURAL JOIN en la cláusula FROM de la sentencia SELECT*
| Q9    | Una sentencia SELECT que se incluye en la cláusula WHERE de otra sentencia SELECT, encerrada entre paréntesis, es:
| A9    | — Una subconsulta
| Q10   | Si en una consulta queremos seleccionar datos de 3 tablas distintas...
| A10   | — Tendríamos que hacer un JOIN entre 2 de las tablas, y luego otro sobre la tercera

