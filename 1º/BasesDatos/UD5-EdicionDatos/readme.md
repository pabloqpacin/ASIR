# BasesDatos — UD5: Edición de los Datos (DML + DCL)


## Campus Virtual

- Teoría
  - ud5-teoria
  - ud5-presentacion
- Actividades (DML) [1]
- Cuestionario

> [apuntes-ud5](/BasesDatos/UD5-EdicionDatos/apuntes-ud5.md)
>
> [practicals-ud5](/BasesDatos/UD5-EdicionDatos/practicals-ud5.sql)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | ¿Cuál es el significado del borrado en cascada?
| A1    | — Al borrar registros de la tabla de referencia, los registros de otra tabla que hacían referencia a dichos registros, también son eliminados
| Q2    | Para todos los campos PK, se activa por defecto la restricción:
| A2    | — NOT NULL
| Q3    | Cuando realizamos una transacción en una BD:
| A3    | — **Se deben ejecutar todas sus operaciones o ninguna** <br> ~~Siempre hay que indicarlo con `START TRANSACTION`~~ 
| Q4    | ¿Qué nombre recibe la propiedad por la que los valores de clave ajena de una tabla tienen siempre correspondencia con un valor de la clave primaria de otra tabla?
| A4    | — Integridad referencial.
| Q5    | ¿Cuál de estas acciones NO se puede realizar con el comando ALTER TABLE?
| A5    | — Insertar datos
| Q6    | Si en la siguiente tabla: (...) lanzamos `INSERT INTO MEDICOS VALUES (NULL,'999999','Pedro','Alvarez');`, ¿qué valor tomará el IdMedico si es un campo AUTOINCREMENT?
| A6    | — 6 (`NULL` OK) &emsp; ~~Dará un error por poner **NULL**~~
| Q7    | ¿Es posible deshacer parcialmente los cambios realizados por una transacción?
| A7    | — Sí, estableciendo un punto de restauración y ejecutando la orden de deshacer los cambios hasta ese punto.
| Q8    | Si al insertar un nuevo registro o al editar los datos de uno existente se intenta escribir una letra en un campo numérico, ¿qué ocurre?
| A8    | — Se obtiene un error y **no se produce ningún cambio**.
| Q9    | Si no se indica una condición en la sentencia DELETE , ¿qué ocurre?
| A9    | — Se eliminan todos los registros de la tabla.
| Q10   | En la sentencia INSERT de SQL, ¿es obligatorio indicar todos los campos de la tabla?
| A10   | — No, si se van a indicar valores para todos los campos <br> ~~No es necesario, aunque sí aconsejable~~

