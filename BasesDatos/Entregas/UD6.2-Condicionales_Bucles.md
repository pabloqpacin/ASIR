# BasesDatos UD6.2 Condicionales & Bucles

- [BasesDatos UD6.2 Condicionales \& Bucles](#basesdatos-ud62-condicionales--bucles)
  - [Preparativos](#preparativos)
  - [Ejercicios](#ejercicios)


## Preparativos

```bash
# Preparamos nuestro directorio local
$ tree mariadb
mariadb
├── docker-compose.yaml
├── init
│   ├── T1-empleados.sql
│   ├── T2-colegio.sql
│   ├── UD2.1-tienda.sql
│   ├── UD2.2-empleados.sql
│   ├── UD5.1-ventas.sql
│   ├── UD6.1-usuarios.sql
│   └── UD6.2-ventas.sql
└── readme.md
```
```yaml
# Escribimos nuestro compose.yaml
version: '3.9'
services:
  db:
    image: mariadb:10.6
    environment:
      MYSQL_ROOT_PASSWORD: changeme
      MYSQL_ROOT_HOST: '%'
      TZ: 'Europe/Madrid'
    ports:
      - 3306:3306
    volumes:
      - ./init:/docker-entrypoint-initdb.d/
      - asir_data:/var/lib/mysql                  # $ sudo ls -la /var/lib/docker/volumes/mariadb_asir_data/_data

volumes:
  asir_data:
```
```bash
# Levantamos el entorno docker
docker compose up -d

# Nos conectamos mediante el cliente mycli al servidor de base de datos alojado en nuestro contenedor MariaDB
mycli -u root -pchangeme -D ventas

# Detenemos el entorno
docker compose stop

# Deshacemos el entorno
docker compose down -v
```

---

## Ejercicios

```sql
-- Listar procedimientos y funciones existentes
select routine_type, routine_name, routine_definition
    from information_schema.routines
    where routine_type in ('PROCEDURE', 'FUNCTION')
    and routine_schema = DATABASE();
```


1. Escribe un procedimiento almacenado llamado `ActualizarEstadoPedido` que actualice el estado de un pedido en la tabla pedido basado en el total del pedido. Si el total del pedido es superior a 500, establece el estado del pedido como "En proceso"; de lo contrario, establece el estado como "Pendiente". (ejercicio de IF)

```sql
DELIMITER $$
CREATE PROCEDURE ActualizarEstadoPedido(IN pedido_id INT)
BEGIN
    DECLARE pedido_total DECIMAL(10, 2);

    SELECT total INTO pedido_total FROM pedido WHERE id = pedido_id;

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
DELIMITER $$
CREATE FUNCTION CalcularDescuento (pedido_id INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE pedido_total DECIMAL(10,2);
    DECLARE descuento DECIMAL(10,2);

    SELECT total into pedido_total FROM pedido WHERE id = pedido_id;

    IF pedido_total > 1000 THEN
        SET descuento = pedido_total * 0.1;
    ELSE
        SET descuento = 0;
    END IF;

    RETURN descuento;
END $$
DELIMITER ;
```
```sql
SELECT CalcularDescuento(7);
```


3. Nombre del procedimiento: `CalcularTotalComisiones`. Este procedimiento calculará la comisión total de todos los comerciales en la tabla comercial.
   - El procedimiento se iniciará con la declaración de variables locales y la inicialización de valores necesarios.
     - Se utilizará una consulta para obtener el número total de comerciales en la tabla comercial y almacenarlo en una variable.
     - Se inicializará una variable para almacenar el total de comisiones.
   - Se utilizará un bucle WHILE para recorrer todos los comerciales en la tabla comercial.
     - En cada iteración del bucle, se obtendrá la comisión individual del comercial actual y se almacenará en una variable.
     - Se sumará la comisión individual del comercial actual al total de comisiones.
     - Se incrementará el contador para pasar al siguiente comercial y se repetirá el bucle hasta que se hayan procesado todos los comerciales.
   - Una vez que se han procesado todos los comerciales, se imprimirá el total de comisiones calculado.

```sql
DELIMITER $$
CREATE PROCEDURE CalcularTotalComisiones()
BEGIN
    DECLARE total_comisiones DECIMAL(10, 2) DEFAULT 0.00;
    DECLARE num_comerciales INT DEFAULT 0;
    DECLARE contador INT DEFAULT 1;

    SELECT COUNT(*) INTO num_comerciales FROM comercial;

    WHILE contador <= num_comerciales DO
        SELECT comisión INTO @comision_tmp FROM comercial WHERE id = contador;
        SET total_comisiones = total_comisiones + @comision_tmp;
        SET contador = contador + 1;
    END WHILE;

    SELECT total_comisiones AS 'Total de Comisiones';
END $$
DELIMITER ;
```
```sql
CALL CalcularTotalComisiones();
```