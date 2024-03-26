-- MySQL dump 10.13  Distrib 5.7.15, for Win32 (AMD64)
--
-- Host: localhost    Database: ventas
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- CUSTOM
DROP DATABASE IF EXISTS `ventas`;
CREATE DATABASE `ventas`;
USE `ventas`;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(50) NOT NULL,
  `id_registro_afectado` int(10) unsigned DEFAULT NULL,
  `accion` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` varchar(100) DEFAULT NULL,
  `detalles` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,'cliente',11,'INSERT','2024-01-29 18:15:09','root@localhost','Nuevo cliente insertado'),(2,'comercial',8,'actualizar','2024-01-29 18:20:44','root@localhost','Comercial actualizado'),(3,'cliente',12,'INSERT','2024-01-29 18:21:52','root@localhost','Nuevo cliente insertado'),(4,'comercial',9,'BORRAR','2024-01-29 18:34:15','root@localhost','Comercial eliminado - Nombre: Ana, Apellido1: Garcia'),(5,'comercial',10,'BORRAR','2024-01-29 18:35:32','root@localhost','Comercial eliminado - Nombre: Luis, Apellido1: Looez'),(6,'comercial',11,'BORRAR','2024-01-29 18:38:36','root@localhost','Comercial eliminado - Nombre: Luis, Apellido1: Looez'),(7,'comercial',11,'BORRAR','2024-01-29 18:38:36','root@localhost','Comercial eliminado - Nombre: Luis, Apellido1: Looez'),(8,'comercial',1,'actualizar','2024-02-06 19:55:00','root@localhost','Comercial actualizado'),(9,'comercial',2,'actualizar','2024-02-06 19:55:29','root@localhost','Comercial actualizado'),(11,'pedido',1,'DELETE Pre','2024-02-12 18:15:15','root@localhost','No se puede eliminar este cliente porque tiene pedidos asociados.'),(12,'pedido',5,'DELETE Pre','2024-02-12 18:15:15','root@localhost','No se puede eliminar este cliente porque tiene pedidos asociados.'),(14,'comercial',8,'actualizar','2024-02-12 18:26:18','root@localhost','Comercial actualizado'),(15,'comercial',8,'cambio de ','2024-02-12 18:26:18','root@localhost',NULL),(16,'comercial',8,'actualizar','2024-02-12 18:27:41','root@localhost','Comercial actualizado'),(17,'comercial',1,'cambio de ','2024-03-05 16:31:40','root@localhost',NULL),(18,'comercial',2,'cambio de ','2024-03-05 20:01:14','root@localhost',NULL),(19,'comercial',1,'cambio de ','2024-03-05 20:02:26','root@localhost',NULL),(20,'cliente',9999,'INSERT','2024-03-19 19:45:37','root@localhost','Nuevo cliente insertado'),(21,'cliente',8888,'INSERT','2024-03-19 19:47:48','root@localhost','Nuevo cliente insertado');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `categoría` int(10) unsigned DEFAULT NULL,
  `total_compras` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Aarón','NuevoApellido','Gómez','Almería',100,3030.73),(2,'Adela','Salas','Díaz','Granada',500,0),(3,'Adolfo','Rubio','Flores','Sevilla',500,75.29),(4,'Adrián','Suárez',NULL,'Jaén',100,1983.43),(5,'Marcos','Loyola','Méndez','Almería',1000,NULL),(6,'María','Santana','Moreno','Cádiz',100,0),(7,'Pili','Ruiz',NULL,'Sevilla',300,0),(8,'Pepe','Ruiz','Santana','Huelva',1000,0),(10,'Daniel','Santana','Loyola','Sevilla',125,0),(11,'pepe','gomez','lopez',NULL,NULL,0),(12,'ana','pomez','jopez',NULL,NULL,0),(8888,'eva','gozanlex',NULL,NULL,400,0),(9999,'jose','Prieto',NULL,NULL,500,0);
UNLOCK TABLES;

--
-- Table structure for table `comercial`
--

DROP TABLE IF EXISTS `comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comercial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) DEFAULT NULL,
  `comisión` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comercial`
--

LOCK TABLES `comercial` WRITE;
/*!40000 ALTER TABLE `comercial` DISABLE KEYS */;
INSERT INTO `comercial` VALUES (1,'Daniel','Sáez','Vega',0.29),(2,'Juan','Gómez','López',0.09),(3,'Diego','Flores','Salas',0.16),(4,'Marta','Herrera','Gil',0.14),(5,'Antonio','Carretero','Ortega',0.12),(6,'Manuel','Domínguez','Hernández',0.13),(7,'Antonio','Vega','Hernández',0.11),(8,'Alfredo','Ruiz','KKKKK',0.9);
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int(10) unsigned NOT NULL,
  `id_comercial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_comercial` (`id_comercial`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_comercial`) REFERENCES `comercial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (2,270.65,'2016-09-10',1,5),(3,65.26,'2017-10-05',2,1),(4,110.5,'2016-08-17',8,3),(6,2400.6,'2016-07-27',7,1),(7,5760,'2015-09-10',2,1),(8,1983.43,'2017-10-10',4,6),(9,2480.4,'2016-10-10',8,3),(10,250.45,'2015-06-27',8,2),(11,75.29,'2016-08-17',3,7),(12,3045.6,'2017-04-25',2,1),(13,545.75,'2019-01-25',6,1),(14,145.82,'2017-02-02',6,1),(15,370.85,'2019-03-11',1,5),(16,2389.23,'2019-03-11',1,5),(17,500,'2024-03-05',2,1),(19,2000,'2024-03-05',4,1),(20,2000,'2024-03-05',4,1);
UNLOCK TABLES;
