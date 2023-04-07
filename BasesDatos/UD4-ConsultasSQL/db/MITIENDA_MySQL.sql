CREATE DATABASE  IF NOT EXISTS `mitienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mitienda`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mitienda
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `NumSocio` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `DNI` char(9) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Puntos` int(11) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NumSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (201,'Mariano','Sánchez','97015629S','Calle Alcalde Francisco Sanz, 3','Madrid','2001-11-27',20,987,'631683547','msanchez@gmail.com'),(202,'David','Rivera','36608091V','Avenida Pablo Neruda 60','Bilbao','1997-03-14',23,895,'649106316','drivera@gmail.com'),(203,'Jesús','Vargas','12302086Q','C/ Carabelas','Barcelona','1991-04-24',29,1069,'600328619','jvargas@gmailcom'),(204,'Antonio','Ortiz','12457852B','Ronda de Toledo 5','Valencia','2000-01-03',20,921,'123456783',NULL),(205,'Oscar','Arenas','78283042R','Avenida Estrella Polar','Valencia','2000-08-19',20,948,'674384873','oarenas@gmail.com'),(206,'Daniela','Alvarez','07336695B','Ronda del Sur, 107','Madrid','1986-11-18',34,974,'602534705','dalvarez@gmail.com'),(207,'Juan','Martínez','86140151F','C/ Mendivil,7','Barcelona','1992-02-21',28,1000,'671772658','jmartinez@gmail.com'),(208,'Ruben','Abad','14104168X','c/ Doctor Morcillo 9','Madrid','1993-07-01',27,967,'626233881',NULL),(209,'Pablo','Ponce','02745594A','Doctor Esquerdo, 111','Madrid','2001-05-06',19,882,'601039281','pponce@gmail.com'),(210,'Adriana','Gil','12345678N','Plaza Republica Argentina','Barcelona','1996-01-20',24,982,'601186363','agil@gmail.com'),(211,'Carlota','Rubio','31091669A','Calle de la Estacion','Barcelona','2000-12-11',20,999,NULL,'crubio@gmail.com'),(212,'Pablo','Fernandez','55645599A','Av. del Plantio, 12','Toledo','1996-02-12',24,995,'659215523','pfernandez@gmail.com'),(213,'Silvia','Romero','21069130B','Calle Azorín','Toledo','1983-03-14',37,700,'669466584','sromero@gmail.com'),(214,'Ruben','Diaz','66565565C','Calle Ruben Dario','Madrid','1988-02-14',32,999,'625951689','rdiaz@gmail.com'),(215,'Jose','Valero','01153820B','Avda de America, 7','Madrid','2000-01-21',20,800,'655655655','jvalero@gmail.com'),(216,'Irene','Rodriguez','71064852D','Calle Colombia 1','Barcelona','1991-01-01',29,850,NULL,'irodriguez@gmail.com'),(217,'Silvia','Tortosa','01010101C','Gran Via, 17','Toledo','1988-02-14',32,870,'677677678','stortosa@gmail.com'),(218,'Natalia','Palacios','21054722R','Caracas, 15','Toledo','2000-02-01',20,999,'645512235','npalacios@gmail.com'),(219,'Juan','Pacheco','53925038F','Cava Baja, 33','Barcelona','1989-02-14',31,755,NULL,'jpacheco@gmail.com');/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_online`
--

DROP TABLE IF EXISTS `clientes_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_online` (
  `NUM_SOCIO` int(11) DEFAULT NULL,
  `DNI` text,
  `Nombre` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_online`
--

LOCK TABLES `clientes_online` WRITE;
/*!40000 ALTER TABLE `clientes_online` DISABLE KEYS */;
INSERT INTO `clientes_online` VALUES (2,'78665432R','ANTONIO CABALLERO'),(5,'40118731J','ROBERTO ALVAREZ'),(10,'20058301C','JOSE PERDICES'),(11,'18011799J','IGNACIO DIAZ'),(12,'89982332F','FRANCISCO AYUSO'),(13,'66547789D','GABRIELA DONATE');
/*!40000 ALTER TABLE `clientes_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `NumProducto` TINYINT AUTO_INCREMENT,
  `Producto` varchar(20) NOT NULL,
  `Cantidad_stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (NULL,'Boli',393),(NULL,'Carpeta',215),(NULL,'Cuaderno',100),(NULL,'Lapiz',450);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `CodVenta` int(11) NOT NULL AUTO_INCREMENT,
  `NumSocio` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Producto` varchar(20) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` double DEFAULT NULL,
  PRIMARY KEY (`CodVenta`),
  KEY `NumSocio` (`NumSocio`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`NumSocio`) REFERENCES `clientes` (`NumSocio`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,202,'2019-03-14 00:00:00','Cuaderno',5,3.75),(2,203,'2019-03-15 00:00:00','Lapiz',6,0.75),(3,204,'2020-01-05 00:00:00','Boli',4,1.05),(4,219,'2019-03-14 00:00:00','Carpeta',5,4.1),(5,205,'2020-01-05 00:00:00','Lapiz',3,0.75),(6,202,'2020-01-13 00:00:00','Lapiz',1,0.75),(7,201,'2019-04-14 00:00:00','Cuaderno',2,3.75),(8,208,'2020-01-14 00:00:00','Cuaderno',53,3.75),(9,209,'2019-04-14 00:00:00','Boli',16,1.05),(10,211,'2020-01-01 00:00:00','Lapiz',2,0.75),(11,211,'2020-01-02 00:00:00','Cuaderno',10,3.75),(12,208,'2020-01-03 00:00:00','Cuaderno',3,3.75),(13,219,'2019-04-14 00:00:00','Carpeta',13,4.1),(14,207,'2020-01-14 00:00:00','Lapiz',3,0.75),(15,203,'2020-01-01 00:00:00','Lapiz',2,0.75),(16,202,'2020-04-29 00:00:00','Lapiz',3,0.75),(17,201,'2020-04-29 00:00:00','Lapiz',3,0.75),(19,201,'2020-04-29 00:00:00','Lapiz',3,0.75),(20,203,'2020-04-29 11:45:03','Boli',2,1.05),(21,203,'2020-05-20 11:45:03','Boli',7,1.05);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-07 20:39:31
