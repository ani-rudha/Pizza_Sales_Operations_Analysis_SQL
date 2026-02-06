CREATE DATABASE  IF NOT EXISTS `pizza_sales_operations_analysis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizza_sales_operations_analysis`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza_sales_operations_analysis
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `order_id` int NOT NULL,
  `prep_start_time` datetime NOT NULL,
  `prep_end_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `operations_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `operations_chk_1` CHECK ((`prep_end_time` > `prep_start_time`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (3,'2023-01-31 21:45:11','2023-01-31 22:04:11'),(5,'2023-01-08 17:33:19','2023-01-08 18:01:19'),(7,'2023-01-20 22:32:02','2023-01-20 22:43:02'),(8,'2023-01-22 14:03:34','2023-01-22 14:26:34'),(9,'2023-01-20 15:54:27','2023-01-20 16:23:27'),(10,'2023-01-20 15:48:55','2023-01-20 16:04:55'),(12,'2023-01-10 22:34:58','2023-01-10 23:04:58'),(13,'2023-01-09 21:25:09','2023-01-09 21:48:09'),(16,'2023-01-18 14:34:17','2023-01-18 15:03:17'),(19,'2023-01-02 16:08:17','2023-01-02 16:27:17'),(20,'2023-01-15 17:51:28','2023-01-15 18:10:28'),(21,'2023-01-29 21:52:19','2023-01-29 22:20:19'),(23,'2023-01-24 11:34:57','2023-01-24 12:04:57'),(24,'2023-01-20 21:21:42','2023-01-20 21:33:42'),(25,'2023-01-12 08:11:03','2023-01-12 08:27:03'),(26,'2023-01-02 08:21:12','2023-01-02 08:41:12'),(30,'2023-01-18 11:23:28','2023-01-18 11:37:28'),(31,'2023-01-23 12:37:06','2023-01-23 13:10:06'),(33,'2023-01-23 17:58:17','2023-01-23 18:26:17'),(34,'2023-01-01 09:51:45','2023-01-01 10:13:45'),(35,'2023-01-14 17:39:52','2023-01-14 18:03:52'),(36,'2023-01-31 09:48:36','2023-01-31 10:09:36'),(37,'2023-01-21 09:14:38','2023-01-21 09:31:38'),(38,'2023-01-12 21:00:05','2023-01-12 21:24:05'),(39,'2023-01-21 10:41:00','2023-01-21 10:58:00'),(40,'2023-01-06 13:25:39','2023-01-06 14:03:39'),(41,'2023-01-31 13:25:53','2023-01-31 13:47:53'),(43,'2023-01-03 16:55:47','2023-01-03 17:20:47'),(46,'2023-01-21 10:26:54','2023-01-21 10:53:54'),(50,'2023-01-21 17:35:24','2023-01-21 17:47:24'),(55,'2023-01-21 12:14:39','2023-01-21 12:53:39'),(56,'2023-01-11 22:49:02','2023-01-11 23:00:02'),(57,'2023-01-29 13:02:54','2023-01-29 13:30:54'),(58,'2023-01-31 14:16:19','2023-01-31 14:28:19'),(60,'2023-01-18 11:57:12','2023-01-18 12:27:12'),(61,'2023-01-04 21:51:27','2023-01-04 22:03:27'),(64,'2023-01-10 10:25:40','2023-01-10 10:48:40'),(67,'2023-01-09 08:21:01','2023-01-09 08:46:01'),(70,'2023-01-29 19:06:10','2023-01-29 19:31:10'),(71,'2023-01-06 19:22:22','2023-01-06 20:04:22'),(73,'2023-01-27 18:07:42','2023-01-27 18:33:42'),(74,'2023-01-23 21:57:53','2023-01-23 22:22:53'),(75,'2023-01-17 14:26:55','2023-01-17 14:38:55'),(76,'2023-01-01 09:00:11','2023-01-01 09:24:11'),(78,'2023-01-18 11:43:43','2023-01-18 12:11:43'),(79,'2023-01-05 22:49:05','2023-01-05 23:10:05'),(80,'2023-01-16 15:17:37','2023-01-16 15:31:37'),(82,'2023-01-07 09:35:17','2023-01-07 09:58:17'),(83,'2023-01-23 15:51:28','2023-01-23 16:03:28'),(84,'2023-01-10 13:34:38','2023-01-10 14:11:38'),(85,'2023-01-09 22:32:48','2023-01-09 22:53:48'),(86,'2023-01-07 18:11:53','2023-01-07 18:33:53'),(87,'2023-01-16 11:56:10','2023-01-16 12:14:10'),(88,'2023-01-14 14:41:25','2023-01-14 14:51:25'),(89,'2023-01-16 22:47:02','2023-01-16 22:58:02'),(90,'2023-01-20 13:59:01','2023-01-20 14:26:01'),(92,'2023-01-20 08:16:43','2023-01-20 08:37:43'),(93,'2023-01-15 17:50:53','2023-01-15 18:11:53'),(94,'2023-01-27 12:09:40','2023-01-27 12:51:40'),(95,'2023-01-31 20:36:26','2023-01-31 21:18:26'),(98,'2023-01-08 16:43:40','2023-01-08 17:05:40'),(99,'2023-01-24 09:26:26','2023-01-24 09:47:26');
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `pizza_id` varchar(10) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`pizza_id`),
  KEY `pizza_id` (`pizza_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizzas` (`pizza_id`),
  CONSTRAINT `order_details_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,'PZ007',3),(2,'PZ001',3),(3,'PZ006',1),(4,'PZ008',4),(4,'PZ010',3),(5,'PZ001',1),(5,'PZ005',4),(6,'PZ001',2),(6,'PZ005',3),(7,'PZ002',3),(7,'PZ008',2),(7,'PZ010',4),(8,'PZ001',1),(8,'PZ002',2),(8,'PZ008',4),(9,'PZ003',4),(9,'PZ006',2),(10,'PZ001',4),(11,'PZ001',3),(11,'PZ007',4),(11,'PZ010',1),(12,'PZ002',2),(12,'PZ009',4),(12,'PZ010',2),(13,'PZ003',2),(14,'PZ006',2),(14,'PZ007',1),(14,'PZ009',3),(15,'PZ004',4),(15,'PZ007',2),(16,'PZ002',1),(17,'PZ001',4),(18,'PZ002',4),(19,'PZ005',4),(19,'PZ009',4),(20,'PZ007',2),(20,'PZ009',2),(21,'PZ007',4),(22,'PZ001',4),(22,'PZ002',3),(22,'PZ008',2),(23,'PZ003',2),(23,'PZ009',1),(23,'PZ010',2),(24,'PZ007',2),(24,'PZ009',2),(25,'PZ002',4),(25,'PZ003',4),(25,'PZ008',2),(26,'PZ002',1),(26,'PZ004',1),(27,'PZ002',1),(27,'PZ007',2),(28,'PZ006',4),(29,'PZ001',1),(29,'PZ004',1),(29,'PZ009',2),(30,'PZ008',3),(31,'PZ001',1),(31,'PZ004',1),(31,'PZ007',1),(32,'PZ002',4),(32,'PZ004',2),(32,'PZ007',1),(33,'PZ001',4),(34,'PZ006',2),(34,'PZ008',4),(35,'PZ007',2),(35,'PZ009',3),(35,'PZ010',4),(36,'PZ002',2),(36,'PZ010',1),(37,'PZ002',2),(37,'PZ005',4),(37,'PZ006',4),(38,'PZ007',2),(39,'PZ005',2),(39,'PZ007',3),(40,'PZ005',4),(40,'PZ009',2),(41,'PZ006',1),(42,'PZ007',2),(42,'PZ009',4),(43,'PZ003',1),(43,'PZ006',2),(44,'PZ002',2),(45,'PZ004',2),(45,'PZ009',2),(46,'PZ001',2),(46,'PZ009',3),(47,'PZ007',3),(48,'PZ004',4),(48,'PZ007',1),(49,'PZ004',4),(49,'PZ006',3),(50,'PZ004',1),(51,'PZ002',2),(51,'PZ004',3),(51,'PZ006',1),(52,'PZ003',4),(52,'PZ004',3),(52,'PZ009',2),(53,'PZ001',2),(53,'PZ003',4),(53,'PZ010',4),(54,'PZ007',3),(55,'PZ002',2),(55,'PZ006',2),(55,'PZ007',1),(56,'PZ001',3),(56,'PZ007',4),(56,'PZ010',2),(57,'PZ004',1),(57,'PZ010',4),(58,'PZ006',2),(58,'PZ010',3),(59,'PZ009',4),(60,'PZ004',2),(60,'PZ010',2),(61,'PZ001',1),(61,'PZ006',4),(62,'PZ001',2),(63,'PZ002',2),(63,'PZ006',1),(63,'PZ008',4),(64,'PZ007',4),(64,'PZ009',4),(65,'PZ007',4),(66,'PZ003',4),(66,'PZ004',2),(67,'PZ002',3),(67,'PZ005',1),(68,'PZ001',2),(68,'PZ004',2),(68,'PZ009',1),(69,'PZ003',1),(69,'PZ005',3),(69,'PZ007',4),(70,'PZ005',1),(71,'PZ003',3),(71,'PZ006',4),(71,'PZ007',2),(72,'PZ003',4),(72,'PZ009',1),(73,'PZ002',2),(74,'PZ003',3),(74,'PZ007',4),(75,'PZ004',3),(75,'PZ008',3),(76,'PZ010',1),(77,'PZ006',4),(77,'PZ009',2),(78,'PZ006',1),(78,'PZ007',3),(79,'PZ008',2),(80,'PZ001',3),(80,'PZ005',1),(80,'PZ008',1),(81,'PZ003',2),(81,'PZ005',3),(81,'PZ006',2),(82,'PZ008',2),(82,'PZ009',2),(83,'PZ002',4),(83,'PZ003',2),(83,'PZ005',2),(84,'PZ003',4),(84,'PZ004',4),(84,'PZ010',2),(85,'PZ010',1),(86,'PZ001',1),(86,'PZ004',4),(86,'PZ010',4),(87,'PZ002',2),(87,'PZ003',4),(87,'PZ009',4),(88,'PZ001',3),(88,'PZ007',4),(89,'PZ004',4),(89,'PZ008',1),(89,'PZ009',3),(90,'PZ008',2),(90,'PZ010',3),(91,'PZ007',3),(91,'PZ010',3),(92,'PZ002',2),(93,'PZ004',2),(93,'PZ006',3),(93,'PZ007',1),(94,'PZ001',3),(94,'PZ005',4),(94,'PZ010',2),(95,'PZ001',3),(95,'PZ003',2),(95,'PZ004',1),(96,'PZ003',3),(96,'PZ007',4),(97,'PZ001',4),(97,'PZ005',2),(97,'PZ007',4),(98,'PZ004',4),(99,'PZ002',4),(99,'PZ007',2),(100,'PZ003',4),(100,'PZ010',3);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `order_status` enum('Completed','Cancelled','Processing') NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-01-06','12:53:43','Cancelled'),(2,'2023-01-12','22:35:56','Cancelled'),(3,'2023-01-31','21:41:11','Completed'),(4,'2023-01-07','22:14:21','Cancelled'),(5,'2023-01-08','17:28:19','Completed'),(6,'2023-01-24','11:49:27','Cancelled'),(7,'2023-01-20','22:29:02','Completed'),(8,'2023-01-22','13:58:34','Processing'),(9,'2023-01-20','15:53:27','Completed'),(10,'2023-01-20','15:45:55','Completed'),(11,'2023-01-09','17:14:18','Cancelled'),(12,'2023-01-10','22:30:58','Processing'),(13,'2023-01-09','21:24:09','Processing'),(14,'2023-01-12','14:46:57','Cancelled'),(15,'2023-01-05','20:21:33','Cancelled'),(16,'2023-01-18','14:30:17','Processing'),(17,'2023-01-14','20:15:45','Cancelled'),(18,'2023-01-29','22:01:20','Cancelled'),(19,'2023-01-02','16:04:17','Processing'),(20,'2023-01-15','17:47:28','Completed'),(21,'2023-01-29','21:50:19','Processing'),(22,'2023-01-19','21:13:17','Cancelled'),(23,'2023-01-24','11:33:57','Completed'),(24,'2023-01-20','21:20:42','Completed'),(25,'2023-01-12','08:06:03','Completed'),(26,'2023-01-02','08:19:12','Completed'),(27,'2023-01-12','17:53:29','Cancelled'),(28,'2023-01-16','18:56:34','Cancelled'),(29,'2023-01-29','19:11:04','Cancelled'),(30,'2023-01-18','11:19:28','Processing'),(31,'2023-01-23','12:33:06','Processing'),(32,'2023-01-18','15:04:30','Cancelled'),(33,'2023-01-23','17:53:17','Completed'),(34,'2023-01-01','09:49:45','Processing'),(35,'2023-01-14','17:34:52','Processing'),(36,'2023-01-31','09:46:36','Completed'),(37,'2023-01-21','09:11:38','Processing'),(38,'2023-01-12','20:57:05','Processing'),(39,'2023-01-21','10:39:00','Completed'),(40,'2023-01-06','13:22:39','Processing'),(41,'2023-01-31','13:21:53','Completed'),(42,'2023-01-11','15:26:27','Cancelled'),(43,'2023-01-03','16:52:47','Processing'),(44,'2023-01-17','12:48:05','Cancelled'),(45,'2023-01-11','12:33:42','Cancelled'),(46,'2023-01-21','10:25:54','Processing'),(47,'2023-01-26','22:42:35','Cancelled'),(48,'2023-01-12','15:07:36','Cancelled'),(49,'2023-01-26','13:30:54','Cancelled'),(50,'2023-01-21','17:31:24','Processing'),(51,'2023-01-23','20:51:59','Cancelled'),(52,'2023-01-05','19:21:31','Cancelled'),(53,'2023-01-30','12:05:51','Cancelled'),(54,'2023-01-20','21:04:38','Cancelled'),(55,'2023-01-21','12:13:39','Completed'),(56,'2023-01-11','22:46:02','Completed'),(57,'2023-01-29','12:58:54','Processing'),(58,'2023-01-31','14:15:19','Completed'),(59,'2023-01-21','18:40:24','Cancelled'),(60,'2023-01-18','11:55:12','Completed'),(61,'2023-01-04','21:46:27','Processing'),(62,'2023-01-26','10:55:59','Cancelled'),(63,'2023-01-18','13:58:24','Cancelled'),(64,'2023-01-10','10:20:40','Completed'),(65,'2023-01-07','21:32:11','Cancelled'),(66,'2023-01-11','10:52:59','Cancelled'),(67,'2023-01-09','08:20:01','Completed'),(68,'2023-01-04','20:20:14','Cancelled'),(69,'2023-01-11','10:57:24','Cancelled'),(70,'2023-01-29','19:04:10','Completed'),(71,'2023-01-06','19:21:22','Processing'),(72,'2023-01-05','18:57:13','Cancelled'),(73,'2023-01-27','18:03:42','Completed'),(74,'2023-01-23','21:56:53','Processing'),(75,'2023-01-17','14:22:55','Processing'),(76,'2023-01-01','08:55:11','Completed'),(77,'2023-01-26','15:37:22','Cancelled'),(78,'2023-01-18','11:39:43','Processing'),(79,'2023-01-05','22:48:05','Processing'),(80,'2023-01-16','15:14:37','Completed'),(81,'2023-01-14','18:32:26','Cancelled'),(82,'2023-01-07','09:33:17','Processing'),(83,'2023-01-23','15:46:28','Processing'),(84,'2023-01-10','13:29:38','Completed'),(85,'2023-01-09','22:28:48','Completed'),(86,'2023-01-07','18:06:53','Processing'),(87,'2023-01-16','11:51:10','Processing'),(88,'2023-01-14','14:36:25','Completed'),(89,'2023-01-16','22:45:02','Processing'),(90,'2023-01-20','13:56:01','Processing'),(91,'2023-01-31','08:56:16','Cancelled'),(92,'2023-01-20','08:11:43','Completed'),(93,'2023-01-15','17:48:53','Processing'),(94,'2023-01-27','12:06:40','Completed'),(95,'2023-01-31','20:34:26','Completed'),(96,'2023-01-15','17:02:57','Cancelled'),(97,'2023-01-18','18:40:40','Cancelled'),(98,'2023-01-08','16:40:40','Processing'),(99,'2023-01-24','09:21:26','Completed'),(100,'2023-01-19','09:40:27','Cancelled');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas` (
  `pizza_id` varchar(10) NOT NULL,
  `pizza_name` varchar(100) NOT NULL,
  `pizza_category` varchar(50) NOT NULL,
  `pizza_size` enum('S','M','L','XL') NOT NULL,
  `price_usd` decimal(6,2) NOT NULL,
  PRIMARY KEY (`pizza_id`),
  CONSTRAINT `pizzas_chk_1` CHECK ((`price_usd` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
INSERT INTO `pizzas` VALUES ('PZ001','Margherita','Classic','M',8.99),('PZ002','Pepperoni','Classic','L',12.99),('PZ003','BBQ Chicken','Chicken','L',14.99),('PZ004','Veggie Supreme','Veggie','M',10.99),('PZ005','Meat Lovers','Supreme','XL',16.99),('PZ006','Hawaiian','Classic','M',9.99),('PZ007','Spicy Italian','Spicy','L',13.50),('PZ008','Vegan Delight','Veggie','S',9.50),('PZ009','Four Cheese','Classic','XL',15.99),('PZ010','Chicken Alfredo','Chicken','M',11.99);
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pizza_sales_operations_analysis'
--

--
-- Dumping routines for database 'pizza_sales_operations_analysis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-06 20:46:32
