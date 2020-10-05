-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abilities` (
  `hero_name` varchar(255) NOT NULL,
  `ability_name` varchar(255) NOT NULL,
  `manacost` smallint NOT NULL,
  `cooldown` smallint NOT NULL,
  `description` text,
  PRIMARY KEY (`hero_name`,`ability_name`),
  CONSTRAINT `abilities_ibfk_1` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES ('Bane','Brain Sap',90,14,'Feasts on the vital energies of the target'),('Bane','Feind\'s Grip',200,120,'Grips an enemy unit with damage and immobility'),('Bane','Nightmare',165,22,'Puts the target to sleep'),('Chen','Divine Favour',130,140,'Health regeneration'),('Chen','Hand of god',250,160,'Heals an ally'),('Chen','Holy Persuasion',90,15,'Takes control of a creep'),('Chen','Penitence',70,14,'Slows the enemy'),('Enigma','Black Hole',300,200,'Summons a vortex'),('Enigma','Demonic Conversion',140,35,'Transforms a creep into a creature'),('Enigma','Malefice',100,18,'Focus\'s energy on target'),('Enigma','Midnight Pulse',50,50,'Steeps an Area in dark resonance'),('Invoker','Cold Snap',100,20,'Draws heat from the enemy and causes damage'),('Invoker','Exort',0,0,'Increases attack damage'),('Invoker','Quas',0,0,'Health regeneration'),('Invoker','Wex',0,0,'Increases attack speed'),('Io','Overcharge',40,22,'HP regenations'),('Io','Relocate',175,90,'Teleports Io to a different place'),('Io','Spirits',120,26,'Summon five particles'),('Io','Tether',40,12,'Bonus movement speed'),('Lone Druid','Savage Roar',50,38,'Causes the nearby enemies to flee'),('Lone Druid','Spirit Link',0,0,'Increases the damage dealt'),('Lone Druid','Summon Spirit Bear',75,120,'Summons a powerful Spirit Bear that can equip items'),('Lone Druid','True Form',200,100,'Morphs To Himself into a raging bear'),('Magnus','Empower',45,8,'Gives an ally boost of damage'),('Magnus','Reverse Polarity',200,130,'Changes properties of matter and sucks all the enemies towards him'),('Magnus','Shockwave',90,13,'Sends a wave of force dealing damage'),('Magnus','Skewer',80,26,'Magnus rushes forward with his massive tusk'),('Meepo','Divided We Stand',0,0,'Summons a duplicate of himself'),('Meepo','Earthbind',100,20,'Tosses a net at the target point'),('Meepo','Poof',80,12,'Draws mystical energies from the earth'),('Meepo','Ransack',0,0,'Steals health from target after each strike'),('Mirana','Leap',40,0,'Leaps forward into battle'),('Mirana','MoonLight Shadow',125,140,'Grants Invisibility'),('Mirana','Sacred Arrow',100,18,'Fires a long range with precision'),('Mirana','Starstorm',80,12,'Calls down a wave meteors'),('Monkey King','Boundless Strike',100,22,'Elarges his staff and strikes it'),('Monkey King','Mischief',0,20,'Changes shape to decieve opponents'),('Monkey King','Primal Spring',100,19,'Springs out from his Tree perch and does damage'),('Monkey King','Wukong\'s Command',100,130,'Creates a circular formation of soldiers and spreads them from his position'),('Morphling','Adaptive Strike',80,10,'Launches a surge of water'),('Morphling','Morph',50,160,'Changes form to match the targeted enemy'),('Morphling','Waveform',150,20,'Dissolves the enemies'),('Puck','Dream Coil',100,70,'Creates a coil of volatile Magic'),('Puck','Illusory orb',80,13,'Launches a magic orb that floats in a straight path'),('Puck','Phase Shift',0,6,'Shifts into another dimension with no harm'),('Puck','Waning Rift',100,16,'Teleports to a location and deals splash damage'),('Rubick','Arcane Supremacy',0,0,'Allows to deal with more damage'),('Rubick','Fade Bolt',135,16,'Creates a powerful of arcane energy'),('Rubick','Spell Steal',25,20,'Steals a spell of other hero'),('Rubick','Telekenisis',125,34,'Lifts the enemy'),('Terrorblade','Conjure Image',70,16,'Creates an Illusion'),('Terrorblade','Metamorphisis',100,155,'Transforms into a powerful demons'),('Terrorblade','Reflection',50,22,'Brings forth an invulnerable reflection'),('Terrorblade','Sunder',200,120,'Severs health from target and user'),('Terrorblade','Terror Wave',75,90,'Creates a Terror Wave');
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_stats`
--

DROP TABLE IF EXISTS `base_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_stats` (
  `hero_name` varchar(255) NOT NULL,
  `turn_rate` float NOT NULL,
  `hp_regen` float NOT NULL,
  `mana_regen` float NOT NULL,
  `sight_range` float NOT NULL,
  `attack_range` float NOT NULL,
  `missile_range` float NOT NULL DEFAULT '0',
  `attack_duration` int NOT NULL,
  `cast_duration` int NOT NULL,
  `magic_resist` float NOT NULL DEFAULT '0',
  `attack_speed` float NOT NULL,
  `attack_time` int NOT NULL,
  PRIMARY KEY (`hero_name`),
  CONSTRAINT `base_stats_ibfk_1` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_stats`
--

LOCK TABLES `base_stats` WRITE;
/*!40000 ALTER TABLE `base_stats` DISABLE KEYS */;
INSERT INTO `base_stats` VALUES ('Bane',0.6,0,0,1800,400,900,0,1,0.25,100,2),('Chen',0.6,0,0,1800,650,1100,1,0,0.25,100,2),('Enigma',0.5,0,0,1800,500,900,0,0,0.25,100,2),('Invoker',0.5,0,0,1800,600,900,0,0,0.25,100,2),('Io',0.7,0,0,1800,500,1200,0,0,0.25,100,2),('Lone Druid',0.5,0.25,0,1800,550,900,0,1,0.25,100,2),('Magnus',0.8,0.5,0,1800,150,900,1,0,0.25,100,2),('Meepo',0.6,0.25,0,1800,150,900,0,1,0.25,100,2),('Mirana',0.5,0,0.4,1800,630,900,0,1,0.25,115,2),('Monkey King',0.6,1.5,0,1800,300,900,0,0,0.25,100,2),('Morphling',0.6,0,0,1800,350,1300,1,0,0.25,100,2),('Puck',0.5,0.5,0,1800,550,900,1,0,0.25,100,2),('Rubick',0.7,0,0,1800,550,1125,0,0,0.25,100,2),('Terrorblade',0.5,1.5,0,1800,150,900,0,1,0.25,100,2);
/*!40000 ALTER TABLE `base_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroes` (
  `name` varchar(255) NOT NULL,
  `faction` varchar(255) NOT NULL,
  `primary_attribute` varchar(255) NOT NULL,
  `lore` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES ('Bane','Dire','Agility','...'),('Chen','Radiant','Strength','...'),('Enigma','Dire','Strength','...'),('Invoker','Dire','Strength','...'),('Io','Radiant','Intelligence','...'),('Lone Druid','Radiant','Agility','...'),('Magnus','Dire','Strength','...'),('Meepo','Dire','Strength','...'),('Mirana','Radiant','Intelligence','...'),('Monkey King','Radiant','Agility','...'),('Morphling','Radiant','Agility','...'),('Puck','Radiant','Intelligence','...'),('Rubick','Radiant','Intelligence','...'),('Terrorblade','Dire','Agility','...');
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_description`
--

DROP TABLE IF EXISTS `match_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_description` (
  `match_id` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `hero_name` varchar(255) NOT NULL,
  `team_1` varchar(255) NOT NULL,
  `team_2` varchar(255) NOT NULL,
  PRIMARY KEY (`match_id`,`steam_id`),
  KEY `steam_id` (`steam_id`),
  CONSTRAINT `match_description_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_description_ibfk_2` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_description`
--

LOCK TABLES `match_description` WRITE;
/*!40000 ALTER TABLE `match_description` DISABLE KEYS */;
INSERT INTO `match_description` VALUES ('5601416133','10574291456968494','Magnus','Team Secret','OG'),('5601416133','13245128645328723','Lone Druid','Team Secret','OG'),('5601416133','15532938601031196','Terrorblade','Team Secret','OG'),('5601416133','18074007267880805','Enigma','Team Secret','OG'),('5601416133','26370449891905441','Monkey King','Team Secret','OG'),('5601416133','27304069370599303','Chen','Team Secret','OG'),('5601416133','33664981377079473','Invoker','Team Secret','OG'),('5601416133','43027399174998579','Rubick','Team Secret','OG'),('5601416133','59559627923289016','Rubick','Team Secret','OG'),('5601416133','75732735680263951','Chen','Team Secret','OG'),('5627878427','10574291456968494','Magnus','OG','Alliance'),('5627878427','13496213361616567','Io','OG','Alliance'),('5627878427','21910905722633743','Morphling','OG','Alliance'),('5627878427','26370449891905441','Monkey King','OG','Alliance'),('5627878427','27304069370599303','Chen','OG','Alliance'),('5627878427','33664981377079473','Invoker','OG','Alliance'),('5627878427','41840792526073040','Bane','OG','Alliance'),('5627878427','43027399174998579','Rubick','OG','Alliance'),('5627878427','95472279822946392','Puck','OG','Alliance'),('5627878427','98356213072479694','Magnus','OG','Alliance'),('5630394671','13245128645328723','Lone Druid','Alliance','Team Secret'),('5630394671','13496213361616567','Io','Alliance','Team Secret'),('5630394671','15532938601031196','Terrorblade','Alliance','Team Secret'),('5630394671','18074007267880805','Enigma','Alliance','Team Secret'),('5630394671','21910905722633743','Morphling','Alliance','Team Secret'),('5630394671','41840792526073040','Bane','Alliance','Team Secret'),('5630394671','59559627923289016','Rubick','Alliance','Team Secret'),('5630394671','75732735680263951','Chen','Alliance','Team Secret'),('5630394671','95472279822946392','Puck','Alliance','Team Secret'),('5630394671','98356213072479694','Magnus','Alliance','Team Secret'),('5632112427','13245128645328723','Lone Druid','Cloud9','Team Secret'),('5632112427','15532938601031196','Terrorblade','Cloud9','Team Secret'),('5632112427','18074007267880805','Enigma','Cloud9','Team Secret'),('5632112427','35743610291874665','Meepo','Cloud9','Team Secret'),('5632112427','46432296765015628','Terrorblade','Cloud9','Team Secret'),('5632112427','59559627923289016','Rubick','Cloud9','Team Secret'),('5632112427','66723874916363400','Io','Cloud9','Team Secret'),('5632112427','75732735680263951','Chen','Cloud9','Team Secret'),('5632112427','81774286793421101','Rubick','Cloud9','Team Secret'),('5632112427','94224382114845672','Mirana','Cloud9','Team Secret'),('5632211427','10574291456968494','Magnus','OG','Cloud9'),('5632211427','26370449891905441','Monkey King','OG','Cloud9'),('5632211427','27304069370599303','Chen','OG','Cloud9'),('5632211427','33664981377079473','Invoker','OG','Cloud9'),('5632211427','35743610291874665','Meepo','OG','Cloud9'),('5632211427','43027399174998579','Rubick','OG','Cloud9'),('5632211427','46432296765015628','Terrorblade','OG','Cloud9'),('5632211427','66723874916363400','Io','OG','Cloud9'),('5632211427','81774286793421101','Rubick','OG','Cloud9'),('5632211427','94224382114845672','Mirana','OG','Cloud9'),('5632422427','13496213361616567','Io','Cloud9','Alliance'),('5632422427','21910905722633743','Morphling','Cloud9','Alliance'),('5632422427','35743610291874665','Meepo','Cloud9','Alliance'),('5632422427','41840792526073040','Bane','Cloud9','Alliance'),('5632422427','46432296765015628','Terrorblade','Cloud9','Alliance'),('5632422427','66723874916363400','Io','Cloud9','Alliance'),('5632422427','81774286793421101','Rubick','Cloud9','Alliance'),('5632422427','94224382114845672','Mirana','Cloud9','Alliance'),('5632422427','95472279822946392','Puck','Cloud9','Alliance'),('5632422427','98356213072479694','Magnus','Cloud9','Alliance');
/*!40000 ALTER TABLE `match_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_performance`
--

DROP TABLE IF EXISTS `match_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_performance` (
  `match_id` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `kills` smallint NOT NULL DEFAULT '0',
  `deaths` smallint NOT NULL DEFAULT '0',
  `assists` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`match_id`,`steam_id`),
  KEY `steam_id` (`steam_id`),
  CONSTRAINT `match_performance_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`),
  CONSTRAINT `match_performance_ibfk_2` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_performance`
--

LOCK TABLES `match_performance` WRITE;
/*!40000 ALTER TABLE `match_performance` DISABLE KEYS */;
INSERT INTO `match_performance` VALUES ('5601416133','10574291456968494',13,15,4),('5601416133','13245128645328723',1,2,0),('5601416133','15532938601031196',3,1,1),('5601416133','18074007267880805',5,5,2),('5601416133','26370449891905441',17,13,2),('5601416133','27304069370599303',15,12,1),('5601416133','33664981377079473',21,9,13),('5601416133','43027399174998579',8,10,7),('5601416133','59559627923289016',10,8,1),('5601416133','75732735680263951',9,10,4),('5627878427','10574291456968494',15,8,6),('5627878427','13496213361616567',13,5,2),('5627878427','21910905722633743',1,3,2),('5627878427','26370449891905441',13,15,4),('5627878427','27304069370599303',19,8,3),('5627878427','33664981377079473',15,12,1),('5627878427','41840792526073040',5,5,2),('5627878427','43027399174998579',9,10,4),('5627878427','95472279822946392',10,3,12),('5627878427','98356213072479694',5,16,2),('5630394671','13245128645328723',12,15,4),('5630394671','13496213361616567',15,8,6),('5630394671','15532938601031196',25,10,9),('5630394671','18074007267880805',2,13,0),('5630394671','21910905722633743',10,3,10),('5630394671','41840792526073040',16,10,12),('5630394671','59559627923289016',10,6,2),('5630394671','75732735680263951',13,5,2),('5630394671','95472279822946392',3,15,2),('5630394671','98356213072479694',6,10,2),('5632112427','13245128645328723',14,12,1),('5632112427','15532938601031196',15,10,16),('5632112427','18074007267880805',2,5,1),('5632112427','35743610291874665',10,8,2),('5632112427','46432296765015628',1,3,2),('5632112427','59559627923289016',4,12,3),('5632112427','66723874916363400',10,7,2),('5632112427','75732735680263951',10,8,12),('5632112427','81774286793421101',5,16,2),('5632112427','94224382114845672',11,13,3),('5632211427','10574291456968494',17,13,2),('5632211427','26370449891905441',15,10,16),('5632211427','27304069370599303',3,3,3),('5632211427','33664981377079473',20,10,11),('5632211427','35743610291874665',11,13,3),('5632211427','43027399174998579',8,10,7),('5632211427','46432296765015628',15,12,1),('5632211427','66723874916363400',1,3,2),('5632211427','81774286793421101',10,8,1),('5632211427','94224382114845672',1,2,0),('5632422427','13496213361616567',4,12,3),('5632422427','21910905722633743',15,8,10),('5632422427','35743610291874665',1,2,0),('5632422427','41840792526073040',3,3,3),('5632422427','46432296765015628',13,15,4),('5632422427','66723874916363400',14,12,1),('5632422427','81774286793421101',10,8,1),('5632422427','94224382114845672',11,13,3),('5632422427','95472279822946392',3,1,1),('5632422427','98356213072479694',10,3,12);
/*!40000 ALTER TABLE `match_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` varchar(255) NOT NULL,
  `winner` varchar(255) NOT NULL,
  `mvp` varchar(255) NOT NULL,
  `loser` varchar(255) NOT NULL,
  `tournament` varchar(255) NOT NULL,
  `duration` smallint NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `tournament` (`tournament`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`tournament`) REFERENCES `tournament_type` (`tournament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES ('5601416133','OG','Midone','Team Secret','OMEGA League',2034),('5627878427','OG','N0tail','Alliance','AMD SAPPHIRE OGA DOTA PIT',2157),('5630394671','Team Secret','Nisha','Alliance','AMD SAPPHIRE OGA DOTA PIT',1757),('5632112427','Cloud9','MISERY','Team Secret','OMEGA League',2301),('5632211427','OG','Midone','Cloud9','AMD SAPPHIRE OGA DOTA PIT',2014),('5632422427','Alliance','Nikobaby','Cloud9','AMD SAPPHIRE OGA DOTA PIT',2014);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participating_teams`
--

DROP TABLE IF EXISTS `participating_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participating_teams` (
  `match_id` varchar(255) NOT NULL,
  `team_1` varchar(255) NOT NULL,
  `team_2` varchar(255) NOT NULL,
  PRIMARY KEY (`match_id`),
  CONSTRAINT `participating_teams_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participating_teams`
--

LOCK TABLES `participating_teams` WRITE;
/*!40000 ALTER TABLE `participating_teams` DISABLE KEYS */;
INSERT INTO `participating_teams` VALUES ('5601416133','OG','Team Secret'),('5627878427','OG','Alliance'),('5630394671','Team Secret','Alliance'),('5632112427','Cloud9','Team Secret'),('5632211427','OG','Cloud9'),('5632422427','Alliance','Cloud9');
/*!40000 ALTER TABLE `participating_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_characters`
--

DROP TABLE IF EXISTS `player_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_characters` (
  `hero_name` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `wins` smallint NOT NULL,
  `matches_played` smallint NOT NULL,
  PRIMARY KEY (`hero_name`,`steam_id`),
  KEY `steam_id` (`steam_id`),
  CONSTRAINT `player_characters_ibfk_1` FOREIGN KEY (`hero_name`) REFERENCES `heroes` (`name`),
  CONSTRAINT `player_characters_ibfk_2` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_characters`
--

LOCK TABLES `player_characters` WRITE;
/*!40000 ALTER TABLE `player_characters` DISABLE KEYS */;
INSERT INTO `player_characters` VALUES ('Bane','10574291456968494',0,0),('Bane','13245128645328723',0,0),('Bane','13496213361616567',0,0),('Bane','15532938601031196',0,0),('Bane','18074007267880805',0,0),('Bane','21910905722633743',0,0),('Bane','26370449891905441',0,0),('Bane','27304069370599303',0,0),('Bane','33664981377079473',0,0),('Bane','35743610291874665',0,0),('Bane','41840792526073040',1,3),('Bane','43027399174998579',0,0),('Bane','46432296765015628',0,0),('Bane','59559627923289016',0,0),('Bane','66723874916363400',0,0),('Bane','75732735680263951',0,0),('Bane','81774286793421101',0,0),('Bane','94224382114845672',0,0),('Bane','95472279822946392',0,0),('Bane','98356213072479694',0,0),('Chen','10574291456968494',0,0),('Chen','13245128645328723',0,0),('Chen','13496213361616567',0,0),('Chen','15532938601031196',0,0),('Chen','18074007267880805',0,0),('Chen','21910905722633743',0,0),('Chen','26370449891905441',0,0),('Chen','27304069370599303',3,3),('Chen','33664981377079473',0,0),('Chen','35743610291874665',0,0),('Chen','41840792526073040',0,0),('Chen','43027399174998579',0,0),('Chen','46432296765015628',0,0),('Chen','59559627923289016',0,0),('Chen','66723874916363400',0,0),('Chen','75732735680263951',1,3),('Chen','81774286793421101',0,0),('Chen','94224382114845672',0,0),('Chen','95472279822946392',0,0),('Chen','98356213072479694',0,0),('Enigma','10574291456968494',0,0),('Enigma','13245128645328723',0,0),('Enigma','13496213361616567',0,0),('Enigma','15532938601031196',0,0),('Enigma','18074007267880805',1,3),('Enigma','21910905722633743',0,0),('Enigma','26370449891905441',0,0),('Enigma','27304069370599303',0,0),('Enigma','33664981377079473',0,0),('Enigma','35743610291874665',0,0),('Enigma','41840792526073040',0,0),('Enigma','43027399174998579',0,0),('Enigma','46432296765015628',0,0),('Enigma','59559627923289016',0,0),('Enigma','66723874916363400',0,0),('Enigma','75732735680263951',0,0),('Enigma','81774286793421101',0,0),('Enigma','94224382114845672',0,0),('Enigma','95472279822946392',0,0),('Enigma','98356213072479694',0,0),('Invoker','10574291456968494',0,0),('Invoker','13245128645328723',0,0),('Invoker','13496213361616567',0,0),('Invoker','15532938601031196',0,0),('Invoker','18074007267880805',0,0),('Invoker','21910905722633743',0,0),('Invoker','26370449891905441',0,0),('Invoker','27304069370599303',0,0),('Invoker','33664981377079473',3,3),('Invoker','35743610291874665',0,0),('Invoker','41840792526073040',0,0),('Invoker','43027399174998579',0,0),('Invoker','46432296765015628',0,0),('Invoker','59559627923289016',0,0),('Invoker','66723874916363400',0,0),('Invoker','75732735680263951',0,0),('Invoker','81774286793421101',0,0),('Invoker','94224382114845672',0,0),('Invoker','95472279822946392',0,0),('Invoker','98356213072479694',0,0),('Io','10574291456968494',0,0),('Io','13245128645328723',0,0),('Io','13496213361616567',1,3),('Io','15532938601031196',0,0),('Io','18074007267880805',0,0),('Io','21910905722633743',0,0),('Io','26370449891905441',0,0),('Io','27304069370599303',0,0),('Io','33664981377079473',0,0),('Io','35743610291874665',0,0),('Io','41840792526073040',0,0),('Io','43027399174998579',0,0),('Io','46432296765015628',0,0),('Io','59559627923289016',0,0),('Io','66723874916363400',1,3),('Io','75732735680263951',0,0),('Io','81774286793421101',0,0),('Io','94224382114845672',0,0),('Io','95472279822946392',0,0),('Io','98356213072479694',0,0),('Lone Druid','10574291456968494',0,0),('Lone Druid','13245128645328723',1,3),('Lone Druid','13496213361616567',0,0),('Lone Druid','15532938601031196',0,0),('Lone Druid','18074007267880805',0,0),('Lone Druid','21910905722633743',0,0),('Lone Druid','26370449891905441',0,0),('Lone Druid','27304069370599303',0,0),('Lone Druid','33664981377079473',0,0),('Lone Druid','35743610291874665',0,0),('Lone Druid','41840792526073040',0,0),('Lone Druid','43027399174998579',0,0),('Lone Druid','46432296765015628',0,0),('Lone Druid','59559627923289016',0,0),('Lone Druid','66723874916363400',0,0),('Lone Druid','75732735680263951',0,0),('Lone Druid','81774286793421101',0,0),('Lone Druid','94224382114845672',0,0),('Lone Druid','95472279822946392',0,0),('Lone Druid','98356213072479694',0,0),('Magnus','10574291456968494',3,3),('Magnus','13245128645328723',0,0),('Magnus','13496213361616567',0,0),('Magnus','15532938601031196',0,0),('Magnus','18074007267880805',0,0),('Magnus','21910905722633743',0,0),('Magnus','26370449891905441',0,0),('Magnus','27304069370599303',0,0),('Magnus','33664981377079473',0,0),('Magnus','35743610291874665',0,0),('Magnus','41840792526073040',0,0),('Magnus','43027399174998579',0,0),('Magnus','46432296765015628',0,0),('Magnus','59559627923289016',0,0),('Magnus','66723874916363400',0,0),('Magnus','75732735680263951',0,0),('Magnus','81774286793421101',0,0),('Magnus','94224382114845672',0,0),('Magnus','95472279822946392',0,0),('Magnus','98356213072479694',1,3),('Meepo','10574291456968494',0,0),('Meepo','13245128645328723',0,0),('Meepo','13496213361616567',0,0),('Meepo','15532938601031196',0,0),('Meepo','18074007267880805',0,0),('Meepo','21910905722633743',0,0),('Meepo','26370449891905441',0,0),('Meepo','27304069370599303',0,0),('Meepo','33664981377079473',0,0),('Meepo','35743610291874665',1,3),('Meepo','41840792526073040',0,0),('Meepo','43027399174998579',0,0),('Meepo','46432296765015628',0,0),('Meepo','59559627923289016',0,0),('Meepo','66723874916363400',0,0),('Meepo','75732735680263951',0,0),('Meepo','81774286793421101',0,0),('Meepo','94224382114845672',0,0),('Meepo','95472279822946392',0,0),('Meepo','98356213072479694',0,0),('Mirana','10574291456968494',0,0),('Mirana','13245128645328723',0,0),('Mirana','13496213361616567',0,0),('Mirana','15532938601031196',0,0),('Mirana','18074007267880805',0,0),('Mirana','21910905722633743',0,0),('Mirana','26370449891905441',0,0),('Mirana','27304069370599303',0,0),('Mirana','33664981377079473',0,0),('Mirana','35743610291874665',0,0),('Mirana','41840792526073040',0,0),('Mirana','43027399174998579',0,0),('Mirana','46432296765015628',0,0),('Mirana','59559627923289016',0,0),('Mirana','66723874916363400',0,0),('Mirana','75732735680263951',0,0),('Mirana','81774286793421101',0,0),('Mirana','94224382114845672',1,3),('Mirana','95472279822946392',0,0),('Mirana','98356213072479694',0,0),('Monkey King','10574291456968494',0,0),('Monkey King','13245128645328723',0,0),('Monkey King','13496213361616567',0,0),('Monkey King','15532938601031196',0,0),('Monkey King','18074007267880805',0,0),('Monkey King','21910905722633743',0,0),('Monkey King','26370449891905441',3,3),('Monkey King','27304069370599303',0,0),('Monkey King','33664981377079473',0,0),('Monkey King','35743610291874665',0,0),('Monkey King','41840792526073040',0,0),('Monkey King','43027399174998579',0,0),('Monkey King','46432296765015628',0,0),('Monkey King','59559627923289016',0,0),('Monkey King','66723874916363400',0,0),('Monkey King','75732735680263951',0,0),('Monkey King','81774286793421101',0,0),('Monkey King','94224382114845672',0,0),('Monkey King','95472279822946392',0,0),('Monkey King','98356213072479694',0,0),('Morphling','10574291456968494',0,0),('Morphling','13245128645328723',0,0),('Morphling','13496213361616567',0,0),('Morphling','15532938601031196',0,0),('Morphling','18074007267880805',0,0),('Morphling','21910905722633743',1,3),('Morphling','26370449891905441',0,0),('Morphling','27304069370599303',0,0),('Morphling','33664981377079473',0,0),('Morphling','35743610291874665',0,0),('Morphling','41840792526073040',0,0),('Morphling','43027399174998579',0,0),('Morphling','46432296765015628',0,0),('Morphling','59559627923289016',0,0),('Morphling','66723874916363400',0,0),('Morphling','75732735680263951',0,0),('Morphling','81774286793421101',0,0),('Morphling','94224382114845672',0,0),('Morphling','95472279822946392',0,0),('Morphling','98356213072479694',0,0),('Puck','10574291456968494',0,0),('Puck','13245128645328723',0,0),('Puck','13496213361616567',0,0),('Puck','15532938601031196',0,0),('Puck','18074007267880805',0,0),('Puck','21910905722633743',0,0),('Puck','26370449891905441',0,0),('Puck','27304069370599303',0,0),('Puck','33664981377079473',0,0),('Puck','35743610291874665',0,0),('Puck','41840792526073040',0,0),('Puck','43027399174998579',0,0),('Puck','46432296765015628',0,0),('Puck','59559627923289016',0,0),('Puck','66723874916363400',0,0),('Puck','75732735680263951',0,0),('Puck','81774286793421101',0,0),('Puck','94224382114845672',0,0),('Puck','95472279822946392',1,3),('Puck','98356213072479694',0,0),('Rubick','10574291456968494',0,0),('Rubick','13245128645328723',0,0),('Rubick','13496213361616567',0,0),('Rubick','15532938601031196',0,0),('Rubick','18074007267880805',0,0),('Rubick','21910905722633743',0,0),('Rubick','26370449891905441',0,0),('Rubick','27304069370599303',0,0),('Rubick','33664981377079473',0,0),('Rubick','35743610291874665',0,0),('Rubick','41840792526073040',0,0),('Rubick','43027399174998579',3,3),('Rubick','46432296765015628',0,0),('Rubick','59559627923289016',1,3),('Rubick','66723874916363400',0,0),('Rubick','75732735680263951',0,0),('Rubick','81774286793421101',1,3),('Rubick','94224382114845672',0,0),('Rubick','95472279822946392',0,0),('Rubick','98356213072479694',0,0),('Terrorblade','10574291456968494',0,0),('Terrorblade','13245128645328723',0,0),('Terrorblade','13496213361616567',0,0),('Terrorblade','15532938601031196',1,3),('Terrorblade','18074007267880805',0,0),('Terrorblade','21910905722633743',0,0),('Terrorblade','26370449891905441',0,0),('Terrorblade','27304069370599303',0,0),('Terrorblade','33664981377079473',0,0),('Terrorblade','35743610291874665',0,0),('Terrorblade','41840792526073040',0,0),('Terrorblade','43027399174998579',0,0),('Terrorblade','46432296765015628',1,3),('Terrorblade','59559627923289016',0,0),('Terrorblade','66723874916363400',0,0),('Terrorblade','75732735680263951',0,0),('Terrorblade','81774286793421101',0,0),('Terrorblade','94224382114845672',0,0),('Terrorblade','95472279822946392',0,0),('Terrorblade','98356213072479694',0,0);
/*!40000 ALTER TABLE `player_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `steam_name` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_of_origin` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `signature_hero` varchar(255) NOT NULL,
  `playtime` smallint NOT NULL DEFAULT '0',
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('Ceb','10574291456968494','Sebastien Debs','France','1992-06-11','Magnus',5600,'Active'),('MATUMBAMAN','13245128645328723','Lasse Aukusti','Finland','1995-03-03','Lone Druid',5310,'Active'),('Handsken','13496213361616567','Simon Haag','Sweden','1994-04-24','Io',5940,'Active'),('Nisha','15532938601031196','Michal Jankowski','Poland','2000-09-28','Terrorblade',4980,'Active'),('zai','18074007267880805','Ludwig Wahlberg','Sweden','1997-08-05','Enigma',5660,'Active'),('Nikobaby','21910905722633743','Nikolay Nikolov','Bulgaria','1997-05-27','Morphling',5470,'Active'),('Topson','26370449891905441','Topias Miikka Taavitsainen','Finland','1998-04-14','Monkey King',4500,'Active'),('N0tail','27304069370599303','Johan Sundstein','Denmark','1993-10-08','Chen',5000,'Active'),('Midone','33664981377079473','Yeik Nai Zheng','Malaysia','1996-07-03','Invoker',6000,'Active'),('Ace','35743610291874665','Marcus Hoelgaard','Denmark','1994-01-19','Meepo',5160,'Active'),('fng','41840792526073040','Artiom Barshack','Belarus','1995-09-24','Bane',6050,'Active'),('Saksa','43027399174998579','Martin Sazdov','North Macedonia','1995-06-12','Rubick',4000,'Active'),('EternaLEnVy','46432296765015628','Jacky Mao','Canada','1991-07-02','Terrorblade',5190,'Active'),('YapzOr','59559627923289016','Yazied Jaradat','Jordan','1994-10-17','Rubick',5290,'Active'),('pieliedie','66723874916363400','Johan Astrom','Sweden','1991-08-05','Io',6510,'Active'),('Puppey','75732735680263951','Clement Ivanov','Estonia','1990-03-06','Chen',5970,'Active'),('MISERY','81774286793421101','Rasmus Filipsen','Denmark','1991-07-14','Rubick',5600,'Active'),('Sneyking','94224382114845672','Jingjun Wu','United States','1995-05-03','Mirana',5430,'Active'),('Limmp','95472279822946392','Linus Blomdin','Sweden','1995-05-31','Puck',5690,'Active'),('s4','98356213072479694','Gustav Magnusson','Sweden','1992-04-01','Magnus',6170,'Active');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `steam_id` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  PRIMARY KEY (`steam_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`steam_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('10574291456968494','Coach'),('13245128645328723','Carry'),('13496213361616567','Support'),('15532938601031196','Solo Middle'),('18074007267880805','Offlaner'),('21910905722633743','Carry'),('26370449891905441','Solo Middle'),('27304069370599303','Carry'),('33664981377079473','Carry'),('35743610291874665','Solo Middle'),('41840792526073040','Offlaner'),('43027399174998579','Solo Middle'),('46432296765015628','Carry'),('59559627923289016','Support'),('66723874916363400','Support'),('75732735680263951','Captain'),('81774286793421101','Captain'),('94224382114845672','Support'),('95472279822946392','Soloy Middle'),('98356213072479694','Captain');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_name` varchar(255) NOT NULL,
  `player` varchar(255) NOT NULL,
  `losses` smallint NOT NULL,
  `wins` smallint NOT NULL,
  PRIMARY KEY (`player`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`player`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('Team Secret','13245128645328723',391,868),('Alliance','21910905722633743',804,1066),('OG','27304069370599303',372,626),('Cloud9','46432296765015628',128,118);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_player`
--

DROP TABLE IF EXISTS `teams_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_player` (
  `player_id` varchar(255) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `join_date` date NOT NULL,
  `participation` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`player_id`),
  CONSTRAINT `teams_player_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_player`
--

LOCK TABLES `teams_player` WRITE;
/*!40000 ALTER TABLE `teams_player` DISABLE KEYS */;
INSERT INTO `teams_player` VALUES ('10574291456968494','OG','2018-06-03',3),('13245128645328723','Team Secret','2019-11-04',3),('13496213361616567','Allaince','2019-10-03',3),('15532938601031196','Team Secret','2018-09-11',3),('18074007267880805','Team Secret','2018-09-11',3),('21910905722633743','Allaince','2019-10-03',3),('26370449891905441','OG','2020-01-29',3),('27304069370599303','OG','2020-01-29',3),('33664981377079473','OG','2015-10-31',3),('35743610291874665','Cloud9','2020-03-03',3),('41840792526073040','Allaince','2020-09-10',3),('43027399174998579','OG','2018-06-03',3),('46432296765015628','Cloud9','2020-03-03',3),('59559627923289016','Team Secret','2017-05-04',3),('66723874916363400','Cloud9','2020-01-29',3),('75732735680263951','Team Secret','2014-08-27',3),('81774286793421101','Cloud9','2020-01-29',3),('94224382114845672','Cloud9','2020-03-03',3),('95472279822946392','Allaince','2019-10-03',3),('98356213072479694','Allaince','2020-04-01',3);
/*!40000 ALTER TABLE `teams_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_teams`
--

DROP TABLE IF EXISTS `teams_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_teams` (
  `team_1` varchar(255) NOT NULL,
  `team_2` varchar(255) NOT NULL,
  `player_11` varchar(255) NOT NULL,
  `player_21` varchar(255) NOT NULL,
  `losses` smallint NOT NULL,
  `wins` smallint NOT NULL,
  PRIMARY KEY (`player_11`,`player_21`),
  KEY `player_21` (`player_21`),
  CONSTRAINT `teams_teams_ibfk_1` FOREIGN KEY (`player_11`) REFERENCES `players` (`steam_id`),
  CONSTRAINT `teams_teams_ibfk_2` FOREIGN KEY (`player_21`) REFERENCES `players` (`steam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_teams`
--

LOCK TABLES `teams_teams` WRITE;
/*!40000 ALTER TABLE `teams_teams` DISABLE KEYS */;
INSERT INTO `teams_teams` VALUES ('Team Secret','Alliance','13245128645328723','21910905722633743',0,1),('Team Secret','OG','13245128645328723','27304069370599303',1,0),('Team Secret','Cloud9','13245128645328723','46432296765015628',1,0),('Alliance','Team Secret','21910905722633743','13245128645328723',1,0),('Alliance','OG','21910905722633743','27304069370599303',1,0),('Alliance','Cloud9','21910905722633743','46432296765015628',0,1),('OG','Team Secret','27304069370599303','13245128645328723',0,1),('OG','Alliance','27304069370599303','21910905722633743',0,1),('OG','Cloud9','27304069370599303','46432296765015628',0,1),('Cloud9','Team Secret','46432296765015628','13245128645328723',0,1),('Cloud9','Alliance','46432296765015628','21910905722633743',1,0),('Cloud9','OG','46432296765015628','27304069370599303',1,0);
/*!40000 ALTER TABLE `teams_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_type`
--

DROP TABLE IF EXISTS `tournament_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_type` (
  `tournament` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`tournament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_type`
--

LOCK TABLES `tournament_type` WRITE;
/*!40000 ALTER TABLE `tournament_type` DISABLE KEYS */;
INSERT INTO `tournament_type` VALUES ('AMD SAPPHIRE OGA DOTA PIT','Professional'),('OMEGA League','Professional');
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

-- Dump completed on 2020-10-05 17:57:40
