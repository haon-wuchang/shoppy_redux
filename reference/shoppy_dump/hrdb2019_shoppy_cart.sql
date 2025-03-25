-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 13.125.159.44    Database: hrdb2019
-- ------------------------------------------------------
-- Server version	8.4.3
use hrdb2019;

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
-- Table structure for table `shoppy_cart`
--

DROP TABLE IF EXISTS `shoppy_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppy_cart` (
  `CID` int NOT NULL AUTO_INCREMENT,
  `SIZE` varchar(10) NOT NULL,
  `QTY` int NOT NULL,
  `CDATE` datetime DEFAULT NULL,
  `ID` varchar(30) NOT NULL,
  `PID` int NOT NULL,
  PRIMARY KEY (`CID`),
  KEY `FK_ID_SHOPPY_MEMBER_ID` (`ID`),
  KEY `FK_PID_SHOPPY_PRODUCT_PID` (`PID`),
  CONSTRAINT `FK_ID_SHOPPY_MEMBER_ID` FOREIGN KEY (`ID`) REFERENCES `shoppy_member` (`ID`),
  CONSTRAINT `FK_PID_SHOPPY_PRODUCT_PID` FOREIGN KEY (`PID`) REFERENCES `shoppy_product` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppy_cart`
--

LOCK TABLES `shoppy_cart` WRITE;
/*!40000 ALTER TABLE `shoppy_cart` DISABLE KEYS */;
INSERT INTO `shoppy_cart` VALUES (9,'XS',1,'2025-02-18 16:10:52','test5',9),(30,'M',1,'2025-02-19 14:56:50','test5',10),(37,'M',3,'2025-02-24 13:57:55','test5',12),(38,'XS',4,'2025-02-24 15:17:32','test5',13),(65,'XS',1,'2025-03-10 14:10:39','test1',3),(66,'XS',2,'2025-03-10 14:10:58','test1',11),(67,'XL',1,'2025-03-10 14:52:37','test1',11),(68,'XS',2,'2025-03-10 14:56:15','test1',12),(69,'XS',2,'2025-03-10 14:56:57','test1',9);
/*!40000 ALTER TABLE `shoppy_cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 17:54:27
