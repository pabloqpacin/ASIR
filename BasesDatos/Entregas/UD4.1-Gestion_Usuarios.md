# UD4.1 Gestión de de Usuarios

> Usamos la copia de seguridad : Tienda.sql (que hemos usado en ejercicios anteriores)

1. Crear un usuario llamado “alumno” que tenga permiso de SELECT a las tablas  PRODUCTO Y FABRICANTE .

```sql
-- create user 'alumno'@'192.168.%' identified by 'changeme';   -- LAN OK
-- create user 'alumno'@'172.17.%' identified by 'changeme';    -- Docker OK
create user 'alumno'@'%' identified by 'changeme';              -- Any... OK
grant select on tienda.fabricante, tienda.producto to 'alumno'@'%';
```

2. Crear un usuario llamado “profesor” que tenga permiso de SELECT y UPDATE (en todas las tablas de la BBDD tienda)

```sql
create user 'profesor'@'localhost' identified by 'changeme';
grant select,update on tienda.* to 'profesor'@'localhost';
```

3. Crear un usuario llamado “profesorasir” con los privilegios anteriores y los privilegios de inserción y borrado en la tabla.

```sql
create user 'profesorasir'@'localhost' identified by 'changeme';
grant select,update,insert,drop on tienda.* to 'profesorasir'@'localhost';
```

4. Crear un usuario llamado “adminasir” que tenga todos los privilegios a todas las bases de datos de nuestro servidor. 

```sql
create user 'adminasir'@'localhost' identified by 'changeme';
grant all privileges on *.* to 'adminasir'@'localhost';
```

5. Cambiar la contraseña de root a “css99”.

```sql
-- Comandos para versiones >= 8.0
select version();
alter user 'root'@'%' identified by 'css99';

-- -- Comandos para versiones < 8.0
-- set password for 'user'@'host' = PASSWORD('changeme');
```

6. Quitar los privilegios al usuario “profesorasir”.

```sql
revoke all privileges on *.* from 'profesorasir'@'localhost';
```

7. Eliminar todos los privilegios al usuario "alumno".

```sql
revoke all privileges on *.* from 'alumno'@'%';
```

8. Muestra los privilegios del usuario alumno.

```sql
show grants for 'alumno'@'%';
```



---




Otros comandos útiles...


```sql
-- Otros comandos útiles
select user,host from mysql.user;
flush privileges;

rename user 'user'@'host' to 'newuser'@'newhost';


\! ip route

SELECT HOST, USER(), INET6_NTOA(INET6_ATON(HOST)) AS current_ip
FROM information_schema.processlist WHERE ID = connection_id();
-- Docker: 172.17.0.1
```



