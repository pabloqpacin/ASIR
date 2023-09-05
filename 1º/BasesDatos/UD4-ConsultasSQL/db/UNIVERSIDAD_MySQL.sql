CREATE DATABASE  IF NOT EXISTS `universidad` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno_asignatura`
--

DROP TABLE IF EXISTS `alumno_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_asignatura` (
  `IdAlumno` varchar(10) NOT NULL,
  `IdAsignatura` int(11) NOT NULL,
  `NumeroMatricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAlumno`,`IdAsignatura`),
  KEY `FK2_idx` (`IdAsignatura`),
  CONSTRAINT `ALUMNO_ASIGNATURA_FK1` FOREIGN KEY (`IdAlumno`) REFERENCES `alumnos` (`IdAlumno`),
  CONSTRAINT `ALUMNO_ASIGNATURA_FK2` FOREIGN KEY (`IdAsignatura`) REFERENCES `asignaturas` (`IdAsignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno_asignatura`
--

LOCK TABLES `alumno_asignatura` WRITE;
/*!40000 ALTER TABLE `alumno_asignatura` DISABLE KEYS */;
INSERT INTO `alumno_asignatura` VALUES ('A010101',150212,1),('A020202',130113,1),('A020202',150212,2),('A030303',130113,3),('A030303',130122,2),('A030303',150212,1),('A040404',130122,1),('A121212',115,1),('A131313',160002,4);
/*!40000 ALTER TABLE `alumno_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `IdAlumno` varchar(10) NOT NULL,
  `DNI` char(9) DEFAULT NULL,
  PRIMARY KEY (`IdAlumno`),
  KEY `FK1_idx` (`DNI`),
  CONSTRAINT `ALUMNOS_FK1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('A121212','16161616A'),('A131313','17171717A'),('A020202','18181818A'),('A030303','20202020A'),('A010101','21212121A'),('A040404','26262626A');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `IdAsignatura` int(11) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Creditos` double DEFAULT NULL,
  `Cuatrimestre` int(1) DEFAULT NULL,
  `CosteBasico` double DEFAULT NULL,
  `IdProfesor` varchar(10) DEFAULT NULL,
  `IdTitulacion` varchar(10) DEFAULT NULL,
  `Curso` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`IdAsignatura`),
  KEY `ASIGNATURAS_FK1_idx` (`IdProfesor`),
  KEY `ASIGNATURAS_FK2_idx` (`IdTitulacion`),
  CONSTRAINT `ASIGNATURAS_FK1` FOREIGN KEY (`IdProfesor`) REFERENCES `profesores` (`IdProfesor`),
  CONSTRAINT `ASIGNATURAS_FK2` FOREIGN KEY (`IdTitulacion`) REFERENCES `titulaciones` (`IdTitulacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (000115,'Seguridad Vial',4.5,1,30,'P204',NULL,NULL),(130113,'Programación I',9,1,60,'P101','130110','1'),(130122,'Análisis II',9,2,60,'P203','130110','2'),(150212,'Química Física',4.5,2,70,'P304','150210','1'),(160002,'Contabilidad',6,1,70,'P117','160000','1');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `DNI` char(9) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  `DireccionCalle` varchar(20) DEFAULT NULL,
  `DireccionNum` int(4) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `FechaNacimiento` datetime DEFAULT NULL,
  `Varon` int(1) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES ('16161616A','Luis','Ramirez','Haro','Pez',34,941111111,'1969-01-01 21:30:00',1),('17171717A','Laura','Beltran','Madrid','Gran Via',23,912121212,'1974-08-08 08:15:00',0),('18181818A','Pepe','Perez','Madrid','Percebe',13,913131313,'1980-02-02 22:40:00',1),('19191919A','Juan','Sanchez','Bilbao','Melancolia',7,944141414,'1966-03-03 13:20:00',1),('20202020A','Luis','Jimenez','Najera','Cigüeña',15,941151515,'1979-03-03 03:05:00',1),('21212121A','Rosa','Garcia','Haro','Alegria',16,941161616,'1978-04-04 13:30:00',0),('23232323A','Jorge','Saenz','Logroño','Luis Ulloa',17,941171717,'1978-09-09 00:55:00',1),('24242424A','María','Gutierrez','Logroño','Avda. de la Paz',18,941181818,'1964-10-10 19:45:00',0),('25252525A','Rosario','Diaz','Logroño','Percebe',19,941191919,'1971-11-11 06:00:00',0),('26262626A','Elena','Gonzalez','Logroño','Percebe',20,941202020,'1975-05-05 16:50:00',0);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `IdProfesor` varchar(10) NOT NULL,
  `DNI` char(9) DEFAULT NULL,
  PRIMARY KEY (`IdProfesor`),
  KEY `PROFESORES_FK1_idx` (`DNI`),
  CONSTRAINT `PROFESORES_FK1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES ('P101','19191919A'),('P203','23232323A'),('P304','24242424A'),('P117','25252525A'),('P204','26262626A');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulaciones`
--

DROP TABLE IF EXISTS `titulaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulaciones` (
  `IdTitulacion` varchar(10) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTitulacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulaciones`
--

LOCK TABLES `titulaciones` WRITE;
/*!40000 ALTER TABLE `titulaciones` DISABLE KEYS */;
INSERT INTO `titulaciones` VALUES ('130110','Matematicas'),('150210','Quimicas'),('160000','Empresariales');
/*!40000 ALTER TABLE `titulaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

