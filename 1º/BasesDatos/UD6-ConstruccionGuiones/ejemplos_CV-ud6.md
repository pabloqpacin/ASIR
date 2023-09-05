# Ejemplos código SQL

- [Ejemplos código SQL](#ejemplos-código-sql)
  - [IF alt doble](#if-alt-doble)
  - [IF alt multiple](#if-alt-multiple)
  - [CASE](#case)
  - [WHILE](#while)
  - [LOOP](#loop)
  - [REPEAT](#repeat)
  - [TRIGGER](#trigger)
  - [CURSOR](#cursor)
  - [HANDLER](#handler)
  - [CURSOR + HANDLER](#cursor--handler)

## IF alt doble

```sql
DELIMITER $$
CREATE FUNCTION f_mayor_edad(fecha DATE)
    RETURNS VARCHAR(2)
    DETERMINISTIC
BEGIN
	IF YEAR(NOW()) - YEAR(fecha) >= 18
        THEN RETURN "SÍ";
	    ELSE RETURN "NO";
	END IF;
END $$
```

## IF alt multiple

```sql
DELIMITER $$
CREATE FUNCTION f_calculadora(num1 INT, operador CHAR(1), num2 INT)
    RETURNS REAL
    DETERMINISTIC
BEGIN
	IF operador = "+" THEN
		RETURN num1+num2;
	ELSEIF operador = "-" THEN
		RETURN num1-num2;
	ELSEIF operador =  "x" THEN
		RETURN num1*num2;
	ELSEIF operador = "/" THEN
		RETURN num1/num2;
	ELSE
		RETURN NULL;
	END IF;
END $$
```


## CASE

```sql
DELIMITER $$
CREATE FUNCTION f_calculadora_case(num1 INT, operador CHAR(1), num2 INT)
    RETURNS REAL
    DETERMINISTIC
BEGIN
	CASE
    WHEN operador = "+" THEN
		RETURN num1+num2;
	WHEN operador = "-" THEN
		RETURN num1-num2;
	WHEN operador =  "x" THEN
		RETURN num1*num2;
	WHEN operador = "/" THEN
		RETURN num1/num2;
	ELSE
		RETURN NULL;
	END CASE;
END $$
```

---


## WHILE

```sql
DELIMITER $$
CREATE FUNCTION f_asteriscos(cad VARCHAR(45))
    RETURNS VARCHAR(45)
    DETERMINISTIC
BEGIN
    DECLARE resul VARCHAR(45) DEFAULT "";
    DECLARE longitud INT;
    DECLARE contador INT DEFAULT 0;
        SET longitud = CHAR_LENGTH(cad);
        WHILE contador < longitud DO
            SET resul = CONCAT(resul,"*");
            SET contador = contador+1;
        END WHILE;
    RETURN resul;
END $$
```

## LOOP

```sql
DELIMITER $$
CREATE FUNCTION f_asteriscos_loop(cad VARCHAR(45))
    RETURNS VARCHAR(45)
    DETERMINISTIC
BEGIN
    DECLARE resul VARCHAR(45) DEFAULT "";
    DECLARE longitud INT;
    DECLARE contador INT DEFAULT 0;
    SET longitud = CHAR_LENGTH(cad);
    bucle1:LOOP
		SET resul = CONCAT(resul,"*");
        SET contador = contador+1;
        IF contador = longitud THEN
			LEAVE bucle1;
        END IF;
    END LOOP bucle1;
    RETURN resul;
END $$
```

## REPEAT

```sql
DELIMITER $$
CREATE FUNCTION f_asteriscos(cad VARCHAR(45))
    RETURNS VARCHAR(45)
    DETERMINISTIC
BEGIN
    DECLARE resul VARCHAR(45) DEFAULT "";
    DECLARE longitud INT;
    DECLARE contador INT DEFAULT 0;
    SET longitud = CHAR_LENGTH(cad);
    REPEAT
		SET resul = CONCAT(resul,"*");
        SET contador = contador+1;
    UNTIL  contador >= longitud
    END REPEAT;
    RETURN resul;
END $$
```

---

## TRIGGER

```sql
DELIMITER $$
CREATE TRIGGER reducir_stock
    BEFORE INSERT
    ON VENTAS
    FOR EACH ROW
BEGIN
   update stock
   set Cantidad_stock=Cantidad_stock-NEW.Cantidad
   where Producto=NEW.Producto;
END $$
```

## CURSOR

```sql
DELIMITER $$
CREATE PROCEDURE p_gasto_total_cursor(IN socio INT, OUT resul REAL)
BEGIN
   DECLARE num_filas INT;
   DECLARE contador INT DEFAULT 0;
   DECLARE gasto REAL;
   DECLARE cursor1 CURSOR FOR 
		   SELECT cantidad*preciounitario
           FROM ventas
           WHERE numsocio=socio;
   OPEN cursor1;
   SELECT COUNT(*) INTO num_filas
     FROM VENTAS
     WHERE NumSocio=socio;
   SET resul = 0; -- Inicializamos la variable
   WHILE contador < num_filas DO
	FETCH cursor1 INTO gasto;
	SET resul = resul + gasto;
    SET contador = contador + 1;
   END WHILE;
   CLOSE cursor1;
END $$
```

## HANDLER

```sql
DELIMITER $$
CREATE PROCEDURE p_insertar_venta
  (IN p_codventa INT,
   IN p_numsocio INT,
   IN p_fecha DATETIME,
   IN p_producto VARCHAR(20),
   IN p_cantidad INT,
   IN p_preciounitario DOUBLE)
BEGIN
 DECLARE CONTINUE HANDLER
 FOR 1062
	INSERT INTO ventas 
    VALUES (NULL,p_numsocio,p_fecha,p_producto,p_cantidad,p_preciounitario);
 SELECT * FROM ventas;
 INSERT INTO ventas
	VALUES (p_codventa,p_numsocio,p_fecha,p_producto,p_cantidad,p_preciounitario);
 SELECT * FROM ventas;
END $$
```

## CURSOR + HANDLER

```sql
DELIMITER $$
CREATE PROCEDURE p_gasto_total_cursor_y_handler
  (IN socio INT,
   OUT resul REAL)
BEGIN
-- Zona de declaración de variables
 DECLARE gasto REAL;
 DECLARE fin_bucle BOOLEAN DEFAULT 0;
-- Declaración del cursor
 DECLARE cursor_ventas CURSOR FOR
  SELECT Cantidad*PrecioUnitario
  FROM VENTAS
  WHERE NumSocio = socio;
-- Declaración de handlers
 DECLARE CONTINUE HANDLER
 FOR 1329
  SET fin_bucle = 1;
-- Empieza el código
-- Apertura del cursor
 OPEN cursor_ventas;
-- Inicializo el parámetro resul
 SET resul = 0;
-- Recorrido del cursor
 bucle1:LOOP
  FETCH cursor_ventas INTO gasto;
  IF fin_bucle = 1 THEN
	LEAVE bucle1;
  END IF;
  SET resul = resul + gasto;
 END LOOP bucle1;
-- Cierre del cursor
CLOSE cursor_ventas;
END$$
```


