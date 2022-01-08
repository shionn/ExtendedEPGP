-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 08, 2022 at 11:10 AM
-- Server version: 10.5.12-MariaDB-0+deb11u1
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epgp`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `epgp`
-- (See below for the actual view)
--
CREATE TABLE `epgp` (
`player` int(11)
,`name` varchar(64)
,`ep` bigint(17)
,`gp` double(17,0)
,`epgp_ratio` double(21,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `raid` varchar(64) DEFAULT NULL,
  `boss` varchar(64) DEFAULT NULL,
  `ilvl` int(11) NOT NULL DEFAULT 0,
  `slot` varchar(32) DEFAULT NULL,
  `pt` int(11) DEFAULT 0,
  `pt_ratio` int(11) NOT NULL DEFAULT 100,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `raid`, `boss`, `ilvl`, `slot`, `pt`, `pt_ratio`, `name`) VALUES
(10213, 'None', 'None', 58, 'Wrist', 1850, 100, 'Brassards élégants'),
(10659, 'None', 'Quest', 57, 'Trinket', 2274, 100, 'Éclat des Sabots-Fendus'),
(11624, 'None', 'High Interrogator Gerstahn', 52, 'Shoulder', 2101, 100, 'Amict d\'illumination'),
(11819, 'None', 'Golem Lord Argelmach', 59, 'Trinket', 2436, 100, 'Second souffle'),
(11832, 'None', 'Ambassador Flamelash', 58, 'Trinket', 2354, 100, 'Bijou de connaissance'),
(11923, 'None', 'None', 57, 'MainHand', 1364, 100, 'Marteau de béatitude'),
(11924, 'None', 'Emperor Dagran Thaurissan', 60, 'Chest', 3600, 100, 'Robe de la couronne royale'),
(11928, 'None', 'Emperor Dagran Thaurissan', 60, 'HeldInOffhand', 1980, 100, 'Sceptre royal de Thaurissan'),
(11932, 'None', 'Emperor Dagran Thaurissan', 59, 'TwoHand', 3481, 100, 'Bâton guide de sagesse'),
(12543, 'None', 'Quest', 60, 'Finger', 1980, 100, 'Pierre chantante d\'Ironforge'),
(12546, 'None', 'None', 54, 'Wrist', 1603, 100, 'Crispins aristocratiques'),
(12554, 'None', 'Princess Moira Bronzebeard', 59, 'Hands', 2704, 100, 'Gants du héraut exalté'),
(12633, 'None', 'None', 60, 'Head', 3600, 100, 'Heaume d\'âme blanche'),
(12930, 'None', 'Jed Runewatcher', 60, 'Trinket', 2520, 100, 'Pipeau de bruyère'),
(12960, 'None', 'Gyth', 60, 'Head', 3600, 100, 'Coiffure de plumes tribale'),
(13102, 'None', 'None', 47, 'Head', 2209, 100, 'Grâce de Cassandre'),
(13141, 'None', 'General Drakkisath', 63, 'Neck', 2182, 100, 'Dent de Gnarr'),
(13161, 'None', 'Overlord Wyrmthalak', 61, 'TwoHand', 3721, 100, 'Bâton du refuge'),
(13168, 'None', 'Highlord Omokk', 60, 'Chest', 3600, 100, 'Harnois du roi-chaman'),
(13178, 'None', 'Urok Doomhowl', 60, 'Finger', 1980, 100, 'Anneau de rosette'),
(13205, 'None', 'Gizrul the Slavener', 61, 'OffHand', 2046, 100, 'Protecteur de Rhombeard'),
(13206, 'None', 'Gizrul the Slavener', 61, 'Legs', 3721, 100, 'Jambières du tondeur de loups'),
(13253, 'None', 'Quartermaster Zigris', 60, 'Hands', 2797, 100, 'Mains de puissance'),
(13345, 'None', 'Baron Rivendare', 63, 'Finger', 2182, 100, 'Sceau de Rivendare'),
(13346, 'None', 'Baron Rivendare', 63, 'Chest', 3969, 100, 'Robe de l\'exalté'),
(13938, 'None', 'Darkmaster Gandling', 62, 'Ranged', 1614, 100, 'Stylet d\'os'),
(13954, 'None', 'Stonespine', 61, 'Feet', 2891, 100, 'Bottes verdoyantes'),
(13968, 'None', 'Quest', 63, 'Trinket', 2778, 100, 'Oeil de la Bête'),
(13969, 'None', 'Kirtonos the Herald', 61, 'Wrist', 2046, 100, 'Bracières en faisceaux renforcés'),
(14154, 'None', 'Craft', 62, 'Chest', 3844, 100, 'Habit de vraie foi'),
(14522, 'None', 'Ras Frostwhisper', 62, 'Legs', 3844, 100, 'Jambières du maelstrom'),
(14548, 'None', 'Jandice Barov', 62, 'Shoulder', 2986, 100, 'Spallières royales'),
(15061, 'None', 'Craft', 54, 'Shoulder', 2265, 100, 'Epaulières vivantes'),
(16058, 'None', 'Quest', 63, 'Finger', 2182, 100, 'Sceau de Fordring'),
(16693, 'None', 'Darkmaster Gandling', 62, 'Head', 3844, 100, 'Collerette de dévot'),
(16714, 'None', 'None', 57, 'Wrist', 1786, 100, 'Brassards du Coeur-sauvage'),
(16812, 'MC', 'Gehennas', 66, 'Hands', 3384, 100, 'Gants de prophétie'),
(16814, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Pantalon de prophétie'),
(16819, 'None', 'Trash', 66, 'Wrist', 2395, 100, 'Protège-bras de prophétie'),
(16822, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Pantalon du tueur de la nuit'),
(16830, 'MC', 'Multi', 66, 'Wrist', 2395, 100, 'Brassards cénariens'),
(16835, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Jambières cénariennes'),
(16849, 'MC', 'Gehennas', 66, 'Feet', 3384, 100, 'Bottes de traqueur de géant'),
(16854, 'MC', 'Garr', 66, 'Head', 2178, 50, 'Heaume judiciaire'),
(16858, 'MC', 'Trash', 66, 'Waist', 3384, 100, 'Ceinture judiciaire'),
(16859, 'MC', 'Lucifron', 66, 'Feet', 1692, 50, 'Bottes judiciaires'),
(16860, 'MC', 'Gehennas', 66, 'Hands', 1692, 50, 'Gantelets judiciaires'),
(16861, 'MC', 'Trash', 66, 'Wrist', 2395, 100, 'Brassards de puissance'),
(16863, 'MC', 'Lucifron', 66, 'Hands', 3384, 100, 'Gantelets de puissance'),
(16900, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Couvre-chef de Stormrage'),
(16908, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Cagoule Rougecroc'),
(16914, 'None', 'Onyxia', 76, 'Head', 5776, 100, 'Couronne de Vent du néant'),
(16921, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Auréole de transcendance'),
(16929, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Crâne de Némésis'),
(16939, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Casque de traqueur de dragon'),
(16955, 'None', 'Onyxia', 76, 'Head', 5776, 100, 'Couronne du jugement'),
(16963, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Heaume de courroux'),
(17067, 'None', 'Onyxia', 76, 'HeldInOffhand', 3176, 100, 'Ancien Grimoire de Cornerstone'),
(17068, 'Boss', 'Onyxia', 75, 'OneHand', 2362, 100, 'Porte-mort'),
(17073, 'MC', 'Magmadar', 66, 'TwoHand', 4356, 100, 'Trembleterre'),
(17075, 'Boss', 'Onyxia', 74, 'OneHand', 2299, 100, 'Vis\'kag le Saigneur'),
(17078, 'Boss', 'Onyxia', 72, 'Back', 2851, 100, 'Drapé de Saphiron'),
(17105, 'MC', 'Garr', 69, 'MainHand', 1999, 100, 'Marteau d\'Aurastone'),
(18205, 'Boss', 'Onyxia', 71, 'Neck', 2772, 100, 'Collier d\'Eskhandar'),
(18309, 'None', 'Alzzin the Wildshaper', 59, 'Hands', 2704, 100, 'Gants de restauration'),
(18317, 'None', 'Hydrospawn', 58, 'Neck', 1850, 100, 'Talisman de tempête'),
(18318, 'None', 'Alzzin the Wildshaper', 59, 'Feet', 2704, 100, 'Grèves miséricordieuses'),
(18327, 'None', 'Alzzin the Wildshaper', 59, 'Waist', 2704, 100, 'Corde de vigne-fouet'),
(18386, 'None', 'Illyanna Ravenoak', 61, 'Legs', 3721, 100, 'Pantalon du Padre'),
(18389, 'None', 'Immol\'thar', 62, 'Back', 2114, 100, 'Cape du cosmos'),
(18391, 'None', 'Immol\'thar', 62, 'Waist', 2986, 100, 'Corde de pédoncule'),
(18395, 'None', 'Prince Tortheldrin', 62, 'Finger', 2114, 100, 'Anneau de flamme émeraude'),
(18469, 'None', 'Quest', 62, 'Trinket', 2690, 100, 'Sceau royal d\'Eldre\'Thalas'),
(18470, 'None', 'Quest', 62, 'Trinket', 2690, 100, 'Sceau royal d\'Eldre\'Thalas'),
(18472, 'None', 'Quest', 62, 'Trinket', 2690, 100, 'Sceau royal d\'Eldre\'Thalas'),
(18510, 'None', 'Craft', 62, 'Back', 2114, 100, 'Peau du Fauve'),
(18523, 'None', 'King Gordok', 63, 'HeldInOffhand', 2182, 100, 'Pierre étincelante'),
(18525, 'None', 'King Gordok', 63, 'Wrist', 2182, 100, 'Brassards de prospérité'),
(18526, 'None', 'King Gordok', 63, 'Head', 3969, 100, 'Couronne du roi des ogres'),
(18527, 'None', 'King Gordok', 63, 'Hands', 3083, 100, 'Gantelets d\'harmonie'),
(18608, 'None', 'Majordomo', 75, 'TwoHand', 5625, 100, 'Benediction'),
(18646, 'MC', 'Majordomo Executus', 71, 'Trinket', 3528, 100, 'L\'Oeil de la divinité'),
(18682, 'None', 'Multi', 61, 'Legs', 3721, 100, 'Jambières en peau de goule'),
(18702, 'None', 'None', 60, 'Waist', 2797, 100, 'Ceinture des Consacrés'),
(18723, 'None', 'Ramstein the Gorger', 62, 'Neck', 2114, 100, 'Chaîne de cou animée'),
(18727, 'None', 'Magistrate Barthilas', 59, 'Head', 3481, 100, 'Chapeau de feutre cramoisi'),
(18810, 'MC', 'Majordomo Executus', 71, 'Shoulder', 7833, 200, 'Spallières de croissance sauvage'),
(18813, 'Boss', 'Onyxia', 73, 'Finger', 2930, 100, 'Anneau de lien'),
(18832, 'MC', 'Garr', 70, 'OneHand', 4116, 200, 'Lame de brutalité'),
(18875, 'MC', 'Trash', 64, 'Legs', 8192, 200, 'Pantalon en écailles de salamandre'),
(19098, 'None', 'None', 60, 'Neck', 1980, 100, 'Pendentif de sage stormpike'),
(19312, 'None', 'None', 65, 'HeldInOffhand', 2323, 100, 'Lei du Donneur de vie'),
(19990, 'None', 'Quest', 52, 'Trinket', 1892, 100, 'Chapelet béni'),
(20666, 'None', 'The Duke of Cynders', 62, 'MainHand', 1614, 100, 'Marteau de guerre à tête d\'acier'),
(22078, 'None', 'Quest', 65, 'Waist', 3282, 100, 'Ceinture vertueuse'),
(22079, 'None', 'Quest', 65, 'Wrist', 2323, 100, 'Brassards vertueux'),
(22081, 'None', 'Quest', 55, 'Hands', 2350, 100, 'Gants vertueux'),
(22082, 'None', 'Quest', 65, 'Shoulder', 3282, 100, 'Mantelet vertueux'),
(22084, 'None', 'Quest', 60, 'Feet', 2797, 100, 'Sandales vertueuses'),
(22085, 'None', 'Quest', 66, 'Legs', 4356, 100, 'Jupe vertueuse'),
(22149, 'None', 'Quest', 63, 'Neck', 2182, 100, 'Perles de mojo ogre'),
(22234, 'None', 'Lord Roccor', 53, 'Shoulder', 2182, 100, 'Mantelet de l\'espoir perdu'),
(22247, 'None', 'Warchief Rend Blackhand', 63, 'Feet', 3083, 100, 'Bottes de guérisseur miraculeux'),
(22254, 'None', 'None', 57, 'Ranged', 1364, 100, 'Baguette de lumière éternelle'),
(22257, 'None', 'Gorosh the Dervish', 57, 'Finger', 1786, 100, 'Anneau souillé de sang'),
(22268, 'None', 'General Drakkisath', 63, 'Trinket', 2778, 100, 'Emblème draconique imprégné'),
(22272, 'None', 'Quest', 52, 'Chest', 2704, 100, 'Etreinte de la forêt'),
(22275, 'None', 'Hurley Blackbreath', 57, 'Feet', 2524, 100, 'Bottes Mousse-de-feu'),
(22398, 'None', 'Mor Grayhoof', 62, 'Relic', 1614, 100, 'Idole de récupération'),
(22406, 'None', 'Cannon Master Willey', 61, 'TwoHand', 3721, 100, 'Rédemption'),
(22407, 'None', 'Cannon Master Willey', 61, 'Head', 3721, 100, 'Casque de la nouvelle lune'),
(23201, 'None', 'None', 65, 'Relic', 1774, 100, 'Libram de divinité');

-- --------------------------------------------------------

--
-- Table structure for table `item_assignment`
--

CREATE TABLE `item_assignment` (
  `item` int(11) NOT NULL,
  `class` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_assignment`
--

INSERT INTO `item_assignment` (`item`, `class`) VALUES
(10659, 'Druid'),
(11624, 'Druid'),
(11819, 'Druid'),
(11832, 'Druid'),
(11923, 'Druid'),
(11928, 'Druid'),
(11932, 'Druid'),
(12543, 'Druid'),
(12554, 'Druid'),
(12930, 'Druid'),
(12960, 'Druid'),
(13102, 'Druid'),
(13141, 'Druid'),
(13161, 'Druid'),
(13178, 'Druid'),
(13206, 'Druid'),
(13253, 'Druid'),
(13345, 'Druid'),
(13346, 'Druid'),
(13954, 'Druid'),
(13968, 'Druid'),
(15061, 'Druid'),
(16058, 'Druid'),
(16714, 'Druid'),
(16830, 'Druid'),
(16835, 'Druid'),
(16900, 'Druid'),
(17067, 'Druid'),
(17073, 'Druid'),
(17078, 'Druid'),
(17105, 'Druid'),
(18205, 'Druid'),
(18309, 'Druid'),
(18317, 'Druid'),
(18327, 'Druid'),
(18386, 'Druid'),
(18389, 'Druid'),
(18391, 'Druid'),
(18395, 'Druid'),
(18470, 'Druid'),
(18510, 'Druid'),
(18523, 'Druid'),
(18525, 'Druid'),
(18682, 'Druid'),
(18723, 'Druid'),
(18727, 'Druid'),
(18810, 'Druid'),
(18813, 'Druid'),
(18875, 'Druid'),
(19098, 'Druid'),
(19312, 'Druid'),
(20666, 'Druid'),
(22234, 'Druid'),
(22247, 'Druid'),
(22257, 'Druid'),
(22268, 'Druid'),
(22272, 'Druid'),
(22275, 'Druid'),
(22398, 'Druid'),
(22406, 'Druid'),
(22407, 'Druid'),
(10659, 'Hunter'),
(16849, 'Hunter'),
(16939, 'Hunter'),
(18723, 'Hunter'),
(10213, 'Mage'),
(10659, 'Mage'),
(11624, 'Mage'),
(11832, 'Mage'),
(11924, 'Mage'),
(12543, 'Mage'),
(12546, 'Mage'),
(12930, 'Mage'),
(13161, 'Mage'),
(13253, 'Mage'),
(13345, 'Mage'),
(13938, 'Mage'),
(13968, 'Mage'),
(16914, 'Mage'),
(17067, 'Mage'),
(17078, 'Mage'),
(18317, 'Mage'),
(18526, 'Mage'),
(18723, 'Mage'),
(18727, 'Mage'),
(18832, 'Mage'),
(22268, 'Mage'),
(10659, 'Paladin'),
(11819, 'Paladin'),
(11832, 'Paladin'),
(11923, 'Paladin'),
(11928, 'Paladin'),
(12543, 'Paladin'),
(12554, 'Paladin'),
(12633, 'Paladin'),
(12930, 'Paladin'),
(12960, 'Paladin'),
(13102, 'Paladin'),
(13141, 'Paladin'),
(13168, 'Paladin'),
(13178, 'Paladin'),
(13205, 'Paladin'),
(13206, 'Paladin'),
(13253, 'Paladin'),
(13345, 'Paladin'),
(13346, 'Paladin'),
(13954, 'Paladin'),
(13969, 'Paladin'),
(14522, 'Paladin'),
(14548, 'Paladin'),
(15061, 'Paladin'),
(16058, 'Paladin'),
(16854, 'Paladin'),
(16858, 'Paladin'),
(16859, 'Paladin'),
(16860, 'Paladin'),
(16955, 'Paladin'),
(17067, 'Paladin'),
(17073, 'Paladin'),
(17105, 'Paladin'),
(18205, 'Paladin'),
(18309, 'Paladin'),
(18317, 'Paladin'),
(18318, 'Paladin'),
(18327, 'Paladin'),
(18386, 'Paladin'),
(18389, 'Paladin'),
(18391, 'Paladin'),
(18395, 'Paladin'),
(18472, 'Paladin'),
(18510, 'Paladin'),
(18523, 'Paladin'),
(18525, 'Paladin'),
(18526, 'Paladin'),
(18527, 'Paladin'),
(18682, 'Paladin'),
(18702, 'Paladin'),
(18723, 'Paladin'),
(18727, 'Paladin'),
(18810, 'Paladin'),
(18813, 'Paladin'),
(18875, 'Paladin'),
(19098, 'Paladin'),
(19312, 'Paladin'),
(20666, 'Paladin'),
(22234, 'Paladin'),
(22247, 'Paladin'),
(22257, 'Paladin'),
(22268, 'Paladin'),
(22275, 'Paladin'),
(22407, 'Paladin'),
(23201, 'Paladin'),
(10213, 'Priest'),
(10659, 'Priest'),
(11624, 'Priest'),
(11819, 'Priest'),
(11832, 'Priest'),
(11923, 'Priest'),
(11924, 'Priest'),
(11928, 'Priest'),
(11932, 'Priest'),
(12543, 'Priest'),
(12546, 'Priest'),
(12554, 'Priest'),
(12930, 'Priest'),
(13102, 'Priest'),
(13141, 'Priest'),
(13161, 'Priest'),
(13178, 'Priest'),
(13206, 'Priest'),
(13253, 'Priest'),
(13345, 'Priest'),
(13346, 'Priest'),
(13938, 'Priest'),
(13968, 'Priest'),
(14154, 'Priest'),
(16058, 'Priest'),
(16693, 'Priest'),
(16812, 'Priest'),
(16814, 'Priest'),
(16819, 'Priest'),
(16921, 'Priest'),
(17067, 'Priest'),
(17078, 'Priest'),
(17105, 'Priest'),
(18317, 'Priest'),
(18327, 'Priest'),
(18386, 'Priest'),
(18389, 'Priest'),
(18395, 'Priest'),
(18469, 'Priest'),
(18510, 'Priest'),
(18523, 'Priest'),
(18526, 'Priest'),
(18608, 'Priest'),
(18646, 'Priest'),
(18723, 'Priest'),
(18727, 'Priest'),
(19098, 'Priest'),
(19312, 'Priest'),
(19990, 'Priest'),
(20666, 'Priest'),
(22078, 'Priest'),
(22079, 'Priest'),
(22081, 'Priest'),
(22082, 'Priest'),
(22084, 'Priest'),
(22085, 'Priest'),
(22149, 'Priest'),
(22234, 'Priest'),
(22247, 'Priest'),
(22254, 'Priest'),
(22257, 'Priest'),
(22268, 'Priest'),
(22406, 'Priest'),
(10659, 'Rogue'),
(16822, 'Rogue'),
(16908, 'Rogue'),
(17075, 'Rogue'),
(18205, 'Rogue'),
(18723, 'Rogue'),
(18832, 'Rogue'),
(10659, 'Shaman'),
(11624, 'Shaman'),
(11819, 'Shaman'),
(11832, 'Shaman'),
(11923, 'Shaman'),
(11928, 'Shaman'),
(11932, 'Shaman'),
(12543, 'Shaman'),
(12554, 'Shaman'),
(12930, 'Shaman'),
(12960, 'Shaman'),
(13102, 'Shaman'),
(13141, 'Shaman'),
(13161, 'Shaman'),
(13178, 'Shaman'),
(13205, 'Shaman'),
(13206, 'Shaman'),
(13253, 'Shaman'),
(13345, 'Shaman'),
(13346, 'Shaman'),
(13954, 'Shaman'),
(13968, 'Shaman'),
(13969, 'Shaman'),
(14522, 'Shaman'),
(14548, 'Shaman'),
(15061, 'Shaman'),
(16058, 'Shaman'),
(17067, 'Shaman'),
(17068, 'Shaman'),
(17073, 'Shaman'),
(17078, 'Shaman'),
(17105, 'Shaman'),
(18205, 'Shaman'),
(18309, 'Shaman'),
(18317, 'Shaman'),
(18318, 'Shaman'),
(18327, 'Shaman'),
(18386, 'Shaman'),
(18389, 'Shaman'),
(18391, 'Shaman'),
(18395, 'Shaman'),
(18510, 'Shaman'),
(18523, 'Shaman'),
(18525, 'Shaman'),
(18527, 'Shaman'),
(18682, 'Shaman'),
(18723, 'Shaman'),
(18727, 'Shaman'),
(18810, 'Shaman'),
(18875, 'Shaman'),
(19098, 'Shaman'),
(19312, 'Shaman'),
(20666, 'Shaman'),
(22234, 'Shaman'),
(22247, 'Shaman'),
(22257, 'Shaman'),
(22268, 'Shaman'),
(22275, 'Shaman'),
(22406, 'Shaman'),
(22407, 'Shaman'),
(10213, 'Warlock'),
(10659, 'Warlock'),
(11624, 'Warlock'),
(11832, 'Warlock'),
(11924, 'Warlock'),
(12543, 'Warlock'),
(12546, 'Warlock'),
(12930, 'Warlock'),
(13161, 'Warlock'),
(13253, 'Warlock'),
(13345, 'Warlock'),
(13938, 'Warlock'),
(13968, 'Warlock'),
(16929, 'Warlock'),
(17078, 'Warlock'),
(18317, 'Warlock'),
(18526, 'Warlock'),
(18723, 'Warlock'),
(18727, 'Warlock'),
(22268, 'Warlock'),
(10659, 'Warrior'),
(12633, 'Warrior'),
(16861, 'Warrior'),
(16863, 'Warrior'),
(16963, 'Warrior'),
(17068, 'Warrior'),
(17073, 'Warrior'),
(17075, 'Warrior'),
(18205, 'Warrior'),
(18702, 'Warrior'),
(18723, 'Warrior'),
(18813, 'Warrior'),
(18832, 'Warrior');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `class` varchar(16) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `class`, `enable`) VALUES
(1, 'Galyenai', 'Priest', 1),
(2, 'Sancti', 'Paladin', 1),
(3, 'Gifflemoi', 'Paladin', 1),
(4, 'Ivori', 'Druid', 1),
(5, 'Noireneige', 'Priest', 1),
(6, 'Hexarium', 'Priest', 1),
(7, 'Ticlin', 'Priest', 1),
(8, 'Udico', 'Warrior', 1),
(9, 'Timi', 'Warrior', 1),
(10, 'Unaviable', 'Druid', 1),
(11, 'Sikaro', 'Warrior', 1),
(12, 'Hipsa', 'Warrior', 1),
(13, 'Tomahte', 'Warrior', 1),
(14, 'Titijack', 'Warrior', 1),
(15, 'Anthony', 'Warrior', 1),
(16, 'Zrale', 'Rogue', 1),
(17, 'Skybao', 'Rogue', 1),
(18, 'Khuzdul', 'Rogue', 1),
(19, 'Manolito', 'Rogue', 1),
(20, 'Drosvarg', 'Rogue', 1),
(21, 'Lakokett', 'Hunter', 1),
(22, 'Nokorz', 'Hunter', 1),
(24, 'Artec', 'Hunter', 1),
(25, 'Exola', 'Mage', 1),
(26, 'Jobel', 'Mage', 1),
(27, 'Bruja', 'Mage', 0),
(28, 'Phoceen', 'Mage', 1),
(29, 'Altah', 'Mage', 1),
(30, 'Galyen', 'Mage', 1),
(31, 'Archibad', 'Warlock', 1),
(32, 'Nordvpn', 'Warlock', 1),
(33, 'Malox', 'Warlock', 1),
(34, 'Akali', 'Warlock', 1),
(36, 'Cyclope', 'Druid', 1),
(37, 'Laszéfir (Xena)', 'Paladin', 1),
(38, 'Courgettev', 'Paladin', 0),
(39, 'Belouange', 'Paladin', 1),
(40, 'Nicororo', 'Paladin', 1),
(41, 'Aspirine', 'Druid', 1),
(42, 'Xientor', 'Druid', 1),
(43, 'Cortex', 'Mage', 1),
(44, 'Mauldark', 'Rogue', 1),
(45, 'Laykka', 'Mage', 1),
(47, 'Incolas', 'Paladin', 1),
(48, 'Seuny', 'Paladin', 1),
(49, 'Wiplitos', 'Paladin', 1),
(51, 'Arakam', 'Hunter', 1),
(52, 'Palotte', 'Warrior', 1),
(53, 'Haldus', 'Mage', 1),
(56, 'Trygain', 'Rogue', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_ep`
-- (See below for the actual view)
--
CREATE TABLE `player_ep` (
`player` int(11)
,`name` varchar(64)
,`ep` bigint(17)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_gp`
-- (See below for the actual view)
--
CREATE TABLE `player_gp` (
`player` int(11)
,`player_name` varchar(64)
,`gp` double(17,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_last_loot`
-- (See below for the actual view)
--
CREATE TABLE `player_last_loot` (
`player` int(11)
,`name` varchar(64)
,`loot_date` datetime
,`attribution` varchar(32)
);

-- --------------------------------------------------------

--
-- Table structure for table `player_loot`
--

CREATE TABLE `player_loot` (
  `player` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `raid` int(11) NOT NULL,
  `attribution` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_loot`
--

INSERT INTO `player_loot` (`player`, `item`, `raid`, `attribution`) VALUES
(1, 11819, 0, 'noRaid'),
(1, 11832, 0, 'noRaid'),
(1, 11924, 0, 'noRaid'),
(1, 11932, 0, 'noRaid'),
(1, 12554, 0, 'noRaid'),
(1, 13141, 0, 'noRaid'),
(1, 13178, 0, 'noRaid'),
(1, 13346, 0, 'noRaid'),
(1, 13938, 0, 'noRaid'),
(1, 14154, 0, 'noRaid'),
(1, 16058, 0, 'noRaid'),
(1, 16814, 0, 'noRaid'),
(1, 18469, 0, 'noRaid'),
(1, 18510, 0, 'noRaid'),
(1, 18727, 0, 'noRaid'),
(1, 22078, 0, 'noRaid'),
(1, 22079, 0, 'noRaid'),
(1, 22081, 0, 'noRaid'),
(1, 22082, 0, 'noRaid'),
(1, 22084, 0, 'noRaid'),
(1, 22085, 0, 'noRaid'),
(1, 22149, 0, 'noRaid'),
(1, 22234, 0, 'noRaid'),
(1, 22247, 0, 'noRaid'),
(2, 10659, 0, 'noRaid'),
(2, 12554, 0, 'noRaid'),
(2, 13141, 0, 'noRaid'),
(2, 13168, 0, 'noRaid'),
(2, 13205, 0, 'noRaid'),
(2, 13345, 0, 'noRaid'),
(2, 13969, 0, 'noRaid'),
(2, 14522, 0, 'noRaid'),
(2, 14548, 0, 'noRaid'),
(2, 16058, 0, 'noRaid'),
(2, 16854, 2, 'secondary'),
(2, 16858, 0, 'noRaid'),
(2, 18318, 0, 'noRaid'),
(2, 18389, 0, 'noRaid'),
(2, 18472, 0, 'noRaid'),
(2, 18526, 0, 'noRaid'),
(2, 20666, 0, 'noRaid'),
(2, 23201, 0, 'noRaid'),
(3, 11819, 0, 'noRaid'),
(3, 11923, 0, 'noRaid'),
(3, 12543, 0, 'noRaid'),
(3, 12930, 0, 'noRaid'),
(3, 13346, 0, 'noRaid'),
(3, 13954, 0, 'noRaid'),
(3, 13969, 0, 'noRaid'),
(3, 16058, 0, 'noRaid'),
(3, 18309, 0, 'noRaid'),
(3, 18386, 0, 'noRaid'),
(3, 18391, 0, 'noRaid'),
(3, 18510, 0, 'noRaid'),
(3, 18523, 0, 'noRaid'),
(3, 18723, 0, 'noRaid'),
(3, 18727, 0, 'noRaid'),
(3, 22234, 0, 'noRaid'),
(3, 23201, 0, 'noRaid'),
(4, 11832, 0, 'noRaid'),
(4, 11924, 0, 'noRaid'),
(4, 12543, 0, 'noRaid'),
(4, 12960, 0, 'noRaid'),
(4, 13161, 0, 'noRaid'),
(4, 13253, 0, 'noRaid'),
(4, 15061, 0, 'noRaid'),
(4, 16714, 0, 'noRaid'),
(4, 16830, 2, 'secondary'),
(4, 18317, 0, 'noRaid'),
(4, 18327, 0, 'noRaid'),
(4, 18470, 0, 'noRaid'),
(4, 18510, 0, 'noRaid'),
(4, 18682, 0, 'noRaid'),
(4, 22275, 0, 'noRaid'),
(5, 11923, 0, 'noRaid'),
(5, 11928, 0, 'noRaid'),
(5, 12546, 0, 'noRaid'),
(5, 12554, 0, 'noRaid'),
(5, 13178, 0, 'noRaid'),
(5, 13346, 0, 'noRaid'),
(5, 13968, 0, 'noRaid'),
(5, 16058, 0, 'noRaid'),
(5, 18327, 0, 'noRaid'),
(5, 18386, 0, 'noRaid'),
(5, 18469, 0, 'noRaid'),
(5, 18510, 0, 'noRaid'),
(5, 18723, 0, 'noRaid'),
(5, 18727, 0, 'noRaid'),
(5, 22234, 0, 'noRaid'),
(5, 22247, 0, 'noRaid'),
(5, 22254, 0, 'noRaid'),
(6, 10213, 0, 'noRaid'),
(6, 12554, 0, 'noRaid'),
(6, 13102, 0, 'noRaid'),
(6, 13346, 0, 'noRaid'),
(6, 16058, 0, 'noRaid'),
(6, 18327, 0, 'noRaid'),
(6, 18386, 0, 'noRaid'),
(6, 18389, 0, 'noRaid'),
(6, 18395, 0, 'noRaid'),
(6, 18469, 0, 'noRaid'),
(6, 18723, 0, 'noRaid'),
(6, 19990, 0, 'noRaid'),
(6, 22234, 0, 'noRaid'),
(6, 22247, 0, 'noRaid'),
(6, 22254, 0, 'noRaid'),
(6, 22406, 0, 'noRaid'),
(7, 11624, 0, 'noRaid'),
(7, 11932, 0, 'noRaid'),
(7, 12543, 0, 'noRaid'),
(7, 13206, 0, 'noRaid'),
(7, 13253, 0, 'noRaid'),
(7, 13346, 0, 'noRaid'),
(7, 13938, 0, 'noRaid'),
(7, 13968, 0, 'noRaid'),
(7, 16058, 0, 'noRaid'),
(7, 16693, 0, 'noRaid'),
(7, 16819, 0, 'noRaid'),
(7, 18327, 0, 'noRaid'),
(7, 18469, 0, 'noRaid'),
(7, 18510, 0, 'noRaid'),
(7, 19098, 0, 'noRaid'),
(7, 22079, 0, 'noRaid'),
(7, 22247, 0, 'noRaid'),
(8, 16861, 0, 'noRaid'),
(9, 16861, 2, 'primary'),
(9, 16863, 2, 'primary'),
(11, 17073, 2, 'secondary'),
(14, 18832, 2, 'primary'),
(20, 16822, 2, 'primary'),
(24, 16849, 2, 'primary'),
(37, 16859, 2, 'secondary'),
(38, 11923, 0, 'noRaid'),
(38, 12543, 0, 'noRaid'),
(38, 12633, 0, 'noRaid'),
(38, 13346, 0, 'noRaid'),
(38, 15061, 0, 'noRaid'),
(38, 18472, 0, 'noRaid'),
(38, 18523, 0, 'noRaid'),
(38, 18525, 0, 'noRaid'),
(38, 18527, 0, 'noRaid'),
(38, 18702, 0, 'noRaid'),
(38, 18723, 0, 'noRaid'),
(38, 22247, 0, 'noRaid'),
(38, 22257, 0, 'noRaid'),
(38, 22268, 0, 'noRaid'),
(38, 23201, 0, 'noRaid'),
(39, 16860, 2, 'secondary'),
(41, 11819, 0, 'noRaid'),
(41, 11923, 0, 'noRaid'),
(41, 12554, 0, 'noRaid'),
(41, 13178, 0, 'noRaid'),
(41, 13954, 0, 'noRaid'),
(41, 15061, 0, 'noRaid'),
(41, 16058, 0, 'noRaid'),
(41, 16835, 2, 'secondary'),
(41, 18386, 0, 'noRaid'),
(41, 18391, 0, 'noRaid'),
(41, 18470, 0, 'noRaid'),
(41, 18510, 0, 'noRaid'),
(41, 18525, 0, 'noRaid'),
(41, 18723, 0, 'noRaid'),
(41, 19312, 0, 'noRaid'),
(41, 22272, 0, 'noRaid'),
(41, 22398, 0, 'noRaid'),
(41, 22407, 0, 'noRaid');

-- --------------------------------------------------------

--
-- Table structure for table `raid`
--

CREATE TABLE `raid` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `instance` varchar(8) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `running` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raid`
--

INSERT INTO `raid` (`id`, `name`, `instance`, `date`, `running`) VALUES
(2, 'First Full Guilde ou Presque', 'MC', '2022-01-05 00:00:00', 0),
(3, 'Onyxia mi pu', 'Boss', '2022-01-06 00:00:00', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `raid_attendance`
-- (See below for the actual view)
--
CREATE TABLE `raid_attendance` (
`player` int(11)
,`name` varchar(64)
,`instance` varchar(8)
,`period` varchar(6)
,`attendance` decimal(23,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `raid_entry`
--

CREATE TABLE `raid_entry` (
  `raid` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `bench` tinyint(1) NOT NULL DEFAULT 0,
  `absent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raid_entry`
--

INSERT INTO `raid_entry` (`raid`, `player`, `bench`, `absent`) VALUES
(2, 1, 0, 0),
(2, 2, 0, 0),
(2, 3, 0, 0),
(2, 4, 0, 0),
(2, 5, 0, 0),
(2, 7, 0, 0),
(2, 8, 0, 0),
(2, 9, 0, 0),
(2, 10, 0, 0),
(2, 11, 0, 0),
(2, 12, 0, 0),
(2, 13, 0, 0),
(2, 14, 0, 0),
(2, 17, 0, 0),
(2, 18, 0, 0),
(2, 19, 0, 0),
(2, 20, 0, 0),
(2, 22, 0, 0),
(2, 24, 0, 0),
(2, 26, 0, 0),
(2, 27, 0, 0),
(2, 28, 0, 0),
(2, 29, 0, 0),
(2, 30, 0, 0),
(2, 31, 0, 0),
(2, 32, 0, 0),
(2, 33, 0, 0),
(2, 36, 1, 0),
(2, 37, 0, 0),
(2, 38, 0, 0),
(2, 39, 0, 0),
(2, 41, 0, 0),
(2, 42, 0, 0),
(2, 43, 0, 0),
(2, 44, 0, 0),
(2, 45, 0, 0),
(2, 48, 0, 0),
(2, 49, 0, 0),
(2, 51, 0, 0),
(2, 52, 0, 0),
(3, 1, 0, 0),
(3, 2, 0, 0),
(3, 5, 0, 0),
(3, 7, 0, 0),
(3, 8, 0, 0),
(3, 11, 0, 0),
(3, 18, 0, 0),
(3, 20, 0, 0),
(3, 26, 0, 0),
(3, 29, 0, 0),
(3, 31, 0, 0),
(3, 32, 0, 0),
(3, 37, 0, 0),
(3, 41, 0, 0),
(3, 42, 0, 0),
(3, 44, 0, 0),
(3, 45, 0, 0),
(3, 51, 0, 0),
(3, 52, 0, 0),
(3, 53, 0, 0),
(3, 56, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `raid_ep`
-- (See below for the actual view)
--
CREATE TABLE `raid_ep` (
`raid` int(11)
,`name` varchar(128)
,`instance` varchar(8)
,`date` datetime
,`size` bigint(21)
,`week_ago` int(6)
,`initial_ep` decimal(32,0)
,`ep` double(17,0)
,`initial_ep_per_player` bigint(21)
,`ep_per_player` bigint(17)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `raid_size`
-- (See below for the actual view)
--
CREATE TABLE `raid_size` (
`raid` int(11)
,`size` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `role` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `role`) VALUES
(1, 'shionn@gmail.com', 'ed453ddf63a61d059c415674b8934606b54a15b4bcb79553ffe11dbf130f158b', 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Structure for view `epgp`
--
DROP TABLE IF EXISTS `epgp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `epgp`  AS SELECT `ep`.`player` AS `player`, `ep`.`name` AS `name`, `ep`.`ep` AS `ep`, `gp`.`gp` AS `gp`, `gp`.`gp`/ `ep`.`ep` AS `epgp_ratio` FROM (`player_ep` `ep` left join `player_gp` `gp` on(`gp`.`player` = `ep`.`player`)) ;

-- --------------------------------------------------------

--
-- Structure for view `player_ep`
--
DROP TABLE IF EXISTS `player_ep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_ep`  AS SELECT `p`.`id` AS `player`, `p`.`name` AS `name`, `ep`.`ep_per_player` AS `ep` FROM ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player`)) join `raid_ep` `ep` on(`re`.`raid` = `ep`.`raid`)) GROUP BY `re`.`player` ;

-- --------------------------------------------------------

--
-- Structure for view `player_gp`
--
DROP TABLE IF EXISTS `player_gp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_gp`  AS SELECT `p`.`id` AS `player`, `p`.`name` AS `player_name`, sum(round(`i`.`pt` * pow(0.9,(to_days(curdate()) - to_days(`r`.`date`)) DIV 7),0)) AS `gp` FROM (((`player` `p` join `player_loot` `pl` on(`p`.`id` = `pl`.`player` and (`pl`.`attribution` = 'primary' or `pl`.`attribution` = 'wishList'))) join `raid` `r` on(`r`.`id` = `pl`.`raid`)) join `item` `i` on(`i`.`id` = `pl`.`item`)) GROUP BY `pl`.`player` ;

-- --------------------------------------------------------

--
-- Structure for view `player_last_loot`
--
DROP TABLE IF EXISTS `player_last_loot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_last_loot`  AS SELECT `e`.`player` AS `player`, `p`.`name` AS `name`, max(`r`.`date`) AS `loot_date`, `l`.`attribution` AS `attribution` FROM (((`raid` `r` join `raid_entry` `e` on(`r`.`id` = `e`.`raid`)) join `player_loot` `l` on(`r`.`id` = `l`.`raid` and `l`.`player` = `e`.`player`)) join `player` `p` on(`p`.`id` = `l`.`player`)) GROUP BY `e`.`player`, `l`.`attribution` ;

-- --------------------------------------------------------

--
-- Structure for view `raid_attendance`
--
DROP TABLE IF EXISTS `raid_attendance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_attendance`  AS  (select `p`.`id` AS `player`,`p`.`name` AS `name`,`r`.`instance` AS `instance`,'always' AS `period`,sum(1) AS `attendance` from ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player`)) join `raid` `r` on(`r`.`id` = `re`.`raid`)) group by `re`.`player`,`r`.`instance`) union (select `p`.`id` AS `player`,`p`.`name` AS `name`,`r`.`instance` AS `instance`,'day28' AS `period`,sum(1) AS `attendance` from ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player`)) join `raid` `r` on(`r`.`id` = `re`.`raid` and `r`.`date` >= cast(current_timestamp() - interval 28 day as date))) group by `re`.`player`,`r`.`instance`) union (select `p`.`id` AS `player`,`p`.`name` AS `name`,`r`.`instance` AS `instance`,'day14' AS `period`,sum(1) AS `attendance` from ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player`)) join `raid` `r` on(`r`.`id` = `re`.`raid` and `r`.`date` >= cast(current_timestamp() - interval 14 day as date))) group by `re`.`player`,`r`.`instance`) ;

-- --------------------------------------------------------

--
-- Structure for view `raid_ep`
--
DROP TABLE IF EXISTS `raid_ep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_ep`  AS SELECT `r`.`id` AS `raid`, `r`.`name` AS `name`, `r`.`instance` AS `instance`, `r`.`date` AS `date`, `rs`.`size` AS `size`, (to_days(curdate()) - to_days(`r`.`date`)) DIV 7 AS `week_ago`, sum(`i`.`pt`) AS `initial_ep`, round(sum(`i`.`pt`) * pow(0.9,(to_days(curdate()) - to_days(`r`.`date`)) DIV 7),0) AS `ep`, sum(`i`.`pt`) DIV `rs`.`size` AS `initial_ep_per_player`, round(sum(`i`.`pt`) * pow(0.9,(to_days(curdate()) - to_days(`r`.`date`)) DIV 7),0) DIV `rs`.`size` AS `ep_per_player` FROM (((`raid` `r` join `raid_size` `rs` on(`r`.`id` = `rs`.`raid`)) join `player_loot` `pl` on(`r`.`id` = `pl`.`raid` and (`pl`.`attribution` = 'primary' or `pl`.`attribution` = 'wishList'))) join `item` `i` on(`i`.`id` = `pl`.`item`)) GROUP BY `r`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `raid_size`
--
DROP TABLE IF EXISTS `raid_size`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_size`  AS SELECT `r`.`id` AS `raid`, count(`e`.`player`) AS `size` FROM (`raid` `r` join `raid_entry` `e` on(`r`.`id` = `e`.`raid` and `e`.`bench` is false and `e`.`absent` is false)) GROUP BY `e`.`raid` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_assignment`
--
ALTER TABLE `item_assignment`
  ADD PRIMARY KEY (`class`,`item`),
  ADD KEY `item` (`item`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `player_loot`
--
ALTER TABLE `player_loot`
  ADD PRIMARY KEY (`player`,`item`,`raid`),
  ADD KEY `raid` (`raid`),
  ADD KEY `item` (`item`);

--
-- Indexes for table `raid`
--
ALTER TABLE `raid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raid_entry`
--
ALTER TABLE `raid_entry`
  ADD PRIMARY KEY (`raid`,`player`),
  ADD KEY `player` (`player`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `raid`
--
ALTER TABLE `raid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_assignment`
--
ALTER TABLE `item_assignment`
  ADD CONSTRAINT `item_assignment_ibfk_1` FOREIGN KEY (`item`) REFERENCES `item` (`id`);

--
-- Constraints for table `raid_entry`
--
ALTER TABLE `raid_entry`
  ADD CONSTRAINT `raid_entry_ibfk_1` FOREIGN KEY (`raid`) REFERENCES `raid` (`id`),
  ADD CONSTRAINT `raid_entry_ibfk_2` FOREIGN KEY (`player`) REFERENCES `player` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
