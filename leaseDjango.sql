-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: lease_django
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add dict type',7,'add_dicttype'),(26,'Can change dict type',7,'change_dicttype'),(27,'Can delete dict type',7,'delete_dicttype'),(28,'Can view dict type',7,'view_dicttype'),(29,'Can add dict',8,'add_dict'),(30,'Can change dict',8,'change_dict'),(31,'Can delete dict',8,'delete_dict'),(32,'Can view dict',8,'view_dict'),(33,'Can add house info',9,'add_houseinfo'),(34,'Can change house info',9,'change_houseinfo'),(35,'Can delete house info',9,'delete_houseinfo'),(36,'Can view house info',9,'view_houseinfo'),(37,'Can add lease info',10,'add_leaseinfo'),(38,'Can change lease info',10,'change_leaseinfo'),(39,'Can delete lease info',10,'delete_leaseinfo'),(40,'Can view lease info',10,'view_leaseinfo'),(41,'Can add realty info',11,'add_realtyinfo'),(42,'Can change realty info',11,'change_realtyinfo'),(43,'Can delete realty info',11,'delete_realtyinfo'),(44,'Can view realty info',11,'view_realtyinfo'),(45,'Can add 房地产经纪机构',12,'add_realtyinfo'),(46,'Can change 房地产经纪机构',12,'change_realtyinfo'),(47,'Can delete 房地产经纪机构',12,'delete_realtyinfo'),(48,'Can view 房地产经纪机构',12,'view_realtyinfo'),(49,'Can add 用户信息',13,'add_userprofile'),(50,'Can change 用户信息',13,'change_userprofile'),(51,'Can delete 用户信息',13,'delete_userprofile'),(52,'Can view 用户信息',13,'view_userprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$6qvmfjfulyrr$6AKW3gPAsug1+olyXyhY5lmDs/7su4/dGlcBxLuw3PU=','2020-09-22 14:37:12.242437',1,'chengzhouyun','','','',1,1,'2020-09-16 09:25:09.645591'),(2,'pbkdf2_sha256$216000$YFNpPmTu4W17$6hm27go5eUaFMZG50SJBTiLk16ccmlsot15YR2O98ZU=','2020-09-26 09:45:13.960407',0,'test','','','',0,1,'2020-09-16 14:03:23.379787');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict`
--

DROP TABLE IF EXISTS `dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL,
  `addedDate` datetime(6) NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dicts_dict_type_id_96703950_fk_dicts_dicttype_id` (`type_id`),
  CONSTRAINT `dicts_dict_type_id_96703950_fk_dicts_dicttype_id` FOREIGN KEY (`type_id`) REFERENCES `dict_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict`
--

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` VALUES (1,'住宅','2020-09-16 10:00:26.571816',1),(2,'集体宿舍','2020-09-16 10:00:26.571816',1),(3,'营业','2020-09-16 10:00:26.581637',1),(4,'仓库工厂','2020-09-16 10:00:26.581637',1),(5,'邮电交通','2020-09-16 10:00:26.591549',1),(6,'商业','2020-09-16 10:00:26.591549',1),(7,'服务业','2020-09-16 10:00:26.591549',1),(8,'文化娱乐','2020-09-16 10:00:26.601598',1),(9,'教育','2020-09-16 10:00:26.601598',1),(10,'医疗','2020-09-16 10:00:26.601598',1),(11,'科研','2020-09-16 10:00:26.611702',1),(12,'体育','2020-09-16 10:00:26.611702',1),(13,'办公','2020-09-16 10:00:26.611702',1),(14,'市政设施','2020-09-16 10:00:26.621428',1),(15,'房管设施','2020-09-16 10:00:26.621428',1),(16,'其他用途','2020-09-16 10:00:26.621428',1),(17,'别墅','2020-09-16 10:00:26.633900',1),(18,'车库','2020-09-16 10:00:26.633900',1),(19,'会所','2020-09-16 10:00:26.633900',1),(20,'商住','2020-09-16 10:00:26.641424',1),(81,'身份证','2020-09-16 10:27:14.943013',3),(82,'军官证','2020-09-16 10:27:14.943013',3),(83,'护照','2020-09-16 10:27:14.952868',3),(84,'户口本','2020-09-16 10:27:14.952868',3),(85,'直管产','2020-09-16 10:28:14.812501',4),(86,'自管产','2020-09-16 10:28:14.822332',4),(87,'军产','2020-09-16 10:28:14.822332',4),(88,'集体所有房产','2020-09-16 10:28:14.832591',4),(89,'私有房产','2020-09-16 10:28:14.832591',4),(90,'港澳台胞房产','2020-09-16 10:28:14.832591',4),(91,'涉外产','2020-09-16 10:28:14.842704',4),(92,'其他产','2020-09-16 10:28:14.842704',4),(93,'共有产权','2020-09-16 10:28:14.842704',4),(94,'联营企业房产','2020-09-16 10:28:14.852666',4),(95,'集体产','2020-09-16 10:28:14.852666',4),(96,'股份制房产','2020-09-16 10:28:14.852666',4),(97,'租凭','2020-09-16 10:29:22.431158',5),(98,'自营','2020-09-16 10:29:22.431158',5),(99,'已房入股','2020-09-16 10:29:22.441623',5),(100,'联营','2020-09-16 10:29:22.446175',5),(101,'借用','2020-09-16 10:29:22.451202',5),(102,'其他','2020-09-16 10:29:22.451202',5),(103,'租凭金额','2020-09-16 10:36:37.016698',6),(104,'房屋面积','2020-09-16 10:36:37.016698',6),(105,'未复审','2020-09-16 10:37:50.816389',7),(106,'未审批','2020-09-16 10:37:50.816389',7),(107,'已审批','2020-09-16 10:37:50.826308',7),(108,'到期信息','2020-09-16 10:37:50.826308',7),(109,'草稿箱','2020-09-16 10:37:50.831602',7),(111,'砖混','2020-09-16 11:09:24.824889',2),(112,'钢混','2020-09-16 11:09:24.835025',2),(113,'砖木','2020-09-16 11:09:24.835025',2),(114,'框架','2020-09-16 11:09:24.835025',2),(115,'框架剪力墙','2020-09-16 11:09:24.844631',2),(116,'钢结构','2020-09-16 11:09:24.844631',2),(117,'租凭|审批','2020-10-13 09:00:17.171456',8),(118,'租凭|增删改','2020-10-13 09:00:24.909955',8),(119,'租凭|查看','2020-10-13 09:00:31.794787',8),(120,'房屋|增删改','2020-10-13 09:00:39.082423',8),(121,'房屋|查看','2020-10-13 09:00:45.693276',8),(122,'经纪|增删改','2020-10-13 09:00:52.648257',8),(123,'经纪|查看','2020-10-13 09:00:59.461968',8),(124,'用户|增删改','2020-10-13 09:01:07.337328',8),(125,'用户|查看','2020-10-13 09:01:13.222418',8);
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dict_type`
--

DROP TABLE IF EXISTS `dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dict_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL,
  `addedDate` datetime(6) NOT NULL,
  `sign` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dict_type`
--

LOCK TABLES `dict_type` WRITE;
/*!40000 ALTER TABLE `dict_type` DISABLE KEYS */;
INSERT INTO `dict_type` VALUES (1,'房屋用途','2020-09-16 09:53:57.415451','houseUse'),(2,'房屋结构','2020-09-16 09:53:57.435724','houseStructure'),(3,'证件类型','2020-09-16 09:53:57.435724','IDType'),(4,'产别','2020-09-16 09:53:57.445606','propertyType'),(5,'经营方式','2020-09-16 09:53:57.445606','operationType'),(6,'收费金额','2020-09-16 09:53:57.445606','chargeMoney'),(7,'租凭状态','2020-09-16 09:53:57.455708','leaseStatus'),(8,'用户权限','2020-10-13 08:15:12.684862','userAuthority');
/*!40000 ALTER TABLE `dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (47,'2020-09-26 15:42:41.831613','15','1 EF21-FFE1-2234 周深 3',2,'[{\"changed\": {\"fields\": [\"\\u53d7\\u7406\\u7f16\\u53f7\", \"\\u7f34\\u6b3e\\u91d1\\u989d\", \"AddUser\"]}}]',10,2),(48,'2020-09-26 15:53:18.459026','14','1 EF21-FFE1-2234 周深 243',2,'[{\"changed\": {\"fields\": [\"\\u53d7\\u7406\\u7f16\\u53f7\", \"\\u7f34\\u6b3e\\u91d1\\u989d\", \"AddUser\"]}}]',10,2),(49,'2020-09-26 16:10:51.194909','13','EF21-FFE1-2234 周深 2',2,'[{\"changed\": {\"fields\": [\"AddUser\"]}}]',10,2),(50,'2020-09-26 16:12:01.842926','13','EF21-FFE1-2234 周深 2',2,'[]',10,2),(51,'2020-09-26 16:12:14.232729','11','EE22-VE22-F111 张飞 233',2,'[{\"changed\": {\"fields\": [\"AddUser\"]}}]',10,2),(52,'2020-09-26 16:29:05.517628','1','1',3,'',13,2),(53,'2020-10-13 08:15:12.698528','8','用户权限',1,'[{\"added\": {}}]',7,2),(54,'2020-10-13 09:00:17.183172','117','租凭审批',1,'[{\"added\": {}}]',8,2),(55,'2020-10-13 09:00:24.913862','118','租凭增删改',1,'[{\"added\": {}}]',8,2),(56,'2020-10-13 09:00:31.799669','119','租凭查看',1,'[{\"added\": {}}]',8,2),(57,'2020-10-13 09:00:39.087306','120','房屋增删改',1,'[{\"added\": {}}]',8,2),(58,'2020-10-13 09:00:45.696205','121','房屋查看',1,'[{\"added\": {}}]',8,2),(59,'2020-10-13 09:00:52.650210','122','经纪增删改',1,'[{\"added\": {}}]',8,2),(60,'2020-10-13 09:00:59.465874','123','经纪查看',1,'[{\"added\": {}}]',8,2),(61,'2020-10-13 09:01:07.342207','124','用户增删改',1,'[{\"added\": {}}]',8,2),(62,'2020-10-13 09:01:13.226323','125','用户查看',1,'[{\"added\": {}}]',8,2),(68,'2020-10-16 10:11:23.627524','2','chengzhouyun',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',13,6),(69,'2020-10-16 14:05:42.857769','125','用户|查看',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(70,'2020-10-16 14:05:49.776508','124','用户|增删改',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(71,'2020-10-16 14:05:54.885968','123','经纪|查看',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(72,'2020-10-16 14:06:01.146002','122','经纪|增删改',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(73,'2020-10-16 14:06:08.171006','121','房屋|查看',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(74,'2020-10-16 14:06:13.588597','120','房屋|增删改',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(75,'2020-10-16 14:06:20.205580','119','租凭|查看',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(76,'2020-10-16 14:06:25.787492','118','租凭|增删改',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(77,'2020-10-16 14:06:31.239865','117','租凭|审批',2,'[{\"changed\": {\"fields\": [\"Label\"]}}]',8,2),(78,'2020-10-17 10:39:29.077188','5','FEAQ-1123-CCAA  赵海澄',2,'[{\"changed\": {\"fields\": [\"\\u8bc1\\u4ef6\\u7c7b\\u578b\"]}}]',9,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'dicts','dict'),(7,'dicts','dicttype'),(9,'house','houseinfo'),(10,'lease','leaseinfo'),(12,'realty','realtyinfo'),(11,'realtyInfo','realtyinfo'),(6,'sessions','session'),(13,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-09-16 09:15:41.658372'),(2,'auth','0001_initial','2020-09-16 09:15:41.877236'),(3,'admin','0001_initial','2020-09-16 09:15:42.490633'),(4,'admin','0002_logentry_remove_auto_add','2020-09-16 09:15:42.638542'),(5,'admin','0003_logentry_add_action_flag_choices','2020-09-16 09:15:42.654532'),(6,'contenttypes','0002_remove_content_type_name','2020-09-16 09:15:42.784450'),(7,'auth','0002_alter_permission_name_max_length','2020-09-16 09:15:42.863404'),(8,'auth','0003_alter_user_email_max_length','2020-09-16 09:15:43.421596'),(9,'auth','0004_alter_user_username_opts','2020-09-16 09:15:43.455579'),(10,'auth','0005_alter_user_last_login_null','2020-09-16 09:15:43.807999'),(11,'auth','0006_require_contenttypes_0002','2020-09-16 09:15:43.831986'),(12,'auth','0007_alter_validators_add_error_messages','2020-09-16 09:15:43.868961'),(13,'auth','0008_alter_user_username_max_length','2020-09-16 09:15:44.224743'),(14,'auth','0009_alter_user_last_name_max_length','2020-09-16 09:15:44.560292'),(15,'auth','0010_alter_group_name_max_length','2020-09-16 09:15:44.863103'),(16,'auth','0011_update_proxy_permissions','2020-09-16 09:15:44.879091'),(17,'auth','0012_alter_user_first_name_max_length','2020-09-16 09:15:44.964428'),(18,'dicts','0001_initial','2020-09-16 09:15:45.023393'),(19,'dicts','0002_auto_20200907_0922','2020-09-16 09:15:45.225265'),(20,'dicts','0003_auto_20200916_0915','2020-09-16 09:15:45.278233'),(21,'house','0001_initial','2020-09-16 09:15:45.330203'),(22,'house','0002_auto_20200907_1545','2020-09-16 09:15:45.348191'),(23,'house','0003_auto_20200916_0915','2020-09-16 09:15:45.374174'),(24,'lease','0001_initial','2020-09-16 09:15:45.466117'),(25,'lease','0002_auto_20200907_1545','2020-09-16 09:15:45.497098'),(26,'lease','0003_auto_20200907_1554','2020-09-16 09:15:46.485954'),(27,'lease','0004_auto_20200910_1631','2020-09-16 09:15:46.831021'),(28,'lease','0005_auto_20200910_1634','2020-09-16 09:15:47.436802'),(29,'lease','0006_auto_20200910_1652','2020-09-16 09:15:47.571585'),(30,'lease','0007_auto_20200910_1654','2020-09-16 09:15:47.721305'),(31,'lease','0008_auto_20200910_1656','2020-09-16 09:15:47.831349'),(32,'lease','0009_auto_20200911_1321','2020-09-16 09:15:48.281126'),(33,'lease','0010_auto_20200911_1333','2020-09-16 09:15:48.441244'),(34,'lease','0011_auto_20200911_1512','2020-09-16 09:15:48.481097'),(35,'lease','0012_auto_20200911_1656','2020-09-16 09:15:48.821409'),(36,'lease','0013_auto_20200916_0915','2020-09-16 09:15:48.861370'),(37,'sessions','0001_initial','2020-09-16 09:15:48.891556'),(38,'user','0001_initial','2020-09-16 09:15:48.961261'),(39,'user','0002_auto_20200907_1545','2020-09-16 09:15:48.971508'),(40,'user','0003_auto_20200907_1603','2020-09-16 09:15:49.011109'),(41,'user','0004_delete_user','2020-09-16 09:15:49.036292'),(42,'lease','0014_auto_20200917_0913','2020-09-17 09:13:57.702048'),(43,'lease','0015_auto_20200917_0931','2020-09-17 09:31:15.285841'),(44,'lease','0016_auto_20200917_1028','2020-09-17 10:28:46.325774'),(45,'lease','0017_auto_20200917_1055','2020-09-17 10:55:33.355409'),(46,'lease','0018_auto_20200917_1107','2020-09-17 11:07:24.494464'),(47,'realtyInfo','0001_initial','2020-09-24 08:43:56.880064'),(48,'realtyInfo','0002_realtyinfo_addedtime','2020-09-24 08:53:10.908573'),(49,'realtyInfo','0003_auto_20200924_0858','2020-09-24 08:58:04.122559'),(50,'realtyInfo','0004_auto_20200924_0859','2020-09-24 08:59:15.354088'),(51,'realtyInfo','0005_auto_20200924_0859','2020-09-24 08:59:54.770496'),(52,'dicts','0004_auto_20200924_1044','2020-09-24 10:44:33.481781'),(53,'realty','0001_initial','2020-09-24 11:09:23.300310'),(54,'users','0001_initial','2020-09-25 16:20:09.242839'),(55,'users','0002_auto_20200925_1622','2020-09-25 16:22:17.464026'),(58,'users','0003_userprofile_displayname','2020-09-26 15:37:43.025094'),(59,'users','0004_auto_20200926_1006','2020-09-26 15:37:43.039086'),(60,'users','0005_auto_20200926_1537','2020-09-26 15:37:43.716431'),(61,'lease','0002_auto_20200926_1552','2020-09-26 15:52:51.370019'),(62,'lease','0003_auto_20200926_1557','2020-09-26 15:57:42.663998'),(63,'lease','0004_auto_20200926_1606','2020-09-26 16:06:11.325205'),(64,'users','0006_auto_20200927_0943','2020-09-27 09:44:13.205954'),(65,'users','0007_auto_20200927_1114','2020-09-27 11:14:12.914679'),(66,'lease','0005_auto_20200930_1639','2020-09-30 16:39:44.827060'),(67,'house','0002_auto_20201017_1021','2020-10-17 10:22:14.411089');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('790mudlut3380bec1ueqtol7gdjefh3t','.eJxVjDsOwyAQBe9CHSHA_Jwyvc-All0ITiKQjF1FuXuE5CJp38y8Nwtw7CUcPW1hJXZlkl1-twj4THUAekC9N46t7tsa-VD4STtfGqXX7XT_Dgr0MmptotMq2tkpCT6JDJPIZHTMFsF6QdkadKiEsRNSMkjCgwaTJpQWZvb5Aux-OFg:1kJBMX:PN9YTJzM3Q6P6nWfBtXZMf_JWPpk5RypoVvQPEHn0p8','2020-10-02 16:03:21.230048'),('j3xunxt8c8pr95kaia43jp2rhuocp8jv','.eJxVjDsOwyAQBe9CHSHA_Jwyvc-All0ITiKQjF1FuXuE5CJp38y8Nwtw7CUcPW1hJXZlkl1-twj4THUAekC9N46t7tsa-VD4STtfGqXX7XT_Dgr0MmptotMq2tkpCT6JDJPIZHTMFsF6QdkadKiEsRNSMkjCgwaTJpQWZvb5Aux-OFg:1kIPa7:yHEhUzHLVia7ykRmKj1eyOHkomk3jPdYnvFWuTDi794','2020-09-30 13:02:11.797724'),('jqlmvwgjcnojbaquht51elcv5v3uxyy7','.eJxVjMEOwiAQBf-FsyFAoQWP3vsNZJcFqRpISnsy_rs06UGvb2bem3nYt-z3Fle_ELsyxS6_G0J4xnIAekC5Vx5q2dYF-aHwkzY-V4qv2-n-HWRoudcCQZoxQEJpJo2jkBKCm2hwVhlMyugOY6DuKKmdtSZqRGGIBgDtEvt8AeY9OCU:1kNAIw:Qa0MJhZ18vbkznSrTYLKcGKwCM8fM4qXCPlDgx8Vx20','2020-10-13 15:44:06.358722'),('lg7kc0g10ak0xziw4gamq8quv41jj0er','.eJxVjDsOwyAQBe9CHSHA_Jwyvc-All0ITiKQjF1FuXuE5CJp38y8Nwtw7CUcPW1hJXZlkl1-twj4THUAekC9N46t7tsa-VD4STtfGqXX7XT_Dgr0MmptotMq2tkpCT6JDJPIZHTMFsF6QdkadKiEsRNSMkjCgwaTJpQWZvb5Aux-OFg:1kIMys:_MmknBPjFGOGAPo7OvHhq11NFQei2L1mU6_ukwFSCg0','2020-09-30 10:15:34.740439'),('ls3ug65ai54cmih4smphzlds3jue0cf8','.eJxVjDsOwyAQBe9CHSHA_Jwyvc-All0ITiKQjF1FuXuE5CJp38y8Nwtw7CUcPW1hJXZlkl1-twj4THUAekC9N46t7tsa-VD4STtfGqXX7XT_Dgr0MmptotMq2tkpCT6JDJPIZHTMFsF6QdkadKiEsRNSMkjCgwaTJpQWZvb5Aux-OFg:1kIkEd:q9-py7sRRwHziuoQchqSGVgtFtUliDMequzufnEikkU','2020-10-01 11:05:23.697985'),('m3unoxz0scoi5twvamhijdnt5qhpimzf','.eJxVjDsOwyAQBe9CHSHA_Jwyvc-All0ITiKQjF1FuXuE5CJp38y8Nwtw7CUcPW1hJXZlkl1-twj4THUAekC9N46t7tsa-VD4STtfGqXX7XT_Dgr0MmptotMq2tkpCT6JDJPIZHTMFsF6QdkadKiEsRNSMkjCgwaTJpQWZvb5Aux-OFg:1kIh7A:aVHk-bTAgltH5nWnk6BsQvPilYZzkg5XMGjV-yCyoZg','2020-10-01 07:45:28.272945'),('np9ttc6qoi78ehw31f1iv5atqrzqkw78','.eJxVjMsOwiAQRf-FtSHM8Ghw6d5vIAwDUjWQlHZl_Hdt0oVu7znnvkSI21rDNvISZhZngeL0u1FMj9x2wPfYbl2m3tZlJrkr8qBDXjvn5-Vw_w5qHPVba68poklkACKWrDkZS07BpAuBzYpBFybr3ATaKzTE3rJSiBktWBTvD9uSNxc:1kTKyB:qleOkt31sO4PyMJU3D5-8ihlSO5EdoK9magP9ismkDw','2020-10-30 16:20:11.110365'),('q74o2r87g1xqcwbfg8yi542jqavuq7gd','.eJxVjMEOwiAQRP-FsyGwbcPi0bvfQJZlK1UDSWlPxn9Xkh70Npn3Zl4q0L7lsDdZw5LUWYE6_XaR-CGlg3Sncquaa9nWJequ6IM2fa1JnpfD_TvI1HJfO8GYkACBkKNDAzxHcsna0Q0GBCY_ziYRevJCPFhk4W8GcWaiQb0_-v04Yg:1kLzGz:NwSpfP9PNXUevMr1gwrBYWjjtQ4MxbEnJs8672Elw_g','2020-10-10 09:45:13.975401'),('vhzjdk27d4n91vcdxi8jqm8uyidwve3u','.eJxVjMEOwiAQBf-FsyFAoQWP3vsNZJcFqRpISnsy_rs06UGvb2bem3nYt-z3Fle_ELsyxS6_G0J4xnIAekC5Vx5q2dYF-aHwkzY-V4qv2-n-HWRoudcCQZoxQEJpJo2jkBKCm2hwVhlMyugOY6DuKKmdtSZqRGGIBgDtEvt8AeY9OCU:1kRtfi:6XU-6wBzbdBVWPg-nhAkfWrR3UFElg0fg--1RZcXrEc','2020-10-26 16:59:10.642578'),('w1b313sm8wtt9bac5kn5m1rvi3iocy56','.eJxVjMEOwiAQBf-FsyFAoQWP3vsNZJcFqRpISnsy_rs06UGvb2bem3nYt-z3Fle_ELsyxS6_G0J4xnIAekC5Vx5q2dYF-aHwkzY-V4qv2-n-HWRoudcCQZoxQEJpJo2jkBKCm2hwVhlMyugOY6DuKKmdtSZqRGGIBgDtEvt8AeY9OCU:1kMNOE:ORpTQkOHTBT9l28j3Ea8VvQXXTxpRSzqnNWo9XEKQRc','2020-10-11 11:30:18.871015');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_info`
--

DROP TABLE IF EXISTS `house_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `houseID` varchar(20) NOT NULL,
  `propertyID` varchar(20) NOT NULL,
  `houseOwner` varchar(20) NOT NULL,
  `ownerPhone` varchar(20) NOT NULL,
  `IDType` int NOT NULL,
  `IDNum` varchar(20) NOT NULL,
  `houseAdd` varchar(30) NOT NULL,
  `houseArea` double NOT NULL,
  `houseUse` int NOT NULL,
  `houseStructure` int NOT NULL,
  `landArea` double NOT NULL,
  `propertyType` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_info`
--

LOCK TABLES `house_info` WRITE;
/*!40000 ALTER TABLE `house_info` DISABLE KEYS */;
INSERT INTO `house_info` VALUES (1,'EE22-VE22-F111','EFG1-GEE1-3333','张飞','134553235455',82,'2324242424','海城市海州大街',1333,5,115,122,95),(2,'EF21-FFE1-2234','4422-2311-FW13','周深','13245667775',81,'2323232241122','海城市中心地带',223,3,116,442,94),(4,'FE23-SSE1-FGE3','FCCE-FEAA-1111','杨广庆','13849504033',81,'210381930494585903','海城市花溪地二期一楼底商',203,1,112,203,94),(5,'FEAQ-1123-CCAA','ADCE-123D-VVCC','赵海澄','138495221',85,'2342511112312451124','海城市海地名都北门',231,6,116,324,96);
/*!40000 ALTER TABLE `house_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease_info`
--

DROP TABLE IF EXISTS `lease_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `acceptID` varchar(20) DEFAULT NULL,
  `leaseArea` varchar(10) NOT NULL,
  `leaseHolder` varchar(20) NOT NULL,
  `holderPhone` varchar(20) DEFAULT NULL,
  `holderIDType` int NOT NULL,
  `holderID` varchar(20) NOT NULL,
  `leaseMoney` varchar(10) NOT NULL,
  `leasePayMoney` varchar(20) DEFAULT NULL,
  `leaseFineMoney` double NOT NULL,
  `leaseTime` int NOT NULL,
  `leaseStartTime` date NOT NULL,
  `leaseEndTime` date NOT NULL,
  `placeName` varchar(20) NOT NULL,
  `manageWay` int NOT NULL,
  `arbitrationUnits` varchar(20) DEFAULT NULL,
  `contractNum` int NOT NULL,
  `quanZheng` tinyint(1) NOT NULL,
  `chanQuanXianDing` tinyint(1) NOT NULL,
  `zhengJianQiQuan` tinyint(1) NOT NULL,
  `yiLiuWenTi` tinyint(1) NOT NULL,
  `chanQuanJiuFen` tinyint(1) NOT NULL,
  `gaiBianXingZhi` tinyint(1) NOT NULL,
  `chengDanChengDan` tinyint(1) NOT NULL,
  `qiYueGuiDing` tinyint(1) NOT NULL,
  `shenHeWenTi` tinyint(1) NOT NULL,
  `otherCondition` longtext NOT NULL,
  `addUser_id` int NOT NULL,
  `leaseStatus` int DEFAULT NULL,
  `house_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lease_leaseinfo_addUser_id_e1ddd8ac` (`addUser_id`),
  KEY `lease_info_houseInfo_id_9bb636bb` (`house_id`),
  CONSTRAINT `lease_info_house_id_bcab127e_fk_house_info_id` FOREIGN KEY (`house_id`) REFERENCES `house_info` (`id`),
  CONSTRAINT `lease_leaseinfo_addUser_id_e1ddd8ac_fk_auth_user_id` FOREIGN KEY (`addUser_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease_info`
--

LOCK TABLES `lease_info` WRITE;
/*!40000 ALTER TABLE `lease_info` DISABLE KEYS */;
INSERT INTO `lease_info` VALUES (1,NULL,'11','112','123123',82,'123','123232348',NULL,12323,123,'2020-09-16','2020-09-16','123',97,'12322',123,1,0,0,1,1,0,0,1,1,'1114',2,106,1),(2,NULL,'2323300','1214','23',81,'23','23',NULL,23,23,'2020-09-16','2020-09-25','23',102,'23',23,0,0,0,0,0,0,0,0,0,'237',2,106,1),(3,NULL,'23','11211o12','23',81,'23','23',NULL,23,23,'2020-09-16','2020-09-25','23',99,'23',23,1,1,1,1,1,1,1,1,1,'23',2,106,1),(5,'','1','121111','123123',82,'123','123','',123,123,'2020-09-16','2020-09-16','123',99,'123',123,1,1,1,1,1,1,1,1,1,'123',2,105,1),(9,'','222','3237','2323',82,'2323','232323','',2323,23,'2020-09-22','2020-09-23','2323',98,'23',2323,1,0,1,0,1,1,1,1,1,'2323',2,105,2),(10,'','12123','11112','23123',82,'23234','2323','',23,2323,'2020-09-15','2020-09-24','2323',97,'23',23,1,1,1,1,1,1,1,1,1,'2323',2,105,1),(11,NULL,'23','233','24',82,'23','23',NULL,23,23,'2020-09-22','2020-09-23','23',100,'23',23,1,1,1,1,1,1,1,1,1,'231',2,106,1),(13,NULL,'2','2','2',82,'2','23',NULL,23,23,'2020-09-22','2020-09-26','23',99,'23',23,0,0,0,0,0,0,0,0,0,'23',2,106,2),(14,'1','2323','243','434',81,'3434','23','1',23,23,'2020-09-01','2020-10-02','23',99,'23',23,1,0,1,0,1,1,1,1,1,'23',2,106,2),(17,NULL,'23','孙权','233455532',81,'阿3232323','23',NULL,23,23,'2020-10-06','2020-10-24','23',98,'23',23,0,0,0,0,0,0,0,0,0,'23',2,106,5);
/*!40000 ALTER TABLE `lease_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realty_realtyinfo`
--

DROP TABLE IF EXISTS `realty_realtyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realty_realtyinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `institutionName` varchar(40) NOT NULL,
  `officeAddress` varchar(40) NOT NULL,
  `lawPerson` varchar(10) NOT NULL,
  `vilidityDateStart` date NOT NULL,
  `vilidityDateEnd` date NOT NULL,
  `certificateText` varchar(10) NOT NULL,
  `certificateNum` varchar(10) NOT NULL,
  `addedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realty_realtyinfo`
--

LOCK TABLES `realty_realtyinfo` WRITE;
/*!40000 ALTER TABLE `realty_realtyinfo` DISABLE KEYS */;
INSERT INTO `realty_realtyinfo` VALUES (3,'海城市大东海成房地产经纪营销策划有限公司','海城市星海管理站冠名街道B-3341','赵一二','2020-09-01','2020-09-30','2020','0807','2020-09-29 14:51:53.788361'),(4,'海城市中铁一局','海城市碧桂园大健康楼下','曹植','2020-09-01','2020-09-29','2223','3455','2020-09-29 15:22:13.727388');
/*!40000 ALTER TABLE `realty_realtyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realtyinfo_realtyinfo`
--

DROP TABLE IF EXISTS `realtyinfo_realtyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realtyinfo_realtyinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `institutionName` varchar(40) NOT NULL,
  `officeAddress` varchar(40) NOT NULL,
  `lawPerson` varchar(10) NOT NULL,
  `vilidityDateStart` date NOT NULL,
  `vilidityDateEnd` date NOT NULL,
  `certificateText` varchar(10) NOT NULL,
  `certificateNum` varchar(10) NOT NULL,
  `addedTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtyinfo_realtyinfo`
--

LOCK TABLES `realtyinfo_realtyinfo` WRITE;
/*!40000 ALTER TABLE `realtyinfo_realtyinfo` DISABLE KEYS */;
INSERT INTO `realtyinfo_realtyinfo` VALUES (1,'海城市中铁一局','海城市铁西区','曹植','2020-09-24','2020-09-24','qw','qw','2020-09-24 08:53:10.863583');
/*!40000 ALTER TABLE `realtyinfo_realtyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `authority` varchar(50) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `displayName` varchar(150) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `username` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (2,'124,125,117,118,119,120,121,122,123','13938293842','澄州云','2020-09-26 15:39:46.577202','','',1,1,1,'2020-10-16 16:20:11.104368','','pbkdf2_sha256$216000$grXzdTpkcAyd$ekN15G5O6V/gD9zdbUtmQX3EpvmvNGAipyCVW8Yqsds=','chengzhouyun'),(3,'117,119,118,120,121,122,123,124,125','123849405','test11','2020-09-27 10:56:45.503130','','',1,0,0,'2020-10-16 11:29:21.384583','','pbkdf2_sha256$216000$KAqHSEk9lDlB$70tM0jXzeNiZ9ajJonL/wk5IcejpvHcjCaaEokdSdYk=','test1'),(4,'119,121,123,125','2324235235','test2','2020-09-27 11:25:56.018278','','',1,0,0,'2020-10-16 15:50:54.660888','','pbkdf2_sha256$216000$smucakSos8KX$pmiaBBC/nZHHcExA26jIQKPmk6CRK59ew1B7BM9mjl4=','test2'),(6,'123,117,118,119,120,121,122,124,125','13456666666','澄州云','2020-10-15 13:58:28.404488','','',1,1,1,'2020-10-16 09:55:50.783854','','pbkdf2_sha256$216000$sKN9jJYkSdMq$FOUjGJdzJBbRH062Mh2LrGE/IjzqoRF5rlK1+S1u3Ns=','CZY');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userprofile_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userprofile_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19  9:23:49
