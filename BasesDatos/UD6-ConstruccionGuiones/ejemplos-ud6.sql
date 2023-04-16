-- 
-- {UD6: Scripts}
--

USE deletemey;

-- See all FUNCTION and PROCEDURE sorted by schema
SHOW FUNCTION STATUS;
SHOW PROCEDURE STATUS;

-- See all variables
SHOW VARIABLES;


--
-- [2.1] CREATE FUNCTION
--

SELECT hello('world');

CREATE FUNCTION hello (s CHAR(20))
  RETURNS CHAR(50) DETERMINISTIC
    RETURN CONCAT('Hello, ',s,'!');

--

SELECT add_two_numbers(6,9);

DELIMITER //
CREATE FUNCTION add_two_numbers(a INT, b INT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE sum INT;
  SET sum = a + b;
  RETURN sum;
END
DELIMITER ;

--
-- [3.1] CREATE PROCEDURE
--

CALL get_row_count()

DELIMITER //
CREATE PROCEDURE get_row_count()
BEGIN
  DECLARE total_rows INT;
  SELECT COUNT(*) INTO total_rows FROM my_table;
  SELECT total_rows AS 'Total Rows';
END //
DELIMITER ;

--
-- [3.2] CREATE PROCEDURE (IN)
--

CALL greet(CURRENT_USER());

DELIMITER //
CREATE PROCEDURE greet(IN name VARCHAR(50))
BEGIN
  SELECT CONCAT('Hello, ', name, '!') AS 'Greeting';
END //
DELIMITER ;

--
-- [3.3] CREATE PROCEDURE (OUT)
--

CALL add_numbers(6,9,@result);
	SELECT @result AS sum;

DELIMITER //
CREATE PROCEDURE add_numbers(IN a INT, IN b INT, OUT sum INT)
BEGIN
  SET sum = a + b;
END //
DELIMITER ;

--
-- [3.4] CREATE PROCEDURE (INOUT)
--

SET @my_name = 'John'; -- Declare a variable to hold the value of the INOUT parameter
CALL greet(@my_name); -- Call the stored procedure and pass the variable as the INOUT parameter
SELECT @my_name AS greeted_name; -- Access the modified value of the INOUT parameter

DELIMITER //
CREATE PROCEDURE greet(INOUT name VARCHAR(50))
BEGIN
  SET name = CONCAT('Hello, ', name, '!'); -- Modify the value of the INOUT parameter
END //
DELIMITER ;

--
-- [3.5] Variables locales
--

CALL sum_num_foo(6,@foo)

DELIMITER //
CREATE PROCEDURE sum_num_foo(IN num int, OUT foo int)
BEGIN
	DECLARE foo int DEFAULT 10;
    -- SET foo = 15;
    SELECT num + foo;
END //
DELIMITER ;

--

CALL producto_ventas('Boli'); 
SELECT * FROM VENTAS WHERE producto = 'Boli';

DELIMITER //
CREATE PROCEDURE producto_ventas(IN nombre VARCHAR(30))
BEGIN
  SELECT * FROM ventas WHERE producto = nombre;
END //
DELIMITER ;

--
-- [3.6] Variables sistema/usuario
--

SELECT @foo, @baz;
SET @foo = 'bar', @baz = 6;
SELECT @foo, @baz;

--
-- [3.7] Condicionales: IF THEN - ELSEIF THEN - ELSE
--

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //
CREATE FUNCTION SimpleCompare(n INT, m INT)
  RETURNS VARCHAR(20)
  BEGIN
    DECLARE s VARCHAR(20);

    IF n > m THEN SET s = '>';
    ELSEIF n = m THEN SET s = '=';
    ELSE SET s = '<';
    END IF;

    SET s = CONCAT(n, ' ', s, ' ', m);

    RETURN s;
  END //
DELIMITER ;

--
-- [3.7] Condicionales: CASE
--

SELECT * FROM CLIENTES;
CALL GetShippingCliente(204,@shipping);
SELECT @shipping;

DELIMITER $$
CREATE PROCEDURE GetShippingCliente(IN zNumSocio INT, OUT zShipping VARCHAR(50))
	BEGIN
	DECLARE provinciaCliente VARCHAR(100);
		SELECT provincia INTO provinciaCliente FROM clientes
			WHERE NumSocio = zNumSocio;
		CASE provinciaCliente
			WHEN  'Madrid' THEN SET zShipping = '2-day Shipping :^)';
			WHEN 'Valencia' THEN SET zShipping = '3-day Shipping :^|';
			ELSE SET zShipping = '5-day Shipping :^(';
	END CASE;
END$$
DELIMITER ;

--

DELIMITER $$
CREATE PROCEDURE GetDeliveryStatus(IN pOrderNumber INT, OUT pDeliveryStatus VARCHAR(100))
	BEGIN
	DECLARE waitingDay INT DEFAULT 0;
	SELECT DATEDIFF(requiredDate, shippedDate) INTO waitingDay
		FROM orders WHERE orderNumber = pOrderNumber;
	CASE 
		WHEN waitingDay = 0 THEN SET pDeliveryStatus = 'On Time';
		WHEN waitingDay >= 1 AND waitingDay < 5 THEN SET pDeliveryStatus = 'Late';
		WHEN waitingDay >= 5 THEN SET pDeliveryStatus = 'Very Late';
		ELSE SET pDeliveryStatus = 'No Information';
	END CASE;	
	END$$
DELIMITER ;

--
-- [3.8] Iteraciones: WHILE DO
--

CALL simple_while_loop();

DELIMITER //
CREATE PROCEDURE simple_while_loop()
BEGIN
    DECLARE counter INT DEFAULT 1; -- Initialize counter variable
    WHILE counter <= 10 DO -- Condition for the WHILE loop
        -- Your logic here, for example, print the counter value
        SELECT counter; 
        SET counter = counter + 1; -- Update counter variable
    END WHILE;
END//
DELIMITER ;

--

CALL simple_while_loop_temp_table();

DELIMITER //
CREATE PROCEDURE simple_while_loop_temp_table()
BEGIN
    DECLARE counter INT DEFAULT 1; -- Initialize counter variable
    
    -- Create a temporary table to store the results
    CREATE TEMPORARY TABLE temp_result (CounterValue INT);
    
    WHILE counter <= 10 DO -- Condition for the WHILE loop
        -- Insert the counter value into the temporary table
        INSERT INTO temp_result (CounterValue) VALUES (counter); 
        SET counter = counter + 1; -- Update counter variable
    END WHILE;
    
    -- Retrieve the results from the temporary table and display them
    SELECT * FROM temp_result;
    
    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_result;
END//
DELIMITER ;

--
-- [3.8] Iteraciones: LOOP
--

DELIMITER //
CREATE PROCEDURE simple_loop_example()
BEGIN
    DECLARE counter INT DEFAULT 1; -- Initialize counter variable
    
    -- Loop block
    simple_loop: LOOP
        -- Code to be executed
        SELECT counter as 'CounterValue';
        
        SET counter = counter + 1; -- Update counter variable
        
        IF counter > 10 THEN
            LEAVE simple_loop; -- Exit from the loop
        END IF;
    END LOOP simple_loop;
END//
DELIMITER ;

--
-- [4.] Cursors: DECLARE - OPEN - FETCH - CLOSE
--

CREATE PROCEDURE curdemo()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE a CHAR(16);
  DECLARE b, c INT;
  DECLARE cur1 CURSOR FOR SELECT id,data FROM test.t1;
  DECLARE cur2 CURSOR FOR SELECT i FROM test.t2;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN cur1;
  OPEN cur2;

  read_loop: LOOP
    FETCH cur1 INTO a, b;
    FETCH cur2 INTO c;
    IF done THEN
      LEAVE read_loop;
    END IF;
    IF b < c THEN
      INSERT INTO test.t3 VALUES (a,b);
    ELSE
      INSERT INTO test.t3 VALUES (a,c);
    END IF;
  END LOOP;

  CLOSE cur1;
  CLOSE cur2;
END;

--
-- [6.] Triggers
--

DELIMITER //
CREATE TRIGGER after_insert_tab1
    AFTER INSERT
    ON tab1 FOR EACH ROW
    BEGIN
        INSERT INTO tab2 (column1, column2, column3)
            VALUES (value1, value2, value3);
        UPDATE tab2
            SET column_name = NEW.new_value
            WHERE some_condition;
    END //
DELIMITER ;
