-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (x86_64)
--
-- Host: localhost    Database: project_db
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `actors_first_name_last_name_uindex` (`first_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Alex','O\'Loughlin'),(11,'Beulah','Koale'),(6,'Chi','McBride'),(4,'Daniel','Dae Kim'),(15,'Dennis','Chun'),(5,'Grace','Park'),(7,'Ian','Anthony Dale'),(8,'Jorge','Garcia'),(13,'Kimee','Balmilero'),(9,'Masi','Oka'),(10,'Meaghan','Rath'),(12,'Michelle','Borth'),(2,'Scott','Caan'),(3,'Taylor','Willy'),(14,'Teilor','Grubbs');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_to_actor`
--

DROP TABLE IF EXISTS `character_to_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_to_actor` (
  `character_id` int NOT NULL,
  `actor_id` int NOT NULL,
  PRIMARY KEY (`character_id`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_to_actor`
--

LOCK TABLES `character_to_actor` WRITE;
/*!40000 ALTER TABLE `character_to_actor` DISABLE KEYS */;
INSERT INTO `character_to_actor` VALUES (2,1),(3,2),(4,3),(5,4),(6,5),(7,6),(8,15),(9,9),(10,8),(11,7),(12,12),(13,11),(14,10),(15,13);
/*!40000 ALTER TABLE `character_to_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL,
  `first_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `title` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characters_first_name_last_name_index` (`first_name`,`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (2,'Steve','McGarrett',NULL),(3,'Danny','Williams',NULL),(4,'Kamekona','',NULL),(5,'Chin Ho','Kelly',NULL),(6,'Kono','Kalakaua',NULL),(7,'Lou','Grover',NULL),(8,'Duke','Lukela','Sgt.'),(9,'Max','Bergman',NULL),(10,'Jerry','Ortega',NULL),(11,'Adam','Noshimuri',NULL),(12,'Catherine','Rollins',NULL),(13,'Junior','Reigns',NULL),(14,'Tani','Rey',NULL),(15,'Noelani','Cunha','Dr.');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-24 20:20:57
