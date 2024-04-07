CREATE DATABASE  IF NOT EXISTS `myjobs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `myjobs`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: myjobs
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `jobpost_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `resume` varchar(60) DEFAULT NULL,
  `apply_sts` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `place` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (18,49,'Approved','DFD.png','applied','zaman','malapuram','7658790877',10,'2024-02-13','16:02:33'),(19,49,'Approved','Cust-Servey.pdf','applied','aslam','paris','9084567347',2,'2024-02-13','16:08:18'),(20,49,'pending','DFDmyjobs.png','applied','nasim','jaipur','0956756643',2,'2024-02-13','16:11:34'),(21,49,'Rejected',NULL,'applied','fidha','vengara','8907896576',2,'2024-02-13','16:12:08'),(22,52,'Approved','DFD.png','applied','afnan ','nilambur','9898667867',10,'2024-02-13','16:40:31'),(23,50,'Rejected','DFDmyjobs.png','applied','heisangberg','mexico','7888675490',10,'2024-02-13','16:41:08'),(24,56,'Approved','amal record full.pdf','applied','arfin','areecode','897900086',10,'2024-03-22','01:05:33'),(25,57,'Approved','0014.jpg','applied','zamaan','nilambur','8789567890',10,'2024-03-26','20:43:04'),(27,59,'Approved','16397233_v583-bb-20-visualthinking.jpg','applied','fidha','vengara','8978978900',10,'2024-03-27','13:03:48'),(28,60,'Approved','java section 1 - converted (1).pdf','applied','arfink','jaison','8909877890',10,'2024-03-30','21:12:18');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add application',7,'add_application'),(26,'Can change application',7,'change_application'),(27,'Can delete application',7,'delete_application'),(28,'Can view application',7,'view_application'),(29,'Can add complaint',8,'add_complaint'),(30,'Can change complaint',8,'change_complaint'),(31,'Can delete complaint',8,'delete_complaint'),(32,'Can view complaint',8,'view_complaint'),(33,'Can add enquiry',9,'add_enquiry'),(34,'Can change enquiry',9,'change_enquiry'),(35,'Can delete enquiry',9,'delete_enquiry'),(36,'Can view enquiry',9,'view_enquiry'),(37,'Can add job post',10,'add_jobpost'),(38,'Can change job post',10,'change_jobpost'),(39,'Can delete job post',10,'delete_jobpost'),(40,'Can view job post',10,'view_jobpost'),(41,'Can add login',11,'add_login'),(42,'Can change login',11,'change_login'),(43,'Can delete login',11,'delete_login'),(44,'Can view login',11,'view_login'),(45,'Can add message',12,'add_message'),(46,'Can change message',12,'change_message'),(47,'Can delete message',12,'delete_message'),(48,'Can view message',12,'view_message'),(49,'Can add payment',13,'add_payment'),(50,'Can change payment',13,'change_payment'),(51,'Can delete payment',13,'delete_payment'),(52,'Can view payment',13,'view_payment'),(53,'Can add service',14,'add_service'),(54,'Can change service',14,'change_service'),(55,'Can delete service',14,'delete_service'),(56,'Can view service',14,'view_service'),(57,'Can add worker',15,'add_worker'),(58,'Can change worker',15,'change_worker'),(59,'Can delete worker',15,'delete_worker'),(60,'Can view worker',15,'view_worker');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `time` time NOT NULL,
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `complaint_description` varchar(200) NOT NULL,
  `replay` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES ('18:40:28',1,2,1,' yo donje','pending','2024-01-30'),('19:11:06',2,3,1,' u doies','sdfsdf','2024-01-31'),('23:43:12',3,2,1,' ','pending','2024-01-31'),('23:46:06',4,2,1,' ','pending','2024-01-31'),('01:04:08',5,2,2,' fdge','pending','2024-02-12'),('11:26:16',6,2,2,' he kidna kill nmer','pending','2024-02-12'),('16:50:09',7,10,9,' over time work force','pending','2024-02-13'),('20:46:46',8,10,10,' not giving money','no money for you','2024-03-26');
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'application','application'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'complaint','complaint'),(5,'contenttypes','contenttype'),(9,'enquiry','enquiry'),(10,'jobpost','jobpost'),(11,'login','login'),(12,'message','message'),(13,'payment','payment'),(14,'service','service'),(6,'sessions','session'),(15,'workers','worker');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-29 08:30:03.271112'),(2,'auth','0001_initial','2023-12-29 08:30:03.709982'),(3,'admin','0001_initial','2023-12-29 08:30:03.804172'),(4,'admin','0002_logentry_remove_auto_add','2023-12-29 08:30:03.820257'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-29 08:30:03.835923'),(6,'application','0001_initial','2023-12-29 08:30:03.835923'),(7,'contenttypes','0002_remove_content_type_name','2023-12-29 08:30:03.919119'),(8,'auth','0002_alter_permission_name_max_length','2023-12-29 08:30:03.945762'),(9,'auth','0003_alter_user_email_max_length','2023-12-29 08:30:03.961424'),(10,'auth','0004_alter_user_username_opts','2023-12-29 08:30:03.977034'),(11,'auth','0005_alter_user_last_login_null','2023-12-29 08:30:04.039932'),(12,'auth','0006_require_contenttypes_0002','2023-12-29 08:30:04.039932'),(13,'auth','0007_alter_validators_add_error_messages','2023-12-29 08:30:04.055555'),(14,'auth','0008_alter_user_username_max_length','2023-12-29 08:30:04.071237'),(15,'auth','0009_alter_user_last_name_max_length','2023-12-29 08:30:04.086805'),(16,'auth','0010_alter_group_name_max_length','2023-12-29 08:30:04.119566'),(17,'auth','0011_update_proxy_permissions','2023-12-29 08:30:04.134073'),(18,'auth','0012_alter_user_first_name_max_length','2023-12-29 08:30:04.149707'),(19,'complaint','0001_initial','2023-12-29 08:30:04.165339'),(20,'enquiry','0001_initial','2023-12-29 08:30:04.165339'),(21,'jobpost','0001_initial','2023-12-29 08:30:04.180975'),(22,'login','0001_initial','2023-12-29 08:30:04.180975'),(23,'message','0001_initial','2023-12-29 08:30:04.196586'),(24,'payment','0001_initial','2023-12-29 08:30:04.196586'),(25,'service','0001_initial','2023-12-29 08:30:04.212207'),(26,'sessions','0001_initial','2023-12-29 08:30:04.243856'),(27,'workers','0001_initial','2023-12-29 08:30:04.243856');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1jhwq53hty5xoyz8542prfkjpsmlu22t','eyJ1X2lkIjoyfQ:1rWhfV:q7XF3CLpLwkpd8R_DKbAZRkFuvSAHjtc_H1GOpIuuzQ','2024-02-18 18:56:41.468980'),('3n5uqlopvawg1n8xuoqsqz90d24g646m','eyJ1X2lkIjoxfQ:1rJr1Z:GvW_qTbWc5si2WaEFuYP6JA4Zod1KILEHZJmAqnNmng','2024-01-14 08:18:21.681100'),('ajjtnlngd03zrn01jzq2ekps0ahb69ry','eyJ1X2lkIjo4fQ:1rZqhu:w--YOSOSHbRxyVnYpneL2GM5FshAEHZxA8Aj3ITDFMw','2024-02-27 11:12:10.268494'),('ajpou5ifpv6pbh4mxxrlusi5x1ixirq3','eyJ1X2lkIjoxMn0:1raXVa:hMH-ZcETEiVrW_i3Lli67tzMB_NsPlPcnlDVVSxYgxU','2024-02-29 08:54:18.959329'),('bgjb9x2z64ypfa4mv7uhs5sqpfh72wvb','eyJ1X2lkIjoxMH0:1rZCfN:e_fqLnLb1rt-habtYQnTO1Bq0F4B0phyOGs7qDFb-bY','2024-02-25 16:26:53.361266'),('c63z0zsr9tvc91mp7v7y1z2uae1fnkuf','eyJ1X2lkIjoxMH0:1rdwBz:7AKlHG10zKoe3FdgRgcb3a-invnu_M5QTwLXbR-CeAU','2024-03-09 17:52:07.189478'),('d3h2oo9gn5hm99ed57b85ak6l4uoilwq','eyJ1X2lkIjoxNX0:1rqalx:sqQbcMmKAVOr47woKGYU5NewxNKlR5RaNlj7iAhw3y8','2024-04-13 15:37:33.125833'),('d4l3voqb77pr2rc5z2wsvyk5tlpmp0rp','eyJ1X2lkIjoxfQ:1rJs65:om0_nXl17h1Y5hJYHEmeJGyTvPOSHr2Z1B35ea62H2E','2024-01-14 09:27:05.957540'),('d65ysxn9nu5vj66m4x2ddbrlek8869bm','eyJ1X2lkIjowfQ:1rV79U:02rfJb1ENPKSapPry3s8qQgwFl_2qIeiXPh8LwC9bYE','2024-02-14 09:45:04.899744'),('dh722e84rbhnk0gigj85eiifvj6l1uia','eyJ1X2lkIjoxMH0:1rqanH:JKsqgNE8S1XfupYmTd9cEQQUreF_jSWJWYyCe_oQEPQ','2024-04-13 15:38:55.831313'),('ehwhr0hd3av2pktiksji3vf6uy6chh42','eyJ1X2lkIjowfQ:1rW9vd:WyhcpSWvB0MRo54BwztTCih2JxSn7uXnNOXag--QdOA','2024-02-17 06:55:05.708182'),('htsc865c1j05xidfwb85h8b1looye0ji','eyJ1X2lkIjowfQ:1rZSSh:aXDZNV8K5Ya-0IUoWuIckOqy6LSQVDeqQRtEK1tznzY','2024-02-26 09:18:51.842983'),('inici8cb9dx5kedsf9np0djsu4dyw4bq','eyJ1X2lkIjoyfQ:1rVazr:ypf-sgbIFjhne4W8vQx7pPciCf0ZbTj9F6mZaGRof88','2024-02-15 17:37:07.218035'),('parj1fzglpo23k08foy0keqqa4y8w3o4','eyJ1X2lkIjowfQ:1rpMop:4c5YjyQvX1Q7uBtvOqyPpCayXOJq9qUcmLwTQyKQ-z0','2024-04-10 06:31:27.014880'),('prfrmthxjoz8wzy4t9qbo3l59z5760qh','eyJ1X2lkIjowfQ:1rZOmS:s2Xe9sSSlQ-pnzxBY-p8uxgHGcMx0luYB4SzvqNwCRM','2024-02-26 05:23:00.342478'),('prvk9j8kczbbhlq4ee2yzxh2vgujdflf','eyJ1X2lkIjoxMH0:1raXWO:OpYhvILYNV-ARN72vo5p2vP60_FvBArvUV2rbCHhZhw','2024-02-29 08:55:08.974814'),('qexa9kbl76k6ahk4ebpdsh8ttq7w9hge','eyJ1X2lkIjowfQ:1rUjFL:QtRgnBaYyEdmbNOvdzh9FpkJaF7gFCsYh2ytaoq-2Qk','2024-02-13 08:13:31.008796'),('wwz0spezq2ojuyxux3jgu2itcz463rcd','eyJ1X2lkIjowfQ:1rZO0m:cw3oCWZbgVJgyDvNFbcIKBuc2ILilLknrJ3kleOedIM','2024-02-26 04:33:44.028379'),('xybsys90znwig9enzwmc7rbu6kf3832d','eyJ1X2lkIjoyfQ:1rVb9j:FtpVDxYgziUGnxRbuvmTiYHBjcPYkrjTkDhbd7xlFQI','2024-02-15 17:47:19.458802'),('zyai4tkbki3w1r6sexaih3mlvkdkf6y2','eyJ1X2lkIjoxfQ:1rOxFr:cLmW_HRETO32nwEJ4Fa-qnDxhQU07RmNtGN_63zTbn8','2024-01-28 09:58:11.515810');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiry` (
  `enquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `replay` varchar(200) NOT NULL,
  `enquiry` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`enquiry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry`
--

LOCK TABLES `enquiry` WRITE;
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `enquiry` VALUES (1,2,'wsd',' df','2024-02-03','12:06:40',0),(2,4,'whatd ds',' hey you','2024-02-03','18:39:22',0),(3,2,'Pending',' das','2024-02-12','10:43:36',0),(4,5,'Pending',' fvv','2024-02-12','10:54:00',0),(5,7,'Pending',' afnasnn','2024-02-12','10:54:18',0),(6,10,'nooo',' this is for fraud','2024-02-15','14:27:02',0),(7,7,'Pending',' grreat','2024-03-26','20:39:29',0),(8,12,'reyty',' uguiy9u','2024-03-27','11:22:42',0),(9,15,'Pending',' happy birthday','2024-03-30','21:06:10',0);
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_post`
--

DROP TABLE IF EXISTS `job_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_post` (
  `jobpost_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_post` varchar(45) NOT NULL,
  `service_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`jobpost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_post`
--

LOCK TABLES `job_post` WRITE;
/*!40000 ALTER TABLE `job_post` DISABLE KEYS */;
INSERT INTO `job_post` VALUES (49,'hotel cleaning',9,'we need 5 workers 2 year of experience for part time job 1500/- per day\r\nnight duty','2024-02-13','15:52:27','Applied'),(50,'catering',8,'looking for catering workers at nilambur auditorium interested workers apply now \r\ndate: thursday\r\nwage: 1000','2024-02-13','15:55:33','Applied'),(51,'night duty',1,'security for 10 days','2024-02-13','15:56:27','pending'),(52,'teacher needed',2,'provide your resume for teacher placement','2024-02-13','15:57:25','Applied'),(56,'textiles',2,'need workers 2033','2024-03-22','01:04:37','Applied'),(57,'ksrtc',10,'driver 1000/-','2024-03-26','20:41:55','Applied'),(59,'catering',2,'juice maker 2000/','2024-03-27','13:02:16','Applied'),(60,'hgj',15,'jyfu','2024-03-30','21:08:14','Applied');
/*!40000 ALTER TABLE `job_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','admin','admin',0),(2,'worker@gmail.com','12345','service',1),(3,'worker@gmail.com','12345','worker',1),(4,'aslam@gmail.com','12345','worker',2),(9,'aslam@gmail.com','12345','worker',4),(10,'aslam@gmail.com','12345','worker',4),(12,'fdsf@dfa','fdsfds','service',4),(13,'eeee@gmail.com','12345','worker',5),(14,'arfinser@gmail.com','12345','service',6),(15,'arfimwor@gmail.com','12345','worker',10),(16,'ashiqvm@gmail.com','12345','service',2),(18,'kanc@gmail.com','12345','service',7),(20,'arfinisworker@gmail.com','12345','worker',11),(21,'denmark@gmail.com','12345','service',9),(22,'arshadsir@gmail.com','12345','worker',12),(23,'ashiqsir@gmail.com','12345','service',10),(24,'afnan@service.com','12345','service',3),(25,'workrest@gmail.com','12345','worker',7),(26,'thanvi002@gmail.com','12345','service',12),(27,'fida123@gmail.com','12345','worker',13),(28,'kenxa@gmail.com','12345','worker',14),(29,'cde@gmail.com','123','service',13),(30,'cde@gmail.com','123','service',13),(31,'hiba@gmail.com','777','worker',15),(32,'fidha@gmail.com','12345','service',14),(33,'risha@gmail.com','232500','service',15);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,3,'hey man nice to see you you are capichino','0000-00-00','00:00:00'),(2,2,4,'asdasd','2024-02-12','11:16:19'),(3,2,4,'asdasd','2024-02-12','11:17:05'),(4,2,4,'asdasd','2024-02-12','11:17:27'),(5,2,4,'dsfcsd','2024-02-12','11:21:45'),(6,2,2,'hrll','2024-02-12','11:25:41'),(7,2,2,'hrll','2024-02-12','11:37:04'),(8,10,12,'hello','2024-02-15','14:32:06'),(9,2,8,'adad','2024-03-21','23:01:29'),(10,10,3,'hr comming','2024-03-26','20:45:48'),(11,12,11,'good','2024-03-27','11:33:10'),(12,12,11,'good','2024-03-27','11:33:39'),(13,12,14,'hgfytf','2024-03-27','11:48:02');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `application_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,NULL,2,'wewewee','23233',22,'2024-03-21','23:01:18'),(2,NULL,10,'nice work','1330',25,'2024-03-26','20:43:58'),(4,NULL,2,'okset','1000',27,'2024-03-27','13:05:27'),(5,NULL,15,'good sd','100',28,'2024-03-30','21:14:45');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `service_name` varchar(45) NOT NULL,
  `service_description` varchar(45) DEFAULT NULL,
  `contact` decimal(10,0) NOT NULL,
  `city` varchar(45) NOT NULL,
  `document` varchar(250) DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `profile` varchar(250) DEFAULT NULL,
  `pin` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'worker@gmail.com','12345','worker aan','aan',98765489,'gt','Screenshot 2024-01-29 214206.png','gta','Screenshot 2024-01-04 194229.png','876545','Approved'),(2,'ashiqvm@gmail.com','12345','ashiq pvt','  me meme  mem',7678909876,'horio','view-3d-school-girl-nature.jpg','ff','clrwo.png','43454','Rejected'),(3,'afnan@service.com','12345','sssssssssssss2222222','mooor',8075557124,'wayanda','Screenshot_2024-01-30_221716-removebg.png','vajia','modern-monitor-elegant-table.jpg','1234567777','Approved'),(4,'fdsf@dfa','fdsfds','r6y','ty',7666666666,'d','Screenshot_2024-01-31_000759-transformed.png','gg','Screenshot_2024-01-31_000759-transformed.png','6','Approved'),(5,'ashiqvm@gmail.com','12345','adaad','hehec',9897898784,'fae','2150709862.jpg','kerl','2150709862.jpg','897808','Rejected'),(6,'arfinser@gmail.com','12345','fafa','afaf',9875789754,'df','PsR2F3RMca.pdf','df','2150709862.jpg','787889','Approved'),(7,'kanc@gmail.com','12345','sd sagar','fair',9789090890,'geevr','clearoff.png','dsds','Picture3.png','566500','Approved'),(8,'afnanxt00@gmail.com','12345','afnan k','nothing about me :>',8075557124,'Ernakulam','DFD.png','kochi',NULL,'676541','Rejected'),(9,'denmark@gmail.com','12345','denmark','company from denmark',9870987679,'nilambur','DFD.png','nilambur','14670027_5508687.jpg','453433','Approved'),(10,'ashiqsir@gmail.com','12345','ashiq pvt company',' sirrr ',897065678,'vengara',NULL,'kanur','Capture001.png','987890','pending'),(11,'amalmuh@gmail.com','232500','amal','ddd',6456456435,'hewe','abstract-dark-blurred-background-smooth-gradient-texture-color-shiny-bright-website-pattern-banner-header-sidebar-graphic-art-image.jpg','sdfdf','futuristic-computer-graphic-glowing-human-face-generative-ai.jpg','767688','pending'),(12,'thanvi002@gmail.com','12345','erty','fyghuh',1234567890,'palani','20240304105806.pdf','rdyg','admin.jpg','867809','Approved'),(13,'cde@gmail.com','123','db','fjguyf',1234567898,'kjg','3d-background-with-white-cubes.jpg','fytf',NULL,'96756','Approved'),(14,'fidha@gmail.com','12345','fidha','fhhjjjuj\r\n\r\n',1234567890,'malappuram','20240304105806.pdf','malappuram','admin.jpg','675483','Approved'),(15,'risha@gmail.com','232500','risha','hackton winner',8985738489,'areecode','Screenshot 2023-11-20 212912.png','moorkanad','Screenshot 2023-10-19 000748.png','908978','Approved');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `worker_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `profile` varchar(250) DEFAULT NULL,
  `pin` varchar(45) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'worker','worker@gmail.com','12345','fgv','wokr@upi','76543876','Screenshot 2024-01-04 194044.png','667788','gg','Approved','0000-00-00'),(2,'aslam','aslam@gmail.com','12345','kottakal','5432@upi','9485857390','Screenshot 2024-01-04 194044.png','623011','lkjhgfdsa','Approved','0000-00-00'),(3,'Dream','workrest@gmail.com','232500','cirty','japiut@gmail,com','9898786789','snap-imagetoolspro.png','68956','kerala','Rejected',NULL),(4,'greper','aslam@gmail.com','12345','kema','hasli@upi','9899987897','Picture1.jpg','748499','lova','Approved',NULL),(5,'eeena','eeee@gmail.com','12345','kema','haffsli@upi','6465656564','admin.jpg','748499','lova','Approved',NULL),(6,'worehg','workrest@gmail.com','12345','kema','haffsli@upi','87876565','admin.jpg','748499','lova','Rejected',NULL),(7,'waer','workrest@gmail.com','12345','kema','haffsli@upi','445667777','admin.jpg','748499','lova','Approved',NULL),(8,'greper','workrest@gmail.com','1234546','kema','haffsli@upi','3434343434','php sylabus.jpg','748499','lova','Rejected',NULL),(9,'sd','gagag@gmail.com','12345','rwerrr','435','8989877900','snap.png','555555','r','Rejected',NULL),(10,'arfin','arfimwor@gmail.com','12345','londan','oi@fds','9878790766','snap.png','123123','opio','pending',NULL),(11,'arfin','arfinisworker@gmail.com','12345','edavanna','arfin@upi','7689009851','9652148_7941.jpg','454671','othayi','Approved',NULL),(12,'arshad','arshadsir@gmail.com','12345','areecode','zaman@upi','9898767567','9652148_7941.jpg','980097','areecode','Approved',NULL),(13,'gretrd','fida123@gmail.com','12345','ytytr','98765@upi','9866654319','0009.jpg','62302','yrytfr','Approved',NULL),(14,'jais','kenxa@gmail.com','12345','kullu','geui@upi','7868683450',NULL,'879754','manali','Approved',NULL),(15,'hihy','hiba@gmail.com','777','tfu','ygu6@upi','1234567897',NULL,'978645','yitgi','Approved',NULL);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-07 22:37:15
