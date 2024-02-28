# Condicionales & Bucles

## Preparativos

```bash
# Creamos un contenedor de MariaDB
docker run -d --name mariadb1 -p 3307:3306 -e MYSQL_ROOT_PASSWORD=changeme -e MYSQL_ROOT_HOST='%' mariadb

    # -v ./foo/bar:/docker-entrypoint-initdb.d

# $ docker start mariadb1

# A través del cliente mycli importamos el dump de la BD ventas
yes | mycli -P 3307 -u root -pchangeme -e "source UD5.1-ventas.sql"

# # Modificamos la tabla 'pedido' según se solicita de forma declarativa
# mycli -P 3307 -u root -pchangeme -D ventas -e "ALTER TABLE pedido ADD COLUMN estado VARCHAR(20) DEFAULT 'Pendiente';"

# Nos conectamos mediante el cliente mycli al servidor de base de datos alojado en nuestro contenedor MariaDB
mycli -P 3307 -u root -pchangeme -D ventas

# $ docker stop mariadb1
# $ docker rm mariadb1 -v
```


## Ejercicios


1. Escribe un procedimiento almacenado llamado `ActualizarEstadoPedido` que actualice el estado de un pedido en la tabla `pedido` basado en el **total** del pedido. <u>Si el total del pedido es superior a 500, establece el `estado` del pedido como "`En proceso`"; de lo contrario, establece el estado como "Pendiente".</u> (ejercicio de IF)
```

```sql
use ventas;
delimiter $$
create procedure ActualizarEstadoPedido (IN id_pedido int)
begin
    select
end $$
delimiter ;
```

### 2. foo

```md
Escribe una función llamada CalcularDescuento que calcule el descuento aplicable a un pedido basado en su total.
Si el total del pedido es mayor o igual a 1000, la función debe devolver el 10% del total como descuento; de lo contrario, la función debe devolver 0. (Ejercicio de IF)
```

```sql
delimiter $$
create function CalcularDescuento(IN total_pedido double) returns int
DETERMINISTIC
begin
    declare
end
$$
delimiter ;
```

### 3. foo

```md
Nombre del procedimiento: CalcularTotalComisiones.
Este procedimiento calculará la comisión total de todos los comerciales en la tabla comercial.
El procedimiento se iniciará con la declaración de variables locales y la inicialización de valores necesarios.
Se utilizará una consulta para obtener el número total de comerciales en la tabla comercial y almacenarlo en una variable.
Se inicializará una variable para almacenar el total de comisiones.
Se utilizará un bucle WHILE para recorrer todos los comerciales en la tabla comercial.
En cada iteración del bucle, se obtendrá la comisión individual del comercial actual y se almacenará en una variable.
Se sumará la comisión individual del comercial actual al total de comisiones.
Se incrementará el contador para pasar al siguiente comercial y se repetirá el bucle hasta que se hayan procesado todos los comerciales.
Una vez que se han procesado todos los comerciales, se imprimirá el total de comisiones calculado.
```

```sql
-- ...
```
