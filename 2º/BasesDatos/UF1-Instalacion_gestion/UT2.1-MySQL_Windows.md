# UT2.1 MySQL en Windows: instalación y ejercicios

## 1. Instalación MySQL en Windows

En este ejercicio, tu tarea es aprender a instalar y configurar un servidor MySQL en tu sistema Windows. Sigue los siguientes pasos para completar la instalación:
- Descarga la última versión de MySQL para Windows desde el sitio oficial de MySQL.
- Ejecuta el archivo de instalación y sigue las instrucciones del asistente.
- Configura la contraseña de root y otros ajustes de seguridad durante la instalación.
- Verifica que el servidor esté funcionando correctamente utilizando el cliente MySQL.
- Una vez completada la instalación, podrás comenzar a utilizar MySQL para crear bases de datos, tablas y realizar consultas SQL

> - **Workbench: NO**
<!-- > - añadir **PATH**: `C:\Program Files\MySQL\...\bin` -->
<!-- ---
- objetivos:
    - ser capaces de administrar la base de datos desde cualquier sitio
="foo%" -- no lo entiende, interpreta literal
like "foo%" -- sí entiende la wildcard
--- -->


```ps1
# winget install Microsoft.VCRedist.2015+.x64
winget install oracle.mysql
```

```yaml
Mysql_installer: complete
```

<!--
```yaml
# Mysql_installer
Setup: Full             # TODO: for sure????????????????????????????????????????
Type and Networking:
    Config Type: Development Computer
    Connectivity: TCP/IP 3306 33060
        # Open Windows Firewall ports for network access: yes
Authentication Method:
    Strong Password: # susodicho881;;
    Add User:
        Username: pabloqpacin
        Host: All Hosts (%)
        Role: DB Admin
        Password: # susodicho882;;
Windows Service:
    Configure MySQL Server as a Windows Server: yes
    Windows Service Name: MySQL80
    Start the MySQL Server at System Startup: no
    Run Windows Service as ...: Standard System Account
Server File Permissions:
    Directory: C:\ProgramData\MySQL\MySQL Server 8.0\Data
    Update the server file permissions for you: Yes     # probably shouldn't

# Router
Configuration: Finish       # InnoDB Cluster: 6446 6447 6448 6449

# Server
Configuration:
    Username + Password: root # susodicho881;;
```
-->


```ps1
# Añadir mysql.exe al PATH editando mi $PROFILE:
$pathsToAdd = @(
  "$env:PROGRAMFILES\MySQL\MySQL Server 8.0\bin"
)

foreach ($path in $pathsToAdd) {
  if ($env:PATH -notlike "*$path*") {
    $env:PATH += ";$path"
  }
}
```

```ps1
# Iniciar sesión en el servidor
mysql -u pabloqpacin -p < tienda.sql
# mysql -u ...

\! cls              # make this a stored procedure or something lol
```

<!-- --- -->

<br>
<br>
<br>

## 2.- Primeros ejercicios sobre la Base de Datos

Tenemos el siguiente Modelo ER: [...](##). Restauramos la copia de seguridad `Tienda.sql` que contiene los datos con los que vamos a operar. Realiza las siguientes consultas de manera adecuada:

1. ¿Cuántos fabricantes hay en la base de datos?

```sql
-- foo
-- bar
```

2. ¿Cuál es el nombre del fabricante con ID 3?

```sql
-- foo
-- bar
```

3. ¿Cuál es el precio del "Monitor 24 LED Full HD"?

```sql
-- foo
-- bar
```

4. ¿Cuántos productos tienen un precio superior a $500?

```sql
-- foo
-- bar
```

5. ¿Cuáles son los nombres de los productos fabricados por Asus?

```sql
-- foo
-- bar
```

6. ¿Cuál es el fabricante del producto con ID 9?

```sql
-- foo
-- bar
```

7. ¿Cuál es el producto más caro en la base de datos?

```sql
-- foo
-- bar
```

8. ¿Cuál es el promedio de precios de los productos?

```sql
-- foo
-- bar
```

9.  ¿Cuántos productos cuestan menos de $100?

```sql
-- foo
-- bar
```

10. ¿Cuáles son los nombres de los fabricantes en orden alfabético?

```sql
-- foo
-- bar
```

11. ¿Cuál es el producto más barato fabricado por Lenovo?

```sql
-- foo
-- bar
```

12. ¿Cuántos productos tiene un nombre que contiene la palabra "Portátil"?

```sql
-- foo
-- bar
```

13. ¿Cuál es el fabricante más antiguo en la base de datos (con el ID más bajo)?

```sql
-- foo
-- bar
```

14. ¿Cuál es el nombre del producto con el precio más cercano a $200?

```sql
-- foo
-- bar
```

15. ¿Cuántos productos tiene un precio entre $100 y $300?

```sql
-- foo
-- bar
```

16. ¿Cómo puedo actualizar el nombre del fabricante con ID 8 a "Honor"?

```sql
-- foo
-- bar
```

17. ¿Cómo puedo incrementar el precio del producto con ID 2 en $10?

```sql
-- foo
-- bar
```

18. ¿Cómo puedo cambiar el fabricante del producto con ID 9 a "Dell" (ID de fabricante 10)?

```sql
-- foo
-- bar
```

19.  ¿Cómo puedo eliminar el producto con nombre "Impresora HP Deskjet 3720"?

```sql
-- foo
-- bar
```

20.  ¿Cómo puedo eliminar el fabricante con ID 11 (Apple).

```sql
-- foo
-- bar
```
