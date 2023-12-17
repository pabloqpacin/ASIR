# UD4.2 Gestión de Vistas y Backups

1.- Restauramos la copia de seguridad: tienda.sql

```bash
mysql -h 127.0.0.1 -u root -p -e "source tienda.sql"
mysql -h 127.0.0.1 -u root -p -D tienda
```
```sql
-- Número original de tablas: 2
SELECT COUNT(*) as tienda_num_tables
    FROM information_schema.tables 
    WHERE table_schema = 'tienda';
```

2.- Realiza las siguientes vistas:

1. Crea una vista llamada "vista_productos_costosos" que muestre los productos con un precio superior a $500.

```sql
create view vista_productos_costosos as (
    select * from producto where precio > 500
);
```

2. Crea una vista llamada "vista_fabricantes_asus" que muestre los productos fabricados por Asus.

```sql
create view vista_fabricantes_asus as (
    select * from producto where id_fabricante = (
        select id from fabricante where nombre like 'Asus'
    )
);
```

3. Crea una vista llamada "vista_fabricantes_top" que muestre los fabricantes de “HP”

```sql
-- Subconsulta
create view vista_fabricantes_top as (
    select * from fabricante where id in (
        select id_fabricante from producto where nombre like '%HP%'
    )
);
```

```sql
-- JOIN
CREATE VIEW vista_fabricantes_top AS (
    SELECT DISTINCT f.*
    FROM fabricante f
    JOIN producto p ON f.id = p.id_fabricante
    WHERE p.nombre LIKE '%HP%'
);
```

4. Crea una vista llamada "vista_productos_baratos" que muestre los productos con un precio inferior a $100.

```sql
create view vista_productos_baratos as (
    select * from producto where precio < 100
);
```


3.-Haz una copia de seguridad completa que se llame: Back_vistas.sql usando mysqldump- ¿se guardan las vistas en el Backup?

> IMPORTANTE: sin `--databases` no se incluye la sentencia `create database tienda;`, lo que obstaculizaría importar el archivo sql

```bash
mysqldump -h 127.0.0.1 -u root -p --databases tienda > Back_vistas.sql

if grep -q 'view' Back_vistas.sql
    then echo 'Las vistas SÍ se han guardado'
    else echo 'Las vistas NO se han guardado'
fi
```

4.- Borra la  vista “vista_fabricantes_asus”

```sql
drop view vista_fabricantes_asus;
```

5.- Restaura la copia de seguridad Back_vistas.sql. ¿se ha recuperado la vista?

```bash
mysql -h 127.0.0.1 -u root -p -e "source Back_vistas.sql"
# mysql -h 127.0.0.1 -u root -p < Back_vistas.sql

# mysql -h 127.0.0.1 -u root -p -e "
#     create database if not exists tienda;
#     use tienda; source Back_vistas.sql;"

mysql -h 127.0.0.1 -u root -p -D tienda
```


```sql
-- SÏ SE HAN RECUPERADO LAS VISTAS
SELECT TABLE_NAME, TABLE_TYPE
    FROM information_schema.tables
    WHERE table_schema = 'tienda';
-- SHOW TABLES pero muestra el tipo de tabla (base table VS view)
```