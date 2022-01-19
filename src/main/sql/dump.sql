-- phpMyAdmin SQL Dump
-- version 5.0.4deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 19, 2022 at 12:16 PM
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
,`ep` decimal(44,1)
,`gp` double(17,0)
,`epgp_ratio` double(22,5)
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
(7721, 'None', 'High Inquisitor Whitemane', 44, 'MainHand', 813, 100, 'Main de la droiture'),
(7728, 'None', 'None', 34, 'Chest', 1156, 100, 'Robe de tromperie'),
(10213, 'None', 'None', 58, 'Wrist', 1850, 100, 'Brassards élégants'),
(10659, 'None', 'Quest', 57, 'Trinket', 2274, 100, 'Éclat des Sabots-Fendus'),
(11623, 'None', 'Houndmaster Grebmar', 52, 'Back', 1487, 100, 'Cape de l\'esprit follet'),
(11624, 'None', 'High Interrogator Gerstahn', 52, 'Shoulder', 2101, 100, 'Amict d\'illumination'),
(11634, 'None', 'Hedrum the Creeper', 54, 'Hands', 2265, 100, 'Gants arachnéens'),
(11665, 'None', 'Ok\'thor the Breaker', 54, 'Hands', 2265, 100, 'Poings de l\'ogre prophète'),
(11669, 'None', 'Golem Lord Argelmach', 59, 'Finger', 1914, 100, 'Anneau des grandes arcanes'),
(11684, 'None', 'Emperor Dagran Thaurissan', 60, 'OneHand', 1512, 100, 'Hostefer'),
(11726, 'None', 'Gorosh the Dervish', 57, 'Chest', 3249, 100, 'Cotte d\'anneaux de gladiateur sauvage'),
(11735, 'None', 'Hurley Blackbreath', 57, 'Head', 3249, 100, 'Couvre-oeil du Forcené'),
(11784, 'None', 'Warder Stilgiss', 53, 'MainHand', 1179, 100, 'Lame de l\'arbitre'),
(11815, 'None', 'Emperor Dagran Thaurissan', 58, 'Trinket', 2354, 100, 'Main de justice'),
(11819, 'None', 'Golem Lord Argelmach', 59, 'Trinket', 2436, 100, 'Second souffle'),
(11822, 'None', 'Golem Lord Argelmach', 59, 'Feet', 2704, 100, 'Bottes de concentration'),
(11823, 'None', 'Golem Lord Argelmach', 59, 'Legs', 3481, 100, 'Kilt d\'illumination'),
(11832, 'None', 'Ambassador Flamelash', 58, 'Trinket', 2354, 100, 'Bijou de connaissance'),
(11841, 'None', 'Fineous Darkvire', 55, 'Legs', 3025, 100, 'Pantalon du grand concepteur'),
(11842, 'None', 'Fineous Darkvire', 55, 'Shoulder', 2350, 100, 'Mantelet de géomètre en chef'),
(11923, 'None', 'None', 57, 'MainHand', 1364, 100, 'Marteau de béatitude'),
(11924, 'None', 'Emperor Dagran Thaurissan', 60, 'Chest', 3600, 100, 'Robe de la couronne royale'),
(11926, 'None', 'Doom\'rel', 57, 'Chest', 3249, 100, 'Cuirasse de dispensateur de mort'),
(11928, 'None', 'Emperor Dagran Thaurissan', 60, 'HeldInOffhand', 1980, 100, 'Sceptre royal de Thaurissan'),
(11932, 'None', 'Emperor Dagran Thaurissan', 59, 'TwoHand', 3481, 100, 'Bâton guide de sagesse'),
(12543, 'None', 'Quest', 60, 'Finger', 1980, 100, 'Pierre chantante d\'Ironforge'),
(12546, 'None', 'None', 54, 'Wrist', 1603, 100, 'Crispins aristocratiques'),
(12548, 'None', 'Quest', 60, 'Finger', 1980, 100, 'Volonté de Magni'),
(12554, 'None', 'Princess Moira Bronzebeard', 59, 'Hands', 2704, 100, 'Gants du héraut exalté'),
(12587, 'None', 'Warchief Rend Blackhand', 63, 'Head', 3969, 100, 'Oeil de Rend'),
(12590, 'None', 'Warchief Rend Blackhand', 63, 'OneHand', 1666, 100, 'Trucidante'),
(12602, 'None', 'General Drakkisath', 63, 'OffHand', 2182, 100, 'Déflecteur draconien'),
(12633, 'None', 'None', 60, 'Head', 3600, 100, 'Heaume d\'âme blanche'),
(12651, 'None', 'Shadow Hunter Vosh\'gajin', 59, 'Ranged', 1462, 100, 'Corbeau noir'),
(12927, 'None', 'Pyroguard Emberseer', 61, 'Shoulder', 2891, 100, 'Epaulières de précision'),
(12930, 'None', 'Jed Runewatcher', 60, 'Trinket', 2520, 100, 'Pipeau de bruyère'),
(12936, 'None', 'Warchief Rend Blackhand', 63, 'Wrist', 2182, 100, 'Bracières du champ d\'honneur'),
(12939, 'None', 'Warchief Rend Blackhand', 63, 'OffHand', 2182, 100, 'Gardienne tribale de Dal\'Rend'),
(12940, 'None', 'Warchief Rend Blackhand', 63, 'MainHand', 1666, 100, 'Charge sacrée de Dal\'Rend'),
(12960, 'None', 'Gyth', 60, 'Head', 3600, 100, 'Coiffure de plumes tribale'),
(13070, 'None', 'None', 58, 'Feet', 2613, 100, 'Bottes en écailles de Saphiron'),
(13098, 'None', 'General Drakkisath', 63, 'Finger', 2182, 100, 'Anneau de puissance mortelle'),
(13102, 'None', 'None', 47, 'Head', 2209, 100, 'Grâce de Cassandre'),
(13141, 'None', 'General Drakkisath', 63, 'Neck', 2182, 100, 'Dent de Gnarr'),
(13142, 'None', 'General Drakkisath', 63, 'Waist', 3083, 100, 'Ceinturon de Brigam'),
(13161, 'None', 'Overlord Wyrmthalak', 61, 'TwoHand', 3721, 100, 'Bâton du refuge'),
(13168, 'None', 'Highlord Omokk', 60, 'Chest', 3600, 100, 'Harnois du roi-chaman'),
(13178, 'None', 'Urok Doomhowl', 60, 'Finger', 1980, 100, 'Anneau de rosette'),
(13205, 'None', 'Gizrul the Slavener', 61, 'OffHand', 2046, 100, 'Protecteur de Rhombeard'),
(13206, 'None', 'Gizrul the Slavener', 61, 'Legs', 3721, 100, 'Jambières du tondeur de loups'),
(13253, 'None', 'Quartermaster Zigris', 60, 'Hands', 2797, 100, 'Mains de puissance'),
(13340, 'None', 'Baron Rivendare', 63, 'Back', 2182, 100, 'Cape du baron noir'),
(13344, 'None', 'Baron Rivendare', 63, 'Hands', 3083, 100, 'Gantelets dracoriens'),
(13345, 'None', 'Baron Rivendare', 63, 'Finger', 2182, 100, 'Sceau de Rivendare'),
(13346, 'None', 'Baron Rivendare', 63, 'Chest', 3969, 100, 'Robe de l\'exalté'),
(13373, 'None', 'Ramstein the Gorger', 60, 'Finger', 1980, 100, 'Anneau de chair'),
(13397, 'None', 'Stonespine', 61, 'Back', 2046, 100, 'Cape de la gargouille peau-de-pierre'),
(13400, 'None', 'Timmy the Cruel', 59, 'Wrist', 1914, 100, 'Protège-bras du sadique'),
(13938, 'None', 'Darkmaster Gandling', 62, 'Ranged', 1614, 100, 'Stylet d\'os'),
(13944, 'None', 'Darkmaster Gandling', 62, 'Chest', 3844, 100, 'Cuirasse de la pierre tombale'),
(13954, 'None', 'Stonespine', 61, 'Feet', 2891, 100, 'Bottes verdoyantes'),
(13959, 'None', 'Quest', 60, 'Waist', 2797, 100, 'Corset d\'Omokk'),
(13965, 'None', 'Quest', 63, 'Trinket', 2778, 100, 'Plaque de Blackhand'),
(13967, 'None', 'Kirtonos the Herald', 61, 'Feet', 2891, 100, 'Bottes du Déchirevent'),
(13968, 'None', 'Quest', 63, 'Trinket', 2778, 100, 'Oeil de la Bête'),
(13969, 'None', 'Kirtonos the Herald', 61, 'Wrist', 2046, 100, 'Bracières en faisceaux renforcés'),
(14154, 'None', 'Craft', 62, 'Chest', 3844, 100, 'Habit de vraie foi'),
(14522, 'None', 'Ras Frostwhisper', 62, 'Legs', 3844, 100, 'Jambières du maelstrom'),
(14548, 'None', 'Jandice Barov', 62, 'Shoulder', 2986, 100, 'Spallières royales'),
(15061, 'None', 'Craft', 54, 'Shoulder', 2265, 100, 'Epaulières vivantes'),
(15062, 'None', 'Craft', 60, 'Legs', 3600, 100, 'Jambières diablosaures'),
(15063, 'None', 'Craft', 58, 'Hands', 2613, 100, 'Gantelets diablosaures'),
(15411, 'None', 'Quest', 63, 'Neck', 2182, 100, 'Marque de Fordring'),
(15806, 'None', 'Quest', 61, 'OneHand', 1562, 100, 'Chanson de Mirah'),
(16058, 'None', 'Quest', 63, 'Finger', 2182, 100, 'Sceau de Fordring'),
(16693, 'None', 'Darkmaster Gandling', 62, 'Head', 3844, 100, 'Collerette de dévot'),
(16714, 'None', 'None', 57, 'Wrist', 1786, 100, 'Brassards du Coeur-sauvage'),
(16733, 'None', 'Warchief Rend Blackhand', 60, 'Shoulder', 2797, 100, 'Spallières de vaillance'),
(16734, 'None', 'Kirtonos the Herald', 59, 'Feet', 2704, 100, 'Bottes de vaillance'),
(16735, 'None', 'Quest', 57, 'Wrist', 1786, 100, 'Brassards de vaillance'),
(16796, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Jambières d\'arcaniste'),
(16797, 'MC', 'Baron Geddon', 66, 'Shoulder', 3384, 100, 'Mantelet d\'arcaniste'),
(16799, 'MC', 'Trash', 66, 'Wrist', 2395, 100, 'Manchettes d\'arcaniste'),
(16802, 'MC', 'Trash', 66, 'Waist', 3384, 100, 'Ceinture d\'arcaniste'),
(16805, 'MC', 'Lucifron', 66, 'Hands', 3384, 100, 'Gants de Gangrecoeur'),
(16812, 'MC', 'Gehennas', 66, 'Hands', 3384, 100, 'Gants de prophétie'),
(16814, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Pantalon de prophétie'),
(16815, 'MC', 'Golemagg the Incinerator', 66, 'Chest', 4356, 100, 'Robe de prophétie'),
(16816, 'MC', 'Sulfuron Harbinger', 66, 'Shoulder', 3384, 100, 'Mantelet de prophétie'),
(16817, 'MC', 'Trash', 66, 'Waist', 3384, 100, 'Ceinturon de prophétie'),
(16819, 'None', 'Trash', 66, 'Wrist', 2395, 100, 'Protège-bras de prophétie'),
(16821, 'MC', 'Garr', 66, 'Head', 4356, 100, 'Couvre-chef du tueur de la nuit'),
(16822, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Pantalon du tueur de la nuit'),
(16823, 'MC', 'Sulfuron Harbinger', 66, 'Shoulder', 3384, 100, 'Protège-épaules du tueur de la nuit'),
(16824, 'MC', 'Shazzrah', 66, 'Feet', 3384, 100, 'Bottes du tueur de la nuit'),
(16825, 'MC', 'Craft', 66, 'Wrist', 2395, 100, 'Bracelets du tueur de la nuit'),
(16826, 'MC', 'Gehennas', 66, 'Hands', 3384, 100, 'Gants du tueur de la nuit'),
(16827, 'MC', 'Trash', 66, 'Waist', 3384, 100, 'Ceinture du tueur de la nuit'),
(16829, 'MC', 'Lucifron', 66, 'Feet', 3384, 100, 'Bottes cénariennes'),
(16830, 'MC', 'Multi', 66, 'Wrist', 2395, 100, 'Brassards cénariens'),
(16831, 'MC', 'Shazzrah', 66, 'Hands', 3384, 100, 'Gants cénariens'),
(16835, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Jambières cénariennes'),
(16836, 'MC', 'Baron Geddon', 66, 'Shoulder', 3384, 100, 'Spallières cénariennes'),
(16845, 'MC', 'Golemagg the Incinerator', 66, 'Chest', 4356, 100, 'Cuirasse de traqueur de géant'),
(16849, 'MC', 'Gehennas', 66, 'Feet', 3384, 100, 'Bottes de traqueur de géant'),
(16854, 'MC', 'Garr', 66, 'Head', 2178, 50, 'Heaume judiciaire'),
(16855, 'MC', 'Magmadar', 66, 'Legs', 2178, 50, 'Jambières judiciaires'),
(16857, 'MC', 'Trash', 66, 'Wrist', 1197, 50, 'Brassards judiciaires'),
(16858, 'MC', 'Trash', 66, 'Waist', 1692, 50, 'Ceinture judiciaire'),
(16859, 'MC', 'Lucifron', 66, 'Feet', 1692, 50, 'Bottes judiciaires'),
(16860, 'MC', 'Gehennas', 66, 'Hands', 1692, 50, 'Gantelets judiciaires'),
(16861, 'MC', 'Trash', 66, 'Wrist', 2395, 100, 'Brassards de puissance'),
(16863, 'MC', 'Lucifron', 66, 'Hands', 3384, 100, 'Gantelets de puissance'),
(16864, 'MC', 'Trash', 66, 'Waist', 3384, 100, 'Ceinture de puissance'),
(16867, 'MC', 'Magmadar', 66, 'Legs', 4356, 100, 'Jambières de puissance'),
(16900, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Couvre-chef de Stormrage'),
(16901, 'MC', 'Ragnaros', 76, 'Legs', 5776, 100, 'Jambières de Stormrage'),
(16908, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Cagoule Rougecroc'),
(16914, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Couronne de Vent du néant'),
(16921, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Auréole de transcendance'),
(16922, 'MC', 'Ragnaros', 76, 'Legs', 5776, 100, 'Jambières de transcendance'),
(16929, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Crâne de Némésis'),
(16939, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Casque de traqueur de dragon'),
(16955, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Couronne du jugement'),
(16963, 'Boss', 'Onyxia', 76, 'Head', 5776, 100, 'Heaume de courroux'),
(17044, 'None', 'Quest', 61, 'Neck', 2046, 100, 'Volonté du Martyr'),
(17064, 'Boss', 'Onyxia', 71, 'Trinket', 7057, 200, 'Eclat de l\'Ecaille'),
(17067, 'Boss', 'Onyxia', 76, 'HeldInOffhand', 3176, 100, 'Ancien Grimoire de Cornerstone'),
(17068, 'Boss', 'Onyxia', 75, 'OneHand', 2362, 100, 'Porte-mort'),
(17073, 'MC', 'Magmadar', 66, 'TwoHand', 4356, 100, 'Trembleterre'),
(17075, 'Boss', 'Onyxia', 74, 'OneHand', 4599, 200, 'Vis\'kag le Saigneur'),
(17078, 'Boss', 'Onyxia', 72, 'Back', 2851, 100, 'Drapé de Saphiron'),
(17105, 'MC', 'Garr', 69, 'MainHand', 1999, 100, 'Marteau d\'Aurastone'),
(17110, 'MC', 'Baron Geddon', 70, 'Finger', 2695, 100, 'Sceau de l\'archimagus'),
(17713, 'None', 'Princess Theradras', 54, 'Finger', 1603, 100, 'Anneau de noirepierre'),
(18103, 'None', 'Warchief Rend Blackhand', 63, 'Finger', 2182, 100, 'Anneau de rumination'),
(18205, 'Boss', 'Onyxia', 71, 'Neck', 2772, 100, 'Collier d\'Eskhandar'),
(18309, 'None', 'Alzzin the Wildshaper', 59, 'Hands', 2704, 100, 'Gants de restauration'),
(18314, 'None', 'Alzzin the Wildshaper', 59, 'Finger', 1914, 100, 'Anneau de fourberie démoniaque'),
(18317, 'None', 'Hydrospawn', 58, 'Neck', 1850, 100, 'Talisman de tempête'),
(18318, 'None', 'Alzzin the Wildshaper', 59, 'Feet', 2704, 100, 'Grèves miséricordieuses'),
(18321, 'None', 'Alzzin the Wildshaper', 59, 'MainHand', 1462, 100, 'Bâtonnet énergétique'),
(18323, 'None', 'Zevrim Thornhoof', 58, 'Ranged', 1412, 100, 'Arc du satyre'),
(18327, 'None', 'Alzzin the Wildshaper', 59, 'Waist', 2704, 100, 'Corde de vigne-fouet'),
(18371, 'None', 'Magister Kalendris', 61, 'Trinket', 2604, 100, 'Talisman d\'ouvresprit'),
(18376, 'None', 'Prince Tortheldrin', 62, 'OneHand', 1614, 100, 'Masse usée'),
(18380, 'None', 'Prince Tortheldrin', 62, 'Legs', 3844, 100, 'Jambières indicibles'),
(18386, 'None', 'Illyanna Ravenoak', 61, 'Legs', 3721, 100, 'Pantalon du Padre'),
(18389, 'None', 'Immol\'thar', 62, 'Back', 2114, 100, 'Cape du cosmos'),
(18391, 'None', 'Immol\'thar', 62, 'Waist', 2986, 100, 'Corde de pédoncule'),
(18395, 'None', 'Prince Tortheldrin', 62, 'Finger', 2114, 100, 'Anneau de flamme émeraude'),
(18403, 'Boss', 'Onyxia', 74, 'Finger', 3011, 100, 'Chevalière du tueur de dragon'),
(18404, 'Boss', 'Onyxia', 74, 'Neck', 3011, 100, 'Pendentif en dent d\'Onyxia'),
(18469, 'None', 'Quest', 62, 'Trinket', 2690, 100, 'Sceau royal d\'Eldre\'Thalas'),
(18470, 'None', 'Quest', 62, 'Trinket', 2690, 100, 'Sceau royal d\'Eldre\'Thalas'),
(18472, 'None', 'Quest', 62, 'Trinket', 2690, 100, 'Sceau royal d\'Eldre\'Thalas'),
(18490, 'None', 'Cho\'Rush the Observer', 61, 'Head', 3721, 100, 'Chaperon de perspicacité'),
(18491, 'None', 'Quest', 57, 'OneHand', 1364, 100, 'Tisse-savoir'),
(18495, 'None', 'Mizzle the Crafty', 63, 'Back', 2182, 100, 'Cape du bastion'),
(18503, 'None', 'Captain Kromcrush', 62, 'Chest', 3844, 100, 'Pansière de Kromcrush'),
(18507, 'None', 'Captain Kromcrush', 62, 'Feet', 2986, 100, 'Bottes de la Pleine lune'),
(18510, 'None', 'Craft', 62, 'Back', 2114, 100, 'Peau du Fauve'),
(18523, 'None', 'King Gordok', 63, 'HeldInOffhand', 2182, 100, 'Pierre étincelante'),
(18525, 'None', 'King Gordok', 63, 'Wrist', 2182, 100, 'Brassards de prospérité'),
(18526, 'None', 'King Gordok', 63, 'Head', 3969, 100, 'Couronne du roi des ogres'),
(18527, 'None', 'King Gordok', 63, 'Hands', 3083, 100, 'Gantelets d\'harmonie'),
(18530, 'None', 'Mizzle the Crafty', 62, 'Chest', 3844, 100, 'Haubert ogre'),
(18608, 'MC', 'Majordomo', 75, 'TwoHand', 11250, 200, 'Bénédiction'),
(18646, 'MC', 'Majordomo Executus', 71, 'Trinket', 3528, 100, 'L\'Oeil de la divinité'),
(18682, 'None', 'Multi', 61, 'Legs', 3721, 100, 'Jambières en peau de goule'),
(18702, 'None', 'None', 60, 'Waist', 2797, 100, 'Ceinture des Consacrés'),
(18713, 'MC', 'Multi', 75, 'Ranged', 4725, 200, 'Rhok\'delar, arc long des Gardiens anciens'),
(18720, 'None', 'None', 63, 'Shoulder', 3083, 100, 'Voile du Nathrezim'),
(18723, 'None', 'Ramstein the Gorger', 62, 'Neck', 2114, 100, 'Chaîne de cou animée'),
(18727, 'None', 'Magistrate Barthilas', 59, 'Head', 3481, 100, 'Chapeau de feutre cramoisi'),
(18740, 'None', 'Nerub\'enkan', 61, 'Waist', 2891, 100, 'Echarpe de Thuzadin'),
(18810, 'MC', 'Majordomo Executus', 71, 'Shoulder', 7833, 200, 'Spallières de croissance sauvage'),
(18811, 'MC', 'Majordomo Executus', 71, 'Back', 2772, 100, 'Cape ignifugée'),
(18812, 'MC', 'Majordomo Executus', 71, 'Wrist', 2772, 100, 'Garde-poignets de vrai vol'),
(18813, 'Boss', 'Onyxia', 73, 'Finger', 2930, 100, 'Anneau de lien'),
(18832, 'MC', 'Garr', 70, 'OneHand', 4116, 200, 'Lame de brutalité'),
(18842, 'MC', 'Golemagg the Incinerator', 70, 'TwoHand', 4900, 100, 'Bâton de domination'),
(18870, 'MC', 'Multi', 62, 'Head', 3844, 100, 'Casque du donneur de vie'),
(18875, 'MC', 'Trash', 64, 'Legs', 8192, 200, 'Pantalon en écailles de salamandre'),
(19094, 'None', 'None', 60, 'Waist', 2797, 100, 'Ceinturon stormpike en tissu'),
(19098, 'None', 'None', 60, 'Neck', 1980, 100, 'Pendentif de sage stormpike'),
(19107, 'None', 'Quest', 63, 'Ranged', 1666, 100, 'Sanguinaire'),
(19136, 'MC', 'Multi', 71, 'Waist', 3916, 100, 'Corde de mana enflammé'),
(19140, 'MC', 'Chambellan Executus', 71, 'Finger', 2772, 100, 'Anneau de cautérisation'),
(19142, 'MC', 'Multi', 70, 'HeldInOffhand', 2695, 100, 'Grimoire de runes de feu'),
(19145, 'MC', 'Multi', 66, 'Chest', 4356, 100, 'Robe du pouvoir volatil'),
(19162, 'None', 'Craft', 70, 'Waist', 3807, 100, 'Corehound Belt'),
(19312, 'None', 'None', 65, 'HeldInOffhand', 2323, 100, 'Lei du Donneur de vie'),
(19325, 'None', 'None', 65, 'Finger', 2323, 100, 'Anneau de Don Julio'),
(19990, 'None', 'Quest', 52, 'Trinket', 1892, 100, 'Chapelet béni'),
(20130, 'None', 'Quest', 52, 'Trinket', 1892, 100, 'Flacon de diamant'),
(20218, 'None', 'Quest', 59, 'Back', 1914, 100, 'Cape hakkari terne'),
(20505, 'None', 'None', 52, 'Finger', 1487, 100, 'Chevalière chevaleresque'),
(20654, 'None', 'Azure Templar', 60, 'TwoHand', 3600, 100, 'Bâton de guerre d\'améthyste'),
(20666, 'None', 'The Duke of Cynders', 62, 'MainHand', 1614, 100, 'Marteau de guerre à tête d\'acier'),
(20671, 'None', 'The Duke of Shards', 62, 'Legs', 3844, 100, 'Cuissards abyssaux en plaques'),
(20674, 'None', 'The Duke of Zephyrs', 62, 'Legs', 3844, 100, 'Pantalon abyssal en tissu'),
(21994, 'None', 'Quest', 65, 'Waist', 3282, 100, 'Ceinture d\'héroïsme'),
(21995, 'None', 'Quest', 60, 'Feet', 2797, 100, 'Bottes d\'héroïsme'),
(21996, 'None', 'Quest', 65, 'Wrist', 2323, 100, 'Brassards d\'héroïsme'),
(21997, 'None', 'Quest', 60, 'Chest', 3600, 100, 'Cuirasse d\'héroïsme'),
(21998, 'None', 'Quest', 55, 'Hands', 2350, 100, 'Gantelets d\'héroïsme'),
(21999, 'None', 'Quest', 60, 'Head', 3600, 100, 'Casque d\'héroïsme'),
(22001, 'None', 'None', 65, 'Shoulder', 3282, 100, 'Spallières d\'héroïsme'),
(22078, 'None', 'Quest', 65, 'Waist', 3282, 100, 'Ceinture vertueuse'),
(22079, 'None', 'Quest', 65, 'Wrist', 2323, 100, 'Brassards vertueux'),
(22081, 'None', 'Quest', 55, 'Hands', 2350, 100, 'Gants vertueux'),
(22082, 'None', 'Quest', 65, 'Shoulder', 3282, 100, 'Mantelet vertueux'),
(22084, 'None', 'Quest', 60, 'Feet', 2797, 100, 'Sandales vertueuses'),
(22085, 'None', 'Quest', 66, 'Legs', 4356, 100, 'Jupe vertueuse'),
(22149, 'None', 'Quest', 63, 'Neck', 2182, 100, 'Perles de mojo ogre'),
(22208, 'None', 'Magmus', 58, 'TwoHand', 3364, 100, 'Marteau en pierre de lave'),
(22234, 'None', 'Lord Roccor', 53, 'Shoulder', 2182, 100, 'Mantelet de l\'espoir perdu'),
(22245, 'None', 'Panzor the Invincible', 56, 'Feet', 2436, 100, 'Chaussures encroûtées de suie'),
(22247, 'None', 'Warchief Rend Blackhand', 63, 'Feet', 3083, 100, 'Bottes de guérisseur miraculeux'),
(22253, 'None', 'General Drakkisath', 63, 'HeldInOffhand', 2182, 100, 'Tome of the Lost'),
(22254, 'None', 'None', 57, 'Ranged', 1364, 100, 'Baguette de lumière éternelle'),
(22255, 'None', 'None', 57, 'Finger', 1786, 100, 'Anneau forgé dans le magma'),
(22257, 'None', 'Gorosh the Dervish', 57, 'Finger', 1786, 100, 'Anneau souillé de sang'),
(22267, 'None', 'General Drakkisath', 63, 'Head', 3969, 100, 'Turban de tisse-sort'),
(22268, 'None', 'General Drakkisath', 63, 'Trinket', 2778, 100, 'Emblème draconique imprégné'),
(22272, 'None', 'Quest', 52, 'Chest', 2704, 100, 'Etreinte de la forêt'),
(22275, 'None', 'Hurley Blackbreath', 57, 'Feet', 2524, 100, 'Bottes Mousse-de-feu'),
(22315, 'None', 'Isalien', 61, 'MainHand', 1562, 100, 'Marteau de revitalisation'),
(22318, 'None', 'None', 61, 'Ranged', 1562, 100, 'Arc long de Malgen'),
(22334, 'None', 'Grand Crusader Dathrohan', 62, 'Finger', 2114, 100, 'Anneau de guérison'),
(22336, 'None', 'Lord Valthalak', 63, 'OffHand', 2182, 100, 'Egide draconien de la légion'),
(22340, 'None', 'Lord Valthalak', 63, 'Neck', 2182, 100, 'Pendentif de célérité'),
(22398, 'None', 'Mor Grayhoof', 62, 'Relic', 1614, 100, 'Idole de récupération'),
(22403, 'None', 'Cannon Master Willey', 61, 'Neck', 2046, 100, 'Collier de coquillages nacrés'),
(22405, 'None', 'Cannon Master Willey', 61, 'Shoulder', 2891, 100, 'Mantelet de la Croisade écarlate'),
(22406, 'None', 'Cannon Master Willey', 61, 'TwoHand', 3721, 100, 'Rédemption'),
(22407, 'None', 'Cannon Master Willey', 61, 'Head', 3721, 100, 'Casque de la nouvelle lune'),
(22411, 'None', 'Baron Rivendare', 63, 'Head', 3969, 100, 'Heaume de l\'Exécuteur'),
(22412, 'None', 'Baron Rivendare', 63, 'Shoulder', 3083, 100, 'Mantelet de Thuzadin'),
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
(7721, 'Druid'),
(10659, 'Druid'),
(11623, 'Druid'),
(11624, 'Druid'),
(11665, 'Druid'),
(11669, 'Druid'),
(11735, 'Druid'),
(11815, 'Druid'),
(11819, 'Druid'),
(11822, 'Druid'),
(11823, 'Druid'),
(11832, 'Druid'),
(11841, 'Druid'),
(11923, 'Druid'),
(11928, 'Druid'),
(11932, 'Druid'),
(12543, 'Druid'),
(12548, 'Druid'),
(12554, 'Druid'),
(12587, 'Druid'),
(12927, 'Druid'),
(12930, 'Druid'),
(12960, 'Druid'),
(13098, 'Druid'),
(13102, 'Druid'),
(13141, 'Druid'),
(13161, 'Druid'),
(13178, 'Druid'),
(13206, 'Druid'),
(13253, 'Druid'),
(13340, 'Druid'),
(13345, 'Druid'),
(13346, 'Druid'),
(13373, 'Druid'),
(13397, 'Druid'),
(13944, 'Druid'),
(13954, 'Druid'),
(13965, 'Druid'),
(13968, 'Druid'),
(15061, 'Druid'),
(15062, 'Druid'),
(15063, 'Druid'),
(15411, 'Druid'),
(16058, 'Druid'),
(16714, 'Druid'),
(16829, 'Druid'),
(16830, 'Druid'),
(16831, 'Druid'),
(16835, 'Druid'),
(16836, 'Druid'),
(16900, 'Druid'),
(16901, 'Druid'),
(17044, 'Druid'),
(17064, 'Druid'),
(17073, 'Druid'),
(17078, 'Druid'),
(17105, 'Druid'),
(17110, 'Druid'),
(17713, 'Druid'),
(18103, 'Druid'),
(18205, 'Druid'),
(18309, 'Druid'),
(18314, 'Druid'),
(18317, 'Druid'),
(18321, 'Druid'),
(18327, 'Druid'),
(18371, 'Druid'),
(18376, 'Druid'),
(18386, 'Druid'),
(18389, 'Druid'),
(18391, 'Druid'),
(18395, 'Druid'),
(18403, 'Druid'),
(18404, 'Druid'),
(18470, 'Druid'),
(18490, 'Druid'),
(18491, 'Druid'),
(18495, 'Druid'),
(18507, 'Druid'),
(18510, 'Druid'),
(18523, 'Druid'),
(18525, 'Druid'),
(18682, 'Druid'),
(18723, 'Druid'),
(18727, 'Druid'),
(18740, 'Druid'),
(18810, 'Druid'),
(18811, 'Druid'),
(18813, 'Druid'),
(18842, 'Druid'),
(18875, 'Druid'),
(19094, 'Druid'),
(19098, 'Druid'),
(19140, 'Druid'),
(19142, 'Druid'),
(19162, 'Druid'),
(19312, 'Druid'),
(19325, 'Druid'),
(20218, 'Druid'),
(20505, 'Druid'),
(20654, 'Druid'),
(20666, 'Druid'),
(22208, 'Druid'),
(22234, 'Druid'),
(22247, 'Druid'),
(22253, 'Druid'),
(22255, 'Druid'),
(22257, 'Druid'),
(22267, 'Druid'),
(22268, 'Druid'),
(22272, 'Druid'),
(22275, 'Druid'),
(22315, 'Druid'),
(22334, 'Druid'),
(22340, 'Druid'),
(22398, 'Druid'),
(22403, 'Druid'),
(22406, 'Druid'),
(22407, 'Druid'),
(22412, 'Druid'),
(10659, 'Hunter'),
(11726, 'Hunter'),
(11735, 'Hunter'),
(11926, 'Hunter'),
(12548, 'Hunter'),
(12651, 'Hunter'),
(13340, 'Hunter'),
(13967, 'Hunter'),
(15411, 'Hunter'),
(16845, 'Hunter'),
(16849, 'Hunter'),
(16939, 'Hunter'),
(17044, 'Hunter'),
(17713, 'Hunter'),
(18323, 'Hunter'),
(18404, 'Hunter'),
(18713, 'Hunter'),
(18723, 'Hunter'),
(18812, 'Hunter'),
(18870, 'Hunter'),
(19107, 'Hunter'),
(19325, 'Hunter'),
(22318, 'Hunter'),
(10213, 'Mage'),
(10659, 'Mage'),
(11623, 'Mage'),
(11624, 'Mage'),
(11634, 'Mage'),
(11784, 'Mage'),
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
(16796, 'Mage'),
(16797, 'Mage'),
(16799, 'Mage'),
(16802, 'Mage'),
(16914, 'Mage'),
(17067, 'Mage'),
(17078, 'Mage'),
(17110, 'Mage'),
(18317, 'Mage'),
(18403, 'Mage'),
(18526, 'Mage'),
(18720, 'Mage'),
(18723, 'Mage'),
(18727, 'Mage'),
(18740, 'Mage'),
(18832, 'Mage'),
(18842, 'Mage'),
(19094, 'Mage'),
(19136, 'Mage'),
(19142, 'Mage'),
(19145, 'Mage'),
(20505, 'Mage'),
(20654, 'Mage'),
(20674, 'Mage'),
(22245, 'Mage'),
(22253, 'Mage'),
(22267, 'Mage'),
(22268, 'Mage'),
(22403, 'Mage'),
(22405, 'Mage'),
(22412, 'Mage'),
(7721, 'Paladin'),
(10659, 'Paladin'),
(11623, 'Paladin'),
(11665, 'Paladin'),
(11735, 'Paladin'),
(11784, 'Paladin'),
(11819, 'Paladin'),
(11822, 'Paladin'),
(11823, 'Paladin'),
(11832, 'Paladin'),
(11841, 'Paladin'),
(11842, 'Paladin'),
(11923, 'Paladin'),
(11924, 'Paladin'),
(11926, 'Paladin'),
(11928, 'Paladin'),
(12543, 'Paladin'),
(12554, 'Paladin'),
(12633, 'Paladin'),
(12930, 'Paladin'),
(12940, 'Paladin'),
(12960, 'Paladin'),
(13102, 'Paladin'),
(13141, 'Paladin'),
(13142, 'Paladin'),
(13168, 'Paladin'),
(13178, 'Paladin'),
(13205, 'Paladin'),
(13206, 'Paladin'),
(13253, 'Paladin'),
(13344, 'Paladin'),
(13345, 'Paladin'),
(13346, 'Paladin'),
(13954, 'Paladin'),
(13965, 'Paladin'),
(13969, 'Paladin'),
(14522, 'Paladin'),
(14548, 'Paladin'),
(15061, 'Paladin'),
(16058, 'Paladin'),
(16854, 'Paladin'),
(16855, 'Paladin'),
(16857, 'Paladin'),
(16858, 'Paladin'),
(16859, 'Paladin'),
(16860, 'Paladin'),
(16955, 'Paladin'),
(17064, 'Paladin'),
(17073, 'Paladin'),
(17105, 'Paladin'),
(17110, 'Paladin'),
(18103, 'Paladin'),
(18205, 'Paladin'),
(18309, 'Paladin'),
(18317, 'Paladin'),
(18318, 'Paladin'),
(18321, 'Paladin'),
(18327, 'Paladin'),
(18386, 'Paladin'),
(18389, 'Paladin'),
(18391, 'Paladin'),
(18395, 'Paladin'),
(18403, 'Paladin'),
(18472, 'Paladin'),
(18490, 'Paladin'),
(18507, 'Paladin'),
(18510, 'Paladin'),
(18523, 'Paladin'),
(18525, 'Paladin'),
(18526, 'Paladin'),
(18527, 'Paladin'),
(18682, 'Paladin'),
(18702, 'Paladin'),
(18720, 'Paladin'),
(18723, 'Paladin'),
(18727, 'Paladin'),
(18740, 'Paladin'),
(18810, 'Paladin'),
(18812, 'Paladin'),
(18813, 'Paladin'),
(18870, 'Paladin'),
(18875, 'Paladin'),
(19094, 'Paladin'),
(19098, 'Paladin'),
(19140, 'Paladin'),
(19145, 'Paladin'),
(19162, 'Paladin'),
(19312, 'Paladin'),
(20218, 'Paladin'),
(20505, 'Paladin'),
(20666, 'Paladin'),
(22208, 'Paladin'),
(22234, 'Paladin'),
(22247, 'Paladin'),
(22253, 'Paladin'),
(22257, 'Paladin'),
(22267, 'Paladin'),
(22268, 'Paladin'),
(22275, 'Paladin'),
(22315, 'Paladin'),
(22334, 'Paladin'),
(22336, 'Paladin'),
(22403, 'Paladin'),
(22405, 'Paladin'),
(22407, 'Paladin'),
(22412, 'Paladin'),
(23201, 'Paladin'),
(7721, 'Priest'),
(7728, 'Priest'),
(10213, 'Priest'),
(10659, 'Priest'),
(11623, 'Priest'),
(11624, 'Priest'),
(11634, 'Priest'),
(11819, 'Priest'),
(11822, 'Priest'),
(11832, 'Priest'),
(11841, 'Priest'),
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
(16815, 'Priest'),
(16816, 'Priest'),
(16817, 'Priest'),
(16819, 'Priest'),
(16921, 'Priest'),
(16922, 'Priest'),
(17064, 'Priest'),
(17067, 'Priest'),
(17078, 'Priest'),
(17105, 'Priest'),
(17110, 'Priest'),
(18103, 'Priest'),
(18314, 'Priest'),
(18317, 'Priest'),
(18321, 'Priest'),
(18327, 'Priest'),
(18371, 'Priest'),
(18386, 'Priest'),
(18389, 'Priest'),
(18395, 'Priest'),
(18403, 'Priest'),
(18469, 'Priest'),
(18491, 'Priest'),
(18507, 'Priest'),
(18510, 'Priest'),
(18523, 'Priest'),
(18526, 'Priest'),
(18608, 'Priest'),
(18646, 'Priest'),
(18723, 'Priest'),
(18727, 'Priest'),
(18740, 'Priest'),
(19094, 'Priest'),
(19098, 'Priest'),
(19136, 'Priest'),
(19140, 'Priest'),
(19142, 'Priest'),
(19312, 'Priest'),
(19990, 'Priest'),
(20218, 'Priest'),
(20505, 'Priest'),
(20654, 'Priest'),
(20666, 'Priest'),
(20674, 'Priest'),
(22078, 'Priest'),
(22079, 'Priest'),
(22081, 'Priest'),
(22082, 'Priest'),
(22084, 'Priest'),
(22085, 'Priest'),
(22149, 'Priest'),
(22234, 'Priest'),
(22245, 'Priest'),
(22247, 'Priest'),
(22253, 'Priest'),
(22254, 'Priest'),
(22257, 'Priest'),
(22267, 'Priest'),
(22268, 'Priest'),
(22315, 'Priest'),
(22334, 'Priest'),
(22403, 'Priest'),
(22405, 'Priest'),
(22406, 'Priest'),
(22412, 'Priest'),
(10659, 'Rogue'),
(11735, 'Rogue'),
(11815, 'Rogue'),
(12548, 'Rogue'),
(12587, 'Rogue'),
(12590, 'Rogue'),
(12651, 'Rogue'),
(12927, 'Rogue'),
(12939, 'Rogue'),
(12940, 'Rogue'),
(13340, 'Rogue'),
(13944, 'Rogue'),
(13965, 'Rogue'),
(15062, 'Rogue'),
(15063, 'Rogue'),
(15411, 'Rogue'),
(15806, 'Rogue'),
(16821, 'Rogue'),
(16822, 'Rogue'),
(16823, 'Rogue'),
(16824, 'Rogue'),
(16825, 'Rogue'),
(16826, 'Rogue'),
(16827, 'Rogue'),
(16908, 'Rogue'),
(17044, 'Rogue'),
(17075, 'Rogue'),
(17713, 'Rogue'),
(18205, 'Rogue'),
(18323, 'Rogue'),
(18404, 'Rogue'),
(18723, 'Rogue'),
(18832, 'Rogue'),
(19107, 'Rogue'),
(19325, 'Rogue'),
(22255, 'Rogue'),
(22318, 'Rogue'),
(22340, 'Rogue'),
(7721, 'Shaman'),
(10659, 'Shaman'),
(11623, 'Shaman'),
(11624, 'Shaman'),
(11665, 'Shaman'),
(11735, 'Shaman'),
(11815, 'Shaman'),
(11819, 'Shaman'),
(11822, 'Shaman'),
(11823, 'Shaman'),
(11832, 'Shaman'),
(11841, 'Shaman'),
(11842, 'Shaman'),
(11923, 'Shaman'),
(11926, 'Shaman'),
(11928, 'Shaman'),
(11932, 'Shaman'),
(12543, 'Shaman'),
(12548, 'Shaman'),
(12554, 'Shaman'),
(12927, 'Shaman'),
(12930, 'Shaman'),
(12960, 'Shaman'),
(13098, 'Shaman'),
(13102, 'Shaman'),
(13141, 'Shaman'),
(13161, 'Shaman'),
(13178, 'Shaman'),
(13205, 'Shaman'),
(13206, 'Shaman'),
(13253, 'Shaman'),
(13340, 'Shaman'),
(13344, 'Shaman'),
(13345, 'Shaman'),
(13346, 'Shaman'),
(13954, 'Shaman'),
(13965, 'Shaman'),
(13967, 'Shaman'),
(13968, 'Shaman'),
(13969, 'Shaman'),
(14522, 'Shaman'),
(14548, 'Shaman'),
(15061, 'Shaman'),
(15062, 'Shaman'),
(15063, 'Shaman'),
(15411, 'Shaman'),
(16058, 'Shaman'),
(17044, 'Shaman'),
(17064, 'Shaman'),
(17068, 'Shaman'),
(17073, 'Shaman'),
(17078, 'Shaman'),
(17105, 'Shaman'),
(17110, 'Shaman'),
(18103, 'Shaman'),
(18205, 'Shaman'),
(18309, 'Shaman'),
(18314, 'Shaman'),
(18317, 'Shaman'),
(18318, 'Shaman'),
(18321, 'Shaman'),
(18327, 'Shaman'),
(18371, 'Shaman'),
(18386, 'Shaman'),
(18389, 'Shaman'),
(18391, 'Shaman'),
(18395, 'Shaman'),
(18403, 'Shaman'),
(18404, 'Shaman'),
(18490, 'Shaman'),
(18507, 'Shaman'),
(18510, 'Shaman'),
(18523, 'Shaman'),
(18525, 'Shaman'),
(18527, 'Shaman'),
(18530, 'Shaman'),
(18682, 'Shaman'),
(18723, 'Shaman'),
(18727, 'Shaman'),
(18810, 'Shaman'),
(18812, 'Shaman'),
(18870, 'Shaman'),
(18875, 'Shaman'),
(19094, 'Shaman'),
(19098, 'Shaman'),
(19140, 'Shaman'),
(19142, 'Shaman'),
(19162, 'Shaman'),
(19312, 'Shaman'),
(19325, 'Shaman'),
(20218, 'Shaman'),
(20505, 'Shaman'),
(20654, 'Shaman'),
(20666, 'Shaman'),
(22208, 'Shaman'),
(22234, 'Shaman'),
(22247, 'Shaman'),
(22253, 'Shaman'),
(22257, 'Shaman'),
(22267, 'Shaman'),
(22268, 'Shaman'),
(22275, 'Shaman'),
(22315, 'Shaman'),
(22334, 'Shaman'),
(22336, 'Shaman'),
(22403, 'Shaman'),
(22406, 'Shaman'),
(22407, 'Shaman'),
(22412, 'Shaman'),
(10213, 'Warlock'),
(10659, 'Warlock'),
(11623, 'Warlock'),
(11624, 'Warlock'),
(11634, 'Warlock'),
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
(16805, 'Warlock'),
(16929, 'Warlock'),
(17067, 'Warlock'),
(17078, 'Warlock'),
(17110, 'Warlock'),
(18317, 'Warlock'),
(18403, 'Warlock'),
(18526, 'Warlock'),
(18720, 'Warlock'),
(18723, 'Warlock'),
(18727, 'Warlock'),
(18740, 'Warlock'),
(18842, 'Warlock'),
(19094, 'Warlock'),
(19136, 'Warlock'),
(19142, 'Warlock'),
(19145, 'Warlock'),
(20505, 'Warlock'),
(20654, 'Warlock'),
(20674, 'Warlock'),
(22245, 'Warlock'),
(22253, 'Warlock'),
(22267, 'Warlock'),
(22268, 'Warlock'),
(22403, 'Warlock'),
(22405, 'Warlock'),
(22412, 'Warlock'),
(10659, 'Warrior'),
(11669, 'Warrior'),
(11684, 'Warrior'),
(11726, 'Warrior'),
(11735, 'Warrior'),
(11815, 'Warrior'),
(11926, 'Warrior'),
(12548, 'Warrior'),
(12587, 'Warrior'),
(12590, 'Warrior'),
(12602, 'Warrior'),
(12633, 'Warrior'),
(12651, 'Warrior'),
(12927, 'Warrior'),
(12936, 'Warrior'),
(12939, 'Warrior'),
(12940, 'Warrior'),
(13070, 'Warrior'),
(13098, 'Warrior'),
(13142, 'Warrior'),
(13340, 'Warrior'),
(13373, 'Warrior'),
(13397, 'Warrior'),
(13400, 'Warrior'),
(13944, 'Warrior'),
(13959, 'Warrior'),
(13965, 'Warrior'),
(13967, 'Warrior'),
(15062, 'Warrior'),
(15063, 'Warrior'),
(15411, 'Warrior'),
(15806, 'Warrior'),
(16733, 'Warrior'),
(16734, 'Warrior'),
(16735, 'Warrior'),
(16861, 'Warrior'),
(16863, 'Warrior'),
(16864, 'Warrior'),
(16867, 'Warrior'),
(16963, 'Warrior'),
(17044, 'Warrior'),
(17068, 'Warrior'),
(17073, 'Warrior'),
(17075, 'Warrior'),
(17713, 'Warrior'),
(18205, 'Warrior'),
(18323, 'Warrior'),
(18376, 'Warrior'),
(18380, 'Warrior'),
(18404, 'Warrior'),
(18495, 'Warrior'),
(18503, 'Warrior'),
(18530, 'Warrior'),
(18702, 'Warrior'),
(18723, 'Warrior'),
(18811, 'Warrior'),
(18812, 'Warrior'),
(18813, 'Warrior'),
(18832, 'Warrior'),
(18870, 'Warrior'),
(19107, 'Warrior'),
(19325, 'Warrior'),
(20130, 'Warrior'),
(20671, 'Warrior'),
(21994, 'Warrior'),
(21995, 'Warrior'),
(21996, 'Warrior'),
(21997, 'Warrior'),
(21998, 'Warrior'),
(21999, 'Warrior'),
(22001, 'Warrior'),
(22255, 'Warrior'),
(22318, 'Warrior'),
(22340, 'Warrior'),
(22411, 'Warrior');

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
(10, 'Unaviable', 'Druid', 0),
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
(21, 'Lakokett', 'Hunter', 0),
(22, 'Nokorz', 'Hunter', 1),
(24, 'Artec', 'Hunter', 1),
(25, 'Exola', 'Mage', 0),
(26, 'Jobel', 'Mage', 1),
(27, 'Bruja', 'Mage', 0),
(28, 'Phoceen', 'Mage', 1),
(29, 'Altah', 'Mage', 1),
(30, 'Galyen', 'Mage', 1),
(31, 'Archibad', 'Warlock', 1),
(32, 'Nordvpn', 'Warlock', 1),
(33, 'Malox', 'Warlock', 1),
(34, 'Akali', 'Warlock', 1),
(36, 'Cyclope', 'Druid', 0),
(37, 'Laszéfir (Xena)', 'Paladin', 1),
(38, 'Courgettev', 'Paladin', 1),
(39, 'Belouange', 'Paladin', 1),
(40, 'Nicororo', 'Paladin', 0),
(41, 'Aspirine', 'Druid', 1),
(42, 'Xientor', 'Druid', 1),
(43, 'Cortex', 'Mage', 1),
(44, 'Mauldark', 'Rogue', 1),
(45, 'Laykka', 'Mage', 1),
(47, 'Incolas', 'Paladin', 0),
(48, 'Seuny', 'Paladin', 1),
(49, 'Wiplitos', 'Paladin', 1),
(51, 'Arakam', 'Hunter', 1),
(52, 'Palotte', 'Warrior', 1),
(53, 'Haldus', 'Mage', 1),
(56, 'Trygain', 'Rogue', 1),
(57, 'Alibavure', 'Warlock', 1),
(58, 'Domhil', 'Paladin', 1),
(59, 'Xoralia', 'Paladin', 0),
(60, 'Maui', 'Priest', 1),
(61, 'Brunhild', 'Warrior', 1),
(62, 'Ocalen', 'Warrior', 1),
(63, 'Xmeko', 'Rogue', 1),
(64, 'Choufette', 'Hunter', 1),
(65, 'Hallfire', 'Druid', 1),
(66, 'Lyzz', 'Paladin', 1),
(67, 'Mikasa', 'Paladin', 1),
(68, 'Siyel', 'Hunter', 1),
(69, 'Koba', 'Mage', 1),
(70, 'Orwyna', 'Mage', 1),
(71, 'Nahanz', 'Paladin', 1),
(72, 'Daerys', 'Paladin', 1),
(73, 'Soocool', 'Mage', 1),
(74, 'Rhadamanta', 'Warrior', 1),
(75, 'Jvaistegoume', 'Warrior', 1),
(76, 'Petitpoutou', 'Warrior', 1),
(77, 'Gorngimlas', 'Priest', 1),
(78, 'Furaxx', 'Warrior', 1),
(79, 'Wilona', 'Priest', 1),
(80, 'Marsadin', 'Paladin', 1),
(81, 'Magnet', 'Warrior', 1),
(82, 'Baudelaire', 'Warrior', 1),
(83, 'Sorbetcitron', 'Mage', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_ep`
-- (See below for the actual view)
--
CREATE TABLE `player_ep` (
`player` int(11)
,`name` varchar(64)
,`ep` decimal(44,1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_gp`
-- (See below for the actual view)
--
CREATE TABLE `player_gp` (
`player` int(11)
,`player_name` varchar(64)
,`item_name` varchar(64)
,`raid` int(11)
,`initial_gp` int(11)
,`gp` double(17,0)
,`week_ago` int(6)
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
(1, 11841, 0, 'noRaid'),
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
(1, 16816, 5, 'secondary'),
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
(2, 16860, 0, 'noRaid'),
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
(4, 13141, 0, 'noRaid'),
(4, 13161, 0, 'noRaid'),
(4, 13253, 0, 'noRaid'),
(4, 15061, 0, 'noRaid'),
(4, 16714, 0, 'noRaid'),
(4, 16830, 2, 'secondary'),
(4, 18103, 0, 'noRaid'),
(4, 18317, 0, 'noRaid'),
(4, 18327, 0, 'noRaid'),
(4, 18470, 0, 'noRaid'),
(4, 18490, 0, 'noRaid'),
(4, 18510, 0, 'noRaid'),
(4, 18525, 0, 'noRaid'),
(4, 18682, 0, 'noRaid'),
(4, 20654, 0, 'noRaid'),
(4, 22275, 0, 'noRaid'),
(4, 22398, 0, 'noRaid'),
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
(5, 22079, 0, 'noRaid'),
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
(7, 16815, 7, 'primary'),
(7, 16819, 0, 'noRaid'),
(7, 18327, 0, 'noRaid'),
(7, 18469, 0, 'noRaid'),
(7, 18510, 0, 'noRaid'),
(7, 19098, 0, 'noRaid'),
(7, 22079, 0, 'noRaid'),
(7, 22247, 0, 'noRaid'),
(8, 11669, 0, 'noRaid'),
(8, 12548, 0, 'noRaid'),
(8, 12602, 0, 'noRaid'),
(8, 12651, 0, 'noRaid'),
(8, 13098, 0, 'noRaid'),
(8, 13142, 0, 'noRaid'),
(8, 13373, 0, 'noRaid'),
(8, 13965, 0, 'noRaid'),
(8, 15806, 0, 'noRaid'),
(8, 16733, 0, 'noRaid'),
(8, 16734, 0, 'noRaid'),
(8, 16861, 0, 'noRaid'),
(8, 16863, 0, 'noRaid'),
(8, 16864, 5, 'primary'),
(8, 16867, 0, 'noRaid'),
(8, 18376, 0, 'noRaid'),
(8, 18495, 0, 'noRaid'),
(8, 18503, 0, 'noRaid'),
(8, 18530, 0, 'noRaid'),
(8, 20130, 0, 'noRaid'),
(8, 22340, 0, 'noRaid'),
(8, 22411, 0, 'noRaid'),
(9, 11684, 0, 'noRaid'),
(9, 11815, 0, 'noRaid'),
(9, 12548, 0, 'noRaid'),
(9, 12590, 0, 'noRaid'),
(9, 12602, 0, 'noRaid'),
(9, 13142, 0, 'noRaid'),
(9, 13397, 0, 'noRaid'),
(9, 13965, 0, 'noRaid'),
(9, 15806, 0, 'noRaid'),
(9, 16861, 2, 'primary'),
(9, 16863, 2, 'primary'),
(9, 18323, 0, 'noRaid'),
(9, 18380, 0, 'noRaid'),
(9, 18404, 0, 'noRaid'),
(9, 18811, 7, 'secondary'),
(9, 19325, 0, 'noRaid'),
(9, 21994, 0, 'noRaid'),
(9, 21995, 0, 'noRaid'),
(9, 21996, 0, 'noRaid'),
(9, 21997, 0, 'noRaid'),
(9, 21998, 0, 'noRaid'),
(9, 21999, 0, 'noRaid'),
(9, 22001, 0, 'noRaid'),
(11, 11735, 0, 'noRaid'),
(11, 11815, 0, 'noRaid'),
(11, 11926, 0, 'noRaid'),
(11, 12927, 0, 'noRaid'),
(11, 12939, 0, 'noRaid'),
(11, 12940, 0, 'noRaid'),
(11, 13098, 0, 'noRaid'),
(11, 13142, 0, 'noRaid'),
(11, 13340, 0, 'noRaid'),
(11, 13400, 0, 'noRaid'),
(11, 13965, 0, 'noRaid'),
(11, 13967, 0, 'noRaid'),
(11, 15062, 0, 'noRaid'),
(11, 15063, 0, 'noRaid'),
(11, 15411, 0, 'noRaid'),
(11, 19107, 0, 'noRaid'),
(11, 19325, 0, 'noRaid'),
(11, 20130, 0, 'noRaid'),
(13, 11726, 0, 'noRaid'),
(13, 11815, 0, 'noRaid'),
(13, 12587, 0, 'noRaid'),
(13, 12590, 0, 'noRaid'),
(13, 12927, 0, 'noRaid'),
(13, 12936, 0, 'noRaid'),
(13, 12940, 0, 'noRaid'),
(13, 13340, 0, 'noRaid'),
(13, 13959, 0, 'noRaid'),
(13, 13965, 0, 'noRaid'),
(13, 17073, 2, 'secondary'),
(13, 17713, 0, 'noRaid'),
(13, 19107, 0, 'noRaid'),
(13, 19325, 0, 'noRaid'),
(13, 20130, 0, 'noRaid'),
(13, 20671, 0, 'noRaid'),
(13, 21996, 0, 'noRaid'),
(13, 21998, 0, 'noRaid'),
(14, 11815, 0, 'noRaid'),
(14, 13070, 0, 'noRaid'),
(14, 13142, 0, 'noRaid'),
(14, 13340, 0, 'noRaid'),
(14, 13373, 0, 'noRaid'),
(14, 13944, 0, 'noRaid'),
(14, 13965, 0, 'noRaid'),
(14, 15062, 0, 'noRaid'),
(14, 15063, 0, 'noRaid'),
(14, 15806, 0, 'noRaid'),
(14, 16733, 0, 'noRaid'),
(14, 16735, 0, 'noRaid'),
(14, 17044, 0, 'noRaid'),
(14, 18832, 2, 'primary'),
(14, 22255, 0, 'noRaid'),
(14, 22318, 0, 'noRaid'),
(14, 22411, 0, 'noRaid'),
(20, 16822, 2, 'primary'),
(24, 16849, 2, 'primary'),
(28, 16797, 5, 'primary'),
(28, 16802, 4, 'primary'),
(31, 16929, 6, 'wishList'),
(32, 16805, 5, 'secondary'),
(37, 11823, 0, 'noRaid'),
(37, 12633, 0, 'noRaid'),
(37, 12930, 0, 'noRaid'),
(37, 13141, 0, 'noRaid'),
(37, 13344, 0, 'noRaid'),
(37, 13346, 0, 'noRaid'),
(37, 13969, 0, 'noRaid'),
(37, 16058, 0, 'noRaid'),
(37, 16854, 5, 'secondary'),
(37, 16855, 5, 'primary'),
(37, 16859, 2, 'secondary'),
(37, 16955, 8, 'wishList'),
(37, 18472, 0, 'noRaid'),
(37, 18740, 0, 'noRaid'),
(37, 20505, 0, 'noRaid'),
(37, 22336, 0, 'noRaid'),
(37, 22412, 0, 'noRaid'),
(37, 23201, 0, 'noRaid'),
(38, 11923, 0, 'noRaid'),
(38, 12543, 0, 'noRaid'),
(38, 12633, 0, 'noRaid'),
(38, 13178, 0, 'noRaid'),
(38, 13346, 0, 'noRaid'),
(38, 13954, 0, 'noRaid'),
(38, 13969, 0, 'noRaid'),
(38, 15061, 0, 'noRaid'),
(38, 18103, 0, 'noRaid'),
(38, 18371, 0, 'noRaid'),
(38, 18389, 0, 'noRaid'),
(38, 18472, 0, 'noRaid'),
(38, 18490, 0, 'noRaid'),
(38, 18523, 0, 'noRaid'),
(38, 18525, 0, 'noRaid'),
(38, 18527, 0, 'noRaid'),
(38, 18702, 0, 'noRaid'),
(38, 18723, 0, 'noRaid'),
(38, 19312, 0, 'noRaid'),
(38, 20674, 0, 'noRaid'),
(38, 22234, 0, 'noRaid'),
(38, 22247, 0, 'noRaid'),
(38, 22257, 0, 'noRaid'),
(38, 22268, 0, 'noRaid'),
(38, 23201, 0, 'noRaid'),
(39, 11819, 0, 'noRaid'),
(39, 11832, 0, 'noRaid'),
(39, 11923, 0, 'noRaid'),
(39, 11928, 0, 'noRaid'),
(39, 12633, 0, 'noRaid'),
(39, 12930, 0, 'noRaid'),
(39, 13141, 0, 'noRaid'),
(39, 13168, 0, 'noRaid'),
(39, 13178, 0, 'noRaid'),
(39, 13969, 0, 'noRaid'),
(39, 16058, 0, 'noRaid'),
(39, 16857, 4, 'primary'),
(39, 16858, 4, 'primary'),
(39, 16860, 2, 'secondary'),
(39, 18510, 0, 'noRaid'),
(39, 22234, 0, 'noRaid'),
(39, 22247, 0, 'noRaid'),
(39, 22403, 0, 'noRaid'),
(39, 23201, 0, 'noRaid'),
(41, 11819, 0, 'noRaid'),
(41, 11923, 0, 'noRaid'),
(41, 12554, 0, 'noRaid'),
(41, 12930, 0, 'noRaid'),
(41, 13178, 0, 'noRaid'),
(41, 13346, 0, 'noRaid'),
(41, 13954, 0, 'noRaid'),
(41, 15061, 0, 'noRaid'),
(41, 16058, 0, 'noRaid'),
(41, 16829, 5, 'secondary'),
(41, 16835, 2, 'secondary'),
(41, 18386, 0, 'noRaid'),
(41, 18391, 0, 'noRaid'),
(41, 18470, 0, 'noRaid'),
(41, 18510, 0, 'noRaid'),
(41, 18525, 0, 'noRaid'),
(41, 18723, 0, 'noRaid'),
(41, 19162, 0, 'noRaid'),
(41, 19312, 0, 'noRaid'),
(41, 22272, 0, 'noRaid'),
(41, 22398, 0, 'noRaid'),
(41, 22407, 0, 'noRaid'),
(42, 16836, 4, 'secondary'),
(42, 18404, 6, 'wishList'),
(44, 16821, 5, 'primary'),
(44, 16823, 5, 'wishList'),
(45, 16802, 7, 'primary'),
(48, 11623, 0, 'noRaid'),
(48, 11665, 0, 'noRaid'),
(48, 11819, 0, 'noRaid'),
(48, 11842, 0, 'noRaid'),
(48, 12633, 0, 'noRaid'),
(48, 13346, 0, 'noRaid'),
(48, 16058, 0, 'noRaid'),
(48, 17110, 4, 'secondary'),
(48, 18103, 0, 'noRaid'),
(48, 18472, 0, 'noRaid'),
(48, 18527, 0, 'noRaid'),
(48, 18682, 0, 'noRaid'),
(48, 18723, 0, 'noRaid'),
(48, 20505, 0, 'noRaid'),
(48, 22208, 0, 'noRaid'),
(48, 22253, 0, 'noRaid'),
(48, 22275, 0, 'noRaid'),
(48, 22315, 0, 'noRaid'),
(48, 22405, 0, 'noRaid'),
(48, 23201, 0, 'noRaid'),
(49, 11784, 0, 'noRaid'),
(49, 11822, 0, 'noRaid'),
(49, 13205, 0, 'noRaid'),
(49, 13969, 0, 'noRaid'),
(49, 14522, 0, 'noRaid'),
(49, 20505, 0, 'noRaid'),
(49, 22234, 0, 'noRaid'),
(49, 23201, 0, 'noRaid'),
(53, 19136, 5, 'wishList'),
(56, 16823, 4, 'primary'),
(56, 16824, 5, 'primary'),
(56, 16827, 5, 'primary'),
(58, 11928, 0, 'noRaid'),
(58, 12960, 0, 'noRaid'),
(58, 13178, 0, 'noRaid'),
(58, 13346, 0, 'noRaid'),
(58, 13969, 0, 'noRaid'),
(58, 16058, 0, 'noRaid'),
(58, 18317, 0, 'noRaid'),
(58, 18321, 0, 'noRaid'),
(58, 18386, 0, 'noRaid'),
(58, 18472, 0, 'noRaid'),
(58, 22234, 0, 'noRaid'),
(58, 22247, 0, 'noRaid'),
(58, 23201, 0, 'noRaid'),
(60, 11841, 0, 'noRaid'),
(60, 12554, 0, 'noRaid'),
(60, 13346, 0, 'noRaid'),
(60, 16058, 0, 'noRaid'),
(60, 16817, 5, 'primary'),
(60, 18314, 0, 'noRaid'),
(60, 18317, 0, 'noRaid'),
(60, 18469, 0, 'noRaid'),
(60, 18491, 0, 'noRaid'),
(60, 18727, 0, 'noRaid'),
(60, 19312, 0, 'noRaid'),
(60, 19990, 0, 'noRaid'),
(60, 20218, 0, 'noRaid'),
(60, 22079, 0, 'noRaid'),
(60, 22234, 0, 'noRaid'),
(60, 22247, 0, 'noRaid'),
(61, 18404, 8, 'wishList'),
(63, 16825, 7, 'secondary'),
(63, 16826, 5, 'secondary'),
(64, 16845, 7, 'primary'),
(64, 18812, 7, 'wishList'),
(65, 16830, 7, 'secondary'),
(65, 16831, 5, 'primary'),
(65, 16836, 5, 'secondary'),
(66, 11819, 0, 'noRaid'),
(66, 11823, 0, 'noRaid'),
(66, 11923, 0, 'noRaid'),
(66, 12543, 0, 'noRaid'),
(66, 12554, 0, 'noRaid'),
(66, 13346, 0, 'noRaid'),
(66, 13969, 0, 'noRaid'),
(66, 18389, 0, 'noRaid'),
(66, 18395, 0, 'noRaid'),
(66, 18472, 0, 'noRaid'),
(66, 19094, 0, 'noRaid'),
(66, 19098, 0, 'noRaid'),
(66, 19312, 0, 'noRaid'),
(66, 22234, 0, 'noRaid'),
(66, 22267, 0, 'noRaid'),
(66, 22275, 0, 'noRaid'),
(66, 23201, 0, 'noRaid'),
(67, 11623, 0, 'noRaid'),
(67, 11819, 0, 'noRaid'),
(67, 12930, 0, 'noRaid'),
(67, 12960, 0, 'noRaid'),
(67, 13253, 0, 'noRaid'),
(67, 13346, 0, 'noRaid'),
(67, 13969, 0, 'noRaid'),
(67, 16058, 0, 'noRaid'),
(67, 18386, 0, 'noRaid'),
(67, 19098, 0, 'noRaid'),
(67, 19312, 0, 'noRaid'),
(67, 20505, 0, 'noRaid'),
(67, 22234, 0, 'noRaid'),
(67, 22275, 0, 'noRaid'),
(67, 23201, 0, 'noRaid'),
(68, 16849, 5, 'primary'),
(68, 18713, 7, 'wishList'),
(69, 16796, 5, 'primary'),
(69, 18842, 7, 'wishList'),
(69, 19142, 5, 'primary'),
(70, 16799, 5, 'primary'),
(71, 11819, 0, 'noRaid'),
(71, 11841, 0, 'noRaid'),
(71, 11923, 0, 'noRaid'),
(71, 13178, 0, 'noRaid'),
(71, 13346, 0, 'noRaid'),
(71, 14548, 0, 'noRaid'),
(71, 16058, 0, 'noRaid'),
(71, 18327, 0, 'noRaid'),
(71, 18472, 0, 'noRaid'),
(71, 18490, 0, 'noRaid'),
(71, 18507, 0, 'noRaid'),
(71, 18510, 0, 'noRaid'),
(71, 18527, 0, 'noRaid'),
(71, 18723, 0, 'noRaid'),
(71, 19312, 0, 'noRaid'),
(71, 23201, 0, 'noRaid'),
(72, 7721, 0, 'noRaid'),
(72, 7728, 0, 'noRaid'),
(72, 11623, 0, 'noRaid'),
(72, 12930, 0, 'noRaid'),
(72, 12960, 0, 'noRaid'),
(72, 13346, 0, 'noRaid'),
(72, 13969, 0, 'noRaid'),
(72, 16058, 0, 'noRaid'),
(72, 18472, 0, 'noRaid'),
(72, 18527, 0, 'noRaid'),
(72, 18682, 0, 'noRaid'),
(72, 18720, 0, 'noRaid'),
(72, 18723, 0, 'noRaid'),
(72, 19094, 0, 'noRaid'),
(72, 19312, 0, 'noRaid'),
(72, 20505, 0, 'noRaid'),
(72, 22247, 0, 'noRaid'),
(72, 23201, 0, 'noRaid'),
(74, 16963, 6, 'wishList'),
(79, 11623, 0, 'noRaid'),
(79, 11923, 0, 'noRaid'),
(79, 12543, 0, 'noRaid'),
(79, 12554, 0, 'noRaid'),
(79, 13938, 0, 'noRaid'),
(79, 13968, 0, 'noRaid'),
(79, 19990, 0, 'noRaid'),
(79, 22245, 0, 'noRaid'),
(79, 22334, 0, 'noRaid'),
(79, 22405, 0, 'noRaid'),
(80, 11634, 0, 'noRaid'),
(80, 11822, 0, 'noRaid'),
(80, 11924, 0, 'noRaid'),
(80, 12543, 0, 'noRaid'),
(80, 13969, 0, 'noRaid'),
(80, 14522, 0, 'noRaid'),
(80, 20218, 0, 'noRaid'),
(80, 20505, 0, 'noRaid'),
(80, 22208, 0, 'noRaid'),
(80, 22234, 0, 'noRaid'),
(80, 23201, 0, 'noRaid'),
(83, 16914, 8, 'wishList');

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_nb_raid_without_loot`
-- (See below for the actual view)
--
CREATE TABLE `player_nb_raid_without_loot` (
`player` int(11)
,`attribution` varchar(9)
,`nb_raid` bigint(21)
,`loot_date` datetime /* mariadb-5.3 */
);

-- --------------------------------------------------------

--
-- Table structure for table `player_wish`
--

CREATE TABLE `player_wish` (
  `player` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_wish`
--

INSERT INTO `player_wish` (`player`, `item`, `created`) VALUES
(1, 17064, '2022-01-16 11:20:28'),
(3, 18810, '2022-01-17 19:02:14'),
(3, 18875, '2022-01-18 11:19:56'),
(3, 19140, '2022-01-17 19:02:14'),
(4, 16901, '2022-01-18 20:40:09'),
(4, 17105, '2022-01-18 19:22:46'),
(4, 18810, '2022-01-18 19:22:46'),
(5, 16921, '2022-01-17 20:44:20'),
(5, 16922, '2022-01-17 20:45:08'),
(5, 18608, '2022-01-17 20:44:20'),
(38, 17105, '2022-01-17 20:37:24'),
(38, 18810, '2022-01-17 20:38:55'),
(38, 19145, '2022-01-17 20:38:55'),
(41, 18810, '2022-01-16 12:46:31'),
(41, 18875, '2022-01-16 12:46:31'),
(41, 19140, '2022-01-16 12:46:31'),
(48, 18810, '2022-01-17 17:37:57'),
(48, 18875, '2022-01-17 17:37:57'),
(48, 19140, '2022-01-17 17:37:57'),
(49, 18810, '2022-01-18 06:45:42'),
(49, 18875, '2022-01-18 06:45:42'),
(49, 19140, '2022-01-18 06:45:42'),
(66, 18810, '2022-01-16 22:53:49'),
(66, 18875, '2022-01-16 22:53:49'),
(66, 19140, '2022-01-16 22:53:49'),
(72, 18810, '2022-01-16 11:49:03'),
(72, 18875, '2022-01-16 11:17:48'),
(72, 19140, '2022-01-16 11:17:48'),
(79, 16815, '2022-01-18 11:17:46'),
(79, 16921, '2022-01-18 11:17:46'),
(79, 16922, '2022-01-18 11:17:46');

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
(3, 'Onyxia mi pu', 'Boss', '2022-01-06 00:00:00', 0),
(4, 'En pu avec Quintessence, +1/+2', 'MC', '2022-01-09 00:00:00', 0),
(5, 'Avec Quinte en SR', 'MC', '2022-01-12 00:00:00', 0),
(6, 'First down avec PU', 'Boss', '2022-01-13 00:00:00', 0),
(7, 'Part 2 sulfu 8%', 'MC', '2022-01-16 00:00:00', 0),
(8, 'Toujours avec des PU', 'Boss', '2022-01-18 00:00:00', 0);

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
  `absent` tinyint(1) NOT NULL DEFAULT 0,
  `quit` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `raid_entry`
--

INSERT INTO `raid_entry` (`raid`, `player`, `bench`, `absent`, `quit`) VALUES
(2, 1, 0, 0, 0),
(2, 2, 0, 0, 0),
(2, 3, 0, 0, 0),
(2, 4, 0, 0, 0),
(2, 5, 0, 0, 0),
(2, 7, 0, 0, 0),
(2, 8, 0, 0, 0),
(2, 9, 0, 0, 0),
(2, 10, 0, 0, 0),
(2, 11, 0, 0, 0),
(2, 12, 0, 0, 0),
(2, 13, 0, 0, 0),
(2, 14, 0, 0, 0),
(2, 17, 0, 0, 0),
(2, 18, 0, 0, 0),
(2, 19, 0, 0, 0),
(2, 20, 0, 0, 0),
(2, 22, 0, 0, 0),
(2, 24, 0, 0, 0),
(2, 26, 0, 0, 0),
(2, 27, 0, 0, 0),
(2, 28, 0, 0, 0),
(2, 29, 0, 0, 0),
(2, 30, 0, 0, 0),
(2, 31, 0, 0, 0),
(2, 32, 0, 0, 0),
(2, 33, 0, 0, 0),
(2, 36, 1, 0, 0),
(2, 37, 0, 0, 0),
(2, 38, 0, 0, 0),
(2, 39, 0, 0, 0),
(2, 41, 0, 0, 0),
(2, 42, 0, 0, 0),
(2, 43, 0, 0, 0),
(2, 44, 0, 0, 0),
(2, 45, 0, 0, 0),
(2, 48, 0, 0, 0),
(2, 49, 0, 0, 0),
(2, 51, 0, 0, 0),
(2, 52, 0, 0, 0),
(3, 1, 0, 0, 0),
(3, 2, 0, 0, 0),
(3, 5, 0, 0, 0),
(3, 7, 0, 0, 0),
(3, 8, 0, 0, 0),
(3, 11, 0, 0, 0),
(3, 18, 0, 0, 0),
(3, 20, 0, 0, 0),
(3, 26, 0, 0, 0),
(3, 29, 0, 0, 0),
(3, 31, 0, 0, 0),
(3, 32, 0, 0, 0),
(3, 37, 0, 0, 0),
(3, 41, 0, 0, 0),
(3, 42, 0, 0, 0),
(3, 44, 0, 0, 0),
(3, 45, 0, 0, 0),
(3, 51, 0, 0, 0),
(3, 52, 0, 0, 0),
(3, 53, 0, 0, 0),
(3, 56, 0, 0, 0),
(4, 1, 0, 0, 0),
(4, 2, 0, 0, 0),
(4, 3, 0, 0, 0),
(4, 5, 0, 0, 0),
(4, 8, 0, 0, 0),
(4, 9, 0, 0, 0),
(4, 10, 0, 1, 0),
(4, 11, 0, 0, 0),
(4, 14, 0, 0, 0),
(4, 17, 0, 0, 0),
(4, 19, 0, 0, 0),
(4, 20, 0, 0, 0),
(4, 26, 0, 0, 0),
(4, 28, 0, 0, 0),
(4, 29, 0, 0, 0),
(4, 30, 0, 0, 0),
(4, 31, 0, 0, 0),
(4, 32, 0, 0, 0),
(4, 33, 0, 0, 0),
(4, 37, 0, 0, 0),
(4, 39, 0, 0, 0),
(4, 41, 0, 0, 0),
(4, 42, 0, 0, 0),
(4, 43, 0, 0, 0),
(4, 44, 0, 0, 0),
(4, 45, 0, 0, 0),
(4, 48, 0, 0, 0),
(4, 49, 0, 0, 0),
(4, 56, 0, 0, 0),
(4, 57, 0, 0, 0),
(4, 58, 0, 0, 0),
(5, 1, 0, 0, 0),
(5, 3, 0, 0, 0),
(5, 4, 1, 0, 0),
(5, 5, 0, 0, 0),
(5, 8, 0, 0, 0),
(5, 9, 0, 0, 0),
(5, 11, 0, 0, 0),
(5, 13, 0, 0, 0),
(5, 14, 0, 0, 0),
(5, 16, 0, 0, 0),
(5, 17, 0, 0, 0),
(5, 19, 0, 0, 0),
(5, 20, 0, 0, 0),
(5, 28, 0, 0, 0),
(5, 29, 0, 0, 0),
(5, 31, 0, 0, 0),
(5, 32, 0, 0, 0),
(5, 37, 0, 0, 0),
(5, 38, 0, 0, 0),
(5, 39, 1, 0, 0),
(5, 41, 0, 0, 0),
(5, 42, 0, 0, 0),
(5, 44, 0, 0, 0),
(5, 45, 0, 0, 0),
(5, 48, 1, 0, 0),
(5, 51, 0, 0, 0),
(5, 53, 0, 0, 0),
(5, 56, 0, 0, 0),
(5, 57, 0, 0, 0),
(5, 60, 0, 0, 0),
(5, 61, 0, 0, 0),
(5, 62, 0, 0, 0),
(5, 63, 0, 0, 0),
(5, 64, 0, 0, 0),
(5, 65, 0, 0, 0),
(5, 66, 0, 0, 0),
(5, 67, 0, 0, 0),
(5, 68, 0, 0, 0),
(5, 69, 0, 0, 0),
(5, 70, 0, 0, 0),
(5, 71, 0, 0, 0),
(5, 72, 0, 0, 0),
(6, 1, 0, 0, 0),
(6, 3, 0, 0, 0),
(6, 4, 0, 0, 0),
(6, 5, 0, 0, 0),
(6, 7, 0, 0, 0),
(6, 8, 0, 0, 0),
(6, 11, 0, 0, 0),
(6, 13, 0, 0, 0),
(6, 16, 0, 0, 0),
(6, 17, 0, 0, 0),
(6, 26, 0, 0, 0),
(6, 28, 0, 0, 0),
(6, 29, 0, 0, 0),
(6, 31, 0, 0, 0),
(6, 32, 0, 0, 0),
(6, 37, 0, 0, 0),
(6, 38, 0, 0, 0),
(6, 39, 0, 0, 0),
(6, 41, 0, 0, 0),
(6, 42, 0, 0, 0),
(6, 45, 0, 0, 0),
(6, 51, 0, 0, 0),
(6, 56, 0, 0, 0),
(6, 57, 0, 0, 0),
(6, 61, 0, 0, 0),
(6, 62, 0, 0, 0),
(6, 64, 0, 0, 0),
(6, 66, 0, 0, 0),
(6, 68, 0, 0, 0),
(6, 70, 0, 0, 0),
(6, 72, 0, 0, 0),
(6, 73, 0, 0, 0),
(6, 74, 0, 0, 0),
(6, 75, 0, 0, 0),
(7, 1, 0, 0, 0),
(7, 3, 0, 0, 0),
(7, 5, 0, 0, 0),
(7, 7, 0, 0, 0),
(7, 8, 0, 0, 0),
(7, 9, 0, 0, 0),
(7, 11, 0, 0, 0),
(7, 13, 0, 0, 0),
(7, 16, 0, 0, 0),
(7, 17, 0, 0, 0),
(7, 20, 0, 0, 0),
(7, 26, 0, 0, 0),
(7, 28, 0, 1, 0),
(7, 29, 0, 0, 0),
(7, 31, 0, 0, 0),
(7, 32, 0, 0, 0),
(7, 37, 0, 0, 0),
(7, 38, 0, 0, 0),
(7, 39, 0, 0, 0),
(7, 41, 0, 0, 0),
(7, 42, 0, 0, 0),
(7, 44, 0, 0, 0),
(7, 45, 0, 0, 0),
(7, 51, 0, 0, 0),
(7, 56, 0, 0, 0),
(7, 57, 0, 1, 0),
(7, 60, 0, 0, 0),
(7, 61, 0, 0, 0),
(7, 62, 0, 0, 0),
(7, 63, 0, 0, 0),
(7, 64, 0, 0, 0),
(7, 65, 0, 0, 0),
(7, 66, 0, 0, 0),
(7, 68, 0, 0, 0),
(7, 69, 0, 0, 0),
(7, 70, 0, 0, 0),
(7, 72, 0, 0, 0),
(7, 73, 0, 0, 0),
(7, 74, 0, 0, 0),
(7, 76, 0, 0, 0),
(7, 78, 0, 0, 0),
(7, 79, 0, 0, 0),
(8, 1, 0, 0, 0),
(8, 3, 0, 0, 0),
(8, 4, 0, 0, 0),
(8, 5, 0, 0, 0),
(8, 7, 0, 0, 0),
(8, 9, 0, 0, 0),
(8, 11, 0, 0, 0),
(8, 17, 0, 0, 0),
(8, 20, 0, 0, 0),
(8, 26, 0, 0, 0),
(8, 28, 0, 0, 0),
(8, 31, 0, 0, 0),
(8, 32, 0, 0, 0),
(8, 37, 0, 0, 0),
(8, 38, 0, 0, 0),
(8, 39, 0, 0, 0),
(8, 41, 0, 0, 0),
(8, 44, 0, 0, 0),
(8, 48, 0, 0, 0),
(8, 52, 0, 0, 0),
(8, 56, 0, 0, 0),
(8, 61, 0, 0, 0),
(8, 62, 0, 0, 0),
(8, 64, 0, 0, 0),
(8, 68, 0, 0, 0),
(8, 72, 0, 0, 0),
(8, 73, 0, 0, 0),
(8, 76, 0, 0, 0),
(8, 77, 1, 0, 0),
(8, 79, 0, 0, 0),
(8, 81, 0, 0, 0),
(8, 82, 0, 0, 0),
(8, 83, 0, 0, 0);

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
,`initial_ep` decimal(33,0)
,`ep` double(17,0)
,`initial_ep_per_player` decimal(21,0)
,`ep_per_player` decimal(20,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `raid_ep_avg`
-- (See below for the actual view)
--
CREATE TABLE `raid_ep_avg` (
`instance` varchar(8)
,`initial_ep` decimal(33,0)
,`ep` double(17,0)
,`initial_ep_per_player` decimal(21,0)
,`ep_per_player` decimal(20,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `raid_ep_simple`
-- (See below for the actual view)
--
CREATE TABLE `raid_ep_simple` (
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_ep`  AS SELECT `p`.`id` AS `player`, `p`.`name` AS `name`, sum(case when `re`.`absent` is true then -0.5 * `ep`.`ep_per_player` when `re`.`quit` is true then 0.8 * `ep`.`ep_per_player` else `ep`.`ep_per_player` end) AS `ep` FROM ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player`)) join `raid_ep` `ep` on(`re`.`raid` = `ep`.`raid`)) GROUP BY `re`.`player` ;

-- --------------------------------------------------------

--
-- Structure for view `player_gp`
--
DROP TABLE IF EXISTS `player_gp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_gp`  AS SELECT `p`.`id` AS `player`, `p`.`name` AS `player_name`, `i`.`name` AS `item_name`, `r`.`id` AS `raid`, `i`.`pt` AS `initial_gp`, round(`i`.`pt` * pow(0.9,(to_days(curdate()) - to_days(`r`.`date`)) DIV 7),0) AS `gp`, (to_days(curdate()) - to_days(`r`.`date`)) DIV 7 AS `week_ago` FROM (((`player` `p` join `player_loot` `pl` on(`p`.`id` = `pl`.`player` and (`pl`.`attribution` = 'primary' or `pl`.`attribution` = 'wishList'))) join `raid` `r` on(`r`.`id` = `pl`.`raid`)) join `item` `i` on(`i`.`id` = `pl`.`item`)) GROUP BY `pl`.`player` ;

-- --------------------------------------------------------

--
-- Structure for view `player_last_loot`
--
DROP TABLE IF EXISTS `player_last_loot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_last_loot`  AS SELECT `e`.`player` AS `player`, `p`.`name` AS `name`, max(`r`.`date`) AS `loot_date`, `l`.`attribution` AS `attribution` FROM (((`raid` `r` join `raid_entry` `e` on(`r`.`id` = `e`.`raid`)) join `player_loot` `l` on(`r`.`id` = `l`.`raid` and `l`.`player` = `e`.`player`)) join `player` `p` on(`p`.`id` = `l`.`player`)) GROUP BY `e`.`player`, `l`.`attribution` ;

-- --------------------------------------------------------

--
-- Structure for view `player_nb_raid_without_loot`
--
DROP TABLE IF EXISTS `player_nb_raid_without_loot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_nb_raid_without_loot`  AS  (select `e`.`player` AS `player`,'wishList' AS `attribution`,count(`e`.`raid`) AS `nb_raid`,max(`r`.`date`) AS `loot_date` from (`raid` `r` join `raid_entry` `e` on(`e`.`raid` = `r`.`id`)) where `r`.`date` > (select `pll`.`loot_date` from `player_last_loot` `pll` where `pll`.`player` = `e`.`player` and `pll`.`attribution` = 'wishList') group by `e`.`player`) union (select `e`.`player` AS `player`,'primary' AS `attribution`,count(`e`.`raid`) AS `nb_raid`,max(`r`.`date`) AS `loot_date` from (`raid` `r` join `raid_entry` `e` on(`e`.`raid` = `r`.`id`)) where `r`.`date` > (select `pll`.`loot_date` from `player_last_loot` `pll` where `pll`.`player` = `e`.`player` and `pll`.`attribution` = 'primary') group by `e`.`player`) union (select `e`.`player` AS `player`,'secondary' AS `attribution`,count(`e`.`raid`) AS `nb_raid`,max(`r`.`date`) AS `loot_date` from (`raid` `r` join `raid_entry` `e` on(`e`.`raid` = `r`.`id`)) where `r`.`date` > (select `pll`.`loot_date` from `player_last_loot` `pll` where `pll`.`player` = `e`.`player` and `pll`.`attribution` = 'secondary') group by `e`.`player`) ;

-- --------------------------------------------------------

--
-- Structure for view `raid_attendance`
--
DROP TABLE IF EXISTS `raid_attendance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_attendance`  AS  (select `p`.`id` AS `player`,`p`.`name` AS `name`,`r`.`instance` AS `instance`,'always' AS `period`,sum(1) AS `attendance` from ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player` and `re`.`absent` is false)) join `raid` `r` on(`r`.`id` = `re`.`raid`)) group by `re`.`player`,`r`.`instance`) union (select `p`.`id` AS `player`,`p`.`name` AS `name`,`r`.`instance` AS `instance`,'day28' AS `period`,sum(1) AS `attendance` from ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player` and `re`.`absent` is false)) join `raid` `r` on(`r`.`id` = `re`.`raid` and `r`.`date` >= cast(current_timestamp() - interval 28 day as date))) group by `re`.`player`,`r`.`instance`) union (select `p`.`id` AS `player`,`p`.`name` AS `name`,`r`.`instance` AS `instance`,'day14' AS `period`,sum(1) AS `attendance` from ((`player` `p` join `raid_entry` `re` on(`p`.`id` = `re`.`player` and `re`.`absent` is false)) join `raid` `r` on(`r`.`id` = `re`.`raid` and `r`.`date` >= cast(current_timestamp() - interval 14 day as date))) group by `re`.`player`,`r`.`instance`) ;

-- --------------------------------------------------------

--
-- Structure for view `raid_ep`
--
DROP TABLE IF EXISTS `raid_ep`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_ep`  AS SELECT `r`.`id` AS `raid`, `r`.`name` AS `name`, `r`.`instance` AS `instance`, `r`.`date` AS `date`, `rs`.`size` AS `size`, (to_days(curdate()) - to_days(`r`.`date`)) DIV 7 AS `week_ago`, `e`.`initial_ep` AS `initial_ep`, `e`.`ep` AS `ep`, `e`.`initial_ep_per_player` AS `initial_ep_per_player`, `e`.`ep_per_player` AS `ep_per_player` FROM ((`raid` `r` join `raid_size` `rs` on(`r`.`id` = `rs`.`raid`)) join `raid_ep_avg` `e` on(`r`.`instance` = `e`.`instance`)) ;

-- --------------------------------------------------------

--
-- Structure for view `raid_ep_avg`
--
DROP TABLE IF EXISTS `raid_ep_avg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_ep_avg`  AS SELECT `raid_ep_simple`.`instance` AS `instance`, round(avg(`raid_ep_simple`.`initial_ep`),0) AS `initial_ep`, round(avg(`raid_ep_simple`.`ep`),0) AS `ep`, round(avg(`raid_ep_simple`.`initial_ep_per_player`),0) AS `initial_ep_per_player`, round(avg(`raid_ep_simple`.`ep_per_player`),0) AS `ep_per_player` FROM `raid_ep_simple` GROUP BY `raid_ep_simple`.`instance` ;

-- --------------------------------------------------------

--
-- Structure for view `raid_ep_simple`
--
DROP TABLE IF EXISTS `raid_ep_simple`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `raid_ep_simple`  AS SELECT `r`.`id` AS `raid`, `r`.`name` AS `name`, `r`.`instance` AS `instance`, `r`.`date` AS `date`, `rs`.`size` AS `size`, (to_days(curdate()) - to_days(`r`.`date`)) DIV 7 AS `week_ago`, sum(`gp`.`initial_gp`) AS `initial_ep`, sum(`gp`.`gp`) AS `ep`, sum(`gp`.`initial_gp`) DIV `rs`.`size` AS `initial_ep_per_player`, sum(`gp`.`gp`) DIV `rs`.`size` AS `ep_per_player` FROM ((`raid` `r` join `raid_size` `rs` on(`r`.`id` = `rs`.`raid`)) left join `player_gp` `gp` on(`r`.`id` = `gp`.`raid`)) GROUP BY `r`.`id` ;

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
-- Indexes for table `player_wish`
--
ALTER TABLE `player_wish`
  ADD PRIMARY KEY (`player`,`item`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `raid`
--
ALTER TABLE `raid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Constraints for table `player_wish`
--
ALTER TABLE `player_wish`
  ADD CONSTRAINT `player_wish_ibfk_1` FOREIGN KEY (`player`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `player_wish_ibfk_2` FOREIGN KEY (`item`) REFERENCES `item` (`id`);

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
