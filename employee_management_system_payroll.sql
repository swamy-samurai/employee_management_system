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
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `payroll_ID` int NOT NULL,
  `emp_ID` int DEFAULT NULL,
  `job_ID` int DEFAULT NULL,
  `salary_ID` int DEFAULT NULL,
  `leave_ID` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `report` text,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`payroll_ID`),
  KEY `fk_payroll_emp` (`emp_ID`),
  KEY `fk_payroll_job` (`job_ID`),
  KEY `fk_payroll_salary` (`salary_ID`),
  KEY `fk_payroll_leave` (`leave_ID`),
  CONSTRAINT `fk_payroll_emp` FOREIGN KEY (`emp_ID`) REFERENCES `employee` (`emp_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payroll_job` FOREIGN KEY (`job_ID`) REFERENCES `jobdepartment` (`Job_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_payroll_leave` FOREIGN KEY (`leave_ID`) REFERENCES `leaves` (`leave_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payroll_salary` FOREIGN KEY (`salary_ID`) REFERENCES `salarybonus` (`salary_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,1,1,1,1,'2024-04-30','April Payroll',40500.00),(2,2,2,2,2,'2024-04-30','April Payroll',45500.00),(3,3,3,3,3,'2024-04-30','April Payroll',39500.00),(4,4,4,4,4,'2024-04-30','April Payroll',43500.00),(5,5,5,5,5,'2024-04-30','April Payroll',38500.00),(6,6,6,6,6,'2024-04-30','April Payroll',42500.00),(7,7,7,7,7,'2024-04-30','April Payroll',44500.00),(8,8,8,8,8,'2024-04-30','April Payroll',45500.00),(9,9,9,9,9,'2024-04-30','April Payroll',40500.00),(10,10,10,10,10,'2024-04-30','April Payroll',38500.00),(11,11,11,11,11,'2024-04-30','April Payroll',49500.00),(12,12,12,12,12,'2024-04-30','April Payroll',51500.00),(13,13,13,13,13,'2024-04-30','April Payroll',50500.00),(14,14,14,14,14,'2024-04-30','April Payroll',48500.00),(15,15,15,15,15,'2024-04-30','April Payroll',47500.00),(16,16,16,16,16,'2024-04-30','April Payroll',50500.00),(17,17,17,17,17,'2024-04-30','April Payroll',49500.00),(18,18,18,18,18,'2024-04-30','April Payroll',51500.00),(19,19,19,19,19,'2024-04-30','April Payroll',49500.00),(20,20,20,20,20,'2024-04-30','April Payroll',48500.00),(21,21,21,21,21,'2024-04-30','April Payroll',46500.00),(22,22,22,22,22,'2024-04-30','April Payroll',47500.00),(23,23,23,23,23,'2024-04-30','April Payroll',45500.00),(24,24,24,24,24,'2024-04-30','April Payroll',47500.00),(25,25,25,25,25,'2024-04-30','April Payroll',45500.00),(26,26,26,26,26,'2024-04-30','April Payroll',46500.00),(27,27,27,27,27,'2024-04-30','April Payroll',44500.00),(28,28,28,28,28,'2024-04-30','April Payroll',49500.00),(29,29,29,29,29,'2024-04-30','April Payroll',45500.00),(30,30,30,30,30,'2024-04-30','April Payroll',50500.00),(31,31,31,31,31,'2024-04-30','April Payroll',41500.00),(32,32,32,32,32,'2024-04-30','April Payroll',48500.00),(33,33,33,33,33,'2024-04-30','April Payroll',49500.00),(34,34,34,34,34,'2024-04-30','April Payroll',46500.00),(35,35,35,35,35,'2024-04-30','April Payroll',45500.00),(36,36,36,36,36,'2024-04-30','April Payroll',43500.00),(37,37,37,37,37,'2024-04-30','April Payroll',44500.00),(38,38,38,38,38,'2024-04-30','April Payroll',47500.00),(39,39,39,39,39,'2024-04-30','April Payroll',45500.00),(40,40,40,40,40,'2024-04-30','April Payroll',46500.00),(41,41,41,41,41,'2024-04-30','April Payroll',48500.00),(42,42,42,42,42,'2024-04-30','April Payroll',43500.00),(43,43,43,43,43,'2024-04-30','April Payroll',49500.00),(44,44,44,44,44,'2024-04-30','April Payroll',45500.00),(45,45,45,45,45,'2024-04-30','April Payroll',47500.00),(46,46,46,46,46,'2024-04-30','April Payroll',48500.00),(47,47,47,47,47,'2024-04-30','April Payroll',46500.00),(48,48,48,48,48,'2024-04-30','April Payroll',43500.00),(49,49,49,49,49,'2024-04-30','April Payroll',48500.00),(50,50,50,50,50,'2024-04-30','April Payroll',47500.00),(51,51,51,51,51,'2024-04-30','April Payroll',50500.00),(52,52,52,52,52,'2024-04-30','April Payroll',46500.00),(53,53,53,53,53,'2024-04-30','April Payroll',49500.00),(54,54,54,54,54,'2024-04-30','April Payroll',46500.00),(55,55,55,55,55,'2024-04-30','April Payroll',43500.00),(56,56,56,56,56,'2024-04-30','April Payroll',42500.00),(57,57,57,57,57,'2024-04-30','April Payroll',48500.00),(58,58,58,58,58,'2024-04-30','April Payroll',45500.00),(59,59,59,59,59,'2024-04-30','April Payroll',44500.00),(60,60,60,60,60,'2024-04-30','April Payroll',47500.00);
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
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
