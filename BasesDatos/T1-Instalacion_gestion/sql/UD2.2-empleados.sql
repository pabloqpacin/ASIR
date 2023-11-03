-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: empleados
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departamento`
--
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
use empresa;
DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `presupuesto` double unsigned NOT NULL,
  `gastos` double unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Ventas',100000,75000),(2,'Departamento de Marketing',80000,60000),(3,'Departamento de Recursos Humanos',70000,55000),(4,'Departamento de Finanzas',90000,70000),(5,'Departamento de TI',120000,90000),(6,'Departamento de Logística',95000,72000),(7,'Departamento de Producción',110000,85000),(8,'Departamento de Calidad',75000,60000),(9,'Departamento de Investigación y Desarrollo',130000,100000),(10,'Departamento Legal',85000,65000);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nif` varchar(9) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `id_departamento` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'123456789','Juan','García',NULL,30000,1),(2,'987654321','María','López',NULL,1000,1),(3,'456789123','Pedro','Martínez',NULL,5000,1),(4,'789123456','Ana','Sánchez',NULL,2000,2),(5,'321654987','Carlos','Ruiz',NULL,3000,2),(6,'654987321','Laura','Díaz',NULL,1400,3),(7,'987321654','Miguel','Fernández',NULL,900,3),(8,'789654123','Isabel','Jiménez',NULL,6000,4),(9,'456123789','Diego','Gómez',NULL,1300,5),(10,'123789456','Elena','Hernández',NULL,4000,5),(11,'987456321','Sergio','Pérez',NULL,1500,5),(12,'654789123','Carmen','Torres',NULL,3000,6),(13,'789321456','Javier','Ramírez',NULL,1000,6),(14,'321789654','Raquel','López',NULL,900,6),(15,'456321789','Héctor','Morales',NULL,2000,7),(16,'321789123','Paula','Ortega',NULL,1000,7),(17,'654321987','Andrés','Soto',NULL,2000,8),(20,'321654789','Lucía','Vega',NULL,2000,9),(21,'456987321','Mario','Cruz',NULL,600,10),(22,'789456123','Sara','Ferrer',NULL,1000,10);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05 10:06:37
