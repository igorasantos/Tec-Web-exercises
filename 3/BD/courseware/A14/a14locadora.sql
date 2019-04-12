-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a14locadora
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
  `cli_codigo` int(11) NOT NULL,
  `cli_nome` varchar(50) DEFAULT NULL,
  `cli_cpf` char(12) DEFAULT NULL,
  `cli_sexo` char(1) DEFAULT NULL,
  `cli_profissao` varchar(20) DEFAULT NULL,
  `cli_salario` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`cli_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'José da Silva','123456789-10','M','Administrador',3500.00),(2,'Maria da Silva','012345678-99','F','Arquiteta',900.00),(3,'Francisco da Silva','109876543-21','M','Dev Web',9000.00),(4,'Francisca da Silva',NULL,'F','Programadora',4500.00),(5,'Rodolfo','123456789-01','M','Estudante',400.00),(6,'Ana','987654321-12','F','Estudante',800.00);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filmes` (
  `fil_codigo` int(11) NOT NULL,
  `fil_titulo` varchar(40) DEFAULT NULL,
  `fil_genero` varchar(15) DEFAULT NULL,
  `fil_duracao` time DEFAULT NULL,
  `fil_ano` int(11) DEFAULT NULL,
  `fil_situacao` varchar(12) DEFAULT NULL,
  `fil_preco` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`fil_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmes`
--

LOCK TABLES `filmes` WRITE;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
INSERT INTO `filmes` VALUES (1,'E o vento Levou','romance','00:03:10',1939,'alugado',5.00),(2,'O silêncio dos inocentes','policial','00:02:00',1991,'disponível',2.50),(3,'Procurando Nemo','animação','00:01:40',2003,'alugado',2.50),(4,'Cidade de Deus','ação','00:02:10',2002,'disponível',3.00),(5,'E o vento Levou','romance','00:03:10',1939,'disponível',5.00),(6,'Minha Mãe é uma Peça','comédia','01:25:00',2013,'alugado',6.00),(7,'O Código Da Vinci','suspense','02:54:00',2006,'disponível',2.90),(8,'Gravidade','suspense','01:31:00',2013,'alugado',3.60),(9,'O Sexto Sentido','suspense','02:10:00',1999,'disponível',1.90),(10,'O Guarda-Costas','suspense','02:10:00',1992,'alugado',0.90),(11,'Aquaman','aventura','02:22:00',2018,'alugado',6.50);
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loc_gps`
--

DROP TABLE IF EXISTS `loc_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loc_gps` (
  `loc_gp_codigo` int(11) NOT NULL,
  `loc_cl_cod` int(11) NOT NULL,
  `loc_data` date DEFAULT NULL,
  PRIMARY KEY (`loc_gp_codigo`),
  KEY `loc_cl_cod` (`loc_cl_cod`),
  CONSTRAINT `loc_gps_ibfk_1` FOREIGN KEY (`loc_cl_cod`) REFERENCES `clientes` (`cli_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_gps`
--

LOCK TABLES `loc_gps` WRITE;
/*!40000 ALTER TABLE `loc_gps` DISABLE KEYS */;
INSERT INTO `loc_gps` VALUES (1,1,'2019-01-01'),(2,1,'2019-01-15'),(3,3,'2019-02-01'),(4,4,'2019-03-01'),(5,3,'2019-03-15'),(6,5,'2019-04-15'),(7,1,'2019-05-01'),(8,6,'2019-05-15'),(9,4,'2019-06-01'),(10,3,'2019-06-15'),(11,6,'2019-07-01'),(12,6,'2019-08-15');
/*!40000 ALTER TABLE `loc_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacoes`
--

DROP TABLE IF EXISTS `locacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locacoes` (
  `loc_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `loc_gp` int(11) DEFAULT NULL,
  `loc_fi_cod` int(11) NOT NULL,
  PRIMARY KEY (`loc_codigo`),
  KEY `loc_fi_cod` (`loc_fi_cod`),
  KEY `loc_gp` (`loc_gp`),
  CONSTRAINT `locacoes_ibfk_2` FOREIGN KEY (`loc_fi_cod`) REFERENCES `filmes` (`fil_codigo`),
  CONSTRAINT `locacoes_ibfk_3` FOREIGN KEY (`loc_gp`) REFERENCES `loc_gps` (`loc_gp_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacoes`
--

LOCK TABLES `locacoes` WRITE;
/*!40000 ALTER TABLE `locacoes` DISABLE KEYS */;
INSERT INTO `locacoes` VALUES (1,1,3),(2,2,5),(3,3,2),(4,4,2),(5,4,4),(6,5,6),(7,6,6),(8,6,3),(9,7,7),(10,8,9),(11,9,10),(12,10,8),(13,11,9),(14,12,8),(15,12,3),(16,12,11);
/*!40000 ALTER TABLE `locacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_cli_dados_pessoais`
--

DROP TABLE IF EXISTS `vw_cli_dados_pessoais`;
/*!50001 DROP VIEW IF EXISTS `vw_cli_dados_pessoais`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_cli_dados_pessoais` AS SELECT 
 1 AS `Nome`,
 1 AS `CPF`,
 1 AS `Sexo`,
 1 AS `Profissão`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_cli_dados_pessoais`
--

/*!50001 DROP VIEW IF EXISTS `vw_cli_dados_pessoais`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cli_dados_pessoais` AS select `clientes`.`cli_nome` AS `Nome`,`clientes`.`cli_cpf` AS `CPF`,`clientes`.`cli_sexo` AS `Sexo`,`clientes`.`cli_profissao` AS `Profissão` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12  9:26:28
