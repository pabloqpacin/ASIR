--
-- Insert data into `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`, `ciudad`) VALUES
    (1, 'LUIS', 'GARCIA', 'MADRID'),
    (2, 'ANTONIO', 'LOPEZ', 'VALENCIA'),
    (3, 'JUAN', 'MARTIN', 'MADRID'),
    (4, 'MARIA', 'GARCIA', 'MADRID'),
    (5, 'JAVIER', 'GONZALEZ', 'BARCELONA'),
    (6, 'ANA', 'LOPEZ', 'BARCELONA');

/* -------------------------------------------------------------------------- */

--
-- Update and insert into `coches`
--

INSERT INTO `coches` (`codcoche`, `nombre`, `modelo`) VALUES
    (5, 'CORDOBA', 'GTI'),
    (11, 'ZX', 'TD');

UPDATE `coches`
    SET `modelo`= 'CARAVAN'
    WHERE `codcoche` = 15;
    
UPDATE `coches`
    SET `nombre`= 500, `modelo` = '525i'
    -- AND SET `modelo` = '525i'
    WHERE `codcoche` = 19;

/* -------------------------------------------------------------------------- */

--
-- Delete row in `concesionario`
--

DELETE FROM `concesionario`
    WHERE `CIFC` = 6;

/* -------------------------------------------------------------------------- */

--
-- Update data in `distribucion`
--

UPDATE `distribucion`
    SET `codcoche` = 5
    WHERE `CIFC` = 1 AND `codcoche`= 4;

UPDATE `distribucion`
    SET `cantidad` = 10
    WHERE `CIFC` = 2 AND `codcoche` = 9;

UPDATE `distribucion`
    SET `codcoche` = 11, `cantidad` = 3
    WHERE `CIFC`= 3 AND `codcoche` = 9;

/* -------------------------------------------------------------------------- */

--
-- Update and delete data in `marcas`
--

/*
DELETE FROM MARCAS
    WHERE CIFM = 6;
UPDATE MARCAS
    SET CIFM = 6
    WHERE CIFM = 7;
*/

UPDATE `marcas`
    SET `nombre` = 'BMW',
        `ciudad` = 'BARCELONA'
    WHERE `cifm` = 6;

DELETE FROM `marcas`
    WHERE `cifm` = 7;

/*
SET @name7 = (SELECT `name` FROM `BRANDS` WHERE `id` = 7);
SET @city7 = (SELECT `city` FROM `BRANDS` WHERE `id` = 7);
UPDATE `BRANDS`
    SET `name` = @name7,
        `city` = @city7
    WHERE `id` = 6;
*/

/* -------------------------------------------------------------------------- */

--
-- Insert data into `marco`
--

INSERT INTO `marco`(`cifm`, `codcoche`) VALUES
    (6, 18),
    (6, 19),
    (6, 20);

/* -------------------------------------------------------------------------- */

--
-- Insert data into `ventas`
--

INSERT INTO `ventas`(`cifc`, `DNI`, `codcoche`, `Color`) VALUES
    (1, 1, 1, 'BLANCO'),
    (1, 2, 5, 'ROJO'),
    (2, 1, 6, 'ROJO'),
    (2, 3, 8, 'BLANCO'),
    (3, 4, 11, 'ROJO'),
    (4, 5, 14, 'VERDE');
