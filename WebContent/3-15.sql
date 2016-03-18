-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: zhao_ren
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `intro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'管理员组','我们是厉害的管理员团队');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_user_group_id_idx` (`group_id`),
  CONSTRAINT `group_user_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `group_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1,1),(2,1,0);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `create_time` date NOT NULL,
  `fin_time` date DEFAULT NULL,
  `founder_id` varchar(45) NOT NULL,
  `intro` varchar(45) DEFAULT NULL,
  `require_num` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `visits` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'zhao.ren项目开发','2015-09-01','2016-03-20','2','一个项目整合平台','4',NULL,1,0),(2,'project','2016-01-01','2016-02-04','1','project2','5',NULL,1,2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_member`
--

DROP TABLE IF EXISTS `project_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_member` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `premission` int(11) DEFAULT NULL,
  KEY `project_member_user_id_idx` (`user_id`),
  KEY `project_member_project_id_idx` (`project_id`),
  CONSTRAINT `project_member_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_member_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_member`
--

LOCK TABLES `project_member` WRITE;
/*!40000 ALTER TABLE `project_member` DISABLE KEYS */;
INSERT INTO `project_member` VALUES (1,1,1),(1,2,1);
/*!40000 ALTER TABLE `project_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tech`
--

DROP TABLE IF EXISTS `project_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tech` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`tech_id`),
  KEY `project_tech_id_idx` (`tech_id`),
  CONSTRAINT `project_tech_id` FOREIGN KEY (`tech_id`) REFERENCES `tech` (`tech_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_tech_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tech`
--

LOCK TABLES `project_tech` WRITE;
/*!40000 ALTER TABLE `project_tech` DISABLE KEYS */;
INSERT INTO `project_tech` VALUES (1,2),(1,3);
/*!40000 ALTER TABLE `project_tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tech`
--

DROP TABLE IF EXISTS `tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tech` (
  `tech_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`tech_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tech`
--

LOCK TABLES `tech` WRITE;
/*!40000 ALTER TABLE `tech` DISABLE KEYS */;
INSERT INTO `tech` VALUES (4,'C#'),(1,'C++'),(3,'Html'),(2,'Java');
/*!40000 ALTER TABLE `tech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `realName` varchar(45) DEFAULT NULL,
  `userintro` varchar(45) DEFAULT NULL,
  `tech_intro` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `major` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','f6fdffe48c908deb0f4c3bd36c032e72','管理员','我是管理员','擅长C++','13800000000',NULL,'ECNU','IT'),(2,'KaitoHH','8fa10558c37b0426ee079e181e350b99','黄汇','我是机智汇','不喜欢Java','15300000000',NULL,'ECNU 5','software'),(8,'kaito','5c824c68de1d889262a6054ffa4aaae0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'hhc','8252027c63722fd0344281df1ce43ded','黄浩川','我是愚蠢的黄浩川','什么都不会','13000000000',NULL,NULL,'software'),(16,'7827827','07700030d291b59d174dab098a84b02a',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'login','d56b699830e77ba53855679cb1d252da',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'876786786','d41d8cd98f00b204e9800998ecf8427e',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'123123343','78b728bec0f122e5002cc1e383af4a83',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'354763456','0008a242d47591cae9baf75b5d42ff3f',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'744','be591d44c8c9c37fabbe3b2a0d39b094',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,'1234','ed2b1f468c5f915f3f1cf75d7068baae',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'23452354','7cbe29fcdc04df55df2097a6fad7e4a4',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project_queue`
--

DROP TABLE IF EXISTS `user_project_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project_queue` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`project_id`),
  KEY `project_queue_project_id_idx` (`project_id`),
  CONSTRAINT `project_queue_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `project_queue_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project_queue`
--

LOCK TABLES `user_project_queue` WRITE;
/*!40000 ALTER TABLE `user_project_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_project_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_space`
--

DROP TABLE IF EXISTS `user_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_space` (
  `user_id` int(11) NOT NULL,
  `time` date NOT NULL,
  `status` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`time`,`project_id`),
  KEY `user_space_project_id_idx` (`project_id`),
  CONSTRAINT `user_space_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_space_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_space`
--

LOCK TABLES `user_space` WRITE;
/*!40000 ALTER TABLE `user_space` DISABLE KEYS */;
INSERT INTO `user_space` VALUES (1,'2015-09-01',1,1),(1,'2016-03-20',2,1),(2,'2015-09-01',1,1),(2,'2016-03-20',2,1);
/*!40000 ALTER TABLE `user_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tech`
--

DROP TABLE IF EXISTS `user_tech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tech` (
  `user_id` int(11) NOT NULL,
  `tech_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tech_id`),
  KEY `user_tech_id_idx` (`tech_id`),
  CONSTRAINT `user_tech_id` FOREIGN KEY (`tech_id`) REFERENCES `tech` (`tech_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_tech_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tech`
--

LOCK TABLES `user_tech` WRITE;
/*!40000 ALTER TABLE `user_tech` DISABLE KEYS */;
INSERT INTO `user_tech` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(1,4);
/*!40000 ALTER TABLE `user_tech` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-15  2:13:30
