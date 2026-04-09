-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_management_system
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `leave_ID` int NOT NULL,
  `emp_ID` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reason` text,
  PRIMARY KEY (`leave_ID`),
  KEY `fk_leave_emp` (`emp_ID`),
  CONSTRAINT `fk_leave_emp` FOREIGN KEY (`emp_ID`) REFERENCES `employee` (`emp_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,1,'2024-01-15','Medical Leave'),(2,2,'2024-10-02','Personal Work'),(3,3,'2024-05-03','Sick Leave'),(4,4,'2024-01-25','Family Emergency'),(5,5,'2024-10-03','Travel'),(6,6,'2024-02-15','Medical Checkup'),(7,7,'2024-01-04','Festival'),(8,8,'2024-10-04','Vacation'),(9,9,'2024-02-20','Illness'),(10,10,'2024-05-01','Personal Work'),(11,11,'2024-03-20','Medical Emergency'),(12,12,'2024-01-30','Marriage'),(13,13,'2024-03-25','Maternity Leave'),(14,14,'2024-05-02','Dental Appointment'),(15,15,'2024-03-15','Fever'),(16,16,'2024-05-04','Work from Home'),(17,17,'2024-01-18','School Admission'),(18,18,'2024-12-03','Travel'),(19,19,'2024-08-02','Festival'),(20,20,'2024-01-22','Routine Checkup'),(21,21,'2024-04-18','Interview'),(22,22,'2024-02-25','Family Function'),(23,23,'2024-10-01','Fever'),(24,24,'2024-03-30','Sick Leave'),(25,25,'2024-01-02','Jury Duty'),(26,26,'2024-12-04','Business Trip'),(27,27,'2024-01-14','Medical Leave'),(28,28,'2024-03-18','Personal'),(29,29,'2024-11-02','Travel'),(30,30,'2024-03-04','Funeral'),(31,31,'2024-01-27','Health Check'),(32,32,'2024-02-03','School Exam'),(33,33,'2024-02-16','Medical Emergency'),(34,34,'2024-09-04','Paternity Leave'),(35,35,'2024-01-20','House Shift'),(36,36,'2024-08-03','Court Appearance'),(37,37,'2024-03-02','Vehicle Issue'),(38,38,'2024-01-13','Sick Leave'),(39,39,'2024-02-04','Child Care'),(40,40,'2024-06-03','Medical Test'),(41,41,'2024-02-13','Headache'),(42,42,'2024-07-01','Cold and Flu'),(43,43,'2024-03-28','Family Illness'),(44,44,'2024-02-14','Mental Health Day'),(45,45,'2024-01-24','Religious Observance'),(46,46,'2024-03-16','Bereavement Leave'),(47,47,'2024-06-02','Urgent Travel'),(48,48,'2024-06-04','School Function'),(49,49,'2024-01-16','Eye Surgery'),(50,50,'2024-02-21','Child\'s Exam'),(51,51,'2024-03-14','Wellness Retreat'),(52,52,'2024-01-23','College Reunion'),(53,53,'2024-04-14','Minor Injury'),(54,54,'2024-01-03','Stomach Pain'),(55,55,'2024-02-28','Volunteer Work'),(56,56,'2024-12-01','Water Problem at Home'),(57,57,'2024-04-03','Blood Donation'),(58,58,'2024-02-18','Fever'),(59,59,'2024-01-28','Community Event'),(60,60,'2024-04-04','Health Checkup');
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-05 17:34:04
