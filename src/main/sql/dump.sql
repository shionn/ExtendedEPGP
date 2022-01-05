-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: epgp
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB-2

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
-- Current Database: `epgp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `epgp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `epgp`;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `raid` varchar(64) DEFAULT NULL,
  `boss` varchar(64) DEFAULT NULL,
  `ilvl` int(11) NOT NULL DEFAULT 0,
  `slot` varchar(32) DEFAULT NULL,
  `pt` int(11) DEFAULT 0,
  `pt_ratio` int(11) NOT NULL DEFAULT 100,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (10213,NULL,NULL,58,'Wrist',1850,100,'Elegant Bracers'),(10659,NULL,'Quest',57,'Trinket',2274,100,'Shard of Afrasa'),(11624,NULL,'High Interrogator Gerstahn',52,'Shoulder',2101,100,'Kentic Amice'),(11819,NULL,'Golem Lord Argelmach',59,'Trinket',2436,100,'Second Wind'),(11832,'None','Ambassador Flamelash',58,'Trinket',2354,100,'Burst of Knowledge'),(11923,NULL,NULL,57,'MainHand',1364,100,'The Hammer of Grace'),(11924,NULL,'Emperor Dagran Thaurissan',60,'Chest',3600,100,'Robes of the Royal Crown'),(11928,NULL,'Emperor Dagran Thaurissan',60,'HeldInOffhand',1980,100,'Thaurissan\'s Royal Scepter'),(11932,NULL,'Emperor Dagran Thaurissan',59,'TwoHand',3481,100,'Guiding Stave of Wisdom'),(12543,NULL,NULL,60,'Finger',1980,100,'Songstone of Ironforge'),(12546,NULL,NULL,54,'Wrist',1603,100,'Aristocratic Cuffs'),(12554,NULL,'Princess Moira Bronzebeard',59,'Hands',2704,100,'Hands of the Exalted Herald'),(12930,'None','Jed Runewatcher',60,'Trinket',2520,100,'Briarwood Reed'),(12960,NULL,'Gyth',60,'Head',3600,100,'Tribal War Feathers'),(13102,NULL,NULL,47,'Head',2209,100,'Cassandra\'s Grace'),(13141,NULL,'General Drakkisath',63,'Neck',2182,100,'Tooth of Gnarr'),(13161,NULL,'Overlord Wyrmthalak',61,'TwoHand',3721,100,'Trindlehaven Staff'),(13168,NULL,'Highlord Omokk',60,'Chest',3600,100,'Plate of the Shaman King'),(13178,NULL,'Urok Doomhowl',60,'Finger',1980,100,'Rosewine Circle'),(13205,NULL,'Gizrul the Slavener',61,'OffHand',2046,100,'Rhombeard Protector'),(13206,NULL,'Gizrul the Slavener',61,'Legs',3721,100,'Wolfshear Leggings'),(13253,NULL,'Quartermaster Zigris',60,'Hands',2797,100,'Hands of Power'),(13345,NULL,'Baron Rivendare',63,'Finger',2182,100,'Seal of Rivendare'),(13346,NULL,'Baron Rivendare',63,'Chest',3969,100,'Robes of the Exalted'),(13938,'None','Darkmaster Gandling',62,'Ranged',1614,100,'Bonecreeper Stylus'),(13954,NULL,'Stonespine',61,'Feet',2891,100,'Verdant Footpads'),(13968,NULL,NULL,63,'Trinket',2778,100,'Eye of the Beast'),(13969,NULL,'Kirtonos the Herald',61,'Wrist',2046,100,'Loomguard Armbraces'),(14154,NULL,'Craft',62,'Chest',3844,100,'Truefaith Vestments'),(14522,NULL,'Ras Frostwhisper',62,'Legs',3844,100,'Maelstrom Leggings'),(14548,NULL,'Jandice Barov',62,'Shoulder',2986,100,'Royal Cap Spaulders'),(15061,NULL,NULL,54,'Shoulder',2265,100,'Living Shoulders'),(16058,NULL,'Quest',63,'Finger',2182,100,'Fordring\'s Seal'),(16693,NULL,'Darkmaster Gandling',62,'Head',3844,100,'Devout Crown'),(16714,'None','None',57,'Wrist',1786,100,'Wildheart Bracers'),(16814,'MC','Magmadar',66,'Legs',4356,100,'Pants of Prophecy'),(16858,'MC','Trash',66,'Waist',3384,100,'Lawbringer Belt'),(16921,'Boss','Onyxia',76,'Head',5776,100,'Halo of Transcendence'),(18309,NULL,'Alzzin the Wildshaper',59,'Hands',2704,100,'Gloves of Restoration'),(18317,NULL,'Hydrospawn',58,'Neck',1850,100,'Tempest Talisman'),(18318,NULL,'Alzzin the Wildshaper',59,'Feet',2704,100,'Merciful Greaves'),(18327,'None','Alzzin the Wildshaper',59,'Waist',2704,100,'Whipvine Cord'),(18386,'None','Illyanna Ravenoak',61,'Legs',3721,100,'Padre\'s Trousers'),(18389,'None','Immol\'thar',62,'Back',2114,100,'Cloak of the Cosmos'),(18391,NULL,'Immol\'thar',62,'Waist',2986,100,'Eyestalk Cord'),(18395,NULL,'Prince Tortheldrin',62,'Finger',2114,100,'Emerald Flame Ring'),(18469,'None','Quest',62,'Trinket',2690,100,'Royal Seal of Eldre\'Thalas'),(18470,NULL,NULL,62,'Trinket',2690,100,'Royal Seal of Eldre\'Thalas'),(18472,'None','Quest',62,'Trinket',2690,100,'Royal Seal of Eldre\'Thalas'),(18510,NULL,'Craft',62,'Back',2114,100,'Hide of the Wild'),(18523,'None','King Gordok',63,'HeldInOffhand',2182,100,'Brightly Glowing Stone'),(18525,NULL,'King Gordok',63,'Wrist',2182,100,'Bracers of Prosperity'),(18526,NULL,'King Gordok',63,'Head',3969,100,'Crown of the Ogre King'),(18682,NULL,NULL,61,'Legs',3721,100,'Ghoul Skin Leggings'),(18723,'None','Ramstein the Gorger',62,'Neck',2114,100,'Animated Chain Necklace'),(18727,'None','Magistrate Barthilas',59,'Head',3481,100,'Crimson Felt Hat'),(19098,NULL,NULL,60,'Neck',1980,100,'Stormpike Sage\'s Pendant'),(19312,NULL,NULL,65,'HeldInOffhand',2323,100,'Lei of the Lifegiver'),(19990,NULL,NULL,52,'Trinket',1892,100,'Blessed Prayer Beads'),(20666,NULL,'The Duke of Cynders',62,'MainHand',1614,100,'Hardened Steel Warhammer'),(22078,NULL,'Quest',65,'Waist',3282,100,'Virtuous Belt'),(22079,NULL,'Quest',65,'Wrist',2323,100,'Virtuous Bracers'),(22081,NULL,'Quest',55,'Hands',2350,100,'Virtuous Gloves'),(22082,'None','Quest',65,'Shoulder',3282,100,'Virtuous Mantle'),(22084,'None','Quest',60,'Feet',2797,100,'Virtuous Sandals'),(22085,'None','Quest',66,'Legs',4356,100,'Virtuous Skirt'),(22149,'None','Quest',63,'Neck',2182,100,'Beads of Ogre Mojo'),(22234,NULL,'Lord Roccor',53,'Shoulder',2182,100,'Mantle of Lost Hope'),(22247,NULL,'Warchief Rend Blackhand',63,'Feet',3083,100,'Faith Healer\'s Boots'),(22254,NULL,NULL,57,'Ranged',1364,100,'Wand of Eternal Light'),(22272,NULL,NULL,52,'Chest',2704,100,'Forest\'s Embrace'),(22275,NULL,'Hurley Blackbreath',57,'Feet',2524,100,'Firemoss Boots'),(22398,NULL,'Mor Grayhoof',62,'Relic',1614,100,'Idol of Rejuvenation'),(22406,NULL,'Cannon Master Willey',61,'TwoHand',3721,100,'Redemption'),(22407,NULL,'Cannon Master Willey',61,'Head',3721,100,'Helm of the New Moon'),(23201,NULL,'World',65,'Relic',1774,100,'Libram of Divinity');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_assignment`
--

DROP TABLE IF EXISTS `item_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_assignment` (
  `item` int(11) NOT NULL,
  `class` varchar(32) NOT NULL,
  PRIMARY KEY (`class`,`item`),
  KEY `item` (`item`),
  CONSTRAINT `item_assignment_ibfk_1` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_assignment`
--

LOCK TABLES `item_assignment` WRITE;
/*!40000 ALTER TABLE `item_assignment` DISABLE KEYS */;
INSERT INTO `item_assignment` VALUES (10659,'Druid'),(11819,'Druid'),(11832,'Druid'),(11923,'Druid'),(11928,'Druid'),(11932,'Druid'),(12543,'Druid'),(12554,'Druid'),(12930,'Druid'),(12960,'Druid'),(13141,'Druid'),(13161,'Druid'),(13178,'Druid'),(13345,'Druid'),(13954,'Druid'),(13968,'Druid'),(15061,'Druid'),(16058,'Druid'),(16714,'Druid'),(18309,'Druid'),(18317,'Druid'),(18386,'Druid'),(18389,'Druid'),(18391,'Druid'),(18395,'Druid'),(18470,'Druid'),(18510,'Druid'),(18523,'Druid'),(18525,'Druid'),(18682,'Druid'),(18723,'Druid'),(18727,'Druid'),(19098,'Druid'),(19312,'Druid'),(19990,'Druid'),(20666,'Druid'),(22272,'Druid'),(22275,'Druid'),(22398,'Druid'),(22406,'Druid'),(22407,'Druid'),(10659,'Hunter'),(11928,'Hunter'),(12543,'Hunter'),(12930,'Hunter'),(13345,'Hunter'),(13969,'Hunter'),(14522,'Hunter'),(14548,'Hunter'),(18317,'Hunter'),(18318,'Hunter'),(18395,'Hunter'),(18523,'Hunter'),(18723,'Hunter'),(19098,'Hunter'),(19312,'Hunter'),(19990,'Hunter'),(10213,'Mage'),(10659,'Mage'),(11624,'Mage'),(11832,'Mage'),(11924,'Mage'),(11928,'Mage'),(12543,'Mage'),(12546,'Mage'),(12554,'Mage'),(12930,'Mage'),(13102,'Mage'),(13161,'Mage'),(13206,'Mage'),(13253,'Mage'),(13345,'Mage'),(13346,'Mage'),(13938,'Mage'),(13968,'Mage'),(16693,'Mage'),(18317,'Mage'),(18327,'Mage'),(18386,'Mage'),(18395,'Mage'),(18523,'Mage'),(18526,'Mage'),(18723,'Mage'),(18727,'Mage'),(19098,'Mage'),(19312,'Mage'),(19990,'Mage'),(22085,'Mage'),(22234,'Mage'),(22247,'Mage'),(22254,'Mage'),(22406,'Mage'),(10659,'Paladin'),(11819,'Paladin'),(11832,'Paladin'),(11923,'Paladin'),(11928,'Paladin'),(12543,'Paladin'),(12930,'Paladin'),(13141,'Paladin'),(13168,'Paladin'),(13178,'Paladin'),(13205,'Paladin'),(13345,'Paladin'),(13969,'Paladin'),(14522,'Paladin'),(14548,'Paladin'),(16058,'Paladin'),(16858,'Paladin'),(18317,'Paladin'),(18318,'Paladin'),(18386,'Paladin'),(18389,'Paladin'),(18395,'Paladin'),(18472,'Paladin'),(18510,'Paladin'),(18523,'Paladin'),(18526,'Paladin'),(18723,'Paladin'),(18727,'Paladin'),(19098,'Paladin'),(19312,'Paladin'),(19990,'Paladin'),(20666,'Paladin'),(23201,'Paladin'),(10213,'Priest'),(10659,'Priest'),(11624,'Priest'),(11819,'Priest'),(11832,'Priest'),(11923,'Priest'),(11924,'Priest'),(11928,'Priest'),(11932,'Priest'),(12543,'Priest'),(12546,'Priest'),(12554,'Priest'),(12930,'Priest'),(13102,'Priest'),(13141,'Priest'),(13161,'Priest'),(13178,'Priest'),(13206,'Priest'),(13253,'Priest'),(13345,'Priest'),(13346,'Priest'),(13938,'Priest'),(13968,'Priest'),(14154,'Priest'),(16058,'Priest'),(16693,'Priest'),(16814,'Priest'),(16921,'Priest'),(18317,'Priest'),(18327,'Priest'),(18386,'Priest'),(18389,'Priest'),(18395,'Priest'),(18469,'Priest'),(18510,'Priest'),(18523,'Priest'),(18526,'Priest'),(18723,'Priest'),(18727,'Priest'),(19098,'Priest'),(19312,'Priest'),(19990,'Priest'),(20666,'Priest'),(22078,'Priest'),(22079,'Priest'),(22081,'Priest'),(22082,'Priest'),(22084,'Priest'),(22085,'Priest'),(22149,'Priest'),(22234,'Priest'),(22247,'Priest'),(22254,'Priest'),(22406,'Priest'),(10659,'Rogue'),(11923,'Rogue'),(11928,'Rogue'),(12543,'Rogue'),(12930,'Rogue'),(12960,'Rogue'),(13345,'Rogue'),(13954,'Rogue'),(15061,'Rogue'),(16714,'Rogue'),(18309,'Rogue'),(18317,'Rogue'),(18391,'Rogue'),(18395,'Rogue'),(18523,'Rogue'),(18525,'Rogue'),(18682,'Rogue'),(18723,'Rogue'),(19098,'Rogue'),(19312,'Rogue'),(19990,'Rogue'),(20666,'Rogue'),(22272,'Rogue'),(22275,'Rogue'),(22407,'Rogue'),(10659,'Shaman'),(11819,'Shaman'),(11832,'Shaman'),(11923,'Shaman'),(11928,'Shaman'),(11932,'Shaman'),(12543,'Shaman'),(12554,'Shaman'),(12930,'Shaman'),(13141,'Shaman'),(13161,'Shaman'),(13178,'Shaman'),(13205,'Shaman'),(13345,'Shaman'),(13968,'Shaman'),(13969,'Shaman'),(14522,'Shaman'),(14548,'Shaman'),(16058,'Shaman'),(18317,'Shaman'),(18318,'Shaman'),(18389,'Shaman'),(18395,'Shaman'),(18510,'Shaman'),(18523,'Shaman'),(18723,'Shaman'),(18727,'Shaman'),(19098,'Shaman'),(19312,'Shaman'),(19990,'Shaman'),(20666,'Shaman'),(22406,'Shaman'),(10213,'Warlock'),(10659,'Warlock'),(11624,'Warlock'),(11832,'Warlock'),(11924,'Warlock'),(11928,'Warlock'),(12543,'Warlock'),(12546,'Warlock'),(12930,'Warlock'),(13102,'Warlock'),(13161,'Warlock'),(13206,'Warlock'),(13253,'Warlock'),(13345,'Warlock'),(13346,'Warlock'),(13938,'Warlock'),(13968,'Warlock'),(16693,'Warlock'),(18317,'Warlock'),(18327,'Warlock'),(18386,'Warlock'),(18395,'Warlock'),(18523,'Warlock'),(18526,'Warlock'),(18723,'Warlock'),(18727,'Warlock'),(19098,'Warlock'),(19312,'Warlock'),(19990,'Warlock'),(22085,'Warlock'),(22234,'Warlock'),(22247,'Warlock'),(22254,'Warlock'),(22406,'Warlock'),(10659,'Warrior'),(11923,'Warrior'),(11928,'Warrior'),(12543,'Warrior'),(12930,'Warrior'),(13161,'Warrior'),(13205,'Warrior'),(13345,'Warrior'),(13969,'Warrior'),(14522,'Warrior'),(14548,'Warrior'),(18317,'Warrior'),(18318,'Warrior'),(18395,'Warrior'),(18523,'Warrior'),(18723,'Warrior'),(19098,'Warrior'),(19312,'Warrior'),(19990,'Warrior'),(20666,'Warrior'),(22406,'Warrior');
/*!40000 ALTER TABLE `item_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `class` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Galyenai','Priest'),(2,'Sancti','Paladin'),(3,'Gifflemoi','Paladin'),(4,'Ivori','Druid'),(5,'Noireneige','Priest'),(6,'Hexarium','Priest'),(7,'Ticlin','Priest'),(8,'Udico','Warrior'),(9,'Timisis','Warrior'),(10,'Unaviable','Druid'),(11,'Sikaro','Warrior'),(12,'Hipsow','Warrior'),(13,'Tomahte','Warrior'),(14,'Titijack','Warrior'),(15,'Anthony','Warrior'),(16,'Zrale','Rogue'),(17,'Skybao','Rogue'),(18,'Khuzdul','Rogue'),(19,'Manolito','Rogue'),(20,'Drosvarg','Rogue'),(21,'Lakokett','Hunter'),(22,'Nokorz','Hunter'),(23,'Elzaji','Hunter'),(24,'Artec','Hunter'),(25,'Exola','Mage'),(26,'Jobel','Mage'),(27,'Bruja','Mage'),(28,'Phoceen','Mage'),(29,'Altah','Mage'),(30,'Galyen','Mage'),(31,'Archibad','Warlock'),(32,'Nordvpn','Warlock'),(33,'Malox','Warlock'),(34,'Akali','Warlock'),(36,'Cyclope','Druid'),(37,'Laszéfir (Xena)','Paladin'),(38,'Courgettev','Paladin'),(39,'Belouange','Paladin'),(40,'Nicororo','Paladin'),(41,'Aspirine','Druid'),(42,'Xientor','Druid'),(43,'Cortex','Mage'),(44,'Mauldark','Rogue'),(45,'Laykka','Mage'),(47,'Incolas','Paladin');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_loot`
--

DROP TABLE IF EXISTS `player_loot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_loot` (
  `player` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `raid` int(11) NOT NULL,
  `attribution` varchar(32) NOT NULL,
  PRIMARY KEY (`player`,`item`,`raid`),
  KEY `raid` (`raid`),
  KEY `item` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_loot`
--

LOCK TABLES `player_loot` WRITE;
/*!40000 ALTER TABLE `player_loot` DISABLE KEYS */;
INSERT INTO `player_loot` VALUES (1,11819,0,'noRaid'),(1,11832,0,'noRaid'),(1,11924,0,'noRaid'),(1,11932,0,'noRaid'),(1,12554,0,'noRaid'),(1,13141,0,'noRaid'),(1,13178,0,'noRaid'),(1,13346,0,'noRaid'),(1,13938,0,'noRaid'),(1,14154,0,'noRaid'),(1,16058,0,'noRaid'),(1,16814,0,'noRaid'),(1,18469,0,'noRaid'),(1,18510,0,'noRaid'),(1,18727,0,'noRaid'),(1,22078,0,'noRaid'),(1,22079,0,'noRaid'),(1,22081,0,'noRaid'),(1,22082,0,'noRaid'),(1,22084,0,'noRaid'),(1,22085,0,'noRaid'),(1,22149,0,'noRaid'),(1,22234,0,'noRaid'),(1,22247,0,'noRaid'),(2,10659,0,'noRaid'),(2,12554,0,'noRaid'),(2,13141,0,'noRaid'),(2,13168,0,'noRaid'),(2,13205,0,'noRaid'),(2,13345,0,'noRaid'),(2,13969,0,'noRaid'),(2,14522,0,'noRaid'),(2,14548,0,'noRaid'),(2,16058,0,'noRaid'),(2,16858,0,'noRaid'),(2,18318,0,'noRaid'),(2,18389,0,'noRaid'),(2,18472,0,'noRaid'),(2,18526,0,'noRaid'),(2,20666,0,'noRaid'),(2,23201,0,'noRaid'),(3,11819,0,'noRaid'),(3,11923,0,'noRaid'),(3,12543,0,'noRaid'),(3,12930,0,'noRaid'),(3,13346,0,'noRaid'),(3,13954,0,'noRaid'),(3,13969,0,'noRaid'),(3,16058,0,'noRaid'),(3,18309,0,'noRaid'),(3,18386,0,'noRaid'),(3,18391,0,'noRaid'),(3,18510,0,'noRaid'),(3,18523,0,'noRaid'),(3,18723,0,'noRaid'),(3,18727,0,'noRaid'),(3,22234,0,'noRaid'),(3,23201,0,'noRaid'),(4,11832,0,'noRaid'),(4,11924,0,'noRaid'),(4,12543,0,'noRaid'),(4,12960,0,'noRaid'),(4,13161,0,'noRaid'),(4,15061,0,'noRaid'),(4,16714,0,'noRaid'),(4,18317,0,'noRaid'),(4,18327,0,'noRaid'),(4,18682,0,'noRaid'),(4,22275,0,'noRaid'),(5,11923,0,'noRaid'),(5,11928,0,'noRaid'),(5,12546,0,'noRaid'),(5,12554,0,'noRaid'),(5,13178,0,'noRaid'),(5,13346,0,'noRaid'),(5,13968,0,'noRaid'),(5,16058,0,'noRaid'),(5,18327,0,'noRaid'),(5,18386,0,'noRaid'),(5,18469,0,'noRaid'),(5,18510,0,'noRaid'),(5,18723,0,'noRaid'),(5,18727,0,'noRaid'),(5,22234,0,'noRaid'),(5,22247,0,'noRaid'),(5,22254,0,'noRaid'),(6,10213,0,'noRaid'),(6,12554,0,'noRaid'),(6,13102,0,'noRaid'),(6,13346,0,'noRaid'),(6,16058,0,'noRaid'),(6,18327,0,'noRaid'),(6,18386,0,'noRaid'),(6,18389,0,'noRaid'),(6,18395,0,'noRaid'),(6,18469,0,'noRaid'),(6,18723,0,'noRaid'),(6,19990,0,'noRaid'),(6,22234,0,'noRaid'),(6,22247,0,'noRaid'),(6,22254,0,'noRaid'),(6,22406,0,'noRaid'),(7,11624,0,'noRaid'),(7,11932,0,'noRaid'),(7,12543,0,'noRaid'),(7,13206,0,'noRaid'),(7,13253,0,'noRaid'),(7,13346,0,'noRaid'),(7,13938,0,'noRaid'),(7,13968,0,'noRaid'),(7,16058,0,'noRaid'),(7,16693,0,'noRaid'),(7,18327,0,'noRaid'),(7,18469,0,'noRaid'),(7,18510,0,'noRaid'),(7,19098,0,'noRaid'),(7,22079,0,'noRaid'),(7,22247,0,'noRaid'),(41,11819,0,'noRaid'),(41,11923,0,'noRaid'),(41,12554,0,'noRaid'),(41,13178,0,'noRaid'),(41,13954,0,'noRaid'),(41,15061,0,'noRaid'),(41,16058,0,'noRaid'),(41,18386,0,'noRaid'),(41,18391,0,'noRaid'),(41,18470,0,'noRaid'),(41,18510,0,'noRaid'),(41,18525,0,'noRaid'),(41,18723,0,'noRaid'),(41,19312,0,'noRaid'),(41,22272,0,'noRaid'),(41,22398,0,'noRaid'),(41,22407,0,'noRaid');
/*!40000 ALTER TABLE `player_loot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raid`
--

DROP TABLE IF EXISTS `raid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `instance` varchar(8) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `running` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raid`
--

LOCK TABLES `raid` WRITE;
/*!40000 ALTER TABLE `raid` DISABLE KEYS */;
INSERT INTO `raid` VALUES (1,'Armory','Dungeon','2022-01-04 16:13:54',0),(2,'First Full Guilde','MC','2022-01-05 00:00:00',1);
/*!40000 ALTER TABLE `raid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raid_entry`
--

DROP TABLE IF EXISTS `raid_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raid_entry` (
  `raid` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `bench` tinyint(1) NOT NULL DEFAULT 0,
  `absent` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`raid`,`player`),
  KEY `player` (`player`),
  CONSTRAINT `raid_entry_ibfk_1` FOREIGN KEY (`raid`) REFERENCES `raid` (`id`),
  CONSTRAINT `raid_entry_ibfk_2` FOREIGN KEY (`player`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raid_entry`
--

LOCK TABLES `raid_entry` WRITE;
/*!40000 ALTER TABLE `raid_entry` DISABLE KEYS */;
INSERT INTO `raid_entry` VALUES (2,1,0,0),(2,2,0,0),(2,3,0,0),(2,4,0,0),(2,5,0,0),(2,6,0,0),(2,7,0,0),(2,8,0,0),(2,9,0,0),(2,10,0,0),(2,11,0,0),(2,12,0,0),(2,13,0,0),(2,14,0,0),(2,15,0,0),(2,16,0,0),(2,17,0,0),(2,18,0,0),(2,19,0,0),(2,20,0,0),(2,21,0,0),(2,22,0,0),(2,23,0,0),(2,24,0,0),(2,25,0,0),(2,26,0,0),(2,27,0,0),(2,28,1,0),(2,29,0,0),(2,30,0,0),(2,31,0,0),(2,32,0,0),(2,33,0,0),(2,34,0,0),(2,36,1,0),(2,37,0,0),(2,38,0,0),(2,39,0,0),(2,40,0,0),(2,41,0,0),(2,42,0,0),(2,43,0,0),(2,44,1,0),(2,45,1,0),(2,47,1,0);
/*!40000 ALTER TABLE `raid_entry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-05  1:58:18
