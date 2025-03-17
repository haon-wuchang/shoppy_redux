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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` char(5) NOT NULL,
  `emp_name` varchar(4) NOT NULL,
  `eng_name` varchar(20) DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `hire_date` date NOT NULL,
  `retire_date` date DEFAULT NULL,
  `dept_id` char(3) NOT NULL,
  `phone` char(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('S0001','홍길동','hong','M','2013-01-01',NULL,'SYS','010-1234-1234','hong@d-friends.co.kr',8500),('S0002','일지매','jiemae','M','2013-01-12',NULL,'GEN','017-111-1222','jimae@d-friends.co.kr',8200),('S0003','강우동',NULL,'M','2014-04-01',NULL,'SYS','010-1222-2221','woodong@d-friends.co.kr',6500),('S0004','김삼순','samsam','F','2014-08-01',NULL,'MKT','010-3212-3212','samsoon.kim@d-friends.co.kr',7000),('S0005','오삼식','three','M','2015-01-01','2017-01-31','MKT','010-9876-5432','samsik@d-friends.co.kr',6400),('S0006','김치국','kimchi','M','2015-03-01',NULL,'HRD','010-8765-8765','chikook@d-friends.co.kr',6000),('S0007','안경태',NULL,'M','2015-05-01',NULL,'ACC','017-543-3456','ahn@d-friends.co.kr',6000),('S0008','박여사','parks','F','2015-08-01','2016-09-30','HRD','010-2345-5432','yeosa@d-friends.co.kr',6300),('S0009','최사모','samoya','F','2015-10-01',NULL,'SYS','011-899-9988','samo@d-friends.co.kr',5800),('S0010','정효리',NULL,'F','2016-01-01',NULL,'MKT','010-9988-9900','hyori.jung@d-friends.co.kr',5000),('S0011','오감자','fivegamja','M','2016-02-01',NULL,'SYS','010-6655-7788','gamja@d-friends.co.kr',4700),('S0012','최일국','ilgook','M','2016-02-01',NULL,'GEN','010-8703-7123','ilkook@d-friends.co.kr',6500),('S0013','한국인','korea','M','2016-04-01',NULL,'SYS','010-6611-1266','hankook@d-friends.co.kr',4500),('S0014','이최고','first','M','2016-04-01',NULL,'MKT','010-2345-9886','one@d-friends.co.kr',5000),('S0015','박치기',NULL,'M','2016-06-01','2017-05-31','MKT','010-8800-0010','chichi@d-friends.co.kr',4700),('S0016','한사랑','onelove','F','2016-06-01',NULL,'HRD','010-3215-0987','love@d-friends.co.kr',7200),('S0017','나도야','nado','M','2017-12-01',NULL,'ACC','010-3399-9933','yaya@d-friends.co.kr',4000),('S0018','이리와',NULL,'M','2018-01-01','2018-06-30','HRD','010-5521-1252','comeon@d-friends.co.kr',5300),('S0019','정주고',NULL,'M','2018-01-01',NULL,'SYS','010-7777-2277','give@d-friends.co.kr',6000),('S0020','고소해','gogo','F','2018-04-01',NULL,'STG','010-9966-1230','haha@d-friends.co.kr',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-17 10:46:23
