-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a13cineOnline
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
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `cinema_codigo` int(11) NOT NULL,
  `cinema_nome` varchar(40) NOT NULL,
  `cinema_sala` varchar(2) NOT NULL,
  `cinema_capacidade` int(11) NOT NULL,
  `cinema_cidade` varchar(50) NOT NULL,
  PRIMARY KEY (`cinema_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Cinemark','A',50,'Natal'),(2,'Cinemark','B',60,'Natal'),(3,'Cinemark','C',70,'Natal'),(4,'Cinemark','D',80,'Natal'),(5,'UCI','A',90,'Recife'),(6,'UCI','B',100,'Recife'),(7,'UCI','C',110,'Recife'),(8,'UCI','D',120,'Recife');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `cli_cpf` varchar(14) NOT NULL,
  `cli_nome` varchar(50) NOT NULL,
  `cli_sexo` char(1) DEFAULT NULL,
  `cli_dataNascimento` date NOT NULL,
  PRIMARY KEY (`cli_cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('001.001.001-01','Rodrigo','M','1995-05-09'),('002.002.002-02','Marina','F','2000-07-09'),('003.003.003-03','Geórgia','F','2005-08-04'),('004.004.004-04','Luiza','F','1999-03-16'),('005.005.005-05','João','M','1995-09-23');
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
  `cli_cpf` varchar(14) NOT NULL,
  `ses_cod` int(11) NOT NULL,
  `comp_qtInt` int(11) NOT NULL,
  `comp_qtMeia` int(11) NOT NULL,
  `pgt_cod` int(11) NOT NULL,
  PRIMARY KEY (`comp_codigo`),
  KEY `cli_cpf` (`cli_cpf`),
  KEY `ses_cod` (`ses_cod`),
  KEY `pgt_cod` (`pgt_cod`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cli_cpf`) REFERENCES `clientes` (`cli_cpf`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`ses_cod`) REFERENCES `sessao` (`ses_codigo`),
  CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`pgt_cod`) REFERENCES `pgto` (`pgt_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1001,'003.003.003-03',203,1,0,1),(1002,'001.001.001-01',202,0,1,2),(1003,'005.005.005-05',204,1,0,3),(1004,'002.002.002-02',202,0,1,1);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filmes` (
  `fil_codigo` int(11) NOT NULL,
  `fil_titulo` varchar(50) NOT NULL,
  `fil_genero` varchar(30) NOT NULL,
  `fil_censura` char(8) NOT NULL DEFAULT 'Livre',
  PRIMARY KEY (`fil_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmes`
--

LOCK TABLES `filmes` WRITE;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
INSERT INTO `filmes` VALUES (101,'Procurando Nemo','Animação','Livre'),(102,'O Silêncio dos Inocentes','Policial','14 anos'),(103,'Cidade de Deus','Ação','16 anos'),(104,'E o Vento Levou','Romance','Livre'),(105,'Shrek 3','Animação','Livre'),(106,'Toy Story 3','Animação','Livre');
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgto`
--

DROP TABLE IF EXISTS `pgto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pgto` (
  `pgt_codigo` int(11) NOT NULL,
  `pgt_nome` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pgt_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgto`
--

LOCK TABLES `pgto` WRITE;
/*!40000 ALTER TABLE `pgto` DISABLE KEYS */;
INSERT INTO `pgto` VALUES (1,'Dinheiro'),(2,'Crédito'),(3,'Débito');
/*!40000 ALTER TABLE `pgto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessao`
--

DROP TABLE IF EXISTS `sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao` (
  `ses_codigo` int(11) NOT NULL,
  `ses_codfilme` int(11) NOT NULL,
  `ses_codcinema` int(11) NOT NULL,
  `ses_datahora` datetime NOT NULL,
  `ses_preco` decimal(4,2) NOT NULL,
  PRIMARY KEY (`ses_codigo`),
  KEY `ses_codfilme` (`ses_codfilme`),
  KEY `ses_codcinema` (`ses_codcinema`),
  CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`ses_codfilme`) REFERENCES `filmes` (`fil_codigo`),
  CONSTRAINT `sessao_ibfk_2` FOREIGN KEY (`ses_codcinema`) REFERENCES `cinema` (`cinema_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessao`
--

LOCK TABLES `sessao` WRITE;
/*!40000 ALTER TABLE `sessao` DISABLE KEYS */;
INSERT INTO `sessao` VALUES (201,102,3,'2011-01-10 14:00:00',20.70),(202,101,2,'2011-02-11 15:00:00',30.50),(203,103,5,'2010-03-12 16:30:00',10.40),(204,101,8,'2012-04-13 17:00:00',40.52),(205,103,4,'2012-05-14 18:00:00',16.82),(206,101,6,'2013-06-15 19:00:00',30.12);
/*!40000 ALTER TABLE `sessao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12  8:53:13
