CREATE DATABASE  IF NOT EXISTS `raid_lfg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `raid_lfg`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: raid_lfg
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int NOT NULL,
  `raidId` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `timeCreated` datetime(6) DEFAULT NULL,
  `sherpa` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raidId_idx` (`raidId`),
  CONSTRAINT `raidId` FOREIGN KEY (`raidId`) REFERENCES `raid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phase`
--

DROP TABLE IF EXISTS `phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `raidId` int DEFAULT NULL,
  `position` int NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `raidId` (`raidId`),
  CONSTRAINT `phase_ibfk_1` FOREIGN KEY (`raidId`) REFERENCES `raid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phase`
--

LOCK TABLES `phase` WRITE;
/*!40000 ALTER TABLE `phase` DISABLE KEYS */;
INSERT INTO `phase` VALUES (1,1,1,'Castellum'),(2,1,2,'Royal Pools'),(3,1,2,'Pleasure Gardens'),(4,1,2,'Gauntlet'),(5,1,3,'Throne Room'),(6,2,1,'Leviathan Reactor'),(7,2,2,'Engine Room'),(8,2,3,'Argos\' Barrier'),(9,2,4,'Argos'),(10,3,1,'Statue Garden'),(11,3,2,'Power Conduit'),(12,3,3,'Celestial Observatory'),(13,3,4,'Val Ca’our'),(14,4,1,'Kalli the Corrupted'),(15,4,2,'Shuro Chi the Corrupted'),(16,4,3,'Morgeth the Spirekeeper'),(17,4,4,'The Vault'),(18,4,5,'Riven of a Thousand Voices'),(19,4,6,'Queenswalk'),(20,5,1,'Botza District'),(21,5,2,'Botza Underground'),(22,5,3,'Vault Access'),(23,5,4,'Insurrection Prime'),(24,6,1,'Witch\'s Ritual'),(25,6,2,'The Bridge'),(26,6,3,'Gahlran\'s Deception'),(27,6,4,'Gahlran, The Sorrow-Bearer'),(28,7,1,'Embrace'),(29,7,2,'Undergrowth'),(30,7,3,'The Consecrated Mind'),(31,7,4,'The Sanctified Mind');
/*!40000 ALTER TABLE `phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raid`
--

DROP TABLE IF EXISTS `raid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raid` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `image` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raid`
--

LOCK TABLES `raid` WRITE;
/*!40000 ALTER TABLE `raid` DISABLE KEYS */;
INSERT INTO `raid` VALUES (1,'Leviathan','https://stats.bungie.net/img/destiny_content/pgcr/raid_gluttony.jpg'),(2,'Eater of Worlds','https://stats.bungie.net/img/destiny_content/pgcr/raids_leviathan_eater_of_worlds.jpg'),(3,'Spire of Stars','https://stats.bungie.net/img/destiny_content/pgcr/raid_greed.jpg'),(4,'The Last Wish','https://stats.bungie.net/img/destiny_content/pgcr/raid_beanstalk.jpg'),(5,'Scourge of the Past','https://stats.bungie.net/img/destiny_content/pgcr/raids.1305rh0093145r13t5hn10tnz.raid_sunset.jpg'),(6,'Crown of Sorrow','https://stats.bungie.net/img/destiny_content/pgcr/raid_eclipse.jpg'),(7,'Garden of Salvation','https://stats.bungie.net/img/destiny_content/pgcr/raid_garden_of_salvation.jpg');
/*!40000 ALTER TABLE `raid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_games`
--

DROP TABLE IF EXISTS `user_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_games` (
  `gameId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `leader` tinyint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  KEY `gameId_idx` (`gameId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `gameId` FOREIGN KEY (`gameId`) REFERENCES `games` (`id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_games`
--

LOCK TABLES `user_games` WRITE;
/*!40000 ALTER TABLE `user_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_games` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-25 19:52:54
