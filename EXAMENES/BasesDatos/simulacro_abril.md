# Práctica Presencial de Abril 2024

- [Práctica Presencial de Abril 2024](#práctica-presencial-de-abril-2024)
  - [Test de Administración de Bases de Datos MySQL (15 preguntas)](#test-de-administración-de-bases-de-datos-mysql-15-preguntas)
  - [Preguntas de comandos de MySQL sobre copias de seguridad:](#preguntas-de-comandos-de-mysql-sobre-copias-de-seguridad)
  - [Enunciado del procedimiento almacenado:](#enunciado-del-procedimiento-almacenado)
  - [Trigger para registrar actividad de últimos pedidos por cliente](#trigger-para-registrar-actividad-de-últimos-pedidos-por-cliente)


## Test de Administración de Bases de Datos MySQL (15 preguntas)


1. ¿Cuál de las siguientes sentencias SQL se utiliza para crear una base de datos llamada "mydb"?
    - [x] `CREATE DATABASE mydb;`
    - [ ] `OPEN DATABASE mydb;`
    - [ ] `USE mydb;`
    - [ ] `CONNECT mydb;`

2. ¿Qué comando se utiliza para ver una lista de todas las bases de datos en el servidor MySQL actual?
    - [x] `SHOW DATABASES;`
    - [ ] `LIST DATABASES;`
    - [ ] `VIEW DATABASES;`
    - [ ] `DESCRIBE DATABASES;`

3. ¿Cómo se otorga el privilegio CREATE TABLE a un usuario llamado "usuario1"?
    - [x] `GRANT CREATE TABLE TO usuario1;`
    - [ ] `GIVE CREATE TABLE TO usuario1;`
    - [ ] `ASSIGN CREATE TABLE TO usuario1;`
    - [ ] `ALLOW CREATE TABLE TO usuario1;`
4. ¿Cuál de las siguientes sentencias SQL se utiliza para conceder a un usuario llamado “usuario2" todos los privilegios 
sobre la base de datos "mydb"?
    - [x] `GRANT ALL PRIVILEGES ON mydb TO usuario2;`
    - [ ] `GIVE ALL PRIVILEGES ON mydb TO usuario2;`
    - [ ] `ASSIGN ALL PRIVILEGES ON mydb TO usuario2;`
    - [ ] `ALLOW ALL PRIVILEGES ON mydb TO usuario2;`

5. ¿Qué comando se utiliza para revocar todos los privilegios de un usuario llamado "usuario3"?
    - [x] `REVOKE ALL PRIVILEGES FROM usuario3;`
    - [ ] `TAKE ALL PRIVILEGES FROM usuario3;`
    - [ ] `REMOVE ALL PRIVILEGES FROM usuario3;`
    - [ ] `DENY ALL PRIVILEGES FROM usuario3;`

6. ¿Cuál es la diferencia entre una tabla de base de datos "MyISAM" y una tabla "InnoDB"?
    - [ ] MyISAM es más rápida para lecturas, mientras que InnoDB es mejor para escrituras y transacciones.
    - [ ] InnoDB es más rápida para lecturas, mientras que MyISAM es mejor para escrituras y transacciones.
    - [x] MyISAM no admite transacciones, mientras que InnoDB sí.
    - [ ] InnoDB no admite transacciones, mientras que MyISAM sí.

7. ¿Qué es un **índice** en una tabla de base de datos MySQL?
    - [x] Una estructura que permite acceder a los datos de la tabla de forma más rápida y eficiente.
    - [ ] Un conjunto de valores que identifican de forma única a cada registro de la tabla.
    - [ ] Una columna que contiene información importante sobre los registros de la tabla.
    - [ ] Una relación entre dos tablas de la base de datos.

8. ¿Cómo se crea un índice en una columna llamada "nombre" de la tabla "clientes"?
    - [x] `CREATE INDEX idx_nombre ON clientes (nombre);`
    - [ ] `ADD INDEX idx_nombre ON clientes (nombre);`
    - [ ] `INDEX CREATE idx_nombre ON clientes (nombre);`
    - [ ] `INDEX ADD idx_nombre ON clientes (nombre);`

9. ¿Qué es una consulta SQL EXPLAIN?
    - [x] Una consulta que muestra el plan de ejecución de otra consulta SQL.
    - [ ] Una consulta que optimiza automáticamente el rendimiento de otra consulta SQL.
    - [ ] Una consulta que modifica la estructura de una tabla de base de datos.
    - [ ] Una consulta que recupera datos de una o más tablas de base de datos.

10. ¿Cómo se utiliza la consulta EXPLAIN para analizar la eficiencia de una consulta SELECT específica?
    - [x] Escribiendo `EXPLAIN SELECT * FROM clientes;`
    - [ ] Escribiendo `EXPLAIN ANALYZE SELECT * FROM clientes;`
    - [ ] Escribiendo `DESCRIBE EXPLAIN SELECT * FROM clientes;`
    - [ ] Escribiendo `SHOW EXPLAIN SELECT * FROM clientes;`

11. ¿Qué es una copia de seguridad incremental de una base de datos MySQL?
    - [x] Es una copia de los datos creados y modificados desde la última ejecución de la copia de seguridad..
    - [ ] Una herramienta que optimiza el rendimiento de una base de datos MySQL.
    - [ ] Un mecanismo de seguridad que protege las bases de datos contra accesos no autorizados.
    - [ ] Un tipo de índice que permite acceder a los datos de la tabla

12. ¿Qué es una copia de seguridad de una base de datos MySQL?
    - [x] Una copia de los datos de la base de datos que se puede utilizar para restaurar la base de datos en caso de fallo.
    - [ ] Una herramienta que optimiza el rendimiento de una base de datos MySQL.
    - [ ] Un mecanismo de seguridad que protege las bases de datos contra accesos no autorizados.
    - [ ] Un tipo de índice que permite acceder a los datos de la tabla de forma más rápida y eficiente.

13. ¿Qué métodos comunes se utilizan para realizar copias de seguridad de bases de datos MySQL?
    - [x] Copias de seguridad completas, copias de seguridad incrementales y copias de seguridad de punto en el tiempo.
    - [ ] Replicación de bases de datos, instantáneas de bases de datos y copias de seguridad manuales.
    - [ ] Cifrado de bases de datos, auditorías de bases de datos y control de acceso a bases de datos.
    - [ ] Optimización de consultas, índices de bases de datos y normalización de bases de datos.

14. ¿Qué es la replicación de bases de datos MySQL?
    - [x] Una técnica para mantener copias sincronizadas de una base de datos en varios servidores.
    - [ ] Un método para comprimir y almacenar datos de forma eficiente en una base de datos.
    - [ ] Un tipo de índice que permite acceder a los datos de la tabla en orden alfabético.
    - [ ] Un mecanismo de seguridad que restringe el acceso a los datos de la base de datos a usuarios autorizados.

15. ¿Qué herramienta de línea de comandos se utiliza comúnmente para administrar bases de datos MySQL?
    - [ ] MySQL Workbench
    - [ ] phpMyAdmin
    - [x] MySQL Command-Line Client (mysql)
    - [ ] Todas las anteriores


## Preguntas de comandos de MySQL sobre copias de seguridad:

1. ¿Cómo realizar una copia de seguridad completa de una base de datos MySQL llamada "mydb" en un archivo llamado "mydb_backup.sql"?

```bash
mysqldump --databases mydb --user=root --password=changeme > mydb_backup.sql
```

2. ¿Cómo realizar una copia de seguridad incremental de una base de datos MySQL llamada "mydb" desde la última copia de seguridad completa, guardándola en un archivo llamado "mydb_incremental.sql"? Explicarlo.

```bash
mysqldump --database mydb --incremental --since-backup-file=mydb_backup.sql --user=tu_usuario --password=changeme > mydb_incremental.sql
```

3. ¿Cómo restaurar una base de datos MySQL desde un archivo de copia de seguridad "mydb_backup.sql"?

```bash
mysql -u root --password=changeme < mydb_backup.sql
```


## Enunciado del procedimiento almacenado:

Objetivo: Crear un procedimiento almacenado en MySQL llamado obtener_gastos_cliente que reciba un ID de cliente como parámetro y devuelva el total de dinero que ha gastado ese cliente en todos sus pedidos.

```sql
DELIMITER //
CREATE PROCEDURE obtener_gastos_clientes (IN pcdr_id_cliente INT);
BEGIN
    -- declare total_gastado int;
    -- set total_gastado = 0;
    -- select sum(p.total) into total_gastado from pedido p where p.id_cliente = pcdr_id_cliente;
    -- select total_gastado;
    select sum(total) from pedido where id_cliente = pcdr_id_cliente;
END //
DELIMITER ;

CALL obtener_gastos_clientes(42);
```


## Trigger para registrar actividad de últimos pedidos por cliente

Objetivo: Crear un trigger en MySQL llamado registrar_actividad_pedido que se ejecute después de cada inserción en la tabla pedido y registre la fecha y hora de la última actualización del pedido para cada cliente.

```sql
DELIMITER //
CREATE TRIGGER registrar_actividad_pedido
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
    -- declare cliente_id int;
    -- select id_cliente into cliente_id from pedido where id = new.id;
    -- update cliente set ultima_actualizacion = now() where id = cliente_id;
    INSERT INTO auditoria (accion,fecha,tabla_afectada, id_registro_afectado) VALUES
    ('INSERT', now(), 'pedido', NEW.id);
END //
DELIMITER ;
```
