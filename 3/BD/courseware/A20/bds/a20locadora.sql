-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a20locadora
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
  CONSTRAINT `loc_gps_ibfk_1` FOREIGN KEY (`loc_cl_cod`) REFERENCES `clientes` (`cli_codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loc_gps`
--

LOCK TABLES `loc_gps` WRITE;
/*!40000 ALTER TABLE `loc_gps` DISABLE KEYS */;
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
  CONSTRAINT `locacoes_ibfk_1` FOREIGN KEY (`loc_fi_cod`) REFERENCES `filmes` (`fil_codigo`) ON DELETE CASCADE,
  CONSTRAINT `locacoes_ibfk_2` FOREIGN KEY (`loc_gp`) REFERENCES `loc_gps` (`loc_gp_codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacoes`
--

LOCK TABLES `locacoes` WRITE;
/*!40000 ALTER TABLE `locacoes` DISABLE KEYS */;
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
-- Dumping routines for database 'a20locadora'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_cl_dados_resumidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cl_dados_resumidos`(
)
BEGIN
SELECT * FROM vw_cli_dados_pessoais;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

-- Dump completed on 2019-04-24 23:45:35
