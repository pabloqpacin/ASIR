# UT2.1 MySQL en Linux: instalación y ejercicios

## 1. Instalación MySQL en Linux (Ubuntu)

- En local

```bash
sudo apt install mysql-server   # v8.0.35    # ls /var/log/mysql/error.log
systemctl status mysql

sudo mysql -e "alter user root@localhost' identified with mysql_native_password BY 'changeme';"
sudo mysql_secure_installation
    # Validate password component:  y
    # Pass policy level:            0
    # Change root passwd:           n
    # Remove anon users:            y
    # Disallow root login remotely: n       # ...
    # Remove test database:         y
    # Reload privilege tables:      y

sudo mysql -p -e "CREATE USER $USER@localhost IDENTIFIED BY 'changeme';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO $USER@localhost;"
# echo -e '[mysql]\nprompt = "[\R:\m]\_\U\_(\d\T)>\_"' \
#   | sudo tee /etc/mysql/mysql.conf.d/mysql.cnf

mysql -p -e "source empleados.sql"
mysql -p -D empresa
```

- Docker

```bash
sudo apt-get update && sudo apt-get install mysql-client
# https://github.com/pabloqpacin/dotfiles/blob/main/scripts/setup/docker-PopUbu.sh << instalación de Docker

mkdir -p $HOME/Docker_vs/asir_mysql
docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=changeme -d -p 3306:3306 -v $HOME/Docker_vs/asir_mysql:/var/lib/mysql mysql

mysql -h 127.0.0.1 -u root -p -e "source empleados.sql"
mysql -h 127.0.0.1 -u root -p -D empresa
```

<br>
<br>
<br>
<br>
---


## 2.- Primeros ejercicios sobre la Base de Datos


Tenemos el siguiente Modelo ER: [...](#). Restauramos la copia de seguridad [empleados.sql](/BasesDatos/T1-Instalacion_gestion/sql/UT2.2-empleados.sql) que contiene los datos con los que vamos a operar. Realiza las siguientes consultas de manera adecuada:



1. ¿Cuál es el nombre y el presupuesto de todos los departamentos?

```sql
SELECT nombre,presupuesto FROM departamento;
```

2. ¿Cuántos empleados hay en cada departamento?

```sql
SELECT
    d.nombre AS nombre_departamento,
    COUNT(e.id) AS num_empleados
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre;
```

3. ¿Cuál es el nombre y el gasto total de cada departamento?

```sql
SELECT nombre,(presupuesto - gastos) FROM departamento;
```

4. ¿Quiénes son los empleados con un salario mayor a $60,000?

```sql
SELECT * FROM empleado WHERE salario > 60000;
```

5. ¿Cuál es el departamento con el presupuesto más alto?

```sql
SELECT * FROM departamento ORDER BY presupuesto DESC LIMIT 1;
```

6. ¿Cuál es el nombre y salario del empleado mejor pagado?

```sql
SELECT nombre,salario FROM empleado ORDER BY salario DESC LIMIT 1;
```

7. ¿Cuál es el nombre del departamento con el menor gasto total?

```sql
SELECT * FROM departamento ORDER BY gastos ASC LIMIT 1;
```

8. ¿Cuál es el nombre del departamento que tiene más de 5 empleados?

```sql
SELECT
    d.nombre AS nombre_departamento,
    COUNT(e.id) AS num_empleados
FROM departamento d
INNER JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre
HAVING COUNT(e.id) > 5;
```

9. ¿Cuál es el nombre de los empleados que trabajan en el departamento de Ventas?

```sql
SELECT
    d.nombre as nombre_departamento
    e.nombre as nombre_empleado
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
WHERE e.id_departamento = 1;

-- SELECT
--     e.nombre as nombre_empleado
-- FROM empleado e
-- JOIN departamento d ON e.id_departamento = d.id
-- WHERE d.nombre = 'Departamento de Ventas';
```

10. ¿Cuál es el nombre y el presupuesto de los departamentos donde los gastos son más del 70% del presupuesto?

```sql
SELECT nombre,presupuesto FROM departamento WHERE gastos > presupuesto * 0.7;
```

11. ¿Cuál es el nombre y apellido de los empleados que no están asignados a ningún departamento?

```sql
SELECT nombre,apellido1 FROM empleado WHERE id_departamento IS NULL;
```

12. ¿Cuál es el nombre del departamento con un presupuesto superior al promedio de presupuestos de todos los departamentos?

```sql
SELECT nombre FROM departamento WHERE presupuesto > (
    SELECT AVG(presupuesto) FROM departamento
);
```

13. Nombre y salario de los empleados que ganan más que el promedio de salarios en su departamento.

```sql
SELECT e.nombre, e.salario
FROM empleado e
JOIN (
    SELECT id_departamento, AVG(salario) AS salario_promedio
    FROM empleado
    GROUP BY id_departamento
) dept_avg ON e.id_departamento = dept_avg.id_departamento
WHERE e.salario > dept_avg.salario_promedio;
```

14. ¿Cuál es el nombre del departamento que tiene más empleados?

```sql
SELECT d.nombre FROM departamento d
JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre
HAVING COUNT(e.id) = (
    SELECT MAX(num_empleados)
    FROM (
        SELECT COUNT(id) AS num_empleados
        FROM empleado
        GROUP BY id_departamento
    ) AS max_num_empleados
)
ORDER BY COUNT(e.id) DESC;

SELECT
    d.nombre AS nombre_departamento,
    COUNT(e.id) AS num_empleados
FROM departamento d
JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre
HAVING COUNT(e.id) = (
    SELECT MAX(num_empleados)
    FROM (
        SELECT COUNT(id) AS num_empleados
        FROM empleado
        GROUP BY id_departamento
    ) AS max_num_empleados
)
ORDER BY num_empleados DESC;
```

15. ¿Cuál es el nombre y apellido de los empleados que comparten el mismo departamento?

```sql
SELECT d.nombre,e.nombre,e.apellido1 FROM departamento d
JOIN empleado e ON d.id = e.id_departamento;
```