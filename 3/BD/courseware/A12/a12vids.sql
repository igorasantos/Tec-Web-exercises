-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a12vids
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `aut_codigo` int(11) NOT NULL,
  `aut_nome` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`aut_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Andrew S. Tanenbaun'),(2,'Kurose'),(3,'Ross'),(4,'Date'),(5,'Silberschatz'),(6,'Korth'),(7,'Sudarshan');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores_obras`
--

DROP TABLE IF EXISTS `autores_obras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores_obras` (
  `aut_obr_id` int(11) NOT NULL,
  `aut_cod` int(11) NOT NULL,
  `obr_cod` int(11) NOT NULL,
  PRIMARY KEY (`aut_obr_id`),
  KEY `aut_cod` (`aut_cod`),
  KEY `obr_cod` (`obr_cod`),
  CONSTRAINT `autores_obras_ibfk_1` FOREIGN KEY (`aut_cod`) REFERENCES `autores` (`aut_codigo`),
  CONSTRAINT `autores_obras_ibfk_2` FOREIGN KEY (`obr_cod`) REFERENCES `obras` (`obr_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores_obras`
--

LOCK TABLES `autores_obras` WRITE;
/*!40000 ALTER TABLE `autores_obras` DISABLE KEYS */;
INSERT INTO `autores_obras` VALUES (1,1,1),(2,2,2),(3,3,2),(4,4,3),(5,5,4),(6,6,4),(7,7,4);
/*!40000 ALTER TABLE `autores_obras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carros`
--

DROP TABLE IF EXISTS `carros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carros` (
  `car_codigo` int(11) DEFAULT NULL,
  `car_cor` varchar(10) DEFAULT NULL,
  `car_marca` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carros`
--

LOCK TABLES `carros` WRITE;
/*!40000 ALTER TABLE `carros` DISABLE KEYS */;
/*!40000 ALTER TABLE `carros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obras`
--

DROP TABLE IF EXISTS `obras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obras` (
  `obr_codigo` int(11) NOT NULL,
  `obr_titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`obr_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obras`
--

LOCK TABLES `obras` WRITE;
/*!40000 ALTER TABLE `obras` DISABLE KEYS */;
INSERT INTO `obras` VALUES (1,'Redes de Computadores'),(2,'Redes de Computadores e a Internet'),(3,'Introdução a Sistemas de BD'),(4,'BD');
/*!40000 ALTER TABLE `obras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `pes_cod` int(11) DEFAULT NULL,
  `pes_nome` varchar(50) DEFAULT NULL,
  `pes_cidade` varchar(30) DEFAULT NULL,
  `pes_filhos` tinyint(4) DEFAULT NULL,
  `pes_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'João','Parnamirim',2,'1990-01-29'),(2,'Maria','Ceará Mirim',1,NULL),(3,'Carlos','Natal',0,'1982-03-12'),(4,'Camila','Natal',3,NULL),(5,'Carla','Natal',0,'2001-05-02'),(6,'Daniel','Recife',1,NULL),(7,'Danilo','Recife',2,'1994-07-21'),(8,'Eduardo','João Pessoa',3,NULL),(9,'Ernesto','João Pessoa',2,'1997-09-16'),(10,'Fabíola','João Pessoa',1,NULL);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12  4:16:14
