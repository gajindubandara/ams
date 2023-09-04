-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ams
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `seeker_id` int DEFAULT NULL,
  `slot` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `assigned_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_idx` (`admin_id`),
  KEY `fk_seeker_idx` (`seeker_id`),
  CONSTRAINT `fk_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_seeker` FOREIGN KEY (`seeker_id`) REFERENCES `job_seekers` (`seeker_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (46,'2023-08-25',6,59,'2023-08-25 13:40 - 14:40','United Kingdom','Cybersecurity','completed','2023-08-20'),(48,'2023-09-24',6,59,'2023-09-24 14:40 - 15:40','United Kingdom','Cybersecurity','pending','2023-09-03'),(49,'2023-09-25',6,NULL,'2023-09-25 16:45 - 17:45','United Kingdom','Cybersecurity','active',NULL),(50,'2023-09-20',7,NULL,'2023-09-20 16:45 - 17:45','USA','Engineering','active',NULL),(54,'2023-09-09',6,NULL,'2023-09-09 18:30 - 19:30','United Kingdom','Cybersecurity','active',NULL),(55,'2023-08-25',6,59,'2023-08-25 13:00 - 14:00','United Kingdom','Cybersecurity','completed','2023-08-21'),(56,'2023-08-25',7,69,'2023-08-25 14:00 - 15:00','United States','Engineering','completed','2023-08-21'),(57,'2023-09-26',32,70,'2023-09-26 15:00 - 16:00','Canada','Education','rejected','2023-08-21'),(58,'2023-09-27',44,102,'2023-09-27 16:00 - 17:00','Australia','Food Science','pending','2023-08-21'),(59,'2023-08-25',45,103,'2023-08-25 17:00 - 18:00','France','Data Science','completed','2023-08-21'),(89,'2023-09-25',7,69,'2023-09-25 14:00 - 15:00','United States','Engineering','confirmed','2023-08-21'),(90,'2023-09-26',32,70,'2023-09-26 15:00 - 16:00','Canada','Education','rejected','2023-08-21'),(91,'2023-09-27',44,102,'2023-09-27 16:00 - 17:00','Australia','Food Science','pending','2023-08-21'),(92,'2023-08-25',45,103,'2023-08-25 17:00 - 18:00','France','Data Science','completed','2023-08-21'),(93,'2023-09-29',97,104,'2023-09-29 18:00 - 19:00','Australia','Advertising','confirmed','2023-08-21'),(94,'2023-08-25',98,105,'2023-08-25 19:00 - 20:00','Austria','Agriculture','completed','2023-08-21'),(95,'2023-10-01',99,106,'2023-10-01 20:00 - 21:00','Belgium','Architecture','rejected','2023-08-21'),(96,'2023-08-25',100,107,'2023-08-25 21:00 - 22:00','Canada','Artificial Intelligence (AI)','completed','2023-08-21'),(97,'2023-10-03',101,108,'2023-10-03 10:00 - 11:00','Denmark','Biotechnology','confirmed','2023-08-21'),(98,'2023-08-25',102,109,'2023-08-25 11:00 - 12:00','Finland','Cloud Computing','completed','2023-08-21'),(99,'2023-10-05',103,110,'2023-10-05 12:00 - 13:00','France','Content Marketing','rejected','2023-08-21'),(100,'2023-08-25',104,111,'2023-08-25 13:00 - 14:00','Germany','Consulting','completed','2023-08-21'),(101,'2023-08-25',105,112,'2023-08-25 14:00 - 15:00','Ireland','Construction','completed','2023-08-21'),(102,'2023-10-08',106,113,'2023-10-08 15:00 - 16:00','Japan','Criminal Justice','pending','2023-08-21'),(103,'2023-08-21',6,NULL,'2023-08-21 17:50 - 18:50','United Kingdom','Cybersecurity','active',NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-04  8:04:32
