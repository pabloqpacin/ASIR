# UT2.1 MySQL en Windows: instalación y ejercicios

## 1. Instalación MySQL en Windows

> Empleando **PowerShell 7.3.8** y el gestor de paquetes **[WinGet](https://github.com/microsoft/winget-cli) 1.6.2771**

<!-- En este ejercicio, tu tarea es aprender a instalar y configurar un servidor MySQL en tu sistema Windows. Sigue los siguientes pasos para completar la instalación:
- Descarga la última versión de MySQL para Windows desde el sitio oficial de MySQL.
- Ejecuta el archivo de instalación y sigue las instrucciones del asistente.
- Configura la contraseña de root y otros ajustes de seguridad durante la instalación.
- Verifica que el servidor esté funcionando correctamente utilizando el cliente MySQL.
- Una vez completada la instalación, podrás comenzar a utilizar MySQL para crear bases de datos, tablas y realizar consultas SQL -->

<!-- > - **Workbench: NO** -->
<!-- > - añadir **PATH**: `C:\Program Files\MySQL\...\bin` -->
<!-- ---
- objetivos:
    - ser capaces de administrar la base de datos desde cualquier sitio
="foo%" -- no lo entiende, interpreta literal
like "foo%" -- sí entiende la wildcard
--- -->


```ps1
# Instalar mysql mediante winget
winget upgrade --all && winget install Microsoft.VCRedist.2015+.x64
winget install oracle.mysql #mysql-installer-community-8.0.33.0.msi
```

<!-- ```ps1
# Iniciar configuración servidor
# Start-Process 'C:\Program Files (x86)\MySQL\MySQL Installer for Windows\MySQLInstaller.exe'
Start-Process 'C:\PROGRAMDATA\Mysql\MySQL Installer for Windows\Product Cache\mysql-8.0.33-winx64.msi'
``` -->

```yaml
# Start Menu > MySQL Installer - Community
Setup Type: Developer   # Server Shell Router Workbench
MySQL Server Configuration:
  - Add User: $env:USERNAME All_Hosts DB_Admin Password
  - ...
```

<!-- ```yaml
# Start Menu > MySQL Installer - Community
Setup Type: Developer   # includes Server Shell Router Workbench Examples_Tutorials_Documentation   # Enterprise_Backup Connectors
Configuration:
  MySQL Server:
    - Type and Networking: Development Computer -- TCP/IP 3306 33060 Open_Firewall
    - Strong Password: yes
    - Root Password: ...
    - Add User: $env:USERNAME All_Hosts DB_Admin Password
    - Windows Service: yes MySQL80 Startup_YES/NO/??
    - File Permissions: default   # C:\ProgramData\MySQL\MySQL Server 8.0\Data
  MySQL Router:
    - Bootstrap MySQL Router for use with InnoDB Cluster: no
  Samples and Examples:
    - Connect as: $env:USERNAME
``` -->


```ps1
# Añadir mysql.exe al PATH editando $PROFILE
$pathsToAdd = @(
  "$env:PROGRAMFILES\MySQL\MySQL Server 8.0\bin"
)

foreach ($path in $pathsToAdd) {
  if ($env:PATH -notlike "*$path*") {
    $env:PATH += ";$path"
  }
}

# Configurar el prompt (como Administrador)
"[mysql]`nprompt = '[\R:\m]\_\U\_(\d\T)>\_'" | Out-File 'C:\Program Files\MySQL\MySQL Server 8.0\my.ini'
```

```ps1
# Restaurar 'tienda.sql' y conectarse al servidor
Set-Location $env:HOMEPATH\Downloads
mysql -u pabloqpacin -p -e "source tienda.sql"
mysql -u pabloqpacin -p -D tienda
```
```sql
-- Manipulación de 'tienda'
SHOW TABLES;
\! cls
```

<!-- ```sql
SELECT
  CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME,
  REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'tienda';
``` -->

<!-- ```ps1
# Actualizar MySQL a v 8.1.1
winget upgrade --all
``` -->


## 2.- Primeros ejercicios sobre la Base de Datos

Tenemos el siguiente Modelo ER: [...](##). Restauramos la copia de seguridad `Tienda.sql` que contiene los datos con los que vamos a operar. Realiza las siguientes consultas de manera adecuada:

1. ¿Cuántos fabricantes hay en la base de datos?

```sql
SELECT COUNT(*) FROM fabricante;
-- 18
```

2. ¿Cuál es el nombre del fabricante con ID 3?

```sql
SELECT nombre FROM fabricante WHERE ID = 3;
-- Hewlett-Packard
```

3. ¿Cuál es el precio del "Monitor 24 LED Full HD"?

```sql
SELECT precio FROM producto WHERE name LIKE '%24 LED%';
-- 202
```

4. ¿Cuántos productos tienen un precio superior a $500?

```sql
SELECT COUNT(*) FROM producto WHERE precio > 500;
-- 8
```

5. ¿Cuáles son los nombres de los productos fabricados por Asus?

```sql
SELECT nombre FROM producto WHERE id_fabricante = (
  SELECT id FROM fabricante WHERE nombre = 'Asus'
);
-- Monitor 24 LED Full HD, Monitor 27 LED Full HD
```
<!-- -- SELECT * FROM producto p JOIN fabricante f ON p.id_fabricante = f.id; -->

6. ¿Cuál es el fabricante del producto con ID 9?

```sql
SELECT nombre FROM fabricante WHERE id = (
  SELECT id_fabricante FROM producto WHERE id = 9
);
-- Lenovo
```

<br>

7. ¿Cuál es el producto más caro en la base de datos?

```sql
SELECT * FROM producto ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto WHERE precio = (
  SELECT MAX(precio) FROM producto
);
-- 13 | MacBook Pro 13 | 1499 | 11
```

8. ¿Cuál es el promedio de precios de los productos?

```sql
SELECT ROUND(AVG(precio)) FROM producto;
-- 464
```

9.  ¿Cuántos productos cuestan menos de $100?

```sql
SELECT COUNT(*) FROM producto WHERE precio < 100;
-- 3
```

10. ¿Cuáles son los nombres de los fabricantes en orden alfabético?

```sql
SELECT nombre FROM fabricante ORDER BY nombre ASC;
```

11. ¿Cuál es el producto más barato fabricado por Lenovo?

```sql
SELECT nombre FROM producto WHERE id_fabricante = (
  SELECT id FROM fabricante WHERE nombre LIKE 'Lenovo'
) ORDER BY precio ASC LIMIT 1;

SELECT p.nombre FROM producto p
  JOIN fabricante f ON p.id_fabricante = f.id
  WHERE f.nombre = 'Lenovo'
  ORDER BY p.precio LIMIT 1;

-- Portatil Ideapad 320
```

12. ¿Cuántos productos tiene un nombre que contiene la palabra "Portátil"?

```sql
SELECT COUNT(*) FROM producto WHERE nombre LIKE '%Portátil%';
-- 3
```

13.  ¿Cuál es el fabricante más antiguo en la base de datos (con el ID más bajo)?

```sql
SELECT nombre FROM fabricante ORDER BY id ASC LIMIT 1;
-- Asus
```

14. ¿Cuál es el nombre del producto con el precio más cercano a $200?

```sql
SELECT nombre FROM producto ORDER BY ABS(precio - 200) LIMIT 1;
-- Monitor 24 LED Full HD
```

15. ¿Cuántos productos tiene un precio entre $100 y $300?

```sql
SELECT COUNT(*) FROM producto WHERE precio BETWEEN 100 AND 300;
-- 7
```

16. ¿Cómo puedo actualizar el nombre del fabricante con ID 8 a "Honor"?

```sql
UPDATE fabricante SET nombre = 'Honor' WHERE ID = 8;
```

17. ¿Cómo puedo incrementar el precio del producto con ID 2 en $10?

```sql
UPDATE producto SET precio = precio + 10 WHERE id = 2;
```

18. ¿Cómo puedo cambiar el fabricante del producto con ID 9 a "Dell" (ID de fabricante 10)?

```sql
UPDATE producto SET id_fabricante = 10 WHERE id = 9;
```

19.  ¿Cómo puedo eliminar el producto con nombre "Impresora HP Deskjet 3720"?

```sql
DELETE FROM producto WHERE nombre LIKE 'Impresora HP Deskjet 3720';
```

20.  ¿Cómo puedo eliminar el fabricante con ID 11 (Apple).

```sql
INSERT INTO fabricante (id, nombre) VALUES (1001, '(pendiente)');
UPDATE producto SET id_fabricante = 1001 WHERE id_fabricante = 11;
DELETE FROM fabricante WHERE ID = 11;
```

