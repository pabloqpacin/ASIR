# BasesDatos — UD6: Elaboración de Guiones

## ud6-teoria

```markdown
1. Guiones
   1. Creación de guiones
2. Funciones
   1. Creación de funciones
3. Procedimientos almacenados
   1. Creación de procedimientos
   2. Parámetros de entrada
   3. Parámetros de salida
   4. Parámetros de entrada y salida
   5. Variables locales
   6. Variables de sistema o variables del usuario
   7. Estructuras condicionales
      1. Alternativa simple (IF-THEN)
      2. Alternativa doble (IF-THEN-ELSE)
      3. Alternativa múltiple (IF-THEN-ELSIF-THEN-ELSE)
      4. Estructura CASE
   8. Estructuras iterativas
4. Cursores
5. Tratamiento de errores
6. Disparadores (Triggers)
```

---

> - @MysqlTutorial: [MySQL Stored Procedure Parameters (IN | OUT | INOUT)](https://www.mysqltutorial.org/stored-procedures-parameters.aspx)
> - @MySQL: [13.6.5.2 IF Statement](https://dev.mysql.com/doc/refman/8.0/en/if.html)
>   - [FIX: Error 1418 (HY000): `SET GLOBAL log_bin_trust_function_creators = 1;`](https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i)
> - @MysqlTutorial: [MySQL CASE Statement](https://www.mysqltutorial.org/mysql-case-statement/)
> - @MysqlTutorial: [MySQL WHILE Loop](https://www.mysqltutorial.org/mysql-stored-procedure/mysql-while-loop/)
> - @MySQL: [13.1.20.2 CREATE TEMPORARY TABLE Statement](https://dev.mysql.com/doc/refman/8.0/en/create-temporary-table.html)
> - @MySQL: [13.6.6 Cursors](https://dev.mysql.com/doc/refman/8.0/en/cursors.html)


1. **Guiones**
   1. *Creación de guiones* == archivo `.sql` secuencia instrucciones: variablesEntorno || conexiónAdmin || creaciónUsuarioDB || eliminacionUsuarioDB || concesiónPrivilegios || conexiónNuevoUsuario || creaciónTablasíndices+inserciónDatos
2. **Funciones** <!--parámetros entrada + salida -->
   1. *Creación de funciones* == `DELIMITER // CREATE FUNCTION fun (a int) RETURNS int DETERMINISTIC BEGIN ... RETURN x END // DELIMITER ;`
3. **Procedimientos almacenados** <!--operaciones usuarios sin acceso tablas!! + encapsulamiento queries ok tráfico + RETURN múltiple!! -->
   1. *Creación Proced.* == 1-diseñoInstrucciones 2-implementarProced.
   2. *Parámetros de entrada* == `// CREATE PROCEDURE foo (IN bar int, IN baz int) BEGIN ... END //`
   3. *Parámetros de salida* == `// CREATE PROCEDURE foo (IN bar int, OUT baz int) BEGIN ... END //`
   4. *Parámetros de entrada y salida* == `// CREATE PROCEDURE foo (INOUT bar int) BEGIN ... END //`
   5. *Variables locales* == `BEGIN DECLARE foo int [DEFAULT 10] SET foo = 15`
   6. **Variables de sistema o variables del usuario**
     - "Las  variables  definidas  por  el  usuario (`@'variable'`)  son específicas  de  la  sesión.  Una  variable  de usuario definida por un usuario no puede ser vista o utilizada por otros usuarios. Todas las variables definidas en una sesión de cliente dada se liberan automáticamente cuando" el cliente sale.
     - `SET @foo = 'bar', @baz = 6;` - `SHOW VARIABLES LIKE '%port%';`
   7. **Estructuras condicionales**
      1. *Alternativa simple* == `IF condition THEN instructions END IF;`
      2. *Alternativa doble* == `IF condition THEN ins1 ELSE ins2 END IF;`
      3. *Alternativa múltiple* == `IF cond1 THEN ins1 ELSIF cond2 THEN ins2 ELSE ins3 END IF;`
      4. *Estructura CASE* == `CASE WHEN cond1 THEN SET ins1 WHEN cond2 THEN ins2 ELSE ins3 END CASE;`
   8. **Estructuras iterativas**
       - `WHILE condition DO instructions END  WHILE;`
       - `REPEAT instructions UNTIL condition END REPEAT;` <!--BUENO if REPETIR al menos 1 VEZ-->
       - `(...)`
4. **Cursores** == *(...)*
5. **Tratamiento de errores** == `DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;`
   - *Cond* == 'NOT FOUND' || 'Codigo_errorMySQL' || 'SQLstate' || 'SQLwarning'
6. **Disparadores Triggers** == 
   - `CREATE TRIGGER tal [BEFORE|AFTER] [INSERT|UPDATE|DELETE] ON tab FORE EACH ROW BEGIN cual END`
   - no DB sino *Tabla* &emsp; // `OLD` vs `NEW`

--- 

### Cursores ChatGPT

> demonstrate cursors in mysql in three levels of complexity using a single table declaration and calling all three cursors

Certainly! Here's an example of using cursors in MySQL with three levels of complexity, using a single table declaration and calling all three cursors.

Consider a table called `employees` with the following structure:

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2)
);
```

We can use cursors to retrieve data from this table in various ways. Let's demonstrate three levels of complexity with increasing complexity:

1. **Simple Cursor**: Fetching all rows from the `employees` table and printing the `id` and `name` columns.

```sql
DELIMITER //
CREATE PROCEDURE simple_cursor_example()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(50);

    -- Declare the cursor
    DECLARE cur CURSOR FOR SELECT id, name FROM employees;
    
    -- Declare handler for NOT FOUND condition
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    -- Open the cursor
    OPEN cur;
    
    -- Loop through the cursor
    read_loop: LOOP
        -- Fetch row from cursor
        FETCH cur INTO emp_id, emp_name;
        
        IF done THEN
            LEAVE read_loop; -- Exit from the loop
        END IF;
        
        -- Print the fetched data
        SELECT CONCAT('Employee ID: ', emp_id, ', Name: ', emp_name) AS 'Employee Info';
    END LOOP read_loop;
    
    -- Close the cursor
    CLOSE cur;
END//
DELIMITER ;
```

2. Cursor with Parameters: Fetching rows from the `employees` table based on a parameterized condition (e.g., age greater than a specified value) and printing the `id` and `name` columns.

```sql
DELIMITER //
CREATE PROCEDURE cursor_with_parameters_example(IN p_age INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(50);

    -- Declare the cursor with a parameterized query
    DECLARE cur CURSOR FOR SELECT id, name FROM employees WHERE age > p_age;
    
    -- Declare handler for NOT FOUND condition
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    -- Open the cursor
    OPEN cur;
    
    -- Loop through the cursor
    read_loop: LOOP
        -- Fetch row from cursor
        FETCH cur INTO emp_id, emp_name;
        
        IF done THEN
            LEAVE read_loop; -- Exit from the loop
        END IF;
        
        -- Print the fetched data
        SELECT CONCAT('Employee ID: ', emp_id, ', Name: ', emp_name) AS 'Employee Info';
    END LOOP read_loop;
    
    -- Close the cursor
    CLOSE cur;
END//
DELIMITER ;
```

3. **Cursor with Dynamic SQL**: Fetching rows from the `employees` table based on dynamically generated SQL query and printing the `id` and `name` columns.

```sql
DELIMITER //
CREATE PROCEDURE cursor_with_dynamic_sql_example(IN p_column VARCHAR(50), IN p_value VARCHAR(50))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(50);
    DECLARE cur_sql VARCHAR(200); -- Declare variable to store dynamic SQL

    -- Generate dynamic SQL
    SET cur_sql = CONCAT('SELECT id, name FROM employees WHERE ', p_column, ' = ?', p_value);

    -- Declare the cursor with dynamic SQL
    DECLARE cur CURSOR FOR PREPARE_STMT;

    -- Declare handler for NOT FOUND condition
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 
```