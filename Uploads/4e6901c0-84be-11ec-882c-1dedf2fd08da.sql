-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: e-talk
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `account_group`
--

DROP TABLE IF EXISTS `account_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_group` (
  `Account_Group_Id` bigint NOT NULL,
  `Primary_Id` bigint DEFAULT NULL,
  `Group_Code` varchar(50) DEFAULT NULL,
  `Group_Name` varchar(2000) DEFAULT NULL,
  `Link_Left` bigint DEFAULT NULL,
  `Link_Right` bigint DEFAULT NULL,
  `Under_Group` bigint DEFAULT NULL,
  `IsPrimary` varchar(1) DEFAULT NULL,
  `CanDelete` varchar(1) DEFAULT NULL,
  `UserId` bigint DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Account_Group_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_group`
--

LOCK TABLES `account_group` WRITE;
/*!40000 ALTER TABLE `account_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `Accounts_Id` int NOT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  `Client_Id` bigint DEFAULT NULL,
  `Dr` decimal(18,2) DEFAULT NULL,
  `Cr` decimal(18,2) DEFAULT NULL,
  `Tran_Type` varchar(5) DEFAULT NULL,
  `Tran_Id` bigint DEFAULT NULL,
  `Voucher_No` bigint DEFAULT NULL,
  `VoucherType` bigint DEFAULT NULL,
  `Description1` varchar(4000) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DayBook` varchar(1) DEFAULT NULL,
  `Payment_Status` bigint DEFAULT NULL,
  PRIMARY KEY (`Accounts_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `Agent_Id` int NOT NULL,
  `Agent_Name` varchar(150) DEFAULT NULL,
  `DeleteStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Agent_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Test1','0'),(2,'Test2','0'),(3,'Test3','0');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_details`
--

DROP TABLE IF EXISTS `application_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_details` (
  `Application_details_Id` int NOT NULL,
  `Student_Id` int DEFAULT NULL,
  `Country_Id` int DEFAULT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  `University_Id` int DEFAULT NULL,
  `University_Name` varchar(150) DEFAULT NULL,
  `Course_Id` int DEFAULT NULL,
  `Course_Name` varchar(500) DEFAULT NULL,
  `intake_Id` int DEFAULT NULL,
  `intake_Name` varchar(150) DEFAULT NULL,
  `Intake_Year_Id` int DEFAULT NULL,
  `Intake_Year_Name` varchar(45) DEFAULT NULL,
  `Date_Of_Applying` datetime DEFAULT NULL,
  `Remark` varchar(450) DEFAULT NULL,
  `Application_status_Id` int DEFAULT NULL,
  `Application_Status_Name` varchar(45) DEFAULT NULL,
  `Agent_Id` int DEFAULT NULL,
  `Agent_Name` varchar(150) DEFAULT NULL,
  `Reference_No` int DEFAULT NULL,
  `Activation_Status` tinyint unsigned DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Application_details_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_details`
--

LOCK TABLES `application_details` WRITE;
/*!40000 ALTER TABLE `application_details` DISABLE KEYS */;
INSERT INTO `application_details` VALUES (1,15,3,'CANADA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',8,'August',12,'2033','2022-02-01 00:00:00','Tesing for doc',1,'Approved',0,'Select',NULL,0,0),(2,15,1,'UNITED KINGDOM',1,'University of Central Lancashire',59,'Business Administration - FT (Master of Business Administration)',9,'September',10,'2031','2022-02-01 00:00:00','rrrxxxxxxxxxxxxxxxxxxxxxxx',1,'Approved',0,'Select',NULL,1,0),(3,15,1,'UNITED KINGDOM',2,'University of East London',59,'Business Administration - FT (Master of Business Administration)',9,'September',10,'2031','2022-02-01 00:00:00','rrrxxxxxxxxxxxxxxxxxxxxxxx',1,'Approved',0,'Select',NULL,0,0),(4,15,3,'CANADA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',8,'August',12,'2033','2022-02-01 00:00:00','zzzzxxxxxxxxxxxxxxxxxxxxxxx',1,'Approved',0,'Select',NULL,0,0),(5,15,3,'CANADA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',8,'August',12,'2033','2022-02-01 00:00:00','zzzzxxxxxxxxxxxxxxxxxxxxxxx',1,'Approved',0,'Select',NULL,0,0),(6,15,3,'CANADA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',8,'August',12,'2033','2022-02-01 00:00:00','zzzzxxxxxxxxxxxxxxxxxxxxxxx',3,'Rejected',0,'Select',NULL,0,0),(7,15,4,'AUSTRALIA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',4,'April',7,'2028','2022-02-01 00:00:00','Testpass',1,'Approved',0,'Select',NULL,0,0),(8,15,3,'CANADA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',8,'August',12,'2033','2022-02-02 00:00:00','Tesing for doc',1,'Approved',0,'Select',NULL,0,0),(9,11,4,'AUSTRALIA',1,'University of Central Lancashire',28,'BSC (HONS) Business with Tourism Management',2,'February',4,'2025','2022-02-02 00:00:00','rr',3,'Rejected',0,'Select',NULL,0,0);
/*!40000 ALTER TABLE `application_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_details_history`
--

DROP TABLE IF EXISTS `application_details_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_details_history` (
  `Application_details_history_Id` int NOT NULL AUTO_INCREMENT,
  `Application_details_Id` int DEFAULT NULL,
  `Student_Id` int DEFAULT NULL,
  `Country_Id` int DEFAULT NULL,
  `Country_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `University_Id` int DEFAULT NULL,
  `University_Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Course_Id` int DEFAULT NULL,
  `Course_Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `intake_Id` int DEFAULT NULL,
  `intake_Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Intake_Year_Id` int DEFAULT NULL,
  `Intake_Year_Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Date_Of_Applying` datetime DEFAULT NULL,
  `Remark` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Application_status_Id` int DEFAULT NULL,
  `Application_Status_Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Agent_Id` int DEFAULT NULL,
  `Agent_Name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Application_details_history_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_details_history`
--

LOCK TABLES `application_details_history` WRITE;
/*!40000 ALTER TABLE `application_details_history` DISABLE KEYS */;
INSERT INTO `application_details_history` VALUES (1,2,15,1,'UNITED KINGDOM',2,'University of East London',59,'Business Administration - FT (Master of Business Administration)',9,'September',10,'2031','2022-02-01 00:00:00','rrrxxxxxxxxxxxxxxxxxxxxxxx',1,'Approved',0,'Select',0),(2,7,15,4,'AUSTRALIA',2,'University of East London',39,'BSc PARAMEDIC SCIENCE',4,'April',7,'2028','2022-02-01 00:00:00','XXXXs',3,'Rejected',0,'Select',0);
/*!40000 ALTER TABLE `application_details_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_document`
--

DROP TABLE IF EXISTS `application_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_document` (
  `Application_Document_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int DEFAULT NULL,
  `Entry_date` date DEFAULT NULL,
  `File_Name` varchar(500) DEFAULT NULL,
  `Document_Id` int DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  `Document_Name` varchar(500) DEFAULT NULL,
  `Document_File_Name` varchar(500) DEFAULT NULL,
  `Application_details_Id` int DEFAULT NULL,
  PRIMARY KEY (`Application_Document_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_document`
--

LOCK TABLES `application_document` WRITE;
/*!40000 ALTER TABLE `application_document` DISABLE KEYS */;
INSERT INTO `application_document` VALUES (37,15,NULL,'0c641dc0-83e5-11ec-a3e9-7f44982e1a39.txt',NULL,0,'Certificateappid1','Certificate.txt',1),(38,15,NULL,'0c646be0-83e5-11ec-a3e9-7f44982e1a39.txt',NULL,0,'passappid1','passport.txt',1),(39,11,NULL,'247942d0-83ec-11ec-a686-ed51c682041b.txt',NULL,0,'testdoc11','document1.txt',9);
/*!40000 ALTER TABLE `application_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_status`
--

DROP TABLE IF EXISTS `application_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_status` (
  `Application_status_Id` int NOT NULL,
  `Application_Status_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Application_status_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_status`
--

LOCK TABLES `application_status` WRITE;
/*!40000 ALTER TABLE `application_status` DISABLE KEYS */;
INSERT INTO `application_status` VALUES (1,'Approved',0),(2,'Submitt',0),(3,'Rejected',0),(4,'Pending',0);
/*!40000 ALTER TABLE `application_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `Branch_Id` int NOT NULL AUTO_INCREMENT,
  `Branch_Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PinCode` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Branch_Code` varchar(10) DEFAULT NULL,
  `Company` int DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Branch_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (36,'Kochin','AM EDUCATION CONSULTANTS PVT.','61/652 C, KARITHALA ROAD','NEAR MANORAMA JUNCTION','KOCHI','','682016','987456123','info@edabroad.in','',0,0),(37,'Alppey','gfds','mullakal','Alappuzha','kerala','india','688011','7383900283','m@gmail.com','',0,1),(38,'Kozhikode','','','','','','','','','',0,1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_department`
--

DROP TABLE IF EXISTS `branch_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_department` (
  `Branch_Department_Id` int NOT NULL AUTO_INCREMENT,
  `Branch_Id` int DEFAULT NULL,
  `Department_Id` int DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Branch_Department_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_department`
--

LOCK TABLES `branch_department` WRITE;
/*!40000 ALTER TABLE `branch_department` DISABLE KEYS */;
INSERT INTO `branch_department` VALUES (1,20,322,0),(2,29,317,0),(3,21,318,0),(4,29,318,0),(5,23,317,0),(6,20,318,0),(7,0,297,0),(8,20,323,0),(9,20,300,0),(10,21,322,0),(11,21,317,0),(12,23,300,0),(13,23,318,0),(14,23,323,0),(15,29,322,0),(16,29,300,0),(17,30,318,0),(18,30,322,0),(19,30,317,0),(20,31,317,0),(21,31,322,0),(22,32,322,0),(23,32,323,0),(24,33,318,0),(25,33,323,0),(26,33,317,0),(27,33,300,0),(28,34,300,0),(29,34,322,0),(30,34,317,0),(31,34,323,0),(32,35,318,0),(33,35,317,0),(34,36,324,0),(35,36,323,0),(36,36,300,0),(37,33,322,0),(38,34,318,0),(39,20,317,0),(40,23,322,0),(41,29,323,0),(42,21,300,0),(43,21,323,0),(44,30,323,0),(45,30,300,0),(46,31,323,0),(47,31,318,0),(48,31,300,0),(49,32,318,0),(50,32,300,0),(51,32,317,0),(52,36,317,0),(53,36,318,0),(54,36,322,0);
/*!40000 ALTER TABLE `branch_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list`
--

DROP TABLE IF EXISTS `check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_list` (
  `Check_List_Id` int NOT NULL,
  `Check_List_Name` varchar(100) DEFAULT NULL,
  `Applicable` tinyint DEFAULT NULL,
  `Checklist_Status` tinyint DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Check_List_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list`
--

LOCK TABLES `check_list` WRITE;
/*!40000 ALTER TABLE `check_list` DISABLE KEYS */;
INSERT INTO `check_list` VALUES (1,'10th Certificate',0,0,0),(2,'gfgff',0,0,1),(3,'Higher Secondary Certificate',0,0,0),(4,'Graduation Certificate',0,0,0),(5,'Master\'s Certificate',0,0,0);
/*!40000 ALTER TABLE `check_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_accounts`
--

DROP TABLE IF EXISTS `client_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_accounts` (
  `Client_Accounts_Id` int NOT NULL AUTO_INCREMENT,
  `Account_Group_Id` bigint DEFAULT NULL,
  `Client_Accounts_Code` varchar(50) DEFAULT NULL,
  `Client_Accounts_Name` varchar(500) DEFAULT NULL,
  `Client_Accounts_No` varchar(50) DEFAULT NULL,
  `Address1` varchar(250) DEFAULT NULL,
  `Address2` varchar(250) DEFAULT NULL,
  `Address3` varchar(250) DEFAULT NULL,
  `Address4` varchar(250) DEFAULT NULL,
  `PinCode` varchar(50) DEFAULT NULL,
  `StateCode` varchar(50) DEFAULT NULL,
  `GSTNo` varchar(50) DEFAULT NULL,
  `PanNo` varchar(50) DEFAULT NULL,
  `State` varchar(1000) DEFAULT NULL,
  `Country` varchar(1000) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Mobile` varchar(50) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Opening_Balance` decimal(18,2) DEFAULT NULL,
  `Description1` varchar(1000) DEFAULT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  `UserId` bigint DEFAULT NULL,
  `LedgerInclude` varchar(50) DEFAULT NULL,
  `CanDelete` varchar(2) DEFAULT NULL,
  `Commision` decimal(18,2) DEFAULT NULL,
  `Opening_Type` int DEFAULT NULL,
  `Employee_Id` bigint DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Client_Accounts_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_accounts`
--

LOCK TABLES `client_accounts` WRITE;
/*!40000 ALTER TABLE `client_accounts` DISABLE KEYS */;
INSERT INTO `client_accounts` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `client_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Company_Id` int NOT NULL,
  `companyname` varchar(45) DEFAULT NULL,
  `Phone1` varchar(45) DEFAULT NULL,
  `Phone2` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `Website` varchar(500) DEFAULT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `Address1` varchar(1000) DEFAULT NULL,
  `Address2` varchar(1000) DEFAULT NULL,
  `Address3` varchar(1000) DEFAULT NULL,
  `Is_Delete` tinyint DEFAULT NULL,
  `Logo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Edabroad','+919037900880','+919037900880','+919037900880','edabroad.in','jesna@ufstechnologies.com','Edabroad Study Abroad Consultants','61/652 C, Karithala Road,Near Manorama Junction,','Cochin, Kerala, India - 682024',0,'');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `Country_Id` int NOT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Country_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'UNITED KINGDOM',0),(2,'USA',0),(3,'CANADA',0),(4,'AUSTRALIA',0),(5,'NEWZELAND',0);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_Id` int NOT NULL,
  `Course_Name` varchar(500) DEFAULT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Subject_Id` int DEFAULT NULL,
  `Duration_Id` int DEFAULT NULL,
  `Level_Id` int DEFAULT NULL,
  `Ielts_Minimum_Score` varchar(500) DEFAULT NULL,
  `internship_Id` int DEFAULT NULL,
  `Notes` varchar(2000) DEFAULT NULL,
  `Details` varchar(2000) DEFAULT NULL,
  `Application_Fees` varchar(500) DEFAULT NULL,
  `University_Id` int DEFAULT NULL,
  `Country_Id` int DEFAULT NULL,
  `Tag` varchar(2000) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  `Course_Status` int DEFAULT NULL,
  `intake_Name` varchar(200) DEFAULT NULL,
  `Tution_Fees` varchar(200) DEFAULT NULL,
  `Entry_Requirement` varchar(500) DEFAULT NULL,
  `IELTS_Name` varchar(500) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `Living_Expense` varchar(100) DEFAULT NULL,
  `Work_Experience` varchar(500) DEFAULT NULL,
  `Registration_Fees` varchar(45) DEFAULT NULL,
  `Date_Charges` varchar(45) DEFAULT NULL,
  `Bank_Statements` varchar(45) DEFAULT NULL,
  `Insurance` varchar(45) DEFAULT NULL,
  `VFS_Charges` varchar(45) DEFAULT NULL,
  `Apostille` varchar(45) DEFAULT NULL,
  `Other_Charges` varchar(45) DEFAULT NULL,
  `Sub_Section_Id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Course_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'INTERNATIONAL BUSINESS MANAGEMENT MSc',NULL,1,1,1,'1',1,'https://admission.pwr.edu.pl/study-finder/chemistry-eng-edit1-1-9624.html',NULL,'20 Euros',1,1,NULL,0,1,'February & October','4000 Euros','Bachelors with min 55% marks','Not Required. Medium of Instruction letter is enough','2 years','5-6 lacs in credit card','Not Mandatory','10000 Rs.','15000 Rs.','15000 Rs.','7500 Rs.','12500 Rs. ','3000 Rs. per document','75000 Rs.','1'),(2,'Master of Business Administration with Advanced Practice (Including Pre-Masters)',NULL,2,2,2,'1',1,'https://www.vistula.edu.pl/en/programmes/bachelors-degree-programs/bachelor/economics',NULL,'200 Euros',2,1,NULL,0,1,'October & February','3500 Euros','12th with min 55% marks','Not Required. Medium of Instruction letter is enough','3 Years','6-7 lacs in credit card','Not Mandatory','10000 Rs.','15000 Rs.','15000 Rs.','7500 Rs.','12500 Rs. ','3000 Rs. per document','75000 Rs.','2'),(3,'INTERNATIONAL TOURISM AND HOSPITALITY MANAGEMENT BSC (HONS)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Master of Business Administration with Pre-Masters',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'MBA Healthcare Management with Pre-Masters',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Business Administration (Logistics and Supply Chain Management) - MBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'MSc Applied Public Science',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Master in Public Health',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'MSc in Public Health',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'MSc MECHATRONICS AND COMPUTER SYSTEMS ENGINEERING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'MBA WITH AP INC P-M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'GLOBAL HEALTH CARE MANAGEMENT MSc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'PUBLIC HEALTH AND WELLBEING MSc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'MSc PUBLIC HEALTH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'INTERNATIONAL BUSINESS MSC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'Occupational Health, Safety and Wellbeing Management MSc/PGDip',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'MBA WITH AP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'MSC COMPUTER SCIENCE WITH AP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'MSC INTERNATIONAL BUSINESS MANAGEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'MSC INTERNATIONAL BUSINESS WITH PLACEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'MSC COMPUTER SCIENCE WITH AP INCLUDING PRE-MASTERS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'MSC INTERNATIONAL BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'BUSINESS AND MANAGEMENT BA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'MSc PUBLIC HEALTH AND WELLBEING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'MBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'MSC IBM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'MSC MECH ENGINEERING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'BSC (HONS) Business with Tourism Management',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'GLOBAL HEALTH CARE MGMT MSC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'MPH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'MBA PLACEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'BSc (Hons) Physiotherapy (University Foundation)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'MBA WITH AP WITH P-M',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'MBA GLOBAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'EXECUTIVE MBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'MBA WITH PROFESSIONAL PLACEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'MSC APPLIED PUBLIC HEALTH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'Pharmacology and Health Science BSc (Hons)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'BSc PARAMEDIC SCIENCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'MBA - SUPPLY CAHIN MANAGEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'MSc Sports Management',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'GLOBAL MPH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'MSc. Applied food safety and Quality management',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'BUSINESS ADMINISTRATION WITH PROFESSIONAL PLACEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'MSc INTERNATIONAL BUSINESS AND MANAGEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'Master of Business Administration with professional placement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'International Business, MBA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'MSc Molecular Microbiology',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Microbiology in Public Health (15 month) MSc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'International Business Management MA/PG Dip/PG Cert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'Occupational Safety, Health & Wellbeing Masters - MSc/PgD/PgC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Safety, Health and Environment MSc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'MSc Safety, Health and Environmental Management',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'MBA WITH PLACEMENT YEAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'MBA SUPPLY CHAIN MANAGEMENT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'MSc Accounting and Finance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'MSc Finance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'MSc Occuaptional Safety, Health and Environment',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'Business Administration - FT (Master of Business Administration)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_intake`
--

DROP TABLE IF EXISTS `course_intake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_intake` (
  `course_intake_id` int NOT NULL AUTO_INCREMENT,
  `Course_Id` int DEFAULT NULL,
  `intake_Id` int DEFAULT NULL,
  `intake_Status` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`course_intake_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_intake`
--

LOCK TABLES `course_intake` WRITE;
/*!40000 ALTER TABLE `course_intake` DISABLE KEYS */;
INSERT INTO `course_intake` VALUES (4,2,3,1),(5,2,4,1),(6,1,4,1),(7,1,3,1);
/*!40000 ALTER TABLE `course_intake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_sub_section`
--

DROP TABLE IF EXISTS `course_sub_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_sub_section` (
  `course_sub_section_id` int NOT NULL AUTO_INCREMENT,
  `Course_Id` int DEFAULT NULL,
  `Sub_Section_Id` int DEFAULT NULL,
  `Sub_Section_Status` tinyint DEFAULT NULL,
  PRIMARY KEY (`course_sub_section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_sub_section`
--

LOCK TABLES `course_sub_section` WRITE;
/*!40000 ALTER TABLE `course_sub_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_sub_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_log_`
--

DROP TABLE IF EXISTS `data_log_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_log_` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Description_` varchar(5000) DEFAULT NULL,
  `data_val` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2298 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_log_`
--

LOCK TABLES `data_log_` WRITE;
/*!40000 ALTER TABLE `data_log_` DISABLE KEYS */;
INSERT INTO `data_log_` VALUES (2297,'select * from ( select * from (select * from(select CAST(CAST(1 AS UNSIGNED) AS SIGNED)as tp,student.Student_Id,\nstudent.Student_Name,student.Phone_Number,student.Remark,(Date_Format(student.Next_FollowUp_Date,\'%d-%m-%Y\')) As Next_FollowUp_Date,\nDepartment.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name User_Details_Name,\n\nCAST(CAST(ROW_NUMBER()OVER(ORDER BY student.Student_Id DESC,Student.Next_FollowUp_Date desc)AS UNSIGNED)AS SIGNED)AS\nRowNo,Branch.Branch_Name,Client_Accounts_Name,Agent_Id,student.Is_Registered,1 as User_Status,0 as more_info,Country_Name,Send_Welcome_Mail_Status\nfrom student\ninner join Department on Department.Department_Id= student.Department and student.DeleteStatus=0  and date(student.Next_FollowUp_Date) >= \'2022-02-02\' and  date(student.Next_FollowUp_Date) <= \'2022-02-02\' and((student.Branch=36 and student.user_Id=45 and  Department in(0,318,317,324,323,300,322)) or (student.Branch=36 and  student.Department in(0,318,317,324,323,300,322)) ) and department.FollowUp =1\n\ninner join Branch on Branch.Branch_Id= student.Branch\ninner join client_accounts on client_accounts.Client_Accounts_Id= student.Agent_Id\ninner join Department_Status on Department_Status.Department_Status_Id=student.Status\ninner join user_details as T on T.User_Details_Id=student.User_Id\nand T.Role_Id in(30,31,32)\nwhere student.DeleteStatus=0     \n)as lds WHERE RowNo >=1 AND RowNo<= 10  union select * from(select  CAST(CAST(2 AS UNSIGNED) AS SIGNED)   as tp,student.Student_Id,\nstudent.Student_Name,student.Phone_Number,student.Remark,(Date_Format(student.Next_FollowUp_Date,\'%d-%m-%Y\')) As Next_FollowUp_Date,\nDepartment.Department_Name,Department.FollowUp,Department_Status.Department_Status_Name,T.User_Details_Name User_Details_Name,\n\nCAST(CAST(ROW_NUMBER()OVER(ORDER BY student.Student_Id DESC,Student.Next_FollowUp_Date desc)AS UNSIGNED)AS SIGNED)AS\nRowNo,Branch.Branch_Name,Client_Accounts_Name,Agent_Id,student.Is_Registered,1 as User_Status,0 as more_info,Country_Name,Send_Welcome_Mail_Status\n\n\n\nfrom student\ninner join Department on Department.Department_Id= student.Department and department.FollowUp=1 and student.DeleteStatus=0  and  date(student.Next_FollowUp_Date) < \'2022-02-02\' and((student.Branch=36 and student.user_Id=45 and  Department in(0,318,317,324,323,300,322)) or (student.Branch=36 and  student.Department in(0,318,317,324,323,300,322)) )\n\ninner join Branch on Branch.Branch_Id= student.Branch\ninner join client_accounts on client_accounts.Client_Accounts_Id= student.Agent_Id\ninner join Department_Status on Department_Status.Department_Status_Id=student.Status\ninner join user_details as T on T.User_Details_Id=student.User_Id\nand T.Role_Id in(30,31,32)\nwhere student.DeleteStatus=0      and  date(student.Next_FollowUp_Date) < \'2022-02-02\'\n)as lds WHERE RowNo >=1 AND RowNo<= 10\n)as ldtwo order by tp, RowNo LIMIT 10) as ldthree \n\n \n\nunion \nselect 3 tp,count(student.Student_Id) Student_Id,Student_Name\'\',\'\',\'\', now(),\'\',1,\'\',\'\',1,\'\',\'\',1,1,1,1,\'\',\'\' \nfrom student\ninner join Department on Department.Department_Id= student.Department  and((student.Branch=36 and student.user_Id=45 and  Department in(0,318,317,324,323,300,322)) or (student.Branch=36 and  student.Department in(0,318,317,324,323,300,322)) )\ninner join user_details on user_details.User_Details_Id=student.Created_By  and user_details.Role_Id in(30,31,32)\nwhere student.DeleteStatus=0 and department.FollowUp=1    and date(student.Next_FollowUp_Date) <\'2022-02-02\'\n union\nselect 4 tp,count(student.Student_Id) Student_Id,Student_Name\'\'\n,\'\',\'\', now(),\'\',1,\'\',\'\',1,\'\',\'\',1,1,1,1,\'\',\'\' \n\nfrom student\ninner join Department on Department.Department_Id= student.Department   and date(student.Next_FollowUp_Date) >= \'2022-02-02\' and  date(student.Next_FollowUp_Date) <= \'2022-02-02\'and((student.Branch=36 and student.user_Id=45 and  Department in(0,318,317,324,323,300,322)) or (student.Branch=36 and  student.Department in(0,318,317,324,323,300,322)) )\ninner join user_details on user_details.User_Details_Id=student.Created_By\nand user_details.Role_Id in(30,31,32) \nwhere student.DeleteStatus=0 and department.FollowUp=1   \norder by tp ,Next_FollowUp_Date\n\n','');
/*!40000 ALTER TABLE `data_log_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_logs`
--

DROP TABLE IF EXISTS `data_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_logs` (
  `id` int NOT NULL,
  `Description_` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_logs`
--

LOCK TABLES `data_logs` WRITE;
/*!40000 ALTER TABLE `data_logs` DISABLE KEYS */;
INSERT INTO `data_logs` VALUES (0,'1');
/*!40000 ALTER TABLE `data_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department_Id` int NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(50) DEFAULT NULL,
  `FollowUp` tinyint unsigned DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Department_Order` int DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Department_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (300,'Marketing',1,'deactive',4,'',0),(317,'Admission',1,'active',2,'',0),(318,'Accounts',1,'active',1,'',0),(322,'Visa',1,'active',5,'',0),(323,'Follow Up',1,'active',3,'',0),(324,'Closed',0,'active',6,'',0),(325,'Internshipsnewedit',1,'',0,'',0),(326,'New',1,'',1,'',1),(327,'dep1',1,'',6,'',1),(328,'Department 1',1,'',6,'',0),(329,'dep1',1,'',0,'',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_status`
--

DROP TABLE IF EXISTS `department_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_status` (
  `Department_Status_Id` int NOT NULL AUTO_INCREMENT,
  `Department_Status_Name` varchar(50) DEFAULT NULL,
  `Status_Order` int DEFAULT NULL,
  `Editable` tinyint unsigned DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Department_Status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_status`
--

LOCK TABLES `department_status` WRITE;
/*!40000 ALTER TABLE `department_status` DISABLE KEYS */;
INSERT INTO `department_status` VALUES (135,'Interested',1,0,'',0),(136,'Not Interested',1,0,'',0),(138,'Payment Received',1,0,'',0),(139,'Payment Pending',1,0,'',0),(140,'Unknown',1,0,'',0),(141,'Disqualified',1,0,'',0),(142,'Not enough fund',1,0,'',0),(143,'Joined',1,0,'',0),(144,'inactive',0,0,'',0),(145,'IM',0,0,'',0),(146,'out',0,0,'',1),(147,'status1',0,0,'',0);
/*!40000 ALTER TABLE `department_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `Document_Id` int NOT NULL AUTO_INCREMENT,
  `Document_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Document_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (7,'SSLC Certificate',0),(8,'+2 Certificate',0),(9,'B.Tech Certificate',0),(10,'Degree Certificate',0),(80,'Refund Application',0);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duplicate_students`
--

DROP TABLE IF EXISTS `duplicate_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duplicate_students` (
  `Duplicate_student_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int NOT NULL,
  `Student_Name` varchar(100) DEFAULT NULL,
  `Mobile` varchar(100) NOT NULL,
  `By_User_Name` varchar(100) DEFAULT NULL,
  `Master_Id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Duplicate_student_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duplicate_students`
--

LOCK TABLES `duplicate_students` WRITE;
/*!40000 ALTER TABLE `duplicate_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `duplicate_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duration`
--

DROP TABLE IF EXISTS `duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duration` (
  `Duration_Id` int NOT NULL,
  `Duration_Name` varchar(50) DEFAULT NULL,
  `Selection` tinyint DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Duration_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duration`
--

LOCK TABLES `duration` WRITE;
/*!40000 ALTER TABLE `duration` DISABLE KEYS */;
INSERT INTO `duration` VALUES (1,'2 years',1,0),(2,'3 Years',1,0);
/*!40000 ALTER TABLE `duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_details`
--

DROP TABLE IF EXISTS `employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_details` (
  `Employee_Details_Id` int NOT NULL AUTO_INCREMENT,
  `Client_Accounts_Id` bigint DEFAULT NULL,
  `Level_Id` bigint DEFAULT NULL,
  `DesigId` bigint DEFAULT NULL,
  `dateOfBirth` datetime(6) DEFAULT NULL,
  `dateOfJoin` datetime(6) DEFAULT NULL,
  `Releivedate` datetime(6) DEFAULT NULL,
  `WorkingStatus` varchar(100) DEFAULT NULL,
  `Locations` varchar(4000) DEFAULT NULL,
  `Manager_Id` int DEFAULT NULL,
  `Is_SalesMan` tinyint unsigned DEFAULT NULL,
  `Can_Delete` tinyint unsigned DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Employee_Details_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_details`
--

LOCK TABLES `employee_details` WRITE;
/*!40000 ALTER TABLE `employee_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry_source`
--

DROP TABLE IF EXISTS `enquiry_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiry_source` (
  `Enquiry_Source_Id` int NOT NULL AUTO_INCREMENT,
  `Enquiry_Source_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Enquiry_Source_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry_source`
--

LOCK TABLES `enquiry_source` WRITE;
/*!40000 ALTER TABLE `enquiry_source` DISABLE KEYS */;
INSERT INTO `enquiry_source` VALUES (32,'Website',0),(33,'Phone',0),(40,'Advertisement',0),(45,'Walkin',0),(46,'Sulekha',0),(47,'Facebook Campaign',0),(48,'Google Adwords',0),(49,'Quikr',0),(50,'Sitefolk',0),(51,'Youtube Campaign',0),(52,'instagram',1),(53,'new',0);
/*!40000 ALTER TABLE `enquiry_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `Fees_Id` int NOT NULL AUTO_INCREMENT,
  `Fees_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Fees_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,'Registration',0),(2,'Exam',0),(3,'Semester',0),(4,'Tag',0),(5,'Food',0),(6,'appfee',1),(7,'Mid',1);
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_receipt`
--

DROP TABLE IF EXISTS `fees_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_receipt` (
  `Fees_Receipt_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int DEFAULT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  `User_Id` int DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Fees_Id` int DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Actual_Entry_date` datetime(6) DEFAULT NULL,
  `Delete_Status` tinyint DEFAULT NULL,
  `Fee_Receipt_Branch` int DEFAULT NULL,
  `Voucher_No` int DEFAULT NULL,
  PRIMARY KEY (`Fees_Receipt_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_receipt`
--

LOCK TABLES `fees_receipt` WRITE;
/*!40000 ALTER TABLE `fees_receipt` DISABLE KEYS */;
INSERT INTO `fees_receipt` VALUES (1,24613,'2021-07-01 00:00:00.000000',45,'semester fee',2,170,'2021-07-01 17:25:55.000000',1,36,NULL),(2,24276,'2021-08-10 00:00:00.000000',45,'Exam fees paid',2,600,'2021-08-10 11:18:36.000000',0,36,1),(3,24615,'2021-08-10 00:00:00.000000',45,'Paid',5,150000,'2021-08-10 11:56:03.000000',0,36,2),(4,24643,'2021-08-11 00:00:00.000000',45,'Paid',5,600,'2021-08-11 17:58:24.000000',0,36,3),(5,2,'2021-09-18 00:00:00.000000',45,'Register',1,600,'2021-09-18 17:32:14.000000',0,36,4),(6,2,'2021-09-18 00:00:00.000000',45,'',1,600,'2021-09-18 17:32:21.000000',0,36,5),(7,1,'2021-10-14 00:00:00.000000',45,'12',1,1234,'2021-10-14 15:20:59.000000',0,36,6),(8,1,'2021-10-15 00:00:00.000000',45,'Amount paid ',3,10000,'2021-10-15 14:25:15.000000',0,36,7),(9,1,'2021-10-15 00:00:00.000000',45,'Description',1,29000,'2021-10-15 15:06:43.000000',0,36,8),(10,35,'2021-12-10 00:00:00.000000',45,'234',5,12000,'2021-12-10 21:05:58.000000',0,36,9),(11,35,'2021-12-10 00:00:00.000000',45,'yuyu',5,7878,'2021-12-10 22:24:18.000000',0,36,10),(12,8,'2022-01-18 00:00:00.000000',45,'test',5,1000,'2022-01-18 23:20:30.000000',0,36,11),(13,8,'2022-01-19 00:00:00.000000',45,'test',5,1000,'2022-01-19 15:50:11.000000',0,36,12),(14,19,'2022-01-24 00:00:00.000000',45,'12',2,120000,'2022-01-24 10:59:19.000000',0,36,13),(15,15,'2022-02-01 00:00:00.000000',45,'test',2,1000,'2022-02-01 14:44:45.000000',0,36,14);
/*!40000 ALTER TABLE `fees_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ielts`
--

DROP TABLE IF EXISTS `ielts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ielts` (
  `Ielts_Id` int NOT NULL,
  `Ielts_Name` varchar(500) DEFAULT NULL,
  `Minimum_Score` varchar(500) DEFAULT NULL,
  `Maximum_Score` varchar(500) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Ielts_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ielts`
--

LOCK TABLES `ielts` WRITE;
/*!40000 ALTER TABLE `ielts` DISABLE KEYS */;
INSERT INTO `ielts` VALUES (1,'Not Required. Medium of Instruction letter is enough','Not Required. Medium of Instruction letter is enough','Not Required. Medium of Instruction letter is enough',0);
/*!40000 ALTER TABLE `ielts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ielts_mode`
--

DROP TABLE IF EXISTS `ielts_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ielts_mode` (
  `Ielts_Id` int NOT NULL,
  `Ielts_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Ielts_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ielts_mode`
--

LOCK TABLES `ielts_mode` WRITE;
/*!40000 ALTER TABLE `ielts_mode` DISABLE KEYS */;
INSERT INTO `ielts_mode` VALUES (1,'Yes',0),(2,'No',0);
/*!40000 ALTER TABLE `ielts_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_detail`
--

DROP TABLE IF EXISTS `import_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_detail` (
  `Import_Detail_Id` int NOT NULL AUTO_INCREMENT,
  `Import_Master_Id` int DEFAULT NULL,
  `Course_Id` int DEFAULT NULL,
  PRIMARY KEY (`Import_Detail_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_detail`
--

LOCK TABLES `import_detail` WRITE;
/*!40000 ALTER TABLE `import_detail` DISABLE KEYS */;
INSERT INTO `import_detail` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,3,1),(6,3,2),(7,3,3),(8,6,5),(9,6,6),(10,6,7),(11,6,8),(12,6,9),(13,6,10),(14,6,11),(15,6,12),(16,6,13),(17,7,1),(18,7,2),(19,7,3),(20,7,4),(21,7,5),(22,7,6),(23,7,7),(24,7,8),(25,7,9),(26,8,1),(27,8,2),(28,8,3),(29,8,4),(30,8,5),(31,8,6),(32,8,7),(33,8,8),(34,8,9),(35,9,1),(36,9,2),(37,9,3),(38,9,4),(39,9,5),(40,9,6),(41,9,7),(42,9,8),(43,9,9),(44,10,1),(45,10,2),(46,10,3),(47,10,4),(48,10,5),(49,10,6),(50,10,7),(51,10,8),(52,10,9),(53,11,1),(54,11,2),(55,11,3),(56,11,4),(57,11,5),(58,11,6),(59,11,7),(60,11,8),(61,11,9),(62,12,1),(63,12,2),(64,12,3),(65,12,4),(66,12,5),(67,12,6),(68,12,7),(69,12,8),(70,12,9),(71,12,10),(72,13,11),(73,13,12),(74,13,13),(75,13,14),(76,13,15),(77,13,16),(78,13,17),(79,13,7),(80,13,18),(81,13,19),(82,14,20),(83,14,21),(84,14,22),(85,14,23),(86,14,24),(87,14,25),(88,14,26),(89,14,27),(90,14,28),(91,14,29),(92,15,30),(93,15,31),(94,15,32),(95,15,32),(96,15,33),(97,15,33),(98,15,34),(99,15,35),(100,15,36),(101,15,37),(102,16,38),(103,17,39),(104,16,38),(105,17,40),(106,16,41),(107,17,42),(108,16,43),(109,17,44),(110,16,45),(111,17,46),(112,16,47),(113,17,48),(114,16,47),(115,17,49),(116,16,50),(117,17,51),(118,16,52),(119,17,53),(120,16,54),(121,17,55),(122,18,56),(123,19,57),(124,18,58),(125,19,59),(126,18,60),(127,19,53),(128,18,61),(129,18,62),(130,19,63),(131,18,64),(132,19,65),(133,18,39),(134,19,66),(135,18,40),(136,19,67),(137,18,68),(138,19,69),(139,18,70),(140,19,71),(141,19,72),(142,20,73),(143,20,74),(144,21,75),(145,20,76),(146,21,77),(147,20,78),(148,21,79),(149,20,80),(150,21,81),(151,20,82),(152,21,83),(153,21,84),(154,22,85),(155,21,86),(156,22,87),(157,21,88),(158,22,89),(159,21,90),(160,22,91),(161,21,92),(162,22,93),(163,22,94),(164,23,95),(165,22,96),(166,22,97),(167,23,98),(168,26,99),(169,22,101),(170,27,100),(171,23,103),(172,28,102),(173,26,105),(174,22,106),(175,29,104),(176,27,107),(177,28,108),(178,26,109),(179,29,110),(180,26,112),(181,28,111),(182,26,113),(183,29,114),(184,26,115),(185,29,108),(186,26,116),(187,29,117),(188,26,118),(189,26,120),(190,29,119),(191,26,121),(192,29,122),(193,29,123),(194,29,124),(195,29,125),(196,30,1),(197,30,2),(198,30,3),(199,30,4),(200,30,5),(201,30,6),(202,30,7),(203,30,8),(204,30,9),(205,30,10),(206,30,11),(207,30,12),(208,30,13),(209,30,14),(210,30,15),(211,30,16),(212,30,17),(213,30,7),(214,30,18),(215,30,19),(216,30,20),(217,30,21),(218,30,22),(219,30,23),(220,30,24),(221,30,25),(222,30,26),(223,30,27),(224,30,28),(225,30,29),(226,30,30),(227,30,31),(228,30,32),(229,30,32),(230,30,33),(231,30,33),(232,30,34),(233,30,35),(234,30,36),(235,30,37),(236,30,38),(237,30,38),(238,30,39),(239,30,40),(240,30,41),(241,30,42),(242,30,42),(243,30,43),(244,30,44),(245,30,45),(246,30,46),(247,30,47),(248,30,48),(249,30,49),(250,30,50),(251,30,51),(252,30,52),(253,30,53),(254,30,54),(255,30,55),(256,30,52),(257,30,53),(258,30,56),(259,30,57),(260,30,58),(261,30,59),(262,30,60),(263,30,61),(264,30,62),(265,30,63),(266,30,64),(267,30,65),(268,30,62),(269,30,66),(270,30,67),(271,30,68),(272,30,69),(273,30,70),(274,30,71),(275,30,72),(276,30,73),(277,30,74),(278,30,75),(279,30,76),(280,30,77),(281,30,78),(282,30,79),(283,30,80),(284,30,81),(285,30,82),(286,30,83),(287,30,84),(288,30,85),(289,30,86),(290,30,87),(291,30,88),(292,30,89),(293,30,90),(294,30,91),(295,30,92),(296,31,93),(297,31,94),(298,31,95),(299,31,96),(300,31,97),(301,31,98),(302,31,99),(303,31,100),(304,31,101),(305,31,102),(306,31,103),(307,31,104),(308,31,105),(309,31,94),(310,31,106),(311,31,107),(312,31,108),(313,31,109),(314,31,110),(315,31,111),(316,31,112),(317,31,113),(318,31,114),(319,31,115),(320,31,116),(321,32,1),(322,32,2),(323,32,3),(324,32,4),(325,32,5),(326,32,6),(327,32,7),(328,32,8),(329,32,9),(330,32,10),(331,33,11),(332,33,12),(333,33,13),(334,33,14),(335,33,15),(336,33,16),(337,33,17),(338,33,7),(339,33,18),(340,33,19),(341,34,20),(342,34,21),(343,34,22),(344,34,23),(345,34,24),(346,34,25),(347,34,26),(348,34,27),(349,34,28),(350,34,29),(351,35,30),(352,35,31),(353,35,32),(354,35,32),(355,35,33),(356,35,33),(357,35,34),(358,35,35),(359,35,36),(360,35,37),(361,36,38),(362,36,38),(363,36,39),(364,36,40),(365,36,41),(366,36,42),(367,36,42),(368,36,43),(369,36,44),(370,36,45),(371,37,46),(372,37,47),(373,37,48),(374,37,49),(375,37,50),(376,37,51),(377,37,52),(378,37,53),(379,37,54),(380,37,55),(381,38,52),(382,38,53),(383,38,56),(384,38,57),(385,38,58),(386,38,59),(387,38,60),(388,38,61),(389,38,62),(390,38,63),(391,39,64),(392,39,65),(393,39,62),(394,39,66),(395,39,67),(396,39,68),(397,39,69),(398,39,70),(399,39,71),(400,39,72),(401,40,73),(402,40,74),(403,40,75),(404,40,76),(405,40,77),(406,40,78),(407,40,79),(408,40,80),(409,40,81),(410,40,82),(411,41,83),(412,41,84),(413,41,85),(414,41,86),(415,41,87),(416,41,88),(417,41,89),(418,41,90),(419,41,91),(420,41,92),(421,42,117),(422,42,118),(423,42,119),(424,42,120),(425,42,121),(426,42,122),(427,42,123),(428,42,124),(429,42,125),(430,42,126),(431,43,127),(432,43,128),(433,43,129),(434,43,130),(435,43,131),(436,43,132),(437,43,133),(438,43,134),(439,43,135),(440,43,136),(441,44,137),(442,44,138),(443,44,132),(444,44,139),(445,44,140),(446,44,141),(447,44,142),(448,44,143),(449,44,144),(450,44,142),(451,45,145),(452,45,146),(453,45,147),(454,45,148),(455,45,149),(456,45,150),(457,45,151),(458,45,152),(459,45,153),(460,45,154),(461,46,155),(462,46,156),(463,46,157),(464,46,158),(465,46,159),(466,46,160),(467,46,161),(468,46,162),(469,46,163),(470,46,164),(471,47,165),(472,47,166),(473,47,167),(474,47,168),(475,47,169),(476,47,170),(477,47,171),(478,47,172),(479,47,173),(480,47,174),(481,48,175),(482,48,176),(483,48,177),(484,48,178),(485,48,179),(486,48,178),(487,48,180),(488,48,181),(489,48,182),(490,48,183),(491,49,184),(492,49,180),(493,49,185),(494,49,186),(495,49,187),(496,49,188),(497,49,189),(498,49,190),(499,49,191),(500,49,192),(501,50,193),(502,50,194),(503,50,195),(504,50,196),(505,50,197),(506,50,198),(507,50,199),(508,50,200),(509,50,201),(510,50,202),(511,51,203),(512,51,204),(513,51,205),(514,51,206),(515,51,207),(516,51,208),(517,51,209),(518,51,210),(519,51,211),(520,51,212),(521,52,93),(522,52,94),(523,52,95),(524,52,96),(525,52,97),(526,52,98),(527,52,99),(528,52,100),(529,52,101),(530,52,102),(531,53,103),(532,53,104),(533,53,105),(534,53,94),(535,53,106),(536,53,107),(537,53,108),(538,53,109),(539,53,110),(540,53,111),(541,54,1),(542,54,2),(543,54,3),(544,54,4),(545,54,5),(546,54,6),(547,54,7),(548,54,8),(549,54,9),(550,54,10),(551,55,11),(552,55,12),(553,55,13),(554,55,14),(555,55,15),(556,55,16),(557,55,17),(558,55,7),(559,55,18),(560,55,19),(561,56,20),(562,56,21),(563,56,22),(564,56,23),(565,56,24),(566,56,25),(567,56,26),(568,56,27),(569,56,28),(570,56,29),(571,57,30),(572,57,31),(573,57,32),(574,57,32),(575,57,33),(576,57,33),(577,57,34),(578,57,35),(579,57,36),(580,57,37),(581,58,38),(582,58,38),(583,58,39),(584,58,40),(585,58,41),(586,58,42),(587,58,42),(588,58,43),(589,58,44),(590,58,45),(591,59,46),(592,59,47),(593,59,48),(594,59,49),(595,59,50),(596,59,51),(597,59,52),(598,59,53),(599,59,54),(600,59,55),(601,60,52),(602,60,53),(603,60,56),(604,60,57),(605,60,58),(606,60,59),(607,60,60),(608,60,61),(609,60,62),(610,60,63),(611,61,64),(612,61,65),(613,61,62),(614,61,66),(615,61,67),(616,61,68),(617,61,69),(618,61,70),(619,61,71),(620,61,72),(621,62,73),(622,62,74),(623,62,75),(624,62,76),(625,62,77),(626,62,78),(627,62,79),(628,62,80),(629,62,81),(630,62,82),(631,63,83),(632,63,84),(633,63,85),(634,63,86),(635,63,87),(636,63,88),(637,63,89),(638,63,90),(639,63,91),(640,63,92),(641,64,1),(642,64,2),(643,64,3),(644,64,4),(645,64,5),(646,64,6),(647,64,7),(648,64,8),(649,64,9),(650,64,10),(651,65,11),(652,65,12),(653,65,13),(654,65,14),(655,65,15),(656,65,16),(657,65,17),(658,65,7),(659,65,18),(660,65,19),(661,66,1),(662,66,2),(663,66,3),(664,66,4),(665,66,5),(666,66,6),(667,66,7),(668,66,8),(669,66,9),(670,66,10),(671,67,11),(672,67,12),(673,67,13),(674,67,14),(675,67,15),(676,67,16),(677,67,17),(678,67,7),(679,67,18),(680,67,19),(681,68,1),(682,68,2),(683,68,3),(684,68,4),(685,68,5),(686,68,6),(687,68,7),(688,68,8),(689,68,9),(690,68,10),(691,69,11),(692,69,12),(693,69,13),(694,69,14),(695,69,15),(696,69,16),(697,69,17),(698,69,7),(699,69,18),(700,69,19),(701,70,20),(702,70,21),(703,70,22),(704,70,23),(705,70,24),(706,70,25),(707,70,26),(708,70,27),(709,70,28),(710,70,29),(711,71,30),(712,71,31),(713,71,32),(714,71,32),(715,71,33),(716,71,33),(717,71,34),(718,71,35),(719,71,36),(720,71,37),(721,72,38),(722,72,38),(723,72,39),(724,72,40),(725,72,41),(726,72,42),(727,72,42),(728,72,43),(729,72,44),(730,72,45),(731,73,46),(732,73,47),(733,73,48),(734,73,49),(735,73,50),(736,73,51),(737,73,52),(738,73,53),(739,73,54),(740,73,55),(741,74,52),(742,74,53),(743,74,56),(744,74,57),(745,74,58),(746,74,59),(747,74,60),(748,74,61),(749,74,62),(750,74,63),(751,75,64),(752,75,65),(753,75,62),(754,75,66),(755,75,67),(756,75,68),(757,75,69),(758,75,70),(759,75,71),(760,75,72),(761,76,73),(762,76,74),(763,76,75),(764,76,76),(765,76,77),(766,76,78),(767,76,79),(768,76,80),(769,76,81),(770,76,82),(771,77,83),(772,77,84),(773,77,85),(774,77,86),(775,77,87),(776,77,88),(777,77,89),(778,77,90),(779,77,91),(780,77,92),(781,78,1),(782,78,2),(783,78,3),(784,78,4),(785,78,5),(786,78,6),(787,78,7),(788,78,8),(789,78,9),(790,78,10),(791,79,11),(792,79,12),(793,79,13),(794,79,14),(795,79,15),(796,79,16),(797,79,17),(798,79,7),(799,79,18),(800,79,19),(801,80,20),(802,80,21),(803,80,22),(804,80,23),(805,80,24),(806,80,25),(807,80,26),(808,80,27),(809,80,28),(810,80,29),(811,81,30),(812,81,31),(813,81,32),(814,81,32),(815,81,33),(816,81,33),(817,81,34),(818,81,35),(819,81,36),(820,81,37),(821,82,38),(822,82,38),(823,82,39),(824,82,40),(825,82,41),(826,82,42),(827,82,42),(828,82,43),(829,82,44),(830,82,45),(831,83,46),(832,83,47),(833,83,48),(834,83,49),(835,83,50),(836,83,51),(837,83,52),(838,83,53),(839,83,54),(840,83,55),(841,84,52),(842,84,53),(843,84,56),(844,84,57),(845,84,58),(846,84,59),(847,84,60),(848,84,61),(849,84,62),(850,84,63),(851,85,64),(852,85,65),(853,85,62),(854,85,66),(855,85,67),(856,85,68),(857,85,69),(858,85,70),(859,85,71),(860,85,72),(861,86,73),(862,86,74),(863,86,75),(864,86,76),(865,86,77),(866,86,78),(867,86,79),(868,86,80),(869,86,81),(870,86,82),(871,87,83),(872,87,84),(873,87,85),(874,87,86),(875,87,87),(876,87,88),(877,87,89),(878,87,90),(879,87,91),(880,87,92),(881,88,1),(882,88,2),(883,88,3),(884,88,4),(885,88,5),(886,88,6),(887,88,7),(888,88,8),(889,88,9),(890,88,10),(891,89,11),(892,89,12),(893,89,13),(894,89,14),(895,89,15),(896,89,16),(897,89,17),(898,89,18),(899,89,19),(900,89,20),(901,90,21),(902,90,22),(903,90,23),(904,90,24),(905,90,25),(906,90,26),(907,90,27),(908,90,28),(909,90,29),(910,90,30),(911,91,31),(912,91,32),(913,91,33),(914,91,34),(915,91,35),(916,91,35),(917,91,36),(918,91,37),(919,91,38),(920,91,39),(921,92,40),(922,92,41),(923,92,42),(924,92,43),(925,92,44),(926,92,45),(927,92,45),(928,92,46),(929,92,47),(930,92,48),(931,93,49),(932,93,50),(933,93,51),(934,93,52),(935,93,53),(936,93,54),(937,93,55),(938,93,56),(939,93,57),(940,93,58),(941,94,59),(942,94,60),(943,94,61),(944,94,62),(945,94,63),(946,94,64),(947,94,65),(948,94,66),(949,94,67),(950,94,68),(951,95,69),(952,95,70),(953,95,71),(954,95,72),(955,95,73),(956,95,74),(957,95,75),(958,95,76),(959,95,77),(960,95,78),(961,96,79),(962,96,80),(963,96,81),(964,96,82),(965,96,83),(966,96,84),(967,96,85),(968,96,86),(969,96,87),(970,96,88),(971,97,89),(972,97,90),(973,97,91),(974,97,92),(975,97,93),(976,97,94),(977,97,95),(978,97,96),(979,97,97),(980,97,98),(981,98,99),(982,98,100),(983,98,101),(984,98,102),(985,98,103),(986,98,104),(987,98,105),(988,98,106),(989,98,107),(990,98,108),(991,99,109),(992,99,110),(993,99,111),(994,99,112),(995,99,113),(996,99,114),(997,99,115),(998,99,116),(999,99,117),(1000,99,118),(1001,100,119),(1002,100,120),(1003,100,121),(1004,100,122),(1005,100,123),(1006,100,124),(1007,100,125),(1008,100,126),(1009,100,127),(1010,100,128),(1011,101,129),(1012,101,130),(1013,101,131),(1014,101,132),(1015,101,133),(1016,101,134),(1017,101,135),(1018,101,136),(1019,101,137),(1020,101,138),(1021,102,139),(1022,102,140),(1023,102,141),(1024,102,142),(1025,102,143),(1026,102,144),(1027,102,145),(1028,102,146),(1029,102,147),(1030,102,148),(1031,103,149),(1032,103,150),(1033,103,151),(1034,103,152),(1035,103,153),(1036,103,154),(1037,103,155),(1038,103,156),(1039,103,157),(1040,103,158),(1041,104,159),(1042,104,160),(1043,104,161),(1044,104,162),(1045,104,163),(1046,104,164),(1047,104,165),(1048,104,166),(1049,104,167),(1050,104,168),(1051,105,169),(1052,105,170),(1053,105,171),(1054,105,172),(1055,105,173),(1056,105,174),(1057,105,175),(1058,105,176),(1059,105,177),(1060,105,178),(1061,106,179),(1062,106,180),(1063,106,181),(1064,106,182),(1065,106,183),(1066,106,184),(1067,106,185),(1068,106,186),(1069,106,187),(1070,106,188),(1071,107,189),(1072,107,190),(1073,107,191),(1074,107,192),(1075,107,193),(1076,107,194),(1077,107,195),(1078,107,196),(1079,107,197),(1080,107,198),(1081,108,199),(1082,108,200),(1083,108,201),(1084,108,202),(1085,108,203),(1086,108,204),(1087,108,205),(1088,108,206),(1089,108,207),(1090,108,208),(1091,109,209),(1092,109,210),(1093,109,211),(1094,109,200),(1095,109,212),(1096,109,213),(1097,109,214),(1098,109,215),(1099,109,216),(1100,109,217),(1101,110,1),(1102,110,2),(1103,110,3),(1104,110,4),(1105,110,5),(1106,110,6),(1107,110,7),(1108,110,8),(1109,110,9),(1110,110,10),(1111,111,11),(1112,111,12),(1113,111,13),(1114,111,14),(1115,111,15),(1116,111,16),(1117,111,17),(1118,111,18),(1119,111,19),(1120,111,20),(1121,112,21),(1122,112,22),(1123,112,23),(1124,112,24),(1125,112,25),(1126,112,26),(1127,112,27),(1128,112,28),(1129,112,29),(1130,112,30),(1131,113,31),(1132,113,32),(1133,113,33),(1134,113,34),(1135,113,35),(1136,113,35),(1137,113,36),(1138,113,37),(1139,113,38),(1140,113,39),(1141,114,40),(1142,114,41),(1143,114,42),(1144,114,43),(1145,114,44),(1146,114,45),(1147,114,45),(1148,114,46),(1149,114,47),(1150,114,48),(1151,115,49),(1152,115,50),(1153,115,51),(1154,115,52),(1155,115,53),(1156,115,54),(1157,115,55),(1158,115,56),(1159,115,57),(1160,115,58),(1161,116,59),(1162,116,60),(1163,116,61),(1164,116,62),(1165,116,63),(1166,116,64),(1167,116,65),(1168,116,66),(1169,116,67),(1170,116,68),(1171,117,69),(1172,117,70),(1173,117,71),(1174,117,72),(1175,117,73),(1176,117,74),(1177,117,75),(1178,117,76),(1179,117,77),(1180,117,78),(1181,118,79),(1182,118,80),(1183,118,81),(1184,118,82),(1185,118,83),(1186,118,84),(1187,118,85),(1188,118,86),(1189,118,87),(1190,118,88),(1191,119,89),(1192,119,90),(1193,119,91),(1194,119,92),(1195,119,93),(1196,119,94),(1197,119,95),(1198,119,96),(1199,119,97),(1200,119,98),(1201,120,99),(1202,120,100),(1203,120,101),(1204,120,102),(1205,120,103),(1206,120,104),(1207,120,105),(1208,120,106),(1209,120,107),(1210,120,108),(1211,121,109),(1212,121,110),(1213,121,111),(1214,121,112),(1215,121,113),(1216,121,114),(1217,121,115),(1218,121,116),(1219,121,117),(1220,121,118),(1221,122,119),(1222,122,120),(1223,122,121),(1224,122,122),(1225,122,123),(1226,122,124),(1227,122,125),(1228,122,126),(1229,122,127),(1230,122,128),(1231,123,129),(1232,123,130),(1233,123,131),(1234,123,132),(1235,123,133),(1236,123,134),(1237,123,135),(1238,123,136),(1239,123,137),(1240,123,138),(1241,124,139),(1242,124,140),(1243,124,141),(1244,124,142),(1245,124,143),(1246,124,144),(1247,124,145),(1248,124,146),(1249,124,147),(1250,124,148),(1251,125,149),(1252,125,150),(1253,125,151),(1254,125,152),(1255,125,153),(1256,125,154),(1257,125,155),(1258,125,156),(1259,125,157),(1260,125,158),(1261,126,159),(1262,126,160),(1263,126,161),(1264,126,162),(1265,126,163),(1266,126,164),(1267,126,165),(1268,126,166),(1269,126,167),(1270,126,168),(1271,127,169),(1272,127,170),(1273,127,171),(1274,127,172),(1275,127,173),(1276,127,174),(1277,127,175),(1278,127,176),(1279,127,177),(1280,127,178),(1281,128,179),(1282,128,180),(1283,128,181),(1284,128,182),(1285,128,183),(1286,128,184),(1287,128,185),(1288,128,186),(1289,128,187),(1290,128,188),(1291,129,189),(1292,129,190),(1293,129,191),(1294,129,192),(1295,129,193),(1296,129,194),(1297,129,195),(1298,129,196),(1299,129,197),(1300,129,198),(1301,130,199),(1302,130,200),(1303,130,201),(1304,130,202),(1305,130,203),(1306,130,204),(1307,130,205),(1308,130,206),(1309,130,207),(1310,130,208),(1311,131,209),(1312,131,210),(1313,131,211),(1314,131,200),(1315,131,212),(1316,131,213),(1317,131,214),(1318,131,215),(1319,131,216),(1320,131,217),(1321,132,1),(1322,132,2),(1323,132,3),(1324,132,4),(1325,132,5),(1326,132,6),(1327,132,7),(1328,132,8),(1329,132,9),(1330,132,10),(1331,133,11),(1332,133,12),(1333,133,13),(1334,133,14),(1335,133,15),(1336,133,16),(1337,133,17),(1338,133,18),(1339,133,19),(1340,133,20),(1341,134,21),(1342,134,22),(1343,134,23),(1344,134,24),(1345,134,25),(1346,134,26),(1347,134,27),(1348,134,28),(1349,134,29),(1350,134,30),(1351,135,31),(1352,135,32),(1353,135,33),(1354,135,34),(1355,135,35),(1356,135,35),(1357,135,36),(1358,135,37),(1359,135,38),(1360,135,39),(1361,136,40),(1362,136,41),(1363,136,42),(1364,136,43),(1365,136,44),(1366,136,45),(1367,136,45),(1368,136,46),(1369,136,47),(1370,136,48),(1371,137,49),(1372,137,50),(1373,137,51),(1374,137,52),(1375,137,53),(1376,137,54),(1377,137,55),(1378,137,56),(1379,137,57),(1380,137,58),(1381,138,59),(1382,138,60),(1383,138,61),(1384,138,62),(1385,138,63),(1386,138,64),(1387,138,65),(1388,138,66),(1389,138,67),(1390,138,68),(1391,139,69),(1392,139,70),(1393,139,71),(1394,139,72),(1395,139,73),(1396,139,74),(1397,139,75),(1398,139,76),(1399,139,77),(1400,139,78),(1401,140,79),(1402,140,80),(1403,140,81),(1404,140,82),(1405,140,83),(1406,140,84),(1407,140,85),(1408,140,86),(1409,140,87),(1410,140,88),(1411,141,89),(1412,141,90),(1413,141,91),(1414,141,92),(1415,141,93),(1416,141,94),(1417,141,95),(1418,141,96),(1419,141,97),(1420,141,98),(1421,142,1),(1422,142,2),(1423,142,3),(1424,142,4),(1425,142,5),(1426,142,6),(1427,142,7),(1428,142,8),(1429,142,9),(1430,142,10),(1431,143,11),(1432,143,12),(1433,143,13),(1434,143,14),(1435,143,15),(1436,143,16),(1437,143,17),(1438,143,18),(1439,143,19),(1440,143,20),(1441,144,21),(1442,144,22),(1443,144,23),(1444,144,24),(1445,144,25),(1446,144,26),(1447,144,27),(1448,144,28),(1449,144,29),(1450,144,30),(1451,145,31),(1452,145,32),(1453,145,33),(1454,145,34),(1455,145,35),(1456,145,35),(1457,145,36),(1458,145,37),(1459,145,38),(1460,145,39),(1461,146,40),(1462,146,41),(1463,146,42),(1464,146,43),(1465,146,44),(1466,146,45),(1467,146,45),(1468,146,46),(1469,146,47),(1470,146,48),(1471,147,21),(1472,147,22),(1473,147,23),(1474,147,24),(1475,147,25),(1476,147,26),(1477,147,27),(1478,147,28),(1479,147,29),(1480,147,30),(1481,148,31),(1482,148,32),(1483,148,33),(1484,148,34),(1485,148,35),(1486,148,35),(1487,148,36),(1488,148,37),(1489,148,38),(1490,148,39),(1491,149,40),(1492,149,41),(1493,149,42),(1494,149,43),(1495,149,44),(1496,149,45),(1497,149,45),(1498,149,46),(1499,149,47),(1500,149,48),(1501,150,1),(1502,150,2),(1503,150,3),(1504,150,4),(1505,150,5),(1506,150,6),(1507,150,7),(1508,150,8),(1509,150,9),(1510,150,10),(1511,151,11),(1512,151,12),(1513,151,13),(1514,151,14),(1515,151,15),(1516,151,15),(1517,151,16),(1518,151,17),(1519,151,18),(1520,151,19),(1521,152,20),(1522,152,21),(1523,152,22),(1524,152,23),(1525,152,24),(1526,152,25),(1527,152,25),(1528,152,26),(1529,152,27),(1530,152,28),(1531,153,1),(1532,153,2),(1533,153,3),(1534,153,4),(1535,153,5),(1536,153,6),(1537,153,7),(1538,153,8),(1539,153,9),(1540,153,10),(1541,154,11),(1542,154,12),(1543,154,13),(1544,154,14),(1545,154,15),(1546,154,16),(1547,154,17),(1548,154,18),(1549,154,19),(1550,154,20),(1551,155,21),(1552,155,22),(1553,155,23),(1554,155,24),(1555,155,25),(1556,155,26),(1557,155,27),(1558,155,28),(1559,155,29),(1560,155,30),(1561,156,1),(1562,156,2),(1563,156,3),(1564,156,4),(1565,156,5),(1566,156,6),(1567,156,7),(1568,156,8),(1569,156,9),(1570,156,10),(1571,157,11),(1572,157,12),(1573,157,13),(1574,157,14),(1575,157,15),(1576,157,16),(1577,157,17),(1578,157,18),(1579,157,19),(1580,157,20),(1581,158,21),(1582,158,22),(1583,158,23),(1584,158,24),(1585,158,25),(1586,158,26),(1587,158,27),(1588,158,28),(1589,158,29),(1590,158,30),(1591,159,31),(1592,159,32),(1593,159,33),(1594,159,34),(1595,159,35),(1596,159,36),(1597,159,37),(1598,159,38),(1599,159,39),(1600,159,40),(1601,160,41),(1602,160,42),(1603,160,43),(1604,160,44),(1605,160,45),(1606,160,46),(1607,160,47),(1608,160,48),(1609,160,49),(1610,160,50),(1611,161,51),(1612,161,52),(1613,161,53),(1614,161,54),(1615,161,55),(1616,161,56),(1617,161,57),(1618,161,58),(1619,161,59),(1620,161,60),(1621,162,61),(1622,162,62),(1623,162,63),(1624,162,64),(1625,162,65),(1626,162,66),(1627,162,67),(1628,162,68),(1629,162,69),(1630,162,70),(1631,163,71),(1632,163,72),(1633,163,73),(1634,163,74),(1635,163,75),(1636,163,76),(1637,163,77),(1638,163,78),(1639,163,79),(1640,163,80),(1641,164,81),(1642,164,82),(1643,164,83),(1644,164,84),(1645,164,85),(1646,164,86),(1647,164,87),(1648,164,88),(1649,164,89),(1650,164,90),(1651,165,91),(1652,165,92),(1653,165,93),(1654,165,94),(1655,165,95),(1656,165,96),(1657,165,97),(1658,165,98),(1659,165,99),(1660,165,100),(1661,166,101),(1662,166,102),(1663,166,103),(1664,166,104),(1665,166,105),(1666,166,106),(1667,166,107),(1668,166,108),(1669,166,109),(1670,166,110),(1671,167,111),(1672,167,112),(1673,167,113),(1674,167,114),(1675,167,115),(1676,167,116),(1677,167,117),(1678,167,118),(1679,167,119),(1680,167,120),(1681,168,121),(1682,168,122),(1683,168,123),(1684,168,124),(1685,168,125),(1686,168,126),(1687,168,127),(1688,168,128),(1689,168,129),(1690,168,130),(1691,169,131),(1692,169,132),(1693,169,133),(1694,169,134),(1695,169,135),(1696,169,136),(1697,169,137),(1698,169,138),(1699,169,139),(1700,169,140),(1701,170,141),(1702,170,142),(1703,170,143),(1704,170,144),(1705,170,145),(1706,170,146),(1707,170,147),(1708,170,148),(1709,170,149),(1710,170,150),(1711,171,151),(1712,171,152),(1713,171,153),(1714,171,154),(1715,171,155),(1716,171,156),(1717,171,157),(1718,171,158),(1719,171,159),(1720,171,160),(1721,172,161),(1722,172,162),(1723,172,163),(1724,172,164),(1725,172,165),(1726,172,166),(1727,172,167),(1728,172,168),(1729,172,169),(1730,172,170),(1731,173,171),(1732,173,172),(1733,173,173),(1734,173,174),(1735,173,175),(1736,173,176),(1737,173,177),(1738,173,178),(1739,173,179),(1740,173,180),(1741,174,181),(1742,174,182),(1743,174,183),(1744,174,184),(1745,174,185),(1746,174,186),(1747,174,187),(1748,174,188),(1749,174,189),(1750,174,190),(1751,175,191),(1752,175,192),(1753,175,193),(1754,175,194),(1755,175,195),(1756,175,196),(1757,175,197),(1758,175,198),(1759,175,199),(1760,175,200),(1761,176,201),(1762,176,202),(1763,176,203),(1764,176,204),(1765,176,205),(1766,176,206),(1767,176,207),(1768,176,208),(1769,176,209),(1770,176,210),(1771,177,211),(1772,177,212),(1773,177,213),(1774,177,214),(1775,177,215),(1776,177,216),(1777,177,217),(1778,177,218),(1779,177,219),(1780,177,220),(1781,178,1),(1782,178,2),(1783,178,3),(1784,178,4),(1785,178,5),(1786,178,6),(1787,178,7),(1788,178,8),(1789,178,9),(1790,178,10),(1791,179,11),(1792,179,12),(1793,179,13),(1794,179,14),(1795,179,15),(1796,179,16),(1797,179,17),(1798,179,18),(1799,179,19),(1800,179,20),(1801,180,21),(1802,180,22),(1803,180,23),(1804,180,24),(1805,180,25),(1806,180,26),(1807,180,27),(1808,180,28),(1809,180,29),(1810,180,30),(1811,181,1),(1812,181,2),(1813,181,3),(1814,181,4),(1815,181,5),(1816,181,6),(1817,181,7),(1818,181,8),(1819,181,9),(1820,181,10),(1821,182,11),(1822,182,12),(1823,182,13),(1824,182,14),(1825,182,15),(1826,182,16),(1827,182,17),(1828,182,18),(1829,182,19),(1830,182,20),(1831,183,21),(1832,183,22),(1833,183,23),(1834,183,24),(1835,183,25),(1836,183,26),(1837,183,27),(1838,183,28),(1839,183,29),(1840,183,30),(1841,184,31),(1842,184,32),(1843,184,33),(1844,184,34),(1845,184,35),(1846,184,36),(1847,184,37),(1848,184,38),(1849,184,39),(1850,184,40),(1851,185,1),(1852,185,2),(1853,185,3),(1854,185,4),(1855,185,5),(1856,185,6),(1857,185,7),(1858,185,8),(1859,185,9),(1860,185,10),(1861,186,11),(1862,186,12),(1863,186,13),(1864,186,14),(1865,186,15),(1866,186,16),(1867,186,17),(1868,186,18),(1869,186,19),(1870,186,20),(1871,187,1),(1872,187,2),(1873,187,3),(1874,187,4),(1875,187,5),(1876,187,6),(1877,187,7),(1878,187,8),(1879,187,9),(1880,187,10),(1881,188,11),(1882,188,12),(1883,188,13),(1884,188,14),(1885,188,15),(1886,188,16),(1887,188,17),(1888,188,18),(1889,188,19),(1890,188,20),(1891,189,21),(1892,189,22),(1893,189,23),(1894,189,24),(1895,189,25),(1896,189,26),(1897,189,27),(1898,189,28),(1899,189,29),(1900,189,30),(1901,190,31),(1902,190,32),(1903,190,33),(1904,190,34),(1905,190,35),(1906,190,36),(1907,190,37),(1908,190,38),(1909,190,39),(1910,190,40),(1911,191,41),(1912,191,42),(1913,191,43),(1914,191,44),(1915,191,45),(1916,191,46),(1917,191,47),(1918,191,48),(1919,191,49),(1920,191,50),(1921,192,1),(1922,192,2),(1923,192,3),(1924,192,4),(1925,192,5),(1926,192,6),(1927,192,7),(1928,192,8),(1929,192,9),(1930,192,10),(1931,193,11),(1932,193,12),(1933,193,13),(1934,193,14),(1935,193,15),(1936,193,16),(1937,193,17),(1938,193,18),(1939,193,19),(1940,193,20),(1941,194,1),(1942,194,2),(1943,194,3),(1944,194,4),(1945,194,5),(1946,194,6),(1947,194,7),(1948,194,8),(1949,194,9),(1950,194,10),(1951,195,1),(1952,195,2),(1953,195,3),(1954,195,4),(1955,195,5),(1956,195,6),(1957,195,7),(1958,195,8),(1959,195,9),(1960,195,10),(1961,196,1),(1962,196,2),(1963,196,3),(1964,196,4),(1965,196,5),(1966,196,6),(1967,196,7),(1968,196,8),(1969,196,9),(1970,196,10),(1971,197,11),(1972,197,12),(1973,197,13),(1974,197,14),(1975,197,15),(1976,197,1),(1977,197,2),(1978,197,3),(1979,197,4),(1980,197,5),(1981,198,1),(1982,198,2),(1983,198,3),(1984,198,4),(1985,198,5),(1986,198,6),(1987,198,7),(1988,198,8),(1989,198,9),(1990,198,10),(1991,199,1),(1992,199,2),(1993,199,3),(1994,199,4),(1995,199,5),(1996,199,6),(1997,199,7),(1998,199,8),(1999,199,9),(2000,199,10),(2001,199,11),(2002,199,12),(2003,199,13),(2004,199,14),(2005,199,15),(2006,199,16),(2007,199,17),(2008,199,18),(2009,200,1),(2010,200,2),(2011,200,3),(2012,200,4),(2013,200,5),(2014,200,6),(2015,200,7),(2016,200,8),(2017,200,9),(2018,200,10),(2019,200,11),(2020,200,12),(2021,200,13),(2022,200,14),(2023,200,15),(2024,200,16),(2025,200,17),(2026,200,18),(2027,200,19),(2028,200,20),(2029,200,21),(2030,200,22),(2031,200,23),(2032,200,24),(2033,200,25),(2034,200,26),(2035,200,27),(2036,200,28),(2037,200,29),(2038,200,30),(2039,200,31),(2040,200,32),(2041,200,33),(2042,200,34),(2043,200,35),(2044,200,36),(2045,200,37),(2046,200,38),(2047,200,39),(2048,200,40),(2049,200,41),(2050,200,42),(2051,200,43),(2052,200,44),(2053,200,45),(2054,200,46),(2055,200,47),(2056,200,48),(2057,200,49),(2058,200,50),(2059,200,51),(2060,200,52),(2061,200,53),(2062,200,54),(2063,200,55),(2064,200,56),(2065,200,57),(2066,200,58),(2067,200,59),(2068,200,60),(2069,200,61),(2070,200,62),(2071,200,63),(2072,200,64),(2073,200,65),(2074,200,66),(2075,200,67),(2076,200,68),(2077,200,69),(2078,200,70),(2079,200,71),(2080,200,72),(2081,200,73),(2082,200,74),(2083,200,75),(2084,200,76),(2085,200,77),(2086,200,78),(2087,200,79),(2088,200,80),(2089,200,81),(2090,200,82),(2091,200,83),(2092,200,84),(2093,200,85),(2094,200,86),(2095,200,87),(2096,200,88),(2097,200,89),(2098,200,90),(2099,200,91),(2100,200,92),(2101,200,93),(2102,200,94),(2103,200,95),(2104,200,96),(2105,200,97),(2106,200,98),(2107,200,99),(2108,200,100),(2109,200,101),(2110,200,102),(2111,200,103),(2112,200,104),(2113,200,105),(2114,200,106),(2115,200,107),(2116,200,108),(2117,200,109),(2118,200,110),(2119,200,111),(2120,200,112),(2121,200,113),(2122,200,114),(2123,200,115),(2124,200,116),(2125,200,117),(2126,200,118),(2127,200,119),(2128,200,120),(2129,200,121),(2130,200,122),(2131,200,123),(2132,200,124),(2133,200,125),(2134,200,126),(2135,200,127),(2136,200,128),(2137,200,129),(2138,200,130),(2139,200,131),(2140,200,132),(2141,200,133),(2142,200,134),(2143,200,135),(2144,200,136),(2145,200,137),(2146,200,138),(2147,200,139),(2148,200,140),(2149,200,141),(2150,200,142),(2151,200,143),(2152,200,144),(2153,200,145),(2154,200,146),(2155,200,147),(2156,200,148),(2157,200,149),(2158,200,150),(2159,200,151),(2160,200,152),(2161,200,153),(2162,200,154),(2163,200,155),(2164,200,156),(2165,200,157),(2166,200,158),(2167,200,159),(2168,200,160),(2169,200,161),(2170,200,162),(2171,200,163),(2172,200,164),(2173,200,165),(2174,200,166),(2175,200,167),(2176,200,168),(2177,200,169),(2178,200,170),(2179,200,171),(2180,200,172),(2181,200,173),(2182,200,174),(2183,200,175),(2184,200,176),(2185,200,177),(2186,200,178),(2187,200,179),(2188,200,180),(2189,200,181),(2190,200,182),(2191,200,183),(2192,200,184),(2193,200,185),(2194,200,186),(2195,200,187),(2196,200,188),(2197,200,189),(2198,200,190),(2199,200,191),(2200,200,192),(2201,200,193),(2202,200,194),(2203,200,195),(2204,200,196),(2205,200,197),(2206,200,198),(2207,200,199),(2208,200,200),(2209,200,201),(2210,200,202),(2211,200,203),(2212,200,204),(2213,200,205),(2214,200,206),(2215,200,207),(2216,200,208),(2217,200,209),(2218,200,210),(2219,200,211),(2220,200,212),(2221,200,213),(2222,200,214),(2223,200,215),(2224,200,216),(2225,200,217),(2226,200,218),(2227,200,219),(2228,200,220),(2229,200,221),(2230,200,222),(2231,200,223),(2232,200,224),(2233,201,1),(2234,201,2),(2235,201,3),(2236,201,4),(2237,201,5),(2238,201,6),(2239,201,7),(2240,201,8),(2241,201,9),(2242,201,10),(2243,201,11),(2244,201,12),(2245,201,13),(2246,201,14),(2247,201,15),(2248,201,16),(2249,201,17),(2250,201,18),(2251,201,19),(2252,201,20),(2253,201,21),(2254,201,22),(2255,201,23),(2256,201,24),(2257,201,25),(2258,201,26),(2259,201,27),(2260,201,28),(2261,201,29),(2262,201,30),(2263,201,31),(2264,201,32),(2265,201,33),(2266,201,34),(2267,201,35),(2268,201,36),(2269,201,37),(2270,201,38),(2271,201,39),(2272,201,40),(2273,201,41),(2274,201,42),(2275,201,43),(2276,201,44),(2277,201,45),(2278,201,46),(2279,201,47),(2280,201,48),(2281,201,49),(2282,201,50),(2283,201,51),(2284,201,52),(2285,201,53),(2286,201,54),(2287,201,55),(2288,201,56),(2289,201,57),(2290,201,58),(2291,201,59),(2292,201,60),(2293,201,61),(2294,201,62),(2295,201,63),(2296,201,64),(2297,201,65),(2298,201,66),(2299,201,67),(2300,201,68),(2301,201,69),(2302,201,70),(2303,201,71),(2304,201,72),(2305,201,73),(2306,201,74),(2307,201,75),(2308,201,76),(2309,201,77),(2310,201,78),(2311,201,79),(2312,201,80),(2313,201,81),(2314,201,82),(2315,201,83),(2316,201,84),(2317,201,85),(2318,201,86),(2319,201,87),(2320,201,88),(2321,201,89),(2322,201,90),(2323,201,91),(2324,201,92),(2325,201,93),(2326,201,94),(2327,201,95),(2328,201,96),(2329,201,97),(2330,201,98),(2331,201,99),(2332,201,100),(2333,201,101),(2334,201,102),(2335,201,103),(2336,201,104),(2337,201,105),(2338,201,106),(2339,201,107),(2340,201,108),(2341,201,109),(2342,201,110),(2343,201,111),(2344,201,112),(2345,201,113),(2346,201,114),(2347,201,115),(2348,201,116),(2349,201,117),(2350,201,118),(2351,201,119),(2352,201,120),(2353,201,121),(2354,201,122),(2355,201,123),(2356,201,124),(2357,201,125),(2358,201,126),(2359,201,127),(2360,201,128),(2361,201,129),(2362,201,130),(2363,201,131),(2364,201,132),(2365,201,133),(2366,201,134),(2367,201,135),(2368,201,136),(2369,201,137),(2370,201,138),(2371,201,139),(2372,201,140),(2373,201,141),(2374,201,142),(2375,201,143),(2376,201,144),(2377,201,145),(2378,201,146),(2379,201,147),(2380,201,148),(2381,201,149),(2382,201,150),(2383,201,151),(2384,201,152),(2385,201,153),(2386,201,154),(2387,201,155),(2388,201,156),(2389,201,157),(2390,201,158),(2391,201,159),(2392,201,160),(2393,201,161),(2394,201,162),(2395,201,163),(2396,201,164),(2397,201,165),(2398,201,166),(2399,201,167),(2400,201,168),(2401,201,169),(2402,201,170),(2403,201,171),(2404,201,172),(2405,201,173),(2406,201,174),(2407,201,175),(2408,201,176),(2409,201,177),(2410,201,178),(2411,201,179),(2412,201,180),(2413,201,181),(2414,201,182),(2415,201,183),(2416,201,184),(2417,201,185),(2418,201,186),(2419,201,187),(2420,201,188),(2421,201,189),(2422,201,190),(2423,201,191),(2424,201,192),(2425,201,193),(2426,201,194),(2427,201,195),(2428,201,196),(2429,201,197),(2430,201,198),(2431,201,199),(2432,201,200),(2433,201,201),(2434,201,202),(2435,201,203),(2436,201,204),(2437,201,205),(2438,201,206),(2439,201,207),(2440,201,208),(2441,201,209),(2442,201,210),(2443,201,211),(2444,201,212),(2445,201,213),(2446,201,214),(2447,201,215),(2448,201,216),(2449,201,217),(2450,201,218),(2451,201,219),(2452,201,220),(2453,201,221),(2454,201,222),(2455,201,223),(2456,201,224),(2457,203,1),(2458,203,2),(2459,203,3),(2460,203,4),(2461,203,5),(2462,203,6),(2463,203,7),(2464,203,8),(2465,203,9),(2466,203,10),(2467,203,11),(2468,203,12),(2469,203,13),(2470,203,14),(2471,203,15),(2472,203,16),(2473,203,17),(2474,203,18),(2475,203,19),(2476,203,20),(2477,203,21),(2478,203,22),(2479,203,23),(2480,203,24),(2481,203,25),(2482,203,26),(2483,203,27),(2484,203,28),(2485,203,29),(2486,203,30),(2487,203,31),(2488,203,32),(2489,203,33),(2490,203,34),(2491,203,35),(2492,203,36),(2493,203,37),(2494,203,38),(2495,203,39),(2496,203,40),(2497,203,41),(2498,203,42),(2499,203,43),(2500,203,44),(2501,203,45),(2502,203,46),(2503,203,47),(2504,203,48),(2505,203,49),(2506,203,50),(2507,203,51),(2508,203,52),(2509,203,53),(2510,203,54),(2511,203,55),(2512,203,56),(2513,203,57),(2514,203,58),(2515,203,59),(2516,203,60),(2517,203,61),(2518,203,62),(2519,203,63),(2520,203,64),(2521,203,65),(2522,203,66),(2523,203,67),(2524,203,68),(2525,203,69),(2526,203,70),(2527,203,71),(2528,203,72),(2529,203,73),(2530,203,74),(2531,203,75),(2532,203,76),(2533,203,77),(2534,203,78),(2535,203,79),(2536,203,80),(2537,203,81),(2538,203,82),(2539,203,83),(2540,203,84),(2541,203,85),(2542,203,86),(2543,203,87),(2544,203,88),(2545,203,89),(2546,203,90),(2547,203,91),(2548,203,92),(2549,203,93),(2550,203,94),(2551,203,95),(2552,203,96),(2553,203,97),(2554,203,98),(2555,203,99),(2556,203,100),(2557,203,101),(2558,203,102),(2559,203,103),(2560,203,104),(2561,203,105),(2562,203,106),(2563,203,107),(2564,203,108),(2565,203,109),(2566,203,110),(2567,203,111),(2568,203,112),(2569,203,113),(2570,203,114),(2571,203,115),(2572,203,116),(2573,203,117),(2574,203,118),(2575,203,119),(2576,203,120),(2577,203,121),(2578,203,122),(2579,203,123),(2580,203,124),(2581,203,125),(2582,203,126),(2583,203,127),(2584,203,128),(2585,203,129),(2586,203,130),(2587,203,131),(2588,203,132),(2589,203,133),(2590,203,134),(2591,203,135),(2592,203,136),(2593,203,137),(2594,203,138),(2595,203,139),(2596,203,140),(2597,203,141),(2598,203,142),(2599,203,143),(2600,203,144),(2601,203,145),(2602,203,146),(2603,203,147),(2604,203,148),(2605,203,149),(2606,203,150),(2607,203,151),(2608,203,152),(2609,203,153),(2610,203,154),(2611,203,155),(2612,203,156),(2613,203,157),(2614,203,158),(2615,203,159),(2616,203,160),(2617,203,161),(2618,203,162),(2619,203,163),(2620,203,164),(2621,203,165),(2622,203,166),(2623,203,167),(2624,203,168),(2625,203,169),(2626,203,170),(2627,203,171),(2628,203,172),(2629,203,173),(2630,203,174),(2631,203,175),(2632,203,176),(2633,203,177),(2634,203,178),(2635,203,179),(2636,203,180),(2637,203,181),(2638,203,182),(2639,203,183),(2640,203,184),(2641,203,185),(2642,203,186),(2643,203,187),(2644,203,188),(2645,203,189),(2646,203,190),(2647,203,191),(2648,203,192),(2649,203,193),(2650,203,194),(2651,203,195),(2652,203,196),(2653,203,197),(2654,203,198),(2655,203,199),(2656,203,200),(2657,203,201),(2658,203,202),(2659,203,203),(2660,203,204),(2661,203,205),(2662,203,206),(2663,203,207),(2664,203,208),(2665,203,209),(2666,203,210),(2667,203,211),(2668,203,212),(2669,203,213),(2670,203,214),(2671,203,215),(2672,203,216),(2673,203,217),(2674,203,218),(2675,203,219),(2676,203,220),(2677,203,221),(2678,203,222),(2679,203,223),(2680,203,224),(2681,204,1),(2682,204,2),(2683,204,3),(2684,204,4),(2685,204,5),(2686,204,6),(2687,204,7),(2688,204,8),(2689,204,9),(2690,204,10),(2691,204,11),(2692,204,12),(2693,204,13),(2694,204,14),(2695,204,15),(2696,204,16),(2697,204,17),(2698,204,18),(2699,204,19),(2700,204,20),(2701,204,21),(2702,204,22),(2703,204,23),(2704,204,24),(2705,204,25),(2706,204,26),(2707,204,27),(2708,204,28),(2709,204,29),(2710,204,30),(2711,204,31),(2712,204,32),(2713,204,33),(2714,204,34),(2715,204,35),(2716,204,36),(2717,204,37),(2718,204,38),(2719,204,39),(2720,204,40),(2721,204,41),(2722,204,42),(2723,204,43),(2724,204,44),(2725,204,45),(2726,204,46),(2727,204,47),(2728,204,48),(2729,204,49),(2730,204,50),(2731,204,51),(2732,204,52),(2733,204,53),(2734,204,54),(2735,204,55),(2736,204,56),(2737,204,57),(2738,204,58),(2739,204,59),(2740,204,60),(2741,204,61),(2742,204,62),(2743,204,63),(2744,204,64),(2745,204,65),(2746,204,66),(2747,204,67),(2748,204,68),(2749,204,69),(2750,204,70),(2751,204,71),(2752,204,72),(2753,204,73),(2754,204,74),(2755,204,75),(2756,204,76),(2757,204,77),(2758,204,78),(2759,204,79),(2760,204,80),(2761,204,81),(2762,204,82),(2763,204,83),(2764,204,84),(2765,204,85),(2766,204,86),(2767,204,87),(2768,204,88),(2769,204,89),(2770,204,90),(2771,204,91),(2772,204,92),(2773,204,93),(2774,204,94),(2775,204,95),(2776,204,96),(2777,204,97),(2778,204,98),(2779,204,99),(2780,204,100),(2781,204,101),(2782,204,102),(2783,204,103),(2784,204,104),(2785,204,105),(2786,204,106),(2787,204,107),(2788,204,108),(2789,204,109),(2790,204,110),(2791,204,111),(2792,204,112),(2793,204,113),(2794,204,114),(2795,204,115),(2796,204,116),(2797,204,117),(2798,204,118),(2799,204,119),(2800,204,120),(2801,204,121),(2802,204,122),(2803,204,123),(2804,204,124),(2805,204,125),(2806,204,126),(2807,204,127),(2808,204,128),(2809,204,129),(2810,204,130),(2811,204,131),(2812,204,132),(2813,204,133),(2814,204,134),(2815,204,135),(2816,204,136),(2817,204,137),(2818,204,138),(2819,204,139),(2820,204,140),(2821,204,141),(2822,204,142),(2823,204,143),(2824,204,144),(2825,204,145),(2826,204,146),(2827,204,147),(2828,204,148),(2829,204,149),(2830,204,150),(2831,204,151),(2832,204,152),(2833,204,153),(2834,204,154),(2835,204,155),(2836,204,156),(2837,204,157),(2838,204,158),(2839,204,159),(2840,204,160),(2841,204,161),(2842,204,162),(2843,204,163),(2844,204,164),(2845,204,165),(2846,204,166),(2847,204,167),(2848,204,168),(2849,204,169),(2850,204,170),(2851,204,171),(2852,204,172),(2853,204,173),(2854,204,174),(2855,204,175),(2856,204,176),(2857,204,177),(2858,204,178),(2859,204,179),(2860,204,180),(2861,204,181),(2862,204,182),(2863,204,183),(2864,204,184),(2865,204,185),(2866,204,186),(2867,204,187),(2868,204,188),(2869,204,189),(2870,204,190),(2871,204,191),(2872,204,192),(2873,204,193),(2874,204,194),(2875,204,195),(2876,204,196),(2877,204,197),(2878,204,198),(2879,204,199),(2880,204,200),(2881,204,201),(2882,204,202),(2883,204,203),(2884,204,204),(2885,204,205),(2886,204,206),(2887,204,207),(2888,204,208),(2889,204,209),(2890,204,210),(2891,204,211),(2892,204,212),(2893,204,213),(2894,204,214),(2895,204,215),(2896,204,216),(2897,204,217),(2898,204,218),(2899,204,219),(2900,204,220),(2901,204,221),(2902,204,222),(2903,204,223),(2904,204,224),(2905,205,1),(2906,205,2),(2907,205,3),(2908,205,4),(2909,205,5),(2910,205,6),(2911,205,7),(2912,205,8),(2913,205,9),(2914,205,10),(2915,205,11),(2916,205,12),(2917,205,13),(2918,205,14),(2919,205,15),(2920,205,16),(2921,205,17),(2922,205,18),(2923,205,19),(2924,205,20),(2925,205,21),(2926,205,22),(2927,205,23),(2928,205,24),(2929,205,25),(2930,205,26),(2931,205,27),(2932,205,28),(2933,205,29),(2934,205,30),(2935,205,31),(2936,205,32),(2937,205,33),(2938,205,34),(2939,205,35),(2940,205,36),(2941,205,37),(2942,205,38),(2943,205,39),(2944,205,40),(2945,205,41),(2946,205,42),(2947,205,43),(2948,205,44),(2949,205,45),(2950,205,46),(2951,205,47),(2952,205,48),(2953,205,49),(2954,205,50),(2955,205,51),(2956,205,52),(2957,205,53),(2958,205,54),(2959,205,55),(2960,205,56),(2961,205,57),(2962,205,58),(2963,205,59),(2964,205,60),(2965,205,61),(2966,205,62),(2967,205,63),(2968,205,64),(2969,205,65),(2970,205,66),(2971,205,67),(2972,205,68),(2973,205,69),(2974,205,70),(2975,205,71),(2976,205,72),(2977,205,73),(2978,205,74),(2979,205,75),(2980,205,76),(2981,205,77),(2982,205,78),(2983,205,79),(2984,205,80),(2985,205,81),(2986,205,82),(2987,205,83),(2988,205,84),(2989,205,85),(2990,205,86),(2991,205,87),(2992,205,88),(2993,205,89),(2994,205,90),(2995,205,91),(2996,205,92),(2997,205,93),(2998,205,94),(2999,205,95),(3000,205,96),(3001,205,97),(3002,205,98),(3003,205,99),(3004,205,100),(3005,205,101),(3006,205,102),(3007,205,103),(3008,205,104),(3009,205,105),(3010,205,106),(3011,205,107),(3012,205,108),(3013,205,109),(3014,205,110),(3015,205,111),(3016,205,112),(3017,205,113),(3018,205,114),(3019,205,115),(3020,205,116),(3021,205,117),(3022,205,118),(3023,205,119),(3024,205,120),(3025,205,121),(3026,205,122),(3027,205,123),(3028,205,124),(3029,205,125),(3030,205,126),(3031,205,127),(3032,205,128),(3033,205,129),(3034,205,130),(3035,205,131),(3036,205,132),(3037,205,133),(3038,205,134),(3039,205,135),(3040,205,136),(3041,205,137),(3042,205,138),(3043,205,139),(3044,205,140),(3045,205,141),(3046,205,142),(3047,205,143),(3048,205,144),(3049,205,145),(3050,205,146),(3051,205,147),(3052,205,148),(3053,205,149),(3054,205,150),(3055,205,151),(3056,205,152),(3057,205,153),(3058,205,154),(3059,205,155),(3060,205,156),(3061,205,157),(3062,205,158),(3063,205,159),(3064,205,160),(3065,205,161),(3066,205,162),(3067,205,163),(3068,205,164),(3069,205,165),(3070,205,166),(3071,205,167),(3072,205,168),(3073,205,169),(3074,205,170),(3075,205,171),(3076,205,172),(3077,205,173),(3078,205,174),(3079,205,175),(3080,205,176),(3081,205,177),(3082,205,178),(3083,205,179),(3084,205,180),(3085,205,181),(3086,205,182),(3087,205,183),(3088,205,184),(3089,205,185),(3090,205,186),(3091,205,187),(3092,205,188),(3093,205,189),(3094,205,190),(3095,205,191),(3096,205,192),(3097,205,193),(3098,205,194),(3099,205,195),(3100,205,196),(3101,205,197),(3102,205,198),(3103,205,199),(3104,205,200),(3105,205,201),(3106,205,202),(3107,205,203),(3108,205,204),(3109,205,205),(3110,205,206),(3111,205,207),(3112,205,208),(3113,205,209),(3114,205,210),(3115,205,211),(3116,205,212),(3117,205,213),(3118,205,214),(3119,205,215),(3120,205,216),(3121,205,217),(3122,205,218),(3123,205,219),(3124,205,220),(3125,205,221),(3126,205,222),(3127,205,223),(3128,205,224),(3129,206,1),(3130,207,1),(3131,208,1),(3132,208,2),(3133,208,3),(3134,208,4),(3135,208,5),(3136,208,6),(3137,208,7),(3138,208,8),(3139,208,9),(3140,208,10),(3141,208,11),(3142,208,12),(3143,208,13),(3144,208,14),(3145,208,15),(3146,208,16),(3147,208,17),(3148,208,18),(3149,208,19),(3150,208,20),(3151,208,21),(3152,208,22),(3153,208,23),(3154,208,24),(3155,208,25),(3156,208,26),(3157,208,27),(3158,208,28),(3159,208,29),(3160,208,30),(3161,208,31),(3162,208,32),(3163,208,33),(3164,208,34),(3165,208,35),(3166,208,36),(3167,208,37),(3168,208,38),(3169,208,39),(3170,208,40),(3171,208,41),(3172,208,42),(3173,208,43),(3174,208,44),(3175,208,45),(3176,208,46),(3177,208,47),(3178,208,48),(3179,208,49),(3180,208,50),(3181,208,51),(3182,208,52),(3183,208,53),(3184,208,54),(3185,208,55),(3186,208,56),(3187,208,57),(3188,208,58),(3189,208,59),(3190,208,60),(3191,208,61),(3192,208,62),(3193,208,63),(3194,208,64),(3195,208,65),(3196,208,66),(3197,208,67),(3198,208,68),(3199,208,69),(3200,208,70),(3201,208,71),(3202,208,72),(3203,208,73),(3204,208,74),(3205,208,75),(3206,208,76),(3207,208,77),(3208,208,78),(3209,208,79),(3210,208,80),(3211,208,81),(3212,208,82),(3213,208,83),(3214,208,84),(3215,208,85),(3216,208,86),(3217,208,87),(3218,208,88),(3219,208,89),(3220,208,90),(3221,208,91),(3222,208,92),(3223,208,93),(3224,208,94),(3225,208,95),(3226,208,96),(3227,208,97),(3228,208,98),(3229,208,99),(3230,208,100),(3231,208,101),(3232,208,102),(3233,208,103),(3234,208,104),(3235,208,105),(3236,208,106),(3237,208,107),(3238,208,108),(3239,208,109),(3240,208,110),(3241,208,111),(3242,208,112),(3243,208,113),(3244,208,114),(3245,208,115),(3246,208,116),(3247,208,117),(3248,208,118),(3249,208,119),(3250,208,120),(3251,208,121),(3252,208,122),(3253,208,123),(3254,208,124),(3255,208,125),(3256,208,126),(3257,208,127),(3258,208,128),(3259,208,129),(3260,208,130),(3261,208,131),(3262,208,132),(3263,208,133),(3264,208,134),(3265,208,135),(3266,208,136),(3267,208,137),(3268,208,138),(3269,208,139),(3270,208,140),(3271,208,141),(3272,208,142),(3273,208,143),(3274,208,144),(3275,208,145),(3276,208,146),(3277,208,147),(3278,208,148),(3279,208,149),(3280,208,150),(3281,208,151),(3282,208,152),(3283,208,153),(3284,208,154),(3285,208,155),(3286,208,156),(3287,208,157),(3288,208,158),(3289,208,159),(3290,208,160),(3291,208,161),(3292,208,162),(3293,208,163),(3294,208,164),(3295,208,165),(3296,208,166),(3297,208,167),(3298,208,168),(3299,208,169),(3300,208,170),(3301,208,171),(3302,208,172),(3303,208,173),(3304,208,174),(3305,208,175),(3306,208,176),(3307,208,177),(3308,208,178),(3309,208,179),(3310,208,180),(3311,208,181),(3312,208,182),(3313,208,183),(3314,208,184),(3315,208,185),(3316,208,186),(3317,208,187),(3318,208,188),(3319,208,189),(3320,208,190),(3321,208,191),(3322,208,192),(3323,208,193),(3324,208,194),(3325,208,195),(3326,208,196),(3327,208,197),(3328,208,198),(3329,208,199),(3330,208,200),(3331,208,201),(3332,208,202),(3333,208,203),(3334,208,204),(3335,208,205),(3336,208,206),(3337,208,207),(3338,208,208),(3339,208,209),(3340,208,210),(3341,208,211),(3342,208,212),(3343,208,213),(3344,208,214),(3345,208,215),(3346,208,216),(3347,208,217),(3348,208,218),(3349,208,219),(3350,208,220),(3351,208,221),(3352,208,222),(3353,208,223),(3354,208,224),(3355,209,1),(3356,209,2),(3357,209,3),(3358,209,4),(3359,209,5),(3360,209,6),(3361,209,7),(3362,209,8),(3363,209,9),(3364,209,10),(3365,209,11),(3366,209,12),(3367,209,13),(3368,209,14),(3369,209,15),(3370,209,16),(3371,209,17),(3372,209,18),(3373,209,19),(3374,209,20),(3375,209,21),(3376,209,22),(3377,209,23),(3378,209,24),(3379,209,25),(3380,209,26),(3381,209,27),(3382,209,28),(3383,209,29),(3384,209,30),(3385,209,31),(3386,209,32),(3387,209,33),(3388,209,34),(3389,209,35),(3390,209,36),(3391,209,37),(3392,209,38),(3393,209,39),(3394,209,40),(3395,209,41),(3396,209,42),(3397,209,43),(3398,209,44),(3399,209,45),(3400,209,46),(3401,209,47),(3402,209,48),(3403,209,49),(3404,209,50),(3405,209,51),(3406,209,52),(3407,209,53),(3408,209,54),(3409,209,55),(3410,209,56),(3411,209,57),(3412,209,58),(3413,209,59),(3414,209,60),(3415,209,61),(3416,209,62),(3417,209,63),(3418,209,64),(3419,209,65),(3420,209,66),(3421,209,67),(3422,209,68),(3423,209,69),(3424,209,70),(3425,209,71),(3426,209,72),(3427,209,73),(3428,209,74),(3429,209,75),(3430,209,76),(3431,209,77),(3432,209,78),(3433,209,79),(3434,209,80),(3435,209,81),(3436,209,82),(3437,209,83),(3438,209,84),(3439,209,85),(3440,209,86),(3441,209,87),(3442,209,88),(3443,209,89),(3444,209,90),(3445,209,91),(3446,209,92),(3447,209,93),(3448,209,94),(3449,209,95),(3450,209,96),(3451,209,97),(3452,209,98),(3453,209,99),(3454,209,100),(3455,209,101),(3456,209,102),(3457,209,103),(3458,209,104),(3459,209,105),(3460,209,106),(3461,209,107),(3462,209,108),(3463,209,109),(3464,209,110),(3465,209,111),(3466,209,112),(3467,209,113),(3468,209,114),(3469,209,115),(3470,209,116),(3471,209,117),(3472,209,118),(3473,209,119),(3474,209,120),(3475,209,121),(3476,209,122),(3477,209,123),(3478,209,124),(3479,209,125),(3480,209,126),(3481,209,127),(3482,209,128),(3483,209,129),(3484,209,130),(3485,209,131),(3486,209,132),(3487,209,133),(3488,209,134),(3489,209,135),(3490,209,136),(3491,209,137),(3492,209,138),(3493,209,139),(3494,209,140),(3495,209,141),(3496,209,142),(3497,209,143),(3498,209,144),(3499,209,145),(3500,209,146),(3501,209,147),(3502,209,148),(3503,209,149),(3504,209,150),(3505,209,151),(3506,209,152),(3507,209,153),(3508,209,154),(3509,209,155),(3510,209,156),(3511,209,157),(3512,209,158),(3513,209,159),(3514,209,160),(3515,209,161),(3516,209,162),(3517,209,163),(3518,209,164),(3519,209,165),(3520,209,166),(3521,209,167),(3522,209,168),(3523,209,169),(3524,209,170),(3525,209,171),(3526,209,172),(3527,209,173),(3528,209,174),(3529,209,175),(3530,209,176),(3531,209,177),(3532,209,178),(3533,209,179),(3534,209,180),(3535,209,181),(3536,209,182),(3537,209,183),(3538,209,184),(3539,209,185),(3540,209,186),(3541,209,187),(3542,209,188),(3543,209,189),(3544,209,190),(3545,209,191),(3546,209,192),(3547,209,193),(3548,209,194),(3549,209,195),(3550,209,196),(3551,209,197),(3552,209,198),(3553,209,199),(3554,209,200),(3555,209,201),(3556,209,202),(3557,209,203),(3558,209,204),(3559,209,205),(3560,209,206),(3561,209,207),(3562,209,208),(3563,209,209),(3564,209,210),(3565,209,211),(3566,209,212),(3567,209,213),(3568,209,214),(3569,209,215),(3570,209,216),(3571,209,217),(3572,209,218),(3573,209,219),(3574,209,220),(3575,209,221),(3576,209,222),(3577,209,223),(3578,209,224),(3579,210,1),(3580,210,2),(3581,210,3),(3582,210,4),(3583,210,5),(3584,210,6),(3585,210,7),(3586,210,8),(3587,210,9),(3588,210,10),(3589,210,11),(3590,210,12),(3591,210,13),(3592,210,14),(3593,210,15),(3594,210,16),(3595,210,17),(3596,210,18),(3597,210,19),(3598,210,20),(3599,210,21),(3600,210,22),(3601,210,23),(3602,210,24),(3603,210,25),(3604,210,26),(3605,210,27),(3606,210,28),(3607,210,29),(3608,210,30),(3609,210,31),(3610,210,32),(3611,210,33),(3612,210,34),(3613,210,35),(3614,210,36),(3615,210,37),(3616,210,38),(3617,210,39),(3618,210,40),(3619,210,41),(3620,210,42),(3621,210,43),(3622,210,44),(3623,210,45),(3624,210,46),(3625,210,47),(3626,210,48),(3627,210,49),(3628,210,50),(3629,210,51),(3630,210,52),(3631,210,53),(3632,210,54),(3633,210,55),(3634,210,56),(3635,210,57),(3636,210,58),(3637,210,59),(3638,210,60),(3639,210,61),(3640,210,62),(3641,210,63),(3642,210,64),(3643,210,65),(3644,210,66),(3645,210,67),(3646,210,68),(3647,210,69),(3648,210,70),(3649,210,71),(3650,210,72),(3651,210,73),(3652,210,74),(3653,210,75),(3654,210,76),(3655,210,77),(3656,210,78),(3657,210,79),(3658,210,80),(3659,210,81),(3660,210,82),(3661,210,83),(3662,210,84),(3663,210,85),(3664,210,86),(3665,210,87),(3666,210,88),(3667,210,89),(3668,210,90),(3669,210,91),(3670,210,92),(3671,210,93),(3672,210,94),(3673,210,95),(3674,210,96),(3675,210,97),(3676,210,98),(3677,210,99),(3678,210,100),(3679,210,101),(3680,210,102),(3681,210,103),(3682,210,104),(3683,210,105),(3684,210,106),(3685,210,107),(3686,210,108),(3687,210,109),(3688,210,110),(3689,210,111),(3690,210,112),(3691,210,113),(3692,210,114),(3693,210,115),(3694,210,116),(3695,210,117),(3696,210,118),(3697,210,119),(3698,210,120),(3699,210,121),(3700,210,122),(3701,210,123),(3702,210,124),(3703,210,125),(3704,210,126),(3705,210,127),(3706,210,128),(3707,210,129),(3708,210,130),(3709,210,131),(3710,210,132),(3711,210,133),(3712,210,134),(3713,210,135),(3714,210,136),(3715,210,137),(3716,210,138),(3717,210,139),(3718,210,140),(3719,210,141),(3720,210,142),(3721,210,143),(3722,210,144),(3723,210,145),(3724,210,146),(3725,210,147),(3726,210,148),(3727,210,149),(3728,210,150),(3729,210,151),(3730,210,152),(3731,210,153),(3732,210,154),(3733,210,155),(3734,210,156),(3735,210,157),(3736,210,158),(3737,210,159),(3738,210,160),(3739,210,161),(3740,210,162),(3741,210,163),(3742,210,164),(3743,210,165),(3744,210,166),(3745,210,167),(3746,210,168),(3747,210,169),(3748,210,170),(3749,210,171),(3750,210,172),(3751,210,173),(3752,210,174),(3753,210,175),(3754,210,176),(3755,210,177),(3756,210,178),(3757,210,179),(3758,210,180),(3759,210,181),(3760,210,182),(3761,210,183),(3762,210,184),(3763,210,185),(3764,210,186),(3765,210,187),(3766,210,188),(3767,210,189),(3768,210,190),(3769,210,191),(3770,210,192),(3771,210,193),(3772,210,194),(3773,210,195),(3774,210,196),(3775,210,197),(3776,210,198),(3777,210,199),(3778,210,200),(3779,210,201),(3780,210,202),(3781,210,203),(3782,210,204),(3783,210,205),(3784,210,206),(3785,210,207),(3786,210,208),(3787,210,209),(3788,210,210),(3789,210,211),(3790,210,212),(3791,210,213),(3792,210,214),(3793,210,215),(3794,210,216),(3795,210,217),(3796,210,218),(3797,210,219),(3798,210,220),(3799,210,221),(3800,210,222),(3801,210,223),(3802,210,224),(3803,211,1),(3804,211,2),(3805,211,3),(3806,211,4),(3807,211,5),(3808,211,6),(3809,211,7),(3810,211,8),(3811,211,9),(3812,211,10),(3813,211,11),(3814,211,12),(3815,211,13),(3816,211,14),(3817,211,15),(3818,211,16),(3819,211,17),(3820,211,18),(3821,211,19),(3822,211,20),(3823,211,21),(3824,211,22),(3825,211,23),(3826,211,24),(3827,211,25),(3828,211,26),(3829,211,27),(3830,211,28),(3831,211,29),(3832,211,30),(3833,211,31),(3834,211,32),(3835,211,33),(3836,211,34),(3837,211,35),(3838,211,36),(3839,211,37),(3840,211,38),(3841,211,39),(3842,211,40),(3843,211,41),(3844,211,42),(3845,211,43),(3846,211,44),(3847,211,45),(3848,211,46),(3849,211,47),(3850,211,48),(3851,211,49),(3852,211,50),(3853,211,51),(3854,211,52),(3855,211,53),(3856,211,54),(3857,211,55),(3858,211,56),(3859,211,57),(3860,211,58),(3861,211,59),(3862,211,60),(3863,211,61),(3864,211,62),(3865,211,63),(3866,211,64),(3867,211,65),(3868,211,66),(3869,211,67),(3870,211,68),(3871,211,69),(3872,211,70),(3873,211,71),(3874,211,72),(3875,211,73),(3876,211,74),(3877,211,75),(3878,211,76),(3879,211,77),(3880,211,78),(3881,211,79),(3882,211,80),(3883,211,81),(3884,211,82),(3885,211,83),(3886,211,84),(3887,211,85),(3888,211,86),(3889,211,87),(3890,211,88),(3891,211,89),(3892,211,90),(3893,211,91),(3894,211,92),(3895,211,93),(3896,211,94),(3897,211,95),(3898,211,96),(3899,211,97),(3900,211,98),(3901,211,99),(3902,211,100),(3903,211,101),(3904,211,102),(3905,211,103),(3906,211,104),(3907,211,105),(3908,211,106),(3909,211,107),(3910,211,108),(3911,211,109),(3912,211,110),(3913,211,111),(3914,211,112),(3915,211,113),(3916,211,114),(3917,211,115),(3918,211,116),(3919,211,117),(3920,211,118),(3921,211,119),(3922,211,120),(3923,211,121),(3924,211,122),(3925,211,123),(3926,211,124),(3927,211,125),(3928,211,126),(3929,211,127),(3930,211,128),(3931,211,129),(3932,211,130),(3933,211,131),(3934,211,132),(3935,211,133),(3936,211,134),(3937,211,135),(3938,211,136),(3939,211,137),(3940,211,138),(3941,211,139),(3942,211,140),(3943,211,141),(3944,211,142),(3945,211,143),(3946,211,144),(3947,211,145),(3948,211,146),(3949,211,147),(3950,211,148),(3951,211,149),(3952,211,150),(3953,211,151),(3954,211,152),(3955,211,153),(3956,211,154),(3957,211,155),(3958,211,156),(3959,211,157),(3960,211,158),(3961,211,159),(3962,211,160),(3963,211,161),(3964,211,162),(3965,211,163),(3966,211,164),(3967,211,165),(3968,211,166),(3969,211,167),(3970,211,168),(3971,211,169),(3972,211,170),(3973,211,171),(3974,211,172),(3975,211,173),(3976,211,174),(3977,211,175),(3978,211,176),(3979,211,177),(3980,211,178),(3981,211,179),(3982,211,180),(3983,211,181),(3984,211,182),(3985,211,183),(3986,211,184),(3987,211,185),(3988,211,186),(3989,211,187),(3990,211,188),(3991,211,189),(3992,211,190),(3993,211,191),(3994,211,192),(3995,211,193),(3996,211,194),(3997,211,195),(3998,211,196),(3999,211,197),(4000,211,198),(4001,211,199),(4002,211,200),(4003,211,201),(4004,211,202),(4005,211,203),(4006,211,204),(4007,211,205),(4008,211,206),(4009,211,207),(4010,211,208),(4011,211,209),(4012,211,210),(4013,211,211),(4014,211,212),(4015,211,213),(4016,211,214),(4017,211,215),(4018,211,216),(4019,211,217),(4020,211,218),(4021,211,219),(4022,211,220),(4023,211,221),(4024,211,222),(4025,211,223),(4026,211,224),(4027,212,1),(4028,212,2),(4029,212,3),(4030,212,4),(4031,212,5),(4032,212,6),(4033,212,7),(4034,212,8),(4035,212,9),(4036,212,10),(4037,212,11),(4038,212,12),(4039,212,13),(4040,212,14),(4041,212,15),(4042,212,16),(4043,212,17),(4044,212,18),(4045,212,19),(4046,212,20),(4047,212,21),(4048,212,22),(4049,212,23),(4050,212,24),(4051,212,25),(4052,212,26),(4053,212,27),(4054,212,28),(4055,212,29),(4056,212,30),(4057,212,31),(4058,212,32),(4059,212,33),(4060,212,34),(4061,212,35),(4062,212,36),(4063,212,37),(4064,212,38),(4065,212,39),(4066,212,40),(4067,212,41),(4068,212,42),(4069,212,43),(4070,212,44),(4071,212,45),(4072,212,46),(4073,212,47),(4074,212,48),(4075,212,49),(4076,212,50),(4077,212,51),(4078,212,52),(4079,212,53),(4080,212,54),(4081,212,55),(4082,212,56),(4083,212,57),(4084,212,58),(4085,212,59),(4086,212,60),(4087,212,61),(4088,212,62),(4089,212,63),(4090,212,64),(4091,212,65),(4092,212,66),(4093,212,67),(4094,212,68),(4095,212,69),(4096,212,70),(4097,212,71),(4098,212,72),(4099,212,73),(4100,212,74),(4101,212,75),(4102,212,76),(4103,212,77),(4104,212,78),(4105,212,79),(4106,212,80),(4107,212,81),(4108,212,82),(4109,212,83),(4110,212,84),(4111,212,85),(4112,212,86),(4113,212,87),(4114,212,88),(4115,212,89),(4116,212,90),(4117,212,91),(4118,212,92),(4119,212,93),(4120,212,94),(4121,212,95),(4122,212,96),(4123,212,97),(4124,212,98),(4125,212,99),(4126,212,100),(4127,212,101),(4128,212,102),(4129,212,103),(4130,212,104),(4131,212,105),(4132,212,106),(4133,212,107),(4134,212,108),(4135,212,109),(4136,212,110),(4137,212,111),(4138,212,112),(4139,212,113),(4140,212,114),(4141,212,115),(4142,212,116),(4143,212,117),(4144,212,118),(4145,212,119),(4146,212,120),(4147,212,121),(4148,212,122),(4149,212,123),(4150,212,124),(4151,212,125),(4152,212,126),(4153,212,127),(4154,212,128),(4155,212,129),(4156,212,130),(4157,212,131),(4158,212,132),(4159,212,133),(4160,212,134),(4161,212,135),(4162,212,136),(4163,212,137),(4164,212,138),(4165,212,139),(4166,212,140),(4167,212,141),(4168,212,142),(4169,212,143),(4170,212,144),(4171,212,145),(4172,212,146),(4173,212,147),(4174,212,148),(4175,212,149),(4176,212,150),(4177,212,151),(4178,212,152),(4179,212,153),(4180,212,154),(4181,212,155),(4182,212,156),(4183,212,157),(4184,212,158),(4185,212,159),(4186,212,160),(4187,212,161),(4188,212,162),(4189,212,163),(4190,212,164),(4191,212,165),(4192,212,166),(4193,212,167),(4194,212,168),(4195,212,169),(4196,212,170),(4197,212,171),(4198,212,172),(4199,212,173),(4200,212,174),(4201,212,175),(4202,212,176),(4203,212,177),(4204,212,178),(4205,212,179),(4206,212,180),(4207,212,181),(4208,212,182),(4209,212,183),(4210,212,184),(4211,212,185),(4212,212,186),(4213,212,187),(4214,212,188),(4215,212,189),(4216,212,190),(4217,212,191),(4218,212,192),(4219,212,193),(4220,212,194),(4221,212,195),(4222,212,196),(4223,212,197),(4224,212,198),(4225,212,199),(4226,212,200),(4227,212,201),(4228,212,202),(4229,212,203),(4230,212,204),(4231,212,205),(4232,212,206),(4233,212,207),(4234,212,208),(4235,212,209),(4236,212,210),(4237,212,211),(4238,212,212),(4239,212,213),(4240,212,214),(4241,212,215),(4242,212,216),(4243,212,217),(4244,212,218),(4245,212,219),(4246,212,220),(4247,212,221),(4248,212,222),(4249,212,223),(4250,212,224),(4251,213,1),(4252,213,2),(4253,213,3),(4254,213,4),(4255,213,5),(4256,213,6),(4257,213,7),(4258,213,8),(4259,213,9),(4260,213,10),(4261,213,11),(4262,213,12),(4263,213,13),(4264,213,14),(4265,213,15),(4266,213,16),(4267,213,17),(4268,213,18),(4269,213,19),(4270,213,20),(4271,213,21),(4272,213,22),(4273,213,23),(4274,213,24),(4275,213,25),(4276,213,26),(4277,213,27),(4278,213,28),(4279,213,29),(4280,213,30),(4281,213,31),(4282,213,32),(4283,213,33),(4284,213,34),(4285,213,35),(4286,213,36),(4287,213,37),(4288,213,38),(4289,213,39),(4290,213,40),(4291,213,41),(4292,213,42),(4293,213,43),(4294,213,44),(4295,213,45),(4296,213,46),(4297,213,47),(4298,213,48),(4299,213,49),(4300,213,50),(4301,213,51),(4302,213,52),(4303,213,53),(4304,213,54),(4305,213,55),(4306,213,56),(4307,213,57),(4308,213,58),(4309,213,59),(4310,213,60),(4311,213,61),(4312,213,62),(4313,213,63),(4314,213,64),(4315,213,65),(4316,213,66),(4317,213,67),(4318,213,68),(4319,213,69),(4320,213,70),(4321,213,71),(4322,213,72),(4323,213,73),(4324,213,74),(4325,213,75),(4326,213,76),(4327,213,77),(4328,213,78),(4329,213,79),(4330,213,80),(4331,213,81),(4332,213,82),(4333,213,83),(4334,213,84),(4335,213,85),(4336,213,86),(4337,213,87),(4338,213,88),(4339,213,89),(4340,213,90),(4341,213,91),(4342,213,92),(4343,213,93),(4344,213,94),(4345,213,95),(4346,213,96),(4347,213,97),(4348,213,98),(4349,213,99),(4350,213,100),(4351,213,101),(4352,213,102),(4353,213,103),(4354,213,104),(4355,213,105),(4356,213,106),(4357,213,107),(4358,213,108),(4359,213,109),(4360,213,110),(4361,213,111),(4362,213,112),(4363,213,113),(4364,213,114),(4365,213,115),(4366,213,116),(4367,213,117),(4368,213,118),(4369,213,119),(4370,213,120),(4371,213,121),(4372,213,122),(4373,213,123),(4374,213,124),(4375,213,125),(4376,213,126),(4377,213,127),(4378,213,128),(4379,213,129),(4380,213,130),(4381,213,131),(4382,213,132),(4383,213,133),(4384,213,134),(4385,213,135),(4386,213,136),(4387,213,137),(4388,213,138),(4389,213,139),(4390,213,140),(4391,213,141),(4392,213,142),(4393,213,143),(4394,213,144),(4395,213,145),(4396,213,146),(4397,213,147),(4398,213,148),(4399,213,149),(4400,213,150),(4401,213,151),(4402,213,152),(4403,213,153),(4404,213,154),(4405,213,155),(4406,213,156),(4407,213,157),(4408,213,158),(4409,213,159),(4410,213,160),(4411,213,161),(4412,213,162),(4413,213,163),(4414,213,164),(4415,213,165),(4416,213,166),(4417,213,167),(4418,213,168),(4419,213,169),(4420,213,170),(4421,213,171),(4422,213,172),(4423,213,173),(4424,213,174),(4425,213,175),(4426,213,176),(4427,213,177),(4428,213,178),(4429,213,179),(4430,213,180),(4431,213,181),(4432,213,182),(4433,213,183),(4434,213,184),(4435,213,185),(4436,213,186),(4437,213,187),(4438,213,188),(4439,213,189),(4440,213,190),(4441,213,191),(4442,213,192),(4443,213,193),(4444,213,194),(4445,213,195),(4446,213,196),(4447,213,197),(4448,213,198),(4449,213,199),(4450,213,200),(4451,213,201),(4452,213,202),(4453,213,203),(4454,213,204),(4455,213,205),(4456,213,206),(4457,213,207),(4458,213,208),(4459,213,209),(4460,213,210),(4461,213,211),(4462,213,212),(4463,213,213),(4464,213,214),(4465,213,215),(4466,213,216),(4467,213,217),(4468,213,218),(4469,213,219),(4470,213,220),(4471,213,221),(4472,213,222),(4473,213,223),(4474,213,224),(4475,214,1),(4476,214,2),(4477,214,3),(4478,214,4),(4479,214,5),(4480,214,6),(4481,214,7),(4482,214,8),(4483,214,9),(4484,214,10),(4485,214,11),(4486,214,12),(4487,214,13),(4488,214,14),(4489,214,15),(4490,214,16),(4491,214,17),(4492,214,18),(4493,214,19),(4494,214,20),(4495,214,21),(4496,214,22),(4497,214,23),(4498,214,24),(4499,214,25),(4500,214,26),(4501,214,27),(4502,214,28),(4503,214,29),(4504,214,30),(4505,214,31),(4506,214,32),(4507,214,33),(4508,214,34),(4509,214,35),(4510,214,36),(4511,214,37),(4512,214,38),(4513,214,39),(4514,214,40),(4515,214,41),(4516,214,42),(4517,214,43),(4518,214,44),(4519,214,45),(4520,214,46),(4521,214,47),(4522,214,48),(4523,214,49),(4524,214,50),(4525,214,51),(4526,214,52),(4527,214,53),(4528,214,54),(4529,214,55),(4530,214,56),(4531,214,57),(4532,214,58),(4533,214,59),(4534,214,60),(4535,214,61),(4536,214,62),(4537,214,63),(4538,214,64),(4539,214,65),(4540,214,66),(4541,214,67),(4542,214,68),(4543,214,69),(4544,214,70),(4545,214,71),(4546,214,72),(4547,214,73),(4548,214,74),(4549,214,75),(4550,214,76),(4551,214,77),(4552,214,78),(4553,214,79),(4554,214,80),(4555,214,81),(4556,214,82),(4557,214,83),(4558,214,84),(4559,214,85),(4560,214,86),(4561,214,87),(4562,214,88),(4563,214,89),(4564,214,90),(4565,214,91),(4566,214,92),(4567,214,93),(4568,214,94),(4569,214,95),(4570,214,96),(4571,214,97),(4572,214,98),(4573,214,99),(4574,214,100),(4575,214,101),(4576,214,102),(4577,214,103),(4578,214,104),(4579,214,105),(4580,214,106),(4581,214,107),(4582,214,108),(4583,214,109),(4584,214,110),(4585,214,111),(4586,214,112),(4587,214,113),(4588,214,114),(4589,214,115),(4590,214,116),(4591,214,117),(4592,214,118),(4593,214,119),(4594,214,120),(4595,214,121),(4596,214,122),(4597,214,123),(4598,214,124),(4599,214,125),(4600,214,126),(4601,214,127),(4602,214,128),(4603,214,129),(4604,214,130),(4605,214,131),(4606,214,132),(4607,214,133),(4608,214,134),(4609,214,135),(4610,214,136),(4611,214,137),(4612,214,138),(4613,214,139),(4614,214,140),(4615,214,141),(4616,214,142),(4617,214,143),(4618,214,144),(4619,214,145),(4620,214,146),(4621,214,147),(4622,214,148),(4623,214,149),(4624,214,150),(4625,214,151),(4626,214,152),(4627,214,153),(4628,214,154),(4629,214,155),(4630,214,156),(4631,214,157),(4632,214,158),(4633,214,159),(4634,214,160),(4635,214,161),(4636,214,162),(4637,214,163),(4638,214,164),(4639,214,165),(4640,214,166),(4641,214,167),(4642,214,168),(4643,214,169),(4644,214,170),(4645,214,171),(4646,214,172),(4647,214,173),(4648,214,174),(4649,214,175),(4650,214,176),(4651,214,177),(4652,214,178),(4653,214,179),(4654,214,180),(4655,214,181),(4656,214,182),(4657,214,183),(4658,214,184),(4659,214,185),(4660,214,186),(4661,214,187),(4662,214,188),(4663,214,189),(4664,214,190),(4665,214,191),(4666,214,192),(4667,214,193),(4668,214,194),(4669,214,195),(4670,214,196),(4671,214,197),(4672,214,198),(4673,214,199),(4674,214,200),(4675,214,201),(4676,214,202),(4677,214,203),(4678,214,204),(4679,214,205),(4680,214,206),(4681,214,207),(4682,214,208),(4683,214,209),(4684,214,210),(4685,214,211),(4686,214,212),(4687,214,213),(4688,214,214),(4689,214,215),(4690,214,216),(4691,214,217),(4692,214,218),(4693,214,219),(4694,214,220),(4695,214,221),(4696,214,222),(4697,214,223),(4698,214,224),(4699,215,1),(4700,215,2),(4701,215,3),(4702,215,4),(4703,215,5),(4704,215,6),(4705,215,7),(4706,215,8),(4707,215,9),(4708,215,10),(4709,215,11),(4710,215,12),(4711,215,13),(4712,215,14),(4713,215,15),(4714,215,16),(4715,215,17),(4716,215,18),(4717,215,19),(4718,215,20),(4719,215,21),(4720,215,22),(4721,215,23),(4722,215,24),(4723,215,25),(4724,215,26),(4725,215,27),(4726,215,28),(4727,215,29),(4728,215,30),(4729,215,31),(4730,215,32),(4731,215,33),(4732,215,34),(4733,215,35),(4734,215,36),(4735,215,37),(4736,215,38),(4737,215,39),(4738,215,40),(4739,215,41),(4740,215,42),(4741,215,43),(4742,215,44),(4743,215,45),(4744,215,46),(4745,215,47),(4746,215,48),(4747,215,49),(4748,215,50),(4749,215,51),(4750,215,52),(4751,215,53),(4752,215,54),(4753,215,55),(4754,215,56),(4755,215,57),(4756,215,58),(4757,215,59),(4758,215,60),(4759,215,61),(4760,215,62),(4761,215,63),(4762,215,64),(4763,215,65),(4764,215,66),(4765,215,67),(4766,215,68),(4767,215,69),(4768,215,70),(4769,215,71),(4770,215,72),(4771,215,73),(4772,215,74),(4773,215,75),(4774,215,76),(4775,215,77),(4776,215,78),(4777,215,79),(4778,215,80),(4779,215,81),(4780,215,82),(4781,215,83),(4782,215,84),(4783,215,85),(4784,215,86),(4785,215,87),(4786,215,88),(4787,215,89),(4788,215,90),(4789,215,91),(4790,215,92),(4791,215,93),(4792,215,94),(4793,215,95),(4794,215,96),(4795,215,97),(4796,215,98),(4797,215,99),(4798,215,100),(4799,215,101),(4800,215,102),(4801,215,103),(4802,215,104),(4803,215,105),(4804,215,106),(4805,215,107),(4806,215,108),(4807,215,109),(4808,215,110),(4809,215,111),(4810,215,112),(4811,215,113),(4812,215,114),(4813,215,115),(4814,215,116),(4815,215,117),(4816,215,118),(4817,215,119),(4818,215,120),(4819,215,121),(4820,215,122),(4821,215,123),(4822,215,124),(4823,215,125),(4824,215,126),(4825,215,127),(4826,215,128),(4827,215,129),(4828,215,130),(4829,215,131),(4830,215,132),(4831,215,133),(4832,215,134),(4833,215,135),(4834,215,136),(4835,215,137),(4836,215,138),(4837,215,139),(4838,215,140),(4839,215,141),(4840,215,142),(4841,215,143),(4842,215,144),(4843,215,145),(4844,215,146),(4845,215,147),(4846,215,148),(4847,215,149),(4848,215,150),(4849,215,151),(4850,215,152),(4851,215,153),(4852,215,154),(4853,215,155),(4854,215,156),(4855,215,157),(4856,215,158),(4857,215,159),(4858,215,160),(4859,215,161),(4860,215,162),(4861,215,163),(4862,215,164),(4863,215,165),(4864,215,166),(4865,215,167),(4866,215,168),(4867,215,169),(4868,215,170),(4869,215,171),(4870,215,172),(4871,215,173),(4872,215,174),(4873,215,175),(4874,215,176),(4875,215,177),(4876,215,178),(4877,215,179),(4878,215,180),(4879,215,181),(4880,215,182),(4881,215,183),(4882,215,184),(4883,215,185),(4884,215,186),(4885,215,187),(4886,215,188),(4887,215,189),(4888,215,190),(4889,215,191),(4890,215,192),(4891,215,193),(4892,215,194),(4893,215,195),(4894,215,196),(4895,215,197),(4896,215,198),(4897,215,199),(4898,215,200),(4899,215,201),(4900,215,202),(4901,215,203),(4902,215,204),(4903,215,205),(4904,215,206),(4905,215,207),(4906,215,208),(4907,215,209),(4908,215,210),(4909,215,211),(4910,215,212),(4911,215,213),(4912,215,214),(4913,215,215),(4914,215,216),(4915,215,217),(4916,215,218),(4917,215,219),(4918,215,220),(4919,215,221),(4920,215,222),(4921,215,223),(4922,215,224),(4923,216,1),(4924,216,2),(4925,216,3),(4926,216,4),(4927,216,5),(4928,216,6),(4929,216,7),(4930,216,8),(4931,216,9),(4932,216,10),(4933,216,11),(4934,216,12),(4935,216,13),(4936,216,14),(4937,216,15),(4938,216,16),(4939,216,17),(4940,216,18),(4941,216,19),(4942,216,20),(4943,216,21),(4944,216,22),(4945,216,23),(4946,216,24),(4947,216,25),(4948,216,26),(4949,216,27),(4950,216,28),(4951,216,29),(4952,216,30),(4953,216,31),(4954,216,32),(4955,216,33),(4956,216,34),(4957,216,35),(4958,216,36),(4959,216,37),(4960,216,38),(4961,216,39),(4962,216,40),(4963,216,41),(4964,216,42),(4965,216,43),(4966,216,44),(4967,216,45),(4968,216,46),(4969,216,47),(4970,216,48),(4971,216,49),(4972,216,50),(4973,216,51),(4974,216,52),(4975,216,53),(4976,216,54),(4977,216,55),(4978,216,56),(4979,216,57),(4980,216,58),(4981,216,59),(4982,216,60),(4983,216,61),(4984,216,62),(4985,216,63),(4986,216,64),(4987,216,65),(4988,216,66),(4989,216,67),(4990,216,68),(4991,216,69),(4992,216,70),(4993,216,71),(4994,216,72),(4995,216,73),(4996,216,74),(4997,216,75),(4998,216,76),(4999,216,77),(5000,216,78),(5001,216,79),(5002,216,80),(5003,216,81),(5004,216,82),(5005,216,83),(5006,216,84),(5007,216,85),(5008,216,86),(5009,216,87),(5010,216,88),(5011,216,89),(5012,216,90),(5013,216,91),(5014,216,92),(5015,216,93),(5016,216,94),(5017,216,95),(5018,216,96),(5019,216,97),(5020,216,98),(5021,216,99),(5022,216,100),(5023,216,101),(5024,216,102),(5025,216,103),(5026,216,104),(5027,216,105),(5028,216,106),(5029,216,107),(5030,216,108),(5031,216,109),(5032,216,110),(5033,216,111),(5034,216,112),(5035,216,113),(5036,216,114),(5037,216,115),(5038,216,116),(5039,216,117),(5040,216,118),(5041,216,119),(5042,216,120),(5043,216,121),(5044,216,122),(5045,216,123),(5046,216,124),(5047,216,125),(5048,216,126),(5049,216,127),(5050,216,128),(5051,216,129),(5052,216,130),(5053,216,131),(5054,216,132),(5055,216,133),(5056,216,134),(5057,216,135),(5058,216,136),(5059,216,137),(5060,216,138),(5061,216,139),(5062,216,140),(5063,216,141),(5064,216,142),(5065,216,143),(5066,216,144),(5067,216,145),(5068,216,146),(5069,216,147),(5070,216,148),(5071,216,149),(5072,216,150),(5073,216,151),(5074,216,152),(5075,216,153),(5076,216,154),(5077,216,155),(5078,216,156),(5079,216,157),(5080,216,158),(5081,216,159),(5082,216,160),(5083,216,161),(5084,216,162),(5085,216,163),(5086,216,164),(5087,216,165),(5088,216,166),(5089,216,167),(5090,216,168),(5091,216,169),(5092,216,170),(5093,216,171),(5094,216,172),(5095,216,173),(5096,216,174),(5097,216,175),(5098,216,176),(5099,216,177),(5100,216,178),(5101,216,179),(5102,216,180),(5103,216,181),(5104,216,182),(5105,216,183),(5106,216,184),(5107,216,185),(5108,216,186),(5109,216,187),(5110,216,188),(5111,216,189),(5112,216,190),(5113,216,191),(5114,216,192),(5115,216,193),(5116,216,194),(5117,216,195),(5118,216,196),(5119,216,197),(5120,216,198),(5121,216,199),(5122,216,200),(5123,216,201),(5124,216,202),(5125,216,203),(5126,216,204),(5127,216,205),(5128,216,206),(5129,216,207),(5130,216,208),(5131,216,209),(5132,216,210),(5133,216,211),(5134,216,212),(5135,216,213),(5136,216,214),(5137,216,215),(5138,216,216),(5139,216,217),(5140,216,218),(5141,216,219),(5142,216,220),(5143,216,221),(5144,216,222),(5145,216,223),(5146,216,224),(5147,217,1),(5148,217,2),(5149,217,3),(5150,217,4),(5151,217,5),(5152,217,6),(5153,217,7),(5154,217,8),(5155,217,9),(5156,217,10),(5157,217,11),(5158,217,12),(5159,217,13),(5160,217,14),(5161,217,15),(5162,217,16),(5163,217,17),(5164,217,18),(5165,217,19),(5166,217,20),(5167,217,21),(5168,217,22),(5169,217,23),(5170,217,24),(5171,217,25),(5172,217,26),(5173,217,27),(5174,217,28),(5175,217,29),(5176,217,30),(5177,217,31),(5178,217,32),(5179,217,33),(5180,217,34),(5181,217,35),(5182,217,36),(5183,217,37),(5184,217,38),(5185,217,39),(5186,217,40),(5187,217,41),(5188,217,42),(5189,217,43),(5190,217,44),(5191,217,45),(5192,217,46),(5193,217,47),(5194,217,48),(5195,217,49),(5196,217,50),(5197,217,51),(5198,217,52),(5199,217,53),(5200,217,54),(5201,217,55),(5202,217,56),(5203,217,57),(5204,217,58),(5205,217,59),(5206,217,60),(5207,217,61),(5208,217,62),(5209,217,63),(5210,217,64),(5211,217,65),(5212,217,66),(5213,217,67),(5214,217,68),(5215,217,69),(5216,217,70),(5217,217,71),(5218,217,72),(5219,217,73),(5220,217,74),(5221,217,75),(5222,217,76),(5223,217,77),(5224,217,78),(5225,217,79),(5226,217,80),(5227,217,81),(5228,217,82),(5229,217,83),(5230,217,84),(5231,217,85),(5232,217,86),(5233,217,87),(5234,217,88),(5235,217,89),(5236,217,90),(5237,217,91),(5238,217,92),(5239,217,93),(5240,217,94),(5241,217,95),(5242,217,96),(5243,217,97),(5244,217,98),(5245,217,99),(5246,217,100),(5247,217,101),(5248,217,102),(5249,217,103),(5250,217,104),(5251,217,105),(5252,217,106),(5253,217,107),(5254,217,108),(5255,217,109),(5256,217,110),(5257,217,111),(5258,217,112),(5259,217,113),(5260,217,114),(5261,217,115),(5262,217,116),(5263,217,117),(5264,217,118),(5265,217,119),(5266,217,120),(5267,217,121),(5268,217,122),(5269,217,123),(5270,217,124),(5271,217,125),(5272,217,126),(5273,217,127),(5274,217,128),(5275,217,129),(5276,217,130),(5277,217,131),(5278,217,132),(5279,217,133),(5280,217,134),(5281,217,135),(5282,217,136),(5283,217,137),(5284,217,138),(5285,217,139),(5286,217,140),(5287,217,141),(5288,217,142),(5289,217,143),(5290,217,144),(5291,217,145),(5292,217,146),(5293,217,147),(5294,217,148),(5295,217,149),(5296,217,150),(5297,217,151),(5298,217,152),(5299,217,153),(5300,217,154),(5301,217,155),(5302,217,156),(5303,217,157),(5304,217,158),(5305,217,159),(5306,217,160),(5307,217,161),(5308,217,162),(5309,217,163),(5310,217,164),(5311,217,165),(5312,217,166),(5313,217,167),(5314,217,168),(5315,217,169),(5316,217,170),(5317,217,171),(5318,217,172),(5319,217,173),(5320,217,174),(5321,217,175),(5322,217,176),(5323,217,177),(5324,217,178),(5325,217,179),(5326,217,180),(5327,217,181),(5328,217,182),(5329,217,183),(5330,217,184),(5331,217,185),(5332,217,186),(5333,217,187),(5334,217,188),(5335,217,189),(5336,217,190),(5337,217,191),(5338,217,192),(5339,217,193),(5340,217,194),(5341,217,195),(5342,217,196),(5343,217,197),(5344,217,198),(5345,217,199),(5346,217,200),(5347,217,201),(5348,217,202),(5349,217,203),(5350,217,204),(5351,217,205),(5352,217,206),(5353,217,207),(5354,217,208),(5355,217,209),(5356,217,210),(5357,217,211),(5358,217,212),(5359,217,213),(5360,217,214),(5361,217,215),(5362,217,216),(5363,217,217),(5364,217,218),(5365,217,219),(5366,217,220),(5367,217,221),(5368,217,222),(5369,217,223),(5370,217,224),(5371,218,1),(5372,218,2),(5373,218,3),(5374,218,4),(5375,218,5),(5376,218,6),(5377,218,7),(5378,218,8),(5379,218,9),(5380,218,10),(5381,218,11),(5382,218,12),(5383,218,13),(5384,218,14),(5385,218,15),(5386,218,16),(5387,218,17),(5388,218,18),(5389,218,19),(5390,218,20),(5391,218,21),(5392,218,22),(5393,218,23),(5394,218,24),(5395,218,25),(5396,218,26),(5397,218,27),(5398,218,28),(5399,218,29),(5400,218,30),(5401,218,31),(5402,218,32),(5403,218,33),(5404,218,34),(5405,218,35),(5406,218,36),(5407,218,37),(5408,218,38),(5409,218,39),(5410,218,40),(5411,218,41),(5412,218,42),(5413,218,43),(5414,218,44),(5415,218,45),(5416,218,46),(5417,218,47),(5418,218,48),(5419,218,49),(5420,218,50),(5421,218,51),(5422,218,52),(5423,218,53),(5424,218,54),(5425,218,55),(5426,218,56),(5427,218,57),(5428,218,58),(5429,218,59),(5430,218,60),(5431,218,61),(5432,218,62),(5433,218,63),(5434,218,64),(5435,218,65),(5436,218,66),(5437,218,67),(5438,218,68),(5439,218,69),(5440,218,70),(5441,218,71),(5442,218,72),(5443,218,73),(5444,218,74),(5445,218,75),(5446,218,76),(5447,218,77),(5448,218,78),(5449,218,79),(5450,218,80),(5451,218,81),(5452,218,82),(5453,218,83),(5454,218,84),(5455,218,85),(5456,218,86),(5457,218,87),(5458,218,88),(5459,218,89),(5460,218,90),(5461,218,91),(5462,218,92),(5463,218,93),(5464,218,94),(5465,218,95),(5466,218,96),(5467,218,97),(5468,218,98),(5469,218,99),(5470,218,100),(5471,218,101),(5472,218,102),(5473,218,103),(5474,218,104),(5475,218,105),(5476,218,106),(5477,218,107),(5478,218,108),(5479,218,109),(5480,218,110),(5481,218,111),(5482,218,112),(5483,218,113),(5484,218,114),(5485,218,115),(5486,218,116),(5487,218,117),(5488,218,118),(5489,218,119),(5490,218,120),(5491,218,121),(5492,218,122),(5493,218,123),(5494,218,124),(5495,218,125),(5496,218,126),(5497,218,127),(5498,218,128),(5499,218,129),(5500,218,130),(5501,218,131),(5502,218,132),(5503,218,133),(5504,218,134),(5505,218,135),(5506,218,136),(5507,218,137),(5508,218,138),(5509,218,139),(5510,218,140),(5511,218,141),(5512,218,142),(5513,218,143),(5514,218,144),(5515,218,145),(5516,218,146),(5517,218,147),(5518,218,148),(5519,218,149),(5520,218,150),(5521,218,151),(5522,218,152),(5523,218,153),(5524,218,154),(5525,218,155),(5526,218,156),(5527,218,157),(5528,218,158),(5529,218,159),(5530,218,160),(5531,218,161),(5532,218,162),(5533,218,163),(5534,218,164),(5535,218,165),(5536,218,166),(5537,218,167),(5538,218,168),(5539,218,169),(5540,218,170),(5541,218,171),(5542,218,172),(5543,218,173),(5544,218,174),(5545,218,175),(5546,218,176),(5547,218,177),(5548,218,178),(5549,218,179),(5550,218,180),(5551,218,181),(5552,218,182),(5553,218,183),(5554,218,184),(5555,218,185),(5556,218,186),(5557,218,187),(5558,218,188),(5559,218,189),(5560,218,190),(5561,218,191),(5562,218,192),(5563,218,193),(5564,218,194),(5565,218,195),(5566,218,196),(5567,218,197),(5568,218,198),(5569,218,199),(5570,218,200),(5571,218,201),(5572,218,202),(5573,218,203),(5574,218,204),(5575,218,205),(5576,218,206),(5577,218,207),(5578,218,208),(5579,218,209),(5580,218,210),(5581,218,211),(5582,218,212),(5583,218,213),(5584,218,214),(5585,218,215),(5586,218,216),(5587,218,217),(5588,218,218),(5589,218,219),(5590,218,220),(5591,218,221),(5592,218,222),(5593,218,223),(5594,218,224),(5595,219,1),(5596,219,2),(5597,219,3),(5598,219,4),(5599,219,5),(5600,219,6),(5601,219,7),(5602,219,8),(5603,219,9),(5604,219,10),(5605,219,11),(5606,219,12),(5607,219,13),(5608,219,14),(5609,219,15),(5610,219,16),(5611,219,17),(5612,219,18),(5613,219,19),(5614,219,20),(5615,219,21),(5616,219,22),(5617,219,23),(5618,219,24),(5619,219,25),(5620,219,26),(5621,219,27),(5622,219,28),(5623,219,29),(5624,219,30),(5625,219,31),(5626,219,32),(5627,219,33),(5628,219,34),(5629,219,35),(5630,219,36),(5631,219,37),(5632,219,38),(5633,219,39),(5634,219,40),(5635,219,41),(5636,219,42),(5637,219,43),(5638,219,44),(5639,219,45),(5640,219,46),(5641,219,47),(5642,219,48),(5643,219,49),(5644,219,50),(5645,219,51),(5646,219,52),(5647,219,53),(5648,219,54),(5649,219,55),(5650,219,56),(5651,219,57),(5652,219,58),(5653,219,59),(5654,219,60),(5655,219,61),(5656,219,62),(5657,219,63),(5658,219,64),(5659,219,65),(5660,219,66),(5661,219,67),(5662,219,68),(5663,219,69),(5664,219,70),(5665,219,71),(5666,219,72),(5667,219,73),(5668,219,74),(5669,219,75),(5670,219,76),(5671,219,77),(5672,219,78),(5673,219,79),(5674,219,80),(5675,219,81),(5676,219,82),(5677,219,83),(5678,219,84),(5679,219,85),(5680,219,86),(5681,219,87),(5682,219,88),(5683,219,89),(5684,219,90),(5685,219,91),(5686,219,92),(5687,219,93),(5688,219,94),(5689,219,95),(5690,219,96),(5691,219,97),(5692,219,98),(5693,219,99),(5694,219,100),(5695,219,101),(5696,219,102),(5697,219,103),(5698,219,104),(5699,219,105),(5700,219,106),(5701,219,107),(5702,219,108),(5703,219,109),(5704,219,110),(5705,219,111),(5706,219,112),(5707,219,113),(5708,219,114),(5709,219,115),(5710,219,116),(5711,219,117),(5712,219,118),(5713,219,119),(5714,219,120),(5715,219,121),(5716,219,122),(5717,219,123),(5718,219,124),(5719,219,125),(5720,219,126),(5721,219,127),(5722,219,128),(5723,219,129),(5724,219,130),(5725,219,131),(5726,219,132),(5727,219,133),(5728,219,134),(5729,219,135),(5730,219,136),(5731,219,137),(5732,219,138),(5733,219,139),(5734,219,140),(5735,219,141),(5736,219,142),(5737,219,143),(5738,219,144),(5739,219,145),(5740,219,146),(5741,219,147),(5742,219,148),(5743,219,149),(5744,219,150),(5745,219,151),(5746,219,152),(5747,219,153),(5748,219,154),(5749,219,155),(5750,219,156),(5751,219,157),(5752,219,158),(5753,219,159),(5754,219,160),(5755,219,161),(5756,219,162),(5757,219,163),(5758,219,164),(5759,219,165),(5760,219,166),(5761,219,167),(5762,219,168),(5763,219,169),(5764,219,170),(5765,219,171),(5766,219,172),(5767,219,173),(5768,219,174),(5769,219,175),(5770,219,176),(5771,219,177),(5772,219,178),(5773,219,179),(5774,219,180),(5775,219,181),(5776,219,182),(5777,219,183),(5778,219,184),(5779,219,185),(5780,219,186),(5781,219,187),(5782,219,188),(5783,219,189),(5784,219,190),(5785,219,191),(5786,219,192),(5787,219,193),(5788,219,194),(5789,219,195),(5790,219,196),(5791,219,197),(5792,219,198),(5793,219,199),(5794,219,200),(5795,219,201),(5796,219,202),(5797,219,203),(5798,219,204),(5799,219,205),(5800,219,206),(5801,219,207),(5802,219,208),(5803,219,209),(5804,219,210),(5805,219,211),(5806,219,212),(5807,219,213),(5808,219,214),(5809,219,215),(5810,219,216),(5811,219,217),(5812,219,218),(5813,219,219),(5814,219,220),(5815,219,221),(5816,219,222),(5817,219,223),(5818,219,224),(5819,220,1),(5820,220,2),(5821,220,3),(5822,220,4),(5823,220,5),(5824,220,6),(5825,220,7),(5826,220,8),(5827,220,9),(5828,220,10),(5829,220,11),(5830,220,12),(5831,220,13),(5832,220,14),(5833,220,15),(5834,220,16),(5835,220,17),(5836,220,18),(5837,220,19),(5838,220,20),(5839,220,21),(5840,220,22),(5841,220,23),(5842,220,24),(5843,220,25),(5844,220,26),(5845,220,27),(5846,220,28),(5847,220,29),(5848,220,30),(5849,220,31),(5850,220,32),(5851,220,33),(5852,220,34),(5853,220,35),(5854,220,36),(5855,220,37),(5856,220,38),(5857,220,39),(5858,220,40),(5859,220,41),(5860,220,42),(5861,220,43),(5862,220,44),(5863,220,45),(5864,220,46),(5865,220,47),(5866,220,48),(5867,220,49),(5868,220,50),(5869,220,51),(5870,220,52),(5871,220,53),(5872,220,54),(5873,220,55),(5874,220,56),(5875,220,57),(5876,220,58),(5877,220,59),(5878,220,60),(5879,220,61),(5880,220,62),(5881,220,63),(5882,220,64),(5883,220,65),(5884,220,66),(5885,220,67),(5886,220,68),(5887,220,69),(5888,220,70),(5889,220,71),(5890,220,72),(5891,220,73),(5892,220,74),(5893,220,75),(5894,220,76),(5895,220,77),(5896,220,78),(5897,220,79),(5898,220,80),(5899,220,81),(5900,220,82),(5901,220,83),(5902,220,84),(5903,220,85),(5904,220,86),(5905,220,87),(5906,220,88),(5907,220,89),(5908,220,90),(5909,220,91),(5910,220,92),(5911,220,93),(5912,220,94),(5913,220,95),(5914,220,96),(5915,220,97),(5916,220,98),(5917,220,99),(5918,220,100),(5919,220,101),(5920,220,102),(5921,220,103),(5922,220,104),(5923,220,105),(5924,220,106),(5925,220,107),(5926,220,108),(5927,220,109),(5928,220,110),(5929,220,111),(5930,220,112),(5931,220,113),(5932,220,114),(5933,220,115),(5934,220,116),(5935,220,117),(5936,220,118),(5937,220,119),(5938,220,120),(5939,220,121),(5940,220,122),(5941,220,123),(5942,220,124),(5943,220,125),(5944,220,126),(5945,220,127),(5946,220,128),(5947,220,129),(5948,220,130),(5949,220,131),(5950,220,132),(5951,220,133),(5952,220,134),(5953,220,135),(5954,220,136),(5955,220,137),(5956,220,138),(5957,220,139),(5958,220,140),(5959,220,141),(5960,220,142),(5961,220,143),(5962,220,144),(5963,220,145),(5964,220,146),(5965,220,147),(5966,220,148),(5967,220,149),(5968,220,150),(5969,220,151),(5970,220,152),(5971,220,153),(5972,220,154),(5973,220,155),(5974,220,156),(5975,220,157),(5976,220,158),(5977,220,159),(5978,220,160),(5979,220,161),(5980,220,162),(5981,220,163),(5982,220,164),(5983,220,165),(5984,220,166),(5985,220,167),(5986,220,168),(5987,220,169),(5988,220,170),(5989,220,171),(5990,220,172),(5991,220,173),(5992,220,174),(5993,220,175),(5994,220,176),(5995,220,177),(5996,220,178),(5997,220,179),(5998,220,180),(5999,220,181),(6000,220,182),(6001,220,183),(6002,220,184),(6003,220,185),(6004,220,186),(6005,220,187),(6006,220,188),(6007,220,189),(6008,220,190),(6009,220,191),(6010,220,192),(6011,220,193),(6012,220,194),(6013,220,195),(6014,220,196),(6015,220,197),(6016,220,198),(6017,220,199),(6018,220,200),(6019,220,201),(6020,220,202),(6021,220,203),(6022,220,204),(6023,220,205),(6024,220,206),(6025,220,207),(6026,220,208),(6027,220,209),(6028,220,210),(6029,220,211),(6030,220,212),(6031,220,213),(6032,220,214),(6033,220,215),(6034,220,216),(6035,220,217),(6036,220,218),(6037,220,219),(6038,220,220),(6039,220,221),(6040,220,222),(6041,220,223),(6042,220,224),(6043,221,1),(6044,221,2),(6045,221,3),(6046,221,4),(6047,221,5),(6048,221,6),(6049,221,7),(6050,221,8),(6051,221,9),(6052,221,10),(6053,221,11),(6054,221,12),(6055,221,13),(6056,221,14),(6057,221,15),(6058,221,16),(6059,221,17),(6060,221,18),(6061,221,19),(6062,221,20),(6063,221,21),(6064,221,22),(6065,221,23),(6066,221,24),(6067,221,25),(6068,221,26),(6069,221,27),(6070,221,28),(6071,221,29),(6072,221,30),(6073,221,31),(6074,221,32),(6075,221,33),(6076,221,34),(6077,221,35),(6078,221,36),(6079,221,37),(6080,221,38),(6081,221,39),(6082,221,40),(6083,221,41),(6084,221,42),(6085,221,43),(6086,221,44),(6087,221,45),(6088,221,46),(6089,221,47),(6090,221,48),(6091,221,49),(6092,221,50),(6093,221,51),(6094,221,52),(6095,221,53),(6096,221,54),(6097,221,55),(6098,221,56),(6099,221,57),(6100,221,58),(6101,221,59),(6102,221,60),(6103,221,61),(6104,221,62),(6105,221,63),(6106,221,64),(6107,221,65),(6108,221,66),(6109,221,67),(6110,221,68),(6111,221,69),(6112,221,70),(6113,221,71),(6114,221,72),(6115,221,73),(6116,221,74),(6117,221,75),(6118,221,76),(6119,221,77),(6120,221,78),(6121,221,79),(6122,221,80),(6123,221,81),(6124,221,82),(6125,221,83),(6126,221,84),(6127,221,85),(6128,221,86),(6129,221,87),(6130,221,88),(6131,221,89),(6132,221,90),(6133,221,91),(6134,221,92),(6135,221,93),(6136,221,94),(6137,221,95),(6138,221,96),(6139,221,97),(6140,221,98),(6141,221,99),(6142,221,100),(6143,221,101),(6144,221,102),(6145,221,103),(6146,221,104),(6147,221,105),(6148,221,106),(6149,221,107),(6150,221,108),(6151,221,109),(6152,221,110),(6153,221,111),(6154,221,112),(6155,221,113),(6156,221,114),(6157,221,115),(6158,221,116),(6159,221,117),(6160,221,118),(6161,221,119),(6162,221,120),(6163,221,121),(6164,221,122),(6165,221,123),(6166,221,124),(6167,221,125),(6168,221,126),(6169,221,127),(6170,221,128),(6171,221,129),(6172,221,130),(6173,221,131),(6174,221,132),(6175,221,133),(6176,221,134),(6177,221,135),(6178,221,136),(6179,221,137),(6180,221,138),(6181,221,139),(6182,221,140),(6183,221,141),(6184,221,142),(6185,221,143),(6186,221,144),(6187,221,145),(6188,221,146),(6189,221,147),(6190,221,148),(6191,221,149),(6192,221,150),(6193,221,151),(6194,221,152),(6195,221,153),(6196,221,154),(6197,221,155),(6198,221,156),(6199,221,157),(6200,221,158),(6201,221,159),(6202,221,160),(6203,221,161),(6204,221,162),(6205,221,163),(6206,221,164),(6207,221,165),(6208,221,166),(6209,221,167),(6210,221,168),(6211,221,169),(6212,221,170),(6213,221,171),(6214,221,172),(6215,221,173),(6216,221,174),(6217,221,175),(6218,221,176),(6219,221,177),(6220,221,178),(6221,221,179),(6222,221,180),(6223,221,181),(6224,221,182),(6225,221,183),(6226,221,184),(6227,221,185),(6228,221,186),(6229,221,187),(6230,221,188),(6231,221,189),(6232,221,190),(6233,221,191),(6234,221,192),(6235,221,193),(6236,221,194),(6237,221,195),(6238,221,196),(6239,221,197),(6240,221,198),(6241,221,199),(6242,221,200),(6243,221,201),(6244,221,202),(6245,221,203),(6246,221,204),(6247,221,205),(6248,221,206),(6249,221,207),(6250,221,208),(6251,221,209),(6252,221,210),(6253,221,211),(6254,221,212),(6255,221,213),(6256,221,214),(6257,221,215),(6258,221,216),(6259,221,217),(6260,221,218),(6261,221,219),(6262,221,220),(6263,221,221),(6264,221,222),(6265,221,223),(6266,221,224),(6267,222,1),(6268,222,2),(6269,222,3),(6270,222,4),(6271,222,5),(6272,222,6),(6273,222,7),(6274,222,8),(6275,222,9),(6276,222,10),(6277,222,11),(6278,222,12),(6279,222,13),(6280,222,14),(6281,222,15),(6282,222,16),(6283,222,17),(6284,222,18),(6285,222,19),(6286,222,20),(6287,222,21),(6288,222,22),(6289,222,23),(6290,222,24),(6291,222,25),(6292,222,26),(6293,222,27),(6294,222,28),(6295,222,29),(6296,222,30),(6297,222,31),(6298,222,32),(6299,222,33),(6300,222,34),(6301,222,35),(6302,222,36),(6303,222,37),(6304,222,38),(6305,222,39),(6306,222,40),(6307,222,41),(6308,222,42),(6309,222,43),(6310,222,44),(6311,222,45),(6312,222,46),(6313,222,47),(6314,222,48),(6315,222,49),(6316,222,50),(6317,222,51),(6318,222,52),(6319,222,53),(6320,222,54),(6321,222,55),(6322,222,56),(6323,222,57),(6324,222,58),(6325,222,59),(6326,222,60),(6327,222,61),(6328,222,62),(6329,222,63),(6330,222,64),(6331,222,65),(6332,222,66),(6333,222,67),(6334,222,68),(6335,222,69),(6336,222,70),(6337,222,71),(6338,222,72),(6339,222,73),(6340,222,74),(6341,222,75),(6342,222,76),(6343,222,77),(6344,222,78),(6345,222,79),(6346,222,80),(6347,222,81),(6348,222,82),(6349,222,83),(6350,222,84),(6351,222,85),(6352,222,86),(6353,222,87),(6354,222,88),(6355,222,89),(6356,222,90),(6357,222,91),(6358,222,92),(6359,222,93),(6360,222,94),(6361,222,95),(6362,222,96),(6363,222,97),(6364,222,98),(6365,222,99),(6366,222,100),(6367,222,101),(6368,222,102),(6369,222,103),(6370,222,104),(6371,222,105),(6372,222,106),(6373,222,107),(6374,222,108),(6375,222,109),(6376,222,110),(6377,222,111),(6378,222,112),(6379,222,113),(6380,222,114),(6381,222,115),(6382,222,116),(6383,222,117),(6384,222,118),(6385,222,119),(6386,222,120),(6387,222,121),(6388,222,122),(6389,222,123),(6390,222,124),(6391,222,125),(6392,222,126),(6393,222,127),(6394,222,128),(6395,222,129),(6396,222,130),(6397,222,131),(6398,222,132),(6399,222,133),(6400,222,134),(6401,222,135),(6402,222,136),(6403,222,137),(6404,222,138),(6405,222,139),(6406,222,140),(6407,222,141),(6408,222,142),(6409,222,143),(6410,222,144),(6411,222,145),(6412,222,146),(6413,222,147),(6414,222,148),(6415,222,149),(6416,222,150),(6417,222,151),(6418,222,152),(6419,222,153),(6420,222,154),(6421,222,155),(6422,222,156),(6423,222,157),(6424,222,158),(6425,222,159),(6426,222,160),(6427,222,161),(6428,222,162),(6429,222,163),(6430,222,164),(6431,222,165),(6432,222,166),(6433,222,167),(6434,222,168),(6435,222,169),(6436,222,170),(6437,222,171),(6438,222,172),(6439,222,173),(6440,222,174),(6441,222,175),(6442,222,176),(6443,222,177),(6444,222,178),(6445,222,179),(6446,222,180),(6447,222,181),(6448,222,182),(6449,222,183),(6450,222,184),(6451,222,185),(6452,222,186),(6453,222,187),(6454,222,188),(6455,222,189),(6456,222,190),(6457,222,191),(6458,222,192),(6459,222,193),(6460,222,194),(6461,222,195),(6462,222,196),(6463,222,197),(6464,222,198),(6465,222,199),(6466,222,200),(6467,222,201),(6468,222,202),(6469,222,203),(6470,222,204),(6471,222,205),(6472,222,206),(6473,222,207),(6474,222,208),(6475,222,209),(6476,222,210),(6477,222,211),(6478,222,212),(6479,222,213),(6480,222,214),(6481,222,215),(6482,222,216),(6483,222,217),(6484,222,218),(6485,222,219),(6486,222,220),(6487,222,221),(6488,222,222),(6489,222,223),(6490,222,224),(6491,223,1),(6492,223,2),(6493,223,3),(6494,223,4),(6495,223,5),(6496,223,6),(6497,223,7),(6498,223,8),(6499,223,9),(6500,223,10),(6501,223,11),(6502,223,12),(6503,223,13),(6504,223,14),(6505,223,15),(6506,223,16),(6507,223,17),(6508,223,18),(6509,223,19),(6510,223,20),(6511,223,21),(6512,223,22),(6513,223,23),(6514,223,24),(6515,223,25),(6516,223,26),(6517,223,27),(6518,223,28),(6519,223,29),(6520,223,30),(6521,223,31),(6522,223,32),(6523,223,33),(6524,223,34),(6525,223,35),(6526,223,36),(6527,223,37),(6528,223,38),(6529,223,39),(6530,223,40),(6531,223,41),(6532,223,42),(6533,223,43),(6534,223,44),(6535,223,45),(6536,223,46),(6537,223,47),(6538,223,48),(6539,223,49),(6540,223,50),(6541,223,51),(6542,223,52),(6543,223,53),(6544,223,54),(6545,223,55),(6546,223,56),(6547,223,57),(6548,223,58),(6549,223,59),(6550,223,60),(6551,223,61),(6552,223,62),(6553,223,63),(6554,223,64),(6555,223,65),(6556,223,66),(6557,223,67),(6558,223,68),(6559,223,69),(6560,223,70),(6561,223,71),(6562,223,72),(6563,223,73),(6564,223,74),(6565,223,75),(6566,223,76),(6567,223,77),(6568,223,78),(6569,223,79),(6570,223,80),(6571,223,81),(6572,223,82),(6573,223,83),(6574,223,84),(6575,223,85),(6576,223,86),(6577,223,87),(6578,223,88),(6579,223,89),(6580,223,90),(6581,223,91),(6582,223,92),(6583,223,93),(6584,223,94),(6585,223,95),(6586,223,96),(6587,223,97),(6588,223,98),(6589,223,99),(6590,223,100),(6591,223,101),(6592,223,102),(6593,223,103),(6594,223,104),(6595,223,105),(6596,223,106),(6597,223,107),(6598,223,108),(6599,223,109),(6600,223,110),(6601,223,111),(6602,223,112),(6603,223,113),(6604,223,114),(6605,223,115),(6606,223,116),(6607,223,117),(6608,223,118),(6609,223,119),(6610,223,120),(6611,223,121),(6612,223,122),(6613,223,123),(6614,223,124),(6615,223,125),(6616,223,126),(6617,223,127),(6618,223,128),(6619,223,129),(6620,223,130),(6621,223,131),(6622,223,132),(6623,223,133),(6624,223,134),(6625,223,135),(6626,223,136),(6627,223,137),(6628,223,138),(6629,223,139),(6630,223,140),(6631,223,141),(6632,223,142),(6633,223,143),(6634,223,144),(6635,223,145),(6636,223,146),(6637,223,147),(6638,223,148),(6639,223,149),(6640,223,150),(6641,223,151),(6642,223,152),(6643,223,153),(6644,223,154),(6645,223,155),(6646,223,156),(6647,223,157),(6648,223,158),(6649,223,159),(6650,223,160),(6651,223,161),(6652,223,162),(6653,223,163),(6654,223,164),(6655,223,165),(6656,223,166),(6657,223,167),(6658,223,168),(6659,223,169),(6660,223,170),(6661,223,171),(6662,223,172),(6663,223,173),(6664,223,174),(6665,223,175),(6666,223,176),(6667,223,177),(6668,223,178),(6669,223,179),(6670,223,180),(6671,223,181),(6672,223,182),(6673,223,183),(6674,223,184),(6675,223,185),(6676,223,186),(6677,223,187),(6678,223,188),(6679,223,189),(6680,223,190),(6681,223,191),(6682,223,192),(6683,223,193),(6684,223,194),(6685,223,195),(6686,223,196),(6687,223,197),(6688,223,198),(6689,223,199),(6690,223,200),(6691,223,201),(6692,223,202),(6693,223,203),(6694,223,204),(6695,223,205),(6696,223,206),(6697,223,207),(6698,223,208),(6699,223,209),(6700,223,210),(6701,223,211),(6702,223,212),(6703,223,213),(6704,223,214),(6705,223,215),(6706,223,216),(6707,223,217),(6708,223,218),(6709,223,219),(6710,223,220),(6711,223,221),(6712,223,222),(6713,223,223),(6714,223,224),(6715,224,1),(6716,224,2),(6717,224,3),(6718,224,4),(6719,224,5),(6720,224,6),(6721,224,7),(6722,224,8),(6723,224,9),(6724,224,10),(6725,224,11),(6726,224,12),(6727,224,13),(6728,224,14),(6729,224,15),(6730,224,16),(6731,224,17),(6732,224,18),(6733,224,19),(6734,224,20),(6735,224,21),(6736,224,22),(6737,224,23),(6738,224,24),(6739,224,25),(6740,224,26),(6741,224,27),(6742,224,28),(6743,224,29),(6744,224,30),(6745,224,31),(6746,224,32),(6747,224,33),(6748,224,34),(6749,224,35),(6750,224,36),(6751,224,37),(6752,224,38),(6753,224,39),(6754,224,40),(6755,224,41),(6756,224,42),(6757,224,43),(6758,224,44),(6759,224,45),(6760,224,46),(6761,224,47),(6762,224,48),(6763,224,49),(6764,224,50),(6765,224,51),(6766,224,52),(6767,224,53),(6768,224,54),(6769,224,55),(6770,224,56),(6771,224,57),(6772,224,58),(6773,224,59),(6774,224,60),(6775,224,61),(6776,224,62),(6777,224,63),(6778,224,64),(6779,224,65),(6780,224,66),(6781,224,67),(6782,224,68),(6783,224,69),(6784,224,70),(6785,224,71),(6786,224,72),(6787,224,73),(6788,224,74),(6789,224,75),(6790,224,76),(6791,224,77),(6792,224,78),(6793,224,79),(6794,224,80),(6795,224,81),(6796,224,82),(6797,224,83),(6798,224,84),(6799,224,85),(6800,224,86),(6801,224,87),(6802,224,88),(6803,224,89),(6804,224,90),(6805,224,91),(6806,224,92),(6807,224,93),(6808,224,94),(6809,224,95),(6810,224,96),(6811,224,97),(6812,224,98),(6813,224,99),(6814,224,100),(6815,224,101),(6816,224,102),(6817,224,103),(6818,224,104),(6819,224,105),(6820,224,106),(6821,224,107),(6822,224,108),(6823,224,109),(6824,224,110),(6825,224,111),(6826,224,112),(6827,224,113),(6828,224,114),(6829,224,115),(6830,224,116),(6831,224,117),(6832,224,118),(6833,224,119),(6834,224,120),(6835,224,121),(6836,224,122),(6837,224,123),(6838,224,124),(6839,224,125),(6840,224,126),(6841,224,127),(6842,224,128),(6843,224,129),(6844,224,130),(6845,224,131),(6846,224,132),(6847,224,133),(6848,224,134),(6849,224,135),(6850,224,136),(6851,224,137),(6852,224,138),(6853,224,139),(6854,224,140),(6855,224,141),(6856,224,142),(6857,224,143),(6858,224,144),(6859,224,145),(6860,224,146),(6861,224,147),(6862,224,148),(6863,224,149),(6864,224,150),(6865,224,151),(6866,224,152),(6867,224,153),(6868,224,154),(6869,224,155),(6870,224,156),(6871,224,157),(6872,224,158),(6873,224,159),(6874,224,160),(6875,224,161),(6876,224,162),(6877,224,163),(6878,224,164),(6879,224,165),(6880,224,166),(6881,224,167),(6882,224,168),(6883,224,169),(6884,224,170),(6885,224,171),(6886,224,172),(6887,224,173),(6888,224,174),(6889,224,175),(6890,224,176),(6891,224,177),(6892,224,178),(6893,224,179),(6894,224,180),(6895,224,181),(6896,224,182),(6897,224,183),(6898,224,184),(6899,224,185),(6900,224,186),(6901,224,187),(6902,224,188),(6903,224,189),(6904,224,190),(6905,224,191),(6906,224,192),(6907,224,193),(6908,224,194),(6909,224,195),(6910,224,196),(6911,224,197),(6912,224,198),(6913,224,199),(6914,224,200),(6915,224,201),(6916,224,202),(6917,224,203),(6918,224,204),(6919,224,205),(6920,224,206),(6921,224,207),(6922,224,208),(6923,224,209),(6924,224,210),(6925,224,211),(6926,224,212),(6927,224,213),(6928,224,214),(6929,224,215),(6930,224,216),(6931,224,217),(6932,224,218),(6933,224,219),(6934,224,220),(6935,224,221),(6936,224,222),(6937,224,223),(6938,224,224),(6939,225,1),(6940,225,2),(6941,225,3),(6942,225,4),(6943,225,5),(6944,225,6),(6945,225,7),(6946,225,8),(6947,225,9),(6948,225,10),(6949,225,11),(6950,225,12),(6951,225,13),(6952,225,14),(6953,225,15),(6954,225,16),(6955,225,17),(6956,225,18),(6957,225,19),(6958,225,20),(6959,225,21),(6960,225,22),(6961,225,23),(6962,225,24),(6963,225,25),(6964,225,26),(6965,225,27),(6966,225,28),(6967,225,29),(6968,225,30),(6969,225,31),(6970,225,32),(6971,225,33),(6972,225,34),(6973,225,35),(6974,225,36),(6975,225,37),(6976,225,38),(6977,225,39),(6978,225,40),(6979,225,41),(6980,225,42),(6981,225,43),(6982,225,44),(6983,225,45),(6984,225,46),(6985,225,47),(6986,225,48),(6987,225,49),(6988,225,50),(6989,225,51),(6990,225,52),(6991,225,53),(6992,225,54),(6993,225,55),(6994,225,56),(6995,225,57),(6996,225,58),(6997,225,59),(6998,225,60),(6999,225,61),(7000,225,62),(7001,225,63),(7002,225,64),(7003,225,65),(7004,225,66),(7005,225,67),(7006,225,68),(7007,225,69),(7008,225,70),(7009,225,71),(7010,225,72),(7011,225,73),(7012,225,74),(7013,225,75),(7014,225,76),(7015,225,77),(7016,225,78),(7017,225,79),(7018,225,80),(7019,225,81),(7020,225,82),(7021,225,83),(7022,225,84),(7023,225,85),(7024,225,86),(7025,225,87),(7026,225,88),(7027,225,89),(7028,225,90),(7029,225,91),(7030,225,92),(7031,225,93),(7032,225,94),(7033,225,95),(7034,225,96),(7035,225,97),(7036,225,98),(7037,225,99),(7038,225,100),(7039,225,101),(7040,225,102),(7041,225,103),(7042,225,104),(7043,225,105),(7044,225,106),(7045,225,107),(7046,225,108),(7047,225,109),(7048,225,110),(7049,225,111),(7050,225,112),(7051,225,113),(7052,225,114),(7053,225,115),(7054,225,116),(7055,225,117),(7056,225,118),(7057,225,119),(7058,225,120),(7059,225,121),(7060,225,122),(7061,225,123),(7062,225,124),(7063,225,125),(7064,225,126),(7065,225,127),(7066,225,128),(7067,225,129),(7068,225,130),(7069,225,131),(7070,225,132),(7071,225,133),(7072,225,134),(7073,225,135),(7074,225,136),(7075,225,137),(7076,225,138),(7077,225,139),(7078,225,140),(7079,225,141),(7080,225,142),(7081,225,143),(7082,225,144),(7083,225,145),(7084,225,146),(7085,225,147),(7086,225,148),(7087,225,149),(7088,225,150),(7089,225,151),(7090,225,152),(7091,225,153),(7092,225,154),(7093,225,155),(7094,225,156),(7095,225,157),(7096,225,158),(7097,225,159),(7098,225,160),(7099,225,161),(7100,225,162),(7101,225,163),(7102,225,164),(7103,225,165),(7104,225,166),(7105,225,167),(7106,225,168),(7107,225,169),(7108,225,170),(7109,225,171),(7110,225,172),(7111,225,173),(7112,225,174),(7113,225,175),(7114,225,176),(7115,225,177),(7116,225,178),(7117,225,179),(7118,225,180),(7119,225,181),(7120,225,182),(7121,225,183),(7122,225,184),(7123,225,185),(7124,225,186),(7125,225,187),(7126,225,188),(7127,225,189),(7128,225,190),(7129,225,191),(7130,225,192),(7131,225,193),(7132,225,194),(7133,225,195),(7134,225,196),(7135,225,197),(7136,225,198),(7137,225,199),(7138,225,200),(7139,225,201),(7140,225,202),(7141,225,203),(7142,225,204),(7143,225,205),(7144,225,206),(7145,225,207),(7146,225,208),(7147,225,209),(7148,225,210),(7149,225,211),(7150,225,212),(7151,225,213),(7152,225,214),(7153,225,215),(7154,225,216),(7155,225,217),(7156,225,218),(7157,225,219),(7158,225,220),(7159,225,221),(7160,225,222),(7161,225,223),(7162,225,224),(7163,226,1),(7164,226,2),(7165,226,3),(7166,226,4),(7167,226,5),(7168,226,6),(7169,226,7),(7170,226,8),(7171,226,9),(7172,226,10),(7173,226,11),(7174,226,12),(7175,226,13),(7176,226,14),(7177,226,15),(7178,226,16),(7179,226,17),(7180,226,18),(7181,226,19),(7182,226,20),(7183,226,21),(7184,226,22),(7185,226,23),(7186,226,24),(7187,226,25),(7188,226,26),(7189,226,27),(7190,226,28),(7191,226,29),(7192,226,30),(7193,226,31),(7194,226,32),(7195,226,33),(7196,226,34),(7197,226,35),(7198,226,36),(7199,226,37),(7200,226,38),(7201,226,39),(7202,226,40),(7203,226,41),(7204,226,42),(7205,226,43),(7206,226,44),(7207,226,45),(7208,226,46),(7209,226,47),(7210,226,48),(7211,226,49),(7212,226,50),(7213,226,51),(7214,226,52),(7215,226,53),(7216,226,54),(7217,226,55),(7218,226,56),(7219,226,57),(7220,226,58),(7221,226,59),(7222,226,60),(7223,226,61),(7224,226,62),(7225,226,63),(7226,226,64),(7227,226,65),(7228,226,66),(7229,226,67),(7230,226,68),(7231,226,69),(7232,226,70),(7233,226,71),(7234,226,72),(7235,226,73),(7236,226,74),(7237,226,75),(7238,226,76),(7239,226,77),(7240,226,78),(7241,226,79),(7242,226,80),(7243,226,81),(7244,226,82),(7245,226,83),(7246,226,84),(7247,226,85),(7248,226,86),(7249,226,87),(7250,226,88),(7251,226,89),(7252,226,90),(7253,226,91),(7254,226,92),(7255,226,93),(7256,226,94),(7257,226,95),(7258,226,96),(7259,226,97),(7260,226,98),(7261,226,99),(7262,226,100),(7263,226,101),(7264,226,102),(7265,226,103),(7266,226,104),(7267,226,105),(7268,226,106),(7269,226,107),(7270,226,108),(7271,226,109),(7272,226,110),(7273,226,111),(7274,226,112),(7275,226,113),(7276,226,114),(7277,226,115),(7278,226,116),(7279,226,117),(7280,226,118),(7281,226,119),(7282,226,120),(7283,226,121),(7284,226,122),(7285,226,123),(7286,226,124),(7287,226,125),(7288,226,126),(7289,226,127),(7290,226,128),(7291,226,129),(7292,226,130),(7293,226,131),(7294,226,132),(7295,226,133),(7296,226,134),(7297,226,135),(7298,226,136),(7299,226,137),(7300,226,138),(7301,226,139),(7302,226,140),(7303,226,141),(7304,226,142),(7305,226,143),(7306,226,144),(7307,226,145),(7308,226,146),(7309,226,147),(7310,226,148),(7311,226,149),(7312,226,150),(7313,226,151),(7314,226,152),(7315,226,153),(7316,226,154),(7317,226,155),(7318,226,156),(7319,226,157),(7320,226,158),(7321,226,159),(7322,226,160),(7323,226,161),(7324,226,162),(7325,226,163),(7326,226,164),(7327,226,165),(7328,226,166),(7329,226,167),(7330,226,168),(7331,226,169),(7332,226,170),(7333,226,171),(7334,226,172),(7335,226,173),(7336,226,174),(7337,226,175),(7338,226,176),(7339,226,177),(7340,226,178),(7341,226,179),(7342,226,180),(7343,226,181),(7344,226,182),(7345,226,183),(7346,226,184),(7347,226,185),(7348,226,186),(7349,226,187),(7350,226,188),(7351,226,189),(7352,226,190),(7353,226,191),(7354,226,192),(7355,226,193),(7356,226,194),(7357,226,195),(7358,226,196),(7359,226,197),(7360,226,198),(7361,226,199),(7362,226,200),(7363,226,201),(7364,226,202),(7365,226,203),(7366,226,204),(7367,226,205),(7368,226,206),(7369,226,207),(7370,226,208),(7371,226,209),(7372,226,210),(7373,226,211),(7374,226,212),(7375,226,213),(7376,226,214),(7377,226,215),(7378,226,216),(7379,226,217),(7380,226,218),(7381,226,219),(7382,226,220),(7383,226,221),(7384,226,222),(7385,226,223),(7386,226,224),(7387,227,1),(7388,227,2),(7389,227,3),(7390,227,4),(7391,227,5),(7392,227,6),(7393,227,7),(7394,227,8),(7395,227,9),(7396,227,10),(7397,227,11),(7398,227,12),(7399,227,13),(7400,227,14),(7401,227,15),(7402,227,16),(7403,227,17),(7404,227,18),(7405,227,19),(7406,227,20),(7407,227,21),(7408,227,22),(7409,227,23),(7410,227,24),(7411,227,25),(7412,227,26),(7413,227,27),(7414,227,28),(7415,227,29),(7416,227,30),(7417,227,31),(7418,227,32),(7419,227,33),(7420,227,34),(7421,227,35),(7422,227,36),(7423,227,37),(7424,227,38),(7425,227,39),(7426,227,40),(7427,227,41),(7428,227,42),(7429,227,43),(7430,227,44),(7431,227,45),(7432,227,46),(7433,227,47),(7434,227,48),(7435,227,49),(7436,227,50),(7437,227,51),(7438,227,52),(7439,227,53),(7440,227,54),(7441,227,55),(7442,227,56),(7443,227,57),(7444,227,58),(7445,227,59),(7446,227,60),(7447,227,61),(7448,227,62),(7449,227,63),(7450,227,64),(7451,227,65),(7452,227,66),(7453,227,67),(7454,227,68),(7455,227,69),(7456,227,70),(7457,227,71),(7458,227,72),(7459,227,73),(7460,227,74),(7461,227,75),(7462,227,76),(7463,227,77),(7464,227,78),(7465,227,79),(7466,227,80),(7467,227,81),(7468,227,82),(7469,227,83),(7470,227,84),(7471,227,85),(7472,227,86),(7473,227,87),(7474,227,88),(7475,227,89),(7476,227,90),(7477,227,91),(7478,227,92),(7479,227,93),(7480,227,94),(7481,227,95),(7482,227,96),(7483,227,97),(7484,227,98),(7485,227,99),(7486,227,100),(7487,227,101),(7488,227,102),(7489,227,103),(7490,227,104),(7491,227,105),(7492,227,106),(7493,227,107),(7494,227,108),(7495,227,109),(7496,227,110),(7497,227,111),(7498,227,112),(7499,227,113),(7500,227,114),(7501,227,115),(7502,227,116),(7503,227,117),(7504,227,118),(7505,227,119),(7506,227,120),(7507,227,121),(7508,227,122),(7509,227,123),(7510,227,124),(7511,227,125),(7512,227,126),(7513,227,127),(7514,227,128),(7515,227,129),(7516,227,130),(7517,227,131),(7518,227,132),(7519,227,133),(7520,227,134),(7521,227,135),(7522,227,136),(7523,227,137),(7524,227,138),(7525,227,139),(7526,227,140),(7527,227,141),(7528,227,142),(7529,227,143),(7530,227,144),(7531,227,145),(7532,227,146),(7533,227,147),(7534,227,148),(7535,227,149),(7536,227,150),(7537,227,151),(7538,227,152),(7539,227,153),(7540,227,154),(7541,227,155),(7542,227,156),(7543,227,157),(7544,227,158),(7545,227,159),(7546,227,160),(7547,227,161),(7548,227,162),(7549,227,163),(7550,227,164),(7551,227,165),(7552,227,166),(7553,227,167),(7554,227,168),(7555,227,169),(7556,227,170),(7557,227,171),(7558,227,172),(7559,227,173),(7560,227,174),(7561,227,175),(7562,227,176),(7563,227,177),(7564,227,178),(7565,227,179),(7566,227,180),(7567,227,181),(7568,227,182),(7569,227,183),(7570,227,184),(7571,227,185),(7572,227,186),(7573,227,187),(7574,227,188),(7575,227,189),(7576,227,190),(7577,227,191),(7578,227,192),(7579,227,193),(7580,227,194),(7581,227,195),(7582,227,196),(7583,227,197),(7584,227,198),(7585,227,199),(7586,227,200),(7587,227,201),(7588,227,202),(7589,227,203),(7590,227,204),(7591,227,205),(7592,227,206),(7593,227,207),(7594,227,208),(7595,227,209),(7596,227,210),(7597,227,211),(7598,227,212),(7599,227,213),(7600,227,214),(7601,227,215),(7602,227,216),(7603,227,217),(7604,227,218),(7605,227,219),(7606,227,220),(7607,227,221),(7608,227,222),(7609,227,223),(7610,227,224),(7611,228,1),(7612,228,2),(7613,228,3),(7614,228,4),(7615,228,5),(7616,228,6),(7617,228,7),(7618,228,8),(7619,228,9),(7620,228,10),(7621,228,11),(7622,228,12),(7623,228,13),(7624,228,14),(7625,228,15),(7626,228,16),(7627,228,17),(7628,228,18),(7629,228,19),(7630,228,20),(7631,228,21),(7632,228,22),(7633,228,23),(7634,228,24),(7635,228,25),(7636,228,26),(7637,228,27),(7638,228,28),(7639,228,29),(7640,228,30),(7641,228,31),(7642,228,32),(7643,228,33),(7644,228,34),(7645,228,35),(7646,228,36),(7647,228,37),(7648,228,38),(7649,228,39),(7650,228,40),(7651,228,41),(7652,228,42),(7653,228,43),(7654,228,44),(7655,228,45),(7656,228,46),(7657,228,47),(7658,228,48),(7659,228,49),(7660,228,50),(7661,228,51),(7662,228,52),(7663,228,53),(7664,228,54),(7665,228,55),(7666,228,56),(7667,228,57),(7668,228,58),(7669,228,59),(7670,228,60),(7671,228,61),(7672,228,62),(7673,228,63),(7674,228,64),(7675,228,65),(7676,228,66),(7677,228,67),(7678,228,68),(7679,228,69),(7680,228,70),(7681,228,71),(7682,228,72),(7683,228,73),(7684,228,74),(7685,228,75),(7686,228,76),(7687,228,77),(7688,228,78),(7689,228,79),(7690,228,80),(7691,228,81),(7692,228,82),(7693,228,83),(7694,228,84),(7695,228,85),(7696,228,86),(7697,228,87),(7698,228,88),(7699,228,89),(7700,228,90),(7701,228,91),(7702,228,92),(7703,228,93),(7704,228,94),(7705,228,95),(7706,228,96),(7707,228,97),(7708,228,98),(7709,228,99),(7710,228,100),(7711,228,101),(7712,228,102),(7713,228,103),(7714,228,104),(7715,228,105),(7716,228,106),(7717,228,107),(7718,228,108),(7719,228,109),(7720,228,110),(7721,228,111),(7722,228,112),(7723,228,113),(7724,228,114),(7725,228,115),(7726,228,116),(7727,228,117),(7728,228,118),(7729,228,119),(7730,228,120),(7731,228,121),(7732,228,122),(7733,228,123),(7734,228,124),(7735,228,125),(7736,228,126),(7737,228,127),(7738,228,128),(7739,228,129),(7740,228,130),(7741,228,131),(7742,228,132),(7743,228,133),(7744,228,134),(7745,228,135),(7746,228,136),(7747,228,137),(7748,228,138),(7749,228,139),(7750,228,140),(7751,228,141),(7752,228,142),(7753,228,143),(7754,228,144),(7755,228,145),(7756,228,146),(7757,228,147),(7758,228,148),(7759,228,149),(7760,228,150),(7761,228,151),(7762,228,152),(7763,228,153),(7764,228,154),(7765,228,155),(7766,228,156),(7767,228,157),(7768,228,158),(7769,228,159),(7770,228,160),(7771,228,161),(7772,228,162),(7773,228,163),(7774,228,164),(7775,228,165),(7776,228,166),(7777,228,167),(7778,228,168),(7779,228,169),(7780,228,170),(7781,228,171),(7782,228,172),(7783,228,173),(7784,228,174),(7785,228,175),(7786,228,176),(7787,228,177),(7788,228,178),(7789,228,179),(7790,228,180),(7791,228,181),(7792,228,182),(7793,228,183),(7794,228,184),(7795,228,185),(7796,228,186),(7797,228,187),(7798,228,188),(7799,228,189),(7800,228,190),(7801,228,191),(7802,228,192),(7803,228,193),(7804,228,194),(7805,228,195),(7806,228,196),(7807,228,197),(7808,228,198),(7809,228,199),(7810,228,200),(7811,228,201),(7812,228,202),(7813,228,203),(7814,228,204),(7815,228,205),(7816,228,206),(7817,228,207),(7818,228,208),(7819,228,209),(7820,228,210),(7821,228,211),(7822,228,212),(7823,228,213),(7824,228,214),(7825,228,215),(7826,228,216),(7827,228,217),(7828,228,218),(7829,228,219),(7830,228,220),(7831,228,221),(7832,228,222),(7833,228,223),(7834,228,224),(7835,229,1),(7836,229,2),(7837,229,3),(7838,229,4),(7839,229,5),(7840,229,6),(7841,229,7),(7842,229,8),(7843,229,9),(7844,229,10),(7845,229,11),(7846,229,12),(7847,229,13),(7848,229,14),(7849,229,15),(7850,229,16),(7851,229,17),(7852,229,18),(7853,229,19),(7854,229,20),(7855,229,21),(7856,229,22),(7857,229,23),(7858,229,24),(7859,229,25),(7860,229,26),(7861,229,27),(7862,229,28),(7863,229,29),(7864,229,30),(7865,229,31),(7866,229,32),(7867,229,33),(7868,229,34),(7869,229,35),(7870,229,36),(7871,229,37),(7872,229,38),(7873,229,39),(7874,229,40),(7875,229,41),(7876,229,42),(7877,229,43),(7878,229,44),(7879,229,45),(7880,229,46),(7881,229,47),(7882,229,48),(7883,229,49),(7884,229,50),(7885,229,51),(7886,229,52),(7887,229,53),(7888,229,54),(7889,229,55),(7890,229,56),(7891,229,57),(7892,229,58),(7893,229,59),(7894,229,60),(7895,229,61),(7896,229,62),(7897,229,63),(7898,229,64),(7899,229,65),(7900,229,66),(7901,229,67),(7902,229,68),(7903,229,69),(7904,229,70),(7905,229,71),(7906,229,72),(7907,229,73),(7908,229,74),(7909,229,75),(7910,229,76),(7911,229,77),(7912,229,78),(7913,229,79),(7914,229,80),(7915,229,81),(7916,229,82),(7917,229,83),(7918,229,84),(7919,229,85),(7920,229,86),(7921,229,87),(7922,229,88),(7923,229,89),(7924,229,90),(7925,229,91),(7926,229,92),(7927,229,93),(7928,229,94),(7929,229,95),(7930,229,96),(7931,229,97),(7932,229,98),(7933,229,99),(7934,229,100),(7935,229,101),(7936,229,102),(7937,229,103),(7938,229,104),(7939,229,105),(7940,229,106),(7941,229,107),(7942,229,108),(7943,229,109),(7944,229,110),(7945,229,111),(7946,229,112),(7947,229,113),(7948,229,114),(7949,229,115),(7950,229,116),(7951,229,117),(7952,229,118),(7953,229,119),(7954,229,120),(7955,229,121),(7956,229,122),(7957,229,123),(7958,229,124),(7959,229,125),(7960,229,126),(7961,229,127),(7962,229,128),(7963,229,129),(7964,229,130),(7965,229,131),(7966,229,132),(7967,229,133),(7968,229,134),(7969,229,135),(7970,229,136),(7971,229,137),(7972,229,138),(7973,229,139),(7974,229,140),(7975,229,141),(7976,229,142),(7977,229,143),(7978,229,144),(7979,229,145),(7980,229,146),(7981,229,147),(7982,229,148),(7983,229,149),(7984,229,150),(7985,229,151),(7986,229,152),(7987,229,153),(7988,229,154),(7989,229,155),(7990,229,156),(7991,229,157),(7992,229,158),(7993,229,159),(7994,229,160),(7995,229,161),(7996,229,162),(7997,229,163),(7998,229,164),(7999,229,165),(8000,229,166),(8001,229,167),(8002,229,168),(8003,229,169),(8004,229,170),(8005,229,171),(8006,229,172),(8007,229,173),(8008,229,174),(8009,229,175),(8010,229,176),(8011,229,177),(8012,229,178),(8013,229,179),(8014,229,180),(8015,229,181),(8016,229,182),(8017,229,183),(8018,229,184),(8019,229,185),(8020,229,186),(8021,229,187),(8022,229,188),(8023,229,189),(8024,229,190),(8025,229,191),(8026,229,192),(8027,229,193),(8028,229,194),(8029,229,195),(8030,229,196),(8031,229,197),(8032,229,198),(8033,229,199),(8034,229,200),(8035,229,201),(8036,229,202),(8037,229,203),(8038,229,204),(8039,229,205),(8040,229,206),(8041,229,207),(8042,229,208),(8043,229,209),(8044,229,210),(8045,229,211),(8046,229,212),(8047,229,213),(8048,229,214),(8049,229,215),(8050,229,216),(8051,229,217),(8052,229,218),(8053,229,219),(8054,229,220),(8055,229,221),(8056,229,222),(8057,229,223),(8058,229,224),(8059,230,1),(8060,230,2),(8061,230,3),(8062,230,4),(8063,230,5),(8064,230,6),(8065,230,7),(8066,230,8),(8067,230,9),(8068,230,10),(8069,230,11),(8070,230,12),(8071,230,13),(8072,230,14),(8073,230,15),(8074,230,16),(8075,230,17),(8076,230,18),(8077,230,19),(8078,230,20),(8079,230,21),(8080,230,22),(8081,230,23),(8082,230,24),(8083,230,25),(8084,230,26),(8085,230,27),(8086,230,28),(8087,230,29),(8088,230,30),(8089,230,31),(8090,230,32),(8091,230,33),(8092,230,34),(8093,230,35),(8094,230,36),(8095,230,37),(8096,230,38),(8097,230,39),(8098,230,40),(8099,230,41),(8100,230,42),(8101,230,43),(8102,230,44),(8103,230,45),(8104,230,46),(8105,230,47),(8106,230,48),(8107,230,49),(8108,230,50),(8109,230,51),(8110,230,52),(8111,230,53),(8112,230,54),(8113,230,55),(8114,230,56),(8115,230,57),(8116,230,58),(8117,230,59),(8118,230,60),(8119,230,61),(8120,230,62),(8121,230,63),(8122,230,64),(8123,230,65),(8124,230,66),(8125,230,67),(8126,230,68),(8127,230,69),(8128,230,70),(8129,230,71),(8130,230,72),(8131,230,73),(8132,230,74),(8133,230,75),(8134,230,76),(8135,230,77),(8136,230,78),(8137,230,79),(8138,230,80),(8139,230,81),(8140,230,82),(8141,230,83),(8142,230,84),(8143,230,85),(8144,230,86),(8145,230,87),(8146,230,88),(8147,230,89),(8148,230,90),(8149,230,91),(8150,230,92),(8151,230,93),(8152,230,94),(8153,230,95),(8154,230,96),(8155,230,97),(8156,230,98),(8157,230,99),(8158,230,100),(8159,230,101),(8160,230,102),(8161,230,103),(8162,230,104),(8163,230,105),(8164,230,106),(8165,230,107),(8166,230,108),(8167,230,109),(8168,230,110),(8169,230,111),(8170,230,112),(8171,230,113),(8172,230,114),(8173,230,115),(8174,230,116),(8175,230,117),(8176,230,118),(8177,230,119),(8178,230,120),(8179,230,121),(8180,230,122),(8181,230,123),(8182,230,124),(8183,230,125),(8184,230,126),(8185,230,127),(8186,230,128),(8187,230,129),(8188,230,130),(8189,230,131),(8190,230,132),(8191,230,133),(8192,230,134),(8193,230,135),(8194,230,136),(8195,230,137),(8196,230,138),(8197,230,139),(8198,230,140),(8199,230,141),(8200,230,142),(8201,230,143),(8202,230,144),(8203,230,145),(8204,230,146),(8205,230,147),(8206,230,148),(8207,230,149),(8208,230,150),(8209,230,151),(8210,230,152),(8211,230,153),(8212,230,154),(8213,230,155),(8214,230,156),(8215,230,157),(8216,230,158),(8217,230,159),(8218,230,160),(8219,230,161),(8220,230,162),(8221,230,163),(8222,230,164),(8223,230,165),(8224,230,166),(8225,230,167),(8226,230,168),(8227,230,169),(8228,230,170),(8229,230,171),(8230,230,172),(8231,230,173),(8232,230,174),(8233,230,175),(8234,230,176),(8235,230,177),(8236,230,178),(8237,230,179),(8238,230,180),(8239,230,181),(8240,230,182),(8241,230,183),(8242,230,184),(8243,230,185),(8244,230,186),(8245,230,187),(8246,230,188),(8247,230,189),(8248,230,190),(8249,230,191),(8250,230,192),(8251,230,193),(8252,230,194),(8253,230,195),(8254,230,196),(8255,230,197),(8256,230,198),(8257,230,199),(8258,230,200),(8259,230,201),(8260,230,202),(8261,230,203),(8262,230,204),(8263,230,205),(8264,230,206),(8265,230,207),(8266,230,208),(8267,230,209),(8268,230,210),(8269,230,211),(8270,230,212),(8271,230,213),(8272,230,214),(8273,230,215),(8274,230,216),(8275,230,217),(8276,230,218),(8277,230,219),(8278,230,220),(8279,230,221),(8280,230,222),(8281,230,223),(8282,230,224),(8283,231,1),(8284,231,2),(8285,231,3),(8286,231,4),(8287,231,5),(8288,231,6),(8289,231,7),(8290,231,8),(8291,231,9),(8292,231,10),(8293,231,11),(8294,231,12),(8295,231,13),(8296,231,14),(8297,231,15),(8298,231,16),(8299,231,17),(8300,231,18),(8301,231,19),(8302,231,20),(8303,231,21),(8304,231,22),(8305,231,23),(8306,231,24),(8307,231,25),(8308,231,26),(8309,231,27),(8310,231,28),(8311,231,29),(8312,231,30),(8313,231,31),(8314,231,32),(8315,231,33),(8316,231,34),(8317,231,35),(8318,231,36),(8319,231,37),(8320,231,38),(8321,231,39),(8322,231,40),(8323,231,41),(8324,231,42),(8325,231,43),(8326,231,44),(8327,231,45),(8328,231,46),(8329,231,47),(8330,231,48),(8331,231,49),(8332,231,50),(8333,231,51),(8334,231,52),(8335,231,53),(8336,231,54),(8337,231,55),(8338,231,56),(8339,231,57),(8340,231,58),(8341,231,59),(8342,231,60),(8343,231,61),(8344,231,62),(8345,231,63),(8346,231,64),(8347,231,65),(8348,231,66),(8349,231,67),(8350,231,68),(8351,231,69),(8352,231,70),(8353,231,71),(8354,231,72),(8355,231,73),(8356,231,74),(8357,231,75),(8358,231,76),(8359,231,77),(8360,231,78),(8361,231,79),(8362,231,80),(8363,231,81),(8364,231,82),(8365,231,83),(8366,231,84),(8367,231,85),(8368,231,86),(8369,231,87),(8370,231,88),(8371,231,89),(8372,231,90),(8373,231,91),(8374,231,92),(8375,231,93),(8376,231,94),(8377,231,95),(8378,231,96),(8379,231,97),(8380,231,98),(8381,231,99),(8382,231,100),(8383,231,101),(8384,231,102),(8385,231,103),(8386,231,104),(8387,231,105),(8388,231,106),(8389,231,107),(8390,231,108),(8391,231,109),(8392,231,110),(8393,231,111),(8394,231,112),(8395,231,113),(8396,231,114),(8397,231,115),(8398,231,116),(8399,231,117),(8400,231,118),(8401,231,119),(8402,231,120),(8403,231,121),(8404,231,122),(8405,231,123),(8406,231,124),(8407,231,125),(8408,231,126),(8409,231,127),(8410,231,128),(8411,231,129),(8412,231,130),(8413,231,131),(8414,231,132),(8415,231,133),(8416,231,134),(8417,231,135),(8418,231,136),(8419,231,137),(8420,231,138),(8421,231,139),(8422,231,140),(8423,231,141),(8424,231,142),(8425,231,143),(8426,231,144),(8427,231,145),(8428,231,146),(8429,231,147),(8430,231,148),(8431,231,149),(8432,231,150),(8433,231,151),(8434,231,152),(8435,231,153),(8436,231,154),(8437,231,155),(8438,231,156),(8439,231,157),(8440,231,158),(8441,231,159),(8442,231,160),(8443,231,161),(8444,231,162),(8445,231,163),(8446,231,164),(8447,231,165),(8448,231,166),(8449,231,167),(8450,231,168),(8451,231,169),(8452,231,170),(8453,231,171),(8454,231,172),(8455,231,173),(8456,231,174),(8457,231,175),(8458,231,176),(8459,231,177),(8460,231,178),(8461,231,179),(8462,231,180),(8463,231,181),(8464,231,182),(8465,231,183),(8466,231,184),(8467,231,185),(8468,231,186),(8469,231,187),(8470,231,188),(8471,231,189),(8472,231,190),(8473,231,191),(8474,231,192),(8475,231,193),(8476,231,194),(8477,231,195),(8478,231,196),(8479,231,197),(8480,231,198),(8481,231,199),(8482,231,200),(8483,231,201),(8484,231,202),(8485,231,203),(8486,231,204),(8487,231,205),(8488,231,206),(8489,231,207),(8490,231,208),(8491,231,209),(8492,231,210),(8493,231,211),(8494,231,212),(8495,231,213),(8496,231,214),(8497,231,215),(8498,231,216),(8499,231,217),(8500,231,218),(8501,231,219),(8502,231,220),(8503,231,221),(8504,231,222),(8505,231,223),(8506,231,224),(8507,232,1),(8508,232,2),(8509,232,3),(8510,232,4),(8511,232,5),(8512,232,6),(8513,232,7),(8514,232,8),(8515,232,9),(8516,232,10),(8517,232,11),(8518,232,12),(8519,232,13),(8520,232,14),(8521,232,15),(8522,232,16),(8523,232,17),(8524,232,18),(8525,232,19),(8526,232,20),(8527,232,21),(8528,232,22),(8529,232,23),(8530,232,24),(8531,232,25),(8532,232,26),(8533,232,27),(8534,232,28),(8535,232,29),(8536,232,30),(8537,232,31),(8538,232,32),(8539,232,33),(8540,232,34),(8541,232,35),(8542,232,36),(8543,232,37),(8544,232,38),(8545,232,39),(8546,232,40),(8547,232,41),(8548,232,42),(8549,232,43),(8550,232,44),(8551,232,45),(8552,232,46),(8553,232,47),(8554,232,48),(8555,232,49),(8556,232,50),(8557,232,51),(8558,232,52),(8559,232,53),(8560,232,54),(8561,232,55),(8562,232,56),(8563,232,57),(8564,232,58),(8565,232,59),(8566,232,60),(8567,232,61),(8568,232,62),(8569,232,63),(8570,232,64),(8571,232,65),(8572,232,66),(8573,232,67),(8574,232,68),(8575,232,69),(8576,232,70),(8577,232,71),(8578,232,72),(8579,232,73),(8580,232,74),(8581,232,75),(8582,232,76),(8583,232,77),(8584,232,78),(8585,232,79),(8586,232,80),(8587,232,81),(8588,232,82),(8589,232,83),(8590,232,84),(8591,232,85),(8592,232,86),(8593,232,87),(8594,232,88),(8595,232,89),(8596,232,90),(8597,232,91),(8598,232,92),(8599,232,93),(8600,232,94),(8601,232,95),(8602,232,96),(8603,232,97),(8604,232,98),(8605,232,99),(8606,232,100),(8607,232,101),(8608,232,102),(8609,232,103),(8610,232,104),(8611,232,105),(8612,232,106),(8613,232,107),(8614,232,108),(8615,232,109),(8616,232,110),(8617,232,111),(8618,232,112),(8619,232,113),(8620,232,114),(8621,232,115),(8622,232,116),(8623,232,117),(8624,232,118),(8625,232,119),(8626,232,120),(8627,232,121),(8628,232,122),(8629,232,123),(8630,232,124),(8631,232,125),(8632,232,126),(8633,232,127),(8634,232,128),(8635,232,129),(8636,232,130),(8637,232,131),(8638,232,132),(8639,232,133),(8640,232,134),(8641,232,135),(8642,232,136),(8643,232,137),(8644,232,138),(8645,232,139),(8646,232,140),(8647,232,141),(8648,232,142),(8649,232,143),(8650,232,144),(8651,232,145),(8652,232,146),(8653,232,147),(8654,232,148),(8655,232,149),(8656,232,150),(8657,232,151),(8658,232,152),(8659,232,153),(8660,232,154),(8661,232,155),(8662,232,156),(8663,232,157),(8664,232,158),(8665,232,159),(8666,232,160),(8667,232,161),(8668,232,162),(8669,232,163),(8670,232,164),(8671,232,165),(8672,232,166),(8673,232,167),(8674,232,168),(8675,232,169),(8676,232,170),(8677,232,171),(8678,232,172),(8679,232,173),(8680,232,174),(8681,232,175),(8682,232,176),(8683,232,177),(8684,232,178),(8685,232,179),(8686,232,180),(8687,232,181),(8688,232,182),(8689,232,183),(8690,232,184),(8691,232,185),(8692,232,186),(8693,232,187),(8694,232,188),(8695,232,189),(8696,232,190),(8697,232,191),(8698,232,192),(8699,232,193),(8700,232,194),(8701,232,195),(8702,232,196),(8703,232,197),(8704,232,198),(8705,232,199),(8706,232,200),(8707,232,201),(8708,232,202),(8709,232,203),(8710,232,204),(8711,232,205),(8712,232,206),(8713,232,207),(8714,232,208),(8715,232,209),(8716,232,210),(8717,232,211),(8718,232,212),(8719,232,213),(8720,232,214),(8721,232,215),(8722,232,216),(8723,232,217),(8724,232,218),(8725,232,219),(8726,232,220),(8727,232,221),(8728,232,222),(8729,232,223),(8730,232,224),(8731,233,1),(8732,233,2),(8733,233,3),(8734,233,4),(8735,233,5),(8736,233,6),(8737,233,7),(8738,233,8),(8739,233,9),(8740,233,10),(8741,233,11),(8742,233,12),(8743,233,13),(8744,233,14),(8745,233,15),(8746,233,16),(8747,233,17),(8748,233,18),(8749,233,19),(8750,233,20),(8751,233,21),(8752,233,22),(8753,233,23),(8754,233,24),(8755,233,25),(8756,233,26),(8757,233,27),(8758,233,28),(8759,233,29),(8760,233,30),(8761,233,31),(8762,233,32),(8763,233,33),(8764,233,34),(8765,233,35),(8766,233,36),(8767,233,37),(8768,233,38),(8769,233,39),(8770,233,40),(8771,233,41),(8772,233,42),(8773,233,43),(8774,233,44),(8775,233,45),(8776,233,46),(8777,233,47),(8778,233,48),(8779,233,49),(8780,233,50),(8781,233,51),(8782,233,52),(8783,233,53),(8784,233,54),(8785,233,55),(8786,233,56),(8787,233,57),(8788,233,58),(8789,233,59),(8790,233,60),(8791,233,61),(8792,233,62),(8793,233,63),(8794,233,64),(8795,233,65),(8796,233,66),(8797,233,67),(8798,233,68),(8799,233,69),(8800,233,70),(8801,233,71),(8802,233,72),(8803,233,73),(8804,233,74),(8805,233,75),(8806,233,76),(8807,233,77),(8808,233,78),(8809,233,79),(8810,233,80),(8811,233,81),(8812,233,82),(8813,233,83),(8814,233,84),(8815,233,85),(8816,233,86),(8817,233,87),(8818,233,88),(8819,233,89),(8820,233,90),(8821,233,91),(8822,233,92),(8823,233,93),(8824,233,94),(8825,233,95),(8826,233,96),(8827,233,97),(8828,233,98),(8829,233,99),(8830,233,100),(8831,233,101),(8832,233,102),(8833,233,103),(8834,233,104),(8835,233,105),(8836,233,106),(8837,233,107),(8838,233,108),(8839,233,109),(8840,233,110),(8841,233,111),(8842,233,112),(8843,233,113),(8844,233,114),(8845,233,115),(8846,233,116),(8847,233,117),(8848,233,118),(8849,233,119),(8850,233,120),(8851,233,121),(8852,233,122),(8853,233,123),(8854,233,124),(8855,233,125),(8856,233,126),(8857,233,127),(8858,233,128),(8859,233,129),(8860,233,130),(8861,233,131),(8862,233,132),(8863,233,133),(8864,233,134),(8865,233,135),(8866,233,136),(8867,233,137),(8868,233,138),(8869,233,139),(8870,233,140),(8871,233,141),(8872,233,142),(8873,233,143),(8874,233,144),(8875,233,145),(8876,233,146),(8877,233,147),(8878,233,148),(8879,233,149),(8880,233,150),(8881,233,151),(8882,233,152),(8883,233,153),(8884,233,154),(8885,233,155),(8886,233,156),(8887,233,157),(8888,233,158),(8889,233,159),(8890,233,160),(8891,233,161),(8892,233,162),(8893,233,163),(8894,233,164),(8895,233,165),(8896,233,166),(8897,233,167),(8898,233,168),(8899,233,169),(8900,233,170),(8901,233,171),(8902,233,172),(8903,233,173),(8904,233,174),(8905,233,175),(8906,233,176),(8907,233,177),(8908,233,178),(8909,233,179),(8910,233,180),(8911,233,181),(8912,233,182),(8913,233,183),(8914,233,184),(8915,233,185),(8916,233,186),(8917,233,187),(8918,233,188),(8919,233,189),(8920,233,190),(8921,233,191),(8922,233,192),(8923,233,193),(8924,233,194),(8925,233,195),(8926,233,196),(8927,233,197),(8928,233,198),(8929,233,199),(8930,233,200),(8931,233,201),(8932,233,202),(8933,233,203),(8934,233,204),(8935,233,205),(8936,233,206),(8937,233,207),(8938,233,208),(8939,233,209),(8940,233,210),(8941,233,211),(8942,233,212),(8943,233,213),(8944,233,214),(8945,233,215),(8946,233,216),(8947,233,217),(8948,233,218),(8949,233,219),(8950,233,220),(8951,233,221),(8952,233,222),(8953,233,223),(8954,233,224),(8955,234,1),(8956,234,2),(8957,234,3),(8958,234,4),(8959,234,5),(8960,234,6),(8961,234,7),(8962,234,8),(8963,234,9),(8964,234,10),(8965,234,11),(8966,234,12),(8967,234,13),(8968,234,14),(8969,234,15),(8970,234,16),(8971,234,17),(8972,234,18),(8973,234,19),(8974,234,20),(8975,234,21),(8976,234,22),(8977,234,23),(8978,234,24),(8979,234,25),(8980,234,26),(8981,234,27),(8982,234,28),(8983,234,29),(8984,234,30),(8985,234,31),(8986,234,32),(8987,234,33),(8988,234,34),(8989,234,35),(8990,234,36),(8991,234,37),(8992,234,38),(8993,234,39),(8994,234,40),(8995,234,41),(8996,234,42),(8997,234,43),(8998,234,44),(8999,234,45),(9000,234,46),(9001,234,47),(9002,234,48),(9003,234,49),(9004,234,50),(9005,234,51),(9006,234,52),(9007,234,53),(9008,234,54),(9009,234,55),(9010,234,56),(9011,234,57),(9012,234,58),(9013,234,59),(9014,234,60),(9015,234,61),(9016,234,62),(9017,234,63),(9018,234,64),(9019,234,65),(9020,234,66),(9021,234,67),(9022,234,68),(9023,234,69),(9024,234,70),(9025,234,71),(9026,234,72),(9027,234,73),(9028,234,74),(9029,234,75),(9030,234,76),(9031,234,77),(9032,234,78),(9033,234,79),(9034,234,80),(9035,234,81),(9036,234,82),(9037,234,83),(9038,234,84),(9039,234,85),(9040,234,86),(9041,234,87),(9042,234,88),(9043,234,89),(9044,234,90),(9045,234,91),(9046,234,92),(9047,234,93),(9048,234,94),(9049,234,95),(9050,234,96),(9051,234,97),(9052,234,98),(9053,234,99),(9054,234,100),(9055,234,101),(9056,234,102),(9057,234,103),(9058,234,104),(9059,234,105),(9060,234,106),(9061,234,107),(9062,234,108),(9063,234,109),(9064,234,110),(9065,234,111),(9066,234,112),(9067,234,113),(9068,234,114),(9069,234,115),(9070,234,116),(9071,234,117),(9072,234,118),(9073,234,119),(9074,234,120),(9075,234,121),(9076,234,122),(9077,234,123),(9078,234,124),(9079,234,125),(9080,234,126),(9081,234,127),(9082,234,128),(9083,234,129),(9084,234,130),(9085,234,131),(9086,234,132),(9087,234,133),(9088,234,134),(9089,234,135),(9090,234,136),(9091,234,137),(9092,234,138),(9093,234,139),(9094,234,140),(9095,234,141),(9096,234,142),(9097,234,143),(9098,234,144),(9099,234,145),(9100,234,146),(9101,234,147),(9102,234,148),(9103,234,149),(9104,234,150),(9105,234,151),(9106,234,152),(9107,234,153),(9108,234,154),(9109,234,155),(9110,234,156),(9111,234,157),(9112,234,158),(9113,234,159),(9114,234,160),(9115,234,161),(9116,234,162),(9117,234,163),(9118,234,164),(9119,234,165),(9120,234,166),(9121,234,167),(9122,234,168),(9123,234,169),(9124,234,170),(9125,234,171),(9126,234,172),(9127,234,173),(9128,234,174),(9129,234,175),(9130,234,176),(9131,234,177),(9132,234,178),(9133,234,179),(9134,234,180),(9135,234,181),(9136,234,182),(9137,234,183),(9138,234,184),(9139,234,185),(9140,234,186),(9141,234,187),(9142,234,188),(9143,234,189),(9144,234,190),(9145,234,191),(9146,234,192),(9147,234,193),(9148,234,194),(9149,234,195),(9150,234,196),(9151,234,197),(9152,234,198),(9153,234,199),(9154,234,200),(9155,234,201),(9156,234,202),(9157,234,203),(9158,234,204),(9159,234,205),(9160,234,206),(9161,234,207),(9162,234,208),(9163,234,209),(9164,234,210),(9165,234,211),(9166,234,212),(9167,234,213),(9168,234,214),(9169,234,215),(9170,234,216),(9171,234,217),(9172,234,218),(9173,234,219),(9174,234,220),(9175,234,221),(9176,234,222),(9177,234,223),(9178,234,224),(9179,235,1),(9180,235,2),(9181,235,3),(9182,235,4),(9183,235,5),(9184,235,6),(9185,235,7),(9186,235,8),(9187,235,9),(9188,235,10),(9189,235,11),(9190,235,12),(9191,235,13),(9192,235,14),(9193,235,15),(9194,235,16),(9195,235,17),(9196,235,18),(9197,235,19),(9198,235,20),(9199,235,21),(9200,235,22),(9201,235,23),(9202,235,24),(9203,235,25),(9204,235,26),(9205,235,27),(9206,235,28),(9207,235,29),(9208,235,30),(9209,235,31),(9210,235,32),(9211,235,33),(9212,235,34),(9213,235,35),(9214,235,36),(9215,235,37),(9216,235,38),(9217,235,39),(9218,235,40),(9219,235,41),(9220,235,42),(9221,235,43),(9222,235,44),(9223,235,45),(9224,235,46),(9225,235,47),(9226,235,48),(9227,235,49),(9228,235,50),(9229,235,51),(9230,235,52),(9231,235,53),(9232,235,54),(9233,235,55),(9234,235,56),(9235,235,57),(9236,235,58),(9237,235,59),(9238,235,60),(9239,235,61),(9240,235,62),(9241,235,63),(9242,235,64),(9243,235,65),(9244,235,66),(9245,235,67),(9246,235,68),(9247,235,69),(9248,235,70),(9249,235,71),(9250,235,72),(9251,235,73),(9252,235,74),(9253,235,75),(9254,235,76),(9255,235,77),(9256,235,78),(9257,235,79),(9258,235,80),(9259,235,81),(9260,235,82),(9261,235,83),(9262,235,84),(9263,235,85),(9264,235,86),(9265,235,87),(9266,235,88),(9267,235,89),(9268,235,90),(9269,235,91),(9270,235,92),(9271,235,93),(9272,235,94),(9273,235,95),(9274,235,96),(9275,235,97),(9276,235,98),(9277,235,99),(9278,235,100),(9279,235,101),(9280,235,102),(9281,235,103),(9282,235,104),(9283,235,105),(9284,235,106),(9285,235,107),(9286,235,108),(9287,235,109),(9288,235,110),(9289,235,111),(9290,235,112),(9291,235,113),(9292,235,114),(9293,235,115),(9294,235,116),(9295,235,117),(9296,235,118),(9297,235,119),(9298,235,120),(9299,235,121),(9300,235,122),(9301,235,123),(9302,235,124),(9303,235,125),(9304,235,126),(9305,235,127),(9306,235,128),(9307,235,129),(9308,235,130),(9309,235,131),(9310,235,132),(9311,235,133),(9312,235,134),(9313,235,135),(9314,235,136),(9315,235,137),(9316,235,138),(9317,235,139),(9318,235,140),(9319,235,141),(9320,235,142),(9321,235,143),(9322,235,144),(9323,235,145),(9324,235,146),(9325,235,147),(9326,235,148),(9327,235,149),(9328,235,150),(9329,235,151),(9330,235,152),(9331,235,153),(9332,235,154),(9333,235,155),(9334,235,156),(9335,235,157),(9336,235,158),(9337,235,159),(9338,235,160),(9339,235,161),(9340,235,162),(9341,235,163),(9342,235,164),(9343,235,165),(9344,235,166),(9345,235,167),(9346,235,168),(9347,235,169),(9348,235,170),(9349,235,171),(9350,235,172),(9351,235,173),(9352,235,174),(9353,235,175),(9354,235,176),(9355,235,177),(9356,235,178),(9357,235,179),(9358,235,180),(9359,235,181),(9360,235,182),(9361,235,183),(9362,235,184),(9363,235,185),(9364,235,186),(9365,235,187),(9366,235,188),(9367,235,189),(9368,235,190),(9369,235,191),(9370,235,192),(9371,235,193),(9372,235,194),(9373,235,195),(9374,235,196),(9375,235,197),(9376,235,198),(9377,235,199),(9378,235,200),(9379,235,201),(9380,235,202),(9381,235,203),(9382,235,204),(9383,235,205),(9384,235,206),(9385,235,207),(9386,235,208),(9387,235,209),(9388,235,210),(9389,235,211),(9390,235,212),(9391,235,213),(9392,235,214),(9393,235,215),(9394,235,216),(9395,235,217),(9396,235,218),(9397,235,219),(9398,235,220),(9399,235,221),(9400,235,222),(9401,235,223),(9402,235,224),(9403,236,1),(9404,237,1),(9405,237,2),(9406,237,3),(9407,237,4),(9408,237,5),(9409,237,6),(9410,237,7),(9411,237,8),(9412,237,9),(9413,237,10),(9414,237,11),(9415,237,12),(9416,237,13),(9417,237,14),(9418,237,15),(9419,237,16),(9420,237,17),(9421,237,18),(9422,237,19),(9423,237,20),(9424,237,21),(9425,237,22),(9426,237,23),(9427,237,24),(9428,237,25),(9429,237,26),(9430,237,27),(9431,237,28),(9432,237,29),(9433,237,30),(9434,237,31),(9435,237,32),(9436,237,33),(9437,237,34),(9438,237,35),(9439,237,36),(9440,237,37),(9441,237,38),(9442,237,39),(9443,237,40),(9444,237,41),(9445,237,42),(9446,237,43),(9447,237,44),(9448,237,45),(9449,237,46),(9450,237,47),(9451,237,48),(9452,237,49),(9453,237,50),(9454,237,51),(9455,237,52),(9456,237,53),(9457,237,54),(9458,237,55),(9459,237,56),(9460,237,57),(9461,237,58),(9462,237,59),(9463,237,60),(9464,237,61),(9465,237,62),(9466,237,63),(9467,237,64),(9468,237,65),(9469,237,66),(9470,237,67),(9471,237,68),(9472,237,69),(9473,237,70),(9474,237,71),(9475,237,72),(9476,237,73),(9477,237,74),(9478,237,75),(9479,237,76),(9480,237,77),(9481,237,78),(9482,237,79),(9483,237,80),(9484,237,81),(9485,237,82),(9486,237,83),(9487,237,84),(9488,237,85),(9489,237,86),(9490,237,87),(9491,237,88),(9492,237,89),(9493,237,90),(9494,237,91),(9495,237,92),(9496,237,93),(9497,237,94),(9498,237,95),(9499,237,96),(9500,237,97),(9501,237,98),(9502,237,99),(9503,237,100),(9504,237,101),(9505,237,102),(9506,237,103),(9507,237,104),(9508,237,105),(9509,237,106),(9510,237,107),(9511,237,108),(9512,237,109),(9513,237,110),(9514,237,111),(9515,237,112),(9516,237,113),(9517,237,114),(9518,237,115),(9519,237,116),(9520,237,117),(9521,237,118),(9522,237,119),(9523,237,120),(9524,237,121),(9525,237,122),(9526,237,123),(9527,237,124),(9528,237,125),(9529,237,126),(9530,237,127),(9531,237,128),(9532,237,129),(9533,237,130),(9534,237,131),(9535,237,132),(9536,237,133),(9537,237,134),(9538,237,135),(9539,237,136),(9540,237,137),(9541,237,138),(9542,237,139),(9543,237,140),(9544,237,141),(9545,237,142),(9546,237,143),(9547,237,144),(9548,237,145),(9549,237,146),(9550,237,147),(9551,237,148),(9552,237,149),(9553,237,150),(9554,237,151),(9555,237,152),(9556,237,153),(9557,237,154),(9558,237,155),(9559,237,156),(9560,237,157),(9561,237,158),(9562,237,159),(9563,237,160),(9564,237,161),(9565,237,162),(9566,237,163),(9567,237,164),(9568,237,165),(9569,237,166),(9570,237,167),(9571,237,168),(9572,237,169),(9573,237,170),(9574,237,171),(9575,237,172),(9576,237,173),(9577,237,174),(9578,237,175),(9579,237,176),(9580,237,177),(9581,237,178),(9582,237,179),(9583,237,180),(9584,237,181),(9585,237,182),(9586,237,183),(9587,237,184),(9588,237,185),(9589,237,186),(9590,237,187),(9591,237,188),(9592,237,189),(9593,237,190),(9594,237,191),(9595,237,192),(9596,237,193),(9597,237,194),(9598,237,195),(9599,237,196),(9600,237,197),(9601,237,198),(9602,237,199),(9603,237,200),(9604,237,201),(9605,237,202),(9606,237,203),(9607,237,204),(9608,237,205),(9609,237,206),(9610,237,207),(9611,237,208),(9612,237,209),(9613,237,210),(9614,237,211),(9615,237,212),(9616,237,213),(9617,237,214),(9618,237,215),(9619,237,216),(9620,237,217),(9621,237,218),(9622,237,219),(9623,237,220),(9624,237,221),(9625,237,222),(9626,237,223),(9627,237,224),(9628,238,1),(9629,238,2),(9630,238,3),(9631,238,4),(9632,238,5),(9633,238,6),(9634,238,7),(9635,238,8),(9636,238,9),(9637,238,10),(9638,238,11),(9639,238,12),(9640,238,13),(9641,238,14),(9642,238,15),(9643,238,16),(9644,238,17),(9645,238,18),(9646,238,19),(9647,238,20),(9648,238,21),(9649,238,22),(9650,238,23),(9651,238,24),(9652,238,25),(9653,238,26),(9654,238,27),(9655,238,28),(9656,238,29),(9657,238,30),(9658,238,31),(9659,238,32),(9660,238,33),(9661,238,34),(9662,238,35),(9663,238,36),(9664,238,37),(9665,238,38),(9666,238,39),(9667,238,40),(9668,238,41),(9669,238,42),(9670,238,43),(9671,238,44),(9672,238,45),(9673,238,46),(9674,238,47),(9675,238,48),(9676,238,49),(9677,238,50),(9678,238,51),(9679,238,52),(9680,238,53),(9681,238,54),(9682,238,55),(9683,238,56),(9684,238,57),(9685,238,58),(9686,238,59),(9687,238,60),(9688,238,61),(9689,238,62),(9690,238,63),(9691,238,64),(9692,238,65),(9693,238,66),(9694,238,67),(9695,238,68),(9696,238,69),(9697,238,70),(9698,238,71),(9699,238,72),(9700,238,73),(9701,238,74),(9702,238,75),(9703,238,76),(9704,238,77),(9705,238,78),(9706,238,79),(9707,238,80),(9708,238,81),(9709,238,82),(9710,238,83),(9711,238,84),(9712,238,85),(9713,238,86),(9714,238,87),(9715,238,88),(9716,238,89),(9717,238,90),(9718,238,91),(9719,238,92),(9720,238,93),(9721,238,94),(9722,238,95),(9723,238,96),(9724,238,97),(9725,238,98),(9726,238,99),(9727,238,100),(9728,238,101),(9729,238,102),(9730,238,103),(9731,238,104),(9732,238,105),(9733,238,106),(9734,238,107),(9735,238,108),(9736,238,109),(9737,238,110),(9738,238,111),(9739,238,112),(9740,238,113),(9741,238,114),(9742,238,115),(9743,238,116),(9744,238,117),(9745,238,118),(9746,238,119),(9747,238,120),(9748,238,121),(9749,238,122),(9750,238,123),(9751,238,124),(9752,238,125),(9753,238,126),(9754,238,127),(9755,238,128),(9756,238,129),(9757,238,130),(9758,238,131),(9759,238,132),(9760,238,133),(9761,238,134),(9762,238,135),(9763,238,136),(9764,238,137),(9765,238,138),(9766,238,139),(9767,238,140),(9768,238,141),(9769,238,142),(9770,238,143),(9771,238,144),(9772,238,145),(9773,238,146),(9774,238,147),(9775,238,148),(9776,238,149),(9777,238,150),(9778,238,151),(9779,238,152),(9780,238,153),(9781,238,154),(9782,238,155),(9783,238,156),(9784,238,157),(9785,238,158),(9786,238,159),(9787,238,160),(9788,238,161),(9789,238,162),(9790,238,163),(9791,238,164),(9792,238,165),(9793,238,166),(9794,238,167),(9795,238,168),(9796,238,169),(9797,238,170),(9798,238,171),(9799,238,172),(9800,238,173),(9801,238,174),(9802,238,175),(9803,238,176),(9804,238,177),(9805,238,178),(9806,238,179),(9807,238,180),(9808,238,181),(9809,238,182),(9810,238,183),(9811,238,184),(9812,238,185),(9813,238,186),(9814,238,187),(9815,238,188),(9816,238,189),(9817,238,190),(9818,238,191),(9819,238,192),(9820,238,193),(9821,238,194),(9822,238,195),(9823,238,196),(9824,238,197),(9825,238,198),(9826,238,199),(9827,238,200),(9828,238,201),(9829,238,202),(9830,238,203),(9831,238,204),(9832,238,205),(9833,238,206),(9834,238,207),(9835,238,208),(9836,238,209),(9837,238,210),(9838,238,211),(9839,238,212),(9840,238,213),(9841,238,214),(9842,238,215),(9843,238,216),(9844,238,217),(9845,238,218),(9846,238,219),(9847,238,220),(9848,238,221),(9849,238,222),(9850,238,223),(9851,238,224),(9852,239,1),(9853,239,2),(9854,239,3),(9855,239,4),(9856,239,5),(9857,239,6),(9858,239,7),(9859,239,8),(9860,239,9),(9861,239,10),(9862,239,11),(9863,239,12),(9864,239,13),(9865,239,14),(9866,239,15),(9867,239,16),(9868,239,17),(9869,239,18),(9870,239,19),(9871,239,20),(9872,239,21),(9873,239,22),(9874,239,23),(9875,239,24),(9876,239,25),(9877,239,26),(9878,239,27),(9879,239,28),(9880,239,29),(9881,239,30),(9882,239,31),(9883,239,32),(9884,239,33),(9885,239,34),(9886,239,35),(9887,239,36),(9888,239,37),(9889,239,38),(9890,239,39),(9891,239,40),(9892,239,41),(9893,239,42),(9894,239,43),(9895,239,44),(9896,239,45),(9897,239,46),(9898,239,47),(9899,239,48),(9900,239,49),(9901,239,50),(9902,239,51),(9903,239,52),(9904,239,53),(9905,239,54),(9906,239,55),(9907,239,56),(9908,239,57),(9909,239,58),(9910,239,59),(9911,239,60),(9912,239,61),(9913,239,62),(9914,239,63),(9915,239,64),(9916,239,65),(9917,239,66),(9918,239,67),(9919,239,68),(9920,239,69),(9921,239,70),(9922,239,71),(9923,239,72),(9924,239,73),(9925,239,74),(9926,239,75),(9927,239,76),(9928,239,77),(9929,239,78),(9930,239,79),(9931,239,80),(9932,239,81),(9933,239,82),(9934,239,83),(9935,239,84),(9936,239,85),(9937,239,86),(9938,239,87),(9939,239,88),(9940,239,89),(9941,239,90),(9942,239,91),(9943,239,92),(9944,239,93),(9945,239,94),(9946,239,95),(9947,239,96),(9948,239,97),(9949,239,98),(9950,239,99),(9951,239,100),(9952,239,101),(9953,239,102),(9954,239,103),(9955,239,104),(9956,239,105),(9957,239,106),(9958,239,107),(9959,239,108),(9960,239,109),(9961,239,110),(9962,239,111),(9963,239,112),(9964,239,113),(9965,239,114),(9966,239,115),(9967,239,116),(9968,239,117),(9969,239,118),(9970,239,119),(9971,239,120),(9972,239,121),(9973,239,122),(9974,239,123),(9975,239,124),(9976,239,125),(9977,239,126),(9978,239,127),(9979,239,128),(9980,239,129),(9981,239,130),(9982,239,131),(9983,239,132),(9984,239,133),(9985,239,134),(9986,239,135),(9987,239,136),(9988,239,137),(9989,239,138),(9990,239,139),(9991,239,140),(9992,239,141),(9993,239,142),(9994,239,143),(9995,239,144),(9996,239,145),(9997,239,146),(9998,239,147),(9999,239,148),(10000,239,149),(10001,239,150),(10002,239,151),(10003,239,152),(10004,239,153),(10005,239,154),(10006,239,155),(10007,239,156),(10008,239,157),(10009,239,158),(10010,239,159),(10011,239,160),(10012,239,161),(10013,239,162),(10014,239,163),(10015,239,164),(10016,239,165),(10017,239,166),(10018,239,167),(10019,239,168),(10020,239,169),(10021,239,170),(10022,239,171),(10023,239,172),(10024,239,173),(10025,239,174),(10026,239,175),(10027,239,176),(10028,239,177),(10029,239,178),(10030,239,179),(10031,239,180),(10032,239,181),(10033,239,182),(10034,239,183),(10035,239,184),(10036,239,185),(10037,239,186),(10038,239,187),(10039,239,188),(10040,239,189),(10041,239,190),(10042,239,191),(10043,239,192),(10044,239,193),(10045,239,194),(10046,239,195),(10047,239,196),(10048,239,197),(10049,239,198),(10050,239,199),(10051,239,200),(10052,239,201),(10053,239,202),(10054,239,203),(10055,239,204),(10056,239,205),(10057,239,206),(10058,239,207),(10059,239,208),(10060,239,209),(10061,239,210),(10062,239,211),(10063,239,212),(10064,239,213),(10065,239,214),(10066,239,215),(10067,239,216),(10068,239,217),(10069,239,218),(10070,239,219),(10071,239,220),(10072,239,221),(10073,239,222),(10074,239,223),(10075,239,224),(10076,240,1),(10077,240,2),(10078,240,3),(10079,240,4),(10080,240,5),(10081,240,6),(10082,240,7),(10083,240,8),(10084,240,9),(10085,240,10),(10086,240,11),(10087,240,12),(10088,240,13),(10089,240,14),(10090,240,15),(10091,240,16),(10092,240,17),(10093,240,18),(10094,240,19),(10095,240,20),(10096,240,21),(10097,240,22),(10098,240,23),(10099,240,24),(10100,240,25),(10101,240,26),(10102,240,27),(10103,240,28),(10104,240,29),(10105,240,30),(10106,240,31),(10107,240,32),(10108,240,33),(10109,240,34),(10110,240,35),(10111,240,36),(10112,240,37),(10113,240,38),(10114,240,39),(10115,240,40),(10116,240,41),(10117,240,42),(10118,240,43),(10119,240,44),(10120,240,45),(10121,240,46),(10122,240,47),(10123,240,48),(10124,240,49),(10125,240,50),(10126,240,51),(10127,240,52),(10128,240,53),(10129,240,54),(10130,240,55),(10131,240,56),(10132,240,57),(10133,240,58),(10134,240,59),(10135,240,60),(10136,240,61),(10137,240,62),(10138,240,63),(10139,240,64),(10140,240,65),(10141,240,66),(10142,240,67),(10143,240,68),(10144,240,69),(10145,240,70),(10146,240,71),(10147,240,72),(10148,240,73),(10149,240,74),(10150,240,75),(10151,240,76),(10152,240,77),(10153,240,78),(10154,240,79),(10155,240,80),(10156,240,81),(10157,240,82),(10158,240,83),(10159,240,84),(10160,240,85),(10161,240,86),(10162,240,87),(10163,240,88),(10164,240,89),(10165,240,90),(10166,240,91),(10167,240,92),(10168,240,93),(10169,240,94),(10170,240,95),(10171,240,96),(10172,240,97),(10173,240,98),(10174,240,99),(10175,240,100),(10176,240,101),(10177,240,102),(10178,240,103),(10179,240,104),(10180,240,105),(10181,240,106),(10182,240,107),(10183,240,108),(10184,240,109),(10185,240,110),(10186,240,111),(10187,240,112),(10188,240,113),(10189,240,114),(10190,240,115),(10191,240,116),(10192,240,117),(10193,240,118),(10194,240,119),(10195,240,120),(10196,240,121),(10197,240,122),(10198,240,123),(10199,240,124),(10200,240,125),(10201,240,126),(10202,240,127),(10203,240,128),(10204,240,129),(10205,240,130),(10206,240,131),(10207,240,132),(10208,240,133),(10209,240,134),(10210,240,135),(10211,240,136),(10212,240,137),(10213,240,138),(10214,240,139),(10215,240,140),(10216,240,141),(10217,240,142),(10218,240,143),(10219,240,144),(10220,240,145),(10221,240,146),(10222,240,147),(10223,240,148),(10224,240,149),(10225,240,150),(10226,240,151),(10227,240,152),(10228,240,153),(10229,240,154),(10230,240,155),(10231,240,156),(10232,240,157),(10233,240,158),(10234,240,159),(10235,240,160),(10236,240,161),(10237,240,162),(10238,240,163),(10239,240,164),(10240,240,165),(10241,240,166),(10242,240,167),(10243,240,168),(10244,240,169),(10245,240,170),(10246,240,171),(10247,240,172),(10248,240,173),(10249,240,174),(10250,240,175),(10251,240,176),(10252,240,177),(10253,240,178),(10254,240,179),(10255,240,180),(10256,240,181),(10257,240,182),(10258,240,183),(10259,240,184),(10260,240,185),(10261,240,186),(10262,240,187),(10263,240,188),(10264,240,189),(10265,240,190),(10266,240,191),(10267,240,192),(10268,240,193),(10269,240,194),(10270,240,195),(10271,240,196),(10272,240,197),(10273,240,198),(10274,240,199),(10275,240,200),(10276,240,201),(10277,240,202),(10278,240,203),(10279,240,204),(10280,240,205),(10281,240,206),(10282,240,207),(10283,240,208),(10284,240,209),(10285,240,210),(10286,240,211),(10287,240,212),(10288,240,213),(10289,240,214),(10290,240,215),(10291,240,216),(10292,240,217),(10293,240,218),(10294,240,219),(10295,240,220),(10296,240,221),(10297,240,222),(10298,240,223),(10299,240,224),(10300,241,1),(10301,241,2),(10302,241,3),(10303,241,4),(10304,241,5),(10305,241,6),(10306,241,7),(10307,241,8),(10308,241,9),(10309,241,10),(10310,241,11),(10311,241,12),(10312,241,13),(10313,241,14),(10314,241,15),(10315,241,16),(10316,241,17),(10317,241,18),(10318,241,19),(10319,241,20),(10320,241,21),(10321,241,22),(10322,241,23),(10323,241,24),(10324,241,25),(10325,241,26),(10326,241,27),(10327,241,28),(10328,241,29),(10329,241,30),(10330,241,31),(10331,241,32),(10332,241,33),(10333,241,34),(10334,241,35),(10335,241,36),(10336,241,37),(10337,241,38),(10338,241,39),(10339,241,40),(10340,241,41),(10341,241,42),(10342,241,43),(10343,241,44),(10344,241,45),(10345,241,46),(10346,241,47),(10347,241,48),(10348,241,49),(10349,241,50),(10350,241,51),(10351,241,52),(10352,241,53),(10353,241,54),(10354,241,55),(10355,241,56),(10356,241,57),(10357,241,58),(10358,241,59),(10359,241,60),(10360,241,61),(10361,241,62),(10362,241,63),(10363,241,64),(10364,241,65),(10365,241,66),(10366,241,67),(10367,241,68),(10368,241,69),(10369,241,70),(10370,241,71),(10371,241,72),(10372,241,73),(10373,241,74),(10374,241,75),(10375,241,76),(10376,241,77),(10377,241,78),(10378,241,79),(10379,241,80),(10380,241,81),(10381,241,82),(10382,241,83),(10383,241,84),(10384,241,85),(10385,241,86),(10386,241,87),(10387,241,88),(10388,241,89),(10389,241,90),(10390,241,91),(10391,241,92),(10392,241,93),(10393,241,94),(10394,241,95),(10395,241,96),(10396,241,97),(10397,241,98),(10398,241,99),(10399,241,100),(10400,241,101),(10401,241,102),(10402,241,103),(10403,241,104),(10404,241,105),(10405,241,106),(10406,241,107),(10407,241,108),(10408,241,109),(10409,241,110),(10410,241,111),(10411,241,112),(10412,241,113),(10413,241,114),(10414,241,115),(10415,241,116),(10416,241,117),(10417,241,118),(10418,241,119),(10419,241,120),(10420,241,121),(10421,241,122),(10422,241,123),(10423,241,124),(10424,241,125),(10425,241,126),(10426,241,127),(10427,241,128),(10428,241,129),(10429,241,130),(10430,241,131),(10431,241,132),(10432,241,133),(10433,241,134),(10434,241,135),(10435,241,136),(10436,241,137),(10437,241,138),(10438,241,139),(10439,241,140),(10440,241,141),(10441,241,142),(10442,241,143),(10443,241,144),(10444,241,145),(10445,241,146),(10446,241,147),(10447,241,148),(10448,241,149),(10449,241,150),(10450,241,151),(10451,241,152),(10452,241,153),(10453,241,154),(10454,241,155),(10455,241,156),(10456,241,157),(10457,241,158),(10458,241,159),(10459,241,160),(10460,241,161),(10461,241,162),(10462,241,163),(10463,241,164),(10464,241,165),(10465,241,166),(10466,241,167),(10467,241,168),(10468,241,169),(10469,241,170),(10470,241,171),(10471,241,172),(10472,241,173),(10473,241,174),(10474,241,175),(10475,241,176),(10476,241,177),(10477,241,178),(10478,241,179),(10479,241,180),(10480,241,181),(10481,241,182),(10482,241,183),(10483,241,184),(10484,241,185),(10485,241,186),(10486,241,187),(10487,241,188),(10488,241,189),(10489,241,190),(10490,241,191),(10491,241,192),(10492,241,193),(10493,241,194),(10494,241,195),(10495,241,196),(10496,241,197),(10497,241,198),(10498,241,199),(10499,241,200),(10500,241,201),(10501,241,202),(10502,241,203),(10503,241,204),(10504,241,205),(10505,241,206),(10506,241,207),(10507,241,208),(10508,241,209),(10509,241,210),(10510,241,211),(10511,241,212),(10512,241,213),(10513,241,214),(10514,241,215),(10515,241,216),(10516,241,217),(10517,241,218),(10518,241,219),(10519,241,220),(10520,241,221),(10521,241,222),(10522,241,223),(10523,241,224),(10524,242,225),(10525,242,226),(10526,242,227),(10527,242,228),(10528,242,229),(10529,242,230),(10530,242,231),(10531,242,232),(10532,242,233),(10533,242,234),(10534,242,235),(10535,242,236),(10536,242,237),(10537,242,238),(10538,242,239),(10539,242,240),(10540,242,241),(10541,242,242),(10542,242,243),(10543,242,244),(10544,242,245),(10545,242,246),(10546,242,247),(10547,242,248),(10548,242,249),(10549,242,250),(10550,242,251),(10551,242,252),(10552,242,253),(10553,242,254),(10554,242,255),(10555,242,256),(10556,242,257),(10557,242,258),(10558,242,259),(10559,242,260),(10560,242,261),(10561,242,262),(10562,242,263),(10563,242,264),(10564,242,265),(10565,242,266),(10566,242,267),(10567,242,268),(10568,242,269),(10569,242,270),(10570,242,271),(10571,242,272),(10572,242,273),(10573,242,274),(10574,242,275),(10575,242,276),(10576,242,277),(10577,242,278),(10578,242,279),(10579,242,280),(10580,242,281),(10581,242,282),(10582,242,283),(10583,242,284),(10584,242,285),(10585,242,286),(10586,242,287),(10587,242,288),(10588,242,289),(10589,242,290),(10590,242,291),(10591,242,292),(10592,242,293),(10593,242,294),(10594,242,295),(10595,242,296),(10596,242,297),(10597,242,298),(10598,242,299),(10599,242,300),(10600,242,301),(10601,242,302),(10602,242,303),(10603,242,304),(10604,242,305),(10605,242,306),(10606,242,307),(10607,242,308),(10608,242,309),(10609,242,310),(10610,242,311),(10611,242,312),(10612,242,313),(10613,242,314),(10614,242,315),(10615,242,316),(10616,242,317),(10617,242,318),(10618,242,319),(10619,242,320),(10620,242,321),(10621,242,322),(10622,242,323),(10623,242,324),(10624,242,325),(10625,242,326),(10626,242,327),(10627,242,328),(10628,242,329),(10629,242,330),(10630,242,331),(10631,242,332),(10632,242,333),(10633,242,334),(10634,242,335),(10635,242,336),(10636,242,337),(10637,242,338),(10638,242,339),(10639,242,340),(10640,242,341),(10641,242,342),(10642,242,343),(10643,242,344),(10644,242,345),(10645,242,346),(10646,242,347),(10647,242,348),(10648,242,349),(10649,242,350),(10650,242,351),(10651,242,352),(10652,242,353),(10653,242,354),(10654,242,355),(10655,242,356),(10656,242,357),(10657,242,358),(10658,242,359),(10659,242,360),(10660,242,361),(10661,242,362),(10662,242,363),(10663,242,364),(10664,242,365),(10665,242,366),(10666,242,367),(10667,242,368),(10668,242,369),(10669,242,370),(10670,242,371),(10671,242,372),(10672,242,373),(10673,242,374),(10674,242,375),(10675,242,376),(10676,242,377),(10677,242,378),(10678,242,379),(10679,242,380),(10680,242,381),(10681,242,382),(10682,242,383),(10683,242,384),(10684,242,385),(10685,242,386),(10686,242,387),(10687,242,388),(10688,242,389),(10689,242,390),(10690,242,391),(10691,242,392),(10692,242,393),(10693,242,394),(10694,242,395),(10695,242,396),(10696,242,397),(10697,242,398),(10698,242,399),(10699,242,400),(10700,242,401),(10701,242,402),(10702,242,403),(10703,242,404),(10704,242,405),(10705,242,406),(10706,242,407),(10707,242,408),(10708,242,409),(10709,242,410),(10710,242,411),(10711,242,412),(10712,242,413),(10713,242,414),(10714,242,415),(10715,242,416),(10716,242,417),(10717,242,418),(10718,242,419),(10719,242,420),(10720,242,421),(10721,242,422),(10722,242,423),(10723,242,424),(10724,242,425),(10725,242,426),(10726,242,427),(10727,242,428),(10728,242,429),(10729,242,430),(10730,242,431),(10731,242,432),(10732,242,433),(10733,242,434),(10734,242,435),(10735,242,436),(10736,242,437),(10737,242,438),(10738,242,439),(10739,242,440),(10740,242,441),(10741,242,442),(10742,242,443),(10743,242,444),(10744,242,445),(10745,242,446),(10746,242,447),(10747,242,448),(10748,242,449),(10749,242,450),(10750,242,451),(10751,242,452),(10752,242,453),(10753,242,454),(10754,242,455),(10755,242,456),(10756,242,457),(10757,242,458),(10758,242,459),(10759,242,460),(10760,242,461),(10761,242,462),(10762,242,463),(10763,242,464),(10764,242,465),(10765,242,466),(10766,242,467),(10767,242,468),(10768,242,469),(10769,242,470),(10770,242,471),(10771,242,472),(10772,242,473),(10773,242,474),(10774,242,475),(10775,242,476),(10776,242,477),(10777,242,478),(10778,242,479),(10779,242,480),(10780,242,481),(10781,242,482),(10782,242,483),(10783,242,484),(10784,242,485),(10785,242,486),(10786,242,487),(10787,242,488),(10788,242,489),(10789,242,490),(10790,242,491),(10791,242,492),(10792,242,493),(10793,242,494),(10794,242,495),(10795,242,496),(10796,242,497),(10797,242,498),(10798,242,499),(10799,242,500),(10800,242,501),(10801,242,502),(10802,242,503),(10803,242,504),(10804,242,505),(10805,242,506),(10806,242,507),(10807,242,508),(10808,242,509),(10809,242,510),(10810,242,511),(10811,242,512),(10812,242,513),(10813,242,514),(10814,242,515),(10815,242,516),(10816,242,517),(10817,242,518),(10818,242,519),(10819,242,520),(10820,242,521),(10821,242,522),(10822,242,523),(10823,242,524),(10824,242,525),(10825,242,526),(10826,242,527),(10827,242,528),(10828,242,529),(10829,242,530),(10830,242,224),(10831,243,531),(10832,243,532),(10833,243,533),(10834,243,534),(10835,243,535),(10836,243,536),(10837,243,537),(10838,243,538),(10839,243,539),(10840,243,540),(10841,243,541),(10842,243,542),(10843,243,543),(10844,243,544),(10845,243,545),(10846,243,546),(10847,243,547),(10848,243,548),(10849,243,549),(10850,243,550),(10851,243,551),(10852,243,552),(10853,243,553),(10854,243,554),(10855,243,555),(10856,243,556),(10857,243,557),(10858,243,558),(10859,243,559),(10860,243,560),(10861,243,561),(10862,243,562),(10863,243,563),(10864,243,564),(10865,243,565),(10866,243,566),(10867,243,567),(10868,243,568),(10869,243,569),(10870,243,570),(10871,243,571),(10872,243,572),(10873,243,573),(10874,243,574),(10875,243,575),(10876,243,576),(10877,243,577),(10878,243,578),(10879,243,579),(10880,243,580),(10881,243,581),(10882,243,582),(10883,243,583),(10884,243,584),(10885,243,585),(10886,243,586),(10887,243,587),(10888,243,588),(10889,243,589),(10890,243,590),(10891,243,591),(10892,243,592),(10893,243,593),(10894,243,594),(10895,243,595),(10896,243,596),(10897,243,597),(10898,243,598),(10899,243,599),(10900,243,600),(10901,243,601),(10902,243,602),(10903,243,603),(10904,243,604),(10905,243,605),(10906,243,606),(10907,243,607),(10908,243,608),(10909,243,609),(10910,243,610),(10911,243,611),(10912,243,612),(10913,243,613),(10914,243,614),(10915,243,615),(10916,243,616),(10917,243,617),(10918,243,618),(10919,243,619),(10920,243,620),(10921,243,621),(10922,243,622),(10923,243,623),(10924,243,624),(10925,243,625),(10926,243,626),(10927,243,627),(10928,243,628),(10929,243,629),(10930,243,630),(10931,243,631),(10932,243,632),(10933,243,633),(10934,243,634),(10935,243,635),(10936,243,636),(10937,243,637),(10938,243,638),(10939,243,639),(10940,243,640),(10941,243,641),(10942,243,642),(10943,243,643),(10944,243,644),(10945,243,645),(10946,243,646),(10947,243,647),(10948,243,648),(10949,243,649),(10950,243,650),(10951,243,651),(10952,243,652),(10953,243,653),(10954,243,654),(10955,243,655),(10956,243,656),(10957,243,657),(10958,243,658),(10959,243,659),(10960,243,660),(10961,243,661),(10962,243,662),(10963,243,663),(10964,243,664),(10965,243,665),(10966,243,666),(10967,243,667),(10968,243,668),(10969,243,669),(10970,243,670),(10971,243,671),(10972,243,672),(10973,243,673),(10974,243,674),(10975,243,675),(10976,243,676),(10977,243,677),(10978,243,678),(10979,243,679),(10980,243,680),(10981,243,681),(10982,243,682),(10983,243,683),(10984,243,684),(10985,243,685),(10986,243,686),(10987,243,687),(10988,243,688),(10989,243,689),(10990,243,690),(10991,243,691),(10992,243,692),(10993,243,693),(10994,243,694),(10995,243,695),(10996,243,696),(10997,243,697),(10998,243,698),(10999,243,699),(11000,243,700),(11001,243,701),(11002,243,702),(11003,243,703),(11004,243,704),(11005,243,705),(11006,243,706),(11007,243,707),(11008,243,708),(11009,243,709),(11010,243,710),(11011,243,711),(11012,243,712),(11013,243,713),(11014,243,714),(11015,243,715),(11016,243,716),(11017,243,717),(11018,243,718),(11019,243,719),(11020,243,720),(11021,243,721),(11022,243,722),(11023,243,723),(11024,243,724),(11025,243,725),(11026,243,726),(11027,243,727),(11028,243,728),(11029,243,729),(11030,243,730),(11031,243,731),(11032,243,732),(11033,243,733),(11034,243,734),(11035,243,735),(11036,243,736),(11037,243,737),(11038,243,738),(11039,243,739),(11040,243,740),(11041,243,741),(11042,243,742),(11043,243,743),(11044,243,744),(11045,243,745),(11046,243,746),(11047,243,747),(11048,243,748),(11049,243,749),(11050,243,750),(11051,243,751),(11052,243,752),(11053,243,753),(11054,243,754),(11055,243,755),(11056,243,756),(11057,243,757),(11058,243,758),(11059,243,759),(11060,243,760),(11061,243,761),(11062,243,762),(11063,243,763),(11064,243,764),(11065,243,765),(11066,243,766),(11067,243,767),(11068,243,768),(11069,243,769),(11070,243,770),(11071,243,771),(11072,243,772),(11073,243,773),(11074,243,774),(11075,243,775),(11076,243,776),(11077,243,777),(11078,243,778),(11079,243,779),(11080,243,780),(11081,243,781),(11082,243,782),(11083,243,783),(11084,243,784),(11085,243,785),(11086,243,786),(11087,243,787),(11088,243,788),(11089,243,789),(11090,243,790),(11091,243,791),(11092,243,792),(11093,243,793),(11094,243,794),(11095,243,795),(11096,243,796),(11097,243,797),(11098,243,798),(11099,243,799),(11100,243,800),(11101,243,801),(11102,243,802),(11103,243,803),(11104,243,804),(11105,243,805),(11106,243,806),(11107,243,807),(11108,243,808),(11109,243,809),(11110,243,810),(11111,243,811),(11112,243,812),(11113,243,813),(11114,243,814),(11115,243,815),(11116,243,816),(11117,243,817),(11118,243,818),(11119,243,819),(11120,243,820),(11121,243,821),(11122,243,822),(11123,243,823),(11124,243,824),(11125,243,825),(11126,243,826),(11127,243,827),(11128,243,828),(11129,243,829),(11130,243,830),(11131,243,831),(11132,243,832),(11133,243,833),(11134,243,834),(11135,243,835),(11136,243,836),(11137,243,224),(11138,244,837),(11139,244,838),(11140,244,839),(11141,244,840),(11142,244,841),(11143,244,842),(11144,244,843),(11145,244,844),(11146,244,845),(11147,244,846),(11148,244,847),(11149,244,848),(11150,244,849),(11151,244,850),(11152,244,851),(11153,244,852),(11154,244,853),(11155,244,854),(11156,244,855),(11157,244,856),(11158,244,857),(11159,244,858),(11160,244,859),(11161,244,860),(11162,244,861),(11163,244,862),(11164,244,863),(11165,244,864),(11166,244,865),(11167,244,866),(11168,244,867),(11169,244,868),(11170,244,869),(11171,244,870),(11172,244,871),(11173,244,872),(11174,244,873),(11175,244,874),(11176,244,875),(11177,244,876),(11178,244,877),(11179,244,878),(11180,244,879),(11181,244,880),(11182,244,881),(11183,244,882),(11184,244,883),(11185,244,884),(11186,244,885),(11187,244,886),(11188,244,887),(11189,244,888),(11190,244,889),(11191,244,890),(11192,244,891),(11193,244,892),(11194,244,893),(11195,244,894),(11196,244,895),(11197,244,896),(11198,244,897),(11199,244,898),(11200,244,899),(11201,244,900),(11202,244,901),(11203,244,902),(11204,244,903),(11205,244,904),(11206,244,905),(11207,244,906),(11208,244,907),(11209,244,908),(11210,244,909),(11211,244,910),(11212,244,911),(11213,244,912),(11214,244,913),(11215,244,914),(11216,244,915),(11217,244,916),(11218,244,917),(11219,244,918),(11220,244,919),(11221,244,920),(11222,244,921),(11223,244,922),(11224,244,923),(11225,244,924),(11226,244,925),(11227,244,926),(11228,244,927),(11229,244,928),(11230,244,929),(11231,244,930),(11232,244,931),(11233,244,932),(11234,244,933),(11235,244,934),(11236,244,935),(11237,244,936),(11238,244,937),(11239,244,938),(11240,244,939),(11241,244,940),(11242,244,941),(11243,244,942),(11244,244,943),(11245,244,944),(11246,244,945),(11247,244,946),(11248,244,947),(11249,244,948),(11250,244,949),(11251,244,950),(11252,244,951),(11253,244,952),(11254,244,953),(11255,244,954),(11256,244,955),(11257,244,956),(11258,244,957),(11259,244,958),(11260,244,959),(11261,244,960),(11262,244,961),(11263,244,962),(11264,244,963),(11265,244,964),(11266,244,965),(11267,244,966),(11268,244,967),(11269,244,968),(11270,244,969),(11271,244,970),(11272,244,971),(11273,244,972),(11274,244,973),(11275,244,974),(11276,244,975),(11277,244,976),(11278,244,977),(11279,244,978),(11280,244,979),(11281,244,980),(11282,244,981),(11283,244,982),(11284,244,983),(11285,244,984),(11286,244,985),(11287,244,986),(11288,244,987),(11289,244,988),(11290,244,989),(11291,244,990),(11292,244,991),(11293,244,992),(11294,244,993),(11295,244,994),(11296,244,995),(11297,244,996),(11298,244,997),(11299,244,998),(11300,244,999),(11301,244,1000),(11302,244,1001),(11303,244,1002),(11304,244,1003),(11305,244,1004),(11306,244,1005),(11307,244,1006),(11308,244,1007),(11309,244,1008),(11310,244,1009),(11311,244,1010),(11312,244,1011),(11313,244,1012),(11314,244,1013),(11315,244,1014),(11316,244,1015),(11317,244,1016),(11318,244,1017),(11319,244,1018),(11320,244,1019),(11321,244,1020),(11322,244,1021),(11323,244,1022),(11324,244,1023),(11325,244,1024),(11326,244,1025),(11327,244,1026),(11328,244,1027),(11329,244,1028),(11330,244,1029),(11331,244,1030),(11332,244,1031),(11333,244,1032),(11334,244,1033),(11335,244,1034),(11336,244,1035),(11337,244,1036),(11338,244,1037),(11339,244,1038),(11340,244,1039),(11341,244,1040),(11342,244,1041),(11343,244,1042),(11344,244,1043),(11345,244,1044),(11346,244,1045),(11347,244,1046),(11348,244,1047),(11349,244,1048),(11350,244,1049),(11351,244,1050),(11352,244,1051),(11353,244,1052),(11354,244,1053),(11355,244,1054),(11356,244,1055),(11357,244,1056),(11358,244,1057),(11359,244,1058),(11360,244,1059),(11361,244,1060),(11362,244,1061),(11363,244,1062),(11364,244,1063),(11365,244,1064),(11366,244,1065),(11367,244,1066),(11368,244,1067),(11369,244,1068),(11370,244,1069),(11371,244,1070),(11372,244,1071),(11373,244,1072),(11374,244,1073),(11375,244,1074),(11376,244,1075),(11377,244,1076),(11378,244,1077),(11379,244,1078),(11380,244,1079),(11381,244,1080),(11382,244,1081),(11383,244,1082),(11384,244,1083),(11385,244,1084),(11386,244,1085),(11387,244,1086),(11388,244,1087),(11389,244,1088),(11390,244,1089),(11391,244,1090),(11392,244,1091),(11393,244,1092),(11394,244,1093),(11395,244,1094),(11396,244,1095),(11397,244,1096),(11398,244,1097),(11399,244,1098),(11400,244,1099),(11401,244,1100),(11402,244,1101),(11403,244,1102),(11404,244,1103),(11405,244,1104),(11406,244,1105),(11407,244,1106),(11408,244,1107),(11409,244,1108),(11410,244,1109),(11411,244,1110),(11412,244,1111),(11413,244,1112),(11414,244,1113),(11415,244,1114),(11416,244,1115),(11417,244,1116),(11418,244,1117),(11419,244,1118),(11420,244,1119),(11421,244,1120),(11422,244,1121),(11423,244,1122),(11424,244,1123),(11425,244,1124),(11426,244,1125),(11427,244,1126),(11428,244,1127),(11429,244,1128),(11430,244,1129),(11431,244,1130),(11432,244,1131),(11433,244,1132),(11434,244,1133),(11435,244,1134),(11436,244,1135),(11437,244,1136),(11438,244,1137),(11439,244,1138),(11440,244,1139),(11441,244,1140),(11442,244,1141),(11443,244,1142),(11444,244,224),(11445,245,1143),(11446,245,1144),(11447,245,1145),(11448,245,1146),(11449,245,1147),(11450,245,1148),(11451,245,1149),(11452,245,1150),(11453,245,1151),(11454,245,1152),(11455,245,1153),(11456,245,1154),(11457,245,1155),(11458,245,1156),(11459,245,1157),(11460,245,1158),(11461,245,1159),(11462,245,1160),(11463,245,1161),(11464,245,1162),(11465,245,1163),(11466,245,1164),(11467,245,1),(11468,245,2),(11469,245,3),(11470,245,4),(11471,245,5),(11472,245,6),(11473,245,7),(11474,245,1165),(11475,245,8),(11476,245,9),(11477,245,10),(11478,245,11),(11479,245,12),(11480,245,1166),(11481,245,13),(11482,245,14),(11483,245,15),(11484,245,16),(11485,245,17),(11486,245,18),(11487,245,1167),(11488,245,19),(11489,245,20),(11490,245,21),(11491,245,22),(11492,245,23),(11493,245,1168),(11494,245,24),(11495,245,25),(11496,245,26),(11497,245,27),(11498,245,28),(11499,245,29),(11500,245,30),(11501,245,31),(11502,245,32),(11503,245,33),(11504,245,34),(11505,245,35),(11506,245,36),(11507,245,37),(11508,245,38),(11509,245,39),(11510,245,40),(11511,245,41),(11512,245,42),(11513,245,43),(11514,245,44),(11515,245,45),(11516,245,1169),(11517,245,46),(11518,245,47),(11519,245,48),(11520,245,49),(11521,245,50),(11522,245,51),(11523,245,52),(11524,245,53),(11525,245,1170),(11526,245,54),(11527,245,55),(11528,245,56),(11529,245,57),(11530,245,58),(11531,245,59),(11532,245,60),(11533,245,61),(11534,245,62),(11535,245,63),(11536,245,64),(11537,245,65),(11538,245,66),(11539,245,67),(11540,245,68),(11541,245,69),(11542,245,70),(11543,245,71),(11544,245,72),(11545,245,73),(11546,245,74),(11547,245,1171),(11548,245,76),(11549,245,77),(11550,245,78),(11551,245,79),(11552,245,80),(11553,245,81),(11554,245,82),(11555,245,83),(11556,245,84),(11557,245,85),(11558,245,86),(11559,245,87),(11560,245,88),(11561,245,89),(11562,245,90),(11563,245,91),(11564,245,92),(11565,245,1172),(11566,245,93),(11567,245,94),(11568,245,1173),(11569,245,1174),(11570,245,1175),(11571,245,1176),(11572,245,1177),(11573,245,1178),(11574,245,1179),(11575,245,1180),(11576,245,1181),(11577,245,1182),(11578,245,1183),(11579,245,1184),(11580,245,1185),(11581,245,1186),(11582,245,1187),(11583,245,1188),(11584,245,1189),(11585,245,1190),(11586,245,1191),(11587,245,1192),(11588,245,1193),(11589,245,1194),(11590,245,1195),(11591,245,1196),(11592,245,1197),(11593,245,1198),(11594,245,1199),(11595,245,1200),(11596,245,1201),(11597,245,95),(11598,245,96),(11599,245,97),(11600,245,98),(11601,245,99),(11602,245,100),(11603,245,1202),(11604,245,101),(11605,245,102),(11606,245,103),(11607,245,104),(11608,245,105),(11609,245,106),(11610,245,107),(11611,245,108),(11612,245,1203),(11613,245,109),(11614,245,110),(11615,245,111),(11616,245,112),(11617,245,1204),(11618,245,113),(11619,245,114),(11620,245,115),(11621,245,116),(11622,245,117),(11623,245,118),(11624,245,119),(11625,245,120),(11626,245,1205),(11627,245,121),(11628,245,122),(11629,245,123),(11630,245,1206),(11631,245,1207),(11632,245,1208),(11633,245,1209),(11634,245,1210),(11635,245,1211),(11636,245,1212),(11637,245,1213),(11638,245,1214),(11639,245,1215),(11640,245,1216),(11641,245,124),(11642,245,125),(11643,245,1217),(11644,245,126),(11645,245,127),(11646,245,1218),(11647,245,1219),(11648,245,128),(11649,245,129),(11650,245,1220),(11651,245,130),(11652,245,131),(11653,245,132),(11654,245,133),(11655,245,134),(11656,245,135),(11657,245,136),(11658,245,137),(11659,245,138),(11660,245,1221),(11661,245,139),(11662,245,1222),(11663,245,140),(11664,245,1223),(11665,245,141),(11666,245,1224),(11667,245,142),(11668,245,143),(11669,245,1225),(11670,245,1226),(11671,245,1227),(11672,245,1228),(11673,245,144),(11674,245,145),(11675,245,146),(11676,245,147),(11677,245,148),(11678,245,1229),(11679,245,1230),(11680,245,1231),(11681,245,149),(11682,245,150),(11683,245,151),(11684,245,152),(11685,245,1232),(11686,245,153),(11687,245,1233),(11688,245,154),(11689,245,155),(11690,245,156),(11691,245,1234),(11692,245,157),(11693,245,158),(11694,245,159),(11695,245,160),(11696,245,161),(11697,245,162),(11698,245,163),(11699,245,164),(11700,245,165),(11701,245,166),(11702,245,167),(11703,245,168),(11704,245,169),(11705,245,170),(11706,245,171),(11707,245,172),(11708,245,173),(11709,245,174),(11710,245,175),(11711,245,176),(11712,245,177),(11713,245,178),(11714,245,179),(11715,245,1235),(11716,245,180),(11717,245,1236),(11718,245,181),(11719,245,182),(11720,245,183),(11721,245,184),(11722,245,185),(11723,245,186),(11724,245,187),(11725,245,188),(11726,245,189),(11727,245,190),(11728,245,191),(11729,245,192),(11730,245,193),(11731,245,194),(11732,245,195),(11733,245,196),(11734,245,197),(11735,245,198),(11736,245,199),(11737,245,200),(11738,245,201),(11739,245,1237),(11740,245,202),(11741,245,203),(11742,245,204),(11743,245,205),(11744,245,206),(11745,245,207),(11746,245,208),(11747,245,209),(11748,245,210),(11749,245,211),(11750,245,212),(11751,245,213),(11752,245,214),(11753,245,215),(11754,245,216),(11755,245,217),(11756,245,218),(11757,245,219),(11758,245,220),(11759,245,221),(11760,245,222),(11761,245,223),(11762,245,224),(11763,246,1238),(11764,247,1239),(11765,248,1),(11766,248,2),(11767,248,3),(11768,248,4),(11769,248,5),(11770,248,6),(11771,248,7),(11772,248,8),(11773,248,9),(11774,248,10),(11775,248,11),(11776,248,12),(11777,248,13),(11778,248,14),(11779,248,15),(11780,248,16),(11781,248,17),(11782,248,18),(11783,248,19),(11784,248,20),(11785,248,21),(11786,248,22),(11787,248,23),(11788,248,24),(11789,248,25),(11790,248,26),(11791,248,27),(11792,248,28),(11793,248,29),(11794,248,30),(11795,248,31),(11796,248,32),(11797,248,33),(11798,248,34),(11799,248,35),(11800,248,36),(11801,248,37),(11802,248,38),(11803,248,39),(11804,248,40),(11805,248,41),(11806,248,42),(11807,248,43),(11808,248,44),(11809,248,45),(11810,248,46),(11811,248,47),(11812,248,48),(11813,248,49),(11814,248,50),(11815,248,51),(11816,248,52),(11817,248,53),(11818,248,54),(11819,248,55),(11820,248,56),(11821,248,57),(11822,248,58),(11823,248,59),(11824,248,60),(11825,248,61),(11826,248,62),(11827,248,63),(11828,248,64),(11829,248,65),(11830,248,66),(11831,248,67),(11832,248,68),(11833,248,69),(11834,248,70),(11835,248,71),(11836,248,72),(11837,248,73),(11838,248,74),(11839,248,75),(11840,248,76),(11841,248,77),(11842,248,78),(11843,248,79),(11844,248,80),(11845,248,81),(11846,248,82),(11847,248,83),(11848,248,84),(11849,248,85),(11850,248,86),(11851,248,87),(11852,248,88),(11853,248,89),(11854,248,90),(11855,248,91),(11856,248,92),(11857,248,93),(11858,248,94),(11859,248,95),(11860,248,96),(11861,248,97),(11862,248,98),(11863,248,99),(11864,248,100),(11865,248,101),(11866,248,102),(11867,248,103),(11868,248,104),(11869,248,105),(11870,248,106),(11871,248,107),(11872,248,108),(11873,248,109),(11874,248,110),(11875,248,111),(11876,248,112),(11877,248,113),(11878,248,114),(11879,248,115),(11880,248,116),(11881,248,117),(11882,248,118),(11883,248,119),(11884,248,120),(11885,248,121),(11886,248,122),(11887,248,123),(11888,248,124),(11889,248,125),(11890,248,126),(11891,248,127),(11892,248,128),(11893,248,129),(11894,248,130),(11895,248,131),(11896,248,132),(11897,248,133),(11898,248,134),(11899,248,135),(11900,248,136),(11901,248,137),(11902,248,138),(11903,248,139),(11904,248,140),(11905,248,141),(11906,248,142),(11907,248,143),(11908,248,144),(11909,248,145),(11910,248,146),(11911,248,147),(11912,248,148),(11913,248,149),(11914,248,150),(11915,248,151),(11916,248,152),(11917,248,153),(11918,248,154),(11919,248,155),(11920,248,156),(11921,248,157),(11922,248,158),(11923,248,159),(11924,248,160),(11925,248,161),(11926,248,162),(11927,248,163),(11928,248,164),(11929,248,165),(11930,248,166),(11931,248,167),(11932,248,168),(11933,248,169),(11934,248,170),(11935,248,171),(11936,248,172),(11937,248,173),(11938,248,174),(11939,248,175),(11940,248,176),(11941,248,177),(11942,248,178),(11943,248,179),(11944,248,180),(11945,248,181),(11946,248,182),(11947,248,183),(11948,248,184),(11949,248,185),(11950,248,186),(11951,248,187),(11952,248,188),(11953,248,189),(11954,248,190),(11955,248,191),(11956,248,192),(11957,248,193),(11958,248,194),(11959,248,195),(11960,248,196),(11961,248,197),(11962,248,198),(11963,248,199),(11964,248,200),(11965,248,201),(11966,248,202),(11967,248,203),(11968,248,204),(11969,248,205),(11970,248,206),(11971,248,207),(11972,248,208),(11973,248,209),(11974,248,210),(11975,248,211),(11976,248,212),(11977,248,213),(11978,248,214),(11979,248,215),(11980,248,216),(11981,248,217),(11982,248,218),(11983,248,219),(11984,248,220),(11985,248,221),(11986,248,222),(11987,248,223),(11988,248,224),(11989,248,225),(11990,248,226),(11991,248,227),(11992,248,228),(11993,248,229),(11994,248,230),(11995,248,231),(11996,248,232),(11997,248,233),(11998,248,234),(11999,248,235),(12000,248,236),(12001,248,237),(12002,248,238),(12003,249,1),(12004,249,2),(12005,249,3),(12006,249,4),(12007,249,5),(12008,249,6),(12009,249,7),(12010,249,8),(12011,249,9),(12012,249,10),(12013,249,11),(12014,249,12),(12015,249,13),(12016,249,14),(12017,249,15),(12018,249,16),(12019,249,17),(12020,249,18),(12021,249,19),(12022,249,20),(12023,249,21),(12024,249,22),(12025,249,23),(12026,249,24),(12027,249,25),(12028,249,26),(12029,249,27),(12030,249,28),(12031,249,29),(12032,249,30),(12033,249,31),(12034,249,32),(12035,249,33),(12036,249,34),(12037,249,35),(12038,249,36),(12039,249,37),(12040,249,38),(12041,249,39),(12042,249,40),(12043,249,41),(12044,249,42),(12045,249,43),(12046,249,44),(12047,249,45),(12048,249,46),(12049,249,47),(12050,249,48),(12051,249,49),(12052,249,50),(12053,249,51),(12054,249,52),(12055,249,53),(12056,249,54),(12057,249,55),(12058,249,56),(12059,249,57),(12060,249,58),(12061,249,59),(12062,249,60),(12063,249,61),(12064,249,62),(12065,249,63),(12066,249,64),(12067,249,65),(12068,249,66),(12069,249,67),(12070,249,68),(12071,249,69),(12072,249,70),(12073,249,71),(12074,249,72),(12075,249,73),(12076,249,74),(12077,249,75),(12078,249,76),(12079,249,77),(12080,249,78),(12081,249,79),(12082,249,80),(12083,249,81),(12084,249,82),(12085,249,83),(12086,249,84),(12087,249,85),(12088,249,86),(12089,249,87),(12090,249,88),(12091,249,89),(12092,249,90),(12093,249,91),(12094,249,92),(12095,249,93),(12096,249,94),(12097,249,95),(12098,249,96),(12099,249,97),(12100,249,98),(12101,249,99),(12102,249,100),(12103,249,101),(12104,249,102),(12105,249,103),(12106,249,104),(12107,249,105),(12108,249,106),(12109,249,107),(12110,249,108),(12111,249,109),(12112,249,110),(12113,249,111),(12114,249,112),(12115,249,113),(12116,249,114),(12117,249,115),(12118,249,116),(12119,249,117),(12120,249,118),(12121,249,119),(12122,249,120),(12123,249,121),(12124,249,122),(12125,249,123),(12126,249,124),(12127,249,125),(12128,249,126),(12129,249,127),(12130,249,128),(12131,249,129),(12132,249,130),(12133,249,131),(12134,249,132),(12135,249,133),(12136,249,134),(12137,249,135),(12138,249,136),(12139,249,137),(12140,249,138),(12141,249,139),(12142,249,140),(12143,249,141),(12144,249,142),(12145,249,143),(12146,249,144),(12147,249,145),(12148,249,146),(12149,249,147),(12150,249,148),(12151,249,149),(12152,249,150),(12153,249,151),(12154,249,152),(12155,249,153),(12156,249,154),(12157,249,155),(12158,249,156),(12159,249,157),(12160,249,158),(12161,249,159),(12162,249,160),(12163,249,161),(12164,249,162),(12165,249,163),(12166,249,164),(12167,249,165),(12168,249,166),(12169,249,167),(12170,249,168),(12171,249,169),(12172,249,170),(12173,249,171),(12174,249,172),(12175,249,173),(12176,249,174),(12177,249,175),(12178,249,176),(12179,249,177),(12180,249,178),(12181,249,179),(12182,249,180),(12183,249,181),(12184,249,182),(12185,249,183),(12186,249,184),(12187,249,185),(12188,249,186),(12189,249,187),(12190,249,188),(12191,249,189),(12192,249,190),(12193,249,191),(12194,249,192),(12195,249,193),(12196,249,194),(12197,249,195),(12198,249,196),(12199,249,197),(12200,249,198),(12201,249,199),(12202,249,200),(12203,249,201),(12204,249,202),(12205,249,203),(12206,249,204),(12207,249,205),(12208,249,206),(12209,249,207),(12210,249,208),(12211,249,209),(12212,249,210),(12213,249,211),(12214,249,212),(12215,249,213),(12216,249,214),(12217,249,215),(12218,249,216),(12219,249,217),(12220,249,218),(12221,249,219),(12222,249,220),(12223,249,221),(12224,249,222),(12225,249,223),(12226,249,224),(12227,249,225),(12228,249,226),(12229,249,227),(12230,249,228),(12231,249,229),(12232,249,230),(12233,249,231),(12234,249,232),(12235,249,233),(12236,249,234),(12237,249,235),(12238,249,236),(12239,249,237),(12240,249,238),(12241,250,1),(12242,250,2),(12243,250,3),(12244,250,4),(12245,250,5),(12246,250,6),(12247,250,7),(12248,250,8),(12249,250,9),(12250,250,10),(12251,250,11),(12252,250,12),(12253,250,13),(12254,250,14),(12255,250,15),(12256,250,16),(12257,250,17),(12258,250,18),(12259,250,19),(12260,250,20),(12261,250,239),(12262,250,21),(12263,250,22),(12264,250,23),(12265,250,24),(12266,250,25),(12267,250,26),(12268,250,27),(12269,250,28),(12270,250,29),(12271,250,30),(12272,250,31),(12273,250,32),(12274,250,240),(12275,250,33),(12276,250,34),(12277,250,35),(12278,250,36),(12279,250,37),(12280,250,38),(12281,250,241),(12282,250,39),(12283,250,40),(12284,250,41),(12285,250,42),(12286,250,43),(12287,250,242),(12288,250,44),(12289,250,45),(12290,250,46),(12291,250,47),(12292,250,48),(12293,250,49),(12294,250,50),(12295,250,51),(12296,250,52),(12297,250,53),(12298,250,54),(12299,250,55),(12300,250,56),(12301,250,57),(12302,250,58),(12303,250,59),(12304,250,60),(12305,250,61),(12306,250,62),(12307,250,63),(12308,250,64),(12309,250,65),(12310,250,243),(12311,250,66),(12312,250,67),(12313,250,68),(12314,250,69),(12315,250,70),(12316,250,71),(12317,250,72),(12318,250,73),(12319,250,244),(12320,250,74),(12321,250,75),(12322,250,76),(12323,250,77),(12324,250,78),(12325,250,79),(12326,250,80),(12327,250,81),(12328,250,82),(12329,250,83),(12330,250,84),(12331,250,85),(12332,250,86),(12333,250,87),(12334,250,88),(12335,250,89),(12336,250,90),(12337,250,91),(12338,250,92),(12339,250,93),(12340,250,94),(12341,250,95),(12342,250,96),(12343,250,97),(12344,250,98),(12345,250,99),(12346,250,100),(12347,250,101),(12348,250,102),(12349,250,103),(12350,250,104),(12351,250,105),(12352,250,106),(12353,250,107),(12354,250,108),(12355,250,109),(12356,250,110),(12357,250,111),(12358,250,112),(12359,250,113),(12360,250,114),(12361,250,115),(12362,250,116),(12363,250,117),(12364,250,118),(12365,250,119),(12366,250,120),(12367,250,121),(12368,250,122),(12369,250,123),(12370,250,124),(12371,250,125),(12372,250,126),(12373,250,127),(12374,250,128),(12375,250,129),(12376,250,130),(12377,250,131),(12378,250,132),(12379,250,133),(12380,250,134),(12381,250,135),(12382,250,136),(12383,250,137),(12384,250,138),(12385,250,139),(12386,250,140),(12387,250,141),(12388,250,142),(12389,250,143),(12390,250,144),(12391,250,145),(12392,250,146),(12393,250,147),(12394,250,148),(12395,250,149),(12396,250,150),(12397,250,151),(12398,250,152),(12399,250,153),(12400,250,154),(12401,250,155),(12402,250,156),(12403,250,157),(12404,250,158),(12405,250,159),(12406,250,160),(12407,250,161),(12408,250,162),(12409,250,163),(12410,250,164),(12411,250,165),(12412,250,166),(12413,250,167),(12414,250,168),(12415,250,169),(12416,250,170),(12417,250,245),(12418,250,171),(12419,250,172),(12420,250,173),(12421,250,174),(12422,250,175),(12423,250,176),(12424,250,177),(12425,250,178),(12426,250,179),(12427,250,180),(12428,250,181),(12429,250,182),(12430,250,183),(12431,250,184),(12432,250,185),(12433,250,186),(12434,250,187),(12435,250,188),(12436,250,189),(12437,250,190),(12438,250,191),(12439,250,192),(12440,250,193),(12441,250,194),(12442,250,195),(12443,250,196),(12444,250,197),(12445,250,198),(12446,250,199),(12447,250,200),(12448,250,201),(12449,250,202),(12450,250,203),(12451,250,204),(12452,250,205),(12453,250,206),(12454,250,207),(12455,250,208),(12456,250,209),(12457,250,210),(12458,250,211),(12459,250,212),(12460,250,213),(12461,250,214),(12462,250,215),(12463,250,216),(12464,250,217),(12465,250,218),(12466,250,219),(12467,250,220),(12468,250,221),(12469,250,222),(12470,250,223),(12471,250,224),(12472,250,225),(12473,250,226),(12474,250,227),(12475,250,228),(12476,250,229),(12477,250,230),(12478,250,231),(12479,250,232),(12480,250,233),(12481,250,234),(12482,250,235),(12483,250,236),(12484,250,237),(12485,250,238),(12486,251,1),(12487,251,2),(12488,251,3),(12489,251,4),(12490,252,1),(12491,252,2),(12492,252,3),(12493,252,4),(12494,253,1),(12495,253,2),(12496,253,3),(12497,253,4),(12498,254,1),(12499,254,1),(12500,255,2),(12501,256,2),(12502,256,1);
/*!40000 ALTER TABLE `import_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_master`
--

DROP TABLE IF EXISTS `import_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_master` (
  `Import_Master_Id` int NOT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Import_Master_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_master`
--

LOCK TABLES `import_master` WRITE;
/*!40000 ALTER TABLE `import_master` DISABLE KEYS */;
INSERT INTO `import_master` VALUES (1,'2021-06-30 19:03:52.000000'),(2,'2021-08-06 16:49:44.000000'),(3,'2021-08-11 17:35:42.000000'),(4,'2021-09-27 12:11:45.000000'),(5,'2021-09-27 12:17:28.000000'),(6,'2021-09-27 12:24:50.000000'),(7,'2021-09-27 12:30:25.000000'),(8,'2021-09-27 12:31:19.000000'),(9,'2021-09-27 12:39:58.000000'),(10,'2021-09-27 12:46:35.000000'),(11,'2021-09-27 12:47:40.000000'),(12,'2021-09-27 15:00:47.000000'),(13,'2021-09-27 15:00:51.000000'),(14,'2021-09-27 15:00:56.000000'),(15,'2021-09-27 15:01:00.000000'),(16,'2021-09-27 15:01:01.000000'),(17,'2021-09-27 15:01:01.000000'),(18,'2021-09-27 15:01:01.000000'),(19,'2021-09-27 15:01:01.000000'),(20,'2021-09-27 15:01:01.000000'),(21,'2021-09-27 15:01:01.000000'),(22,'2021-09-27 15:01:01.000000'),(23,'2021-09-27 15:01:01.000000'),(24,'2021-09-27 15:01:01.000000'),(25,'2021-09-27 15:01:01.000000'),(26,'2021-09-27 15:01:01.000000'),(27,'2021-09-27 15:01:01.000000'),(28,'2021-09-27 15:01:01.000000'),(29,'2021-09-27 15:01:01.000000'),(30,'2021-09-27 15:11:19.000000'),(31,'2021-09-27 15:16:04.000000'),(32,'2021-09-27 15:16:38.000000'),(33,'2021-09-27 15:16:59.000000'),(34,'2021-09-27 15:17:10.000000'),(35,'2021-09-27 15:17:21.000000'),(36,'2021-09-27 15:17:37.000000'),(37,'2021-09-27 15:17:51.000000'),(38,'2021-09-27 15:17:54.000000'),(39,'2021-09-27 15:17:57.000000'),(40,'2021-09-27 15:18:00.000000'),(41,'2021-09-27 15:18:03.000000'),(42,'2021-09-27 15:18:06.000000'),(43,'2021-09-27 15:18:10.000000'),(44,'2021-09-27 15:18:13.000000'),(45,'2021-09-27 15:18:16.000000'),(46,'2021-09-27 15:18:18.000000'),(47,'2021-09-27 15:18:20.000000'),(48,'2021-09-27 15:18:22.000000'),(49,'2021-09-27 15:18:24.000000'),(50,'2021-09-27 15:18:27.000000'),(51,'2021-09-27 15:18:31.000000'),(52,'2021-09-27 15:18:32.000000'),(53,'2021-09-27 15:18:32.000000'),(54,'2021-09-27 15:25:43.000000'),(55,'2021-09-27 15:25:44.000000'),(56,'2021-09-27 15:25:44.000000'),(57,'2021-09-27 15:25:44.000000'),(58,'2021-09-27 15:25:44.000000'),(59,'2021-09-27 15:25:44.000000'),(60,'2021-09-27 15:25:44.000000'),(61,'2021-09-27 15:25:44.000000'),(62,'2021-09-27 15:25:44.000000'),(63,'2021-09-27 15:25:44.000000'),(64,'2021-09-27 15:31:21.000000'),(65,'2021-09-27 15:31:21.000000'),(66,'2021-09-27 15:32:07.000000'),(67,'2021-09-27 15:32:07.000000'),(68,'2021-09-27 15:38:50.000000'),(69,'2021-09-27 15:38:50.000000'),(70,'2021-09-27 15:38:50.000000'),(71,'2021-09-27 15:38:50.000000'),(72,'2021-09-27 15:38:50.000000'),(73,'2021-09-27 15:38:50.000000'),(74,'2021-09-27 15:38:51.000000'),(75,'2021-09-27 15:38:51.000000'),(76,'2021-09-27 15:38:51.000000'),(77,'2021-09-27 15:38:51.000000'),(78,'2021-09-27 15:40:07.000000'),(79,'2021-09-27 15:40:07.000000'),(80,'2021-09-27 15:40:07.000000'),(81,'2021-09-27 15:40:08.000000'),(82,'2021-09-27 15:40:08.000000'),(83,'2021-09-27 15:40:08.000000'),(84,'2021-09-27 15:40:08.000000'),(85,'2021-09-27 15:40:08.000000'),(86,'2021-09-27 15:40:08.000000'),(87,'2021-09-27 15:40:08.000000'),(88,'2021-09-27 15:57:20.000000'),(89,'2021-09-27 15:57:20.000000'),(90,'2021-09-27 15:57:20.000000'),(91,'2021-09-27 15:57:20.000000'),(92,'2021-09-27 15:57:20.000000'),(93,'2021-09-27 15:57:20.000000'),(94,'2021-09-27 15:57:20.000000'),(95,'2021-09-27 15:57:20.000000'),(96,'2021-09-27 15:57:20.000000'),(97,'2021-09-27 15:57:20.000000'),(98,'2021-09-27 15:57:21.000000'),(99,'2021-09-27 15:57:21.000000'),(100,'2021-09-27 15:57:21.000000'),(101,'2021-09-27 15:57:21.000000'),(102,'2021-09-27 15:57:21.000000'),(103,'2021-09-27 15:57:21.000000'),(104,'2021-09-27 15:57:21.000000'),(105,'2021-09-27 15:57:21.000000'),(106,'2021-09-27 15:57:21.000000'),(107,'2021-09-27 15:57:21.000000'),(108,'2021-09-27 15:57:21.000000'),(109,'2021-09-27 15:57:22.000000'),(110,'2021-09-27 16:01:59.000000'),(111,'2021-09-27 16:01:59.000000'),(112,'2021-09-27 16:02:00.000000'),(113,'2021-09-27 16:02:00.000000'),(114,'2021-09-27 16:02:00.000000'),(115,'2021-09-27 16:02:00.000000'),(116,'2021-09-27 16:02:00.000000'),(117,'2021-09-27 16:02:00.000000'),(118,'2021-09-27 16:02:00.000000'),(119,'2021-09-27 16:02:00.000000'),(120,'2021-09-27 16:02:00.000000'),(121,'2021-09-27 16:02:00.000000'),(122,'2021-09-27 16:02:00.000000'),(123,'2021-09-27 16:02:01.000000'),(124,'2021-09-27 16:02:01.000000'),(125,'2021-09-27 16:02:01.000000'),(126,'2021-09-27 16:02:01.000000'),(127,'2021-09-27 16:02:01.000000'),(128,'2021-09-27 16:02:01.000000'),(129,'2021-09-27 16:02:01.000000'),(130,'2021-09-27 16:02:01.000000'),(131,'2021-09-27 16:02:01.000000'),(132,'2021-09-27 16:05:07.000000'),(133,'2021-09-27 16:05:07.000000'),(134,'2021-09-27 16:05:08.000000'),(135,'2021-09-27 16:05:08.000000'),(136,'2021-09-27 16:05:08.000000'),(137,'2021-09-27 16:05:08.000000'),(138,'2021-09-27 16:05:08.000000'),(139,'2021-09-27 16:05:08.000000'),(140,'2021-09-27 16:05:08.000000'),(141,'2021-09-27 16:05:08.000000'),(142,'2021-09-27 16:06:36.000000'),(143,'2021-09-27 16:06:36.000000'),(144,'2021-09-27 16:06:36.000000'),(145,'2021-09-27 16:06:36.000000'),(146,'2021-09-27 16:06:36.000000'),(147,'2021-09-27 16:08:18.000000'),(148,'2021-09-27 16:08:18.000000'),(149,'2021-09-27 16:08:18.000000'),(150,'2021-09-27 16:08:49.000000'),(151,'2021-09-27 16:08:49.000000'),(152,'2021-09-27 16:08:49.000000'),(153,'2021-09-27 16:13:15.000000'),(154,'2021-09-27 16:13:15.000000'),(155,'2021-09-27 16:13:15.000000'),(156,'2021-09-27 16:14:30.000000'),(157,'2021-09-27 16:14:30.000000'),(158,'2021-09-27 16:14:30.000000'),(159,'2021-09-27 16:14:31.000000'),(160,'2021-09-27 16:14:31.000000'),(161,'2021-09-27 16:14:31.000000'),(162,'2021-09-27 16:14:31.000000'),(163,'2021-09-27 16:14:31.000000'),(164,'2021-09-27 16:14:31.000000'),(165,'2021-09-27 16:14:31.000000'),(166,'2021-09-27 16:14:31.000000'),(167,'2021-09-27 16:14:31.000000'),(168,'2021-09-27 16:14:31.000000'),(169,'2021-09-27 16:14:31.000000'),(170,'2021-09-27 16:14:32.000000'),(171,'2021-09-27 16:14:32.000000'),(172,'2021-09-27 16:14:32.000000'),(173,'2021-09-27 16:14:32.000000'),(174,'2021-09-27 16:14:32.000000'),(175,'2021-09-27 16:14:32.000000'),(176,'2021-09-27 16:14:32.000000'),(177,'2021-09-27 16:14:32.000000'),(178,'2021-09-27 16:20:56.000000'),(179,'2021-09-27 16:20:56.000000'),(180,'2021-09-27 16:20:56.000000'),(181,'2021-09-27 16:22:59.000000'),(182,'2021-09-27 16:22:59.000000'),(183,'2021-09-27 16:24:06.000000'),(184,'2021-09-27 16:24:06.000000'),(185,'2021-09-27 16:24:42.000000'),(186,'2021-09-27 16:24:42.000000'),(187,'2021-09-27 16:25:54.000000'),(188,'2021-09-27 16:25:54.000000'),(189,'2021-09-27 16:25:54.000000'),(190,'2021-09-27 16:25:54.000000'),(191,'2021-09-27 16:25:54.000000'),(192,'2021-09-27 16:29:50.000000'),(193,'2021-09-27 16:29:50.000000'),(194,'2021-09-27 16:32:27.000000'),(195,'2021-09-27 16:32:51.000000'),(196,'2021-09-27 16:44:14.000000'),(197,'2021-09-27 16:46:45.000000'),(198,'2021-09-27 16:47:07.000000'),(199,'2021-09-27 17:04:12.000000'),(200,'2021-09-27 17:04:50.000000'),(201,'2021-10-06 12:30:20.000000'),(202,'2021-10-06 12:40:20.000000'),(203,'2021-10-06 12:45:27.000000'),(204,'2021-10-06 12:47:37.000000'),(205,'2021-10-06 12:54:47.000000'),(206,'2021-10-06 12:57:53.000000'),(207,'2021-10-06 12:59:51.000000'),(208,'2021-10-06 13:01:23.000000'),(209,'2021-10-06 13:02:25.000000'),(210,'2021-10-06 13:04:07.000000'),(211,'2021-10-06 13:08:27.000000'),(212,'2021-10-06 13:14:59.000000'),(213,'2021-10-06 13:17:54.000000'),(214,'2021-10-06 13:20:51.000000'),(215,'2021-10-06 13:24:43.000000'),(216,'2021-10-06 13:26:11.000000'),(217,'2021-10-06 13:28:52.000000'),(218,'2021-10-06 13:39:08.000000'),(219,'2021-10-06 14:31:11.000000'),(220,'2021-10-06 14:32:46.000000'),(221,'2021-10-06 14:35:27.000000'),(222,'2021-10-06 14:38:15.000000'),(223,'2021-10-06 14:40:25.000000'),(224,'2021-10-06 14:42:51.000000'),(225,'2021-10-06 14:51:31.000000'),(226,'2021-10-06 14:54:10.000000'),(227,'2021-10-06 14:57:20.000000'),(228,'2021-10-06 14:59:04.000000'),(229,'2021-10-06 15:15:00.000000'),(230,'2021-10-06 15:17:26.000000'),(231,'2021-10-06 16:51:20.000000'),(232,'2021-10-06 16:53:14.000000'),(233,'2021-10-07 16:46:58.000000'),(234,'2021-10-07 16:47:42.000000'),(235,'2021-10-07 16:50:15.000000'),(236,'2021-10-07 16:54:20.000000'),(237,'2021-10-07 16:55:53.000000'),(238,'2021-10-07 16:56:59.000000'),(239,'2021-10-07 18:18:22.000000'),(240,'2021-10-07 18:28:54.000000'),(241,'2021-10-13 15:16:31.000000'),(242,'2021-11-08 13:35:07.000000'),(243,'2021-11-08 15:06:40.000000'),(244,'2021-11-08 15:25:31.000000'),(245,'2021-11-08 15:42:14.000000'),(246,'2021-11-08 15:48:43.000000'),(247,'2021-11-08 17:00:20.000000'),(248,'2021-11-08 19:08:31.000000'),(249,'2021-11-08 21:03:12.000000'),(250,'2021-11-09 21:29:32.000000'),(251,'2021-11-10 16:07:33.000000'),(252,'2021-11-10 16:12:36.000000'),(253,'2021-11-10 16:13:25.000000'),(254,'2021-11-10 16:28:22.000000'),(255,'2021-11-10 16:30:07.000000'),(256,'2021-11-10 16:44:41.000000');
/*!40000 ALTER TABLE `import_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_students_master`
--

DROP TABLE IF EXISTS `import_students_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_students_master` (
  `Master_Id` int NOT NULL AUTO_INCREMENT,
  `By_User_Id` int DEFAULT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Master_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_students_master`
--

LOCK TABLES `import_students_master` WRITE;
/*!40000 ALTER TABLE `import_students_master` DISABLE KEYS */;
INSERT INTO `import_students_master` VALUES (1,45,'2021-06-02 00:00:00.000000'),(2,45,'2021-07-01 00:00:00.000000'),(3,45,'2021-07-01 00:00:00.000000'),(4,45,'2021-08-06 00:00:00.000000'),(5,45,'2021-08-06 00:00:00.000000'),(6,45,'2021-08-10 00:00:00.000000'),(7,45,'2021-08-10 00:00:00.000000'),(8,45,'2021-08-10 00:00:00.000000'),(9,45,'2021-08-10 00:00:00.000000'),(10,45,'2021-08-10 00:00:00.000000'),(11,45,'2021-08-10 00:00:00.000000'),(12,45,'2021-08-10 00:00:00.000000'),(13,45,'2021-08-11 00:00:00.000000'),(14,45,'2021-08-11 00:00:00.000000'),(15,45,'2021-08-11 00:00:00.000000'),(16,45,'2021-08-11 00:00:00.000000'),(17,45,'2021-08-11 00:00:00.000000'),(18,45,'2021-08-11 00:00:00.000000'),(19,45,'2021-08-11 00:00:00.000000'),(20,45,'2021-08-11 00:00:00.000000'),(21,45,'2021-08-11 00:00:00.000000'),(22,45,'2021-08-11 00:00:00.000000'),(23,45,'2021-08-11 00:00:00.000000'),(24,45,'2021-08-11 00:00:00.000000'),(25,45,'2021-08-11 00:00:00.000000'),(26,45,'2021-08-11 00:00:00.000000'),(27,45,'2021-08-11 00:00:00.000000'),(28,45,'2021-08-11 00:00:00.000000'),(29,45,'2021-08-11 00:00:00.000000'),(30,45,'2021-08-11 00:00:00.000000'),(31,45,'2021-08-11 00:00:00.000000'),(32,45,'2021-08-11 00:00:00.000000'),(33,45,'2021-08-11 00:00:00.000000'),(34,45,'2021-08-11 00:00:00.000000'),(35,45,'2021-08-11 00:00:00.000000'),(36,45,'2021-08-11 00:00:00.000000'),(37,45,'2021-08-11 00:00:00.000000'),(38,45,'2021-08-11 00:00:00.000000'),(39,45,'2021-08-11 00:00:00.000000'),(40,45,'2021-08-11 00:00:00.000000'),(41,45,'2021-08-11 00:00:00.000000'),(42,45,'2021-08-25 00:00:00.000000'),(43,45,'2021-10-13 00:00:00.000000'),(44,45,'2021-10-13 00:00:00.000000'),(45,45,'2021-11-01 00:00:00.000000'),(46,45,'2021-11-01 00:00:00.000000');
/*!40000 ALTER TABLE `import_students_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intake`
--

DROP TABLE IF EXISTS `intake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intake` (
  `intake_Id` int NOT NULL,
  `intake_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`intake_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intake`
--

LOCK TABLES `intake` WRITE;
/*!40000 ALTER TABLE `intake` DISABLE KEYS */;
INSERT INTO `intake` VALUES (1,'January',0),(2,'February',0),(3,'March',0),(4,'April',0),(5,'May',0),(6,'June',0),(7,'July',0),(8,'August',0),(9,'September',0),(10,'October',0),(11,'November',0),(12,'December',0);
/*!40000 ALTER TABLE `intake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intake_year`
--

DROP TABLE IF EXISTS `intake_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intake_year` (
  `Intake_Year_Id` int NOT NULL,
  `Intake_Year_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Intake_Year_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intake_year`
--

LOCK TABLES `intake_year` WRITE;
/*!40000 ALTER TABLE `intake_year` DISABLE KEYS */;
INSERT INTO `intake_year` VALUES (1,'2022',0),(2,'2023',0),(3,'2024',0),(4,'2025',0),(5,'2026',0),(6,'2027',0),(7,'2028',0),(8,'2029',0),(9,'2030',0),(10,'2031',0),(11,'2032',0),(12,'2033',0);
/*!40000 ALTER TABLE `intake_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internship`
--

DROP TABLE IF EXISTS `internship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internship` (
  `internship_Id` int NOT NULL,
  `internship_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`internship_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internship`
--

LOCK TABLES `internship` WRITE;
/*!40000 ALTER TABLE `internship` DISABLE KEYS */;
INSERT INTO `internship` VALUES (1,'No',0);
/*!40000 ALTER TABLE `internship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_detail`
--

DROP TABLE IF EXISTS `level_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level_detail` (
  `Level_Detail_Id` int NOT NULL,
  `Level_Detail_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Level_Detail_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_detail`
--

LOCK TABLES `level_detail` WRITE;
/*!40000 ALTER TABLE `level_detail` DISABLE KEYS */;
INSERT INTO `level_detail` VALUES (1,'Masters',0),(2,'Bachelors',0);
/*!40000 ALTER TABLE `level_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lor_1_mode`
--

DROP TABLE IF EXISTS `lor_1_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lor_1_mode` (
  `LOR_1_Id` int NOT NULL,
  `LOR_1_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`LOR_1_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lor_1_mode`
--

LOCK TABLES `lor_1_mode` WRITE;
/*!40000 ALTER TABLE `lor_1_mode` DISABLE KEYS */;
INSERT INTO `lor_1_mode` VALUES (1,'Institution',0),(2,'Employer',0);
/*!40000 ALTER TABLE `lor_1_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lor_2_mode`
--

DROP TABLE IF EXISTS `lor_2_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lor_2_mode` (
  `LOR_2_Id` int NOT NULL,
  `LOR_2_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LOR_2_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lor_2_mode`
--

LOCK TABLES `lor_2_mode` WRITE;
/*!40000 ALTER TABLE `lor_2_mode` DISABLE KEYS */;
INSERT INTO `lor_2_mode` VALUES (1,'Institution','0'),(2,'Employer','0');
/*!40000 ALTER TABLE `lor_2_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Menu_Id` bigint NOT NULL AUTO_INCREMENT,
  `Menu_Name` varchar(250) DEFAULT NULL,
  `Menu_Order` bigint DEFAULT NULL,
  `IsEdit` tinyint unsigned DEFAULT NULL,
  `IsSave` tinyint unsigned DEFAULT NULL,
  `IsDelete` tinyint unsigned DEFAULT NULL,
  `IsView` tinyint unsigned DEFAULT NULL,
  `Menu_Status` tinyint unsigned DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  `Menu_Type` tinyint DEFAULT NULL,
  PRIMARY KEY (`Menu_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Usr details',15,1,1,1,1,1,0,1),(2,'Country',7,1,1,1,1,0,0,1),(3,'Course',3,1,1,1,1,1,0,1),(4,'Document',8,1,1,1,1,1,0,1),(5,'Student',1,1,1,1,1,1,0,1),(6,'Subject',9,1,1,1,1,0,0,1),(7,'University',10,1,1,1,1,0,0,1),(8,'Home Page',8,1,1,1,1,1,0,1),(9,'Dashboard',16,1,1,1,1,1,0,1),(10,'Course Import',2,1,1,1,1,1,0,1),(11,'Account Group',11,1,1,1,1,0,0,1),(12,'Client Accounts',12,1,1,1,1,0,0,1),(13,'Agent',13,1,1,1,1,0,0,1),(14,'Department',5,1,1,1,1,1,0,1),(15,'Branch',6,1,1,1,1,1,0,1),(16,'Department Status',11,1,1,1,1,1,0,1),(17,'Student Report',12,0,1,0,1,1,0,1),(18,'Remarks',4,1,1,1,1,1,0,1),(19,'Work report',13,0,1,0,1,1,0,1),(20,'Enquiry Source',3,1,1,1,1,1,0,1),(21,'Time Track',14,1,1,1,1,1,0,1),(22,'Registration',22,1,1,1,1,1,0,0),(23,'Remove Registration',23,1,1,1,1,1,0,0),(24,'Registration Report',24,0,1,0,1,1,0,0),(25,'Enquiry Source Report',25,0,0,0,0,0,0,1),(26,'Efficiency Report',26,0,1,0,1,0,0,1),(27,'Student Import',27,1,1,1,1,1,0,1),(28,'Pending FollowUp',28,1,1,1,1,1,0,1),(29,'Fees',29,1,1,1,1,1,0,1),(30,'Fees Receipt Report',30,0,1,0,1,1,0,0),(31,'Fees Collection',31,1,1,1,1,1,0,0),(32,'Enquiry Source Summary',32,0,1,0,1,1,0,1),(33,'Counselor Fees  Receipt Report',33,0,1,0,1,0,0,1),(34,'Counselor Registration Report',34,0,1,0,1,0,0,1),(35,'Student Summary Report',35,0,1,0,1,1,0,1),(36,'Staff Target Report',36,0,1,0,1,0,0,1),(37,'Student Search',37,1,1,1,1,1,0,1),(38,'Export Permission',38,0,0,0,1,1,0,0),(39,'Work Summary',39,1,1,1,1,0,0,1),(40,'Course History',40,1,0,0,1,1,0,1),(41,'Search Course Tab',41,1,0,0,1,1,0,0),(42,'Fees Collection Tab',42,1,0,0,1,1,0,0),(43,'Userwise Receipt Summary',43,1,1,1,1,0,0,1),(44,'branchwise Summary',44,1,1,1,1,0,0,1),(45,'Statistics Tab',45,0,0,0,0,0,0,0),(46,'PageA',46,1,1,1,1,0,0,0),(47,'PageB',47,1,1,1,1,0,0,0),(48,'PageC',48,1,1,1,1,0,0,0),(49,'Document View',49,0,0,0,1,1,0,0),(50,'Receipt Summary Report',50,0,1,0,1,1,0,1),(51,'Registration Summary',51,1,1,1,1,1,0,1),(52,'Enquiry Conversion',52,0,1,0,1,1,0,1),(53,'Employee Summary',53,0,1,0,1,1,0,1),(54,'User Role',20,1,1,1,1,1,0,1),(55,'Company',22,1,1,1,1,1,0,1),(56,'Settings',23,0,0,1,0,1,0,1),(57,'Documnetation Report',13,1,1,1,1,1,0,1),(58,'Work History',14,1,1,1,1,1,0,1),(59,'Registration By EnquirySource',59,1,1,1,1,1,0,1),(60,'Applications Tab',60,1,1,1,1,1,0,1),(61,'Checklist Tab',61,1,1,1,1,1,0,1),(62,'Checklist ',62,1,1,1,1,1,0,1),(63,'Active',63,1,1,1,1,1,0,0),(64,'Deactive',64,1,1,1,1,1,0,0),(65,'AgentView',65,1,1,1,1,1,0,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moi_mode`
--

DROP TABLE IF EXISTS `moi_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moi_mode` (
  `MOI_Id` int NOT NULL,
  `MOI_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`MOI_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moi_mode`
--

LOCK TABLES `moi_mode` WRITE;
/*!40000 ALTER TABLE `moi_mode` DISABLE KEYS */;
INSERT INTO `moi_mode` VALUES (1,'Yes',0),(2,'No',0);
/*!40000 ALTER TABLE `moi_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport_mode`
--

DROP TABLE IF EXISTS `passport_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passport_mode` (
  `Passport_Id` int NOT NULL,
  `Passport_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Passport_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport_mode`
--

LOCK TABLES `passport_mode` WRITE;
/*!40000 ALTER TABLE `passport_mode` DISABLE KEYS */;
INSERT INTO `passport_mode` VALUES (1,'Yes',0),(2,'No',0);
/*!40000 ALTER TABLE `passport_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_details`
--

DROP TABLE IF EXISTS `primary_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `primary_details` (
  `Primary_Details_Id` bigint NOT NULL AUTO_INCREMENT,
  `Primary_Code` varchar(50) DEFAULT NULL,
  `Primary_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Primary_Details_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_details`
--

LOCK TABLES `primary_details` WRITE;
/*!40000 ALTER TABLE `primary_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `primary_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remarks`
--

DROP TABLE IF EXISTS `remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remarks` (
  `Remarks_Id` int NOT NULL AUTO_INCREMENT,
  `Remarks_Name` varchar(150) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Remarks_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remarks`
--

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;
INSERT INTO `remarks` VALUES (1,'test',0),(2,'test2',1),(3,'custom remark',1);
/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume_mode`
--

DROP TABLE IF EXISTS `resume_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resume_mode` (
  `Resume_Id` int NOT NULL,
  `Resume_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Resume_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume_mode`
--

LOCK TABLES `resume_mode` WRITE;
/*!40000 ALTER TABLE `resume_mode` DISABLE KEYS */;
INSERT INTO `resume_mode` VALUES (1,'Yes'),(2,'No');
/*!40000 ALTER TABLE `resume_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_table`
--

DROP TABLE IF EXISTS `settings_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings_table` (
  `Settings_Id` int NOT NULL AUTO_INCREMENT,
  `Settings_Group_Id` int DEFAULT NULL,
  `Settings_Caption` varchar(45) DEFAULT NULL,
  `Settings_Value` varchar(45) DEFAULT NULL,
  `Delete_Status` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Settings_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_table`
--

LOCK TABLES `settings_table` WRITE;
/*!40000 ALTER TABLE `settings_table` DISABLE KEYS */;
INSERT INTO `settings_table` VALUES (1,1,'User','40',0);
/*!40000 ALTER TABLE `settings_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sop_mode`
--

DROP TABLE IF EXISTS `sop_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sop_mode` (
  `SOP_Id` int NOT NULL,
  `SOP_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`SOP_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sop_mode`
--

LOCK TABLES `sop_mode` WRITE;
/*!40000 ALTER TABLE `sop_mode` DISABLE KEYS */;
INSERT INTO `sop_mode` VALUES (1,'Yes',0),(2,'No',0);
/*!40000 ALTER TABLE `sop_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `Status_Id` int NOT NULL AUTO_INCREMENT,
  `Status_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (135,'Interested',0),(136,'Not Interested',0),(138,'Payment Received',0),(139,'Payment Pending',0),(140,'Unknown',0),(141,'Disqualified',0),(142,'Not enough fund',0),(143,'Joined',0);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_selection`
--

DROP TABLE IF EXISTS `status_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_selection` (
  `Status_Selection_Id` int NOT NULL AUTO_INCREMENT,
  `Department_Id` int DEFAULT NULL,
  `Status_Id` int DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Status_Selection_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_selection`
--

LOCK TABLES `status_selection` WRITE;
/*!40000 ALTER TABLE `status_selection` DISABLE KEYS */;
INSERT INTO `status_selection` VALUES (1,317,136,0),(2,0,0,0),(3,318,139,0),(4,0,0,0),(5,0,0,0),(6,0,0,0),(7,0,0,0),(8,317,135,0),(9,300,135,0),(10,323,136,0),(11,322,136,0),(12,322,135,0),(13,323,140,0),(14,300,136,0),(18,0,0,0),(19,0,0,0),(20,323,135,0),(21,300,140,0),(22,0,0,0),(23,0,0,0),(24,0,0,0),(26,318,138,0),(27,0,0,0),(30,325,141,0),(33,324,143,0),(34,324,141,0),(35,324,142,0),(36,324,136,0),(38,328,141,0),(39,329,141,0);
/*!40000 ALTER TABLE `status_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_Id` int NOT NULL AUTO_INCREMENT,
  `Agent_Id` int DEFAULT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  `Student_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `Pincode` varchar(7) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(25) DEFAULT NULL,
  `Dob` varchar(20) DEFAULT NULL,
  `Country_Name` varchar(45) DEFAULT NULL,
  `Promotional_Code` varchar(50) DEFAULT NULL,
  `Student_Status_Id` int DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Student_FollowUp_Id` int DEFAULT NULL,
  `Next_FollowUp_date` datetime(6) DEFAULT NULL,
  `Department` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `User_Id` int DEFAULT NULL,
  `Branch` int DEFAULT NULL,
  `Remark` varchar(4000) DEFAULT NULL,
  `Remark_Id` int DEFAULT NULL,
  `By_User_Id` int DEFAULT NULL,
  `Passport_Copy` varchar(100) DEFAULT NULL,
  `IELTS` varchar(100) DEFAULT NULL,
  `Passport_Photo` varchar(100) DEFAULT NULL,
  `Tenth_Certificate` varchar(100) DEFAULT NULL,
  `Work_Experience` varchar(100) DEFAULT NULL,
  `Resume` varchar(100) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  `Enquiry_Source_Id` int DEFAULT NULL,
  `Alternative_Phone_Number` varchar(45) DEFAULT NULL,
  `Alternative_Email` varchar(100) DEFAULT NULL,
  `Whatsapp` varchar(45) DEFAULT NULL,
  `Facebook` varchar(45) DEFAULT NULL,
  `Passport_Copy_File_Name` varchar(500) DEFAULT NULL,
  `IELTS_File_Name` varchar(500) DEFAULT NULL,
  `Passport_Photo_File_Name` varchar(500) DEFAULT NULL,
  `Tenth_Certificate_File_Name` varchar(500) DEFAULT NULL,
  `Work_Experience_File_Name` varchar(500) DEFAULT NULL,
  `Resume_File_Name` varchar(500) DEFAULT NULL,
  `Is_Registered` tinyint unsigned DEFAULT NULL,
  `Registered_By` int DEFAULT NULL,
  `Registered_On` datetime(6) DEFAULT NULL,
  `Created_By` int DEFAULT NULL,
  `Registration_Target` int DEFAULT NULL,
  `FollowUp_Count` int DEFAULT NULL,
  `FollowUp_Entrydate` datetime(6) DEFAULT NULL,
  `Registration_Branch` int DEFAULT NULL,
  `Entry_Type` int DEFAULT NULL,
  `First_Followup_Status` tinyint DEFAULT NULL,
  `First_Followup_Date` datetime DEFAULT NULL,
  `College_University` varchar(45) DEFAULT NULL,
  `Programme_Course` varchar(45) DEFAULT NULL,
  `Intake` varchar(45) DEFAULT NULL,
  `Year` varchar(45) DEFAULT NULL,
  `Reference` varchar(45) DEFAULT NULL,
  `Visa_Submission_Date` varchar(45) DEFAULT NULL,
  `Activity` varchar(45) DEFAULT NULL,
  `Course_Link` varchar(45) DEFAULT NULL,
  `Agent` varchar(45) DEFAULT NULL,
  `Status_Details` varchar(45) DEFAULT NULL,
  `Student_Remark` varchar(45) DEFAULT NULL,
  `Send_Welcome_Mail_Status` varchar(45) DEFAULT NULL,
  `sslc_year` varchar(45) DEFAULT NULL,
  `sslc_institution` varchar(45) DEFAULT NULL,
  `sslc_markoverall` varchar(45) DEFAULT NULL,
  `sslc_englishmark` varchar(45) DEFAULT NULL,
  `plustwo_year` varchar(45) DEFAULT NULL,
  `plustwo_institution` varchar(100) DEFAULT NULL,
  `plustwo_markoverall` varchar(45) DEFAULT NULL,
  `plustwo_englishmark` varchar(45) DEFAULT NULL,
  `graduation_year` varchar(45) DEFAULT NULL,
  `graduation_institution` varchar(100) DEFAULT NULL,
  `graduation_markoverall` varchar(45) DEFAULT NULL,
  `graduation_englishmark` varchar(45) DEFAULT NULL,
  `postgraduation_year` varchar(45) DEFAULT NULL,
  `postgraduation_institution` varchar(45) DEFAULT NULL,
  `postgraduation_markoverall` varchar(45) DEFAULT NULL,
  `postgraduation_englishmark` varchar(45) DEFAULT NULL,
  `other_year` varchar(45) DEFAULT NULL,
  `other_instituation` varchar(45) DEFAULT NULL,
  `other_markoverall` varchar(45) DEFAULT NULL,
  `other_englishmark` varchar(45) DEFAULT NULL,
  `exp_institution_1` varchar(45) DEFAULT NULL,
  `exp_institution_2` varchar(45) DEFAULT NULL,
  `exp_designation_1` varchar(45) DEFAULT NULL,
  `exp_designation_2` varchar(45) DEFAULT NULL,
  `exp_designation_3` varchar(45) DEFAULT NULL,
  `exp_designation_4` varchar(45) DEFAULT NULL,
  `exp_tenure_from_1` date DEFAULT NULL,
  `exp_tenure_from_2` date DEFAULT NULL,
  `exp_tenure_from_3` date DEFAULT NULL,
  `exp_tenure_from_4` date DEFAULT NULL,
  `exp_tenure_to_1` date DEFAULT NULL,
  `exp_tenure_to_2` date DEFAULT NULL,
  `exp_tenure_to_3` date DEFAULT NULL,
  `exp_tenure_to_4` date DEFAULT NULL,
  `exp_institution_3` varchar(45) DEFAULT NULL,
  `exp_institution_4` varchar(45) DEFAULT NULL,
  `IELTS_Overall` varchar(45) DEFAULT NULL,
  `IELTS_Listening` varchar(45) DEFAULT NULL,
  `IELTS_Reading` varchar(45) DEFAULT NULL,
  `IELTS_Writting` varchar(45) DEFAULT NULL,
  `IELTS_Speaking` varchar(45) DEFAULT NULL,
  `Passport_No` varchar(45) DEFAULT NULL,
  `Passport_fromdate` date DEFAULT NULL,
  `Passport_Todate` date DEFAULT NULL,
  `LOR_1_Id` int DEFAULT NULL,
  `LOR_2_Id` int DEFAULT NULL,
  `MOI_Id` int DEFAULT NULL,
  `SOP_Id` int DEFAULT NULL,
  `Ielts_Id` int DEFAULT NULL,
  `Passport_Id` int DEFAULT NULL,
  `Resume_Id` int DEFAULT NULL,
  `Student_Registration_Id` int DEFAULT NULL,
  PRIMARY KEY (`Student_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,1,'2022-01-11 12:02:08.000000','devu','','Select','xxxx','xxx','656565','xwsaf','9874563233','2021-12-31','xx','',1,'',438401,NULL,NULL,NULL,81,36,NULL,NULL,45,NULL,NULL,NULL,NULL,NULL,NULL,0,47,'','sdfgsdfg','sdgtgfsd','sfgfdsg','','','','','','',0,NULL,NULL,NULL,NULL,1,'2022-01-11 12:02:08.000000',NULL,1,1,'2022-01-11 12:02:08','xxx','xxx','xx','','','','xxx','xxxx','','xxxxx','','0','dfvzd','dfvgds','sdgdg','ghnhjfgh','fgxhftg','fbgc','fgbvb','fvbgf','dfg','dstra','wertr','wtfrqew','ewtfre','retfre','wretw','wer','wer','wre','wr','wer','ftyf','tyf65','hgy','ygutg76y','uih78u','7y9767',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ft65r','g68you','9','5','3','8','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'2022-01-11 12:12:03.000000','Bilu','','Select','','','','','9874563230','2022-01-11','','',1,'',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,48,'','','','','','','','','','',1,1,'2022-01-31 10:18:13.000000',NULL,NULL,0,'2022-01-11 12:12:03.000000',NULL,1,1,'2022-01-11 12:12:03','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','','1478532','2021-12-31','2022-01-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'2022-01-11 12:20:44.000000','Sam','','Select','','','','','9874560255','2022-01-11','','',1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,40,'','','','','','','','','','',0,NULL,NULL,NULL,NULL,0,'2022-01-11 12:20:44.000000',NULL,1,1,'2022-01-11 12:20:44','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','ww','ww','ww','ee','ddd','dfsg','2022-01-23','2021-12-29','2021-12-29','2022-01-07','2022-01-26','2022-01-30','2022-01-11','2022-02-06','dd','dc','','','','','','123','2022-01-11','2022-01-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'2022-01-11 15:26:51.000000','hila','','Select','','','','','9874063255','2022-01-11','','',1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,48,'','','','','','','','','','',0,NULL,NULL,NULL,NULL,0,'2022-01-11 15:26:51.000000',NULL,1,1,'2022-01-11 15:26:51','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','','','','','','','','','2022-01-11','2022-01-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,'2022-01-11 15:39:38.000000','1','','Select','','','','','9874513255','2022-01-11','','',1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,47,'','','','','','','','','','',0,NULL,NULL,NULL,NULL,0,'2022-01-11 15:39:38.000000',NULL,1,1,'2022-01-11 15:39:38','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','','','','','','','','','2022-01-11','2022-01-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,'2022-01-11 17:03:14.000000','niya','','Select','','','','','8979455612','2022-01-11','','',1,'',438380,'2022-01-11 00:00:00.000000',318,139,45,36,'wew3etr',0,45,NULL,NULL,NULL,NULL,NULL,NULL,0,50,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-11 17:03:14.000000',NULL,1,1,'2022-01-11 17:03:14','','','','','','','','','','','','0','0','','','','','','','','','','','','','','','','','','','','wqre','sfvsf','qrww','sadfg','sfsg','fsgag','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','SfdAS','gsa','1','2','3','4','5','','2022-01-11','2022-01-11',2,1,1,1,1,NULL,NULL,NULL),(7,1,'2022-01-11 17:08:42.000000','xxxxx','','Select','','','','','9874563255','2022-01-11','','',1,'',438381,'2022-01-11 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,53,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-11 17:08:42.000000',NULL,1,1,'2022-01-11 17:08:42','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','2022-01-11','','','','','','','','','2022-01-11','2022-01-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,1,'2022-01-11 17:30:32.000000','maya','','Select','xxxxx','xxx','656565','xxxx@gmail.com','8974566598','2022-01-11','xxxx','',1,'',438382,'2022-01-11 00:00:00.000000',318,139,45,36,'test',1,45,'f79f8490-7ffe-11ec-ac52-fda010b3a3bd.jpg','bf8f5600-8000-11ec-95a7-71fc6129cb1b.png','fecd3430-7ffc-11ec-b444-f5af3e7131b9.png',NULL,NULL,NULL,0,48,'xxxxxxxxxx','xxxx@gmail.com','9865659899','fgdg','background1.jpg','bg56.png','Attendence.png','','','bg17.jpg',1,1,'2022-01-31 10:17:59.000000',45,NULL,1,'2022-01-11 17:30:32.000000',NULL,1,1,'2022-01-11 17:30:32','xxxxx','xxx','xx','','','','xxx','xxxxxxxxx','','dsfdf','','0','0','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','wqre','sfvsf','qrww','sadfg','sfsg','fsgag','2022-01-04','2021-12-29','2021-12-30','2021-12-29','2021-12-28','2022-01-21','2022-01-28','2022-01-23','SfdAS','gsa','1','1','1','1','1','12344556','2021-12-27','2021-12-31',2,1,1,1,1,2,1,NULL),(9,1,'2022-01-12 10:24:37.000000','DD','','Select','','','','','7894561233','2022-01-12','','',1,'',438383,'2022-01-12 00:00:00.000000',318,139,45,36,'WETSWT',0,45,'bead55b0-7363-11ec-8b23-87360e6a92b7.xlsx',NULL,NULL,NULL,NULL,NULL,0,33,'','','','','PRE ORDER.xlsx','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-12 10:24:37.000000',NULL,1,1,'2022-01-12 10:24:37','','','','','','','','SWDFSEWDF','','SAXaD','','0','0','CDasD','SADXSAW','SXDS','FCsaeF','ACFCAS','SAZDC','sxsa','AZFC','SACDFSA','ASDC','SaD','SZAFC','ASCD','SCDS','ZFGsd','CADFC','CDSADC','szxS','RET','SWDEF','DEFw','EDFESW','SDEFEWS','gREWF','BGRE','2022-01-01','2022-01-01','2022-01-22','2022-01-14','2022-01-07','2022-01-07','2022-01-19','2022-01-20','FWSEF','FVGDFR','7','7','7','7','7','SEWFWEFR','2021-12-30','2022-01-07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,'2022-01-12 14:33:23.000000','DDf','','Select','','','','','8975648555','2022-01-12','','',1,'',438384,'2022-01-12 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,49,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-12 14:33:23.000000',NULL,1,1,'2022-01-12 14:33:23','','','','','','','','','','','','0','0','iyujk','','','','kiuyjh','','','','gkjvig','','','','yhkh','','','','ih ','','','safed','sytxrtuye x','tr5uyxrtfujyh','ikcyg','hklo','uyhijlu','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','jfrtgurrrrr','jolktyu','4','44','4','4','4','','2022-01-12','2022-01-12',2,1,1,1,1,NULL,NULL,NULL),(11,1,'2022-01-12 14:37:37.000000','das','','Select','','','','jesna@ufstechnologies.com','7878787878','2022-01-06','','',1,'',438385,'2022-01-12 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,53,'','','','','','','','','','',1,45,'2022-02-01 13:44:49.000000',45,NULL,1,'2022-01-12 14:37:37.000000',36,1,1,'2022-01-12 14:37:37','','','','','','','','','','','','0','0','','','','','','','','','','','','','','','','','','','','wqre','sfvsf','qrww','sadfg','sfsg','fsgag','2022-01-14','2022-01-30','2022-01-08','2022-01-15','2022-01-26','2022-01-28','2022-01-14','2021-12-29','SfdAS','gsa','3','3','3','3','3','','2022-01-07','2022-01-27',2,1,1,1,1,0,0,2),(12,1,'2022-01-12 14:39:07.000000','11','','Select','','','','','9999999999','2022-01-12','','',1,'',438386,'2022-01-12 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,1,48,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-12 14:39:07.000000',NULL,1,1,'2022-01-12 14:39:07','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','','','','','','','','','2022-01-12','2022-01-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,1,'2022-01-12 14:41:25.000000','2222','','Select','','','','','2222222222','2022-01-12','','',1,'',438387,'2022-01-12 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,1,48,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-12 14:41:25.000000',NULL,1,1,'2022-01-12 14:41:25','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','2022-01-12','','','','','','','','','2022-01-12','2022-01-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,'2022-01-12 14:42:28.000000','4','','Select','','','','','9874563253','2022-01-12','','',1,'',438388,'2022-01-12 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,1,53,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-12 14:42:28.000000',NULL,1,1,'2022-01-12 14:42:28','','','','','','','','','','','','0','0','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-14','2022-01-06','2022-01-06','2021-12-30','2022-01-14','2022-01-06','2022-01-29','2022-01-14','','','','','','','','','2022-01-14','2021-12-30',1,2,1,1,NULL,NULL,NULL,NULL),(15,1,'2022-01-12 17:45:17.000000','Dhanya','','Select','xxxxx','xxx','656565','sreelakshmi0011m@ufstechnolDRFTHYXFTRHogies.com','8974566500','2022-01-01','xxxx','',1,'',438389,'2022-01-12 00:00:00.000000',318,139,45,36,'test',1,45,'4ddd9960-73a1-11ec-8b65-c9d5855d90b2.xlsx','64147c20-834c-11ec-b238-e794603bf9f4.txt','4710f6d0-834c-11ec-b238-e794603bf9f4.txt',NULL,NULL,NULL,0,50,'12343567890','xxxx@gmaDFGHFHil.com','98656598900','fgdg','sales1.xlsx','passport.txt','passport.txt','','','Certificate.txt',1,45,'2022-02-02 11:29:57.000000',45,NULL,1,'2022-01-12 17:45:17.000000',36,1,1,'2022-01-12 17:45:17','xxxxx','xxx','xx','','','','xxx','xxxxxxxxx','','dsfdf','','0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','23','22','24','26','28','2022-01-04','2022-01-06','2022-01-08','2022-01-10','2022-01-05','2022-01-07','2022-01-09','2022-01-11','25','27','9','9','9','9','9','1234455600','2022-01-02','2022-01-03',1,2,1,2,2,1,1,3),(16,1,'2022-01-15 14:27:11.000000','Lee','','Select','','','','','7785412032','1995-01-15','','',1,'',438390,'2022-01-15 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,'208a7900-75e1-11ec-8c25-c90b9c5692b7.png',0,49,'','','','','','','','','','Add a heading.png',0,NULL,NULL,45,NULL,1,'2022-01-15 14:27:11.000000',NULL,1,1,'2022-01-15 14:27:11','','','','','','','','','','','','0','2011','ST.George HSS','85','91','2013','ST.George HSS','90','90','2017','SNG Colleage ','82','89','2019','SNG Colleage ','85','89','2020','TAT ','98','98','TAT','SAF','Developer','Developer','Developer','Developer','2021-01-16','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','ADS','ZSA','9','9','9','9','9','789456','2017-01-15','2037-01-15',1,2,1,1,1,1,1,NULL),(17,1,'2022-01-15 17:27:54.000000','Daksh','','Select','Fourt AS/124','K K Road','688453','daksh20@gmail.com','9998544123','1995-01-15','Canada','',1,'',438391,'2022-01-15 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,32,'9998544123','dakshp20@gmail.com','9998544123','daksh20@gmail.com','','','','','','pic1.jpg',0,NULL,NULL,45,NULL,1,'2022-01-15 17:27:54.000000',NULL,1,1,'2022-01-15 17:27:54','Oxford University','CSE','Test','','','','Test','Test','','Test','','0','2011','ST.George HSS','85','91','2013','ST.George HSS','90','90','2017','SNG Colleage ','82','89','2019','SNG Colleage ','85','89','2020','TAT ','98','98','TAT','SAF','Developer','Developer','Developer','Developer','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','2022-01-15','ADS','ZSA','9','9','9','9','10','789555','2022-01-15','2022-01-15',1,2,1,1,1,1,1,NULL),(18,1,'2022-01-17 10:52:18.000000','Deepika','','Select','','','','','7788542100','1995-01-15','','',1,'',438392,'2022-01-17 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,47,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-17 10:52:18.000000',NULL,1,1,'2022-01-17 10:52:18','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-17','2022-01-17','2022-01-17','2022-01-17','2022-01-17','2022-01-17','2022-01-17','2022-01-17','','','','','','','','','2022-01-17','2022-01-17',0,0,0,0,0,0,0,NULL),(19,1,'2022-01-24 10:43:35.000000','q','','Select','','','','jesnajayakrishnan47@gmail.com','1234567901','2022-01-24','','',1,'',438393,'2022-01-24 00:00:00.000000',318,139,45,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,40,'','','','','','','','','','',1,45,'2022-01-24 10:59:42.000000',45,NULL,1,'2022-01-24 10:43:35.000000',36,1,1,'2022-01-24 10:43:35','','','','','','','','','','','','1','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','','','','','','','','','2022-01-24','2022-01-24',0,0,0,0,0,0,0,NULL),(20,1,'2022-01-24 13:09:18.000000','112','','Select','','','','','1212121221','','','',1,'',438402,'2022-01-24 00:00:00.000000',318,139,81,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,40,'','','','','','','','','','',1,45,'2022-01-28 16:13:13.000000',45,NULL,1,'2022-01-24 13:09:18.000000',36,1,1,'2022-01-24 13:09:18','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24','','','','','','','','','2022-01-24','2022-01-24',0,0,0,0,0,0,0,NULL),(21,1,'2022-01-28 14:31:02.000000','Lee','','Select','','','','','9909993999','','','',1,'',438403,'2022-01-28 00:00:00.000000',318,139,81,36,'test',1,45,NULL,NULL,NULL,NULL,NULL,NULL,0,47,'','','','','','','','','','',0,NULL,NULL,45,NULL,1,'2022-01-28 14:31:02.000000',NULL,1,1,'2022-01-28 14:31:02','','','','','','','','','','','','0','','','','','','','','','','','','','','','','','','','','','','','','','','','2022-01-28','2022-01-28','2022-01-28','2022-01-28','2022-01-28','2022-01-28','2022-01-28','2022-01-28','','','','','','','','','2022-01-28','2022-01-28',0,0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_checklist`
--

DROP TABLE IF EXISTS `student_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_checklist` (
  `Student_Checklist_Id` int NOT NULL AUTO_INCREMENT,
  `Check_List_Id` int DEFAULT NULL,
  `Student_Id` int DEFAULT NULL,
  `Applicable` tinyint DEFAULT NULL,
  `Checklist_Status` tinyint DEFAULT NULL,
  `Description` varchar(150) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Student_Checklist_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_checklist`
--

LOCK TABLES `student_checklist` WRITE;
/*!40000 ALTER TABLE `student_checklist` DISABLE KEYS */;
INSERT INTO `student_checklist` VALUES (1,1,15,1,1,NULL,0),(2,1,15,1,1,NULL,0),(3,1,15,1,1,NULL,0),(4,1,15,1,1,NULL,0),(5,1,15,1,1,NULL,0),(6,1,15,1,1,NULL,0),(7,1,11,1,1,NULL,0),(8,1,11,1,1,NULL,0),(9,1,15,1,1,NULL,0),(10,1,15,1,1,NULL,0),(11,1,15,1,1,NULL,0),(12,1,15,1,1,NULL,0),(13,1,15,1,1,NULL,0),(14,1,15,1,1,NULL,0),(15,1,15,1,1,NULL,0),(16,1,15,1,1,NULL,0),(17,1,15,1,1,NULL,0),(18,1,15,1,1,NULL,0),(19,1,15,1,1,NULL,0),(20,1,15,1,1,NULL,0),(21,1,15,1,1,NULL,0),(22,1,15,1,1,NULL,0),(23,1,15,1,1,NULL,0),(24,1,15,1,1,NULL,0),(25,1,15,1,1,NULL,0),(26,1,15,1,1,NULL,0),(27,1,11,1,1,NULL,0),(28,1,11,1,1,NULL,0),(29,1,15,1,1,NULL,0),(30,1,15,1,1,NULL,0),(31,1,15,1,1,NULL,0),(32,1,15,1,1,NULL,0),(33,1,15,1,1,NULL,0),(34,1,15,1,1,NULL,0),(35,1,15,1,1,NULL,0),(36,1,15,1,1,NULL,0),(37,1,15,1,1,NULL,0),(38,1,15,1,1,NULL,0),(39,1,15,1,1,NULL,0),(40,1,15,1,1,NULL,0),(41,1,15,1,1,NULL,0),(42,1,15,1,1,NULL,0),(43,1,15,1,1,NULL,0),(44,1,15,1,1,NULL,0),(45,1,15,1,1,NULL,0),(46,1,15,1,1,NULL,0),(47,1,15,1,1,NULL,0),(48,1,15,1,1,NULL,0),(49,1,15,1,1,NULL,0),(50,1,15,1,1,NULL,0),(51,1,15,1,1,NULL,0),(52,1,15,1,1,NULL,0),(53,1,15,1,1,NULL,0),(54,1,15,1,1,NULL,0),(55,1,15,1,1,NULL,0),(56,1,15,1,1,NULL,0),(57,1,15,1,1,NULL,0),(58,1,15,1,1,NULL,0),(59,1,15,1,1,NULL,0),(60,1,15,1,1,NULL,0),(61,1,15,1,1,NULL,0),(62,1,15,1,1,NULL,0),(63,1,15,1,1,NULL,0),(64,1,15,1,1,NULL,0),(65,1,15,1,1,NULL,0),(66,1,15,1,1,NULL,0),(67,1,15,1,1,NULL,0),(68,1,15,1,1,NULL,0),(69,1,15,1,1,NULL,0),(70,1,15,1,1,NULL,0),(71,1,15,1,1,NULL,0),(72,1,15,1,1,NULL,0),(73,1,15,1,1,NULL,0),(74,1,15,1,1,NULL,0),(75,1,15,1,1,NULL,0),(76,1,15,1,1,NULL,0),(77,1,15,1,1,NULL,0),(78,1,15,1,1,NULL,0),(79,1,15,1,1,NULL,0),(80,1,15,1,1,NULL,0),(81,1,15,1,1,NULL,0),(82,1,15,1,1,NULL,0),(83,1,15,1,1,NULL,0),(84,1,15,1,1,NULL,0),(85,1,15,1,1,NULL,0),(86,1,15,1,1,NULL,0),(87,1,15,1,1,NULL,0),(88,1,15,1,1,NULL,0),(89,1,15,1,1,NULL,0),(90,1,15,1,1,NULL,0),(91,1,15,1,1,NULL,0),(92,1,15,1,1,NULL,0),(93,1,15,1,1,NULL,0),(94,1,15,1,1,NULL,0),(95,1,15,1,1,NULL,0),(96,1,15,1,1,NULL,0),(97,1,15,1,1,NULL,0),(98,1,15,1,1,NULL,0),(99,1,15,1,1,NULL,0),(100,1,15,1,1,NULL,0),(101,1,15,1,1,NULL,0),(102,1,15,1,1,NULL,0),(103,1,15,1,1,NULL,0),(104,1,15,1,1,NULL,0),(105,1,15,1,1,NULL,0),(106,1,15,1,1,NULL,0),(107,1,15,1,1,NULL,0),(108,1,15,1,1,NULL,0),(109,1,15,1,1,NULL,0),(110,1,15,1,1,NULL,0),(111,1,15,1,1,NULL,0),(112,1,15,1,1,NULL,0),(113,1,15,1,1,NULL,0),(114,1,15,1,1,NULL,0),(115,1,15,1,1,NULL,0),(116,1,15,1,1,NULL,0),(117,1,15,1,1,NULL,0),(118,1,15,1,1,NULL,0),(119,1,15,1,1,NULL,0),(120,1,15,1,1,NULL,0),(121,1,15,1,1,NULL,0),(122,1,15,1,1,NULL,0),(123,1,15,1,1,NULL,0),(124,1,15,1,1,NULL,0),(125,1,15,1,1,NULL,0),(126,1,15,1,1,NULL,0),(127,1,15,1,1,NULL,0),(128,1,15,1,1,NULL,0),(129,1,15,1,1,NULL,0),(130,1,15,1,1,NULL,0),(131,1,15,1,1,NULL,0),(132,1,15,1,1,NULL,0),(133,1,15,1,1,NULL,0),(134,1,15,1,1,NULL,0),(135,1,15,1,1,NULL,0),(136,1,15,1,1,NULL,0),(137,1,15,1,1,NULL,0),(138,1,15,1,1,NULL,0),(139,1,15,1,1,NULL,0),(140,1,15,1,1,NULL,0),(141,1,15,1,1,NULL,0),(142,1,15,1,1,NULL,0),(143,1,15,1,1,NULL,0),(144,1,15,1,1,NULL,0),(145,1,15,1,1,NULL,0),(146,1,15,1,1,NULL,0),(147,1,15,1,1,NULL,0),(148,1,15,1,1,NULL,0),(149,1,15,1,1,NULL,0),(150,1,15,1,1,NULL,0),(151,1,15,1,1,NULL,0),(152,1,15,1,1,NULL,0),(153,1,15,1,1,NULL,0),(154,1,15,1,1,NULL,0),(155,1,15,1,1,NULL,0),(156,1,15,1,1,NULL,0),(157,1,15,1,1,NULL,0),(158,1,15,1,1,NULL,0),(159,1,15,1,1,NULL,0),(160,1,15,1,1,NULL,0),(161,1,15,1,1,NULL,0),(162,1,15,1,1,NULL,0),(163,1,15,1,1,NULL,0),(164,1,15,1,1,NULL,0),(165,1,15,1,1,NULL,0),(166,1,15,1,1,NULL,0),(167,1,15,1,1,NULL,0),(168,1,15,1,1,NULL,0),(169,1,15,1,1,NULL,0),(170,1,15,1,1,NULL,0),(171,1,15,1,1,NULL,0),(172,1,15,1,1,NULL,0),(173,1,15,1,1,NULL,0),(174,1,15,1,1,NULL,0),(175,1,15,1,1,NULL,0),(176,1,15,1,1,NULL,0),(177,1,15,1,1,NULL,0),(178,1,15,1,1,NULL,0),(179,1,15,1,1,NULL,0),(180,1,15,1,1,NULL,0),(181,1,15,1,1,NULL,0),(182,1,15,1,1,NULL,0),(183,1,15,1,1,NULL,0),(184,1,15,1,1,NULL,0),(185,1,15,1,1,NULL,0),(186,1,15,1,1,NULL,0),(187,1,15,1,1,NULL,0),(188,1,15,1,1,NULL,0),(189,1,15,1,1,NULL,0),(190,1,15,1,1,NULL,0),(191,1,15,1,1,NULL,0),(192,1,15,1,1,NULL,0),(193,1,15,1,1,NULL,0),(194,1,15,1,1,NULL,0),(195,1,15,1,1,NULL,0),(196,1,15,1,1,NULL,0);
/*!40000 ALTER TABLE `student_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_apply`
--

DROP TABLE IF EXISTS `student_course_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_apply` (
  `Student_Course_Apply_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int DEFAULT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  `Status_Id` int DEFAULT NULL,
  `Paid_On` date DEFAULT NULL,
  `Description1` varchar(50) DEFAULT NULL,
  `Description2` varchar(50) DEFAULT NULL,
  `Total_Course` int DEFAULT NULL,
  `Paid_Fees` varchar(45) DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  PRIMARY KEY (`Student_Course_Apply_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_apply`
--

LOCK TABLES `student_course_apply` WRITE;
/*!40000 ALTER TABLE `student_course_apply` DISABLE KEYS */;
INSERT INTO `student_course_apply` VALUES (1,24611,'2021-06-30 00:00:00.000000',1,'2021-06-30',NULL,NULL,1,NULL,NULL),(2,24613,'2021-07-01 00:00:00.000000',1,'2021-07-01',NULL,NULL,1,NULL,NULL),(3,24615,'2021-08-10 11:56:28.000000',1,'2021-08-10',NULL,NULL,1,NULL,45),(4,24615,'2021-08-10 11:57:08.000000',1,'2021-08-10',NULL,NULL,2,NULL,45),(5,1,'2021-09-18 12:28:57.000000',1,'2021-09-18',NULL,NULL,2,NULL,45),(6,1,'2021-10-15 15:34:48.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(7,1,'2021-10-15 15:36:04.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(8,1,'2021-10-15 15:42:42.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(9,1,'2021-10-15 15:43:38.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(10,1,'2021-10-15 16:47:52.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(11,1,'2021-10-15 16:48:53.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(12,1,'2021-10-15 16:50:58.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(13,1,'2021-10-15 16:53:23.000000',1,'2021-10-15',NULL,NULL,1,NULL,45),(14,1,'2021-10-15 16:54:52.000000',1,'2021-10-15',NULL,NULL,2,NULL,45),(15,1,'2021-10-15 16:56:07.000000',1,'2021-10-15',NULL,NULL,2,NULL,45),(16,29,'2021-11-05 17:35:47.000000',1,'2021-11-05',NULL,NULL,2,NULL,45),(17,1,'2021-11-06 17:30:47.000000',1,'2021-11-06',NULL,NULL,2,NULL,45),(18,30,'2021-11-11 12:00:05.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(19,30,'2021-11-11 12:13:43.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(20,30,'2021-11-11 12:14:53.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(21,30,'2021-11-11 12:49:27.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(22,30,'2021-11-11 13:01:10.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(23,30,'2021-11-11 13:04:09.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(24,30,'2021-11-11 13:05:50.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(25,30,'2021-11-11 13:08:41.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(26,30,'2021-11-11 13:10:30.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(27,30,'2021-11-11 13:11:10.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(28,30,'2021-11-11 14:18:49.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(29,30,'2021-11-11 14:23:02.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(30,30,'2021-11-11 16:02:07.000000',1,'2021-11-11',NULL,NULL,2,NULL,45),(31,30,'2021-11-11 16:03:00.000000',1,'2021-11-11',NULL,NULL,1,NULL,45),(32,5,'2021-11-16 11:29:01.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(33,5,'2021-11-16 11:32:50.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(34,5,'2021-11-16 11:35:52.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(35,5,'2021-11-16 11:39:52.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(36,5,'2021-11-16 11:46:42.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(37,33,'2021-11-16 12:06:22.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(38,33,'2021-11-16 12:08:50.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(39,33,'2021-11-16 12:15:40.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(40,6,'2021-11-16 12:20:01.000000',1,'2021-11-16',NULL,NULL,1,NULL,46),(41,34,'2021-11-16 12:50:10.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(42,34,'2021-11-16 12:51:29.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(43,34,'2021-11-16 15:04:03.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(44,34,'2021-11-16 15:22:25.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(45,34,'2021-11-16 15:26:14.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(46,34,'2021-11-16 15:35:15.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(47,34,'2021-11-16 15:37:32.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(48,34,'2021-11-16 15:40:00.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(49,34,'2021-11-16 15:41:40.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(50,34,'2021-11-16 15:43:36.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(51,34,'2021-11-16 15:45:07.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(52,34,'2021-11-16 15:48:07.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(53,34,'2021-11-16 15:51:20.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(54,34,'2021-11-16 16:48:33.000000',1,'2021-11-16',NULL,NULL,1,NULL,45),(55,35,'2021-12-10 22:07:11.000000',1,'2021-12-10',NULL,NULL,1,NULL,45),(56,35,'2021-12-10 22:41:13.000000',1,'2021-12-10',NULL,NULL,1,NULL,45),(57,19,'2022-01-24 10:49:25.000000',1,'2022-01-24',NULL,NULL,1,NULL,45),(58,19,'2022-01-24 10:58:47.000000',1,'2022-01-24',NULL,NULL,1,NULL,45),(59,19,'2022-01-24 14:51:27.000000',1,'2022-01-24',NULL,NULL,1,NULL,45);
/*!40000 ALTER TABLE `student_course_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_selection`
--

DROP TABLE IF EXISTS `student_course_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_selection` (
  `Student_Course_Selection_Id` int NOT NULL AUTO_INCREMENT,
  `Course_Id` int DEFAULT NULL,
  `Fees` bigint DEFAULT NULL,
  `Student_Course_Apply_Id` int DEFAULT NULL,
  `Status_Id` int DEFAULT NULL,
  `Paid_On` date DEFAULT NULL,
  `Description1` varchar(50) DEFAULT NULL,
  `Description2` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_Course_Selection_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_selection`
--

LOCK TABLES `student_course_selection` WRITE;
/*!40000 ALTER TABLE `student_course_selection` DISABLE KEYS */;
INSERT INTO `student_course_selection` VALUES (1,3,NULL,1,NULL,NULL,NULL,NULL),(2,1,NULL,2,NULL,NULL,NULL,NULL),(3,3,NULL,3,NULL,NULL,NULL,NULL),(4,4,NULL,4,NULL,NULL,NULL,NULL),(5,1,NULL,4,NULL,NULL,NULL,NULL),(6,4,NULL,5,NULL,NULL,NULL,NULL),(7,3,NULL,5,NULL,NULL,NULL,NULL),(8,30,NULL,6,NULL,NULL,NULL,NULL),(9,30,NULL,7,NULL,NULL,NULL,NULL),(10,44,NULL,8,NULL,NULL,NULL,NULL),(11,30,NULL,9,NULL,NULL,NULL,NULL),(12,200,NULL,10,NULL,NULL,NULL,NULL),(13,93,NULL,11,NULL,NULL,NULL,NULL),(14,93,NULL,12,NULL,NULL,NULL,NULL),(15,1,NULL,13,NULL,NULL,NULL,NULL),(16,1,NULL,14,NULL,NULL,NULL,NULL),(17,20,NULL,14,NULL,NULL,NULL,NULL),(18,1,NULL,15,NULL,NULL,NULL,NULL),(19,20,NULL,15,NULL,NULL,NULL,NULL),(20,37,NULL,16,NULL,NULL,NULL,NULL),(21,154,NULL,16,NULL,NULL,NULL,NULL),(22,30,NULL,17,NULL,NULL,NULL,NULL),(23,200,NULL,17,NULL,NULL,NULL,NULL),(24,2,NULL,18,NULL,NULL,NULL,NULL),(25,2,NULL,19,NULL,NULL,NULL,NULL),(26,1,NULL,20,NULL,NULL,NULL,NULL),(27,1,NULL,21,NULL,NULL,NULL,NULL),(28,1,NULL,22,NULL,NULL,NULL,NULL),(29,1,NULL,23,NULL,NULL,NULL,NULL),(30,1,NULL,24,NULL,NULL,NULL,NULL),(31,1,NULL,25,NULL,NULL,NULL,NULL),(32,1,NULL,26,NULL,NULL,NULL,NULL),(33,1,NULL,27,NULL,NULL,NULL,NULL),(34,2,NULL,28,NULL,NULL,NULL,NULL),(35,1,NULL,29,NULL,NULL,NULL,NULL),(36,1,NULL,30,NULL,NULL,NULL,NULL),(37,2,NULL,30,NULL,NULL,NULL,NULL),(38,1,NULL,31,NULL,NULL,NULL,NULL),(39,2,NULL,32,NULL,NULL,NULL,NULL),(40,2,NULL,33,NULL,NULL,NULL,NULL),(41,2,NULL,34,NULL,NULL,NULL,NULL),(42,2,NULL,35,NULL,NULL,NULL,NULL),(43,2,NULL,36,NULL,NULL,NULL,NULL),(44,2,NULL,37,NULL,NULL,NULL,NULL),(45,2,NULL,38,NULL,NULL,NULL,NULL),(46,2,NULL,39,NULL,NULL,NULL,NULL),(47,2,NULL,40,NULL,NULL,NULL,NULL),(48,1,NULL,41,NULL,NULL,NULL,NULL),(49,2,NULL,42,NULL,NULL,NULL,NULL),(50,1,NULL,43,NULL,NULL,NULL,NULL),(51,1,NULL,44,NULL,NULL,NULL,NULL),(52,1,NULL,45,NULL,NULL,NULL,NULL),(53,2,NULL,46,NULL,NULL,NULL,NULL),(54,1,NULL,47,NULL,NULL,NULL,NULL),(55,2,NULL,48,NULL,NULL,NULL,NULL),(56,2,NULL,49,NULL,NULL,NULL,NULL),(57,1,NULL,50,NULL,NULL,NULL,NULL),(58,1,NULL,51,NULL,NULL,NULL,NULL),(59,2,NULL,52,NULL,NULL,NULL,NULL),(60,2,NULL,53,NULL,NULL,NULL,NULL),(61,1,NULL,54,NULL,NULL,NULL,NULL),(62,1,NULL,55,NULL,NULL,NULL,NULL),(63,1,NULL,56,NULL,NULL,NULL,NULL),(64,2,NULL,57,NULL,NULL,NULL,NULL),(65,2,NULL,58,NULL,NULL,NULL,NULL),(66,1,NULL,59,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_course_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_document`
--

DROP TABLE IF EXISTS `student_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_document` (
  `Student_Document_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int DEFAULT NULL,
  `Entry_date` date DEFAULT NULL,
  `File_Name` varchar(500) DEFAULT NULL,
  `Document_Id` int DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  `Document_Name` varchar(500) DEFAULT NULL,
  `Document_File_Name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Student_Document_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_document`
--

LOCK TABLES `student_document` WRITE;
/*!40000 ALTER TABLE `student_document` DISABLE KEYS */;
INSERT INTO `student_document` VALUES (1,-2,NULL,'1b469700-00be-11ec-ab63-597a06d11bfb.txt',NULL,0,'','tvmteackedusp.txt'),(2,24345,NULL,'25d1b790-00be-11ec-ab63-597a06d11bfb.txt',NULL,0,'','tvmteackedusp.txt'),(3,24669,NULL,'c2d332d0-00be-11ec-ab63-597a06d11bfb.txt',NULL,0,'','tvmteackedusp.txt'),(4,32,NULL,'d6f99990-06fc-11ec-8edb-0b721c25146e.xlsx',NULL,0,'Experience','Student_Excel_Format (7).xlsx'),(5,1,NULL,'a17cb6f0-2ff9-11ec-97af-3360aef9f394.pdf',NULL,0,'frt','jesna p.pdf'),(19,15,NULL,'9c4bf9e0-832b-11ec-9039-35d1c8d2990d.jpg',NULL,1,'passport','bg15.jpg'),(20,15,NULL,'213b8030-832c-11ec-9039-35d1c8d2990d.jpg',NULL,1,'passport','bg13.jpg'),(21,15,NULL,'aaa65570-832c-11ec-9039-35d1c8d2990d.jpg',NULL,1,'document','bg15.jpg'),(22,15,NULL,'7f0c4e90-832e-11ec-9039-35d1c8d2990d.txt',NULL,1,'document1','document1.txt'),(23,15,NULL,'7f0c75a0-832e-11ec-9039-35d1c8d2990d.txt',NULL,1,'Certificate','Certificate.txt'),(24,15,NULL,'7f0c9cb0-832e-11ec-9039-35d1c8d2990d.txt',NULL,1,'passport','passport.txt');
/*!40000 ALTER TABLE `student_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_followup`
--

DROP TABLE IF EXISTS `student_followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_followup` (
  `Student_FollowUp_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int DEFAULT NULL,
  `Entry_date` datetime(6) DEFAULT NULL,
  `Next_FollowUp_date` datetime(6) DEFAULT NULL,
  `FollowUp_Difference` int DEFAULT NULL,
  `Department` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `User_Id` int DEFAULT NULL,
  `Branch` int DEFAULT NULL,
  `Remark` varchar(4000) DEFAULT NULL,
  `Remark_Id` int DEFAULT NULL,
  `By_User_Id` int DEFAULT NULL,
  `FollowUp_Type` int DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  `FollowUP_Time` datetime(6) DEFAULT NULL,
  `Actual_FollowUp_date` datetime(6) DEFAULT NULL,
  `Entry_Type` int DEFAULT NULL,
  PRIMARY KEY (`Student_FollowUp_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=438404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_followup`
--

LOCK TABLES `student_followup` WRITE;
/*!40000 ALTER TABLE `student_followup` DISABLE KEYS */;
INSERT INTO `student_followup` VALUES (438319,1,'2021-09-18 12:28:21.000000','2021-09-18 00:00:00.000000',0,317,135,77,36,'test',1,45,1,0,'2021-09-18 12:28:21.000000','2021-09-18 12:28:21.000000',1),(438320,2,'2021-09-18 16:42:47.000000','2021-09-18 00:00:00.000000',0,317,135,77,36,'test',1,45,1,1,'2021-09-18 16:42:47.000000','2021-09-18 16:42:47.000000',1),(438321,2,'2021-09-28 18:36:53.000000','2021-09-28 18:36:53.000000',0,317,135,74,36,NULL,1,45,1,1,'2021-09-28 18:36:53.000000','2021-09-28 18:36:53.000000',3),(438322,1,'2021-10-06 18:47:47.000000','2021-09-18 00:00:00.000000',-26,317,135,87,36,NULL,1,45,1,0,'2021-10-06 18:47:47.000000','2021-10-14 18:08:50.000000',3),(438323,2,'2021-10-13 15:14:24.000000','2021-09-28 18:36:53.000000',0,317,135,81,36,NULL,1,45,1,1,'2021-10-13 15:14:24.000000','2021-10-13 15:14:24.000000',3),(438324,3,'2021-10-14 12:29:11.000000','2021-10-14 00:00:00.000000',-1,317,135,87,36,'test',1,45,1,0,'2021-10-14 12:29:11.000000','2021-10-15 14:13:09.000000',1),(438325,4,'2021-10-14 12:29:33.000000','2021-10-14 00:00:00.000000',-1,317,135,81,36,'test',1,45,1,0,'2021-10-14 12:29:33.000000','2021-10-15 14:15:14.000000',1),(438326,1,'2021-10-14 18:08:50.000000','2021-10-14 00:00:00.000000',-1,317,135,87,36,'qweertyuioplkjhgvfdszxcvbnm,.;lkjhbvgcfxdszsertyuiokjbnvcxgygguyuyiuiuiuiuiuoioiuyfdddfgfghghghghhjhjhjjkjuiuiuiuiuiuiuiuiuitftdrdrseewewewertrttytytyuuyiuiuiuiuiu',0,45,1,0,'2021-10-14 18:08:50.000000','2021-10-15 14:13:49.000000',1),(438327,3,'2021-10-15 14:13:09.000000','2021-10-15 00:00:00.000000',0,317,135,87,36,' CLOSESAVEDELETEHISTORYREGISTER CANDIDATESEND WELCOME MAIL CLOSESAVEDELETEHISTORYREGISTER',0,45,1,0,'2021-10-15 14:13:09.000000','2021-10-15 14:14:22.000000',1),(438328,1,'2021-10-15 14:13:49.000000','2021-10-15 00:00:00.000000',-17,317,135,87,36,'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',0,45,1,0,'2021-10-15 14:13:49.000000','2021-11-01 13:11:33.000000',1),(438329,3,'2021-10-15 14:14:22.000000','2021-10-15 00:00:00.000000',0,317,135,87,36,'testtesttesttesttesttestclosestesttesttesttesttesttestclosestesttesttesttesttesttestclosestesttesttesttesttesttestclosestesttesttesttesttesttestcloses',0,45,1,0,'2021-10-15 14:14:22.000000','2021-10-15 14:16:54.000000',1),(438330,4,'2021-10-15 14:15:14.000000','2021-10-15 00:00:00.000000',-17,317,135,81,36,'AAASDSADSFSFFSFSFSDFSDAAASDSADSFSFFSFSFSDFSDAAASDSADSFSFFSFSFSDFSD AAASDSADSFSFFSFSFSDFSDAAASDSADSFSFFSFSFSDFSDAAASDSADSFSFFSFSFSDFSD AAASDSADSFSFFSFSFSDFSD',0,45,1,0,'2021-10-15 14:15:14.000000','2021-11-01 13:11:25.000000',1),(438331,3,'2021-10-15 14:16:54.000000','2021-10-15 00:00:00.000000',-5,317,135,87,36,'asddadasasddasddadasasddadasasddadasadasasddadasasddadasasddadasasddadasasddadasasddadasasddadasasddadas',0,45,1,0,'2021-10-15 14:16:54.000000','2021-10-20 15:02:56.000000',1),(438332,3,'2021-10-20 15:02:56.000000','2021-10-20 00:00:00.000000',-12,317,135,87,36,'qwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrt  qwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrt qwewrerewtrtqwewrerewtrtqwewrerewtrt qwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrt  qwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrtqwewrerewtrt qwewrerewtrtqwewrerewtrtqwewrerewtrt  ',0,45,1,0,'2021-10-20 15:02:56.000000','2021-11-01 13:11:40.000000',1),(438333,5,'2021-10-26 18:23:43.000000','2021-10-26 00:00:00.000000',-6,318,139,74,36,'test',1,46,1,0,'2021-10-26 18:23:43.000000','2021-11-01 13:11:52.000000',1),(438334,6,'2021-10-26 18:38:06.000000','2021-10-26 00:00:00.000000',-6,318,139,46,36,'test',1,46,1,0,'2021-10-26 18:38:06.000000','2021-11-01 13:11:47.000000',1),(438335,7,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',-4,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-05 12:06:49.000000',NULL),(438336,8,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',-4,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-05 12:06:56.000000',NULL),(438337,9,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',-4,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-05 12:07:03.000000',NULL),(438338,10,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',-4,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-05 12:07:11.000000',NULL),(438339,11,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438340,12,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,1,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438341,13,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,1,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438342,14,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,1,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438343,15,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438344,16,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438345,17,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438346,18,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438347,19,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438348,20,'2021-11-01 12:58:06.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 12:58:06.000000','2021-11-01 12:58:06.000000',NULL),(438349,4,'2021-11-01 13:11:25.000000','2021-11-01 00:00:00.000000',-4,317,135,81,36,'test',1,45,1,0,'2021-11-01 13:11:25.000000','2021-11-05 12:06:10.000000',1),(438350,1,'2021-11-01 13:11:33.000000','2021-11-01 00:00:00.000000',-4,317,135,87,36,'test',1,45,1,0,'2021-11-01 13:11:33.000000','2021-11-05 12:04:00.000000',1),(438351,3,'2021-11-01 13:11:40.000000','2021-11-01 00:00:00.000000',-4,317,135,87,36,'test',1,45,1,0,'2021-11-01 13:11:40.000000','2021-11-05 12:04:24.000000',1),(438352,6,'2021-11-01 13:11:47.000000','2021-11-01 00:00:00.000000',-4,318,139,46,36,'test',1,45,1,0,'2021-11-01 13:11:47.000000','2021-11-05 12:06:41.000000',1),(438353,5,'2021-11-01 13:11:52.000000','2021-11-01 00:00:00.000000',-4,318,139,74,36,'test',1,45,1,0,'2021-11-01 13:11:52.000000','2021-11-05 12:06:21.000000',1),(438354,21,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',-4,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-05 12:05:24.000000',NULL),(438355,22,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438356,23,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438357,24,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438358,25,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438359,26,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438360,27,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438361,28,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438362,29,'2021-11-01 16:40:18.000000','2021-11-01 00:00:00.000000',0,318,139,45,36,'0',0,45,1,0,'2021-11-01 16:40:18.000000','2021-11-01 16:40:18.000000',NULL),(438363,1,'2021-11-05 12:04:00.000000','2021-11-05 00:00:00.000000',0,317,135,87,36,'test',1,45,1,0,'2021-11-05 12:04:00.000000','2021-11-05 12:04:00.000000',1),(438364,3,'2021-11-05 12:04:24.000000','2021-11-06 00:00:00.000000',0,317,135,87,36,'test',1,45,1,0,'2021-11-05 12:04:24.000000','2021-11-05 12:04:24.000000',1),(438365,21,'2021-11-05 12:05:24.000000','2021-11-04 00:00:00.000000',-1,318,139,45,36,'test',1,45,1,0,'2021-11-05 12:05:24.000000','2021-11-05 12:10:58.000000',1),(438366,4,'2021-11-05 12:06:10.000000','2021-11-06 00:00:00.000000',0,317,135,81,36,'test',1,45,1,0,'2021-11-05 12:06:10.000000','2021-11-05 12:06:10.000000',1),(438367,5,'2021-11-05 12:06:21.000000','2021-11-06 00:00:00.000000',0,318,139,74,36,'test',1,45,1,0,'2021-11-05 12:06:21.000000','2021-11-05 12:06:21.000000',1),(438368,6,'2021-11-05 12:06:41.000000','2021-11-06 00:00:00.000000',0,318,139,46,36,'test',1,45,1,0,'2021-11-05 12:06:41.000000','2021-11-05 12:06:41.000000',1),(438369,7,'2021-11-05 12:06:49.000000','2021-11-06 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-05 12:06:49.000000','2021-11-05 12:06:49.000000',1),(438370,8,'2021-11-05 12:06:56.000000','2021-11-07 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-05 12:06:56.000000','2021-11-05 12:06:56.000000',1),(438371,9,'2021-11-05 12:07:03.000000','2021-11-06 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-05 12:07:03.000000','2021-11-05 12:07:03.000000',1),(438372,10,'2021-11-05 12:07:11.000000','2021-11-06 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-05 12:07:11.000000','2021-11-05 12:07:11.000000',1),(438373,21,'2021-11-05 12:10:58.000000','2021-11-13 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-05 12:10:58.000000','2021-11-05 12:10:58.000000',1),(438374,30,'2021-11-11 11:58:13.000000','2021-11-11 00:00:00.000000',0,318,139,45,36,'R2',0,45,1,0,'2021-11-11 11:58:13.000000','2021-11-11 11:58:13.000000',1),(438375,31,'2021-11-11 17:07:59.000000','2021-11-11 00:00:00.000000',0,318,139,46,36,'r3',0,46,1,0,'2021-11-11 17:07:59.000000','2021-11-11 17:07:59.000000',1),(438376,32,'2021-11-12 11:29:28.000000','2021-11-12 00:00:00.000000',0,318,139,46,36,'45',0,46,1,0,'2021-11-12 11:29:28.000000','2021-11-12 11:29:28.000000',1),(438377,33,'2021-11-16 11:27:04.000000','2021-11-16 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-16 11:27:04.000000','2021-11-16 11:27:04.000000',1),(438378,34,'2021-11-16 12:49:00.000000','2021-11-16 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-11-16 12:49:00.000000','2021-11-16 12:49:00.000000',1),(438379,35,'2021-12-10 18:23:44.000000','2021-12-10 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2021-12-10 18:23:44.000000','2021-12-10 18:23:44.000000',1),(438380,6,'2022-01-11 17:03:14.000000','2022-01-11 00:00:00.000000',0,318,139,45,36,'wew3etr',0,45,1,0,'2022-01-11 17:03:14.000000','2022-01-11 17:03:14.000000',1),(438381,7,'2022-01-11 17:08:42.000000','2022-01-11 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-11 17:08:42.000000','2022-01-11 17:08:42.000000',1),(438382,8,'2022-01-11 17:30:32.000000','2022-01-11 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-11 17:30:32.000000','2022-01-11 17:30:32.000000',1),(438383,9,'2022-01-12 10:24:37.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'WETSWT',0,45,1,0,'2022-01-12 10:24:37.000000','2022-01-12 10:24:37.000000',1),(438384,10,'2022-01-12 14:33:23.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-12 14:33:23.000000','2022-01-12 14:33:23.000000',1),(438385,11,'2022-01-12 14:37:37.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-12 14:37:37.000000','2022-01-12 14:37:37.000000',1),(438386,12,'2022-01-12 14:39:07.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'test',1,45,1,1,'2022-01-12 14:39:07.000000','2022-01-12 14:39:07.000000',1),(438387,13,'2022-01-12 14:41:25.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'test',1,45,1,1,'2022-01-12 14:41:25.000000','2022-01-12 14:41:25.000000',1),(438388,14,'2022-01-12 14:42:28.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'test',1,45,1,1,'2022-01-12 14:42:28.000000','2022-01-12 14:42:28.000000',1),(438389,15,'2022-01-12 17:45:17.000000','2022-01-12 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-12 17:45:17.000000','2022-01-12 17:45:17.000000',1),(438390,16,'2022-01-15 14:27:11.000000','2022-01-15 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-15 14:27:11.000000','2022-01-15 14:27:11.000000',1),(438391,17,'2022-01-15 17:27:54.000000','2022-01-15 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-15 17:27:54.000000','2022-01-15 17:27:54.000000',1),(438392,18,'2022-01-17 10:52:18.000000','2022-01-17 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-17 10:52:18.000000','2022-01-17 10:52:18.000000',1),(438393,19,'2022-01-24 10:43:35.000000','2022-01-24 00:00:00.000000',0,318,139,45,36,'test',1,45,1,0,'2022-01-24 10:43:35.000000','2022-01-24 10:43:35.000000',1),(438394,NULL,'2022-01-24 11:18:35.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:18:35.000000','2022-01-24 11:18:35.000000',3),(438395,NULL,'2022-01-24 11:18:40.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:18:40.000000','2022-01-24 11:18:40.000000',3),(438396,NULL,'2022-01-24 11:20:11.000000',NULL,0,NULL,NULL,74,36,NULL,NULL,45,1,0,'2022-01-24 11:20:11.000000','2022-01-24 11:20:11.000000',3),(438397,NULL,'2022-01-24 11:23:51.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:23:51.000000','2022-01-24 11:23:51.000000',3),(438398,NULL,'2022-01-24 11:35:10.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:35:10.000000','2022-01-24 11:35:10.000000',3),(438399,NULL,'2022-01-24 11:38:25.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:38:25.000000','2022-01-24 11:38:25.000000',3),(438400,NULL,'2022-01-24 11:38:38.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:38:38.000000','2022-01-24 11:38:38.000000',3),(438401,1,'2022-01-24 11:39:54.000000',NULL,0,NULL,NULL,81,36,NULL,NULL,45,1,0,'2022-01-24 11:39:54.000000','2022-01-24 11:39:54.000000',3),(438402,20,'2022-01-24 13:09:18.000000','2022-01-24 00:00:00.000000',0,318,139,81,36,'test',1,45,1,0,'2022-01-24 13:09:18.000000','2022-01-24 13:09:18.000000',1),(438403,21,'2022-01-28 14:31:03.000000','2022-01-28 00:00:00.000000',0,318,139,81,36,'test',1,45,1,0,'2022-01-28 14:31:03.000000','2022-01-28 14:31:03.000000',1);
/*!40000 ALTER TABLE `student_followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_message`
--

DROP TABLE IF EXISTS `student_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_message` (
  `Student_Message_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Id` int DEFAULT NULL,
  `Message_Detail` varchar(2000) DEFAULT NULL,
  `Entry_date` date DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Student_Message_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_message`
--

LOCK TABLES `student_message` WRITE;
/*!40000 ALTER TABLE `student_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_status`
--

DROP TABLE IF EXISTS `student_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_status` (
  `Student_Status_Id` int NOT NULL AUTO_INCREMENT,
  `Student_Status_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`Student_Status_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_status`
--

LOCK TABLES `student_status` WRITE;
/*!40000 ALTER TABLE `student_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_section`
--

DROP TABLE IF EXISTS `sub_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_section` (
  `Sub_Section_Id` int NOT NULL AUTO_INCREMENT,
  `Sub_Section_Name` varchar(500) DEFAULT NULL,
  `Selection` tinyint DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Sub_Section_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_section`
--

LOCK TABLES `sub_section` WRITE;
/*!40000 ALTER TABLE `sub_section` DISABLE KEYS */;
INSERT INTO `sub_section` VALUES (1,'Nanotechnology',1,0),(2,'Finance, Accounts, Economics',1,0);
/*!40000 ALTER TABLE `sub_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `Subject_Id` int NOT NULL,
  `Subject_Name` varchar(150) DEFAULT NULL,
  `Selection` tinyint DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Subject_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Life Science, Science',1,0),(2,'Commerce, Business and Administration',1,0);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temptable`
--

DROP TABLE IF EXISTS `temptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temptable` (
  `tempid` int NOT NULL AUTO_INCREMENT,
  `tempdata` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tempid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temptable`
--

LOCK TABLES `temptable` WRITE;
/*!40000 ALTER TABLE `temptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `temptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_history` (
  `Transaction_Id` int NOT NULL AUTO_INCREMENT,
  `Entry_date` datetime DEFAULT NULL,
  `User_Id` int DEFAULT NULL,
  `Student_Id` int DEFAULT NULL,
  `Description1` varchar(1000) DEFAULT NULL,
  `Description2` varchar(1000) DEFAULT NULL,
  `Description3` varchar(1000) DEFAULT NULL,
  `Transaction_type` int DEFAULT NULL,
  PRIMARY KEY (`Transaction_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_history`
--

LOCK TABLES `transaction_history` WRITE;
/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
INSERT INTO `transaction_history` VALUES (19,'2021-08-10 00:00:00',45,24276,'Exam fees paid','Exam fees paid','Exam fees paid',0),(20,'2021-08-10 00:00:00',45,24615,'Paid','Paid','Paid',0),(21,'2021-08-10 17:08:30',45,24643,'','','',1),(22,'2021-08-11 00:00:00',45,24643,'Paid','Paid','Paid',0),(23,'2021-09-18 12:28:33',45,1,'','','',1),(24,'2021-09-18 00:00:00',45,2,'Register','Register','Register',0),(25,'2021-09-18 00:00:00',45,2,'','','',0),(26,'2021-10-14 00:00:00',45,1,'12','12','12',0),(27,'2021-10-15 00:00:00',45,1,'Amount paid ','Amount paid ','Amount paid ',0),(28,'2021-10-15 00:00:00',45,1,'Description','Description','Description',0),(29,'2021-11-16 11:32:11',45,5,'','','',1),(30,'2021-11-16 12:03:59',45,33,'','','',1),(31,'2021-11-16 12:04:36',45,33,'','','',1),(32,'2021-11-16 12:05:21',45,33,'','','',1),(33,'2021-11-16 12:49:57',45,34,'','','',1),(34,'2021-12-10 00:00:00',45,35,'234','234','234',0),(35,'2021-12-10 22:23:11',45,35,'','','',1),(36,'2021-12-10 00:00:00',45,35,'yuyu','yuyu','yuyu',0),(37,'2022-01-18 00:00:00',45,8,'test','test','test',0),(38,'2022-01-19 00:00:00',45,8,'test','test','test',0),(39,'2022-01-24 10:49:12',45,19,'','','',1),(40,'2022-01-24 10:49:15',45,19,'','','',1),(41,'2022-01-24 00:00:00',45,19,'12','12','12',0),(42,'2022-01-24 11:00:45',45,19,'','','',1),(43,'2022-02-01 00:00:00',45,15,'test','test','test',0);
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_type` (
  `Transaction_TypeId` int NOT NULL,
  `Type_Name` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`Transaction_TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'welcome mail',0);
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `University_Id` bigint NOT NULL,
  `University_Name` varchar(150) DEFAULT NULL,
  `About` varchar(500) DEFAULT NULL,
  `About1` varchar(500) DEFAULT NULL,
  `About2` varchar(500) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Founded_In` varchar(50) DEFAULT NULL,
  `Institution_Type` varchar(50) DEFAULT NULL,
  `Cost_Of_Living` varchar(50) DEFAULT NULL,
  `Tution_Fee` varchar(50) DEFAULT NULL,
  `Application_Fee` varchar(50) DEFAULT NULL,
  `Type_Of_Accomodation` varchar(50) DEFAULT NULL,
  `Contact_Number` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Web` varchar(500) DEFAULT NULL,
  `Fb` varchar(500) DEFAULT NULL,
  `Linkedin` varchar(500) DEFAULT NULL,
  `Twitter` varchar(500) DEFAULT NULL,
  `Googlemap` varchar(500) DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `Country_Id` int DEFAULT NULL,
  `Sub_Heading1` varchar(500) DEFAULT NULL,
  `Sub_Heading2` varchar(500) DEFAULT NULL,
  `Sub_Heading3` varchar(500) DEFAULT NULL,
  `School_Rank` varchar(50) DEFAULT NULL,
  `Video_Link` varchar(500) DEFAULT NULL,
  `Sub_Heading_Colored` varchar(500) DEFAULT NULL,
  `Banner_Image` varchar(500) DEFAULT NULL,
  `Level_Detail_Id` int DEFAULT NULL,
  `DeleteStatus` tinyint DEFAULT NULL,
  PRIMARY KEY (`University_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (1,'University of Central Lancashire',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(2,'University of East London',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),(3,'Birmingham City University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(4,'Wrexham Glyndwr University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(5,'Coventry University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(6,'University of West London',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(7,'Middlesex University London',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(8,'Enugu State University of Science and Technology',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(9,'University of Salford',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(10,'University of Bedfordshire',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL),(11,'Ulster University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'De Montfort University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'University of Exeter',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'University of Portsmouth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'University of Brighton',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'Ludwig Maximilian University of Munich',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'University of the West of Scotland',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'Anglia Ruskin University Cambridge Campus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Hertfordshire University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'University of Northampton',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'University of Roehampton London',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'(NAVITAS) Hertfordshire International College',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'University of Greenwich',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'University of Bristol',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'University of Chester',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'Cardiff University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'Staffordshire University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'CARDIFF METROPOLITAN University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'University of Portsmouth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'Manchester Metropolitan University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'University of Greenwich',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'University of Dundee',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'Nottingham Trent University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'University of Sunderland',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'Carnegie Mellon University',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'University of South Wales',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'University of Plymouth',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'University of Bedfordshire',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_photos`
--

DROP TABLE IF EXISTS `university_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university_photos` (
  `University_Photos_Id` int NOT NULL AUTO_INCREMENT,
  `University_Id` int DEFAULT NULL,
  `University_Image` varchar(45) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`University_Photos_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_photos`
--

LOCK TABLES `university_photos` WRITE;
/*!40000 ALTER TABLE `university_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `university_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_department`
--

DROP TABLE IF EXISTS `user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_department` (
  `User_Department_Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int DEFAULT NULL,
  `Department_Id` int DEFAULT NULL,
  `Branch_Id` int DEFAULT NULL,
  `View_Entry` tinyint unsigned DEFAULT NULL,
  `VIew_All` tinyint unsigned DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`User_Department_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_department`
--

LOCK TABLES `user_department` WRITE;
/*!40000 ALTER TABLE `user_department` DISABLE KEYS */;
INSERT INTO `user_department` VALUES (85,59,322,36,0,0,0),(86,59,317,36,0,0,0),(87,59,318,36,1,0,0),(88,59,300,36,1,0,0),(89,59,323,36,1,0,0),(90,59,318,38,0,0,0),(91,59,322,38,0,0,0),(92,59,323,38,0,0,0),(93,59,300,38,0,0,0),(94,59,317,38,0,0,0),(95,59,323,41,0,0,0),(96,59,317,41,0,0,0),(97,59,300,41,0,0,0),(98,59,322,41,0,0,0),(99,59,318,41,0,0,0),(100,60,322,36,1,1,0),(101,60,317,36,1,1,0),(102,60,318,36,1,1,0),(103,60,300,36,1,1,0),(104,60,323,36,1,1,0),(105,60,318,38,0,0,0),(106,60,322,38,0,0,0),(107,60,323,38,0,0,0),(108,60,300,38,0,0,0),(109,60,317,38,0,0,0),(110,60,323,41,0,0,0),(111,60,317,41,0,0,0),(112,60,300,41,0,0,0),(113,57,300,34,0,0,0),(114,57,322,34,0,0,0),(115,57,323,34,0,0,0),(116,57,318,34,0,0,0),(117,57,317,23,0,0,0),(118,57,300,23,0,0,0),(119,57,318,23,0,0,0),(120,57,323,23,0,0,0),(121,57,322,23,0,0,0),(122,57,317,29,0,0,0),(123,57,318,29,1,0,0),(124,57,322,29,0,0,0),(125,57,300,29,0,0,0),(126,57,323,29,0,0,0),(127,57,318,35,0,0,0),(128,57,317,35,0,0,0),(129,57,322,20,0,0,0),(130,57,318,20,0,0,0),(131,57,323,20,0,0,0),(132,57,300,20,0,0,0),(133,57,317,20,0,0,0),(134,57,322,32,0,0,0),(135,57,323,32,0,0,0),(136,57,318,32,0,0,0),(137,57,300,32,0,0,0),(138,57,317,32,0,0,0),(139,57,318,21,0,0,0),(140,57,322,21,0,0,0),(141,57,317,21,0,0,0),(142,57,300,21,0,0,0),(143,57,323,21,0,0,0),(144,57,317,31,0,0,0),(145,57,322,31,0,0,0),(146,57,323,31,0,0,0),(147,57,318,31,0,0,0),(148,57,300,31,0,0,0),(149,57,318,33,0,0,0),(150,57,323,33,0,0,0),(151,57,317,33,0,0,0),(152,57,300,33,0,0,0),(153,57,322,33,0,0,0),(154,57,318,30,0,0,0),(155,57,322,30,0,0,0),(156,57,317,30,0,0,0),(157,57,323,30,0,0,0),(158,57,300,30,0,0,0),(165,60,322,41,0,0,0),(166,60,318,41,0,0,0),(174,57,317,34,0,0,0),(181,62,322,36,0,0,0),(182,62,317,36,0,0,0),(183,62,318,36,0,0,0),(184,62,300,36,0,0,0),(185,62,323,36,0,0,0),(186,62,318,38,0,0,0),(187,62,322,38,0,0,0),(188,62,323,38,0,0,0),(189,62,300,38,0,0,0),(190,62,317,38,0,0,0),(191,62,323,41,0,0,0),(192,62,317,41,1,0,0),(193,62,300,41,1,0,0),(194,62,322,41,0,0,0),(195,62,318,41,0,0,0),(214,61,322,36,0,0,0),(221,61,317,36,0,0,0),(222,61,318,36,0,0,0),(223,61,300,36,0,0,0),(224,61,323,36,0,0,0),(225,61,318,38,1,1,0),(226,61,322,38,1,1,0),(227,61,323,38,1,1,0),(228,61,300,38,1,1,0),(229,61,317,38,1,1,0),(230,61,323,41,0,0,0),(231,61,317,41,0,1,0),(232,61,300,41,0,0,0),(233,61,322,41,0,0,0),(234,61,318,41,0,0,0),(235,63,322,36,1,1,0),(236,63,317,36,1,1,0),(237,63,318,36,1,1,0),(238,63,300,36,0,0,0),(239,63,323,36,0,0,0),(240,63,318,38,0,0,0),(241,63,322,38,0,0,0),(242,63,323,38,0,0,0),(243,63,300,38,0,0,0),(244,63,317,38,0,0,0),(245,63,323,41,0,0,0),(246,63,317,41,0,0,0),(247,63,300,41,0,0,0),(248,63,322,41,0,0,0),(249,63,318,41,0,0,0),(265,64,322,36,1,1,0),(266,64,317,36,1,1,0),(267,64,318,36,1,1,0),(268,64,300,36,0,1,0),(269,64,323,36,0,0,0),(270,64,318,38,0,0,0),(271,64,322,38,0,0,0),(272,64,323,38,0,0,0),(273,64,300,38,0,0,0),(274,64,317,38,0,0,0),(275,64,323,41,0,0,0),(276,64,317,41,0,0,0),(277,64,300,41,0,0,0),(278,64,322,41,0,0,0),(279,64,318,41,0,0,0),(295,83,318,36,1,1,0),(296,83,317,36,1,1,0),(297,83,324,36,1,1,0),(298,83,323,36,1,1,0),(299,83,300,36,1,1,0),(300,83,322,36,1,1,0),(301,84,318,36,1,1,0),(302,84,317,36,1,1,0),(303,84,324,36,1,1,0),(304,84,323,36,1,1,0),(305,84,300,36,1,1,0),(306,84,322,36,1,1,0),(325,51,318,36,1,0,0),(326,51,317,36,1,0,0),(327,51,324,36,1,0,0),(328,51,323,36,1,0,0),(329,51,300,36,1,0,0),(330,51,322,36,1,0,0),(337,75,318,36,1,0,0),(338,75,317,36,1,0,0),(339,75,324,36,1,0,0),(340,75,323,36,1,0,0),(341,75,300,36,1,0,0),(342,75,322,36,1,0,0),(343,76,318,36,1,0,0),(344,76,317,36,1,0,0),(345,76,324,36,1,0,0),(346,76,323,36,1,0,0),(347,76,300,36,1,0,0),(348,76,322,36,1,0,0),(349,77,318,36,1,0,0),(350,77,317,36,1,0,0),(351,77,324,36,1,0,0),(352,77,323,36,1,0,0),(353,77,300,36,1,0,0),(354,77,322,36,1,0,0),(355,78,318,36,1,0,0),(356,78,317,36,1,0,0),(357,78,324,36,1,0,0),(358,78,323,36,1,0,0),(359,78,300,36,1,0,0),(360,78,322,36,1,0,0),(367,80,318,36,1,0,0),(368,80,317,36,1,0,0),(369,80,324,36,1,0,0),(370,80,323,36,1,0,0),(371,80,300,36,1,0,0),(372,80,322,36,1,0,0),(373,81,318,36,1,0,0),(374,81,317,36,1,0,0),(375,81,324,36,1,0,0),(376,81,323,36,1,0,0),(377,81,300,36,1,0,0),(378,81,322,36,1,0,0),(379,82,318,36,1,0,0),(380,82,317,36,1,0,0),(381,82,324,36,1,0,0),(382,82,323,36,1,0,0),(383,82,300,36,1,0,0),(384,82,322,36,1,0,0),(385,85,318,36,1,0,0),(386,85,317,36,1,0,0),(387,85,324,36,1,0,0),(388,85,323,36,1,0,0),(389,85,300,36,1,0,0),(390,85,322,36,1,0,0),(421,74,318,36,1,0,0),(422,74,317,36,1,0,0),(423,74,324,36,1,0,0),(424,74,323,36,1,0,0),(425,74,300,36,1,0,0),(426,74,322,36,1,0,0),(469,50,318,36,1,0,0),(470,50,317,36,1,0,0),(471,50,324,36,1,1,0),(472,50,323,36,1,1,0),(473,50,300,36,1,1,0),(474,50,322,36,1,1,0),(481,86,318,36,1,0,0),(482,86,317,36,1,0,0),(483,86,324,36,1,0,0),(484,86,323,36,1,0,0),(485,86,300,36,1,0,0),(486,86,322,36,1,0,0),(487,87,318,36,1,0,0),(488,87,317,36,1,0,0),(489,87,324,36,1,0,0),(490,87,323,36,1,0,0),(491,87,300,36,1,0,0),(492,87,322,36,1,0,0),(493,88,318,36,1,0,0),(494,88,317,36,1,0,0),(495,88,324,36,1,1,0),(496,88,323,36,1,1,0),(497,88,300,36,1,1,0),(498,88,322,36,1,1,0),(499,89,318,36,1,0,0),(500,89,317,36,1,0,0),(501,89,324,36,1,0,0),(502,89,323,36,1,0,0),(503,89,300,36,1,0,0),(504,89,322,36,1,0,0),(505,90,318,36,1,0,0),(506,90,317,36,1,0,0),(507,90,324,36,1,0,0),(508,90,323,36,1,0,0),(509,90,300,36,1,0,0),(510,90,322,36,1,0,0),(511,91,318,36,1,0,1),(512,91,317,36,1,0,1),(513,91,324,36,1,1,1),(514,91,323,36,1,1,1),(515,91,300,36,1,1,1),(516,91,322,36,1,1,1),(517,92,318,36,1,0,0),(518,93,318,36,1,0,0),(519,94,318,36,1,0,0),(520,95,318,36,1,0,0),(521,96,318,36,1,0,0),(522,97,318,36,1,1,0),(523,97,317,36,1,1,0),(524,97,324,36,1,1,0),(525,97,323,36,1,1,0),(526,97,300,36,1,1,0),(527,97,322,36,1,1,0),(571,46,318,36,1,1,0),(572,46,317,36,1,1,0),(573,46,324,36,1,1,0),(574,46,323,36,1,1,0),(575,46,300,36,1,1,0),(576,46,322,36,1,1,0),(577,79,317,36,1,0,0),(578,79,324,36,1,0,0),(579,79,323,36,1,0,0),(580,79,300,36,1,0,0),(713,98,318,36,1,1,0),(714,98,317,36,1,1,0),(715,98,324,36,1,1,0),(716,98,323,36,1,1,0),(717,98,300,36,1,1,0),(718,98,322,36,1,1,0),(719,99,318,36,1,0,0),(720,99,317,36,1,0,0),(721,99,324,36,1,1,0),(722,99,323,36,1,1,0),(723,99,300,36,1,1,0),(724,99,322,36,1,1,0),(725,100,318,36,1,0,0),(726,100,317,36,1,0,0),(727,100,324,36,1,1,0),(728,100,323,36,1,1,0),(729,100,300,36,1,1,0),(730,100,322,36,1,1,0),(731,101,318,36,1,1,0),(732,101,317,36,1,1,0),(733,101,324,36,1,1,0),(734,101,323,36,1,1,0),(735,101,300,36,1,1,0),(736,101,322,36,1,1,0),(737,102,318,36,1,0,0),(738,102,317,36,1,0,0),(739,102,324,36,1,1,0),(740,102,323,36,1,1,0),(741,102,300,36,1,1,0),(742,102,322,36,1,1,0),(761,45,318,36,1,1,0),(762,45,317,36,1,1,0),(763,45,324,36,1,1,0),(764,45,323,36,1,1,0),(765,45,300,36,1,1,0),(766,45,322,36,1,1,0);
/*!40000 ALTER TABLE `user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `User_Details_Id` bigint NOT NULL AUTO_INCREMENT,
  `User_Details_Name` varchar(250) DEFAULT NULL,
  `Password` varchar(250) DEFAULT NULL,
  `Working_Status` varchar(250) DEFAULT NULL,
  `User_Type` int DEFAULT NULL,
  `Role_Id` bigint DEFAULT NULL,
  `Branch_Id` int DEFAULT NULL,
  `Address1` varchar(250) DEFAULT NULL,
  `Address2` varchar(250) DEFAULT NULL,
  `Address3` varchar(250) DEFAULT NULL,
  `Address4` varchar(250) DEFAULT NULL,
  `Pincode` varchar(200) DEFAULT NULL,
  `Mobile` varchar(250) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `Employee_Id` int DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  `Registration_Target` int DEFAULT NULL,
  `FollowUp_Target` varchar(250) DEFAULT NULL,
  `User_Typename` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`User_Details_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (45,'Admin','Admin','1',1,30,36,'Managing Director','','','','','8877996655','hr@ufstechnologies.com',0,0,NULL,'','Admin'),(46,'Jaisy','jaisy@123','1',2,31,36,'','','','','','8976094561','docs@edabroad.in',0,0,NULL,NULL,'User'),(50,'Soja Thomas','soja@5696','1',2,31,36,'','','','','','7994305550','docs@edabroad.in',0,0,NULL,NULL,'User'),(51,'Nimmy josephine','nimmy@1244','1',2,31,36,'','','','','','7994303330','docs@edabroad.in',0,0,NULL,NULL,'User'),(59,'Mitha','123456','1',1,31,38,'','','','','','','',0,0,0,'0','Admin'),(60,'Jacob Thomas','123456','1',2,31,38,'','','','','','','',0,0,0,'0','User'),(61,'Nivin Francis','123456','1',1,31,38,'','','','','','','',0,0,0,'0','Admin'),(62,'Dipa P','123456','1',2,31,38,'','','','','','','',0,0,0,'0','User'),(63,'Vyshak P','123456','1',1,31,41,'','','','','','','',0,0,0,'0','Admin'),(64,'Vismaya Nair','123456','1',2,31,41,'','','','','','','',0,0,0,'0','User'),(74,'Ann Ponse','ann@983789','1',2,31,36,'Senior Counsellor','','','','','7994302220','jesna@ufstechnologies.com',0,0,NULL,NULL,'User'),(75,'Laya','laya@123','1',2,31,36,'','','','','','04844860470','docs@edabroad.in',0,0,NULL,NULL,'User'),(76,'Jugnu','jugnu123','1',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(77,'Counsellor','edabroad12','1',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(78,'Celin Gregory','celin123','1',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(79,'Princy','Princy123','1',2,31,36,'','','','','','8767839087','',0,0,NULL,NULL,'User'),(80,'Shaziya','shaziya123','1',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(81,'Amalu','amalu@123','1',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(82,'Rochelle Jose','rochelle98@1','2',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(83,'Documentation','pappikutty','1',1,30,36,'','','','','','','',0,0,NULL,NULL,'Admin'),(84,'Followup','pappikutty','1',1,30,36,'','','','','','','',0,0,NULL,NULL,'Admin'),(85,'Rehna','Rehna@123','1',2,31,36,'','','','','','','',0,0,NULL,NULL,'User'),(86,'Abhijith','abh','1',2,31,36,'','','','','','','',0,0,NULL,NULL,NULL),(87,'Jaisy','jaisy@123','1',2,31,36,'','','','','','','docs@edabroad.in',0,0,NULL,NULL,NULL),(88,'Soja Thomas','soja@5696','1',2,31,36,'','','','','','7994305550','docs@edabroad.in',0,0,NULL,NULL,NULL),(89,'Abhijith','abh','1',2,31,36,'','','','','','','',0,0,NULL,NULL,NULL),(90,'Sreelakshmi','laya@123','1',2,31,36,'','','','','','04844860470','docs@edabroad.in',0,0,NULL,NULL,NULL),(91,'Sresha','soja@5696','1',2,31,36,'','','','','','7994305550','docs@edabroad.in',0,1,NULL,NULL,NULL),(92,'1','12','0',1,0,0,'','','','','','','',0,0,NULL,NULL,NULL),(93,'1','1','0',1,0,0,'','','','','','','',0,0,NULL,NULL,NULL),(94,'1','1','0',1,0,0,'','','','','','','',0,0,NULL,NULL,NULL),(95,'1','1','0',1,0,0,'','','','','','','',0,0,NULL,NULL,NULL),(96,'1','1','1',1,31,38,'','','','','','','',0,0,NULL,NULL,NULL),(97,'admi','admi','1',1,30,36,'Managing Director','','','','','9633500085','jesna@ufstechnologies.com',0,0,NULL,NULL,NULL),(98,NULL,NULL,'1',2,31,36,'','','','','','8976094561','docs@edabroad.in',0,0,NULL,NULL,NULL),(99,NULL,NULL,'1',2,31,36,'','','','','','7994305550','docs@edabroad.in',0,0,NULL,NULL,NULL),(100,NULL,NULL,'1',2,31,36,'','','','','','7994305550','docs@edabroad.in',0,0,NULL,NULL,NULL),(101,NULL,NULL,'1',2,31,36,'','','','','','8976094561','docs@edabroad.in',0,0,NULL,NULL,NULL),(102,'we','we','1',2,31,36,'','','','','','7994305550','docs@edabroad.in',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menu_selection`
--

DROP TABLE IF EXISTS `user_menu_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_menu_selection` (
  `User_Menu_Selection_Id` int NOT NULL AUTO_INCREMENT,
  `Menu_Id` bigint DEFAULT NULL,
  `User_Id` bigint DEFAULT NULL,
  `IsEdit` tinyint unsigned DEFAULT NULL,
  `IsSave` tinyint unsigned DEFAULT NULL,
  `IsDelete` tinyint unsigned DEFAULT NULL,
  `IsView` tinyint unsigned DEFAULT NULL,
  `Menu_Status` tinyint unsigned DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`User_Menu_Selection_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2418 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu_selection`
--

LOCK TABLES `user_menu_selection` WRITE;
/*!40000 ALTER TABLE `user_menu_selection` DISABLE KEYS */;
INSERT INTO `user_menu_selection` VALUES (102,5,83,0,1,0,1,0,0),(103,8,83,0,1,0,1,0,0),(104,9,83,0,1,0,1,0,0),(105,14,83,0,1,0,1,0,0),(106,15,83,0,1,0,1,0,0),(107,16,83,0,1,0,1,0,0),(108,17,83,0,1,0,1,0,0),(109,18,83,0,1,0,1,0,0),(110,19,83,0,1,0,1,0,0),(111,20,83,0,1,0,1,0,0),(112,21,83,0,1,0,1,0,0),(113,22,83,0,1,0,1,0,0),(114,23,83,0,1,0,1,0,0),(115,24,83,0,1,0,1,0,0),(116,27,83,0,1,0,1,0,0),(117,28,83,0,1,0,1,0,0),(118,29,83,0,1,0,1,0,0),(119,30,83,0,1,0,1,0,0),(120,31,83,0,1,0,1,0,0),(121,32,83,0,1,0,1,0,0),(122,35,83,0,1,0,1,0,0),(123,37,83,0,1,0,1,0,0),(124,38,83,0,0,0,1,0,0),(125,42,83,0,0,0,1,0,0),(126,50,83,0,1,0,1,0,0),(127,51,83,0,1,0,1,0,0),(128,52,83,0,1,0,1,0,0),(129,53,83,0,1,0,1,0,0),(130,54,83,0,1,0,1,0,0),(131,5,84,0,1,0,1,0,0),(132,8,84,0,1,0,1,0,0),(133,9,84,0,1,0,1,0,0),(134,14,84,0,1,0,1,0,0),(135,15,84,0,1,0,1,0,0),(136,16,84,0,1,0,1,0,0),(137,17,84,0,1,0,1,0,0),(138,18,84,0,1,0,1,0,0),(139,19,84,0,1,0,1,0,0),(140,20,84,0,1,0,1,0,0),(141,21,84,0,1,0,1,0,0),(142,22,84,0,1,0,1,0,0),(143,23,84,0,1,0,1,0,0),(144,24,84,0,1,0,1,0,0),(145,27,84,0,1,0,1,0,0),(146,28,84,0,1,0,1,0,0),(147,29,84,0,1,0,1,0,0),(148,30,84,0,1,0,1,0,0),(149,31,84,0,1,0,1,0,0),(150,32,84,0,1,0,1,0,0),(151,35,84,0,1,0,1,0,0),(152,37,84,0,1,0,1,0,0),(153,38,84,0,0,0,1,0,0),(154,42,84,0,0,0,1,0,0),(155,50,84,0,0,0,1,0,0),(156,51,84,0,1,0,1,0,0),(157,52,84,0,1,0,1,0,0),(158,53,84,0,1,0,1,0,0),(159,54,84,0,1,0,1,0,0),(188,5,51,0,1,0,1,0,0),(189,9,51,0,1,0,1,0,0),(190,14,51,0,1,0,1,0,0),(191,17,51,0,1,0,1,0,0),(192,18,51,0,1,0,1,0,0),(193,19,51,0,1,0,1,0,0),(194,20,51,0,1,0,1,0,0),(195,27,51,0,1,0,1,0,0),(196,32,51,0,1,0,1,0,0),(197,35,51,0,1,0,1,0,0),(208,5,75,0,1,0,1,0,0),(209,9,75,0,1,0,1,0,0),(210,14,75,0,1,0,1,0,0),(211,17,75,0,1,0,1,0,0),(212,18,75,0,1,0,1,0,0),(213,19,75,0,1,0,1,0,0),(214,20,75,0,1,0,1,0,0),(215,27,75,0,1,0,1,0,0),(216,32,75,0,1,0,1,0,0),(217,35,75,0,1,0,1,0,0),(218,5,76,0,1,0,1,0,0),(219,9,76,0,1,0,1,0,0),(220,14,76,0,1,0,1,0,0),(221,17,76,0,1,0,1,0,0),(222,18,76,0,1,0,1,0,0),(223,19,76,0,1,0,1,0,0),(224,20,76,0,1,0,1,0,0),(225,27,76,0,1,0,1,0,0),(226,32,76,0,1,0,1,0,0),(227,35,76,0,1,0,1,0,0),(228,5,77,0,1,0,1,0,0),(229,9,77,0,1,0,1,0,0),(230,14,77,0,1,0,1,0,0),(231,17,77,0,1,0,1,0,0),(232,18,77,0,1,0,1,0,0),(233,19,77,0,1,0,1,0,0),(234,20,77,0,1,0,1,0,0),(235,27,77,0,1,0,1,0,0),(236,32,77,0,1,0,1,0,0),(237,35,77,0,1,0,1,0,0),(238,5,78,0,1,0,1,0,0),(239,9,78,0,1,0,1,0,0),(240,14,78,0,1,0,1,0,0),(241,17,78,0,1,0,1,0,0),(242,18,78,0,1,0,1,0,0),(243,19,78,0,1,0,1,0,0),(244,20,78,0,1,0,1,0,0),(245,27,78,0,1,0,1,0,0),(246,32,78,0,1,0,1,0,0),(247,35,78,0,1,0,1,0,0),(258,5,80,0,1,0,1,0,0),(259,9,80,0,1,0,1,0,0),(260,14,80,0,1,0,1,0,0),(261,17,80,0,1,0,1,0,0),(262,18,80,0,1,0,1,0,0),(263,19,80,0,1,0,1,0,0),(264,20,80,0,1,0,1,0,0),(265,27,80,0,1,0,1,0,0),(266,32,80,0,1,0,1,0,0),(267,35,80,0,1,0,1,0,0),(268,5,81,0,1,0,1,0,0),(269,9,81,0,1,0,1,0,0),(270,14,81,0,1,0,1,0,0),(271,17,81,0,1,0,1,0,0),(272,18,81,0,1,0,1,0,0),(273,19,81,0,1,0,1,0,0),(274,20,81,0,1,0,1,0,0),(275,27,81,0,1,0,1,0,0),(276,32,81,0,1,0,1,0,0),(277,35,81,0,1,0,1,0,0),(278,5,82,0,1,0,1,0,0),(279,9,82,0,1,0,1,0,0),(280,14,82,0,1,0,1,0,0),(281,17,82,0,1,0,1,0,0),(282,18,82,0,1,0,1,0,0),(283,19,82,0,1,0,1,0,0),(284,20,82,0,1,0,1,0,0),(285,27,82,0,1,0,1,0,0),(286,35,82,0,1,0,1,0,0),(287,37,82,0,1,0,1,0,0),(288,5,85,0,1,0,1,0,0),(289,9,85,0,1,0,1,0,0),(290,14,85,0,1,0,1,0,0),(291,17,85,0,1,0,1,0,0),(292,18,85,0,1,0,1,0,0),(293,19,85,0,1,0,1,0,0),(294,20,85,0,1,0,1,0,0),(295,27,85,0,1,0,1,0,0),(296,32,85,0,1,0,1,0,0),(297,35,85,0,1,0,1,0,0),(469,5,74,0,1,0,1,0,0),(470,9,74,0,1,0,1,0,0),(471,14,74,0,1,0,1,0,0),(472,17,74,0,1,0,1,0,0),(473,18,74,0,1,0,1,0,0),(474,19,74,0,1,0,1,0,0),(475,20,74,0,1,0,1,0,0),(476,27,74,0,1,0,1,0,0),(477,32,74,0,1,0,1,0,0),(478,35,74,0,1,0,1,0,0),(687,5,50,0,1,0,1,0,0),(688,9,50,1,1,1,1,0,0),(689,14,50,0,1,0,1,0,0),(690,17,50,0,1,0,1,0,0),(691,18,50,0,1,0,1,0,0),(692,19,50,0,1,0,1,0,0),(693,20,50,0,1,0,1,0,0),(694,27,50,0,1,0,1,0,0),(695,28,50,1,1,1,1,0,0),(696,32,50,0,1,0,1,0,0),(697,35,50,0,1,0,1,0,0),(698,38,50,0,0,0,1,0,0),(738,1,86,0,0,0,1,0,0),(739,3,86,0,0,0,1,0,0),(740,4,86,0,0,0,1,0,0),(741,5,86,0,0,0,1,0,0),(742,8,86,0,0,0,1,0,0),(743,9,86,0,0,0,1,0,0),(744,10,86,0,0,0,1,0,0),(745,14,86,0,0,0,1,0,0),(746,15,86,0,0,0,1,0,0),(747,16,86,0,0,0,1,0,0),(748,17,86,0,0,0,1,0,0),(749,18,86,0,0,0,1,0,0),(750,19,86,0,0,0,1,0,0),(751,20,86,0,0,0,1,0,0),(752,21,86,0,0,0,1,0,0),(753,22,86,0,0,0,1,0,0),(754,23,86,0,0,0,1,0,0),(755,24,86,0,0,0,1,0,0),(756,27,86,0,0,0,1,0,0),(757,28,86,0,0,0,1,0,0),(758,29,86,0,0,0,1,0,0),(759,30,86,0,0,0,1,0,0),(760,31,86,0,0,0,1,0,0),(761,32,86,0,0,0,1,0,0),(762,35,86,0,0,0,1,0,0),(763,37,86,0,0,0,1,0,0),(764,38,86,0,0,0,1,0,0),(765,41,86,0,0,0,1,0,0),(766,42,86,0,0,0,1,0,0),(767,49,86,0,0,0,1,0,0),(768,50,86,0,0,0,1,0,0),(769,51,86,0,0,0,1,0,0),(770,52,86,0,0,0,1,0,0),(771,53,86,0,0,0,1,0,0),(772,54,86,0,0,0,1,0,0),(773,55,86,0,0,0,1,0,0),(774,56,86,0,0,0,1,0,0),(775,57,86,0,0,0,1,0,0),(776,58,86,0,0,0,1,0,0),(777,5,87,0,1,0,1,0,0),(778,9,87,0,1,0,1,0,0),(779,14,87,0,1,0,1,0,0),(780,17,87,0,1,0,1,0,0),(781,18,87,0,1,0,1,0,0),(782,19,87,0,1,0,1,0,0),(783,20,87,0,1,0,1,0,0),(784,27,87,0,1,0,1,0,0),(785,32,87,0,1,0,1,0,0),(786,35,87,0,1,0,1,0,0),(787,5,88,0,1,0,1,0,0),(788,9,88,1,1,1,1,0,0),(789,14,88,0,1,0,1,0,0),(790,17,88,0,1,0,1,0,0),(791,18,88,0,1,0,1,0,0),(792,19,88,0,1,0,1,0,0),(793,20,88,0,1,0,1,0,0),(794,27,88,0,1,0,1,0,0),(795,28,88,1,1,1,1,0,0),(796,32,88,0,1,0,1,0,0),(797,35,88,0,1,0,1,0,0),(798,38,88,0,0,0,1,0,0),(799,1,89,0,0,0,1,0,0),(800,3,89,0,0,0,1,0,0),(801,4,89,0,0,0,1,0,0),(802,5,89,0,0,0,1,0,0),(803,8,89,0,0,0,1,0,0),(804,9,89,0,0,0,1,0,0),(805,10,89,0,0,0,1,0,0),(806,14,89,0,0,0,1,0,0),(807,15,89,0,0,0,1,0,0),(808,16,89,0,0,0,1,0,0),(809,17,89,0,0,0,1,0,0),(810,18,89,0,0,0,1,0,0),(811,19,89,0,0,0,1,0,0),(812,20,89,0,0,0,1,0,0),(813,21,89,0,0,0,1,0,0),(814,22,89,0,0,0,1,0,0),(815,23,89,0,0,0,1,0,0),(816,24,89,0,0,0,1,0,0),(817,27,89,0,0,0,1,0,0),(818,28,89,0,0,0,1,0,0),(819,29,89,0,0,0,1,0,0),(820,30,89,0,0,0,1,0,0),(821,31,89,0,0,0,1,0,0),(822,32,89,0,0,0,1,0,0),(823,35,89,0,0,0,1,0,0),(824,37,89,0,0,0,1,0,0),(825,38,89,0,0,0,1,0,0),(826,41,89,0,0,0,1,0,0),(827,42,89,0,0,0,1,0,0),(828,49,89,0,0,0,1,0,0),(829,50,89,0,0,0,1,0,0),(830,51,89,0,0,0,1,0,0),(831,52,89,0,0,0,1,0,0),(832,53,89,0,0,0,1,0,0),(833,54,89,0,0,0,1,0,0),(834,55,89,0,0,0,1,0,0),(835,56,89,0,0,0,1,0,0),(836,57,89,0,0,0,1,0,0),(837,58,89,0,0,0,1,0,0),(838,5,90,0,1,0,1,0,0),(839,9,90,0,1,0,1,0,0),(840,14,90,0,1,0,1,0,0),(841,17,90,0,1,0,1,0,0),(842,18,90,0,1,0,1,0,0),(843,19,90,0,1,0,1,0,0),(844,20,90,0,1,0,1,0,0),(845,27,90,0,1,0,1,0,0),(846,32,90,0,1,0,1,0,0),(847,35,90,0,1,0,1,0,0),(848,5,91,0,1,0,1,0,1),(849,9,91,1,1,1,1,0,1),(850,14,91,0,1,0,1,0,1),(851,17,91,0,1,0,1,0,1),(852,18,91,0,1,0,1,0,1),(853,19,91,0,1,0,1,0,1),(854,20,91,0,1,0,1,0,1),(855,27,91,0,1,0,1,0,1),(856,28,91,1,1,1,1,0,1),(857,32,91,0,1,0,1,0,1),(858,35,91,0,1,0,1,0,1),(859,38,91,0,0,0,1,0,1),(860,1,92,0,0,0,1,0,0),(861,1,93,0,0,0,1,0,0),(862,1,94,0,0,0,1,0,0),(863,1,95,0,0,0,1,0,0),(864,1,96,0,0,0,1,0,0),(865,1,97,1,1,1,1,0,0),(866,3,97,1,1,1,1,0,0),(867,4,97,1,1,1,1,0,0),(868,5,97,1,1,1,1,0,0),(869,8,97,1,1,1,1,0,0),(870,9,97,1,1,1,1,0,0),(871,10,97,1,1,1,1,0,0),(872,14,97,1,1,1,1,0,0),(873,15,97,1,1,1,1,0,0),(874,16,97,1,1,1,1,0,0),(875,17,97,1,1,1,1,0,0),(876,18,97,1,1,1,1,0,0),(877,19,97,1,1,1,1,0,0),(878,20,97,1,1,1,1,0,0),(879,21,97,1,1,1,1,0,0),(880,22,97,1,1,1,1,0,0),(881,23,97,1,1,1,1,0,0),(882,24,97,1,1,1,1,0,0),(883,27,97,1,1,1,1,0,0),(884,28,97,1,1,1,1,0,0),(885,29,97,1,1,1,1,0,0),(886,30,97,1,1,1,1,0,0),(887,31,97,1,1,1,1,0,0),(888,32,97,1,1,1,1,0,0),(889,35,97,1,1,1,1,0,0),(890,37,97,1,1,1,1,0,0),(891,38,97,1,1,1,1,0,0),(892,41,97,1,0,0,1,0,0),(893,42,97,1,1,1,1,0,0),(894,49,97,0,0,0,1,0,0),(895,50,97,0,1,0,1,0,0),(896,51,97,1,1,1,1,0,0),(897,52,97,0,1,0,1,0,0),(898,53,97,0,1,0,1,0,0),(899,54,97,1,1,1,1,0,0),(900,55,97,1,1,1,1,0,0),(901,56,97,0,0,1,1,0,0),(902,57,97,1,1,1,1,0,0),(903,58,97,1,1,1,1,0,0),(1150,1,46,1,1,1,1,0,0),(1151,3,46,1,1,1,1,0,0),(1152,4,46,1,1,1,1,0,0),(1153,5,46,1,1,1,1,0,0),(1154,8,46,1,1,1,1,0,0),(1155,9,46,1,1,1,1,0,0),(1156,10,46,1,1,1,1,0,0),(1157,14,46,1,1,1,1,0,0),(1158,15,46,1,1,1,1,0,0),(1159,16,46,1,1,1,1,0,0),(1160,17,46,1,1,1,1,0,0),(1161,18,46,1,1,1,1,0,0),(1162,19,46,1,1,1,1,0,0),(1163,20,46,1,1,1,1,0,0),(1164,21,46,1,1,1,1,0,0),(1165,22,46,1,1,1,1,0,0),(1166,23,46,1,1,1,1,0,0),(1167,24,46,1,1,1,1,0,0),(1168,27,46,1,1,1,1,0,0),(1169,28,46,1,1,1,1,0,0),(1170,29,46,1,1,1,1,0,0),(1171,30,46,1,1,1,1,0,0),(1172,31,46,1,1,1,1,0,0),(1173,32,46,1,1,1,1,0,0),(1174,35,46,1,1,1,1,0,0),(1175,37,46,1,1,1,1,0,0),(1176,38,46,1,1,1,1,0,0),(1177,40,46,1,1,1,1,0,0),(1178,41,46,1,1,1,1,0,0),(1179,42,46,1,1,1,1,0,0),(1180,49,46,1,1,1,1,0,0),(1181,50,46,1,1,1,1,0,0),(1182,51,46,1,1,1,1,0,0),(1183,52,46,1,1,1,1,0,0),(1184,53,46,1,1,1,1,0,0),(1185,54,46,1,1,1,1,0,0),(1186,55,46,1,1,1,1,0,0),(1187,56,46,1,1,1,1,0,0),(1188,57,46,1,1,1,1,0,0),(1189,58,46,1,1,1,1,0,0),(1190,59,46,1,1,1,1,0,0),(1191,5,79,0,1,0,1,0,0),(1192,9,79,0,1,0,1,0,0),(1193,14,79,0,1,0,1,0,0),(1194,17,79,0,1,0,1,0,0),(1195,18,79,0,1,0,1,0,0),(1196,19,79,0,1,0,1,0,0),(1197,20,79,0,1,0,1,0,0),(1198,22,79,1,1,1,1,0,0),(1199,27,79,0,1,0,1,0,0),(1200,31,79,1,1,1,1,0,0),(1201,32,79,0,1,0,1,0,0),(1202,35,79,0,1,0,1,0,0),(1203,37,79,0,0,0,1,0,0),(1204,38,79,0,0,0,1,0,0),(1205,41,79,1,0,0,1,0,0),(1206,42,79,1,0,0,1,0,0),(2117,1,98,1,1,1,1,0,0),(2118,3,98,1,1,1,1,0,0),(2119,4,98,1,1,1,1,0,0),(2120,5,98,1,1,1,1,0,0),(2121,8,98,1,1,1,1,0,0),(2122,9,98,1,1,1,1,0,0),(2123,10,98,1,1,1,1,0,0),(2124,14,98,1,1,1,1,0,0),(2125,15,98,1,1,1,1,0,0),(2126,16,98,1,1,1,1,0,0),(2127,17,98,1,1,1,1,0,0),(2128,18,98,1,1,1,1,0,0),(2129,19,98,1,1,1,1,0,0),(2130,20,98,1,1,1,1,0,0),(2131,21,98,1,1,1,1,0,0),(2132,22,98,1,1,1,1,0,0),(2133,23,98,1,1,1,1,0,0),(2134,24,98,1,1,1,1,0,0),(2135,27,98,1,1,1,1,0,0),(2136,28,98,1,1,1,1,0,0),(2137,29,98,1,1,1,1,0,0),(2138,30,98,1,1,1,1,0,0),(2139,31,98,1,1,1,1,0,0),(2140,32,98,1,1,1,1,0,0),(2141,35,98,1,1,1,1,0,0),(2142,37,98,1,1,1,1,0,0),(2143,38,98,1,1,1,1,0,0),(2144,40,98,1,1,1,1,0,0),(2145,41,98,1,1,1,1,0,0),(2146,42,98,1,1,1,1,0,0),(2147,49,98,1,1,1,1,0,0),(2148,50,98,1,1,1,1,0,0),(2149,51,98,1,1,1,1,0,0),(2150,52,98,1,1,1,1,0,0),(2151,53,98,1,1,1,1,0,0),(2152,54,98,1,1,1,1,0,0),(2153,55,98,1,1,1,1,0,0),(2154,56,98,1,1,1,1,0,0),(2155,57,98,1,1,1,1,0,0),(2156,58,98,1,1,1,1,0,0),(2157,59,98,1,1,1,1,0,0),(2158,5,99,0,1,0,1,0,0),(2159,9,99,1,1,1,1,0,0),(2160,14,99,0,1,0,1,0,0),(2161,17,99,0,1,0,1,0,0),(2162,18,99,0,1,0,1,0,0),(2163,19,99,0,1,0,1,0,0),(2164,20,99,0,1,0,1,0,0),(2165,27,99,0,1,0,1,0,0),(2166,28,99,1,1,1,1,0,0),(2167,32,99,0,1,0,1,0,0),(2168,35,99,0,1,0,1,0,0),(2169,38,99,0,0,0,1,0,0),(2170,5,100,0,1,0,1,0,0),(2171,9,100,1,1,1,1,0,0),(2172,14,100,0,1,0,1,0,0),(2173,17,100,0,1,0,1,0,0),(2174,18,100,0,1,0,1,0,0),(2175,19,100,0,1,0,1,0,0),(2176,20,100,0,1,0,1,0,0),(2177,27,100,0,1,0,1,0,0),(2178,28,100,1,1,1,1,0,0),(2179,32,100,0,1,0,1,0,0),(2180,35,100,0,1,0,1,0,0),(2181,38,100,0,0,0,1,0,0),(2182,1,101,1,1,1,1,0,0),(2183,3,101,1,1,1,1,0,0),(2184,4,101,1,1,1,1,0,0),(2185,5,101,1,1,1,1,0,0),(2186,8,101,1,1,1,1,0,0),(2187,9,101,1,1,1,1,0,0),(2188,10,101,1,1,1,1,0,0),(2189,14,101,1,1,1,1,0,0),(2190,15,101,1,1,1,1,0,0),(2191,16,101,1,1,1,1,0,0),(2192,17,101,1,1,1,1,0,0),(2193,18,101,1,1,1,1,0,0),(2194,19,101,1,1,1,1,0,0),(2195,20,101,1,1,1,1,0,0),(2196,21,101,1,1,1,1,0,0),(2197,22,101,1,1,1,1,0,0),(2198,23,101,1,1,1,1,0,0),(2199,24,101,1,1,1,1,0,0),(2200,27,101,1,1,1,1,0,0),(2201,28,101,1,1,1,1,0,0),(2202,29,101,1,1,1,1,0,0),(2203,30,101,1,1,1,1,0,0),(2204,31,101,1,1,1,1,0,0),(2205,32,101,1,1,1,1,0,0),(2206,35,101,1,1,1,1,0,0),(2207,37,101,1,1,1,1,0,0),(2208,38,101,1,1,1,1,0,0),(2209,40,101,1,1,1,1,0,0),(2210,41,101,1,1,1,1,0,0),(2211,42,101,1,1,1,1,0,0),(2212,49,101,1,1,1,1,0,0),(2213,50,101,1,1,1,1,0,0),(2214,51,101,1,1,1,1,0,0),(2215,52,101,1,1,1,1,0,0),(2216,53,101,1,1,1,1,0,0),(2217,54,101,1,1,1,1,0,0),(2218,55,101,1,1,1,1,0,0),(2219,56,101,1,1,1,1,0,0),(2220,57,101,1,1,1,1,0,0),(2221,58,101,1,1,1,1,0,0),(2222,59,101,1,1,1,1,0,0),(2223,5,102,0,1,0,1,0,0),(2224,9,102,1,1,1,1,0,0),(2225,14,102,0,1,0,1,0,0),(2226,17,102,0,1,0,1,0,0),(2227,18,102,0,1,0,1,0,0),(2228,19,102,0,1,0,1,0,0),(2229,20,102,0,1,0,1,0,0),(2230,27,102,0,1,0,1,0,0),(2231,28,102,1,1,1,1,0,0),(2232,32,102,0,1,0,1,0,0),(2233,35,102,0,1,0,1,0,0),(2234,38,102,0,0,0,1,0,0),(2372,1,45,1,1,1,1,0,0),(2373,3,45,1,1,1,1,0,0),(2374,4,45,1,1,1,1,0,0),(2375,5,45,1,1,1,1,0,0),(2376,8,45,1,1,1,1,0,0),(2377,9,45,1,1,1,1,0,0),(2378,10,45,1,1,1,1,0,0),(2379,14,45,1,1,1,1,0,0),(2380,15,45,1,1,1,1,0,0),(2381,16,45,1,1,1,1,0,0),(2382,17,45,1,1,1,1,0,0),(2383,18,45,1,1,1,1,0,0),(2384,19,45,1,1,1,1,0,0),(2385,20,45,1,1,1,1,0,0),(2386,21,45,1,1,1,1,0,0),(2387,22,45,1,1,1,1,0,0),(2388,23,45,1,1,1,1,0,0),(2389,24,45,1,1,1,1,0,0),(2390,27,45,1,1,1,1,0,0),(2391,28,45,1,1,1,1,0,0),(2392,29,45,1,1,1,1,0,0),(2393,30,45,1,1,1,1,0,0),(2394,31,45,1,1,1,1,0,0),(2395,32,45,1,1,1,1,0,0),(2396,35,45,1,1,1,1,0,0),(2397,37,45,1,1,1,1,0,0),(2398,38,45,1,1,1,1,0,0),(2399,40,45,1,0,0,1,0,0),(2400,41,45,1,0,0,1,0,0),(2401,42,45,1,1,1,1,0,0),(2402,49,45,0,0,0,1,0,0),(2403,50,45,0,1,0,1,0,0),(2404,51,45,1,1,1,1,0,0),(2405,52,45,0,1,0,1,0,0),(2406,53,45,0,1,0,1,0,0),(2407,54,45,1,1,1,1,0,0),(2408,55,45,1,1,1,1,0,0),(2409,56,45,0,0,1,1,0,0),(2410,57,45,1,1,1,1,0,0),(2411,58,45,1,1,1,1,0,0),(2412,59,45,1,1,1,1,0,0),(2413,60,45,1,1,1,1,0,0),(2414,61,45,1,1,1,1,0,0),(2415,62,45,1,1,1,1,0,0),(2416,63,45,1,1,1,1,0,0),(2417,64,45,1,1,1,1,0,0);
/*!40000 ALTER TABLE `user_menu_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `User_Role_Id` int NOT NULL AUTO_INCREMENT,
  `User_Role_Name` varchar(50) DEFAULT NULL,
  `Role_Under_Id` int DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`User_Role_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (30,'President',30,0),(31,'Manager',30,0),(32,'User',30,0),(33,'hr',31,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status` (
  `User_Status_Id` int NOT NULL AUTO_INCREMENT,
  `User_Status_Name` varchar(50) DEFAULT NULL,
  `Is_Delete` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`User_Status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status`
--

LOCK TABLES `user_status` WRITE;
/*!40000 ALTER TABLE `user_status` DISABLE KEYS */;
INSERT INTO `user_status` VALUES (1,'Working',0),(2,'Resigned',0);
/*!40000 ALTER TABLE `user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `User_Type_Id` int NOT NULL AUTO_INCREMENT,
  `User_Type_Name` varchar(50) DEFAULT NULL,
  `DeleteStatus` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`User_Type_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'Admin',0),(2,'User',0);
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-02 11:54:04
