-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: a20folhaPagto
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
-- Table structure for table `descontos`
--

DROP TABLE IF EXISTS `descontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descontos` (
  `desc_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `desc_codempregado` int(11) NOT NULL,
  `desc_inss` decimal(10,2) DEFAULT NULL,
  `desc_ir` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`desc_codigo`),
  KEY `desc_codempregado` (`desc_codempregado`),
  CONSTRAINT `descontos_ibfk_1` FOREIGN KEY (`desc_codempregado`) REFERENCES `empregados` (`empreg_codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descontos`
--

LOCK TABLES `descontos` WRITE;
/*!40000 ALTER TABLE `descontos` DISABLE KEYS */;
INSERT INTO `descontos` VALUES (1,1,550.00,365.12),(3,3,220.00,0.00),(10,4,440.00,179.20),(11,20,49.50,0.00);
/*!40000 ALTER TABLE `descontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregados`
--

DROP TABLE IF EXISTS `empregados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empregados` (
  `empreg_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `empreg_nome` varchar(50) DEFAULT NULL,
  `empreg_cpf` char(7) NOT NULL,
  `empreg_sexo` char(1) DEFAULT NULL,
  `empreg_dataNascimento` date DEFAULT NULL,
  `empreg_cidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`empreg_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregados`
--

LOCK TABLES `empregados` WRITE;
/*!40000 ALTER TABLE `empregados` DISABLE KEYS */;
INSERT INTO `empregados` VALUES (1,'Roberta das Flores','1111111',NULL,NULL,'Fortaleza'),(3,'Sr Coelho','3333333','M','1848-01-13','Natal'),(4,'Dama de Copas','4444444',NULL,NULL,'Recife'),(20,'Malévola','5555555','F','1349-02-17','Moors');
/*!40000 ALTER TABLE `empregados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamentos` (
  `pag_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `pag_codempregado` int(11) DEFAULT NULL,
  `pag_salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`pag_codigo`),
  KEY `pag_codempregado` (`pag_codempregado`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`pag_codempregado`) REFERENCES `empregados` (`empreg_codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (1,1,5000.00),(3,3,2000.00),(10,4,4000.00),(11,20,450.00);
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_basic_funcionario_id`
--

DROP TABLE IF EXISTS `vw_basic_funcionario_id`;
/*!50001 DROP VIEW IF EXISTS `vw_basic_funcionario_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_basic_funcionario_id` AS SELECT 
 1 AS `empreg_nome`,
 1 AS `empreg_cpf`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_calc_salario`
--

DROP TABLE IF EXISTS `vw_calc_salario`;
/*!50001 DROP VIEW IF EXISTS `vw_calc_salario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_calc_salario` AS SELECT 
 1 AS `empreg_nome`,
 1 AS `salario_bruto`,
 1 AS `INSS`,
 1 AS `IR`,
 1 AS `salario_liquido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_calc_salario_2`
--

DROP TABLE IF EXISTS `vw_calc_salario_2`;
/*!50001 DROP VIEW IF EXISTS `vw_calc_salario_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_calc_salario_2` AS SELECT 
 1 AS `empreg_codigo`,
 1 AS `empreg_nome`,
 1 AS `salario_bruto`,
 1 AS `INSS`,
 1 AS `IR`,
 1 AS `salario_liquido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_lanc_folha`
--

DROP TABLE IF EXISTS `vw_lanc_folha`;
/*!50001 DROP VIEW IF EXISTS `vw_lanc_folha`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_lanc_folha` AS SELECT 
 1 AS `empregado`,
 1 AS `cpf`,
 1 AS `p_emp_matr`,
 1 AS `valor_sal_bruto`,
 1 AS `d_emp_matr`,
 1 AS `valor_inss`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'a20folhaPagto'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_consulta_qt_empreg_cidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consulta_qt_empreg_cidade`(
IN nomeCidade varchar(50)
)
BEGIN
SELECT COUNT(empreg_nome)
FROM empregados
WHERE empreg_cidade = nomeCidade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consulta_remunera_empreg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consulta_remunera_empreg`(
IN codEmpreg int
)
BEGIN
SELECT
empreg_nome,
salario_bruto,
salario_liquido
FROM vw_calc_salario_2
WHERE codEmpreg = empreg_codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_exclui_empregado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exclui_empregado`(
IN emp_cpf CHAR(7)
)
BEGIN
IF (emp_cpf != '') THEN
DELETE FROM empregados
WHERE empreg_cpf = emp_cpf;
SELECT 'Empregado removido' as Msg;
ELSE
SELECT 'Nenhum empregado foi removido' as Msg;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mostrar_cidades_empreg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_cidades_empreg`()
BEGIN
SELECT empreg_nome, empreg_cidade
FROM empregados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_retorna_nome_cid_empreg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_retorna_nome_cid_empreg`(
IN codEmpreg int,
OUT nomeEmpreg varchar(50),
OUT cidadEmpreg varchar(50)
)
BEGIN
SELECT empreg_nome, empreg_cidade INTO nomeEmpreg, cidadEmpreg
FROM empregados
WHERE codEmpreg = empreg_codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_basic_funcionario_id`
--

/*!50001 DROP VIEW IF EXISTS `vw_basic_funcionario_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_basic_funcionario_id` AS select `empregados`.`empreg_nome` AS `empreg_nome`,`empregados`.`empreg_cpf` AS `empreg_cpf` from `empregados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_calc_salario`
--

/*!50001 DROP VIEW IF EXISTS `vw_calc_salario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_calc_salario` AS select `empregados`.`empreg_nome` AS `empreg_nome`,(select `pagamentos`.`pag_salario` from `pagamentos` where (`empregados`.`empreg_codigo` = `pagamentos`.`pag_codempregado`)) AS `salario_bruto`,(select `descontos`.`desc_inss` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`)) AS `INSS`,(select `descontos`.`desc_ir` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`)) AS `IR`,(((select `pagamentos`.`pag_salario` from `pagamentos` where (`empregados`.`empreg_codigo` = `pagamentos`.`pag_codempregado`)) - (select `descontos`.`desc_inss` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`))) - (select `descontos`.`desc_ir` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`))) AS `salario_liquido` from `empregados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_calc_salario_2`
--

/*!50001 DROP VIEW IF EXISTS `vw_calc_salario_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_calc_salario_2` AS select `empregados`.`empreg_codigo` AS `empreg_codigo`,`empregados`.`empreg_nome` AS `empreg_nome`,(select `pagamentos`.`pag_salario` from `pagamentos` where (`empregados`.`empreg_codigo` = `pagamentos`.`pag_codempregado`)) AS `salario_bruto`,(select `descontos`.`desc_inss` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`)) AS `INSS`,(select `descontos`.`desc_ir` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`)) AS `IR`,(((select `pagamentos`.`pag_salario` from `pagamentos` where (`empregados`.`empreg_codigo` = `pagamentos`.`pag_codempregado`)) - (select `descontos`.`desc_inss` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`))) - (select `descontos`.`desc_ir` from `descontos` where (`empregados`.`empreg_codigo` = `descontos`.`desc_codempregado`))) AS `salario_liquido` from `empregados` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_lanc_folha`
--

/*!50001 DROP VIEW IF EXISTS `vw_lanc_folha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_lanc_folha` AS select `e`.`empreg_nome` AS `empregado`,`e`.`empreg_cpf` AS `cpf`,`p`.`pag_codempregado` AS `p_emp_matr`,`p`.`pag_salario` AS `valor_sal_bruto`,`d`.`desc_codempregado` AS `d_emp_matr`,`d`.`desc_inss` AS `valor_inss` from ((`empregados` `e` join `pagamentos` `p`) join `descontos` `d`) where ((`e`.`empreg_codigo` = `p`.`pag_codempregado`) and (`e`.`empreg_codigo` = `d`.`desc_codempregado`)) */;
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

-- Dump completed on 2019-04-24 23:45:18
