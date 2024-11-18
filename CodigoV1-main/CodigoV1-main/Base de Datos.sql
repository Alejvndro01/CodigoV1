-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: dilan
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idCiudad` int NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(50) NOT NULL,
  `poblacionCiudad` int NOT NULL,
  `codigoPais` char(3) NOT NULL,
  `distrito` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`),
  KEY `Ciudadfk` (`codigoPais`),
  CONSTRAINT `Ciudadfk` FOREIGN KEY (`codigoPais`) REFERENCES `pais` (`codigoPais`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Andorra la Vella',21189,'AND','Parroquia de Andorra la Vella'),(2,'Buenos Aires',2982146,'ARG','Capital Federal'),(3,'Córdoba',1157507,'ARG','Córdoba'),(4,'Bahía Blanca',239810,'ARG','Buenos Aires'),(13,'Santiago de Chile',4703954,'CHL','Santiago'),(14,'Viña del Mar',312493,'CHL','Valparaíso'),(15,'Concepción',217664,'CHL','Biobío'),(16,'Shanghai',9696300,'CHN','Shanghai'),(17,'Ulan Bator',773700,'MNG','Ulaanbaatar'),(18,'Hualquii',18000,'CHL',NULL);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idioma` (
  `idIdioma` int NOT NULL AUTO_INCREMENT,
  `nombreIdioma` varchar(50) NOT NULL,
  `oficial` bit(1) NOT NULL,
  `codigoPais` char(3) NOT NULL,
  `porcentaje` float DEFAULT NULL,
  PRIMARY KEY (`idIdioma`),
  KEY `Idiomafk` (`codigoPais`),
  KEY `idx_nombreIdioma` (`nombreIdioma`),
  CONSTRAINT `Idiomafk` FOREIGN KEY (`codigoPais`) REFERENCES `pais` (`codigoPais`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Catalan',_binary '','AND',100),(2,'Español',_binary '\0','AND',NULL),(3,'Español',_binary '','ARG',90),(4,'Italiano',_binary '\0','ARG',10),(5,'German',_binary '','AUT',88),(6,'Serbo-Croatian',_binary '\0','AUT',12),(9,'Creole',_binary '\0','BHS',75),(10,'Inglés',_binary '','BLZ',100),(11,'Espalol',_binary '\0','BLZ',NULL),(14,'Español',_binary '','CHL',99),(15,'mapudungun',_binary '\0','CHL',1),(16,'Chino',_binary '','CHN',98),(17,'Zhuang',_binary '\0','CHN',2),(18,'Mongolian',_binary '','MNG',96),(19,'Kazakh',_binary '\0','MNG',4);
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `codigoPais` char(3) NOT NULL,
  `nombrePais` varchar(50) NOT NULL,
  `continentePais` varchar(50) NOT NULL,
  `poblacionPais` int NOT NULL,
  `tipoGobierno` bit(1) NOT NULL,
  `region` varchar(50) DEFAULT NULL,
  `superficie` float DEFAULT NULL,
  `anioIndependencia` int unsigned DEFAULT NULL,
  `expectativaVida` float DEFAULT NULL,
  `pnb` float DEFAULT NULL,
  `jefeEstado` varchar(100) DEFAULT NULL,
  `ciudadCapital` int DEFAULT NULL,
  `idiomaPais` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigoPais`),
  KEY `fk_ciudadCapital` (`ciudadCapital`),
  KEY `fk_idiomaPais` (`idiomaPais`),
  CONSTRAINT `fk_ciudadCapital` FOREIGN KEY (`ciudadCapital`) REFERENCES `ciudad` (`idCiudad`) ON DELETE SET NULL,
  CONSTRAINT `fk_idiomaPais` FOREIGN KEY (`idiomaPais`) REFERENCES `idioma` (`nombreIdioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('AND','Andorra','Europa',78000,_binary '','Europa',468,1278,84,3000000,'Xavier Espot Zamora',1,'Catalan'),('ARG','Argentina','America',37032000,_binary '','América del Sur',2780400,1816,76.5,450000000,'Alberto Fernández',2,'Español'),('ASD','Dilan','Africa',123,_binary '',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('AUT','Austria','Europa',8091800,_binary '','Europa',83858,1955,81.5,400000000,'Alexander Van der Bellen',NULL,'German'),('BHS','Bahamas','America',307000,_binary '\0','Caribe',13940,1973,74.2,13400000,'Philip Davis',NULL,'Inglés'),('BLZ','Belize','America',241000,_binary '\0','Caribe',22966,1981,71.8,19000000,'John Briceño',NULL,'Inglés'),('CHL','Chile','America',15211000,_binary '','América del Sur',756096,1818,80.5,352000000,'Gabriel Boric',13,'Español'),('CHN','China','Asia',1277558000,_binary '\0','Asia',9596960,1949,77.1,14600000000,'Xi Jinping',16,'Chino'),('MNG','Mongolia','Asia',2662000,_binary '\0','Asia',1564120,1911,70.8,13200000,'Ukhnaagiin Khürelsükh',17,'Mongolian');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dilan'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 17:17:20
