-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: conference_review
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emailAdd` varchar(30) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES ('abby.lee@gmail.com','Abby','Lee'),('john.smith@gmail.com','John','Smith'),('lucy.williams@gmail.com','Lucy','Williams'),('maria.garcia@gmail.com','Maria','Garcia'),('mary.parker@gmail.com','Mary','Parker');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paper`
--

DROP TABLE IF EXISTS `Paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paper` (
  `paperId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(90) DEFAULT NULL,
  `abstract` varchar(2500) DEFAULT NULL,
  `fileName` varchar(50) DEFAULT NULL,
  `contactEmailAdd` varchar(50) NOT NULL,
  PRIMARY KEY (`paperId`),
  KEY `contactEmailAdd` (`contactEmailAdd`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`contactEmailAdd`) REFERENCES `author` (`emailAdd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paper`
--

LOCK TABLES `Paper` WRITE;
/*!40000 ALTER TABLE `Paper` DISABLE KEYS */;
INSERT INTO `Paper` VALUES (1,'Title1',NULL,NULL,'lucy.williams@gmail.com'),(2,'Title2',NULL,NULL,'maria.garcia@gmail.com'),(3,'Title3',NULL,NULL,'john.smith@gmail.com'),(4,'Title4',NULL,NULL,'abby.lee@gmail.com'),(5,'Title5',NULL,NULL,'mary.parker@gmail.com');
/*!40000 ALTER TABLE `Paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `paperId` int NOT NULL,
  `techMeritScore` int DEFAULT '8',
  `readabilityScore` int DEFAULT '8',
  `originalityScore` int DEFAULT '8',
  `relevanceScore` int DEFAULT '8',
  `reviewerEmailAdd` varchar(30) NOT NULL,
  `recommendation` varchar(100) DEFAULT NULL,
  `authorComment` varchar(200) DEFAULT NULL,
  `commiteeComment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `paperId` (`paperId`),
  KEY `reviewerEmailAdd` (`reviewerEmailAdd`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`paperId`) REFERENCES `paper` (`paperId`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`reviewerEmailAdd`) REFERENCES `reviewer` (`emailAdd`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (1,1,8,8,8,8,'sarah.olson@gmail.com',NULL,NULL,NULL),(2,1,8,8,8,8,'david.cho@gmail.com',NULL,NULL,NULL),(3,2,8,8,8,8,'sarah.olson@gmail.com',NULL,NULL,NULL),(4,2,8,8,8,8,'iris.hall@gmail.com',NULL,NULL,NULL),(5,2,8,8,8,8,'morgan.cooper@gmail.com',NULL,NULL,NULL),(6,5,8,8,8,8,'david.cho@gmail.com',NULL,NULL,NULL),(7,5,8,8,8,8,'sarah.olson@gmail.com',NULL,NULL,NULL),(8,3,8,8,8,8,'sarah.olson@gmail.com',NULL,NULL,NULL),(9,3,8,8,8,8,'david.cho@gmail.com',NULL,NULL,NULL),(10,3,8,8,8,8,'emma.johnson@gmail.com',NULL,NULL,NULL),(11,4,8,8,8,8,'emma.johnson@gmail.com',NULL,NULL,NULL),(12,4,8,8,8,8,'morgan.cooper@gmail.com',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviewer`
--

DROP TABLE IF EXISTS `Reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviewer` (
  `emailAdd` varchar(30) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `phoneNum` int DEFAULT NULL,
  `affiliation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`emailAdd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviewer`
--

LOCK TABLES `Reviewer` WRITE;
/*!40000 ALTER TABLE `Reviewer` DISABLE KEYS */;
INSERT INTO `Reviewer` VALUES ('david.cho@gmail.com','David','Cho',NULL,NULL),('emma.johnson@gmail.com','Emma','Johnson',NULL,NULL),('iris.hall@gmail.com','Iris','Hall',NULL,NULL),('morgan.cooper@gmail.com','Morgan','Cooper',NULL,NULL),('sarah.olson@gmail.com','Sarah','Olson',NULL,NULL);
/*!40000 ALTER TABLE `Reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewerTopics`
--

DROP TABLE IF EXISTS `reviewerTopics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewerTopics` (
  `emailAdd` varchar(30) NOT NULL,
  `topicId` int NOT NULL,
  PRIMARY KEY (`emailAdd`,`topicId`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `reviewertopics_ibfk_1` FOREIGN KEY (`emailAdd`) REFERENCES `reviewer` (`emailAdd`),
  CONSTRAINT `reviewertopics_ibfk_2` FOREIGN KEY (`topicId`) REFERENCES `topic` (`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewerTopics`
--

LOCK TABLES `reviewerTopics` WRITE;
/*!40000 ALTER TABLE `reviewerTopics` DISABLE KEYS */;
INSERT INTO `reviewerTopics` VALUES ('david.cho@gmail.com',1),('emma.johnson@gmail.com',1),('iris.hall@gmail.com',1),('sarah.olson@gmail.com',1),('david.cho@gmail.com',2),('emma.johnson@gmail.com',3),('morgan.cooper@gmail.com',3),('sarah.olson@gmail.com',3),('david.cho@gmail.com',5),('emma.johnson@gmail.com',5);
/*!40000 ALTER TABLE `reviewerTopics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Topic`
--

DROP TABLE IF EXISTS `Topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Topic` (
  `topicId` int NOT NULL AUTO_INCREMENT,
  `topicName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Topic`
--

LOCK TABLES `Topic` WRITE;
/*!40000 ALTER TABLE `Topic` DISABLE KEYS */;
INSERT INTO `Topic` VALUES (1,'Topic1'),(2,'Topic2'),(3,'Topic3'),(4,'Topic4'),(5,'Topic5');
/*!40000 ALTER TABLE `Topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 18:52:14
