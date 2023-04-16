# BasesDatos — UD6: Construcción de Guiones

## Campus Virtual

- Teoría
  - ud6-teoria
- Actividades [6]
- Cuestionario


> [apuntes-ud6](/BasesDatos/UD6-ConstruccionGuiones/apuntes-ud6.md)
>
> [ejemplos-ud6](/BasesDatos/UD6-ConstruccionGuiones/ejemplos-ud6.sql)
>
> [practicals-ud6](/BasesDatos/UD6-ConstruccionGuiones/practicals-ud6.md)


### Cuestinonario

| index | cuestionario |
| ---   | --- |
| Q1    | Para modificar el flujo de control de un bloque en SQL debemos:
| A1    | — utilizar las estructuras de control condicional y las estructuras de control iterativo
| Q2    | Una ventaja de la implementación de procedimientos almacenados y funciones en las Bases de Datos es reducir el tráfico en la red en entornos cliente-servidor
| A2    | — Verdadero, sólo se envía una instrucción (la llamada al procedimiento/función)
| Q3    | ¿Cómo llamamos a un bloque de código almacenado en la Base de Datos que está asociado a una tabla y que se ejecuta al llevar a cabo una instrucción DML sobre esa tabla?
| A3    | — TRIGGER
| Q4    | En un procedimiento almacenado, un argumento cuyo valor viene del proceso de llamada, y no se cambia durante el procedimiento, es un argumento de tipo:
| A4    | — IN
| Q5    | En el siguiente procedimiento para obtener un número aleatorio, ¿qué palabra faltaría? [*]
| A5    | — `SET`
| Q6    | Si en el código de un TRIGGER para inserción de una fila en una tabla, quiero referirme al valor de uno de los campos que voy a insertar, utilizaré:
| A6    | — `NEW` <!--NEW, seguido del nombre del campo-->
| Q7    | ¿Qué operaciones se utilizan para manejar cursores?
| A7    | — `DECLARE`, `OPEN`, `FETCH` y `CLOSE`
| Q8    | ¿Cuántos errores puede controlar un handler (manejador)?
| A8    | — Uno o varios
| Q9    | Un TRIGGER permite:
| A9    | — Garantizar complejas reglas de integridad
| Q10   | Un trigger de un INSERT se ejecuta:
| A10   | — antes o después de realizar el `INSERT`, dependiendo de cómo lo codifiquemos



---

> [Q5*]

```sql
CREATE PROCEDURE p_generar_aleatorio (OUT valor INTEGER)
BEGIN
  REPEAT
    _______ valor = RAND()*10;
  UNTIL valor>0 AND valor<10 
  END REPEAT;
END
```