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
-- Table structure for table `job_seekers`
--

DROP TABLE IF EXISTS `job_seekers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_seekers` (
  `seeker_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seeker_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_seekers`
--

LOCK TABLES `job_seekers` WRITE;
/*!40000 ALTER TABLE `job_seekers` DISABLE KEYS */;
INSERT INTO `job_seekers` VALUES (59,'Ben Tennyson','ben@gmail.com','0766786255','c4ca4238a0b923820dcc509a6f75849b','Real Estate'),(69,'John Doe','john@gmail.com','0761234567','c4ca4238a0b923820dcc509a6f75849b','DevOps'),(70,'Smith','smith@gmail.com','0716754563','c4ca4238a0b923820dcc509a6f75849b','Architecture'),(102,'Jane Smith','jane@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Agriculture'),(103,'Michael Johnson','michael@gmail.com','0734567890','c4ca4238a0b923820dcc509a6f75849b','Artificial Intelligence (AI)'),(104,'Emily Williams','emily@gmail.com','0745678901','c4ca4238a0b923820dcc509a6f75849b','Biotechnology'),(105,'David Brown','david@gmail.com','0756789012','c4ca4238a0b923820dcc509a6f75849b','Cloud Computing'),(106,'Sarah Wilson','sarah@gmail.com','0767890123','c4ca4238a0b923820dcc509a6f75849b','Content Marketing'),(107,'Kevin Davis','kevin@gmail.com','0778901234','c4ca4238a0b923820dcc509a6f75849b','Consulting'),(108,'Laura Taylor','laura@gmail.com','0789012345','c4ca4238a0b923820dcc509a6f75849b','Construction'),(109,'Daniel Martinez','daniel@gmail.com','0790123456','c4ca4238a0b923820dcc509a6f75849b','Criminal Justice'),(110,'Sophia Anderson','sophia@gmail.com','0701234567','c4ca4238a0b923820dcc509a6f75849b','Cybersecurity'),(111,'Sophie Miller','sophie@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Data Science'),(112,'William Clark','william@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Database Administration'),(113,'Oliver Hall','oliver@gmail.com','0734567890','c4ca4238a0b923820dcc509a6f75849b','DevOps'),(114,'Grace Lewis','grace@gmail.com','0745678901','c4ca4238a0b923820dcc509a6f75849b','Digital Marketing'),(115,'Henry Turner','henry@gmail.com','0756789012','c4ca4238a0b923820dcc509a6f75849b','Education'),(116,'Ava Hernandez','ava@gmail.com','0767890123','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(117,'Leo Moore','leo@gmail.com','0778901234','c4ca4238a0b923820dcc509a6f75849b','Environmental Science'),(118,'Ella White','ella@gmail.com','0789012345','c4ca4238a0b923820dcc509a6f75849b','Film Production'),(119,'Jackson Taylor','jackson@gmail.com','0790123456','c4ca4238a0b923820dcc509a6f75849b','Food Science'),(120,'Chloe Parker','chloe@gmail.com','0701234567','c4ca4238a0b923820dcc509a6f75849b','Game Development'),(121,'Liam Adams','liam@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Healthcare'),(122,'Emma Martinez','emma@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Information Technology (IT)'),(123,'Mia Robinson','mia@gmail.com','0734567890','c4ca4238a0b923820dcc509a6f75849b','Marketing'),(124,'Noah Wright','noah@gmail.com','0745678901','c4ca4238a0b923820dcc509a6f75849b','Mechanical Engineering'),(125,'Isabella Brown','isabella@gmail.com','0756789012','c4ca4238a0b923820dcc509a6f75849b','Medicine'),(273,'Alice Johnson','alice@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Data Science'),(274,'Bob Smith','bob@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Software Development'),(275,'Carol Davis','carol@gmail.com','0734567890','c4ca4238a0b923820dcc509a6f75849b','Marketing'),(276,'David Brown','davidb@gmail.com','0745678901','c4ca4238a0b923820dcc509a6f75849b','Cybersecurity'),(277,'Eve Williams','eve@gmail.com','0756789012','c4ca4238a0b923820dcc509a6f75849b','UX/UI Design'),(278,'Frank Wilson','frank@gmail.com','0767890123','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(279,'Grace Taylor','gracet@gmail.com','0778901234','c4ca4238a0b923820dcc509a6f75849b','Artificial Intelligence (AI)'),(280,'Henry Martinez','henrym@gmail.com','0789012345','c4ca4238a0b923820dcc509a6f75849b','Database Administration'),(281,'Isabel Anderson','isabel@gmail.com','0790123456','c4ca4238a0b923820dcc509a6f75849b','Healthcare'),(282,'Jack Davis','jack@gmail.com','0701234567','c4ca4238a0b923820dcc509a6f75849b','Content Marketing'),(283,'Kate Johnson','kate@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Sales'),(284,'Leo Smith','leos@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Digital Marketing'),(285,'Mia Brown','miab@gmail.com','0734567890','c4ca4238a0b923820dcc509a6f75849b','Consulting'),(286,'Noah Williams','wnoah@gmail.com','0745678901','c4ca4238a0b923820dcc509a6f75849b','Project Management'),(287,'Olivia Wilson','olivia@gmail.com','0756789012','c4ca4238a0b923820dcc509a6f75849b','Environmental Science'),(288,'Peter Davis','peter@gmail.com','0767890123','c4ca4238a0b923820dcc509a6f75849b','Teaching'),(289,'Quinn Johnson','quinn@gmail.com','0778901234','c4ca4238a0b923820dcc509a6f75849b','Legal Services'),(290,'Ryan Smith','ryan@gmail.com','0789012345','c4ca4238a0b923820dcc509a6f75849b','Journalism'),(291,'Sophia Martinez','msophia@gmail.com','0790123456','c4ca4238a0b923820dcc509a6f75849b','Mechanical Engineering'),(292,'Thomas Anderson','thomas@gmail.com','0701234567','c4ca4238a0b923820dcc509a6f75849b','Film Production'),(293,'Uma Brown','uma@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Tourism'),(294,'Eric Johnson','eric.johnson@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(295,'Anna White','anna.white@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(296,'Matthew Davis','matthew.davis@gmail.com','0734567890','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(297,'Olivia Moore','olivia.moore@gmail.com','0745678901','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(298,'Daniel Smith','daniel.smith@gmail.com','0756789012','c4ca4238a0b923820dcc509a6f75849b','Engineering'),(299,'Sophie Turner','sophie.turner@gmail.com','0767890123','c4ca4238a0b923820dcc509a6f75849b','Data Science'),(300,'Liam Clark','liam.clark@gmail.com','0778901234','c4ca4238a0b923820dcc509a6f75849b','Data Science'),(301,'Emma Hall','emma.hall@gmail.com','0789012345','c4ca4238a0b923820dcc509a6f75849b','Data Science'),(302,'Noah Lewis','noah.lewis@gmail.com','0790123456','c4ca4238a0b923820dcc509a6f75849b','Data Science'),(303,'Grace Hernandez','grace.hernandez@gmail.com','0701234567','c4ca4238a0b923820dcc509a6f75849b','Cybersecurity'),(304,'Ethan Brown','ethan.brown@gmail.com','0712345678','c4ca4238a0b923820dcc509a6f75849b','Cybersecurity'),(305,'Amelia Martinez','amelia.martinez@gmail.com','0723456789','c4ca4238a0b923820dcc509a6f75849b','Cybersecurity'),(400,'Sherlok Holmes','holmes@gmail.com','0756786541','c4ca4238a0b923820dcc509a6f75849b','Legal Services'),(426,'Gajindu Bandara','gajindukb2000@gmail.com','0766786555','81dc9bdb52d04dc20036dbd8313ed055','Cybersecurity');
/*!40000 ALTER TABLE `job_seekers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-04  8:04:33
