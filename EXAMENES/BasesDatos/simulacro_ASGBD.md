# SIMULACRO 7 Mayo

<!-- LibreOffice table background: #2e2e2e -->

<!-- > Pablo_Quevedo_ASGBD_ExamenOrdinaria.doc

- elegir 2 de 3:
  1. usuarios y tal
  2. funcinones y procedimientos
  3. triggers  -->



```md
# Simulacro de Examen
Esta prueba de conocimiento consiste en:
- un cuestionario tipo test de preguntas, con 4 opciones de respuesta donde solo 1 es verdadera
- tres preguntas a elegir dos de de desarrollo de base de datos.
La puntuación obtenida puede variar entre 0 y 10 puntos (correspondiendo 3 puntos al tipo test y 7 puntos a la pregunta de desarrollo).
El tiempo de realización de la prueba es de 90 minutos.
Se debe tener en cuenta el siguiente criterio para la parte tipo test:
- Las preguntas correctas puntúan 0,2 puntos.
- Las preguntas incorrectas restan 0,1 puntos de la puntuación final.
- Las preguntas no contestadas no puntúan ni quitan puntos.
Nota: Copia de seguridad de la BBDD del examen: (...)
```

## TEST

1. ¿Cuál es el paso inicial para instalar MySQL en un servidor Linux?
  - [ ] Ejecutar el comando de instalación
  - [x] Configurar los repositorios de MySQL
  - [ ] Actualizar el sistema operativo
  - [ ] Descargar el archivo de instalación

2. ¿Qué comando se utiliza para crear un nuevo usuario en MySQL?
  - [ ] MAKE USER
  - [ ] INSERT USER
  - [x] CREATE USER
  - [ ] ADD USER

3. ¿Qué privilegio permite a un usuario leer datos de una tabla en MySQL?
  - [ ] CREATE
  - [ ] VIEW
  - [x] SELECT
  - [ ] READ

4. ¿Cuál es la herramienta recomendada para realizar copias de seguridad en MySQL?
  - [x] mysqldump
  - [ ] savebackup
  - [ ] mysqlbackup
  - [ ] backupmysql

5. ¿Qué tipo de copia de seguridad incluye la estructura y los datos de una base de datos MySQL?
  - [ ] Copia de seguridad diferencial
  - [ ] Copia de seguridad física
  - [x] **Copia de seguridad lógica**
  - [ ] Copia de seguridad incremental

6. ¿Qué objeto en MySQL permite ejecutar una serie de instrucciones SQL de manera secuencial?
  - [ ] Trigger
  - [ ] Event
  - [x] Procedure
  - [ ] Function

7. ¿Qué comando se utiliza para ver todas las bases de datos en MySQL?
  - [x] SHOW DATABASES;
  - [ ] VIEW DATABASES;
  - [ ] LIST DATABASES;
  - [ ] DISPLAY DATABASES;

8. ¿Qué comando se utiliza para ver todas las bases de datos en MySQL?
  - [ ] 3308
  - [x] 3306
  - [ ] 3307
  - [ ] 3309

9. ¿Qué comando se utiliza para seleccionar una base de datos específica en MySQL?
  - [ ] SHOW DATABASE;
  - [ ] DROP DATABASE;
  - [x] USE DATABASE;
  - [ ] SELECT DATABASE;

10. ¿Qué comando se utiliza para eliminar una tabla en MySQL?
  - [ ] REMOVE TABLE
  - [ ] DESTROY TABLE
  - [ ] DELETE TABLE
  - [x] DROP TABLE

11. ¿Qué permiso se usa para poder añadir valores en las bases de datos de mysql?
  - [ ] ALTER
  - [ ] SELECT
  - [ ] ADD
  - [x] INSERT

12. ¿Cuál es el comando para mostrar la estructura de una tabla en MySQL?
  - [ ] VIEW table_name;
  - [x] DESCRIBE table_name;
  - [ ] SHOW DATABASE;
  - [ ] SHOW STRUCTURE table_name;

13. ¿Qué tipo de dato se utiliza comúnmente para almacenar fechas en MySQL?
  - [ ] DATESTAMP
  - [ ] DATETIME
  - [ ] TIMEDATE
  - [x] DATE

14. ¿Qué característica de MySQL se utiliza para garantizar que las transacciones se completen con éxito antes de aplicar los cambios?
  - [ ] Aislamiento
  - [ ] Durabilidad
  - [ ] Consistencia
  - [x] Atomicidad

15. ¿Cuál de los siguientes objetos de MySQL puede devolver un valor?
  - [x] Function
  - [ ] Procedure
  - [ ] Trigger
  - [ ] Event

## DESARROLLO

```md
Descargue el siguiente archivo haciendo click aquí: 
  2024_ADBDD_simulacro.pdfDownload 2024_ADBDD_simulacro.pdf

Una vez descargado, elija 2/3 de las preguntas propuestas y réalicelas, completando el documento con su nombre y apellidos según se indica. 
Cuando termine las preguntas guarde el archivo en formato PDF y cambie el título del mismo, indicando su nombre y apellidos, de la siguiente manera: "Nombre_Apellidos_ Módulo X_ExamenOrdinaria". Solo se aceptarán los exámenes en formato en PDF. 
En el caso que tengas que subir otros documentos adjuntos, estos estarán indicados en el la propio documento de examen.  
Suba el archivo a esta actividad.

BBDD_ventas_examen.sql
```

- Preguntas abiertas (elija 2 de las siguientes preguntas). 
- Para cada Ejercicio un pantallazo o recorte con el código para poder comprobarlo.


### Desarrollo 1 -- Contesta con comandos de mysql: (3.5 puntos).

1. Crea un nuevo usuario en MySQL llamado "usuario1" con contraseña "password1".
2. Después de crear el usuario "usuario1", otórgale permisos para que pueda seleccionar, insertar, actualizar y eliminar registros en todas las tablas de la base de datos "basedatos1".
3. Utilizando el usuario "usuario1" recién creado, verifica que puedas realizar las siguientes acciones:
   1. Seleccionar datos de la tabla "tabla1".
   2. Insertar un nuevo registro en la tabla "tabla2". 
   3. Actualizar un registro existente en la tabla "tabla3". 
   4. Eliminar un registro de la tabla "tabla4". 


```bash
##### CUSTOM #####
# pip install -U mycli && ln -s ~/dotfiles/.myclirc ~/
mycli -u root -pchangeme -e "CREATE DATABASE basedatos1;"
for i in {1..4}; do
  mycli -u root -pchangeme -D basedatos1 -e "CREATE TABLE tabla$i (id INT AUTO_INCREMENT PRIMARY KEY,foo VARCHAR(255));"
  mycli -u root -pchangeme -D basedatos1 -e "INSERT INTO tabla$i (foo) VALUES ('bar');"
done
```

```sql
-- $ docker exec -it examen_db-db-1 bash

-- 1
-- $ mysql -u root -pchangeme
create user 'usuario1' identified by 'password1';

-- 2
grant select,insert,update,delete on basedatos1.* to 'usuario1';

-- 3a
-- $ mysql -u usuario1 -ppassword1 -D basedatos1
select * from tabla1;

-- 3b
insert into tabla2 (id,foo) values (101,'bar');
select * from tabla2;

-- 3c
update tabla3 set foo = 'sup' where id = 1;
select * from tabla3;

-- 3d
delete from tabla4 where id in (1);
select * from tabla4;
```


### Desarrollo 2 -- Problemas de Procedures/functions (3.5 puntos).

1. Crea un **procedimiento almacenado** llamado obtener_promedio que calcule el promedio de las ventas totales en la tabla pedido y lo muestre como resultado.
2. Crea una **función almacenada** llamada calcular_total_ventas que tome el id  de un cliente como argumento y devuelva el total de ventas realizadas por ese cliente. 

```sql
-- 1
DELIMITER //
CREATE PROCEDURE obtener_promedio ()
BEGIN
  SELECT ROUND(AVG(total),4) FROM pedido;
END //
DELIMITER ;
-- ---
CALL obtener_promedio;
```

```sql
-- 2
DELIMITER //
CREATE FUNCTION calcular_total_ventas (fnc_id_cliente INT) RETURNS DOUBLE
DETERMINISTIC
BEGIN
  DECLARE total_compras DOUBLE DEFAULT 0.00;

  SELECT SUM(total) INTO total_compras
  FROM pedido WHERE id_cliente = fnc_id_cliente;
  
  RETURN total_compras;
END //
DELIMITER ;
-- ---
SELECT calcular_total_ventas(4);
```


### Desarrollo 3 -- Ejercicios de automatización: (3.5 puntos).

Crea un trigger en MySQL llamado actualizar_fecha_modificacion que se active después de cada actualización en la tabla pedido. Este trigger actualizará automáticamente la columna fecha_modificacion con la fecha y hora actuales cada vez que se realice una modificación en un registro de la tabla pedido.
Este trigger asegurará que la columna fecha_modificacion se mantenga actualizada en todo momento, reflejando la última vez que se modificó un registro en la tabla pedido.

> **Ejercicio mal planteado**: el trigger se activa con un UPDATE y hace un UPDATE, con lo que intentará ejecutarse ad infinitum, por lo que MySQL no permite hacer ese primer UPDATE

```sql
-- CUSTOM --
ALTER TABLE pedido ADD fecha_modificacion DATETIME AFTER fecha;
UPDATE pedido SET fecha_modificacion = NOW();
-- CUSTOM --

DELIMITER //
CREATE TRIGGER actualizar_fecha_modificacion
AFTER UPDATE ON pedido
FOR EACH ROW
BEGIN
  UPDATE pedido SET fecha_modificacion = NOW() WHERE id = NEW.id;
  -- UPDATE pedido SET NEW.fecha_modificacion = NOW() WHERE id = NEW.id;
END //
DELIMITER ;
-- ---
update pedido set total = total + 69 where id = 11;
-- (1442, "Can't update table 'pedido' in stored function/trigger because it is already used by statement which invoked this stored function/trigger")
-- https://stackoverflow.com/questions/59265100/sqlstatehy000-general-error-1442-cant-update-table-in-stored-function-tr

select * from pedido ORDER BY fecha_modificacion DESC;
```
