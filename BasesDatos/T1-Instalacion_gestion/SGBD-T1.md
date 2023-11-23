# Actividad Evaluable T1 (SGBD)
<!-- # Quevedo_Pablo_Act.1.pdf -->

> Para cada Ejercicio, introduce el **comando** y un **pantallazo** o recorte para poder comprobarlo.


## 1. Comprobación de Instalación

1. Entra con el usuario desde la consola del sistema operativo y muestra la versión actual

```bash
mysql -h 127.0.0.1 -u root -p -e "select version();"
```

2. Muestra fecha y hora actual

```sql
select now();
select curdate();
select curtime();
```

3. Muestra todas las Base de Datos(schemas) que tienes instalados.

```sql
show databases;
```

4. Muestra las tablas del diccionario de Datos

```sql
show tables from information_schema;
```

5. Muestra las variables del sistema.

```sql
show variables;
```

## 2. Sentencias en BD [empleados.sql](/BasesDatos/T1-Instalacion_gestion/sql/T1-empleados.sql)

1. ¿Cómo insertar un nuevo departamento llamado "Departamento de Compras" con un presupuesto de $90,000 y gastos de $70,000 en la tabla "departamento"?

```sql
insert into departamento (id, nombre, presupuesto, gastos)
values (11, 'Departamento de Compras', 90000, 70000);
```

2. ¿Cómo insertar un nuevo empleado llamado "Luis Pérez" con NIF "111222333" en el departamento "Departamento de Ventas" (id = 1) en la tabla "empleado"?

```sql
insert into empleado (id, nif, nombre, apellido1, id_departamento)
values (23, 111222333, 'Luis', 'Pérez', 1);
```

3. ¿Cómo actualizar el presupuesto del "Departamento de TI" para aumentarlo a $100,000?

```sql
UPDATE departamento
    -- PRESUPESTO == 120,000...
    -- SET presupuesto = 100000
    -- SET presupuesto = presupuesto + 100000
WHERE nombre = 'Departamento de TI';
```

4. ¿Cómo cambiar el apellido de "Sergio Pérez" a "Pérez Gómez" en la tabla "empleado"?

```sql
update empleado
set apellido2 = 'Gómez'
where nombre = 'Sergio' and apellido1 = 'Pérez';
```

5. ¿Cómo reducir el presupuesto del "Departamento de Marketing" a $70000?

```sql
update departamento
set presupuesto = 70000
where nombre = 'Departamento de Marketing';
```

6. ¿Cómo eliminar al empleado con NIF "987654321" de la tabla "empleado"?

```sql
delete from empleado
where nif = 987654321;
```

7. ¿Cómo eliminar el "Departamento Legal" (id = 10) de la tabla "departamento"?

```sql
insert into departamento (id, nombre, presupuesto, gastos) values (1001, '(pendiente, 0, 0)');
update empleado set id_departamento = 1001 where id_departamento = 10;
delete from departamento where id = 10
```

8. ¿Cuál es el presupuesto del "Departamento de Recursos Humanos"?

```sql
select presupuesto from departamento
where nombre = 'Departamento de Recursos Humanos';
```

9. ¿Cuántos empleados trabajan en el "Departamento de TI"?

```sql
select
    -- d.nombre as nombre_departamento,
    count(e.id) as num_empleados
from departamento d
join empleado e on d.id = e.id_departamento
group by d.nombre
having d.nombre = 'Departamento de TI';
```

10. ¿Cuál es el nombre y NIF del empleado que trabaja en el "Departamento de Producción" y tiene el apellido "Morales"?

```sql
select nombre, nif
from empleado
where apellido1 = 'Morales'
and id_departamento = (
    select id from departamento
    where nombre = 'Departamento de Producción'
);
```

11. ¿Cuál es el nombre y apellido de todos los empleados que trabajan en departamentos con un presupuesto superior a $100,000?

```sql
select
    d.nombre as nombre_departamento,
    d.presupuesto,
    e.nombre as nombre_empleado,
    e.apellido1 as apellido_empleado
from empleado e
join departamento d on d.id = e.id_departamento
where d.presupuesto > 100000;
```

12. ¿Cuál es el nombre y presupuesto de todos los departamentos que tienen al menos 3 empleados?

```sql
select
    d.nombre,
    d.presupuesto,
    count(e.id)
from departamento d
join empleado e on d.id = e.id_departamento
group by d.nombre, d.presupuesto
having count(e.id) >= 3;
```





