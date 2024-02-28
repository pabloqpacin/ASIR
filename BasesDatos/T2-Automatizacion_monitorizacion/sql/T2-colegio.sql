CREATE DATABASE Colegio;
USE Colegio;

CREATE TABLE alumno (
    cod INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    fecha_nac  DATE,
    edad INT 
);

INSERT INTO alumno VALUES (NULL,'Raul','Hervas','2000/12/20',NULL);
INSERT INTO alumno VALUES (NULL,'Marta','Ros','2002/01/21',NULL);
INSERT INTO alumno VALUES (NULL,'Miguel','Ruiz','2001/10/11',NULL);

CREATE TABLE profesor (
    cod INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(20)  NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    fecha_nac  DATE,
    edad INT
);

INSERT INTO profesor VALUES (NULL,'Samuel','Arranz','1965/10/06',NULL);
INSERT INTO profesor VALUES (NULL,'Carlos','Perez','1978/06/14',NULL);
