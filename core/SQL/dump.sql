-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dota
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB-1:10.5.5+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities` (
  `hero_name` varchar(255) NOT NULL,
  `ability_name` varchar(255) NOT NULL,
  `manacost` smallint(6) NOT NULL,
  `cooldown` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`hero_name`,`ability_name`),
  CONSTRAINT `abilities_ibfk_1` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`),
  CONSTRAINT `abilities_ibfk_2` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_stats`
--

DROP TABLE IF EXISTS `base_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_stats` (
  `hero_name` varchar(255) NOT NULL,
  `turn_rate` float NOT NULL,
  `hp_regen` float NOT NULL,
  `mana_regen` float NOT NULL,
  `sight_range` float NOT NULL,
  `attack_range` float NOT NULL,
  `missile_range` float NOT NULL DEFAULT 0,
  `attack_duration` int(11) NOT NULL,
  `cast_duration` int(11) NOT NULL,
  `magic_resist` float NOT NULL DEFAULT 0,
  `attack_speed` float NOT NULL,
  `attack_time` int(11) NOT NULL,
  KEY `hero_name` (`hero_name`),
  CONSTRAINT `base_stats_ibfk_1` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`),
  CONSTRAINT `base_stats_ibfk_2` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_stats`
--

LOCK TABLES `base_stats` WRITE;
/*!40000 ALTER TABLE `base_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heroes` (
  `name` varchar(255) NOT NULL,
  `faction` varchar(255) NOT NULL,
  `primary_attribute` varchar(255) NOT NULL,
  `lore` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_description`
--

DROP TABLE IF EXISTS `match_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_description` (
  `match_id` varchar(255) NOT NULL,
  `steam_name` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `hero_name` varchar(255) NOT NULL,
  `team_1` varchar(255) NOT NULL,
  `team_2` varchar(255) NOT NULL,
  PRIMARY KEY (`match_id`,`steam_id`),
  KEY `steam_id` (`steam_id`),
  CONSTRAINT `match_description_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_description_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_description_ibfk_3` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `match_description_ibfk_4` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_description_ibfk_5` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_description`
--

LOCK TABLES `match_description` WRITE;
/*!40000 ALTER TABLE `match_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_performance`
--

DROP TABLE IF EXISTS `match_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `match_performance` (
  `match_id` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `kills` smallint(6) NOT NULL DEFAULT 0,
  `deaths` smallint(6) NOT NULL DEFAULT 0,
  `assists` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`match_id`,`steam_id`),
  KEY `steam_id` (`steam_id`),
  CONSTRAINT `match_performance_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_performance_ibfk_2` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `match_performance_ibfk_3` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_performance_ibfk_4` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_performance`
--

LOCK TABLES `match_performance` WRITE;
/*!40000 ALTER TABLE `match_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `match_id` varchar(255) NOT NULL,
  `winner` varchar(255) NOT NULL,
  `mvp` varchar(255) NOT NULL,
  `loser` varchar(255) NOT NULL,
  `tournament` varchar(255) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `tournament` (`tournament`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`tournament`) REFERENCES `tournament_type` (`tournament`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`tournament`) REFERENCES `tournament_type` (`tournament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participating_teams`
--

DROP TABLE IF EXISTS `participating_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participating_teams` (
  `match_id` varchar(255) NOT NULL,
  `team_1` varchar(255) NOT NULL,
  `team_2` varchar(255) NOT NULL,
  PRIMARY KEY (`match_id`),
  CONSTRAINT `participating_teams_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `participating_teams_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `participating_teams_ibfk_3` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participating_teams`
--

LOCK TABLES `participating_teams` WRITE;
/*!40000 ALTER TABLE `participating_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `participating_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_characters`
--

DROP TABLE IF EXISTS `player_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_characters` (
  `hero_name` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `wins` smallint(6) NOT NULL,
  `matches_played` smallint(6) NOT NULL,
  `win_rate` float NOT NULL,
  PRIMARY KEY (`steam_id`,`hero_name`),
  KEY `hero_name` (`hero_name`),
  CONSTRAINT `player_characters_ibfk_1` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`),
  CONSTRAINT `player_characters_ibfk_2` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_characters`
--

LOCK TABLES `player_characters` WRITE;
/*!40000 ALTER TABLE `player_characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `steam_name` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_of_origin` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `signature_hero` varchar(255) NOT NULL,
  `playtime` smallint(6) DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('Shivansh','11113333444455567','Shivansh','Shivansh','2001-02-21','Shivansh',500,'Active'),('Zshan','33333333333333333','Zeeshan','India','2001-08-06','Drow Ranger',333,'Active'),('ltc','66666666666666666','Shanjeet','India','2001-01-08','Razor',4000,'Active');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `steam_id` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  PRIMARY KEY (`steam_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `team_name` varchar(255) NOT NULL,
  `player` varchar(255) NOT NULL,
  `losses` smallint(6) NOT NULL,
  `wins` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_player`
--

DROP TABLE IF EXISTS `teams_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_player` (
  `player_id` varchar(255) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `join_date` date NOT NULL,
  `participation` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_player`
--

LOCK TABLES `teams_player` WRITE;
/*!40000 ALTER TABLE `teams_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_teams`
--

DROP TABLE IF EXISTS `teams_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_teams` (
  `team_1` varchar(255) NOT NULL,
  `team_2` varchar(255) NOT NULL,
  `player_11` varchar(255) NOT NULL,
  `player_21` varchar(255) NOT NULL,
  `losses` smallint(6) DEFAULT 0,
  `wins` smallint(6) DEFAULT 0,
  KEY `player_11` (`player_11`),
  KEY `player_21` (`player_21`),
  CONSTRAINT `teams_teams_ibfk_1` FOREIGN KEY (`player_11`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `teams_teams_ibfk_2` FOREIGN KEY (`player_21`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `teams_teams_ibfk_3` FOREIGN KEY (`player_11`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `teams_teams_ibfk_4` FOREIGN KEY (`player_21`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_teams`
--

LOCK TABLES `teams_teams` WRITE;
/*!40000 ALTER TABLE `teams_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_type`
--

DROP TABLE IF EXISTS `tournament_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tournament_type` (
  `tournament` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`tournament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_type`
--

LOCK TABLES `tournament_type` WRITE;
/*!40000 ALTER TABLE `tournament_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tournament_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-03 18:33:26
