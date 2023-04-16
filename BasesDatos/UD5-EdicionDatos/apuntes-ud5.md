# BasesDatos — UD5: Edición Datos (DML)

## ud5-teoria

```markdown
1. Instrucciones para la Manipulación de los Datos (DML)
   1. Sentencia INSERT
   2. Sentencia UPDATE
   3. Sentencia DELETE
   4. Sentencia REPLACE
2. Control de transacciones y concurrencia
   1. Sentencia START TRANSACTION en MySQL
   2. Sentencias COMMIT y ROLLBACK en MySQL
   3. Sentencias SAVEPOINT y ROLLBACK TO SAVEPOINT en MySQL
   4. Sentencias LOCK TABLES y UNLOCK TABLES
```

> @MySQL: [13.2.12 REPLACE Statement](https://dev.mysql.com/doc/refman/8.0/en/replace.html)

1. **Instrucciones para la Manipulación de los Datos (DML)**
    - *VALIDACIÓN (DML)* == automática-persistente || colaInstrucciones/Conexiones (`COMMIT`||`ROLLBACK`) &emsp; // `SET autocommit = 0; # 1`
   2. *INSERT* == `INSERT INTO tab (col1, col2) VALUES (val1, val2)` || `INSERT INTO ... SELECT ... `
   3. *UPDATE* == `UPDATE tab SET col = val WHERE <PK>` || `UPDATE tab SET (col1,col2) = (SELECT val1,val2 FROM ...)`
   4. *DELETE* == `DELETE FROM TABLA [WHERE ...]`
   5. *REPLACE* == [...]
2. **Control de transacciones y concurrencia (DCL)**
    - *TRANSACCIÓN "implícita"* == inicioConexión || post-`COMMIT` || post-`ROLLBACK` &emsp; // **MySQL** == default `autocommit`!!
   2. *START TRANSACTION "explícita"* == `START TRANSACTION <DML>` || `BEGIN` || `BEGIN WORK`
   3. *COMMIT y ROLLBACK* == `<DML> COMMIT` || `<DML> ROLLBACK` &emsp; // **MySQL** == default COMMIT pre`<DDL>`
   4. *SAVEPOINT y ROLLBACK TO SAVEPOINT* == `BEGIN <DML> SAVEPOINT tal <DML> ROLLBACK TO tal ... {COMMIT||ROLLBACK}`
   5. *LOCK TABLES y UNLOCK TABLES* == `LOCK TABLES tab1 {WRITE||READ}` — `UNLOCK TABLES` &emsp; // `-- FLUSH TABLES WITH READ LOCK`


<br>

--- 


> - @MySQL: [13.3.6 LOCK TABLES and UNLOCK TABLES Statements](https://dev.mysql.com/doc/refman/8.0/en/lock-tables.html)

The correct way to use `LOCK TABLES` and `UNLOCK TABLES` with transactional tables, such as **InnoDB** tables, is to begin a transaction with `SET autocommit = 0` (not `START TRANSACTION`) followed by `LOCK TABLES`, and to not call `UNLOCK TABLES` until you commit the transaction explicitly. For example, if you need to write to table `t1` and read from table `t2`, you can do this:

```sql
SET autocommit=0;
LOCK TABLES t1 WRITE, t2 READ, ...;
... do something with tables t1 and t2 here ...
COMMIT;
UNLOCK TABLES;
-- SET autocommit=1; (implicit after 'UNLOCK TABLES;')
```
When you call `LOCK TABLES`, **InnoDB** internally takes its own table lock, and MySQL takes its own table lock. **InnoDB** releases its internal table lock at the next commit, but for MySQL to release its table lock, you have to call `UNLOCK TABLES`. You should not have `autocommit = 1`, because then **InnoDB** releases its internal table lock immediately after the call of `LOCK TABLES`, and deadlocks can very easily happen. **InnoDB** does not acquire the internal table lock at all if `autocommit = 1`, to help old applications avoid unnecessary deadlocks.

> - @StackOverflow: [MySQL: LOCK TABLES with autocommit vs. START TRANSACTION](https://stackoverflow.com/questions/50539828/mysql-lock-tables-with-autocommit-vs-start-transaction)


--- 

<details>
<summary>DDL</summary>

```sql
-- DDL
CREATE SCHEMA new_topics;
USE new_topics;

CREATE TABLE topic (
    id int PRIMARY KEY,
    name varchar(50) NOT NULL);

ALTER TABLE topic
    MODIFY id int AUTO_INCREMENT = 100;

SHOW TABLES;
DESCRIBE topic;
```

</details>


```sql
-- [1.]
START TRANSACTION; -- (recommended?) SET autocommit = 0;
LOCK TABLES `topic` WRITE;
INSERT INTO `topic` (name) VALUES ('sup') ('dawg');
SAVEPOINT `add_topic`;
-- UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;
COMMIT; -- (implied!) SET autocommit = 1;
UNLOCK TABLES; 

-- [2.]
-- (no need) START TRANSACTION; OR SET autocommit = 0;
LOCK TABLES `topic` READ;
SELECT * FROM `topic`;
UNLOCK TABLES;
-- (no need) COMMIT;
```

--- 


<details>
<summary>DDL</summary>

```sql
CREATE DATABASE IF NOT EXISTS `genrez`;
USE `genrez`;

CREATE TABLE `genre` (
    id INT AUTO_INCREMENT,
    name varchar(50),
    PRIMARY KEY (id)
) AUTO_INCREMENT=100;

CREATE TABLE `topic` (
    id INT AUTO_INCREMENT,
    genre_id INT,
    name varchar(50),
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    PRIMARY KEY (id)
) AUTO_INCREMENT=1000;

CREATE TABLE genre_topic (
    id INT AUTO_INCREMENT,
    genre_id INT,
    topic_id INT,
    FOREIGN KEY (genre_id) REFERENCES genre (id),
    FOREIGN KEY (topic_id) REFERENCES topic (id),
    PRIMARY KEY (id)
);
```
</details>

```sql
INSERT INTO genre (name) VALUES
	('Electronics'), ('Programming'),
    ('Hacking'), ('Networking');

INSERT INTO topic (genre_id, name) VALUES
	(2, 'Malware'), (3, 'Malware'),
    (2, 'Python'), (2, 'Algorithms'),
    (1, 'Arduino'), (2, 'Arduino');
        
INSERT INTO genre_topic (genre_id, topic_id)
	SELECT g.id, t.id
	FROM genre g
	JOIN topic t ON g.id = t.genre_id;

------------------------------------------
UPDATE genre
	SET name = 'Cybersecurity'
    WHERE id = 3;

INSERT INTO topic (genre_id, name)
	VALUES (2, 'Cpp');

DELETE FROM topic
	WHERE id = 10;
------------------------------------------

SHOW ENGINE INNODB STATUS;
SELECT * FROM information_schema.INNODB_TRX;
