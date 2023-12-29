-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `year` varchar(200) DEFAULT NULL,
  `year_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES ('2023-2024',1),('2024-2025',2);
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_name` varchar(200) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  KEY `branch_id_index` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('CS',1),('IT',2),('AIDS',3),('EXTC',4);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `room_number` varchar(10) NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('101',30),('102',5),('201',5),('202',5),('301',5),('302',5);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `division` varchar(100) DEFAULT NULL,
  `div_id` int DEFAULT NULL,
  KEY `division_index` (`div_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES ('A',1),('B',2);
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_name` varchar(300) DEFAULT NULL,
  `faculty_branch_id` int DEFAULT NULL,
  `faculty_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('Dr.Rais Mulla',1,100),('Dr.Pradip Mane',2,200),('Dr.Pramod Bhavarate',3,300),('Dr.Anubhav Shukla',4,400),('Archana Salaskar',2,201),('Pankaj Sir',2,101),('Vinay Pitla',4,401);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_subject_assigned`
--

DROP TABLE IF EXISTS `faculty_subject_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_subject_assigned` (
  `faculty_id` int DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `sub_code` varchar(100) DEFAULT NULL,
  `division` int DEFAULT NULL,
  `academic_year` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_subject_assigned`
--

LOCK TABLES `faculty_subject_assigned` WRITE;
/*!40000 ALTER TABLE `faculty_subject_assigned` DISABLE KEYS */;
INSERT INTO `faculty_subject_assigned` VALUES (200,'2',1,'IT201',1,'2023-2024'),(201,'2',2,'IT100',2,'1'),(201,'2',2,'IT100',1,'2023-2024');
/*!40000 ALTER TABLE `faculty_subject_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `semester` int DEFAULT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `idx_semester` (`semester`),
  KEY `semester_index` (`semester`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(200) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `division` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `branch_id` (`branch_id`),
  KEY `semester` (`semester`),
  KEY `division` (`division`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`semester`) REFERENCES `semester` (`semester`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`division`) REFERENCES `division` (`div_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John Doe',1,2,1),(2,'Jane Smith',2,3,2),(3,'Alice Johnson',1,2,2),(4,'Bob Williams',3,1,1),(5,'Eva Brown',4,3,1),(6,'Michael Davis',1,1,1),(7,'Sophia Garcia',2,2,2),(8,'Olivia Martinez',3,3,1),(9,'William Rodriguez',4,2,2),(10,'Liam Taylor',1,3,2),(11,'John Doe',1,1,1),(12,'Jane Smith',1,1,1),(13,'Alice Johnson',1,1,1),(14,'Bob Williams',1,1,1),(15,'Eva Brown',1,1,1),(16,'Michael Davis',1,1,1),(17,'Sophia Garcia',1,1,1),(18,'Olivia Martinez',1,1,1),(19,'William Rodriguez',1,1,1),(20,'Liam Taylor',1,1,1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_marks_entry`
--

DROP TABLE IF EXISTS `student_marks_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_marks_entry` (
  `student_id` varchar(200) DEFAULT NULL,
  `IA1_marks` int DEFAULT NULL,
  `IA2_marks` int DEFAULT NULL,
  `average_marks` int DEFAULT NULL,
  `student_name` varchar(200) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `division` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_marks_entry`
--

LOCK TABLES `student_marks_entry` WRITE;
/*!40000 ALTER TABLE `student_marks_entry` DISABLE KEYS */;
INSERT INTO `student_marks_entry` VALUES ('VU4F2122068',0,0,0,'Suraj Mane',2,2,2),('VU1F2122020',0,0,0,'Eshwari Rampoore',1,1,1);
/*!40000 ALTER TABLE `student_marks_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subejctdata`
--

DROP TABLE IF EXISTS `subejctdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subejctdata` (
  `subject_name` varchar(200) DEFAULT NULL,
  `subject_code` varchar(200) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subejctdata`
--

LOCK TABLES `subejctdata` WRITE;
/*!40000 ALTER TABLE `subejctdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `subejctdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_data`
--

DROP TABLE IF EXISTS `subject_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_data` (
  `subject_name` varchar(200) DEFAULT NULL,
  `subject_code` varchar(200) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_data`
--

LOCK TABLES `subject_data` WRITE;
/*!40000 ALTER TABLE `subject_data` DISABLE KEYS */;
INSERT INTO `subject_data` VALUES ('EG','CS100',1,1),('BEE','CS101',1,1),('CP','CS200',2,1),('EM-2','CS201',2,1),('BEE','IT100',2,2),('EM-1','IT201',1,2),('AIDS','AI201',1,2),('BEE-1','EX201',1,4),('AIDS','AI201',1,3),('DSA','IT202',2,2);
/*!40000 ALTER TABLE `subject_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_name` varchar(255) DEFAULT NULL,
  `subject_code` varchar(200) NOT NULL,
  `term_work` varchar(255) DEFAULT NULL,
  `oral` varchar(255) DEFAULT NULL,
  `practical` varchar(255) DEFAULT NULL,
  `theory` varchar(255) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `subject_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`subject_code`),
  UNIQUE KEY `subject_id` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES ('Maths','CS101','10','10','10','50','1',1),('EG','CS102','20','25','25','76','1',2),('CG','CSL102','20','20','20','50','1',3),('DS','CSL110','20','20','20','50','1',4),('EP-II','IT201','20','10','20','50','2',5),('EC-II','IT202','20','20','20','50','2',6),('EM-II','IT203','20','20','20','50','2',7),('CP','IT204','20','20','20','50','2',8);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('vu4f2122068@pvppcoe.ac.in','$2b$10$.O6aWDExdqebExiy.xT1Ze/Mfi9feymnHGRT6SoefECf1fHXxomH6'),('name@gmail.com','$2b$10$ASHCDykNzojj3GFiuCWD3erFXF3SuSIn7nfUG776iN0CqO/Q/z0Z2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-29 15:17:12
