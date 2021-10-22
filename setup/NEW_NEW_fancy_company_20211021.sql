CREATE DATABASE  IF NOT EXISTS `fancy_company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fancy_company`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: fancy_company
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Company` (
  `Company_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(25) NOT NULL,
  `Company_Email` varchar(25) NOT NULL,
  `Company_Website` varchar(25) NOT NULL,
  `Company_Telephone` varchar(25) NOT NULL,
  `Company_Street_Name` varchar(25) NOT NULL,
  `Company_Street_Number` varchar(25) NOT NULL,
  `Company_City` varchar(25) NOT NULL,
  `Company_Postal_Code` varchar(25) NOT NULL,
  `Company_Country` varchar(25) NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Company_ID`),
  UNIQUE KEY `Company_ID` (`Company_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (1,'Fancy Fashion GmbH','info@fancy_fashion.de','www.fancyfashion.de','0049 (0) 176 23456212','Waldstrasse','80','Ohrdurf','99885','Germany ','2018-12-15 12:03:02',NULL);
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Discount` (
  `Discount_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Discount_Name` varchar(25) DEFAULT NULL,
  `Discount_Description` varchar(50) DEFAULT NULL,
  `Discount_Percentage` float NOT NULL,
  `Discount_Active` tinyint(1) DEFAULT '0',
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Discount_ID`),
  UNIQUE KEY `Discount_ID` (`Discount_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES (1,'5% discount','summer sale',5,0,'2018-12-15 11:12:02',NULL),(2,'10% discount','special offer',10,1,'2018-12-15 11:18:02',NULL),(3,'15% discount','flash sale',15,1,'2018-12-15 11:22:02',NULL),(4,'20% discount','black friday',20,0,'2018-12-15 11:32:02',NULL);
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice` (
  `Invoice_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Order_ID` bigint unsigned NOT NULL,
  `Sales_Amount` float NOT NULL,
  `Status` varchar(45) NOT NULL DEFAULT '0',
  `Due_Date` date NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Invoice_ID`),
  UNIQUE KEY `Invoice_ID` (`Invoice_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,1,72.9,'Completed','2019-01-06','2019-01-01 16:00:00',NULL),(2,2,218.7,'Completed','2019-01-15','2019-01-10 18:00:00',NULL),(3,3,105.2,'Completed','2019-01-17','2019-01-12 18:10:00',NULL),(4,4,29.99,'Completed','2019-01-18','2019-01-13 16:00:00',NULL),(5,5,303.49,'Completed','2019-03-05','2019-02-28 10:10:00',NULL),(6,6,57.39,'Completed','2019-03-06','2019-03-01 09:35:00',NULL),(7,7,81,'Completed','2019-03-15','2019-03-10 20:00:00',NULL),(8,8,155.78,'Completed','2019-03-24','2019-03-19 19:00:00',NULL),(9,9,97.2,'Completed','2019-05-19','2019-05-14 08:10:00',NULL),(10,10,81,'Completed','2019-05-23','2019-05-18 10:10:00',NULL),(11,11,259.2,'Completed','2019-06-07','2019-06-02 08:33:01',NULL),(12,12,82.64,'Completed','2019-06-29','2019-06-24 12:04:45',NULL),(13,13,81,'Completed','2019-07-09','2019-07-04 22:20:09',NULL),(14,14,57.39,'Completed','2019-07-19','2019-07-14 18:10:00',NULL),(15,15,105.3,'Completed','2019-08-13','2019-08-08 14:30:35',NULL),(16,16,194.88,'Completed','2019-08-22','2019-08-17 14:15:35',NULL),(17,17,81,'Completed','2019-11-03','2019-10-29 09:31:32',NULL),(18,18,16.2,'Completed','2019-12-17','2019-12-12 21:03:01',NULL),(19,19,40.5,'Completed','2019-12-19','2019-12-14 22:03:01',NULL),(20,20,48.6,'Completed','2020-01-15','2020-01-10 09:14:23',NULL),(21,21,29.99,'Completed','2020-01-22','2020-01-17 09:14:23',NULL),(22,22,104.84,'Completed','2020-02-07','2020-02-02 11:14:24',NULL),(23,23,97.2,'Completed','2020-03-20','2020-03-15 12:50:00',NULL),(24,24,105.3,'Completed','2020-04-03','2020-03-29 22:51:00',NULL),(25,25,190.9,'Completed','2020-05-03','2020-04-28 23:30:00',NULL),(26,26,178.2,'Completed','2020-07-12','2020-07-07 15:00:01',NULL),(27,27,16.2,'Completed','2020-10-13','2020-10-08 18:40:01',NULL),(28,28,247.05,'Completed','2020-11-10','2020-11-05 21:00:00',NULL),(29,29,69.97,'Completed','2020-12-06','2020-12-01 23:12:00',NULL),(30,30,89,'Completed','2020-12-28','2020-12-23 13:00:14',NULL);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Item`
--

DROP TABLE IF EXISTS `Order_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Item` (
  `Order_Item_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Order_ID` bigint unsigned NOT NULL,
  `SKU_ID` bigint unsigned NOT NULL,
  `Quantity` int NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Order_Item_ID`),
  UNIQUE KEY `Order_Item_ID` (`Order_Item_ID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `SKU_ID` (`SKU_ID`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`SKU_ID`) REFERENCES `SKU` (`SKU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Item`
--

LOCK TABLES `Order_Item` WRITE;
/*!40000 ALTER TABLE `Order_Item` DISABLE KEYS */;
INSERT INTO `Order_Item` VALUES (1,1,2,2,'2019-01-01 16:00:00',NULL),(2,1,65,1,'2019-01-01 16:00:00',NULL),(3,2,15,1,'2019-01-10 18:00:00',NULL),(4,2,57,1,'2019-01-10 18:00:00',NULL),(5,2,75,1,'2019-01-10 18:00:00',NULL),(6,3,5,1,'2019-01-12 18:10:00',NULL),(7,3,37,2,'2019-01-12 18:10:00',NULL),(8,4,97,1,'2019-01-13 16:00:00',NULL),(9,5,41,1,'2019-02-28 10:10:00',NULL),(10,5,51,2,'2019-02-28 10:10:00',NULL),(11,5,68,1,'2019-02-28 10:10:00',NULL),(12,5,83,1,'2019-02-28 10:10:00',NULL),(13,6,21,1,'2019-03-01 09:35:00',NULL),(14,6,60,1,'2019-03-01 09:35:00',NULL),(15,7,25,1,'2019-03-10 20:00:00',NULL),(16,8,30,2,'2019-03-19 19:00:00',NULL),(17,8,35,1,'2019-03-19 19:00:00',NULL),(18,9,43,2,'2019-05-14 08:10:00',NULL),(19,10,52,1,'2019-05-18 10:10:00',NULL),(20,11,54,2,'2019-06-02 08:33:01',NULL),(21,11,61,1,'2019-06-02 08:33:01',NULL),(22,11,77,1,'2019-06-02 08:33:01',NULL),(23,12,81,1,'2019-06-24 12:04:45',NULL),(24,12,92,1,'2019-06-24 12:04:45',NULL),(25,13,47,1,'2019-07-04 22:20:09',NULL),(26,14,1,2,'2019-07-14 18:10:00',NULL),(27,14,19,1,'2019-07-14 18:10:00',NULL),(28,15,82,2,'2019-08-08 14:30:35',NULL),(29,16,48,1,'2019-08-17 14:15:35',NULL),(30,16,27,1,'2019-08-17 14:15:35',NULL),(31,16,44,2,'2019-08-17 14:15:35',NULL),(32,16,31,1,'2019-08-17 14:15:35',NULL),(33,17,33,1,'2019-10-29 09:31:32',NULL),(34,17,8,1,'2019-10-29 09:31:32',NULL),(35,18,5,1,'2019-12-12 21:03:01',NULL),(36,19,11,1,'2019-12-14 22:03:01',NULL),(37,19,12,1,'2019-12-14 22:03:01',NULL),(38,20,45,2,'2020-01-10 09:14:23',NULL),(39,21,95,1,'2020-01-17 09:14:23',NULL),(40,22,79,1,'2020-02-02 11:14:24',NULL),(41,22,3,1,'2020-02-02 11:14:24',NULL),(42,22,29,1,'2020-02-02 11:14:24',NULL),(43,23,49,1,'2020-03-15 12:50:00',NULL),(44,24,75,3,'2020-03-29 22:51:00',NULL),(45,24,80,1,'2020-03-29 22:51:00',NULL),(46,25,6,2,'2020-04-28 23:30:00',NULL),(47,25,23,1,'2020-04-28 23:30:00',NULL),(48,25,34,1,'2020-04-28 23:30:00',NULL),(49,25,45,1,'2020-04-28 23:30:00',NULL),(50,25,87,2,'2020-04-28 23:30:00',NULL),(51,26,46,1,'2020-07-07 15:00:01',NULL),(52,26,49,1,'2020-07-07 15:00:01',NULL),(53,27,4,2,'2020-10-08 18:40:01',NULL),(54,28,64,2,'2020-11-05 21:00:00',NULL),(55,28,70,1,'2020-11-05 21:00:00',NULL),(56,28,55,1,'2020-11-05 21:00:00',NULL),(57,28,56,1,'2020-11-05 21:00:00',NULL),(58,29,84,2,'2020-12-01 23:12:00',NULL),(59,29,95,1,'2020-12-01 23:12:00',NULL),(60,30,38,2,'2020-12-23 13:00:14',NULL);
/*!40000 ALTER TABLE `Order_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `Order_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` bigint unsigned NOT NULL,
  `Invoice_ID` int NOT NULL DEFAULT '0',
  `Discount_ID` bigint unsigned DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  UNIQUE KEY `Order_ID` (`Order_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Discount_ID _idx` (`Discount_ID`),
  CONSTRAINT `Discount_ID ` FOREIGN KEY (`Discount_ID`) REFERENCES `Discount` (`Discount_ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,1,NULL,'2019-01-01 16:00:00',NULL),(2,2,2,1,'2019-01-10 18:00:00',NULL),(3,1,3,2,'2019-01-12 18:10:00',NULL),(4,1,4,NULL,'2019-01-13 16:00:00',NULL),(5,3,5,NULL,'2019-02-28 10:10:00',NULL),(6,3,6,NULL,'2019-03-01 09:35:00',NULL),(7,2,7,NULL,'2019-03-10 20:00:00',NULL),(8,4,8,NULL,'2019-03-19 19:00:00',NULL),(9,5,9,NULL,'2019-05-14 08:10:00',NULL),(10,4,10,NULL,'2019-05-18 10:10:00',NULL),(11,6,11,NULL,'2019-06-02 08:33:01',NULL),(12,7,12,NULL,'2019-06-24 12:04:45',NULL),(13,8,13,NULL,'2019-07-04 22:20:09',NULL),(14,5,14,NULL,'2019-07-14 18:10:00',NULL),(15,9,15,NULL,'2019-08-08 14:30:35',NULL),(16,1,16,NULL,'2019-08-17 14:15:35',NULL),(17,10,17,NULL,'2019-10-29 09:31:32',NULL),(18,11,18,NULL,'2019-12-12 21:03:01',NULL),(19,1,19,2,'2019-12-14 22:03:01',NULL),(20,12,20,NULL,'2020-01-10 09:14:23',NULL),(21,4,21,1,'2020-01-17 09:14:23',NULL),(22,13,22,NULL,'2020-02-02 11:14:24',NULL),(23,14,23,NULL,'2020-03-15 12:50:00',NULL),(24,1,24,1,'2020-03-29 22:51:00',NULL),(25,15,25,NULL,'2020-04-28 23:30:00',NULL),(26,16,26,2,'2020-07-07 15:00:01',NULL),(27,17,27,NULL,'2020-10-08 18:40:01',NULL),(28,18,28,NULL,'2020-11-05 21:00:00',NULL),(29,19,29,NULL,'2020-12-01 23:12:00',NULL),(30,20,30,NULL,'2020-12-23 13:00:14',NULL);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `Product_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Product_Name` varchar(25) NOT NULL,
  `Product_Price` float(10,2) NOT NULL,
  `Product_Category_ID` bigint unsigned NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Product_ID`),
  UNIQUE KEY `Product_ID` (`Product_ID`),
  KEY `Product_Category_ID` (`Product_Category_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Product_Category_ID`) REFERENCES `Product_Category` (`Product_Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'CALIFORNIA ',16.20,1,'2018-12-15 09:10:30',NULL),(2,'C-NECK ',20.25,1,'2018-12-15 09:20:30',NULL),(3,'LOGO ',24.99,1,'2018-12-15 09:23:10',NULL),(4,'LEISURE',40.50,2,'2018-12-15 09:40:30',NULL),(5,'WORK',35.99,2,'2018-12-15 09:53:00',NULL),(6,'FORMAL',45.49,2,'2018-12-15 09:54:00',NULL),(7,'OVERZISED ',64.80,3,'2018-12-15 09:53:00',NULL),(8,'TURTLENECK',44.50,3,'2018-12-15 10:03:00',NULL),(9,'ZIPPER',36.45,4,'2018-12-15 10:15:30',NULL),(10,'TERENCE',48.60,4,'2018-12-15 10:25:30',NULL),(11,'ESSENTIAL',81.00,5,'2018-12-15 10:38:00',NULL),(12,'WINDBREAKER',97.20,5,'2018-12-15 10:50:30',NULL),(13,'TRENCHCOAT',81.00,6,'2018-12-15 11:00:30',NULL),(14,'CLASSIC PARKA',145.80,6,'2018-12-15 11:13:00',NULL),(15,'SPACE RELAXED',32.40,7,'2018-12-15 11:23:00',NULL),(16,'BEYOND SLIM ',52.65,7,'2018-12-15 11:35:00',NULL),(17,'CHINO',64.80,8,'2018-12-15 11:47:00',NULL),(18,'CARGO',52.65,8,'2018-12-15 12:03:00',NULL),(19,'MILANO ',19.99,9,'2018-12-15 12:19:00',NULL),(20,'CONER',29.99,9,'2018-12-15 12:35:00',NULL);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Category`
--

DROP TABLE IF EXISTS `Product_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Category` (
  `Product_Category_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Product_Category` varchar(25) NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Product_Category_ID`),
  UNIQUE KEY `Product_Category_ID` (`Product_Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Category`
--

LOCK TABLES `Product_Category` WRITE;
/*!40000 ALTER TABLE `Product_Category` DISABLE KEYS */;
INSERT INTO `Product_Category` VALUES (1,'T-Shirts','2018-12-15 09:00:00',NULL),(2,'Shirts','2018-12-15 09:02:02',NULL),(3,'Pullovers','2018-12-15 09:04:04',NULL),(4,'Cardigans','2018-12-15 09:06:06',NULL),(5,'Jackets','2018-12-15 09:08:08',NULL),(6,'Coats','2018-12-15 09:10:10',NULL),(7,'Jeans','2018-12-15 09:12:12',NULL),(8,'Trousers','2018-12-15 09:14:14',NULL),(9,'Shorts','2018-12-15 09:16:16',NULL);
/*!40000 ALTER TABLE `Product_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Colour`
--

DROP TABLE IF EXISTS `Product_Colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Colour` (
  `Product_Colour_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Colour` varchar(25) NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Product_Colour_ID`),
  UNIQUE KEY `Product_Colour_ID` (`Product_Colour_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Colour`
--

LOCK TABLES `Product_Colour` WRITE;
/*!40000 ALTER TABLE `Product_Colour` DISABLE KEYS */;
INSERT INTO `Product_Colour` VALUES (1,'black','2018-12-15 09:00:00',NULL),(2,'brown','2018-12-15 09:00:10',NULL),(3,'grey','2018-12-15 09:00:20',NULL),(4,'white','2018-12-15 09:00:30',NULL),(5,'yellow','2018-12-15 09:00:40',NULL),(6,'orange','2018-12-15 09:00:50',NULL),(7,'pink','2018-12-15 09:01:00',NULL),(8,'red','2018-12-15 09:01:10',NULL),(9,'blue','2018-12-15 09:01:20',NULL),(10,'green','2018-12-15 09:01:30',NULL),(11,'gold','2018-12-15 09:01:40',NULL),(12,'silver','2018-12-15 09:01:50',NULL);
/*!40000 ALTER TABLE `Product_Colour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Rating`
--

DROP TABLE IF EXISTS `Product_Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Rating` (
  `Product_Rating_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Product_Rating` float NOT NULL,
  `Product_ID` bigint unsigned NOT NULL,
  `User_ID` bigint unsigned NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Product_Rating_ID`),
  UNIQUE KEY `Product_Rating_ID` (`Product_Rating_ID`),
  KEY `Product_ID` (`Product_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `product_rating_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  CONSTRAINT `product_rating_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Rating`
--

LOCK TABLES `Product_Rating` WRITE;
/*!40000 ALTER TABLE `Product_Rating` DISABLE KEYS */;
INSERT INTO `Product_Rating` VALUES (1,1,14,2,'2019-01-02 14:00:00',NULL),(2,4,16,2,'2019-01-02 14:02:00',NULL),(3,3,9,3,'2019-03-04 17:10:00',NULL),(4,4,12,3,'2019-03-05 17:11:00',NULL),(5,2,16,3,'2019-03-06 17:12:50',NULL),(6,3,4,2,'2019-03-14 22:00:00',NULL),(7,5,1,1,'2019-03-17 17:00:00',NULL),(8,4,15,1,'2019-03-17 17:05:00',NULL),(9,2,13,6,'2019-06-04 08:33:01',NULL),(10,1,15,6,'2019-06-04 08:35:01',NULL),(11,1,17,6,'2019-06-04 08:36:01',NULL),(12,2,18,7,'2019-06-27 12:04:45',NULL),(13,4,20,7,'2019-06-27 12:05:30',NULL),(14,3,1,5,'2019-07-19 19:10:00',NULL),(15,3,3,5,'2019-07-19 19:12:00',NULL),(16,4,11,1,'2019-08-22 15:35:35',NULL),(17,5,5,1,'2019-08-22 15:37:35',NULL),(18,1,10,1,'2019-08-22 15:38:35',NULL),(19,3,18,13,'2020-02-04 11:14:24',NULL),(20,4,1,13,'2020-02-05 11:14:24',NULL),(21,5,5,13,'2020-02-05 11:18:24',NULL),(22,5,1,15,'2020-04-29 23:30:00',NULL),(23,1,4,15,'2020-04-29 23:31:00',NULL),(24,1,7,15,'2020-04-29 23:32:00',NULL),(25,3,10,15,'2020-04-29 23:33:00',NULL),(26,3,19,15,'2020-04-29 23:34:00',NULL),(27,4,13,18,'2020-11-06 21:01:30',NULL),(28,2,13,18,'2020-11-05 21:02:00',NULL),(29,1,18,18,'2020-11-04 21:02:30',NULL),(30,2,12,1,'2020-12-09 21:02:30',NULL);
/*!40000 ALTER TABLE `Product_Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Size`
--

DROP TABLE IF EXISTS `Product_Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_Size` (
  `Product_Size_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Size` varchar(25) NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Product_Size_ID`),
  UNIQUE KEY `Product_Size_ID` (`Product_Size_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Size`
--

LOCK TABLES `Product_Size` WRITE;
/*!40000 ALTER TABLE `Product_Size` DISABLE KEYS */;
INSERT INTO `Product_Size` VALUES (1,'S','2018-12-15 11:02:02',NULL),(2,'M','2018-12-15 11:05:02',NULL),(3,'L','2018-12-15 11:07:12',NULL),(4,'XL','2018-12-15 11:10:14',NULL),(5,'XXL','2018-12-15 11:24:04',NULL),(6,'32','2018-12-15 11:32:23',NULL),(7,'34','2018-12-15 11:33:21',NULL),(8,'36','2018-12-15 11:35:45',NULL),(9,'38','2018-12-15 11:36:21',NULL),(10,'40','2018-12-15 11:37:23',NULL),(11,'42','2018-12-15 11:39:42',NULL),(12,'44','2018-12-15 11:40:23',NULL),(13,'46','2018-12-15 11:42:41',NULL),(14,'One Size','2018-12-15 11:43:30',NULL);
/*!40000 ALTER TABLE `Product_Size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SKU`
--

DROP TABLE IF EXISTS `SKU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SKU` (
  `SKU_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Quantity` int NOT NULL DEFAULT '0',
  `Product_ID` bigint unsigned NOT NULL,
  `Product_Colour_ID` bigint unsigned NOT NULL,
  `Product_Size_ID` bigint unsigned NOT NULL,
  `Warehouse_ID` bigint unsigned NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`SKU_ID`,`Product_ID`,`Product_Colour_ID`,`Product_Size_ID`,`Warehouse_ID`),
  UNIQUE KEY `SKU_ID` (`SKU_ID`),
  KEY `Product_ID` (`Product_ID`),
  KEY `Product_Colour_ID` (`Product_Colour_ID`),
  KEY `Product_Size_ID` (`Product_Size_ID`),
  KEY `Warehouse_ID` (`Warehouse_ID`),
  CONSTRAINT `sku_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  CONSTRAINT `sku_ibfk_2` FOREIGN KEY (`Product_Colour_ID`) REFERENCES `Product_Colour` (`Product_Colour_ID`),
  CONSTRAINT `sku_ibfk_3` FOREIGN KEY (`Product_Size_ID`) REFERENCES `Product_Size` (`Product_Size_ID`),
  CONSTRAINT `sku_ibfk_4` FOREIGN KEY (`Warehouse_ID`) REFERENCES `Warehouse` (`Warehouse_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SKU`
--

LOCK TABLES `SKU` WRITE;
/*!40000 ALTER TABLE `SKU` DISABLE KEYS */;
INSERT INTO `SKU` VALUES (1,5,1,1,1,1,'2018-12-15 12:35:03',NULL),(2,5,1,1,2,1,'2018-12-15 12:35:07',NULL),(3,5,1,1,3,1,'2018-12-15 12:35:11',NULL),(4,5,1,1,4,1,'2018-12-15 12:35:15',NULL),(5,5,1,1,5,1,'2018-12-15 12:35:19',NULL),(6,3,1,3,1,1,'2018-12-15 12:35:23',NULL),(7,3,1,3,2,1,'2018-12-15 12:35:27',NULL),(8,3,1,3,3,1,'2018-12-15 12:35:31',NULL),(9,3,1,3,4,1,'2018-12-15 12:35:35',NULL),(10,3,1,3,5,1,'2018-12-15 12:35:39',NULL),(11,4,2,4,1,1,'2018-12-15 12:35:43',NULL),(12,3,2,4,1,1,'2018-12-15 12:35:47',NULL),(13,2,2,4,2,1,'2018-12-15 12:35:51',NULL),(14,4,2,4,3,1,'2018-12-15 12:35:55',NULL),(15,5,2,4,4,1,'2018-12-15 12:35:59',NULL),(16,1,2,4,5,1,'2018-12-15 12:36:03',NULL),(17,1,3,10,1,1,'2018-12-15 12:36:07',NULL),(18,4,3,10,1,1,'2018-12-15 12:36:11',NULL),(19,5,3,10,2,1,'2018-12-15 12:36:15',NULL),(20,7,3,10,3,1,'2018-12-15 12:36:19',NULL),(21,8,3,10,4,1,'2018-12-15 12:36:23',NULL),(22,5,3,10,5,1,'2018-12-15 12:36:27',NULL),(23,1,4,2,1,1,'2018-12-15 12:36:31',NULL),(24,2,4,2,2,1,'2018-12-15 12:36:35',NULL),(25,1,4,2,3,1,'2018-12-15 12:36:39',NULL),(26,3,5,4,1,1,'2018-12-15 12:36:43',NULL),(27,0,5,4,2,1,'2018-12-15 12:36:47',NULL),(28,1,5,4,3,1,'2018-12-15 12:36:51',NULL),(29,1,5,4,4,1,'2018-12-15 12:36:55',NULL),(30,5,6,9,1,1,'2018-12-15 12:36:59',NULL),(31,4,6,9,2,1,'2018-12-15 12:37:03',NULL),(32,0,6,9,3,1,'2018-12-15 12:37:07',NULL),(33,2,7,9,1,1,'2018-12-15 12:37:11',NULL),(34,2,7,9,2,1,'2018-12-15 12:37:15',NULL),(35,2,7,9,3,1,'2018-12-15 12:37:19',NULL),(36,0,8,1,1,1,'2018-12-15 12:37:23',NULL),(37,2,8,1,2,1,'2018-12-15 12:37:27',NULL),(38,2,8,1,3,1,'2018-12-15 12:37:31',NULL),(39,2,8,1,4,1,'2018-12-15 12:37:35',NULL),(40,1,9,5,1,1,'2018-12-15 12:37:39',NULL),(41,1,9,5,2,1,'2018-12-15 12:37:43',NULL),(42,2,9,5,3,1,'2018-12-15 12:37:47',NULL),(43,6,10,4,1,1,'2018-12-15 12:37:51',NULL),(44,4,10,4,2,1,'2018-12-15 12:37:55',NULL),(45,3,10,4,3,1,'2018-12-15 12:37:59',NULL),(46,1,11,11,1,1,'2018-12-15 12:38:03',NULL),(47,0,11,11,2,1,'2018-12-15 12:38:07',NULL),(48,3,11,11,3,1,'2018-12-15 12:38:11',NULL),(49,1,12,1,1,1,'2018-12-15 12:38:15',NULL),(50,2,12,1,2,1,'2018-12-15 12:38:19',NULL),(51,4,12,1,3,1,'2018-12-15 12:38:23',NULL),(52,1,13,3,1,1,'2018-12-15 12:38:27',NULL),(53,2,13,3,2,1,'2018-12-15 12:38:31',NULL),(54,4,13,3,3,1,'2018-12-15 12:38:35',NULL),(55,5,13,3,4,1,'2018-12-15 12:38:39',NULL),(56,8,13,3,5,1,'2018-12-15 12:38:43',NULL),(57,1,14,2,1,1,'2018-12-15 12:38:47',NULL),(58,0,14,2,2,1,'2018-12-15 12:38:51',NULL),(59,2,14,2,3,1,'2018-12-15 12:38:55',NULL),(60,0,15,9,6,1,'2018-12-15 12:38:59',NULL),(61,0,15,9,7,1,'2018-12-15 12:39:03',NULL),(62,2,15,9,8,1,'2018-12-15 12:39:07',NULL),(63,2,15,9,9,1,'2018-12-15 12:39:11',NULL),(64,2,15,9,10,1,'2018-12-15 12:39:15',NULL),(65,2,15,9,11,1,'2018-12-15 12:39:19',NULL),(66,2,15,9,12,1,'2018-12-15 12:39:23',NULL),(67,4,15,9,13,1,'2018-12-15 12:39:27',NULL),(68,1,16,1,6,1,'2018-12-15 12:39:31',NULL),(69,1,16,1,7,1,'2018-12-15 12:39:35',NULL),(70,2,16,1,8,1,'2018-12-15 12:39:39',NULL),(71,3,16,1,9,1,'2018-12-15 12:39:43',NULL),(72,0,16,1,10,1,'2018-12-15 12:39:47',NULL),(73,4,16,1,11,1,'2018-12-15 12:39:51',NULL),(74,5,16,1,12,1,'2018-12-15 12:39:55',NULL),(75,7,16,1,13,1,'2018-12-15 12:39:59',NULL),(76,1,17,8,1,1,'2018-12-15 12:40:03',NULL),(77,3,17,8,2,1,'2018-12-15 12:40:07',NULL),(78,5,17,8,3,1,'2018-12-15 12:40:11',NULL),(79,1,18,10,1,1,'2018-12-15 12:40:15',NULL),(80,1,18,10,2,1,'2018-12-15 12:40:19',NULL),(81,2,18,10,3,1,'2018-12-15 12:40:23',NULL),(82,4,18,10,4,1,'2018-12-15 12:40:27',NULL),(83,2,19,4,6,1,'2018-12-15 12:40:31',NULL),(84,3,19,4,7,1,'2018-12-15 12:40:35',NULL),(85,0,19,4,8,1,'2018-12-15 12:40:39',NULL),(86,0,19,4,9,1,'2018-12-15 12:40:43',NULL),(87,4,19,4,10,1,'2018-12-15 12:40:47',NULL),(88,3,19,4,11,1,'2018-12-15 12:40:51',NULL),(89,1,19,4,12,1,'2018-12-15 12:40:55',NULL),(90,1,20,1,6,1,'2018-12-15 12:40:59',NULL),(91,1,20,1,7,1,'2018-12-15 12:41:03',NULL),(92,2,20,1,8,1,'2018-12-15 12:41:07',NULL),(93,0,20,1,9,1,'2018-12-15 12:41:11',NULL),(94,2,20,1,10,1,'2018-12-15 12:41:15',NULL),(95,3,20,1,11,1,'2018-12-15 12:41:19',NULL),(96,0,20,1,12,1,'2018-12-15 12:41:23',NULL),(97,1,20,1,13,1,'2018-12-15 12:41:27',NULL);
/*!40000 ALTER TABLE `SKU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `User_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `User_Email` varchar(30) NOT NULL,
  `User_Password` varchar(25) NOT NULL,
  `User_First_Name` varchar(25) DEFAULT NULL,
  `User_Last_Name` varchar(25) DEFAULT NULL,
  `User_Telephone` varchar(25) DEFAULT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'p.dammith@gmail.com','#######','Peter ','Dammith','01525345678','2019-01-01 14:01:00',NULL),(2,'julian.s@web.de','#######','Jullian ','Hohagen','01768908483','2019-01-10 15:00:00',NULL),(3,'marcel.schuff@gmail.com','#######','Marcel','Schuff','01537823640','2019-02-28 09:35:00',NULL),(4,'storost.johannes@web.de','#######','Johannes','Storost','01761788890','2019-03-19 17:39:10',NULL),(5,'hans.mueller@t-mobile.de','#######','Hans','Mueller','01631347281','2019-05-14 05:12:00',NULL),(6,'klein.markus@googlemail.com','#######','Markus ','Klein','01786789043','2019-06-02 08:33:01',NULL),(7,'umut.123@gmail.com','#######','Umut ','Oedzemir','01756378291','2019-06-23 21:04:45',NULL),(8,'s.demicran@web.de','#######','Serkan','Demircan','01526783290','2019-07-04 22:14:09',NULL),(9,'l.laakmann@hotmail.com','#######','Leon ','Laakmann','01643728998','2019-08-08 14:15:35',NULL),(10,'jose.jesus@gmail.com','#######','Jose','Jesus','01766789032','2019-10-29 06:31:32',NULL),(11,'t.kliemann@t-mobile.de','#######','Tim','Kliemann','01785678234','2019-12-12 21:03:01',NULL),(12,'diebold.ivo@gmail.com','#######','Ivo','Diebold','01527890987','2020-01-10 07:15:23',NULL),(13,'j.klinser@web.de','#######','Janis','Klinser','01536789765','2020-02-02 09:14:24',NULL),(14,'b.sturm@hotmail.com','#######','Boris','Sturm','01762223445','2020-03-15 10:45:00',NULL),(15,'rapha.kliensmann@gmail.com','#######','Raphael','Kliensmann','01525398976','2020-04-28 23:13:00',NULL),(16,'felix.b@outlook.de','#######','Felix','Boehm','01788899000','2020-07-07 15:00:01',NULL),(17,'max_horst@gmail.com','#######','Maximilian ','Horst','01536577777','2020-10-08 18:34:01',NULL),(18,'l.hermann@web.de','#######','Lukas','Hermann','01567876638','2020-11-05 20:00:00',NULL),(19,'simon.weber@hotmail.com','#######','Simon','Weber','01676567788','2020-12-01 22:12:00',NULL),(20,'m.ebel@outlook.de','#######','Martin','Ebel','01547684677','2020-12-23 10:00:14',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Address`
--

DROP TABLE IF EXISTS `User_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Address` (
  `User_Address_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` bigint unsigned NOT NULL,
  `User_Address_Streetname` varchar(25) NOT NULL,
  `User_Address_Streetnumber` varchar(25) NOT NULL,
  `User_Address_City` varchar(25) NOT NULL,
  `User_Address_Postalcode` varchar(25) NOT NULL,
  `User_Adress_Country` varchar(25) NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`User_Address_ID`),
  UNIQUE KEY `User_Address_ID` (`User_Address_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Address`
--

LOCK TABLES `User_Address` WRITE;
/*!40000 ALTER TABLE `User_Address` DISABLE KEYS */;
INSERT INTO `User_Address` VALUES (1,1,'Schaarsteinweg','14','Elztal','74834','Germany','2019-01-01 14:01:00',NULL),(2,2,'Hollander Strasse','78','Hallstadt','82491','Germany','2019-01-10 15:00:00',NULL),(3,3,'Neuer Jungfernstieg','124','Grainau','68219','Germany','2019-02-28 09:35:00',NULL),(4,4,'Nuernbergerstrasse','89','Bad Wildungen','34537','Germany','2019-03-19 17:39:10',NULL),(5,5,'Messedamm','200','Stephanskirchen','83065','Germany','2019-05-14 05:12:00',NULL),(6,6,'Borstelmannsweg','43','Lauter','83125','Germany','2019-06-02 08:33:01',NULL),(7,7,'An der Alster','2','Willroth','56594','Germany','2019-06-23 21:04:45',NULL),(8,8,'Meininger Strasse ','60','Schaafheim','64850','Germany','2019-07-04 22:14:09',NULL),(9,9,'Mohrenstrasse ','78','Bad Salzuflen Innenstadt','32105','Germany','2019-08-08 14:15:35',NULL),(10,10,'Unter den Linden ','119','Pforzheim Innenstadt','75172','Germany','2019-10-29 06:31:32',NULL),(11,11,'Brandenburgische Str ','78','Toenning','25827','Germany','2019-12-12 21:03:01',NULL),(12,12,'Scharnweberstrasse','350','Bitterfeld','06732','Germany','2020-01-10 07:15:23',NULL),(13,13,'Koepenicker Str.','35','Heuchelheim bei Franken','67259','Germany','2020-12-12 09:14:24',NULL),(14,14,'Leipziger Strasse','11','Salzweg','94119','Germany','2020-03-15 10:45:00',NULL),(15,15,'Rathausstrasse','90','Dresden','01314','Germany','2020-04-28 23:13:00',NULL),(16,16,'Stresemannstr.','4','Weissenfels','06651','Germany','2020-07-07 15:00:01',NULL),(17,17,'Rudower Chaussee','18','Altrich','54518','Germany','2020-10-08 18:34:01',NULL),(18,18,'Langenhorner Chaussee','2','Berlin','14052','Germany','2020-11-05 20:00:00',NULL),(19,19,'Grosse Praesidenten Str. ','116','Loewenstein','74245','Germany','2020-12-01 22:12:00',NULL),(20,20,'Bleibtreustrasse ','5','Jena','07707','Germany','2020-12-23 10:00:14',NULL);
/*!40000 ALTER TABLE `User_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouse`
--

DROP TABLE IF EXISTS `Warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Warehouse` (
  `Warehouse_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Warehouse_Name` varchar(25) NOT NULL,
  `Warehouse_Street_Name` varchar(25) NOT NULL,
  `Warehouse_Street_Number` int NOT NULL,
  `Warehouse_City` varchar(25) NOT NULL,
  `Warehouse_Postal_Code` varchar(25) NOT NULL,
  `Created_At` datetime DEFAULT NULL,
  `Modified_At` datetime DEFAULT NULL,
  PRIMARY KEY (`Warehouse_ID`),
  UNIQUE KEY `Warehouse_ID` (`Warehouse_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouse`
--

LOCK TABLES `Warehouse` WRITE;
/*!40000 ALTER TABLE `Warehouse` DISABLE KEYS */;
INSERT INTO `Warehouse` VALUES (1,'Warehouse Ohrdurf','Waldstrasse ',81,'Ohrdurf','99885','2018-12-15 12:02:02',NULL);
/*!40000 ALTER TABLE `Warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-22 14:23:09
