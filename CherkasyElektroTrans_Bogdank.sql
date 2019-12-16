-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: CherkasyElektroTrans_Bogdank
-- ------------------------------------------------------
-- Server version	5.7.27

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
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `employe_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employe ID',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Position ID',
  `employe_name` varchar(127) NOT NULL COMMENT 'Employe Name',
  `employe_last_name` varchar(127) NOT NULL COMMENT 'Employe Last Name',
  `position_start_date` date DEFAULT NULL COMMENT 'Employe Position Start Date',
  `dob` date DEFAULT NULL COMMENT 'Date Of Birth',
  PRIMARY KEY (`employe_id`),
  KEY `EMPLOYE_EMPLOYE_POSITION_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `EMPLOYE_EMPLOYE_POSITION_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Employe''s';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,1,'Ivan ','Bulkin','1999-05-13','1989-04-14'),(2,1,'Petrik ','Pyatochkin','2001-08-23','1995-02-28'),(3,1,'Don ','Carleone','1979-07-03','1999-12-12'),(4,2,'Ivan ','Durak','1999-03-08','1986-04-05'),(5,1,'Tommy ','Vercetti','2002-10-29','1979-07-24'),(6,3,'Sonny','Forelli','2002-10-29','1969-10-19'),(7,1,'Carl \"CJ\" ','Johnson','2004-10-26','1988-06-13'),(8,4,'Big ','Smoke','2004-10-26','1984-05-11'),(9,5,'Jason ','Statham','1997-08-12','1967-07-26'),(10,1,'Lewis Carl ','Hamilton','2008-11-02','1985-01-07'),(11,1,'Michael ','Schumacher','2001-10-13','1969-01-03');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe_transport`
--

DROP TABLE IF EXISTS `employe_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe_transport` (
  `employe_id` int(10) unsigned NOT NULL,
  `transport_id` int(10) unsigned NOT NULL,
  `income` int(10) NOT NULL COMMENT 'Income',
  `date` date NOT NULL COMMENT 'Day of the route',
  KEY `EMPLOYE_TRANSPORT_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`),
  KEY `EMPLOYE_TRANSPORT_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` (`employe_id`),
  CONSTRAINT `EMPLOYE_TRANSPORT_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON DELETE CASCADE,
  CONSTRAINT `EMPLOYE_TRANSPORT_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Employe Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe_transport`
--

LOCK TABLES `employe_transport` WRITE;
/*!40000 ALTER TABLE `employe_transport` DISABLE KEYS */;
INSERT INTO `employe_transport` VALUES (1,1,2356,'2019-01-02'),(2,2,4533,'2019-01-02'),(3,10,4346,'2019-01-02'),(5,9,7553,'2019-01-02'),(7,5,3522,'2019-01-02'),(10,6,3534,'2019-01-02'),(11,7,3434,'2019-01-02'),(4,8,3423,'2019-01-02'),(4,4,3975,'2019-01-03'),(11,1,1456,'2019-01-03'),(10,2,7853,'2019-01-03'),(7,7,3436,'2019-01-03'),(5,9,4349,'2019-01-03'),(3,6,3493,'2019-01-03'),(2,5,3463,'2019-01-03'),(1,3,4346,'2019-01-03'),(1,1,3456,'2019-01-04'),(2,2,4344,'2019-01-04'),(3,3,3456,'2019-01-04'),(5,4,9343,'2019-01-04'),(7,5,4343,'2019-01-04'),(10,6,4345,'2019-01-04'),(11,7,1245,'2019-01-04'),(4,8,2566,'2019-01-04'),(4,16,5756,'2019-01-05'),(11,15,2616,'2019-01-05'),(10,14,4986,'2019-01-05'),(7,11,4236,'2019-01-05'),(5,10,1466,'2019-01-05'),(3,9,7856,'2019-01-05'),(2,8,1636,'2019-01-05'),(1,7,2366,'2019-01-05'),(1,6,2896,'2019-01-06'),(2,5,2796,'2019-01-06'),(3,4,2346,'2019-01-06');
/*!40000 ALTER TABLE `employe_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'POsition ID',
  `position_name` varchar(127) NOT NULL COMMENT 'Position Name',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Positions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Driver'),(2,'Beginner Вriver'),(3,'Accountant'),(4,'Conductor'),(5,'Mechanic');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Route ID',
  `route_number` tinyint(1) NOT NULL COMMENT 'Route Number',
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Routes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,7);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Salary ID',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'Employe ID',
  `salary_date` date DEFAULT NULL COMMENT 'Salary Date',
  `salary_value` decimal(10,2) NOT NULL COMMENT 'Salary Value',
  PRIMARY KEY (`salary_id`),
  KEY `SALARY_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` (`employe_id`),
  CONSTRAINT `SALARY_EMPLOYE_ID_EMPLOYE_EMPLOYE_ID` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='Salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (35,1,'2019-01-06',5236.49),(36,2,'2019-01-06',4523.26),(37,3,'2019-01-06',5426.42),(38,4,'2019-01-06',2136.49),(39,5,'2019-01-06',7856.24),(40,6,'2019-01-06',9246.10),(41,7,'2019-01-06',2146.48),(42,8,'2019-01-06',4533.49),(43,9,'2019-01-06',7531.49),(44,10,'2019-01-06',2146.49),(45,11,'2019-01-06',6458.49),(46,1,'2019-01-26',3426.49),(47,2,'2019-01-26',1236.49),(48,3,'2019-01-26',9753.49),(49,4,'2019-01-26',2436.49),(50,5,'2019-01-26',7862.49),(51,6,'2019-01-26',7335.49),(52,7,'2019-01-26',5543.49),(53,8,'2019-01-26',5423.49),(54,9,'2019-01-26',5783.49),(55,10,'2019-01-26',1234.49),(56,11,'2019-01-26',1433.49),(57,1,'2019-02-06',4236.49),(58,2,'2019-02-06',4236.49),(59,3,'2019-02-06',4634.49),(60,4,'2019-02-06',3694.49),(61,5,'2019-02-06',4569.49),(62,6,'2019-02-06',8536.49),(63,7,'2019-02-06',5213.49),(64,8,'2019-02-06',5236.49),(65,9,'2019-02-06',6944.49),(66,10,'2019-02-06',2369.49),(67,11,'2019-02-06',2136.49),(68,6,'2019-02-06',9486.49);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport ID',
  `route_id` int(10) unsigned NOT NULL COMMENT 'Route ID',
  `trasport_number` int(5) NOT NULL COMMENT 'Transport Number',
  PRIMARY KEY (`transport_id`),
  KEY `TRANSPORT_ROUTE_ID_ROUTE_ROUTE_ID` (`route_id`),
  CONSTRAINT `TRANSPORT_ROUTE_ID_ROUTE_ROUTE_ID` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,1,1315),(2,2,4236),(3,2,8536),(4,2,1487),(5,1,3612),(6,3,3602),(7,3,8510),(8,4,3698),(9,5,376),(10,5,1588),(11,5,666),(12,6,777),(13,6,200),(14,6,316),(15,6,1978),(16,6,2233);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17  1:33:34
