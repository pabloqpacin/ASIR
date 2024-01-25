# UD 5.1 Automatización de tareas

## Preparativos

En mi sistema operativo Linux fue necesario realizar los siguientes cambios a la base de datos **usuarios.sql** proporcionada.

```sql
-- Líneas necesarias al inicio para poder hacer el 'source' directamente
DROP DATABASE IF EXISTS usuarios;
CREATE DATABASE usuarios;
USE usuarios;
```



Comandos para importar y manipular la base de datos.

```bash
# Arrancar contenedor MySQL
docker start mysql-container

# Importar la base de datos
mycli -u root -pchangeme -e "source UD6.1-usuarios.sql"

# Conectarse al servidor MySQL del contenedor
mycli -u root -pchangeme -D usuarios
```

## Ejercicios

Usando funciones que tenga mysql, responde a las preguntas:

1. Obtener los ID’s de los usuarios. Dentro del campo hay 2 partes. Sepáralas.

```sql
select
    LEFT(usuario, 3) as letras,
    RIGHT(usuario, 4) as numeros
from tblusuarios;
```


2. Obtener Longitud de los nombres de los usuarios, junto con el nombre

```sql
select
    LENGTH(nombre) as longitud,
    nombre
from tblusuarios;
```


3. Imprimir 'Usuario' seguido del nombre del usuario

```sql
select CONCAT('Usuario ', nombre) as fnombre
from tblusuarios;
```


4. Devolver la letra inicial más la letra final y longitud del nombre de los usuarios.

```sql
select
    LEFT(nombre, 1) as inicial,
    RIGHT(nombre, 1) as final,
    LENGTH(nombre) as num_caracteres
from tblusuarios;
```


5. Localizar la posición donde existe el primer espacio en el campo nombre

```sql
select INSTR(nombre, ' ')
from tblusuarios;
```


6. Imprimir Sra. o Sr. según sea el caso, seguido del nombre del alumno

```sql
select CONCAT('Sr. ',  nombre)
from tblusuarios where sexo like 'H';
select CONCAT('Sra. ',  nombre)
from tblusuarios where sexo like 'M';
```


7. Escribir en mayúsculas todos los emails.

```sql
select UPPER(email) from tblusuarios;
```


8. Escribir solo la primera letra del nombre en mayúscula y el resto es minúsculas.

```sql
select CONCAT(
    UPPER(LEFT(nombre, 1)),
    LOWER(SUBSTR(nombre, 2))
) as fnombre from tblusuarios;
```


9.  Aumentar en saldo en 100 a todos los usuarios que sean de 'yahoo'.

```sql
update tblusuarios
set saldo = saldo + 100
where email like '%yahoo%';
```


10.  Borrar los usuarios cuyo móvil acabe en '65'

```sql
delete from tblusuarios
where RIGHT(telefono, 2) like '65';
```


11. Mostrar cuántas veces aparece el nombre "María".

```sql
select count(*)
from tblusuarios
where nombre like 'María';
```

