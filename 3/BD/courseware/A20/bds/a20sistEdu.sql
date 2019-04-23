-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a20sistEdu
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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `aluno_cod` int(11) DEFAULT NULL,
  `aluno_nome` varchar(100) DEFAULT NULL,
  `aluno_endereco` varchar(200) DEFAULT NULL,
  `aluno_cidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Joao','Rua da Li','São Paulo'),(10,'Maria','Avenida Paulista','São Paulo'),(11,'Bianca','Eixo Monumental','Brasília');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplinas` (
  `dis_cod` int(11) NOT NULL,
  `dis_nome` varchar(100) DEFAULT NULL,
  `dis_ch` int(11) DEFAULT NULL,
  PRIMARY KEY (`dis_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinas`
--

LOCK TABLES `disciplinas` WRITE;
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` VALUES (1,'Matemática',70),(5,'Português',50),(6,'Biologia',60),(7,'História',90);
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professores`
--

DROP TABLE IF EXISTS `professores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professores` (
  `prof_cod` int(11) NOT NULL,
  `prof_nome` varchar(100) DEFAULT NULL,
  `prof_endereco` varchar(200) DEFAULT NULL,
  `prof_cidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`prof_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professores`
--

LOCK TABLES `professores` WRITE;
/*!40000 ALTER TABLE `professores` DISABLE KEYS */;
INSERT INTO `professores` VALUES (1,'Fátima','Rua da Praia','Rio de Janeiro'),(5,'Roberto','Av. Sen. Salg Filho','Natal'),(6,'Sidarta','Av. Prudente de Morais','Recife'),(7,'Pascoale','Av. das Nações','São Paulo'),(11,'Giovana','Av. Antônio Conselheiro','São Paulo');
/*!40000 ALTER TABLE `professores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profs_discs`
--

DROP TABLE IF EXISTS `profs_discs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profs_discs` (
  `prof_disc_cod` int(11) NOT NULL AUTO_INCREMENT,
  `dis_cod_fk` int(11) DEFAULT NULL,
  `prof_cod_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`prof_disc_cod`),
  KEY `dis_cod_fk` (`dis_cod_fk`),
  KEY `prof_cod_fk` (`prof_cod_fk`),
  CONSTRAINT `profs_discs_ibfk_1` FOREIGN KEY (`dis_cod_fk`) REFERENCES `disciplinas` (`dis_cod`),
  CONSTRAINT `profs_discs_ibfk_2` FOREIGN KEY (`prof_cod_fk`) REFERENCES `professores` (`prof_cod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profs_discs`
--

LOCK TABLES `profs_discs` WRITE;
/*!40000 ALTER TABLE `profs_discs` DISABLE KEYS */;
INSERT INTO `profs_discs` VALUES (1,6,1),(2,7,5),(3,1,1),(4,6,7);
/*!40000 ALTER TABLE `profs_discs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_alunos_por_cidade`
--

DROP TABLE IF EXISTS `vw_alunos_por_cidade`;
/*!50001 DROP VIEW IF EXISTS `vw_alunos_por_cidade`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_alunos_por_cidade` AS SELECT 
 1 AS `aluno_cidade`,
 1 AS `COUNT(aluno_cidade)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_discs_profs`
--

DROP TABLE IF EXISTS `vw_discs_profs`;
/*!50001 DROP VIEW IF EXISTS `vw_discs_profs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_discs_profs` AS SELECT 
 1 AS `dis_nome`,
 1 AS `prof_nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_profs_NDiscs`
--

DROP TABLE IF EXISTS `vw_profs_NDiscs`;
/*!50001 DROP VIEW IF EXISTS `vw_profs_NDiscs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_profs_NDiscs` AS SELECT 
 1 AS `prof_nome`,
 1 AS `COUNT(prof_cod_fk)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_profs_discs`
--

DROP TABLE IF EXISTS `vw_profs_discs`;
/*!50001 DROP VIEW IF EXISTS `vw_profs_discs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_profs_discs` AS SELECT 
 1 AS `prof_cod`,
 1 AS `dis_cod`,
 1 AS `dis_nome`,
 1 AS `dis_ch`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_profs_natal`
--

DROP TABLE IF EXISTS `vw_profs_natal`;
/*!50001 DROP VIEW IF EXISTS `vw_profs_natal`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_profs_natal` AS SELECT 
 1 AS `prof_nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'a20sistEdu'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_consult_cid_prof` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_consult_cid_prof`(codProf INT) RETURNS varchar(100) CHARSET latin1
BEGIN
DECLARE cidade VARCHAR(100);
SELECT
prof_cidade
INTO cidade
FROM professores
WHERE prof_cod = codProf; 
RETURN cidade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_disc_maior_ch_prof` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_disc_maior_ch_prof`(codProf INT) RETURNS varchar(100) CHARSET latin1
BEGIN
DECLARE discMaiorCH VARCHAR(100);
SELECT
dis_nome
INTO discMaiorCH
FROM vw_profs_discs
WHERE prof_cod = codProf
AND dis_ch = (
SELECT MAX(dis_ch)
FROM vw_profs_discs
WHERE prof_cod = codProf
);
RETURN discMaiorCH;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_pessoas_cidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_pessoas_cidade`(city VARCHAR(100)) RETURNS int(11)
BEGIN
DECLARE cont_alu_cid INT;
DECLARE cont_prof_cid INT;
DECLARE result INT;
SELECT COUNT(aluno_cidade)
INTO cont_alu_cid
FROM alunos
WHERE aluno_cidade = city;
SELECT COUNT(prof_cidade)
INTO cont_prof_cid
FROM professores
WHERE prof_cidade = city;
SET result = cont_alu_cid + cont_prof_cid;
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_profs_cidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_profs_cidade`(city VARCHAR(100)) RETURNS int(11)
BEGIN
DECLARE result INT;
SELECT COUNT(prof_cidade)
INTO result
FROM professores
WHERE prof_cidade = city;
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_prof_ch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_prof_ch`(codProf INT) RETURNS int(11)
BEGIN
DECLARE result INT;
SELECT
SUM(dis_ch)
INTO result
FROM disciplinas AS d
INNER JOIN
profs_discs AS pd
ON d.dis_cod = pd.dis_cod_fk
INNER JOIN
professores AS p
ON pd.prof_cod_fk = p.prof_cod
WHERE p.prof_cod = codProf; 
RETURN result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_alunos_por_cidade`
--

/*!50001 DROP VIEW IF EXISTS `vw_alunos_por_cidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alunos_por_cidade` AS select `alunos`.`aluno_cidade` AS `aluno_cidade`,count(`alunos`.`aluno_cidade`) AS `COUNT(aluno_cidade)` from `alunos` group by `alunos`.`aluno_cidade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_discs_profs`
--

/*!50001 DROP VIEW IF EXISTS `vw_discs_profs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_discs_profs` AS select `disciplinas`.`dis_nome` AS `dis_nome`,`professores`.`prof_nome` AS `prof_nome` from ((`disciplinas` join `profs_discs`) join `professores`) where ((`profs_discs`.`prof_cod_fk` = `professores`.`prof_cod`) and (`profs_discs`.`dis_cod_fk` = `disciplinas`.`dis_cod`)) order by `disciplinas`.`dis_nome`,`professores`.`prof_nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_profs_NDiscs`
--

/*!50001 DROP VIEW IF EXISTS `vw_profs_NDiscs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_profs_NDiscs` AS select `professores`.`prof_nome` AS `prof_nome`,count(`profs_discs`.`prof_cod_fk`) AS `COUNT(prof_cod_fk)` from (`professores` join `profs_discs`) where (`professores`.`prof_cod` = `profs_discs`.`prof_cod_fk`) group by `professores`.`prof_nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_profs_discs`
--

/*!50001 DROP VIEW IF EXISTS `vw_profs_discs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_profs_discs` AS select `p`.`prof_cod` AS `prof_cod`,`p`.`prof_nome` AS `dis_cod`,`d`.`dis_nome` AS `dis_nome`,`d`.`dis_ch` AS `dis_ch` from ((`disciplinas` `d` join `profs_discs` `pd` on((`d`.`dis_cod` = `pd`.`dis_cod_fk`))) join `professores` `p` on((`pd`.`prof_cod_fk` = `p`.`prof_cod`))) order by `p`.`prof_cod`,`d`.`dis_nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_profs_natal`
--

/*!50001 DROP VIEW IF EXISTS `vw_profs_natal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_profs_natal` AS select `professores`.`prof_nome` AS `prof_nome` from `professores` where (`professores`.`prof_cidade` = 'Natal') */;
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

-- Dump completed on 2019-04-23  0:30:36
