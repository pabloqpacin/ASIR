# BasesDatos — UD6: Scripts

## 1.

- Escribe una función que reciba como parámetros dos cadenas de caracteres (máximo 20 caracteres cada una) y devuelva otra cadena con las iniciales de las 2 primeras, separadas por punto (.).
- Ej: `"Juan","Pérez"` -> `"J.P."`
- Puedes utilizar las funciones `LEFT` y `CONCAT` del listado de funciones MySQL.
- Un posible nombre para la función es `f_iniciales`.

```SQL
DELIMITER //
CREATE FUNCTION iniciales_nombre(nombre VARCHAR(20), apellido VARCHAR(20))
    RETURNS VARCHAR(5)
    DETERMINISTIC
BEGIN
    -- DECLARE ini1 CHAR(1);
    -- DECLARE ini2 CHAR(1);
    -- SET ini1 = LEFT(nombre,1);
    -- SET ini2 = LEFT(apellido,1);
    -- RETURN UPPER(CONCAT(ini1,'.',ini2));
	RETURN UPPER(CONCAT(LEFT(nombre,1),'.',LEFT(apellido,1),'.'));
END //
DELIMITER ;
```

## 2.

- Escribe una función que reciba como parámetros dos números enteros y devuelva el mayor de los 2.
- Un posible nombre para la función es `f_mayor`.


```sql
DELIMITER //
CREATE FUNCTION num_mayor (num1 int, num2 int)
	RETURNS INT
	DETERMINISTIC
	BEGIN
		IF num1 > num2 THEN RETURN num1;
		ELSEIF num1 < num2 THEN RETURN num2;
		ELSEIF num1 = num2 THEN RETURN num1;
		ELSE RETURN 42069;
		END IF;
	END //
DELIMITER ;
```


## 3.

- Escribe una función que reciba como parámetro un número entero y devuelva una cadena de texto en la que indique `PAR` si el número es par, o `IMPAR` si no lo es.
- Un número es par si su división entre 2 es exacta (devuelve 0).
- La función `MOD` de MySQL devuelve el resto de una división.
- Un posible nombre para la función es `f_es_par`.


```sql
DELIMITER //
CREATE FUNCTION f_es_par (num int)
    RETURNS VARCHAR(10)
    DETERMINISTIC
    BEGIN
        IF num % 2 = 0 THEN RETURN 'PAR';
            ELSE RETURN 'IMPAR';
        END IF;
    END //
DELIMITER;
```


## 4.

- Para realizar este ejercicio necesitarás importar la Base de Datos `MITIENDA`, que encontrarás en el apartado RECURSOS de esta Unidad
- Escribe una función que reciba como parámetro un **número de socio** (de la tabla `CLIENTES`) y devuelva la **fecha de nacimiento** de dicho **cliente**. Un posible nombre para la función es `f_fecha_nacimiento`.


```sql
DELIMITER //
CREATE FUNCTION nacimiento_socio (z_numSocio int)
    RETURNS DATE
    DETERMINISTIC
    BEGIN
		DECLARE z_FechaNac DATE;
        SELECT FechaNac INTO z_FechaNac
			FROM clientes WHERE NumSocio = z_numSocio;
        RETURN z_FechaNac;
    END //
DELIMITER ;
```


## 5.

- Para realizar este ejercicio necesitarás importar la Base de Datos `MITIENDA`, que encontrarás en el apartado RECURSOS de esta Unidad.
- Escribe un procedimiento que reciba dos parámetros de entrada (un **número de socio** y un **número entero**) y actualice la tabla `CLIENTES`, sumándole al **cliente** indicado en el primer parámetro la **cantidad de puntos** recibida como segundo parámetro.

```sql
DELIMITER //
CREATE PROCEDURE sumar_puntos_cliente (IN z_numSocio int, IN z_numPuntos int)
    BEGIN
		SELECT CONCAT('Cliente num ',z_numSocio,' sin actualizar. Total puntos: ',Puntos)
			AS mensajePRE FROM clientes WHERE NumSocio = z_NumSocio ; 
        UPDATE clientes SET Puntos = Puntos + z_numPuntos
			WHERE NumSocio = z_NumSocio;
		SELECT CONCAT('Cliente num ',z_numSocio,' actualizado. Total puntos: ',Puntos)
			AS mensajePOST FROM CLIENTES WHERE NumSocio = z_NumSocio;
    END //
DELIMITER ;
```

## 6.

- Escribe un procedimiento que reciba dos parámetros de salida y devuelva en ellos dos números aleatorios entre el 1 y el 10, que sean distintos entre sí.
- Para ello se podrá utilizar la función de MySQL `RAND`, que devuelve un valor aleatorio entre 0 y 1, y multiplicarlo por 10. Esto se debe repetir hasta que los dos números sean distintos (puede ser a la primera, o tras varios intentos), se implementará mediante un bucle.


```sql
CALL two_rand_generator(@rn1, @rn2);
SELECT @rn1, @rn2;

DELIMITER //
CREATE PROCEDURE two_rand_generator (OUT rn1 int, OUT rn2 int)
	BEGIN
		SET rn1 = 0;
        SET rn2 = 0;
        WHILE rn1 = rn2 DO
			SET rn1 = ROUND(10*rand());
			SET rn2 = ROUND(10*rand());
		END WHILE;
	END //
DELIMITER ;

--

DELIMITER $$
CREATE PROCEDURE p_generar_dos_aleatorios (OUT valor1 INT, OUT valor2 INT)
	BEGIN
	  REPEAT
		SET valor1=rand()*10;
		SET valor2=rand()*10;
	  UNTIL valor1<>valor2  
	  END REPEAT;
	END $$
DELIMITER ; 
```