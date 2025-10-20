-- MySQL dump 10.13  Distrib 8.4.4, for Win64 (x86_64)
--
-- Host: 192.168.200.188    Database: zzyl
-- ------------------------------------------------------
-- Server version	8.0.29

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
create database if not exists zzyl;

use zzyl;
--
-- Table structure for table `alert_data`
--

DROP TABLE IF EXISTS `alert_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_data` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `iot_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物联网设备id',
  `device_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '设备名称',
  `product_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属产品key',
  `product_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品名称',
  `function_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '功能标识符',
  `access_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接入位置',
  `location_type` int DEFAULT NULL COMMENT '位置类型 0：随身设备 1：固定设备',
  `physical_location_type` int DEFAULT NULL COMMENT '物理位置类型 0楼层 1房间 2床位',
  `device_description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '位置备注',
  `data_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据值',
  `alert_rule_id` bigint NOT NULL COMMENT '报警规则id',
  `alert_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报警原因，格式：功能名称+运算符+阈值+持续周期+聚合周期',
  `processing_result` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理结果',
  `processor_id` bigint DEFAULT NULL COMMENT '处理人id',
  `processor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人名称',
  `processing_time` datetime DEFAULT NULL COMMENT '处理时间',
  `type` int NOT NULL COMMENT '报警数据类型，0：老人异常数据，1：设备异常数据',
  `status` int NOT NULL COMMENT '状态，0：待处理，1：已处理',
  `user_id` bigint DEFAULT '0' COMMENT '接收人id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='报警数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_data`
--

LOCK TABLES `alert_data` WRITE;
/*!40000 ALTER TABLE `alert_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule`
--

DROP TABLE IF EXISTS `alert_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属产品的key',
  `product_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `module_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模块的key',
  `module_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模块名称',
  `function_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能名称',
  `function_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能标识',
  `iot_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物联网设备id',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `alert_data_type` int DEFAULT NULL COMMENT '报警数据类型，0：老人异常数据，1：设备异常数据',
  `alert_rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '告警规则名称',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '运算符',
  `value` float DEFAULT NULL COMMENT '阈值',
  `duration` int DEFAULT NULL COMMENT '持续周期',
  `alert_effective_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报警生效时段',
  `alert_silent_period` int DEFAULT NULL COMMENT '报警沉默周期',
  `status` int DEFAULT NULL COMMENT '0 禁用 1启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule`
--

LOCK TABLES `alert_rule` WRITE;
/*!40000 ALTER TABLE `alert_rule` DISABLE KEYS */;
INSERT INTO `alert_rule` VALUES (60,'683195f70ed8b074bf7d6f4a','智能定位报警手表','watch_services',NULL,'HeartRate','HeartRate','683195f70ed8b074bf7d6f4a_hw_watcher_01','hw_watcher_01',0,'老人心率','<',50,3,'00:00:00~23:59:59',10,1,'2025-06-02 20:12:23',NULL,1,NULL,'10');
/*!40000 ALTER TABLE `alert_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bed` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '床位ID',
  `bed_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '床位编号',
  `bed_status` int DEFAULT NULL COMMENT '床位状态: 未入住0, 已入住1 ',
  `sort` int DEFAULT NULL COMMENT '床位号',
  `room_id` bigint DEFAULT NULL COMMENT '房间ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `bed_number` (`bed_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='床位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,'101-1',1,1,1,'2023-09-26 17:39:53','2023-10-05 15:59:24',1671403256519078138,1671403256519078164,NULL),(2,'102-1',0,1,2,'2023-09-26 17:40:01','2023-10-05 16:00:05',1671403256519078138,1671403256519078164,NULL),(3,'102-2',0,2,2,'2023-09-26 17:40:09','2023-10-05 15:59:45',1671403256519078138,1671403256519078164,NULL),(4,'103-1',0,1,3,'2023-09-26 17:40:42','2023-10-05 16:00:21',1671403256519078138,1671403256519078164,NULL),(5,'104-1',1,1,4,'2023-09-26 17:40:49','2023-09-26 17:45:39',1671403256519078138,1671403256519078138,NULL),(6,'104-2',1,2,4,'2023-09-26 17:40:54','2023-10-20 23:22:12',1671403256519078138,1671403256519078164,NULL),(7,'105-1',0,1,5,'2023-09-26 17:41:09','2023-09-26 17:45:52',1671403256519078138,1671403256519078138,NULL),(8,'106-1',0,1,6,'2023-09-26 17:41:16','2023-09-26 17:45:58',1671403256519078138,1671403256519078138,NULL),(9,'106-2',0,2,6,'2023-09-26 17:41:24','2023-09-26 17:46:04',1671403256519078138,1671403256519078138,NULL),(10,'107-1',0,1,7,'2023-09-26 17:41:32','2023-12-21 09:37:49',1671403256519078138,1671403256519078138,NULL),(11,'201-1',0,1,8,'2023-09-26 17:44:53','2023-10-13 10:40:27',1671403256519078138,1671403256519078164,NULL),(12,'202-1',0,1,9,'2023-09-26 17:46:33','2023-09-26 17:46:33',1671403256519078138,NULL,NULL),(13,'202-2',0,2,9,'2023-09-26 17:46:47','2023-09-26 17:46:47',1671403256519078138,NULL,NULL),(14,'203-1',0,1,10,'2023-09-26 18:43:58','2023-09-26 18:43:58',1671403256519078138,NULL,NULL),(15,'204-1',0,1,11,'2023-09-26 18:44:03','2023-09-26 18:44:03',1671403256519078138,NULL,NULL),(16,'204-2',0,2,11,'2023-09-26 18:44:12','2023-09-26 18:44:12',1671403256519078138,NULL,NULL),(18,'205-1',0,1,12,'2023-09-26 18:44:23','2023-12-20 18:40:07',1671403256519078138,1671403256519078138,NULL),(19,'206-1',0,1,13,'2023-09-26 18:44:36','2023-12-20 21:43:10',1671403256519078138,1671403256519078138,NULL),(20,'206-2',0,2,13,'2023-09-26 18:44:42','2023-09-26 18:44:48',1671403256519078138,1671403256519078138,NULL),(21,'207-1',0,1,14,'2023-09-26 18:45:01','2023-09-26 18:45:01',1671403256519078138,NULL,NULL),(22,'301-2',0,1,15,'2023-09-26 18:45:26','2023-12-26 19:35:06',1671403256519078138,1671403256519078138,NULL),(23,'302-1',0,1,16,'2023-09-26 18:45:31','2023-09-26 18:45:31',1671403256519078138,NULL,NULL),(24,'302-3',0,2,16,'2023-09-26 18:45:39','2023-12-26 19:35:15',1671403256519078138,1671403256519078138,NULL),(25,'303-1',0,1,17,'2023-09-26 18:45:44','2023-09-26 18:45:44',1671403256519078138,NULL,NULL),(27,'304-1',0,1,18,'2023-09-26 18:45:55','2023-09-26 18:45:55',1671403256519078138,NULL,NULL),(28,'304-2',0,2,18,'2023-09-26 18:46:04','2023-09-26 18:46:04',1671403256519078138,NULL,NULL),(29,'305-1',0,1,19,'2023-09-26 18:46:11','2023-12-21 10:04:47',1671403256519078138,1671403256519078138,NULL),(30,'306-1',0,1,20,'2023-09-26 18:46:16','2023-09-26 18:46:16',1671403256519078138,NULL,NULL),(31,'306-2',0,2,20,'2023-09-26 18:46:22','2023-09-26 19:08:50',1671403256519078138,1671403256519078138,NULL),(32,'307-1',0,1,21,'2023-09-26 18:46:29','2023-09-26 18:46:29',1671403256519078138,NULL,NULL),(33,'401-1',0,1,22,'2023-09-26 18:52:14','2023-09-26 18:52:14',1671403256519078138,NULL,NULL),(34,'402-1',0,1,23,'2023-09-26 18:52:22','2023-09-26 18:52:22',1671403256519078138,NULL,NULL),(35,'402-2',0,2,23,'2023-09-26 18:52:35','2023-09-26 18:52:38',1671403256519078138,1671403256519078138,NULL),(36,'403-1',0,1,24,'2023-09-26 18:52:47','2023-09-26 18:52:47',1671403256519078138,NULL,NULL),(37,'404-1',0,1,25,'2023-09-26 18:52:54','2023-09-26 18:52:54',1671403256519078138,NULL,NULL),(38,'404-2',0,2,25,'2023-09-26 18:53:02','2023-09-26 18:53:10',1671403256519078138,1671403256519078138,NULL),(39,'405-1',0,1,26,'2023-09-26 18:53:18','2023-09-26 18:53:18',1671403256519078138,NULL,NULL),(40,'406-1',0,1,27,'2023-09-26 18:53:27','2023-09-26 18:53:27',1671403256519078138,NULL,NULL),(41,'406-2',0,2,27,'2023-09-26 18:53:36','2023-09-26 18:53:36',1671403256519078138,NULL,NULL),(42,'407-1',0,1,28,'2023-09-26 18:53:44','2023-09-26 18:53:44',1671403256519078138,NULL,NULL),(43,'501-1',0,1,29,'2023-09-26 18:55:47','2023-09-26 18:55:47',1671403256519078138,NULL,NULL),(44,'502-1',0,1,31,'2023-09-26 18:55:52','2023-09-26 18:55:52',1671403256519078138,NULL,NULL),(45,'502-2',0,2,31,'2023-09-26 18:56:02','2023-09-26 18:56:02',1671403256519078138,NULL,NULL),(46,'503-1',0,1,32,'2023-09-26 18:56:10','2023-09-26 18:56:10',1671403256519078138,NULL,NULL),(48,'504-1',0,1,33,'2023-09-26 18:56:26','2023-09-26 18:56:26',1671403256519078138,NULL,NULL),(49,'504-2',0,2,33,'2023-09-26 18:56:32','2023-09-26 18:56:32',1671403256519078138,NULL,NULL),(50,'505-1',0,1,34,'2023-09-26 18:56:37','2023-09-26 18:56:37',1671403256519078138,NULL,NULL),(52,'506-1',0,1,35,'2023-09-26 18:56:49','2023-09-26 18:56:49',1671403256519078138,NULL,NULL),(53,'506-2',0,2,35,'2023-09-26 18:56:54','2023-09-26 18:56:54',1671403256519078138,NULL,NULL),(54,'507-1',0,1,36,'2023-09-26 18:57:00','2023-09-26 18:57:00',1671403256519078138,NULL,NULL),(55,'601-1',0,1,37,'2023-09-26 19:05:11','2023-09-28 22:53:28',1671403256519078138,1671403256519078164,NULL),(56,'602-1',0,1,38,'2023-09-26 19:05:16','2023-09-26 19:05:16',1671403256519078138,NULL,NULL),(57,'602-2',0,2,38,'2023-09-26 19:05:24','2023-09-26 19:05:24',1671403256519078138,NULL,NULL),(58,'603-1',1,1,39,'2023-09-26 19:05:29','2023-09-26 19:05:29',1671403256519078138,NULL,NULL),(59,'604-1',0,1,40,'2023-09-26 19:05:33','2023-09-26 19:05:33',1671403256519078138,NULL,NULL),(60,'604-2',0,2,40,'2023-09-26 19:05:38','2023-09-26 19:05:38',1671403256519078138,NULL,NULL),(61,'605-1',0,1,41,'2023-09-26 19:05:43','2023-09-26 19:05:43',1671403256519078138,NULL,NULL),(62,'606-1',0,1,42,'2023-09-26 19:05:48','2023-09-26 19:05:48',1671403256519078138,NULL,NULL),(63,'606-2',0,2,42,'2023-09-26 19:05:54','2023-09-26 19:05:54',1671403256519078138,NULL,NULL),(64,'607-1',0,1,43,'2023-09-26 19:05:59','2023-09-26 19:05:59',1671403256519078138,NULL,NULL),(65,'701-1',0,1,44,'2023-09-26 19:06:10','2023-09-26 19:06:10',1671403256519078138,NULL,NULL),(66,'702-1',0,1,45,'2023-09-26 19:06:14','2023-09-26 19:06:26',1671403256519078138,1671403256519078138,NULL),(68,'702-2',0,2,45,'2023-09-26 19:06:35','2023-09-26 19:06:35',1671403256519078138,NULL,NULL),(69,'703-1',0,1,46,'2023-09-26 19:06:41','2023-09-26 19:06:41',1671403256519078138,NULL,NULL),(70,'704-1',0,1,47,'2023-09-26 19:06:46','2023-12-20 14:28:22',1671403256519078138,1671403256519078138,NULL),(71,'704-2',0,2,47,'2023-09-26 19:06:52','2023-09-26 19:06:57',1671403256519078138,1671403256519078138,NULL),(72,'705-1',0,1,48,'2023-09-26 19:07:04','2023-09-26 19:07:04',1671403256519078138,NULL,NULL),(73,'706-1',0,1,49,'2023-09-26 19:07:10','2023-09-26 19:07:10',1671403256519078138,NULL,NULL),(74,'706-2',0,2,49,'2023-09-26 19:07:14','2023-09-26 19:07:19',1671403256519078138,1671403256519078138,NULL),(75,'707-1',0,1,50,'2023-09-26 19:07:25','2023-09-26 19:07:25',1671403256519078138,NULL,NULL),(76,'801-1',0,1,51,'2023-09-26 19:07:41','2023-09-26 19:07:41',1671403256519078138,NULL,NULL),(77,'803-1',0,1,53,'2023-09-26 19:07:46','2023-09-26 19:07:46',1671403256519078138,NULL,NULL),(78,'805-1',0,1,55,'2023-09-26 19:07:51','2023-09-26 19:07:51',1671403256519078138,NULL,NULL),(79,'807-1',0,1,57,'2023-09-26 19:07:56','2023-09-26 19:07:56',1671403256519078138,1,NULL),(80,'802-1',0,1,52,'2023-09-26 19:08:04','2023-09-26 19:08:04',1671403256519078138,NULL,NULL),(81,'801-2',0,2,52,'2023-09-26 19:08:09','2023-09-26 19:08:09',1671403256519078138,NULL,NULL),(82,'804-1',0,1,54,'2023-09-26 19:08:15','2023-09-26 19:08:15',1671403256519078138,NULL,NULL),(83,'804-2',0,2,54,'2023-09-26 19:08:22','2023-09-26 19:08:22',1671403256519078138,NULL,NULL),(84,'806-1',0,1,56,'2023-09-26 19:08:28','2023-09-26 19:08:28',1671403256519078138,NULL,NULL),(85,'806-2',0,2,56,'2023-09-26 19:08:35','2023-09-26 19:08:35',1671403256519078138,1,NULL),(170,'101-2',1,2,1,'2023-12-21 11:45:09','2023-12-21 11:45:09',1671403256519078138,1,NULL),(171,'103-2',1,1,3,'2023-12-23 16:12:34','2023-12-23 16:22:03',1671403256519078138,1671403256519078138,NULL),(173,'1111',0,1,67,'2023-12-23 17:59:23','2023-12-23 17:59:23',1671403256519078138,NULL,NULL),(177,'1011',0,1,74,'2023-12-26 19:32:07','2023-12-26 19:32:07',1671403256519078138,NULL,NULL),(178,'101',0,1,74,'2023-12-26 19:32:15','2023-12-26 19:32:15',1671403256519078138,NULL,NULL),(188,NULL,0,NULL,2,'2024-05-24 18:56:30',NULL,1,NULL,NULL),(196,'109-01',0,1,81,'2024-07-31 11:29:18',NULL,1,NULL,NULL),(200,'1201-1',NULL,1,83,'2024-10-04 00:03:31',NULL,1,NULL,NULL),(201,'智能床位',NULL,1,89,'2025-05-23 11:02:57',NULL,1,NULL,NULL),(202,'1301-2',NULL,1,89,'2025-05-23 11:03:16',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `elder_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老人姓名',
  `elder_id` bigint NOT NULL COMMENT '老人ID',
  `id_card_no` char(18) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份证号',
  `start_date` date NOT NULL COMMENT '入住开始时间',
  `end_date` date DEFAULT NULL COMMENT '入住结束时间',
  `nursing_level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '护理等级名称',
  `bed_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入住床位',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 (0: 已入住, 1: 已退住)',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='入住表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in`
--

LOCK TABLES `check_in` WRITE;
/*!40000 ALTER TABLE `check_in` DISABLE KEYS */;
INSERT INTO `check_in` VALUES (1,'张三',325,'132123196712131234','2024-08-27','2024-09-30','测试护理等级','104-1',0,0,'2024-08-27 16:43:20','2024-08-27 08:43:19',1,NULL,'[{\"kinship\":\"1\",\"name\":\"13211223322\",\"phone\":\"13211223322\"}]'),(2,'李天龙',326,'132123196712131239','2024-08-27','2024-09-30','1号护理计划','104-2',0,0,'2024-08-27 16:50:09','2024-08-27 08:50:08',1,NULL,'[{\"kinship\":\"0\",\"name\":\"李天\",\"phone\":\"13222334439\"}]'),(3,'老李',327,'132123195612132345','2024-09-12','2024-10-31','2号护理等级','101-2',0,0,'2024-09-12 18:51:36','2024-09-12 18:51:36',1,NULL,'[{\"kinship\":\"1\",\"name\":\"小李\",\"phone\":\"13212349900\"}]'),(4,'老李头儿',328,'410725196904056698','2024-09-12','2024-10-31','2号护理等级','101-1',0,0,'2024-09-12 19:10:23','2024-09-12 19:10:23',1,NULL,'[{\"kinship\":\"0\",\"name\":\"老王\",\"phone\":\"15100000002\"}]');
/*!40000 ALTER TABLE `check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in_config`
--

DROP TABLE IF EXISTS `check_in_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `check_in_id` bigint NOT NULL COMMENT '入住表ID',
  `nursing_level_id` bigint NOT NULL COMMENT '护理等级ID',
  `nursing_level_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '护理等级名称',
  `fee_start_date` date NOT NULL COMMENT '费用开始时间',
  `fee_end_date` date DEFAULT NULL COMMENT '费用结束时间',
  `deposit` decimal(10,2) NOT NULL COMMENT '押金（元）',
  `nursing_fee` decimal(10,2) NOT NULL COMMENT '护理费用（元/月）',
  `bed_fee` decimal(10,2) NOT NULL COMMENT '床位费用（元/月）',
  `insurance_payment` decimal(10,2) NOT NULL COMMENT '医保支付（元/月）',
  `government_subsidy` decimal(10,2) NOT NULL COMMENT '政府补贴（元/月）',
  `other_fees` decimal(10,2) NOT NULL COMMENT '其他费用（元/月）',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='入住配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in_config`
--

LOCK TABLES `check_in_config` WRITE;
/*!40000 ALTER TABLE `check_in_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_in_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `check_in_id` bigint NOT NULL COMMENT '入住ID',
  `elder_id` bigint NOT NULL COMMENT '老人ID',
  `contract_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合同名称',
  `contract_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '合同编号',
  `agreement_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '协议地址（文件路径或URL）',
  `third_party_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '丙方手机号',
  `third_party_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '丙方姓名',
  `elder_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老人姓名',
  `start_date` date NOT NULL COMMENT '开始时间',
  `end_date` date NOT NULL COMMENT '结束时间',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 (0: 未生效, 1: 已生效, 2: 已过期, 3: 已失效)',
  `sign_date` date NOT NULL COMMENT '签约日期',
  `termination_submitter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '解除提交人',
  `termination_date` date DEFAULT NULL COMMENT '解除日期',
  `termination_agreement_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '解除协议地址（文件路径或URL）',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `iot_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物联网设备ID',
  `secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备秘钥',
  `binding_location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绑定位置',
  `location_type` int DEFAULT NULL COMMENT '位置类型 0：随身设备 1：固定设备',
  `physical_location_type` int DEFAULT NULL COMMENT '物理位置类型 0楼层 1房间 2床位',
  `device_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `product_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品key',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `device_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '位置备注',
  `have_entrance_guard` int NOT NULL DEFAULT '0' COMMENT '产品是否包含门禁，0：否，1：是',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `node_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '节点id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `binding_location_location_type_physical_location_type_product_id` (`binding_location`,`location_type`,`physical_location_type`,`product_key`) USING BTREE,
  KEY `device_id` (`iot_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (30,'683195f70ed8b074bf7d6f4a_hw_watcher_01','9f081dfef9b644e393d6f970966ff473','326',0,NULL,'hw_watcher_01','683195f70ed8b074bf7d6f4a','智能定位报警手表',NULL,0,'2025-05-30 15:35:02',NULL,1,'hw_watcher_01',NULL,'李天龙'),(31,'6831b4fa0e587e229317f62c_sleepbelt_103_2','0e70bda02a7a44428db6c4170709b9fe','171',1,2,'睡眠监测带103_2','6831b4fa0e587e229317f62c','睡眠监测带','1,3,171',0,'2025-06-02 19:46:32',NULL,1,'sleepbelt_103_2',NULL,'1楼,103,103-2'),(32,'6831b3cd0e587e229317f5ee_smoker_103_2','e3fc582e168d4cedb19f6861ff126ccb','171',1,2,'烟雾报警器_103_2','6831b3cd0e587e229317f5ee','烟雾报警器','1,3,171',0,'2025-06-02 19:47:38',NULL,1,'smoker_103_2',NULL,'1楼,103,103-2'),(33,'6831b3cd0e587e229317f5ee_somker_603_1','be4c936a90fd467487d296889861c210','39',1,1,'somker_603_1','6831b3cd0e587e229317f5ee','烟雾报警器','6,39',0,'2025-06-03 08:49:41',NULL,1,'somker_603_1',NULL,'6楼,603'),(34,'683195f70ed8b074bf7d6f4a_watcher_yxr','e8a26efc40ab4a30ad89c512957c886f','330',0,NULL,'watcher_yxr','683195f70ed8b074bf7d6f4a','智能定位报警手表',NULL,0,'2025-06-03 08:50:56',NULL,1,'watcher_yxr',NULL,'严欣冉'),(35,'6831b4fa0e587e229317f62c_sleepbelt60301','9a50480834ca496ab298703969e24ea5','58',1,2,'sleepbelt60301','6831b4fa0e587e229317f62c','睡眠监测带','6,39,58',0,'2025-06-03 08:53:33',NULL,1,'sleepbelt60301',NULL,'6楼,603,603-1');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_data`
--

DROP TABLE IF EXISTS `device_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_data` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '告警规则ID，自增主键',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备名称',
  `iot_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备ID',
  `product_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属产品的key',
  `product_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `function_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '功能名称',
  `access_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接入位置',
  `location_type` int DEFAULT NULL COMMENT '位置类型 0：随身设备 1：固定设备',
  `physical_location_type` int DEFAULT NULL COMMENT '物理位置类型 0楼层 1房间 2床位',
  `device_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '位置备注',
  `data_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据值',
  `alarm_time` datetime DEFAULT NULL COMMENT '数据上报时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_iot_id_product_key` (`iot_id`,`product_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_data`
--

LOCK TABLES `device_data` WRITE;
/*!40000 ALTER TABLE `device_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder`
--

DROP TABLE IF EXISTS `elder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elder` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `id_card_no` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `sex` tinyint DEFAULT NULL COMMENT '性别（0:女 1:男）',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1:启用 2:请假 3:退住中 4入住中 5已退住）',
  `phone` varchar(50) NOT NULL COMMENT '手机号',
  `birthday` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `id_card_national_emblem_img` varchar(255) DEFAULT NULL COMMENT '身份证国徽面',
  `id_card_portrait_img` varchar(255) DEFAULT NULL COMMENT '身份证人像面',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `bed_number` varchar(20) DEFAULT NULL COMMENT '床位编号',
  `bed_id` bigint DEFAULT NULL COMMENT '床位id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_id_card_no` (`name`,`id_card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='老人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder`
--

LOCK TABLES `elder` WRITE;
/*!40000 ALTER TABLE `elder` DISABLE KEYS */;
/*!40000 ALTER TABLE `elder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_member`
--

DROP TABLE IF EXISTS `family_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_member` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'OpenID',
  `gender` int DEFAULT NULL COMMENT '性别(0:男，1:女)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='老人家属';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_member`
--

LOCK TABLES `family_member` WRITE;
/*!40000 ALTER TABLE `family_member` DISABLE KEYS */;
INSERT INTO `family_member` VALUES (3,'13652431027','大柚所为1027',NULL,'oG53W6P34snItdzfsPPQCEDKWpJM',NULL,'2025-05-29 16:23:29',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `family_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floor` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `code` bigint DEFAULT NULL COMMENT '编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='楼层表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
INSERT INTO `floor` VALUES (1,'1楼',11,'2023-09-26 16:10:27','2024-05-24 17:57:28',1671403256519078153,1,NULL),(2,'2楼',2,'2023-09-26 17:37:20','2023-09-26 17:37:20',1671403256519078138,NULL,NULL),(3,'3楼',3,'2023-09-26 17:37:26','2023-09-26 17:37:26',1671403256519078138,NULL,NULL),(4,'4楼',4,'2023-09-26 17:37:32','2023-09-26 17:37:32',1671403256519078138,NULL,NULL),(5,'5楼',5,'2023-09-26 17:37:38','2023-09-26 17:37:38',1671403256519078138,NULL,NULL),(6,'6楼',6,'2023-09-26 17:37:42','2023-09-26 17:37:59',1671403256519078138,1671403256519078138,NULL),(7,'7楼',7,'2023-09-26 17:37:47','2023-09-26 17:37:52',1671403256519078138,1671403256519078138,NULL),(8,'8楼',8,'2023-09-26 17:38:09','2023-09-26 17:38:09',1671403256519078138,NULL,NULL),(391,'9楼',8,'2023-12-18 14:53:50','2023-12-18 14:53:50',1671403256519078138,NULL,NULL),(401,'10楼',9,'2023-12-26 19:29:54','2023-12-27 10:15:34',1671403256519078138,1671403256519078138,NULL),(406,'12楼',1,'2024-05-27 14:07:32','2024-05-27 14:14:46',1,1,NULL),(414,'13楼',1,'2025-05-23 11:02:16',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_assessment`
--

DROP TABLE IF EXISTS `health_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_assessment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `elder_name` varchar(255) DEFAULT NULL COMMENT '老人姓名',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `birth_date` datetime DEFAULT NULL COMMENT '出生日期',
  `age` int DEFAULT NULL COMMENT '年龄',
  `gender` int DEFAULT NULL COMMENT '性别(0:男，1:女)',
  `health_score` varchar(255) DEFAULT NULL COMMENT '健康评分',
  `risk_level` varchar(255) DEFAULT NULL COMMENT '危险等级(健康, 提示, 风险, 危险, 严重危险)',
  `suggestion_for_admission` int DEFAULT NULL COMMENT '是否建议入住(0:建议，1:不建议)',
  `nursing_level_name` varchar(255) DEFAULT NULL COMMENT '推荐护理等级',
  `admission_status` int DEFAULT NULL COMMENT '入住情况(0:已入住，1:未入住)',
  `total_check_date` varchar(64) DEFAULT NULL COMMENT '总检日期',
  `physical_exam_institution` varchar(255) DEFAULT NULL COMMENT '体检机构',
  `physical_report_url` varchar(255) DEFAULT NULL COMMENT '体检报告URL链接',
  `assessment_time` datetime DEFAULT NULL COMMENT '评估时间',
  `report_summary` text COMMENT '报告总结',
  `disease_risk` text COMMENT '疾病风险',
  `abnormal_analysis` text COMMENT '异常分析',
  `system_score` varchar(255) DEFAULT NULL COMMENT '健康系统分值',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='健康评估表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_assessment`
--

LOCK TABLES `health_assessment` WRITE;
/*!40000 ALTER TABLE `health_assessment` DISABLE KEYS */;
INSERT INTO `health_assessment` VALUES (9,'刘爱国','210102196001267626','1960-01-26 00:00:00',64,0,'80.5','caution',0,'一级护理等级',1,'2023-10-10','中州体检','https://java110-ai.oss-cn-beijing.aliyuncs.com/2024/10/af59dc76-0c01-4043-9706-b9ed1ec08984.pdf','2024-10-10 01:07:42','体检报告中心率、肝脏、胆囊、脾脏、肾脏、前列腺共6项指标提示异常，综合这些临床指标和数据分析：循环系统、消化系统存在隐患，其中循环系统有“中危”风险；消化系统部位有“低危”风险。','{\"healthy\":60,\"caution\":30,\"risk\":10,\"danger\":0,\"severeDanger\":0}','[{\"conclusion\":\"心率略快\",\"examinationItem\":\"心率\",\"result\":\"92 次/分\",\"referenceValue\":\"< 140\",\"unit\":\"次/分\",\"interpret\":\"心率稍高于理想范围，可能与情绪、活动或轻度心脏负担有关。\",\"advice\":\"建议心电图检查及定期监测心率，保持情绪稳定，适量运动。\"},{\"conclusion\":\"轻度脂肪肝可能\",\"examinationItem\":\"肝\",\"result\":\"形态大小正常，实质回声略粗糙\",\"referenceValue\":\"-\",\"unit\":\"-\",\"interpret\":\"肝脏实质回声略粗糙，提示可能有轻度脂肪肝，与饮食习惯、生活方式或遗传因素有关。\",\"advice\":\"建议调整饮食结构，减少高脂食物摄入，增加运动，定期检查肝脏情况。\"},{\"conclusion\":\"慢性胆囊炎可能\",\"examinationItem\":\"胆\",\"result\":\"胆囊壁毛糙\",\"referenceValue\":\"-\",\"unit\":\"-\",\"interpret\":\"胆囊壁毛糙，可能表示有慢性胆囊炎，可能与胆囊结石、感染或长期饮食不规律有关。\",\"advice\":\"建议进一步检查胆囊情况，保持规律饮食，避免高脂食物。\"},{\"conclusion\":\"脾轻度增大\",\"examinationItem\":\"脾\",\"result\":\"轻度增大\",\"referenceValue\":\"-\",\"unit\":\"-\",\"interpret\":\"脾脏轻度增大，可能与感染、血液系统疾病或自身免疫性疾病有关。\",\"advice\":\"建议进一步检查脾脏，以确定增大的原因，并采取相应的治疗措施。\"},{\"conclusion\":\"右肾小囊肿可能\",\"examinationItem\":\"肾\",\"result\":\"右肾下极见一大小约 5mm 的无回声区\",\"referenceValue\":\"-\",\"unit\":\"mm\",\"interpret\":\"右肾小囊肿，一般为良性病变，可能与肾小管憩室增多有关。\",\"advice\":\"建议定期监测囊肿大小，若无症状且囊肿不增大，可暂不处理。\"},{\"conclusion\":\"前列腺形态略增大\",\"examinationItem\":\"前列腺\",\"result\":\"形态略增大\",\"referenceValue\":\"-\",\"unit\":\"-\",\"interpret\":\"前列腺形态略增大，可能与前列腺增生有关，是老年男性常见病变。\",\"advice\":\"建议进行PSA检查以排除前列腺肿瘤，并定期检查前列腺情况。\"}]','{\"breathingSystem\":100,\"digestiveSystem\":85,\"endocrineSystem\":90,\"immuneSystem\":95,\"circulatorySystem\":80,\"urinarySystem\":90,\"motionSystem\":100,\"senseSystem\":90}','1','2024-10-10 01:07:42',NULL,NULL,NULL),(10,'卫信昆','210102196205125718','1962-05-12 00:00:00',63,1,'80.0','caution',0,'一级护理等级',1,'2023-10-10','爱康国宾','https://sz152.oss-cn-shenzhen.aliyuncs.com/2025/05/b10d24c1-faa0-44c0-a504-52f7d9f955b2.pdf','2025-05-26 16:04:48','体检报告中心率、视力、肝脏、胆囊、脾脏、肾脏和前列腺共7项指标提示异常，其他指标基本正常。综合这些临床指标和数据分析：循环系统、消化系统和泌尿系统存在隐患，其中循环系统需重点关注。','{\"healthy\":60,\"caution\":30,\"risk\":10,\"danger\":0,\"severeDanger\":0}','[{\"conclusion\":\"心率偏快\",\"examinationItem\":\"心率\",\"result\":\"92 次/分\",\"referenceValue\":\"< 90\",\"unit\":\"次/分\",\"interpret\":\"心率稍高于正常范围，可能与活动、情绪或轻度心脏负荷有关。\",\"advice\":\"建议进行心电图检查及心脏科随访，注意保持情绪稳定，适量运动。\"},{\"conclusion\":\"视力下降\",\"examinationItem\":\"视力\",\"result\":\"左眼 0.3，右眼 0.4\",\"referenceValue\":\"1.0 及以上\",\"unit\":\"-\",\"interpret\":\"视力明显低于正常范围，符合老视特征。\",\"advice\":\"建议定期复查视力，并考虑配戴老花镜以改善视力。\"},{\"conclusion\":\"轻度脂肪肝可能\",\"examinationItem\":\"肝实质回声\",\"result\":\"略粗糙\",\"referenceValue\":\"均匀\",\"unit\":\"-\",\"interpret\":\"肝脏实质回声略粗糙，可能提示轻度脂肪肝。\",\"advice\":\"建议进一步检查肝脏，注意调整饮食结构，减少高脂食物摄入，适量运动。\"},{\"conclusion\":\"慢性胆囊炎可能\",\"examinationItem\":\"胆囊壁\",\"result\":\"毛糙\",\"referenceValue\":\"光滑\",\"unit\":\"-\",\"interpret\":\"胆囊壁毛糙，可能提示慢性胆囊炎。\",\"advice\":\"建议对胆囊进行进一步检查，注意饮食卫生，避免油腻食物。\"},{\"conclusion\":\"脾轻度增大\",\"examinationItem\":\"脾\",\"result\":\"轻度增大\",\"referenceValue\":\"正常大小\",\"unit\":\"-\",\"interpret\":\"脾脏轻度增大，可能与多种原因有关，需进一步检查以确定原因。\",\"advice\":\"建议进一步检查脾脏，注意保持健康生活方式，避免过度劳累。\"},{\"conclusion\":\"右肾小囊肿可能\",\"examinationItem\":\"右肾\",\"result\":\"见一大小约 5mm 的无回声区\",\"referenceValue\":\"无异常回声\",\"unit\":\"mm\",\"interpret\":\"右肾下极见一小无回声区，可能提示小囊肿。\",\"advice\":\"建议定期复查肾脏，观察囊肿变化，如有需要，及时就医。\"},{\"conclusion\":\"前列腺形态略增大\",\"examinationItem\":\"前列腺\",\"result\":\"形态略增大\",\"referenceValue\":\"正常大小\",\"unit\":\"-\",\"interpret\":\"前列腺形态略增大，可能与年龄、炎症或其他因素有关。\",\"advice\":\"建议进行PSA检查以排除前列腺疾病，注意保持泌尿生殖健康。\"}]','{\"breathingSystem\":95,\"digestiveSystem\":85,\"endocrineSystem\":90,\"immuneSystem\":90,\"circulatorySystem\":80,\"urinarySystem\":85,\"motionSystem\":90,\"senseSystem\":80}','1','2025-05-26 16:04:52',NULL,NULL,NULL);
/*!40000 ALTER TABLE `health_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursing_elder`
--

DROP TABLE IF EXISTS `nursing_elder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_elder` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nursing_id` bigint DEFAULT NULL COMMENT '护理员id',
  `elder_id` bigint DEFAULT NULL COMMENT '老人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nursing_id` (`nursing_id`,`elder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='护理员老人关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_elder`
--

LOCK TABLES `nursing_elder` WRITE;
/*!40000 ALTER TABLE `nursing_elder` DISABLE KEYS */;
INSERT INTO `nursing_elder` VALUES (3,101,330,'2025-06-05 08:46:05',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `nursing_elder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursing_level`
--

DROP TABLE IF EXISTS `nursing_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_level` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '等级名称',
  `lplan_id` int NOT NULL COMMENT '护理计划ID',
  `fee` decimal(10,2) NOT NULL COMMENT '护理费用',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '等级说明',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='护理等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_level`
--

LOCK TABLES `nursing_level` WRITE;
/*!40000 ALTER TABLE `nursing_level` DISABLE KEYS */;
INSERT INTO `nursing_level` VALUES (76,'2号护理等级',134,1500.00,1,'1223','2024-08-14 16:33:16',NULL,NULL,NULL,'2024-08-29 16:57:23'),(77,'1号护理计划',133,2000.00,1,'1223','2024-08-20 11:18:21',NULL,NULL,NULL,'2024-08-29 16:57:05'),(78,'3号护理等级',135,3000.00,1,'无','2024-08-29 16:58:00',NULL,NULL,NULL,'2024-08-29 08:56:55'),(79,'4号护理等级',1,60000.00,1,'asdfasdf','2025-05-24 17:00:04',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nursing_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursing_plan`
--

DROP TABLE IF EXISTS `nursing_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_plan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sort_no` int DEFAULT NULL COMMENT '排序号',
  `plan_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态 0禁用 1启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `plan_name` (`plan_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='护理计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_plan`
--

LOCK TABLES `nursing_plan` WRITE;
/*!40000 ALTER TABLE `nursing_plan` DISABLE KEYS */;
INSERT INTO `nursing_plan` VALUES (133,1,'1号护理计划',1,'2024-08-19 19:17:31',NULL,NULL,NULL,NULL),(134,1,'2号护理计划',1,'2024-08-19 19:36:10',NULL,NULL,NULL,NULL),(135,1,'3号护理计划',1,'2024-08-29 16:56:39',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nursing_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursing_project`
--

DROP TABLE IF EXISTS `nursing_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_project` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `order_no` int DEFAULT NULL COMMENT '排序号',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '单位',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
  `nursing_requirement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '护理要求',
  `status` int NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：启用）',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='护理项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_project`
--

LOCK TABLES `nursing_project` WRITE;
/*!40000 ALTER TABLE `nursing_project` DISABLE KEYS */;
INSERT INTO `nursing_project` VALUES (1,'修剪指甲',1,'次',10.00,'https://itheim.oss-cn-beijing.aliyuncs.com/b6631465-1684-41fe-8ccd-0b027cb91e90.png','无',1,'1',NULL,NULL,'2024-08-29 16:51:50','2024-08-29 08:50:45'),(2,'衣物清洁',1,'件',5.00,'https://itheim.oss-cn-beijing.aliyuncs.com/41fc58d3-0627-4fa9-8459-906599aa1efa.png','无',1,'1',NULL,NULL,'2024-08-29 16:52:27','2024-08-29 08:51:21'),(3,'整理床铺',1,'次',15.00,'https://itheim.oss-cn-beijing.aliyuncs.com/e611fcc9-dc45-49ac-abeb-f2ea99c2cffc.png','无',1,'1',NULL,NULL,'2024-08-29 16:52:52','2024-08-29 08:51:46'),(4,'助餐',1,'餐',15.00,'https://itheim.oss-cn-beijing.aliyuncs.com/d91ba642-88e5-4c3d-8e50-a681ae3300e5.png','无',1,'1',NULL,NULL,'2024-08-29 16:53:29','2024-08-29 08:52:24'),(5,'助浴',1,'次',40.00,'https://itheim.oss-cn-beijing.aliyuncs.com/125df948-7646-4fce-b322-1db0a84856e7.png','无',1,'1',NULL,NULL,'2024-08-29 16:53:51','2024-08-29 08:52:46'),(6,'洗头',1,'次',20.00,'https://itheim.oss-cn-beijing.aliyuncs.com/a38883fc-870b-40ff-a256-54ce2fc17af9.png','无',1,'1',NULL,NULL,'2024-08-29 16:54:22','2024-08-29 08:53:17'),(7,'洗脸',1,'次',15.00,'https://itheim.oss-cn-beijing.aliyuncs.com/95b0ad37-5d61-4ec2-a961-d6fb691a18f0.png','无',1,'1',NULL,NULL,'2024-08-29 16:54:45','2024-08-29 08:53:40'),(8,'洗脚',1,'次',20.00,'https://itheim.oss-cn-beijing.aliyuncs.com/8437eb2d-3ea5-4eee-9d78-017bc8b3a66e.png','无',1,'1',NULL,NULL,'2024-08-29 16:55:08','2024-08-29 08:54:03'),(9,'心理咨询',1,'小时',80.00,'https://itheim.oss-cn-beijing.aliyuncs.com/dc004cc2-688c-4d22-8fbc-8e923219a2bd.png','无',1,'1',NULL,NULL,'2024-08-29 16:55:37','2024-08-29 08:54:32'),(10,'护理项目测试999',1,'次',10.00,'https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/ae7cf766-fb7b-49ff-a73c-c86c25f280e1.png','无特殊要求',1,'1',NULL,NULL,'2025-05-29 11:12:27',NULL),(11,'aaaaa',1,'2',2.00,'https://sz154-web.oss-cn-shenzhen.aliyuncs.com/2025/10/95746288-7488-47f4-9e0f-1f5bcc928f0c.png','sdf',1,'1',NULL,NULL,'2025-10-16 21:16:07',NULL);
/*!40000 ALTER TABLE `nursing_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nursing_project_plan`
--

DROP TABLE IF EXISTS `nursing_project_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nursing_project_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL COMMENT '计划id',
  `project_id` int NOT NULL COMMENT '项目id',
  `execute_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '计划执行时间',
  `execute_cycle` int NOT NULL COMMENT '执行周期 0 天 1 周 2月',
  `execute_frequency` int NOT NULL COMMENT '执行频次',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1743 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='护理计划和项目关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nursing_project_plan`
--

LOCK TABLES `nursing_project_plan` WRITE;
/*!40000 ALTER TABLE `nursing_project_plan` DISABLE KEYS */;
INSERT INTO `nursing_project_plan` VALUES (1736,133,87,'19:16:49',1,7,'2024-08-19 11:28:43',NULL,NULL,NULL,NULL),(1737,133,85,'19:28:34',1,1,'2024-08-19 11:28:43',NULL,NULL,NULL,NULL),(1739,135,1,'16:55:58',2,1,'2024-08-29 08:55:34',NULL,NULL,NULL,NULL),(1740,135,5,'16:56:09',0,1,'2024-08-29 08:55:34',NULL,NULL,NULL,NULL),(1741,135,4,'08:00:00',0,1,'2024-08-29 08:55:34',NULL,NULL,NULL,NULL),(1742,134,1,'19:28:45',0,1,'2024-10-03 14:50:59',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nursing_project_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约人姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '预约人手机号',
  `time` datetime NOT NULL COMMENT '预约时间',
  `visitor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '探访人',
  `type` int NOT NULL COMMENT '预约类型，0：参观预约，1：探访预约',
  `status` int NOT NULL COMMENT '预约状态，0：待报道，1：已完成，2：取消，3：过期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name_mobile_time_visitor` (`mobile`,`time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='预约信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (93,'大叶','13312345678','2025-05-30 18:00:00','老叶',0,2,'2025-05-30 08:02:32','2025-05-30 08:12:24',3,1,NULL),(96,'小叶','13312345678','2025-05-30 17:30:00','老叶',0,0,'2025-05-30 08:15:34',NULL,3,3,NULL),(97,'小叶','13312345678','2025-05-30 15:30:00','老叶',0,0,'2025-05-30 08:42:50',NULL,3,3,NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '房间编号',
  `sort` int DEFAULT NULL COMMENT '排序号',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '房间类型名称',
  `floor_id` bigint DEFAULT NULL COMMENT '楼层id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='房间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'101',1,'豪华单人间',1,'2023-09-26 17:38:25','2023-12-23 16:19:55',0,1671403256519078138,1671403256519078138,NULL),(2,'102',2,'普通双人间',1,'2023-09-26 17:38:32','2023-09-26 17:38:32',0,1671403256519078138,NULL,NULL),(3,'103',3,'普通单人间',1,'2023-09-26 17:38:41','2023-09-26 17:38:41',0,1671403256519078138,NULL,NULL),(4,'104',4,'豪华双人间',1,'2023-09-26 17:38:48','2023-09-26 17:38:48',0,1671403256519078138,NULL,NULL),(5,'105',5,'豪华单人间',1,'2023-09-26 17:38:55','2023-09-26 17:38:55',0,1671403256519078138,NULL,NULL),(6,'106',6,'双人套房',1,'2023-09-26 17:39:05','2023-09-26 17:39:05',0,1671403256519078138,NULL,NULL),(7,'107',7,'单人套房',1,'2023-09-26 17:39:13','2023-09-26 17:39:13',0,1671403256519078138,NULL,NULL),(8,'201',1,'特护房',2,'2023-09-26 17:42:02','2023-09-26 17:42:02',0,1671403256519078138,NULL,NULL),(9,'202',2,'普通双人间',2,'2023-09-26 17:42:08','2023-09-26 17:42:08',0,1671403256519078138,NULL,NULL),(10,'203',3,'普通单人间',2,'2023-09-26 17:42:15','2023-09-26 17:42:15',0,1671403256519078138,NULL,NULL),(11,'204',4,'豪华双人间',2,'2023-09-26 17:42:22','2023-09-26 17:42:22',0,1671403256519078138,NULL,NULL),(12,'205',5,'豪华单人间',2,'2023-09-26 17:42:30','2023-09-26 17:42:30',0,1671403256519078138,NULL,NULL),(13,'206',6,'双人套房',2,'2023-09-26 17:42:41','2023-09-26 17:42:41',0,1671403256519078138,NULL,NULL),(14,'207',7,'单人套房',2,'2023-09-26 17:42:48','2023-09-26 17:42:48',0,1671403256519078138,NULL,NULL),(15,'301',1,'特护房',3,'2023-09-26 17:43:54','2023-09-26 17:43:54',0,1671403256519078138,NULL,NULL),(16,'302',2,'普通双人间',3,'2023-09-26 17:44:01','2023-09-26 17:44:01',0,1671403256519078138,NULL,NULL),(17,'303',3,'普通单人间',3,'2023-09-26 17:44:09','2023-09-26 17:44:09',0,1671403256519078138,NULL,NULL),(18,'304',4,'豪华双人间',3,'2023-09-26 17:44:17','2023-09-26 17:44:17',0,1671403256519078138,NULL,NULL),(19,'305',5,'豪华单人间',3,'2023-09-26 17:44:24','2023-09-26 17:44:24',0,1671403256519078138,NULL,NULL),(20,'306',6,'双人套房',3,'2023-09-26 17:44:33','2023-09-26 17:44:33',0,1671403256519078138,NULL,NULL),(21,'307',7,'单人套房',3,'2023-09-26 17:44:42','2023-09-26 17:44:42',0,1671403256519078138,NULL,NULL),(22,'401',1,'特护房',4,'2023-09-26 18:51:10','2023-09-26 18:51:10',0,1671403256519078138,NULL,NULL),(23,'402',2,'普通双人间',4,'2023-09-26 18:51:17','2023-09-26 18:51:17',0,1671403256519078138,NULL,NULL),(24,'403',3,'普通单人间',4,'2023-09-26 18:51:23','2023-09-26 18:51:23',0,1671403256519078138,NULL,NULL),(25,'404',4,'豪华双人间',4,'2023-09-26 18:51:32','2023-09-26 18:51:32',0,1671403256519078138,NULL,NULL),(26,'405',5,'豪华单人间',4,'2023-09-26 18:51:42','2023-09-26 18:51:42',0,1671403256519078138,NULL,NULL),(27,'406',6,'双人套房',4,'2023-09-26 18:51:54','2023-09-26 18:51:54',0,1671403256519078138,NULL,NULL),(28,'407',7,'单人套房',4,'2023-09-26 18:52:03','2023-09-26 18:52:03',0,1671403256519078138,NULL,NULL),(29,'501',1,'特护房',5,'2023-09-26 18:53:54','2023-09-26 18:53:54',0,1671403256519078138,NULL,NULL),(31,'502',2,'普通双人间',5,'2023-09-26 18:54:05','2023-09-26 18:54:05',0,1671403256519078138,NULL,NULL),(32,'503',3,'普通单人间',5,'2023-09-26 18:54:12','2023-09-26 18:54:12',0,1671403256519078138,NULL,NULL),(33,'504',4,'豪华双人间',5,'2023-09-26 18:54:20','2023-09-26 18:54:20',0,1671403256519078138,NULL,NULL),(34,'505',5,'豪华单人间',5,'2023-09-26 18:54:28','2023-09-26 18:54:28',0,1671403256519078138,NULL,NULL),(35,'506',6,'双人套房',5,'2023-09-26 18:54:37','2023-09-26 18:54:37',0,1671403256519078138,NULL,NULL),(36,'507',7,'单人套房',5,'2023-09-26 18:54:47','2023-09-26 18:54:47',0,1671403256519078138,NULL,NULL),(37,'601',1,'特护房',6,'2023-09-26 18:57:14','2023-09-26 18:57:14',0,1671403256519078138,NULL,NULL),(38,'602',2,'普通双人间',6,'2023-09-26 18:57:20','2023-09-26 18:57:20',0,1671403256519078138,NULL,NULL),(39,'603',3,'普通单人间',6,'2023-09-26 18:57:28','2023-09-26 18:57:28',0,1671403256519078138,NULL,NULL),(40,'604',4,'豪华双人间',6,'2023-09-26 18:57:36','2023-09-26 18:57:36',0,1671403256519078138,NULL,NULL),(41,'605',5,'豪华单人间',6,'2023-09-26 19:01:36','2023-09-26 19:01:36',0,1671403256519078138,NULL,NULL),(42,'606',6,'双人套房',6,'2023-09-26 19:01:45','2023-09-26 19:01:45',0,1671403256519078138,NULL,NULL),(43,'607',7,'单人套房',6,'2023-09-26 19:01:54','2023-09-26 19:01:54',0,1671403256519078138,NULL,NULL),(44,'701',1,'特护房',7,'2023-09-26 19:02:13','2023-09-26 19:02:13',0,1671403256519078138,NULL,NULL),(45,'702',2,'普通双人间',7,'2023-09-26 19:02:20','2023-09-26 19:02:20',0,1671403256519078138,NULL,NULL),(46,'703',3,'普通单人间',7,'2023-09-26 19:02:28','2023-09-26 19:02:28',0,1671403256519078138,NULL,NULL),(47,'704',4,'豪华双人间',7,'2023-09-26 19:02:49','2023-09-26 19:02:49',0,1671403256519078138,NULL,NULL),(48,'705',5,'豪华单人间',7,'2023-09-26 19:03:00','2023-09-26 19:03:00',0,1671403256519078138,NULL,NULL),(49,'706',6,'双人套房',7,'2023-09-26 19:03:07','2023-09-26 19:03:07',0,1671403256519078138,NULL,NULL),(50,'707',7,'单人套房',7,'2023-09-26 19:03:15','2023-09-26 19:03:15',0,1671403256519078138,NULL,NULL),(51,'801',1,'特护房',8,'2023-09-26 19:03:49','2023-09-26 19:03:49',0,1671403256519078138,NULL,NULL),(52,'802',2,'普通双人间',8,'2023-09-26 19:03:57','2023-09-26 19:03:57',0,1671403256519078138,NULL,NULL),(53,'803',3,'普通单人间',8,'2023-09-26 19:04:04','2023-09-26 19:04:04',0,1671403256519078138,NULL,NULL),(54,'804',4,'豪华双人间',8,'2023-09-26 19:04:13','2023-09-26 19:04:13',0,1671403256519078138,NULL,NULL),(55,'805',5,'豪华单人间',8,'2023-09-26 19:04:45','2023-09-26 19:04:45',0,1671403256519078138,NULL,NULL),(56,'806',6,'双人套房',8,'2023-09-26 19:04:52','2023-09-26 19:04:52',0,1671403256519078138,NULL,NULL),(57,'807',7,'单人套房',8,'2023-09-26 19:05:00','2023-09-26 19:05:00',0,1671403256519078138,NULL,NULL),(67,'108',1,'普通单人间',1,'2023-12-23 16:12:46','2023-12-23 17:08:47',0,1671403256519078138,1671403256519078138,NULL),(81,'109',1,'单人套房',1,'2024-05-27 10:28:37',NULL,0,1,NULL,NULL),(83,'1201',1,'双人套房',406,'2024-05-27 14:14:54',NULL,0,1,NULL,NULL),(86,'102-2',1,'豪华单人间',406,'2024-08-22 18:49:21',NULL,0,1,NULL,NULL),(89,'1301',1,'豪华单人间',414,'2025-05-23 11:02:38',NULL,0,1,NULL,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房型名称',
  `bed_count` int NOT NULL DEFAULT '0' COMMENT '床位数量',
  `price` decimal(10,2) NOT NULL COMMENT '床位费用',
  `introduction` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '介绍',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '照片',
  `status` tinyint NOT NULL COMMENT '状态，0：禁用，1：启用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='房型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'单人套房',0,4000.00,'宽敞舒适的套房，配备独立卫生间和基本生活设施，满足独自居住的需求，提供私密性和舒适度','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/e2f1031b-e23e-4379-95d4-ce8fe382f58f.png',1,'2023-09-26 15:57:50','2024-10-03 23:54:34',1671403256519078153,1,NULL),(2,'双人套房',0,6000.00,'适合夫妻或朋友两人居住的套房，设有独立卫生间和基本生活设施，提供共享空间和私密性','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/ff84c185-2e28-431c-951d-d004cc2d5bdc.png',1,'2023-09-26 15:58:51','2023-09-26 15:58:51',1671403256519078153,NULL,NULL),(3,'豪华单人间',0,3000.00,'豪华装修的单人房间，提供舒适的居住环境和高品质的服务，设计精美，配备独立卫生间和必需设施','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/d803832c-5b93-4cae-ba95-aeb52ab0c5e0.png',1,'2023-09-26 15:59:33','2023-09-26 15:59:33',1671403256519078153,NULL,NULL),(4,'豪华双人间',0,4500.00,'精心装修的双人房间，提供舒适和豪华的居住环境，配备独立卫生间和高品质的家具','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/c3522da7-4c5c-48d2-94f9-9f0b95a048d2.png',1,'2023-09-26 16:00:03','2024-08-22 16:12:20',1671403256519078153,1,NULL),(5,'普通单人间',0,2000.00,'简洁实用的单人房间，提供基本的居住设施和舒适度，适合独自居住的老年人，提供相对经济实惠的居住选择','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/1a330b1c-b0a1-463d-8d9a-221ef17c314f.png',1,'2023-09-26 16:00:27','2023-09-26 16:00:27',1671403256519078153,NULL,NULL),(103,'我的房型设置',0,6000.00,'啊傻瓜按个按个','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/9c4a9926-2f58-4306-a8c5-122adb8e700e.jpeg',1,'2023-12-25 16:04:00','2023-12-25 16:04:00',1671403256519078138,NULL,NULL),(110,'测试修改',5,1000.00,'12312312312312312312312312312312312312312312312312','https://yjy-slwl-oss.oss-cn-hangzhou.aliyuncs.com/00167193-00f1-49a6-85e5-74dd0b93819e.png',1,'2023-12-27 00:07:07','2024-08-22 19:05:53',1671403256519078138,1,NULL),(115,'测试新增',10,3500.00,'水电费方式','https://itheim.oss-cn-beijing.aliyuncs.com/8fe7b29d-fce0-4201-becb-0586e8284a9d.png',1,'2024-08-22 19:06:33','2024-08-22 19:06:41',1,1,'是否'),(116,'标准双人间',10,1500.00,'123','https://itheim.oss-cn-beijing.aliyuncs.com/91c4a814-efd5-4093-a5ac-963b41047019.png',1,'2024-09-12 22:52:36','2024-09-12 22:55:10',1,1,'123');
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-08-14 02:48:24','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-08-14 02:48:24','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-08-14 02:48:24','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-08-14 02:48:24','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-08-14 02:48:24','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-08-14 02:48:24','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','智慧养老院',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-14 02:48:23','admin','2024-10-18 10:08:30'),(101,100,'0,100','高层办公室',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-14 02:48:23','admin','2024-10-18 10:08:40'),(102,100,'0,100','财务部',2,'','','','0','0','admin','2024-08-14 02:48:23','admin','2024-10-18 10:11:02'),(103,101,'0,100,101','院长办公室',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-08-14 02:48:23','admin','2024-10-18 10:08:55'),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-08-14 02:48:23','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','2','admin','2024-08-14 02:48:23','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2024-08-14 02:48:23','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2024-08-14 02:48:23','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2024-08-14 02:48:23','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-08-14 02:48:23','',NULL),(200,100,'0,100','行政部',3,NULL,NULL,NULL,'0','0','admin','2024-10-18 10:10:44','',NULL),(202,100,'0,100','后勤部',5,NULL,NULL,NULL,'0','0','admin','2024-10-18 10:11:15','',NULL),(203,100,'0,100','销售部',6,NULL,NULL,NULL,'0','0','admin','2024-10-18 10:11:24','',NULL),(211,100,'0,100','护理部',4,NULL,NULL,NULL,'0','0','admin','2024-10-18 10:10:55','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-08-14 02:48:24','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-08-14 02:48:24','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-08-14 02:48:24','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-08-14 02:48:24','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-08-14 02:48:24','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-08-14 02:48:24','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-08-14 02:48:24','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-08-14 02:48:24','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-08-14 02:48:24','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-08-14 02:48:24','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-08-14 02:48:24','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-08-14 02:48:24','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-08-14 02:48:24','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-08-14 02:48:24','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-08-14 02:48:24','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-08-14 02:48:24','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-08-14 02:48:24','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-08-14 02:48:24','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-08-14 02:48:24','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-08-14 02:48:24','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-08-14 02:48:24','',NULL,'停用状态'),(100,0,'启用','1','nursing_project_status',NULL,'default','N','0','admin','2024-08-18 02:41:15','',NULL,NULL),(101,0,'禁用','0','nursing_project_status',NULL,'default','N','0','admin','2024-08-18 02:41:30','',NULL,NULL),(103,0,'启用','1','nursing_plan_status',NULL,'default','N','0','admin','2024-08-19 11:00:04','',NULL,NULL),(104,0,'禁用','2','nursing_plan_status',NULL,'default','N','0','admin','2024-08-19 11:00:10','',NULL,NULL),(105,0,'启用','1','nursing_level_status',NULL,'default','N','0','admin','2024-08-20 03:04:14','',NULL,NULL),(106,0,'禁用','0','nursing_level_status',NULL,'default','N','0','admin','2024-08-20 03:04:21','',NULL,NULL),(107,0,'已入住','0','admission_status',NULL,'default','N','0','admin','2024-08-31 03:20:26','',NULL,NULL),(108,0,'未入住','1','admission_status',NULL,'default','N','0','admin','2024-08-31 03:20:35','',NULL,NULL),(109,1,'随身设备','0','device_location_type',NULL,'default','N','0','admin','2025-05-30 07:54:06','',NULL,'随身设备'),(110,2,'固定设备','1','device_location_type',NULL,'default','N','0','admin','2025-05-30 07:54:21','',NULL,'固定设备');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-08-14 02:48:24','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-08-14 02:48:24','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-08-14 02:48:24','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-08-14 02:48:24','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-08-14 02:48:24','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-08-14 02:48:24','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-08-14 02:48:24','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-08-14 02:48:24','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-08-14 02:48:24','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-08-14 02:48:24','',NULL,'登录状态列表'),(100,'护理项目状态','nursing_project_status','0','admin','2024-08-18 02:40:48','',NULL,NULL),(101,'护理计划状态','nursing_plan_status','0','admin','2024-08-19 10:59:40','',NULL,NULL),(102,'护理等级状态','nursing_level_status','0','admin','2024-08-20 03:04:03','',NULL,NULL),(103,'健康评估-入住状态','admission_status','0','admin','2024-08-31 03:19:57','',NULL,NULL),(104,'设备的位置','device_location_type','0','admin','2025-05-30 07:53:17','admin','2025-05-30 07:55:28',NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-08-14 02:48:24','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-08-14 02:48:24','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-08-14 02:48:24','',NULL,''),(100,'快速入门','DEFAULT','helloJob.myJob','0/2 * * * * ?','1','1','1','admin','2025-05-26 09:18:27','','2025-05-26 09:19:39',''),(101,'更新合同状态','DEFAULT','contractJob.updateContractStatusJob','1 1 0 * * ?','1','1','1','admin','2025-05-26 09:59:42','','2025-05-26 10:07:40',''),(102,'数据告警','DEFAULT','alertJob.deviceDataAlertFilter','0 * * * * ?','1','1','1','admin','2025-06-05 06:39:48','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2025-10-16 13:13:49'),(2,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2025-10-17 00:07:55'),(3,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2025-10-17 13:26:42'),(4,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','1','验证码错误','2025-10-18 09:41:41'),(5,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2025-10-18 09:43:49'),(6,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2025-10-18 11:41:46'),(7,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','退出成功','2025-10-18 11:47:11'),(8,'admin','127.0.0.1','内网IP','Chrome 14','Windows 10','0','登录成功','2025-10-18 11:50:07');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,6,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-08-14 02:48:23','admin','2024-08-29 06:40:54','系统管理目录'),(2,'系统监控',0,7,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-08-14 02:48:23','admin','2024-08-29 06:41:07','系统监控目录'),(3,'系统工具',0,8,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-08-14 02:48:23','admin','2024-08-29 06:41:14','系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','1','0','','guide','admin','2024-08-14 02:48:23','admin','2024-08-20 01:57:10','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-08-14 02:48:23','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-08-14 02:48:23','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-08-14 02:48:23','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-08-14 02:48:23','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-08-14 02:48:23','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-08-14 02:48:23','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-08-14 02:48:23','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-08-14 02:48:23','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-08-14 02:48:23','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-08-14 02:48:23','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-08-14 02:48:23','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-08-14 02:48:23','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-08-14 02:48:23','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-08-14 02:48:23','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-08-14 02:48:23','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-08-14 02:48:23','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-08-14 02:48:23','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-08-14 02:48:23','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-08-14 02:48:23','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-08-14 02:48:23','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-08-14 02:48:23','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-08-14 02:48:23','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-08-14 02:48:23','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-08-14 02:48:23','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-08-14 02:48:23','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-08-14 02:48:23','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-08-14 02:48:23','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-08-14 02:48:23','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-08-14 02:48:23','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-08-14 02:48:23','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-08-14 02:48:23','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-08-14 02:48:23','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-08-14 02:48:23','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-08-14 02:48:23','',NULL,''),(2000,'服务管理',0,4,'serve',NULL,NULL,'',1,0,'M','0','0','','example','admin','2024-08-14 02:59:12','admin','2024-08-29 06:42:37',''),(2001,'护理项目',2000,1,'project','serve/project/index',NULL,'',1,0,'C','0','0','serve:project:list','color','admin','2024-08-14 03:00:15','admin','2024-08-22 12:16:12','护理项目菜单'),(2002,'护理项目查询',2001,1,'#','',NULL,'',1,0,'F','0','0','serve:project:query','#','admin','2024-08-14 03:00:15','',NULL,''),(2003,'护理项目新增',2001,2,'#','',NULL,'',1,0,'F','0','0','serve:project:add','#','admin','2024-08-14 03:00:15','',NULL,''),(2004,'护理项目修改',2001,3,'#','',NULL,'',1,0,'F','0','0','serve:project:edit','#','admin','2024-08-14 03:00:15','',NULL,''),(2005,'护理项目删除',2001,4,'#','',NULL,'',1,0,'F','0','0','serve:project:remove','#','admin','2024-08-14 03:00:15','',NULL,''),(2006,'护理项目导出',2001,5,'#','',NULL,'',1,0,'F','0','0','serve:project:export','#','admin','2024-08-14 03:00:15','',NULL,''),(2007,'护理等级',2000,1,'level','serve/level/index',NULL,'',1,0,'C','0','0','serve:level:list','guide','admin','2024-08-14 08:29:05','admin','2024-10-03 10:49:54','护理等级菜单'),(2008,'护理等级查询',2007,1,'#','',NULL,'',1,0,'F','0','0','serve:level:query','#','admin','2024-08-14 08:29:05','admin','2024-10-03 10:47:20',''),(2009,'护理等级新增',2007,2,'#','',NULL,'',1,0,'F','0','0','serve:level:add','#','admin','2024-08-14 08:29:05','admin','2024-10-03 10:47:27',''),(2010,'护理等级修改',2007,3,'#','',NULL,'',1,0,'F','0','0','serve:level:edit','#','admin','2024-08-14 08:29:05','admin','2024-10-03 10:47:32',''),(2011,'护理等级删除',2007,4,'#','',NULL,'',1,0,'F','0','0','serve:level:remove','#','admin','2024-08-14 08:29:05','admin','2024-10-03 10:47:37',''),(2012,'护理等级导出',2007,5,'#','',NULL,'',1,0,'F','0','0','serve:level:export','#','admin','2024-08-14 08:29:05','admin','2024-10-03 10:47:42',''),(2013,'护理计划',2000,1,'plan','serve/plan/index',NULL,'',1,0,'C','0','0','serve:plan:list','druid','admin','2024-08-14 08:29:10','admin','2024-10-03 10:49:49','护理计划菜单'),(2014,'护理计划查询',2013,1,'#','',NULL,'',1,0,'F','0','0','nursing:nursingPlan:query','#','admin','2024-08-14 08:29:10','',NULL,''),(2015,'护理计划新增',2013,2,'#','',NULL,'',1,0,'F','0','0','nursing:nursingPlan:add','#','admin','2024-08-14 08:29:10','',NULL,''),(2016,'护理计划修改',2013,3,'#','',NULL,'',1,0,'F','0','0','nursing:nursingPlan:edit','#','admin','2024-08-14 08:29:10','',NULL,''),(2017,'护理计划删除',2013,4,'#','',NULL,'',1,0,'F','0','0','nursing:nursingPlan:remove','#','admin','2024-08-14 08:29:10','',NULL,''),(2018,'护理计划导出',2013,5,'#','',NULL,'',1,0,'F','0','0','nursing:nursingPlan:export','#','admin','2024-08-14 08:29:10','',NULL,''),(2019,'在住管理',0,3,'liveIn',NULL,NULL,'',1,0,'M','0','0','','date-range','admin','2024-08-22 06:49:19','admin','2024-08-29 06:42:27',''),(2020,'房型设置',2019,0,'houseSet','nursing/roomType/index',NULL,'',1,0,'C','0','0',NULL,'size','admin','2024-08-22 06:50:50','',NULL,''),(2021,'床位预览',2019,2,'floor','nursing/floor/index',NULL,'',1,0,'C','0','0',NULL,'tree-table','admin','2024-08-22 08:15:05','',NULL,''),(2022,'入退管理',0,2,'enterQuit',NULL,NULL,'',1,0,'M','0','0','','component','admin','2024-08-23 12:52:34','admin','2024-08-29 06:42:15',''),(2023,'入住办理',2022,1,'checkIn','nursing/checkIn/index',NULL,'',1,0,'C','0','0','nursing:checkIn:list','edit','admin','2024-08-23 13:13:48','admin','2024-08-24 02:58:12','入住菜单'),(2024,'入住查询',2023,1,'#','',NULL,'',1,0,'F','0','0','nursing:checkIn:query','#','admin','2024-08-23 13:13:48','',NULL,''),(2025,'入住新增',2023,2,'#','',NULL,'',1,0,'F','0','0','nursing:checkIn:add','#','admin','2024-08-23 13:13:48','',NULL,''),(2026,'入住修改',2023,3,'#','',NULL,'',1,0,'F','0','0','nursing:checkIn:edit','#','admin','2024-08-23 13:13:48','',NULL,''),(2027,'入住删除',2023,4,'#','',NULL,'',1,0,'F','0','0','nursing:checkIn:remove','#','admin','2024-08-23 13:13:48','',NULL,''),(2028,'入住导出',2023,5,'#','',NULL,'',1,0,'F','0','0','nursing:checkIn:export','#','admin','2024-08-23 13:13:48','',NULL,''),(2035,'入住详情',2022,0,'checkInInfo','nursing/checkIn/details',NULL,'',1,0,'C','1','0',NULL,'checkbox','admin','2024-08-24 03:44:48','',NULL,''),(2036,'来访管理',0,1,'appointment',NULL,NULL,'',1,0,'M','0','0',NULL,'button','admin','2024-08-29 06:41:45','',NULL,''),(2037,'智能监测',0,5,'intelligence',NULL,NULL,'',1,0,'M','0','0',NULL,'exit-fullscreen','admin','2024-08-29 06:43:14','',NULL,''),(2038,'预约信息',2036,1,'reservation','nursing/reservation/index',NULL,'',1,0,'C','0','0',NULL,'dashboard','admin','2024-08-29 06:47:29','',NULL,''),(2039,'健康评估',2022,1,'healthAssessment','nursing/healthAssessment/index',NULL,'',1,0,'C','0','0',NULL,'eye','admin','2024-08-29 06:48:51','',NULL,''),(2040,'评估详情',2022,2,'healthDetails','nursing/healthAssessment/details',NULL,'',1,0,'C','1','0','','#','admin','2024-08-29 06:49:53','admin','2024-08-29 06:50:06',''),(2041,'负责老人',2000,4,'oldPeople','serve/oldPeople/index',NULL,'',1,0,'C','0','0','','peoples','admin','2024-08-29 06:52:12','admin','2024-10-03 10:48:56',''),(2042,'任务安排',2000,5,'arrange','serve/arrange/index',NULL,'',1,0,'C','0','0','','redis-list','admin','2024-08-29 06:53:06','admin','2024-10-03 10:49:01',''),(2043,'任务安排详情',2000,1,'arrangeDetails','serve/arrange/details',NULL,'',1,0,'C','1','0','','#','admin','2024-08-29 06:53:37','admin','2024-10-03 10:48:50',''),(2044,'设备管理',2037,0,'device','nursing/device/index',NULL,'',1,0,'C','0','0','','tool','admin','2024-08-29 06:54:54','admin','2024-08-29 07:13:42',''),(2045,'设备详情',2037,0,'details','nursing/device/details',NULL,'',1,0,'C','1','0',NULL,'#','admin','2024-08-29 06:55:25','',NULL,''),(2046,'新增报警规则',2037,0,'ruleDetails','nursing/alertRule/details',NULL,'',1,0,'C','1','0',NULL,'#','admin','2024-08-29 06:56:01','',NULL,''),(2047,'报警规则',2037,1,'alertRule','nursing/alertRule/index',NULL,'',1,0,'C','0','0',NULL,'nested','admin','2024-08-29 06:56:48','',NULL,''),(2048,'报警数据',2037,2,'alertData','nursing/alertData/index',NULL,'',1,0,'C','0','0',NULL,'skill','admin','2024-08-29 06:57:25','',NULL,''),(2049,'智能床位',2019,4,'smartBed','nursing/smartBed/index',NULL,'',1,0,'C','0','0',NULL,'drag','admin','2025-06-02 11:42:25','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-08-14 02:48:24','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-08-14 02:48:24','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'代码生成',8,'com.zzyl.generator.controller.GenController.batchGenCode()','GET',1,'admin','院长办公室','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"elder\"}',NULL,0,NULL,'2025-10-16 13:14:27',351),(2,'护理项目',1,'com.zzyl.serve.controller.NursingProjectController.add()','POST',1,'admin','院长办公室','/serve/project','127.0.0.1','内网IP','{\"createBy\":\"1\",\"createTime\":\"2025-10-16 21:16:06\",\"id\":11,\"image\":\"https://sz154-web.oss-cn-shenzhen.aliyuncs.com/2025/10/95746288-7488-47f4-9e0f-1f5bcc928f0c.png\",\"name\":\"aaaaa\",\"nursingRequirement\":\"sdf\",\"orderNo\":1,\"params\":{},\"price\":2,\"status\":1,\"unit\":\"2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-16 13:16:06',18),(3,'代码生成',3,'com.zzyl.generator.controller.GenController.remove()','DELETE',1,'admin','院长办公室','/tool/gen/18,22,23,24,25,26,27,28,29,30','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-17 00:14:52',58),(4,'代码生成',6,'com.zzyl.generator.controller.GenController.importTableSave()','POST',1,'admin','院长办公室','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"contract\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-17 00:15:55',137),(5,'代码生成',3,'com.zzyl.generator.controller.GenController.remove()','DELETE',1,'admin','院长办公室','/tool/gen/31','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-17 13:35:53',41),(6,'代码生成',6,'com.zzyl.generator.controller.GenController.importTableSave()','POST',1,'admin','院长办公室','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"check_in\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-17 13:35:57',111),(7,'代码生成',3,'com.zzyl.generator.controller.GenController.remove()','DELETE',1,'admin','院长办公室','/tool/gen/32','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-17 13:36:59',18),(8,'代码生成',6,'com.zzyl.generator.controller.GenController.importTableSave()','POST',1,'admin','院长办公室','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"check_in,check_in_config,elder,contract\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-18 09:51:08',485),(9,'代码生成',2,'com.zzyl.generator.controller.GenController.editSave()','PUT',1,'admin','院长办公室','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"checkIn\",\"className\":\"CheckIn\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":540,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":33,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderName\",\"columnComment\":\"老人姓名\",\"columnId\":541,\"columnName\":\"elder_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":33,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":542,\"columnName\":\"elder_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":33,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":543,\"columnName\":\"id_card_no\",\"columnType\":\"char(18)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-18 09:51:37',105),(10,'代码生成',2,'com.zzyl.generator.controller.GenController.editSave()','PUT',1,'admin','院长办公室','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"config\",\"className\":\"CheckInConfig\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":555,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":34,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住表ID\",\"columnId\":556,\"columnName\":\"check_in_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":34,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NursingLevelId\",\"columnComment\":\"护理等级ID\",\"columnId\":557,\"columnName\":\"nursing_level_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nursingLevelId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":34,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"NursingLevelName\",\"columnComment\":\"护理等级名称\",\"columnId\":558,\"columnName\":\"nursing_level_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-18 09:53:32',99),(11,'代码生成',2,'com.zzyl.generator.controller.GenController.editSave()','PUT',1,'admin','院长办公室','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"contract\",\"className\":\"Contract\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键ID\",\"columnId\":573,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":35,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CheckInId\",\"columnComment\":\"入住ID\",\"columnId\":574,\"columnName\":\"check_in_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"checkInId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":35,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ElderId\",\"columnComment\":\"老人ID\",\"columnId\":575,\"columnName\":\"elder_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"elderId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":35,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContractName\",\"columnComment\":\"合同名称\",\"columnId\":576,\"columnName\":\"contract_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"java','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-18 09:53:48',107),(12,'代码生成',2,'com.zzyl.generator.controller.GenController.editSave()','PUT',1,'admin','院长办公室','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"elder\",\"className\":\"Elder\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":595,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":36,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":596,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":36,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Image\",\"columnComment\":\"图片\",\"columnId\":597,\"columnName\":\"image\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"image\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":36,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdCardNo\",\"columnComment\":\"身份证号\",\"columnId\":598,\"columnName\":\"id_card_no\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-10-18 09:51:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"idCardNo\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-18 09:54:01',85),(13,'代码生成',8,'com.zzyl.generator.controller.GenController.batchGenCode()','GET',1,'admin','院长办公室','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"check_in,check_in_config,contract,elder\"}',NULL,0,NULL,'2025-10-18 10:08:50',399),(14,'代码生成',3,'com.zzyl.generator.controller.GenController.remove()','DELETE',1,'admin','院长办公室','/tool/gen/33,34,35,36','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-10-18 11:50:17',49);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-08-14 02:48:23','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-08-14 02:48:23','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-08-14 02:48:23','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-08-14 02:48:23','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-08-14 02:48:23','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-08-14 02:48:23','admin','2024-10-18 10:38:36','普通角色'),(100,'护理员','nursingUser',3,'1',1,1,'0','0','admin','2024-09-24 17:25:26','admin','2024-10-18 10:38:20',NULL),(101,'维修工','maintainer',4,'1',1,1,'0','0','admin','2024-09-24 17:26:31','admin','2024-10-18 10:38:13',NULL),(102,'客服专员','customerService',5,'1',1,1,'0','0','admin','2024-09-24 17:27:42','admin','2024-10-18 10:38:05',NULL),(103,'院长','SuperAdministrator',6,'1',1,1,'0','0','admin','2024-09-24 17:30:54','admin','2024-10-18 10:37:55',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2000),(2,2001),(2,2003),(2,2004),(2,2005),(2,2006),(100,1),(100,2),(100,3),(100,4),(100,100),(100,101),(100,102),(100,103),(100,104),(100,105),(100,106),(100,107),(100,108),(100,109),(100,110),(100,111),(100,112),(100,113),(100,114),(100,115),(100,116),(100,117),(100,500),(100,501),(100,1000),(100,1001),(100,1002),(100,1003),(100,1004),(100,1005),(100,1006),(100,1007),(100,1008),(100,1009),(100,1010),(100,1011),(100,1012),(100,1013),(100,1014),(100,1015),(100,1016),(100,1017),(100,1018),(100,1019),(100,1020),(100,1021),(100,1022),(100,1023),(100,1024),(100,1025),(100,1026),(100,1027),(100,1028),(100,1029),(100,1030),(100,1031),(100,1032),(100,1033),(100,1034),(100,1035),(100,1036),(100,1037),(100,1038),(100,1039),(100,1040),(100,1041),(100,1042),(100,1043),(100,1044),(100,1045),(100,1046),(100,1047),(100,1048),(100,1049),(100,1050),(100,1051),(100,1052),(100,1053),(100,1054),(100,1055),(100,1056),(100,1057),(100,1058),(100,1059),(100,1060),(100,2000),(100,2001),(100,2002),(100,2003),(100,2004),(100,2005),(100,2006),(100,2007),(100,2008),(100,2009),(100,2010),(100,2011),(100,2012),(100,2013),(100,2014),(100,2015),(100,2016),(100,2017),(100,2018),(100,2019),(100,2020),(100,2021),(100,2022),(100,2023),(100,2024),(100,2025),(100,2026),(100,2027),(100,2028),(100,2035),(100,2036),(100,2037),(100,2038),(100,2039),(100,2040),(100,2041),(100,2042),(100,2043),(100,2044),(100,2045),(100,2046),(100,2047),(100,2048);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-10-18 19:50:08','admin','2024-08-14 02:48:23','','2025-10-18 11:50:07','管理员'),(2,103,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-08-14 02:48:23','admin','2024-08-14 02:48:23','admin','2024-10-18 10:10:07','测试员'),(100,103,'guotianle','guotianle','00','','18888888888','0','','$2a$10$GhMQGKcwBXW43oekDfuSeuddpnBOXqUqRtLdRvGctnFZU4qRnjluK','0','2','127.0.0.1','2024-10-13 10:11:11','admin','2024-10-13 02:10:30','','2024-10-13 02:11:10',NULL),(101,211,'xiaoqing','小青','00','','','1','','$2a$10$ZHGoo31fojJQU9.Azp/d1OBJc7/esVPO2X2Q3ad26yfkLQWyE/mXC','0','0','127.0.0.1','2024-10-18 18:31:55','admin','2024-10-18 10:12:45','admin','2024-10-18 10:36:04',NULL),(102,211,'xiaobai','小白','00','','','1','','$2a$10$XBRYFG/2VDeIpC406Vlb2Oj3ASvHz9L7DCnNt3LwiMHw9vnHb4.dy','0','0','',NULL,'admin','2024-10-18 10:13:12','admin','2024-10-18 10:36:59',NULL),(103,202,'laozhang','老张','00','','','0','','$2a$10$qaAyozgQfpCpgZehMVKzduW9prT9NzFmUFRlYyhL2H6ZKSH7lhYzm','0','0','',NULL,'admin','2024-10-18 10:13:41','admin','2024-10-18 10:36:17',NULL),(104,103,'laowang','老王','00','','','0','','$2a$10$08ZGHo41Xa.J4k9BvM4qNO/5pvXCoWfq6gmQEFpNQK4PoJGjEv1xW','0','0','',NULL,'admin','2024-10-18 10:13:59','admin','2024-10-18 10:38:55',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(100,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(101,100),(102,100),(103,101),(104,103);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-18 19:54:22
