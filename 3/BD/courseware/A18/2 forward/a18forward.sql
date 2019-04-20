-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a18forward
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
-- Table structure for table `Departamento`
--

DROP TABLE IF EXISTS `Departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departamento` (
  `Numero_Cod` varchar(10) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Telefone` varchar(10) NOT NULL,
  PRIMARY KEY (`Numero_Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamento`
--

LOCK TABLES `Departamento` WRITE;
/*!40000 ALTER TABLE `Departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependente`
--

DROP TABLE IF EXISTS `Dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dependente` (
  `Sexo` varchar(1) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `Parentesco` varchar(45) DEFAULT NULL,
  `NomeDependente` varchar(200) NOT NULL,
  `Matric_Resp` varchar(45) NOT NULL,
  PRIMARY KEY (`Matric_Resp`,`NomeDependente`),
  CONSTRAINT `fk_Dependente_1` FOREIGN KEY (`Matric_Resp`) REFERENCES `Empregado` (`Matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependente`
--

LOCK TABLES `Dependente` WRITE;
/*!40000 ALTER TABLE `Dependente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empreg_work_Proj`
--

DROP TABLE IF EXISTS `Empreg_work_Proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empreg_work_Proj` (
  `Empregado_Matricula` varchar(10) NOT NULL,
  `Proj_Numero` int(11) NOT NULL,
  PRIMARY KEY (`Empregado_Matricula`,`Proj_Numero`),
  KEY `fk_Empregado_has_Proj_Proj1_idx` (`Proj_Numero`),
  KEY `fk_Empregado_has_Proj_Empregado1_idx` (`Empregado_Matricula`),
  CONSTRAINT `fk_Empregado_has_Proj_Empregado1` FOREIGN KEY (`Empregado_Matricula`) REFERENCES `Empregado` (`Matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empregado_has_Proj_Proj1` FOREIGN KEY (`Proj_Numero`) REFERENCES `Proj` (`Numero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empreg_work_Proj`
--

LOCK TABLES `Empreg_work_Proj` WRITE;
/*!40000 ALTER TABLE `Empreg_work_Proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empreg_work_Proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empregado`
--

DROP TABLE IF EXISTS `Empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empregado` (
  `Nome` varchar(200) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Salario` decimal(2,0) DEFAULT NULL,
  `Matricula` varchar(10) NOT NULL,
  `Rua` varchar(100) DEFAULT NULL,
  `Bairo` varchar(100) DEFAULT NULL,
  `CEP` varchar(9) DEFAULT NULL,
  `NumeroResid` varchar(10) DEFAULT NULL,
  `idDept` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  KEY `fk_Empregado_1_idx` (`idDept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empregado`
--

LOCK TABLES `Empregado` WRITE;
/*!40000 ALTER TABLE `Empregado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proj`
--

DROP TABLE IF EXISTS `Proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proj` (
  `Numero` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Localizacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proj`
--

LOCK TABLES `Proj` WRITE;
/*!40000 ALTER TABLE `Proj` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefones`
--

DROP TABLE IF EXISTS `Telefones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefones` (
  `Empregado_Matricula` varchar(10) NOT NULL,
  `Telefone` varchar(10) NOT NULL,
  PRIMARY KEY (`Telefone`,`Empregado_Matricula`),
  KEY `fk_Telefones_Empregado1_idx` (`Empregado_Matricula`),
  CONSTRAINT `fk_Telefones_Empregado1` FOREIGN KEY (`Empregado_Matricula`) REFERENCES `Empregado` (`Matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefones`
--

LOCK TABLES `Telefones` WRITE;
/*!40000 ALTER TABLE `Telefones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-20  0:39:23
