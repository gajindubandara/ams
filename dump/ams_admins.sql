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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (6,'Bruce Wayne','gajindukb@gmail.com','0766786225','827ccb0eea8a706c4c34a16891f84e7b','Cybersecurity','active','United Kingdom'),(7,'Tony Stark','tony@gmail.com','0766780000','827ccb0eea8a706c4c34a16891f84e7b','Engineering','active','United States'),(32,'Clint Barton','clint@gmail.com','0766000225','827ccb0eea8a706c4c34a16891f84e7b','Education','inactive','Canada'),(44,'Steve Rogers','steve@gmail.com','0766781111','827ccb0eea8a706c4c34a16891f84e7b','Food Science','active','Australia'),(45,'Peter Parker','peter@gmail.com','0763336225','827ccb0eea8a706c4c34a16891f84e7b','Data Science','active','France'),(97,'Kevin Levin','kevin@gmail.com','0712345678','827ccb0eea8a706c4c34a16891f84e7b','Advertising','active','Australia'),(98,'Emily Parker','emily@gmail.com','0723456789','827ccb0eea8a706c4c34a16891f84e7b','Agriculture','active','Austria'),(99,'Michael Turner','michael@gmail.com','0734567890','827ccb0eea8a706c4c34a16891f84e7b','Architecture','active','Belgium'),(100,'Sophia Walker','sophia@gmail.com','0745678901','827ccb0eea8a706c4c34a16891f84e7b','Artificial Intelligence (AI)','active','Canada'),(101,'Daniel Mitchell','daniel@gmail.com','0756789012','827ccb0eea8a706c4c34a16891f84e7b','Biotechnology','active','Denmark'),(102,'Olivia Hill','hill@gmail.com','0767890123','827ccb0eea8a706c4c34a16891f84e7b','Cloud Computing','active','Finland'),(103,'William Carter','william@gmail.com','0778901234','827ccb0eea8a706c4c34a16891f84e7b','Content Marketing','active','France'),(104,'Ava Foster','foster@gmail.com','0789012345','827ccb0eea8a706c4c34a16891f84e7b','Consulting','active','Germany'),(105,'James Kelly','james@gmail.com','0790123456','827ccb0eea8a706c4c34a16891f84e7b','Construction','active','Ireland'),(106,'Emma Ward','emma@gmail.com','0701234567','827ccb0eea8a706c4c34a16891f84e7b','Criminal Justice','active','Japan'),(107,'Liam Rogers','liamr@gmail.com','0712345678','827ccb0eea8a706c4c34a16891f84e7b','Cybersecurity','active','Netherlands'),(108,'Mia Simmons','mia@gmail.com','0723456789','827ccb0eea8a706c4c34a16891f84e7b','Data Science','active','Norway'),(109,'Benjamin Cook','benjamin@gmail.com','0734567890','827ccb0eea8a706c4c34a16891f84e7b','Database Administration','active','Singapore'),(110,'Ava Howard','ava@gmail.com','0745678901','827ccb0eea8a706c4c34a16891f84e7b','DevOps','active','Sweden'),(111,'Ethan Richardson','ethan@gmail.com','0756789012','827ccb0eea8a706c4c34a16891f84e7b','Digital Marketing','active','Switzerland'),(112,'Olivia Turner','olivia@gmail.com','0767890123','827ccb0eea8a706c4c34a16891f84e7b','Education','active','United Kingdom'),(113,'Liam Foster','liam@gmail.com','0778901234','827ccb0eea8a706c4c34a16891f84e7b','Engineering','active','United States');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
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
