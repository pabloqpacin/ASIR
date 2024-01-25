# UD 5.1 Automatización de tareas


- En mi sistema operativo Linux fue necesario realizar los siguientes cambios a la base de datos [UD5.1-ventas.sql](/BasesDatos/T2-Automatizacion_monitorizacion/sql/ventas.sql) proporcionada


```sql
-- Líneas necesarias al inicio para poder hacer el 'source' directamente
DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;

-- Por motivos de compatibilidad, eliminar todas las instancias de
-- COLLATE=utf8mb4_0900_ai_ci
```

- Comandos para importar y manipular la base de datos

```bash
# Crear contenedor MySQL
docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=changeme -e MYSQL_ROOT_HOST='%' -p 3306:3306 -v mysql_data:/var/lib/mysql mysql

# Importar la base de datos UD5.1-ventas.sql
mysql -h 127.0.0.1 -P 3306 -u root -p -e "source UD5.1-ventas.sql"

# Conectarse al servidor MySQL del contenedor
mycli -u root -pchangeme -D ventas || \
mysql -u root -pchangeme -D ventas
```


- Sentencia para listar procedimientos y funciones existentes

```sql
select routine_type, routine_name, routine_definition
    from information_schema.routines
    where routine_type in ('PROCEDURE', 'FUNCTION')
    and routine_schema = 'ventas';
```

1. Crea un procedimiento almacenado que muestre todos los comerciales con una comisión concreta. Ejemplo de llamada : `CALL obtenerComercial("0.11");`

```sql
-- Crear procedimiento
use ventas;
create procedure listar_comision(IN pcomision DECIMAL(10, 2))
    select * from comercial where ROUND(comisión, 2) = pcomision;
```
```sql
-- Usar procedimiento
use ventas;
call listar_comision(0.11);
call listar_comision(0.15);
```

2. Crea una procedimiento almacenado que me devuelva cuantos pedidos y la suma (del total) de los pedidos de un cliente que se le pasa en la llamada. Ejemplo de llamada: `CALL proc3(@suma,@cuantos,"Aaron"); Select @suma,@cuantos;`

```sql
delimiter $$
create procedure cliente_pedidos (IN nombre_cliente VARCHAR(50), OUT cuantos_pedidos INT, OUT suma_pedidos DECIMAL(10,2))
begin
    select count(*) into cuantos_pedidos from pedido where id_cliente = (
        select id from cliente where nombre like nombre_cliente
    );
    select sum(total) into suma_pedidos from pedido where id_cliente = (
        select id from cliente where nombre like nombre_cliente
    );
end
$$
delimiter ;
```

```sql
call cliente_pedidos ("Aaron", @cuantos_pedidos, @suma_pedidos);
select @cuantos_pedidos, @suma_pedidos;
```


3. Crea una función que devuelva cuantos (el número) de comerciales que hay. Ejemplo de llamada: `SELECT calcular_cuantos();`

```sql
show variables like 'log_bin_trust_function_creators';
-- set global log_bin_trust_function_creators = 1;
-- https://dba.stackexchange.com/questions/108316/use-of-log-bin-trust-function-creators-in-mysql

delimiter $$
create function cuantos_comerciales() returns INT
DETERMINISTIC
begin
    declare cuantos INT;
    select count(*) into cuantos from comercial;
    return cuantos;
end
$$
delimiter ;
```

```sql
select cuantos_comerciales();
```




---


## boilerplate

- procedures

```sql
delimiter $$
create procedure foo (bar)
begin
    foo
    bar
end
$$
delimiter ;

call foo (bar)
select bar

```

- funciones


```sql
delimiter $$
create function foo (bar) returns type
begin
    declare ...
    foo
    return ...
end
$$
delimiter ;

select foo
```

