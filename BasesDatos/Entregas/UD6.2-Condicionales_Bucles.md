# Condicionales & Bucles

## Preparativos

```bash
# Creamos un contenedor de MariaDB
docker run -d --name mariadb1 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=changeme -e MYSQL_ROOT_HOST='%' mariadb

# $ docker start mariadb1

# A través del cliente mycli importamos el dump de la BD ventas
yes | mycli -u root -pchangeme -e "source UD6.2-ventas.sql"

# Nos conectamos mediante el cliente mycli al servidor de base de datos alojado en nuestro contenedor MariaDB
mycli -u root -pchangeme -D ventas

# $ docker stop mariadb1
# $ docker rm mariadb1 -v
```
<!-- ```bash
cheat bdp
``` -->

```sql
-- Listar procedimientos y funciones existentes
select routine_type, routine_name, routine_definition
    from information_schema.routines
    where routine_type in ('PROCEDURE', 'FUNCTION')
    and routine_schema = '<DB>';

-- See who's connected
SHOW PROCESSLIST;
```


## Ejercicios

1. Escribe un procedimiento almacenado llamado `ActualizarEstadoPedido` que actualice el estado de un pedido en la tabla `pedido` basado en el **total** del pedido. <u>Si el total del pedido es superior a 500, establece el `estado` del pedido como "`En proceso`"; de lo contrario, establece el estado como "Pendiente".</u> (ejercicio de IF)

```sql
DELIMITER $$
CREATE PROCEDURE ActualizarEstadoPedido(IN pedido_id INT)
BEGIN
    DECLARE pedido_total DECIMAL(10, 2);

    -- Obtener el total del pedido
    SELECT total INTO pedido_total FROM pedido WHERE id = pedido_id;

    -- Actualizar el estado del pedido basado en el total
    IF pedido_total > 500 THEN
        UPDATE pedido SET estado = 'En proceso' WHERE id = pedido_id;
    ELSE
        UPDATE pedido SET estado = 'Pendiente' WHERE id = pedido_id;
    END IF;
END $$
DELIMITER ;
```
```sql
CALL ActualizarEstadoPedido(7);
```
<!--
```sql
DELIMITER $$
CREATE PROCEDURE ActualizarEstadosPedidos()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE pedido_id INT;
    DECLARE pedido_total DECIMAL(10, 2); -- Mover la declaración aquí

    DECLARE cur CURSOR FOR SELECT id FROM pedido;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    pedidos_loop: LOOP
        FETCH cur INTO pedido_id;
        IF done THEN
            LEAVE pedidos_loop;
        END IF;

        -- Mover la declaración no permite DECLARE dentro del LOOP

        -- Obtener el total del pedido
        SELECT total INTO pedido_total FROM pedido WHERE id = pedido_id;

        -- Actualizar el estado del pedido basado en el total
        IF pedido_total > 500 THEN
            UPDATE pedido SET estado = 'En proceso' WHERE id = pedido_id;
        ELSE
            UPDATE pedido SET estado = 'Pendiente' WHERE id = pedido_id;
        END IF;
    END LOOP;

    CLOSE cur;
END $$
DELIMITER ;

CALL ActualizarEstadoPedido;
SELECT * FROM pedido WHERE estado != 'Pendiente';
```
-->



2. Escribe una función llamada `CalcularDescuento` que calcule el descuento aplicable a un pedido basado en su total. Si el total del pedido es mayor o igual a 1000, la función debe devolver el 10% del total como descuento; de lo contrario, la función debe devolver 0. (Ejercicio de IF)

```sql

```


<!--

### 3. foo

3. Nombre del procedimiento: `CalcularTotalComisiones`. Este procedimiento calculará la comisión total de todos los comerciales en la tabla comercial. El procedimiento se iniciará con la declaración de variables locales y la inicialización de valores necesarios. Se utilizará una consulta para obtener el número total de comerciales en la tabla comercial y almacenarlo en una variable. Se inicializará una variable para almacenar el total de comisiones. Se utilizará un bucle WHILE para recorrer todos los comerciales en la tabla comercial. En cada iteración del bucle, se obtendrá la comisión individual del comercial actual y se almacenará en una variable. Se sumará la comisión individual del comercial actual al total de comisiones. Se incrementará el contador para pasar al siguiente comercial y se repetirá el bucle hasta que se hayan procesado todos los comerciales. Una vez que se han procesado todos los comerciales, se imprimirá el total de comisiones calculado.

```sql
-- ...
```
