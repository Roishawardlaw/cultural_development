-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: cultural_development
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `date_contacted_company` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Frida','Kahlo','HU15 1GP','frida.kahlo@gmail.com','+447787666541','2020-12-15'),(2,'Vincent','Van Gogh','HU1 3HE','v.gogh@hotmail.com','+441482 623431','2019-11-27'),(3,'Sita','Brand','HU7 6BL','sita@yahoo.com','+44776757717','2021-02-14'),(4,'Margot ','Fonteyn','DN17 7AL','M.fonteyn@gmail.com','+441482 789654','2020-10-01'),(5,'Bjork',NULL,'HU17 9GB','bjork123@hotmail.com','+44739602531','2015-08-13'),(6,'Peter','ANDRE','DN16 2PS','P.Andre@gmail.com','07704570010','2021-10-02');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_artists` BEFORE INSERT ON `artists` FOR EACH ROW SET NEW.last_name = UPPER(new.last_name); */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `artists_creative_practices`
--

DROP TABLE IF EXISTS `artists_creative_practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_creative_practices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int DEFAULT NULL,
  `creative_practices_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  KEY `creative_practices_id` (`creative_practices_id`),
  CONSTRAINT `artists_creative_practices_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `artists_creative_practices_ibfk_2` FOREIGN KEY (`creative_practices_id`) REFERENCES `creative_practices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_creative_practices`
--

LOCK TABLES `artists_creative_practices` WRITE;
/*!40000 ALTER TABLE `artists_creative_practices` DISABLE KEYS */;
INSERT INTO `artists_creative_practices` VALUES (1,1,3),(2,1,9),(3,2,3),(4,2,9),(5,3,6),(6,3,7),(7,3,9),(8,4,1),(9,4,2),(10,4,4),(11,4,9),(12,5,4),(13,5,3),(14,5,5),(15,5,8),(16,5,9);
/*!40000 ALTER TABLE `artists_creative_practices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_funding`
--

DROP TABLE IF EXISTS `artists_funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_funding` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int NOT NULL,
  `funding_id` int NOT NULL,
  `successful` tinyint(1) NOT NULL,
  `amount_secured` decimal(10,0) NOT NULL,
  `date_applied` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  KEY `funding_id` (`funding_id`),
  CONSTRAINT `artists_funding_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `artists_funding_ibfk_2` FOREIGN KEY (`funding_id`) REFERENCES `funding` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_funding`
--

LOCK TABLES `artists_funding` WRITE;
/*!40000 ALTER TABLE `artists_funding` DISABLE KEYS */;
INSERT INTO `artists_funding` VALUES (1,1,5,1,10000,'2021-06-14'),(2,1,3,1,3000,'2020-10-04'),(3,2,5,1,2000,'2021-06-15'),(4,3,3,1,500,'2021-02-04'),(5,4,2,0,0,'2021-03-10'),(6,5,4,1,5000,'2021-06-28');
/*!40000 ALTER TABLE `artists_funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_training`
--

DROP TABLE IF EXISTS `artists_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists_training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int DEFAULT NULL,
  `training_id` int DEFAULT NULL,
  `date_attended` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artist_id` (`artist_id`),
  KEY `training_id` (`training_id`),
  CONSTRAINT `artists_training_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `artists_training_ibfk_2` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists_training`
--

LOCK TABLES `artists_training` WRITE;
/*!40000 ALTER TABLE `artists_training` DISABLE KEYS */;
INSERT INTO `artists_training` VALUES (8,1,1,'2020-10-04'),(9,2,1,'2020-10-04'),(10,3,2,'2019-12-13'),(11,5,1,'2020-10-04'),(12,5,2,'2019-12-13'),(13,5,3,'2021-06-28'),(14,5,4,'2020-04-05');
/*!40000 ALTER TABLE `artists_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creative_practices`
--

DROP TABLE IF EXISTS `creative_practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creative_practices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creative_practices`
--

LOCK TABLES `creative_practices` WRITE;
/*!40000 ALTER TABLE `creative_practices` DISABLE KEYS */;
INSERT INTO `creative_practices` VALUES (1,'dance'),(2,'theatre'),(3,'visual art'),(4,'multimedia'),(5,'digital'),(6,'spoken word'),(7,'community art'),(8,'music'),(9,'cross artform');
/*!40000 ALTER TABLE `creative_practices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funding`
--

DROP TABLE IF EXISTS `funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funding` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `maximum_amount` decimal(12,1) NOT NULL,
  `creative_practices_id` int DEFAULT NULL,
  `URL_link` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creative_practices_id` (`creative_practices_id`),
  CONSTRAINT `funding_ibfk_1` FOREIGN KEY (`creative_practices_id`) REFERENCES `creative_practices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funding`
--

LOCK TABLES `funding` WRITE;
/*!40000 ALTER TABLE `funding` DISABLE KEYS */;
INSERT INTO `funding` VALUES (1,'National Lottery Project Grant',30000.0,9,'https://www.artscouncil.org.uk/projectgrants'),(2,'Developing Your Creative Practice',10000.0,9,'https://www.artscouncil.org.uk/DYCP'),(3,'Hull CC-Grants to the arts ',5000.0,9,'https://www.hull.gov.uk/arts-and-leisure/arts/arts-grants'),(4,'The Open Fund For Music Creators',5000.0,8,'https://prsfoundation.com/funding-support/funding-music-creators/all-career-levels/the-open-fund-for-music-creators'),(5,'Reimagine grants',50000.0,3,'https://www.artfund.org/supporting-museums/programmes/reimagine-grants'),(6,'Heritage lottery funding',50000.0,9,'www.heritagefund.org.uk');
/*!40000 ALTER TABLE `funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentors`
--

DROP TABLE IF EXISTS `mentors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentors`
--

LOCK TABLES `mentors` WRITE;
/*!40000 ALTER TABLE `mentors` DISABLE KEYS */;
INSERT INTO `mentors` VALUES (1,'Roisha','Wardlaw','roisha.wardlaw@culturaldevelopment.com'),(2,'Lindsay','Stockley','lindsay.stockley@culturaldevelopment.com'),(3,'Dave','McLeavy','dave.mcleavy@culturaldevelopment.com');
/*!40000 ALTER TABLE `mentors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentors_creative_practices`
--

DROP TABLE IF EXISTS `mentors_creative_practices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mentors_creative_practices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mentor_id` int DEFAULT NULL,
  `creative_practices_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mentor_id` (`mentor_id`),
  KEY `creative_practices_id` (`creative_practices_id`),
  CONSTRAINT `mentors_creative_practices_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`id`),
  CONSTRAINT `mentors_creative_practices_ibfk_2` FOREIGN KEY (`creative_practices_id`) REFERENCES `creative_practices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentors_creative_practices`
--

LOCK TABLES `mentors_creative_practices` WRITE;
/*!40000 ALTER TABLE `mentors_creative_practices` DISABLE KEYS */;
INSERT INTO `mentors_creative_practices` VALUES (1,1,3),(2,1,5),(3,1,7),(4,1,9),(5,2,1),(6,2,2),(7,2,6),(8,2,8),(9,2,9),(10,3,4),(11,3,9);
/*!40000 ALTER TABLE `mentors_creative_practices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hours` decimal(4,1) NOT NULL,
  `location` varchar(50) NOT NULL,
  `experience_required` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,'Fund Raising',1.5,'online','none'),(2,'Developing Your Creative Practice',2.0,'Humber Street Gallery','2-3 years practice'),(3,'Creative Case',1.0,'online','none'),(4,'Producer training',8.0,'Humber Street Gallery','1 year');
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cultural_development'
--
/*!50003 DROP FUNCTION IF EXISTS `artist_funding_eligibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `artist_funding_eligibility`(
    artist_id INT,
    funding_id INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

	DECLARE can_apply BOOL DEFAULT false;
    
    SET can_apply = (
		SELECT COUNT(*)
		FROM artists_creative_practices
		WHERE artists_creative_practices.artist_id = artist_id
		AND artists_creative_practices.creative_practices_id  = (
			SELECT funding.creative_practices_id
			FROM funding
			WHERE funding.id = funding_id
		)
    );
    
    RETURN can_apply;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_funding_opportunity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_funding_opportunity`(
	IN name VARCHAR(50),
    IN amount DECIMAL(12,1),
    IN creative_practices_id INT,
    IN url VARCHAR(250)
)
BEGIN

INSERT INTO funding (name, maximum_amount, creative_practices_id, URL_link)
VALUES (name, amount, creative_practices_id, url);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-28 23:11:02
