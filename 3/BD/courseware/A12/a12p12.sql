-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a12p12
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cli_cpf` varchar(14) NOT NULL,
  `cli_nome` varchar(50) NOT NULL,
  `cli_profissao` varchar(50) DEFAULT NULL,
  `cli_saldoPontos` int(11) NOT NULL DEFAULT '0',
  `cli_email` varchar(100) NOT NULL,
  PRIMARY KEY (`cli_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('001.001.001-01','Pedro','Bancário',0,''),('002.002.002-02','Joana','Empresária',0,''),('003.003.003-03','Fátima','Jornalista',0,'');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `comp_codigo` int(11) NOT NULL,
  `cliente_cpf` varchar(14) NOT NULL,
  `comp_data` date NOT NULL,
  `comp_valor` decimal(5,2) DEFAULT NULL,
  `comp_ptsGanhos` int(11) NOT NULL,
  PRIMARY KEY (`comp_codigo`),
  KEY `cliente_cpf` (`cliente_cpf`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cliente_cpf`) REFERENCES `clientes` (`cli_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'001.001.001-01','2013-04-02',30.00,3),(2,'002.002.002-02','2014-01-03',40.00,4),(3,'001.001.001-01','2013-05-04',50.00,5),(4,'003.003.003-03','2016-05-08',60.00,6);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premios`
--

DROP TABLE IF EXISTS `premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premios` (
  `prem_codigo` int(11) NOT NULL,
  `prem_descricao` varchar(100) NOT NULL,
  `prem_valorPontos` int(11) NOT NULL,
  `prem_qtEstoque` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`prem_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premios`
--

LOCK TABLES `premios` WRITE;
/*!40000 ALTER TABLE `premios` DISABLE KEYS */;
INSERT INTO `premios` VALUES (101,'Relógio de plástico',4,40),(102,'Almofada',3,30),(103,'Calendário de geladeira',2,20);
/*!40000 ALTER TABLE `premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trocas`
--

DROP TABLE IF EXISTS `trocas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trocas` (
  `troca_codigo` int(11) NOT NULL,
  `client_cpf` varchar(14) NOT NULL,
  `prem_cod` int(11) NOT NULL,
  `troca_qtd` int(11) NOT NULL,
  `troca_data` date NOT NULL,
  PRIMARY KEY (`troca_codigo`),
  KEY `client_cpf` (`client_cpf`),
  KEY `prem_cod` (`prem_cod`),
  CONSTRAINT `trocas_ibfk_1` FOREIGN KEY (`client_cpf`) REFERENCES `clientes` (`cli_cpf`),
  CONSTRAINT `trocas_ibfk_2` FOREIGN KEY (`prem_cod`) REFERENCES `premios` (`prem_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trocas`
--

LOCK TABLES `trocas` WRITE;
/*!40000 ALTER TABLE `trocas` DISABLE KEYS */;
INSERT INTO `trocas` VALUES (201,'003.003.003-03',103,1,'2016-07-05'),(202,'001.001.001-01',102,1,'2014-03-08'),(203,'003.003.003-03',103,1,'2017-08-03'),(204,'001.001.001-01',103,1,'2015-04-07'),(205,'001.001.001-01',103,1,'2016-09-04');
/*!40000 ALTER TABLE `trocas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12  4:16:00
