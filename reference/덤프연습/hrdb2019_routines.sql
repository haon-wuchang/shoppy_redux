-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hrdb2019
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Temporary view structure for view `view_cartlist`
--

DROP TABLE IF EXISTS `view_cartlist`;
/*!50001 DROP VIEW IF EXISTS `view_cartlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_cartlist` AS SELECT 
 1 AS `cid`,
 1 AS `size`,
 1 AS `qty`,
 1 AS `id`,
 1 AS `zipcode`,
 1 AS `address`,
 1 AS `pid`,
 1 AS `pname`,
 1 AS `price`,
 1 AS `info`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_getproduct`
--

DROP TABLE IF EXISTS `view_getproduct`;
/*!50001 DROP VIEW IF EXISTS `view_getproduct`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_getproduct` AS SELECT 
 1 AS `pid`,
 1 AS `name`,
 1 AS `price`,
 1 AS `info`,
 1 AS `uploadFile`,
 1 AS `sourceFile`,
 1 AS `pdate`,
 1 AS `image`,
 1 AS `imgList`,
 1 AS `detailImgList`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_orderlist`
--

DROP TABLE IF EXISTS `view_orderlist`;
/*!50001 DROP VIEW IF EXISTS `view_orderlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_orderlist` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `zipcode`,
 1 AS `address`,
 1 AS `pid`,
 1 AS `pname`,
 1 AS `price`,
 1 AS `info`,
 1 AS `image`,
 1 AS `cid`,
 1 AS `size`,
 1 AS `qty`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_cartlist`
--

/*!50001 DROP VIEW IF EXISTS `view_cartlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cartlist` AS select `sc`.`CID` AS `cid`,`sc`.`SIZE` AS `size`,`sc`.`QTY` AS `qty`,`sm`.`ID` AS `id`,`sm`.`ZIPCODE` AS `zipcode`,`sm`.`ADDRESS` AS `address`,`sp`.`PID` AS `pid`,`sp`.`PNAME` AS `pname`,`sp`.`PRICE` AS `price`,`sp`.`DESCRIPTION` AS `info`,concat('http://3.39.192.201:9000/',json_unquote(json_extract(`sp`.`UPLOAD_FILE`,'$[0]'))) AS `image` from ((`shoppy_member` `sm` join `shoppy_cart` `sc`) join `shoppy_product` `sp`) where ((`sm`.`ID` = `sc`.`ID`) and (`sc`.`PID` = `sp`.`PID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_getproduct`
--

/*!50001 DROP VIEW IF EXISTS `view_getproduct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_getproduct` AS select `shoppy_product`.`PID` AS `pid`,`shoppy_product`.`PNAME` AS `name`,`shoppy_product`.`PRICE` AS `price`,`shoppy_product`.`DESCRIPTION` AS `info`,`shoppy_product`.`UPLOAD_FILE` AS `uploadFile`,`shoppy_product`.`SOURCE_FILE` AS `sourceFile`,`shoppy_product`.`PDATE` AS `pdate`,concat('http://3.39.192.201:9000/',json_unquote(json_extract(`shoppy_product`.`UPLOAD_FILE`,'$[0]'))) AS `image`,json_array(concat('http://3.39.192.201:9000/',json_unquote(json_extract(`shoppy_product`.`UPLOAD_FILE`,'$[0]'))),concat('http://3.39.192.201:9000/',json_unquote(json_extract(`shoppy_product`.`UPLOAD_FILE`,'$[1]'))),concat('http://3.39.192.201:9000/',json_unquote(json_extract(`shoppy_product`.`UPLOAD_FILE`,'$[2]')))) AS `imgList`,json_arrayagg(concat('http://3.39.192.201:9000/',`jt`.`filename`)) AS `detailImgList` from (`shoppy_product` join json_table(`shoppy_product`.`UPLOAD_FILE`, '$[*]' columns (`filename` varchar(100) character set utf8mb4 path '$')) `jt`) group by `shoppy_product`.`PID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orderlist`
--

/*!50001 DROP VIEW IF EXISTS `view_orderlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orderlist` AS select `sm`.`ID` AS `id`,`sm`.`NAME` AS `name`,`sm`.`PHONE` AS `phone`,concat(`sm`.`EMAILNAME`,'@',`sm`.`EMAILDOMAIN`) AS `email`,`sm`.`ZIPCODE` AS `zipcode`,`sm`.`ADDRESS` AS `address`,`sp`.`PID` AS `pid`,`sp`.`PNAME` AS `pname`,`sp`.`PRICE` AS `price`,`sp`.`DESCRIPTION` AS `info`,concat('http://3.39.192.201:9000/',json_unquote(json_extract(`sp`.`UPLOAD_FILE`,'$[0]'))) AS `image`,`sc`.`CID` AS `cid`,`sc`.`SIZE` AS `size`,`sc`.`QTY` AS `qty` from ((`shoppy_member` `sm` join `shoppy_cart` `sc`) join `shoppy_product` `sp`) where ((`sm`.`ID` = `sc`.`ID`) and (`sc`.`PID` = `sp`.`PID`)) */;
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

-- Dump completed on 2025-03-17 10:46:23
