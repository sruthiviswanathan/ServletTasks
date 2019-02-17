-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: jobsearchsystem
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applyforjob`
--

DROP TABLE IF EXISTS `applyforjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applyforjob` (
  `user_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`company_id`,`job_id`),
  KEY `company_id` (`company_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `applyforjob_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `applyforjob_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `applyforjob_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applyforjob`
--

LOCK TABLES `applyforjob` WRITE;
/*!40000 ALTER TABLE `applyforjob` DISABLE KEYS */;
INSERT INTO `applyforjob` VALUES (1,'aarush@gmail.com',3,14,'2019-02-15 05:55:33','2019-02-15 05:55:33',1,1),(1,'aarush@gmail.com',6,1,'2019-02-15 04:28:49','2019-02-15 04:28:49',1,1),(1,'aarush@gmail.com',10,1,'2019-02-15 04:34:17','2019-02-15 04:34:17',1,1),(1,'aarush@gmail.com',12,1,'2019-02-15 05:35:03','2019-02-15 05:35:03',1,1),(100,'siva@gmail.com',10,1,'2019-02-15 05:03:38','2019-02-15 05:03:38',100,100),(101,'neela@gmail.com',3,2,'2019-02-15 04:48:50','2019-02-15 04:48:50',101,101),(101,'neela@gmail.com',10,1,'2019-02-15 04:50:45','2019-02-15 04:50:45',101,101);
/*!40000 ALTER TABLE `applyforjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_admin`
--

DROP TABLE IF EXISTS `company_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_admin` (
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`company_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `company_admin_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_admin`
--

LOCK TABLES `company_admin` WRITE;
/*!40000 ALTER TABLE `company_admin` DISABLE KEYS */;
INSERT INTO `company_admin` VALUES (2,10,'2019-01-26 08:04:34','2019-01-26 08:04:34',2,2),(96,3,'2019-01-26 10:12:13','2019-01-26 10:12:13',NULL,NULL),(98,6,'2019-01-26 13:21:19','2019-01-26 13:21:19',NULL,NULL),(99,12,'2019-01-26 13:59:03','2019-01-26 13:59:03',NULL,NULL),(107,17,'2019-01-27 08:01:36','2019-01-27 08:01:36',NULL,NULL),(108,18,'2019-01-27 08:20:23','2019-01-27 08:20:23',NULL,NULL),(109,7,'2019-01-27 10:54:06','2019-01-27 10:54:06',109,109),(110,6,'2019-01-27 12:19:57','2019-01-27 12:19:57',110,110),(112,10,'2019-01-27 13:24:06','2019-01-27 13:24:06',112,112),(115,24,'2019-01-28 04:49:21','2019-01-28 04:49:21',115,115),(131,3,'2019-01-29 09:12:56','2019-01-29 09:12:56',131,131),(145,7,'2019-02-11 07:40:17','2019-02-11 07:40:17',145,145),(146,3,'2019-02-11 07:42:50','2019-02-11 07:42:50',146,146),(147,21,'2019-02-11 16:10:05','2019-02-11 16:10:05',147,147),(1035,17,'2019-02-17 08:26:07','2019-02-17 08:26:07',1035,1035),(1040,22,'2019-02-17 08:37:27','2019-02-17 08:37:27',1040,1040),(1041,10,'2019-02-17 08:39:46','2019-02-17 08:39:46',1041,1041);
/*!40000 ALTER TABLE `company_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_details` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(30) DEFAULT NULL,
  `website_url` varchar(2083) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_details`
--

LOCK TABLES `company_details` WRITE;
/*!40000 ALTER TABLE `company_details` DISABLE KEYS */;
INSERT INTO `company_details` VALUES (3,'Zilker Technology','https://ztech.io/','2019-01-25 06:34:31','2019-01-25 06:34:35','131','131'),(4,'TataMotors','https://www.tatamotors.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(6,'Cognizant','https://www.cognizant.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','110','110'),(7,'Freshworks','https://www.freshworks.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','109','109'),(8,'Informatica','https://www.informatica.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(10,'ABC India Limited','http://www.abcindia.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','112','112'),(12,'Tata Communication','https://www.tatacommunications.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(13,'Zoho','https://www.zoho.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(14,'Yamaha Motors','https://www.yamaha-motor-india.com/','2019-01-25 06:34:31','2019-01-25 06:34:35','3','3'),(17,'vst motors','https://www.vstmotors.com/','2019-01-27 08:01:08','2019-01-27 08:01:08','107','107'),(18,'hyundai','https://www.hyundai.com/','2019-01-27 08:19:40','2019-01-27 08:19:40','108','108'),(21,'genesis','https://www.genesis.com/','2019-01-27 08:55:05','2019-01-27 08:55:05','3','3'),(22,'larsen and toubro','http://www.larsentoubro.com/','2019-01-27 17:19:32','2019-01-27 17:19:32','3','3'),(23,'Tata consultancy services','https://www.tcs.com/','2019-01-27 17:21:19','2019-01-27 17:21:19','3','3'),(24,'Musigma','https://www.mu-sigma.com/','2019-01-28 04:48:46','2019-01-28 04:48:46','115','115'),(28,'CMS IT','www.cms.com','2019-02-11 16:42:21','2019-02-11 16:42:21',NULL,NULL);
/*!40000 ALTER TABLE `company_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_reviews`
--

DROP TABLE IF EXISTS `company_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_reviews` (
  `company_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `reviews` text,
  `rating` float DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_review_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `company_reviews_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_reviews`
--

LOCK TABLES `company_reviews` WRITE;
/*!40000 ALTER TABLE `company_reviews` DISABLE KEYS */;
INSERT INTO `company_reviews` VALUES (2,1,4,'Superb work culture.',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(4,1,3,'Good work culture.',5,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(10,1,3,'Good work culture.',5,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(15,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(17,1,6,'good',3,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(18,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(20,1,6,'good',2,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(21,1,6,'good',3,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(25,2,13,'Good learning place',3,'2019-01-25 06:38:04','2019-01-25 06:38:06',2,2),(26,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(27,1,6,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(28,2,13,'nice',3,'2019-01-25 06:38:04','2019-01-25 06:38:06',2,2),(29,1,13,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(30,1,13,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(31,1,8,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(32,1,10,'good',4,'2019-01-25 06:38:04','2019-01-25 06:38:06',1,1),(35,95,3,'superb work culture',5,'2019-01-26 10:20:33','2019-01-26 10:20:33',95,95),(36,95,6,'nice work culture.',3.4,'2019-01-26 11:33:32','2019-01-26 11:33:32',95,95),(37,100,6,'nice work culture',3,'2019-01-27 07:15:50','2019-01-27 07:15:50',100,100),(38,1,24,'Very much work pressure and stress,bond for 3 years',3,'2019-02-12 20:02:19','2019-02-12 20:02:19',1,1),(39,1,21,'Good work culture',4,'2019-02-12 20:03:19','2019-02-12 20:03:19',1,1),(40,1,3,'',5,'2019-02-13 11:58:48','2019-02-13 11:58:48',1,1),(41,1,10,'Good work culture',3,'2019-02-13 15:58:41','2019-02-13 15:58:41',1,1),(42,1,6,'good company',3,'2019-02-13 16:41:30','2019-02-13 16:41:30',1,1),(43,1,3,'Good Work culture',4.5,'2019-02-17 12:45:15','2019-02-17 12:45:15',1,1);
/*!40000 ALTER TABLE `company_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_designation` varchar(30) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Java developer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(2,'PHP developer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(3,'Manager','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(4,'System Engineer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(5,'Network Engineer','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(6,'Team Leader','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(7,'Marketing Head','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(8,'Human Resource Manager','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(9,'Internee','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(10,'consultant','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(11,'HR','2019-01-25 06:35:36','2019-01-25 06:35:39',3,3),(12,'General Manager','2019-01-27 10:39:53','2019-01-27 10:39:53',108,108),(13,'Fresher','2019-01-28 04:54:09','2019-01-28 04:54:09',114,114),(14,'Senior account manager','2019-02-12 03:40:16','2019-02-12 03:40:16',2,2),(15,'National account manager','2019-02-12 14:37:18','2019-02-12 14:37:18',2,2),(16,'national manager','2019-02-12 14:41:21','2019-02-12 14:41:21',2,2),(17,'clerk','2019-02-12 14:44:05','2019-02-12 14:44:05',2,2);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_request`
--

DROP TABLE IF EXISTS `job_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `job_status` int(11) DEFAULT '0',
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_request_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_request`
--

LOCK TABLES `job_request` WRITE;
/*!40000 ALTER TABLE `job_request` DISABLE KEYS */;
INSERT INTO `job_request` VALUES (1,'sarada2509@gmail.com',1,'Chennai',7,0,'2019-01-26 10:22:11','2019-01-26 10:22:11',95,95),(2,'aarush@gmail.com',5,'Mumbai',6.7,0,'2019-01-27 10:47:15','2019-01-27 10:47:15',1,1),(3,'aarush@gmail.com',6,'Maharashtra',12.5,0,'2019-02-13 04:18:41','2019-02-13 04:18:41',1,1),(4,'aarush@gmail.com',10,'Chennai',12.5,0,'2019-02-13 11:51:42','2019-02-13 11:51:42',1,1),(5,'siva@gmail.com',7,'Chennai',12.5,0,'2019-02-15 03:32:47','2019-02-15 03:32:47',100,100),(6,'siva@gmail.com',6,'Pune',13.8,0,'2019-02-15 03:37:48','2019-02-15 03:37:48',100,100);
/*!40000 ALTER TABLE `job_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_reviews`
--

DROP TABLE IF EXISTS `job_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_reviews` (
  `job_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `interview_process` text,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`job_review_id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `job_reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `job_reviews_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `job_reviews_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_reviews`
--

LOCK TABLES `job_reviews` WRITE;
/*!40000 ALTER TABLE `job_reviews` DISABLE KEYS */;
INSERT INTO `job_reviews` VALUES (1,1,12,1,'easy','2019-01-25 12:04:30','2019-01-25 12:04:30',NULL,NULL),(2,1,12,10,'difficult','2019-01-25 12:04:55','2019-01-25 12:04:55',NULL,NULL),(3,1,12,1,'difficult','2019-01-25 12:05:44','2019-01-25 12:05:44',NULL,NULL),(4,1,13,1,'easy','2019-01-25 12:06:18','2019-01-25 12:06:18',NULL,NULL),(6,95,3,1,'First round had aptitude and programming questions,second round was a technical interview and the questions were mainly focused on html and css.third and final round was technical and hr interview.overall process was easy.','2019-01-26 10:19:22','2019-01-26 10:19:22',NULL,NULL),(7,1,3,1,'easy','2019-01-27 05:40:16','2019-01-27 05:40:16',NULL,NULL),(8,100,6,3,'Questions were mainly based on basic concepts.so be thorough with basic concepts.','2019-01-27 07:14:06','2019-01-27 07:14:06',100,100),(9,1,21,4,'Easy interview','2019-02-12 20:03:20','2019-02-12 20:03:20',1,1),(10,1,3,1,'Easy interview process','2019-02-17 12:45:16','2019-02-17 12:45:16',1,1);
/*!40000 ALTER TABLE `job_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(30) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user','2019-01-25 06:30:54','2019-01-25 06:31:22',3,3),(2,'company admin','2019-01-25 06:30:54','2019-01-25 06:31:22',3,3),(3,'website admin','2019-01-25 06:30:54','2019-01-25 06:31:22',3,3);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `technology_id` int(11) NOT NULL AUTO_INCREMENT,
  `technology` varchar(30) DEFAULT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'C','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(2,'C++','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(3,'Java','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(4,'PHP','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(5,'HTML','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(6,'CSS','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(7,'JavaScript','2019-01-25 06:39:56','2019-01-25 06:39:58',3,3),(8,'Python','2019-01-26 06:21:50','2019-01-26 06:21:50',3,3),(9,'AngularJS','2019-01-26 06:22:23','2019-01-26 06:22:23',3,3),(10,'Perl','2019-01-26 06:28:25','2019-01-26 06:28:25',3,3),(11,'C#','2019-01-26 06:30:59','2019-01-26 06:30:59',3,3),(12,'MySQL','2019-01-26 06:31:34','2019-01-26 06:31:34',3,3),(13,'Ruby','2019-01-26 06:34:49','2019-01-26 06:34:49',3,3),(14,'Swift','2019-01-26 06:34:58','2019-01-26 06:34:58',3,3),(15,'Rust','2019-01-26 07:17:39','2019-01-26 07:17:39',3,3),(16,'Go','2019-01-26 07:17:47','2019-01-26 07:17:47',3,3),(17,'Elixir','2019-01-26 07:21:21','2019-01-26 07:21:21',3,3),(18,'Matlab','2019-01-26 07:21:28','2019-01-26 07:21:28',3,3),(19,'R','2019-01-26 07:30:06','2019-01-26 07:30:06',3,3),(20,'TypeScript','2019-01-26 07:30:19','2019-01-26 07:30:19',3,3),(21,'Shell','2019-01-26 07:30:25','2019-01-26 07:30:25',3,3),(22,'ReactJS','2019-01-26 10:10:57','2019-01-26 10:10:57',3,3),(23,'Artificial Intelligence','2019-01-27 07:33:28','2019-01-27 07:33:28',105,105),(24,'Augumented Reality','2019-01-27 07:33:34','2019-01-27 07:33:34',105,105),(25,'Machine Learning','2019-01-28 04:47:24','2019-01-28 04:47:24',114,114),(26,'deep learning','2019-01-28 07:05:54','2019-01-28 07:05:54',119,119),(27,'spring mvc','2019-01-28 07:46:32','2019-01-28 07:46:32',130,130);
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_classification`
--

DROP TABLE IF EXISTS `user_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_classification` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `role` (`role`),
  CONSTRAINT `user_classification_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_classification`
--

LOCK TABLES `user_classification` WRITE;
/*!40000 ALTER TABLE `user_classification` DISABLE KEYS */;
INSERT INTO `user_classification` VALUES (1,'Aarush','aarush@gmail.com','aarush123','Genesis','consultant',1,'2019-01-25 06:33:20','2019-02-17 17:01:16',1,1),(2,'avneesh','avneesh@gmail.com','avneesh123','Cognizant','Manager',2,'2019-01-25 06:33:20','2019-02-12 15:47:49',2,2),(3,'anu','anu@gmail.com','anu234','Indeed','Website admin',3,'2019-01-25 06:33:20','2019-01-25 06:33:24',3,3),(95,'Sarada','sarada2509@gmail.com','sarada123','Yamaha Motors','Manager',1,'2019-01-26 10:10:12','2019-01-27 11:53:37',95,95),(96,'kamal','kamal@ztech.io','zilker123','zilker technology','admin',2,'2019-01-26 10:12:13','2019-01-26 10:12:13',96,96),(97,'sruthi','sravan1097@gmail.com','sruthi123','zilker','consultant trainee',1,'2019-01-26 13:17:24','2019-01-26 13:17:24',97,97),(98,'viswanathan','cognizant@gmail.com','cognizant1','cognizant','admin',2,'2019-01-26 13:21:19','2019-01-26 13:21:19',98,98),(99,'Manikandan','mani@gmail.com','mani@123','Tata Communication','admin',2,'2019-01-26 13:59:03','2019-01-26 13:59:03',99,99),(100,'sivalinga','siva@gmail.com','siva@123','','manager',1,'2019-01-27 06:22:42','2019-02-15 04:03:30',100,100),(101,'neela','neela@gmail.com','neela@123','bluedart','manager',1,'2019-01-27 06:25:36','2019-01-27 06:25:36',101,101),(102,'venkat','venkat@gmail.com','venkat#123','abc','manager',1,'2019-01-27 06:31:59','2019-01-27 06:31:59',102,102),(103,'jackie','jackie@gmail.com','jack@123','bluedart','admin',2,'2019-01-27 06:37:18','2019-01-27 06:37:18',103,103),(104,'srividya','sri@gmail.com','sri@1234','svce','student',1,'2019-01-27 07:05:05','2019-01-27 07:05:05',104,104),(107,'Ganesh','ganesh@gmail.vom','vstmotors1','vst motors','admin',2,'2019-01-27 08:01:36','2019-01-27 08:01:36',107,107),(108,'nancy','hyundai@gmail.com','hyundai1','hyundai','admin',2,'2019-01-27 08:20:22','2019-01-27 08:20:22',108,108),(109,'sathya','sathya@gmail.com','sathya@123','freshworks','admin',2,'2019-01-27 10:54:06','2019-01-27 10:54:06',109,109),(110,'raghuraman','raghu@gmail.com','raghu@123','cognizant','admin',2,'2019-01-27 12:19:56','2019-01-27 12:19:56',110,110),(111,'priyanka','priyanka@gmail.com','priya@34','Vijay Tv','anchor',1,'2019-01-27 13:05:59','2019-02-17 16:59:51',111,111),(112,'Nisha','nisha@gmail.com','nisha@123','ABC India Limited','admin',2,'2019-01-27 13:24:06','2019-01-27 13:24:06',112,112),(115,'abiram','abiram@gmail.com','abiram@123','musigma','admin',2,'2019-01-28 04:49:20','2019-01-28 04:49:20',115,115),(122,'sandy','sandy@gmail.com','sandy@123','abcd','student',1,'2019-01-28 07:19:53','2019-01-28 07:19:53',122,122),(127,'aravind','aravind@gmail.com','aravind123','svce','student',1,'2019-01-28 07:36:13','2019-01-28 07:36:13',127,127),(130,'divya','divya@gmail.com','divya@12','svce','student',1,'2019-01-28 07:44:20','2019-01-28 07:44:20',130,130),(131,'gopal','gopal@gmail.com','gopal@123','zilker technology','admin',2,'2019-01-29 09:12:56','2019-01-29 09:12:56',131,131),(132,'avneesh','avneesh123','avneesh@gmail.com','abc limited','manager',1,'2019-02-11 05:55:42','2019-02-11 05:55:42',132,132),(133,'aarush','aarush@123','aarush@gmail.com','cognizant','trainee',1,'2019-02-11 05:58:31','2019-02-11 05:58:31',133,133),(134,'oviya','oviya@123','oviya@gmail.com','Avm studios','actor',1,'2019-02-11 06:00:51','2019-02-11 06:00:51',134,134),(135,'harish','harish123','harish@gmail.com','infoziant','manager',1,'2019-02-11 06:04:26','2019-02-11 06:04:26',135,135),(145,'aarush','avneesh1243','aarush@gmail.com','Freshworks','admin',2,'2019-02-11 07:40:17','2019-02-11 07:40:17',145,145),(146,'pavithra','pavi123','pavi@gmail.com','Zilker Technology','admin',2,'2019-02-11 07:42:50','2019-02-11 07:42:50',146,146),(147,'sarada','sar@gmail.com','sar123','genesis','admin',2,'2019-02-11 16:10:04','2019-02-11 16:10:04',147,147),(662,'gaay','gaay@gmail.com','gaay123','zilker technology','Consultant',1,'2019-02-15 06:39:48','2019-02-15 06:39:48',662,662),(673,'anu','anu2001@gmail.com','anu123','zilker technology','manager',1,'2019-02-15 07:58:25','2019-02-15 07:58:25',673,673),(1028,'aa','','','','',1,'2019-02-17 08:02:38','2019-02-17 08:02:38',1028,1028),(1031,'sara','sara@gmail.com','sara','abcd','manager',1,'2019-02-17 08:06:14','2019-02-17 08:06:14',1031,1031),(1035,'siva','siva@yahoo.com','siva123','vst motors','admin',2,'2019-02-17 08:26:07','2019-02-17 08:26:07',1035,1035),(1036,'mahesh','mahesh@gmail.com','mahesh123','Larsen and Toubro','consultant',1,'2019-02-17 08:33:04','2019-02-17 08:33:04',1036,1036),(1038,'latha','latha@gmail.com','latha123','ABC Limited','manager',1,'2019-02-17 08:35:58','2019-02-17 08:35:58',1038,1038),(1040,'viji','viji@hotmail.com','viji','larsen and toubro','admin',2,'2019-02-17 08:37:27','2019-02-17 08:37:27',1040,1040),(1041,'divya','divya@hotmail.com','divya123','ABC India Limited','admin',2,'2019-02-17 08:39:46','2019-02-17 08:39:46',1041,1041),(1042,'abinna','abi@gmail.com','abi','ABC Limited','supervisor',1,'2019-02-17 08:42:09','2019-02-17 08:42:09',1042,1042),(1044,'neelayathakshi','neelathayak@gmail.com','neela','musigma','trainee',1,'2019-02-17 13:24:55','2019-02-17 13:24:55',1044,1044);
/*!40000 ALTER TABLE `user_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_technology_mapping`
--

DROP TABLE IF EXISTS `user_technology_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_technology_mapping` (
  `user_technology_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `technology_id` int(11) NOT NULL,
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_technology_id`),
  KEY `user_id` (`user_id`),
  KEY `technology_id` (`technology_id`),
  CONSTRAINT `user_technology_mapping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_classification` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_technology_mapping_ibfk_2` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_technology_mapping`
--

LOCK TABLES `user_technology_mapping` WRITE;
/*!40000 ALTER TABLE `user_technology_mapping` DISABLE KEYS */;
INSERT INTO `user_technology_mapping` VALUES (7,95,4,'2019-02-17 15:32:00','2019-02-17 15:32:00',95,95),(8,95,5,'2019-02-17 15:32:00','2019-02-17 15:32:00',95,95),(9,97,6,'2019-02-17 15:32:00','2019-02-17 15:32:00',97,97),(10,97,7,'2019-02-17 15:32:00','2019-02-17 15:32:00',97,97),(11,111,2,'2019-02-17 16:59:51','2019-02-17 16:59:51',111,111),(12,111,3,'2019-02-17 16:59:51','2019-02-17 16:59:51',111,111),(13,111,4,'2019-02-17 16:59:51','2019-02-17 16:59:51',111,111),(14,1,2,'2019-02-17 17:01:17','2019-02-17 17:01:17',1,1),(15,1,5,'2019-02-17 17:01:17','2019-02-17 17:01:17',1,1),(16,1,6,'2019-02-17 17:01:17','2019-02-17 17:01:17',1,1),(17,1,10,'2019-02-17 17:01:17','2019-02-17 17:01:17',1,1);
/*!40000 ALTER TABLE `user_technology_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancy_publish`
--

DROP TABLE IF EXISTS `vacancy_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancy_publish` (
  `company_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `job_description` text,
  `salary` bigint(20) DEFAULT NULL,
  `vacancy_count` int(11) DEFAULT NULL,
  `vacancy_status` varchar(255) NOT NULL DEFAULT 'available',
  `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`job_id`),
  KEY `job_id` (`job_id`),
  CONSTRAINT `vacancy_publish_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `vacancy_publish_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancy_publish`
--

LOCK TABLES `vacancy_publish` WRITE;
/*!40000 ALTER TABLE `vacancy_publish` DISABLE KEYS */;
INSERT INTO `vacancy_publish` VALUES (3,2,'Chennai',' A PHP Developer is responsible for creating and implementing an array of Web-based products using PHP, MySQL, Ajax, and JavaScript. You develop back-end components, connect the application with other web services, and assist front-end developers by ensuring their work integrates with the application.',6,12,'available','2019-02-14 17:56:25','2019-02-14 17:56:25',96,96),(3,10,'Chennai','Consultants offer advice and expertise to organisations to help them improve their business performance in terms of operations, profitability, management, structure and strategy. Although the workload can be heavy, consulting is a sociable profession with plenty of networking opportunities. The work stretches across a variety of areas, including management, strategy, IT, finance, marketing, HR and supply chain management.',7,5,'available','2019-02-14 17:27:48','2019-02-14 17:27:48',96,96),(3,11,'Chennai',' Developing and implementing HR strategies and initiatives aligned with the overall business strategy. Bridging management and employee relations by addressing demands, grievances or other issues. Managing the recruitment and selection process.',12,1,'available','2019-02-14 17:59:38','2019-02-14 17:59:38',96,96),(3,14,'Chennai','Serve as the primary relationship owner for an assigned group of top tier client accounts with responsibility for retention and growth. Ensure clients derive maximum value from our services. Prepare implementation plans and lead client on-boarding; present content strategy and annual plan. Work closely with clients to identify needs including content approval workflows and consult on best practices for solutions and setup.\r\n\r\nPrepare and deliver effective client presentations, including stakeholders at all levels of the organization up to C-Suite. Deliver weekly, monthly and quarterly status and results presentations to internal and external teams. Regularly evaluate quality of content, managing external content creation, editorial and strategy resources. Identify new opportunities from within existing accounts, partnering with the Business Development team to aid in increasing revenue. Ensure a deep enough understanding of clientsâ?? individual experiences to head off potential issues before they become problems.',10,2,'available','2019-02-14 17:49:06','2019-02-14 17:49:06',96,96),(3,16,'Pune','Develop and implement effective sales strategies\r\nLead nationwide sales team members to achieve sales targets\r\nEstablish productive and professional relationships with key personnel in assigned customer accounts\r\nNegotiate and close agreements with large customers\r\nMonitor and analyze performance metrics and suggest improvements\r\nPrepare monthly, quarterly and annual sales forecasts\r\nPerform research and identify new potential customers and new market opportunities\r\nProvide timely and effective solutions aligned with clientsâ?? needs\r\nLiaise with Marketing and Product Development departments to ensure brand consistency\r\nStay up-to-date with new product launches and ensure sales team members are on board',12,2,'available','2019-02-14 17:51:10','2019-02-14 17:51:10',96,96),(10,1,'Mumbai',' A Java developer is responsible for many duties throughout the development lifecycle of applications, from concept and design right through to testing. Here are some other responsibilities they may have: Design, implement and maintain java application phases.',8,1,'available','2019-02-13 15:45:47','2019-02-17 05:23:49',2,2),(10,4,'Chennai','Systems Engineer Responsibilities include: Managing and monitoring all installed systems and infrastructure. Installing, configuring, testing and maintaining operating systems, application software and system management tools. Ensuring the highest levels of systems and infrastructure availability.',12,5,'available','2019-02-13 15:41:30','2019-02-13 16:51:52',2,2),(10,5,'Chennai','Network Engineer Responsibilities: Maintaining and administering computer networks and related computing environments including systems software, applications software, hardware, and configurations. ... Protecting data, software, and hardware by coordinating, planning and implementing network security measures.',5,6,'available','2019-02-13 15:44:44','2019-02-13 16:54:24',2,2),(10,12,'Chennai','a general manager of administration is responsible for overseeing all administrative functions in your business. A major part involves leading and directing employees. She delegates administrative tasks, such as accounting, paperwork and payroll, while giving you the freedom to deal with other issues.',12,12,'available','2019-02-13 15:43:03','2019-02-13 16:53:52',2,2),(12,1,'Chennai','A Java developer is responsible for many duties throughout the development lifecycle of applications, from concept and design right through to testing. Here are some other responsibilities they may have: Design, implement and maintain java application phases.',13,13,'available','2019-02-15 05:06:27','2019-02-15 05:06:27',99,99),(12,4,'Chennai','Systems Engineer Responsibilities include: Managing and monitoring all installed systems and infrastructure. Installing, configuring, testing and maintaining operating systems, application software and system management tools. Ensuring the highest levels of systems and infrastructure availability.',12,5,'available','2019-02-15 05:11:11','2019-02-15 05:11:11',99,99),(12,8,'Pune','Maintains the work structure by updating job requirements and job descriptions for all positions.\r\nMaintains organization staff by establishing a recruiting, testing, and interviewing program; counseling managers on candidate selection; conducting and analyzing exit interviews; recommending changes.\r\nPrepares employees for assignments by establishing and conducting orientation and training programs.\r\nMaintains a pay plan by conducting periodic pay surveys; scheduling and conducting job evaluations; preparing pay budgets; monitoring and scheduling individual pay actions; recommending, planning, and implementing pay structure revisions.\r\nEnsures planning, monitoring, and appraisal of employee work results by training managers to coach and discipline employees; scheduling management conferences with employees; hearing and resolving employee grievances; counseling employees and supervisors.\r\nMaintains employee benefits programs and informs employees of benefits by studying and assessing benefit needs and trends; recommending benefit programs to management; directing the processing of benefit claims; obtaining and evaluating benefit contract bids; awarding benefit contracts; designing and conducting educational programs on benefit programs.\r\nEnsures legal compliance by monitoring and implementing applicable human resource federal and state requirements; conducting investigations; maintaining records; representing the organization at hearings.\r\n\r\nMaintains management guidelines by preparing, updating, and recommending human resource policies and procedures.\r\nMaintains historical human resource records by designing a filing and retrieval system; keeping past and current records.\r\nMaintains professional and technical knowledge by attending educational workshops; reviewing professional publications; establishing personal networks; participating in professional societies.Completes human resource operational requirements by scheduling and assigning employees; following up on work results.\nMaintains human resource staff by recruiting, selecting, orienting, and training employees.\nMaintains human resource staff job results by counseling and disciplining employees; planning, monitoring, and appraising job results.\nContributes to team effort by accomplishing related results as needed.',12,4,'available','2019-02-14 09:02:51','2019-02-14 09:02:51',99,99);
/*!40000 ALTER TABLE `vacancy_publish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-17 22:55:11
