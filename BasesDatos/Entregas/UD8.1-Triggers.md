# UD8.1 Creación de Triggers

## Herramientas

- Repositorio con la BD (`ventas`) y el `docker-compose.yaml`): [github.com/pabloqpacin/ASIR](https://github.com/pabloqpacin/ASIR/tree/main/BasesDatos/mariadb)
- Código:

```sql
-- Listar triggers
SELECT trigger_name, event_object_table, action_statement
FROM information_schema.triggers
WHERE trigger_schema = DATABASE();
```
```sql
-- Listar triggers y más infor
SELECT
    -- trigger_name, event_object_table, action_statement
    trigger_name,
    action_timing,
    event_manipulation,
    event_object_table,
    action_statement,
    created,
    definer
FROM information_schema.triggers
WHERE trigger_schema = DATABASE();
```

<!-- ```sql
-- Listar procedimientos y funciones existentes
select routine_type, routine_name, routine_definition
    from information_schema.routines
    where routine_type in ('PROCEDURE', 'FUNCTION')
    and routine_schema = DATABASE();
```
```sql
-- Listar los parámetros de procedimientos y funciones 
select
    routine_type,
    specific_name,
    parameter_mode,
    parameter_name,
    dtd_identifier
from information_schema.parameters
where specific_schema = DATABASE();
``` -->

- Boilerplate

```sql
DELIMITER //
CREATE TRIGGER <name>
BEFORE|AFTER <event> ON <table>
FOR EACH ROW
BEGIN
    ...
END //
DELIMITER ;
```

## Ejercicios

### 1. Crear Trigger Antes de Insertar en la Tabla pedido

Crea un trigger llamado actualizarTotalComprasCliente en la base de datos "ventas". Este trigger debe ejecutarse automáticamente antes de insertar un nuevo registro en la tabla pedido. Su función es aumentar el campo total_compras del cliente asociado al nuevo pedido en una cantidad específica, por ejemplo, el 5% del total del nuevo pedido.

```sql
DELIMITER //
CREATE TRIGGER actualizarTotalComprasCliente
BEFORE INSERT
ON pedido FOR EACH ROW
BEGIN
    update cliente
    set total_compras = total_compras + (NEW.total * 0.05)
    where id = NEW.id_cliente;
END //
DELIMITER ;
```
```sql
insert into pedido (total, id_cliente, id_comercial, fecha)
values (100, 10, 1, now());

insert into pedido (total, id_cliente, id_comercial, fecha)
values (500.00, 2, 1, NOW());

select * from cliente;
```

### 2. Crear Trigger Después de Eliminar en la Tabla pedido

Crea un trigger llamado ajustarTotalComprasCliente en la base de datos "ventas". Este trigger debe ejecutarse automáticamente después de eliminar un registro en la tabla pedido. Su función es disminuir el campo total_compras del cliente asociado al pedido eliminado en una cantidad específica, por ejemplo, el 10% del total del pedido eliminado.

```sql
DELIMITER //
CREATE TRIGGER ajustarTotalComprasCliente
AFTER DELETE
ON pedido FOR EACH ROW
BEGIN
    update cliente
    set total_compras = total_compras - (OLD.total * 0.10)
    where id = OLD.id_cliente;
END //
DELIMITER ;
```
```sql
delete from pedido where id = 20;
```

### 3. Registro de Actualización de Comisiones

Crea un trigger que registre en la tabla auditoria cada vez que se actualiza la comisión de un comercial en la tabla comercial. El registro en la tabla auditoria debe incluir el ID del comercial, la fecha y hora de la actualización, y la nueva y antigua comisión.

```sql
DELIMITER //
CREATE TRIGGER auditarCambioComisionComercial
AFTER UPDATE ON comercial
FOR EACH ROW
BEGIN
    insert into auditoria (id_comercial, fecha_hora, comision_nueva, comision_antigua)
    values (OLD.id, NOW(), NEW.comisión, OLD.comisión);
END //
DELIMITER ;
```
```sql
update comercial set comisión = comisión + 0.01 where id = 7;
```

### 4. Registro de Eliminación de Clientes Inactivos

Crea un trigger que registre en la tabla auditoria cada vez que se elimina un cliente de la tabla cliente por estar inactivo (sin realizar pedidos en los últimos 6 meses). El registro en la tabla auditoria debe incluir el ID del cliente, la fecha y hora de la eliminación, y un mensaje indicando que el cliente estaba inactivo.

```sql
DELIMITER //
CREATE TRIGGER auditarEliminacionClientesInactivos
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    insert into auditoria (id_cliente, fecha_hora, mensaje)
    values (OLD.id, NOW(),'Cliente eliminado por inactividad');
END //
DELIMITER ;
```
```sql
delete from cliente where id in (3,4);
-- (1451, 'Cannot delete or update a parent row: a foreign key constraint fails (`ventas`.`pedido`, CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`))')
```

---

```sql
DELIMITER //
IF (SELECT COUNT(*) FROM cliente WHERE id = 42069) = 0 THEN
    INSERT INTO cliente (id, nombre, apellido1) VALUES (42069, '(Eliminado)', '(Eliminado)'); //
DELIMITER ;
```
```sql
DELIMITER //
CREATE TRIGGER nullifyIdclientePedidos
BEFORE DELETE ON cliente
FOR EACH ROW
BEGIN
    -- https://stackoverflow.com/questions/1905470/cannot-delete-or-update-a-parent-row-a-foreign-key-constraint-fails
    SET FOREIGN_KEY_CHECKS=0;
    update pedido set id_cliente = 42069 where id = OLD.id;
    SET FOREIGN_KEY_CHECKS=1;
END //
DELIMITER ;
```
```sql
delete from cliente where id in (3,4);
select * from auditoria where id_cliente in (3,4);
```

---

**NOTA**: se usa la orden `SET FOREIGN_KEY CHECKS=0|1` para poder dereferenciar al cliente eliminado (`id_cliente` en la tabla `pedido`) y evitar el siguiente callejón sin salida. Esta solución no está recomendada. Enlace a la documentación de *stackoverflow*:

> https://stackoverflow.com/questions/1905470/cannot-delete-or-update-a-parent-row-a-foreign-key-constraint-fails

```sql
delete from cliente where id in (3,4);
-- (1451, 'Cannot delete or update a parent row: a foreign key constraint fails (`ventas`.`pedido`, CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`))')
```

Yo propondría crear otra tabla, `pedidoClientesEliminados`, mover allí los pedidos de los clientes eliminados y así poder borrar esas entradas de `pedido`. Así se respeta la integridad referencial en todo momento. Esas tablas podrían ser exportadas y eliminadas pasado un tiempo prudencial.

> https://stackoverflow.com/questions/78163130/mariadb-1442-create-user-foo-if-not-exists-and-update-some-fk-to-foos-id