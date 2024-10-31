CREATE DATABASE  IF NOT EXISTS `sv` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sv`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sv
-- ------------------------------------------------------
-- Server version	8.0.36

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 17:37:34
CREATE DATABASE  IF NOT EXISTS `webdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webdb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: webdb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `tb_account`
--

DROP TABLE IF EXISTS `tb_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_account` (
  `AccountId` int NOT NULL AUTO_INCREMENT,
  `AccountName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `FullName` varchar(45) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Gender` tinyint(1) DEFAULT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `RoleId` int NOT NULL,
  PRIMARY KEY (`AccountId`),
  KEY `account_role_idx` (`RoleId`),
  CONSTRAINT `account_role` FOREIGN KEY (`RoleId`) REFERENCES `tb_role` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_account`
--

LOCK TABLES `tb_account` WRITE;
/*!40000 ALTER TABLE `tb_account` DISABLE KEYS */;
INSERT INTO `tb_account` VALUES (1,'vanhoa123','d411cf68bd7f71d13fb053154f455651','Võ Văn Hòa','0349191354','vanhoa12092003@gmail.com','Nghi Xuân - Nghi Lộc - Nghệ An','2003-09-12 00:00:00',1,'/files_admin/img/user2-160x160.jpg','2024-09-20 00:00:00','2024-09-23 08:49:48',1,1),(2,'vanhoa','d411cf68bd7f71d13fb053154f455651','Võ Văn Hòa','0123456789','vanhoa763@gmail.com','Nghi Xuân - Nghi Lộc - Nghệ An','2003-12-09 00:00:00',1,'/files_admin/img/user2-160x160.jpg',NULL,NULL,1,3),(4,'vanhoa321','d411cf68bd7f71d13fb053154f455651','A Hòa chủ trọ','0972756829','vanhoa120903z@gmail.com','Nghi Xuân - Nghi Lộc - Nghệ An','2003-09-12 00:00:00',1,'/files_landlord/img/avatar4.png','2024-09-21 00:00:00','2024-10-07 23:33:08',1,2),(5,'vanhoang321','d411cf68bd7f71d13fb053154f455651','Trần Văn Hoàng','0976547654','vanhoang764@gmail.com','Phúc Thọ - Nghi Lộc - Nghệ An','2003-09-23 00:00:00',1,'/files_landlord/img/avatar5.png',NULL,'2024-10-07 23:32:41',1,2),(8,'vanhoang','d411cf68bd7f71d13fb053154f455651','Văn Hoàng','0123456789','vanhoa12092003zzz@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,3);
/*!40000 ALTER TABLE `tb_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_admin_menu`
--

DROP TABLE IF EXISTS `tb_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_admin_menu` (
  `AdminMenuId` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(45) NOT NULL,
  `ItemLevel` int NOT NULL,
  `ParentLevel` int NOT NULL,
  `ItemOrder` int NOT NULL,
  `Icon` varchar(45) DEFAULT NULL,
  `AreaName` varchar(45) NOT NULL,
  `ControllerName` varchar(45) NOT NULL,
  `ActionName` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`AdminMenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin_menu`
--

LOCK TABLES `tb_admin_menu` WRITE;
/*!40000 ALTER TABLE `tb_admin_menu` DISABLE KEYS */;
INSERT INTO `tb_admin_menu` VALUES (40,'Trang chủ',1,0,1,'fa-solid fa-house','Admin','Home','Index',1),(41,'Quản lý bài viết',1,0,3,'fa-solid fa-newspaper','Admin','Blog','Index',1),(42,'Phân loại bài viết',2,41,1,'far fa-circle','Admin','PostCategories','Index',1),(43,'Quản lý Menu',1,0,2,'fa-solid fa-bars','Admin','AdminMenu','Index',1),(44,'Admin Menu',2,43,1,'far fa-circle','Admin','AdminMenu','Index',1),(50,'Web Menu',2,43,3,'far fa-circle','Admin','Menu','Index',1),(54,'Danh sách bài viết',2,41,2,'far fa-circle','Admin','Post','Index',1),(55,'Quản lý hình ảnh',1,0,1,'fa-solid fa-image','Admin','FileManager','Index',1),(56,'Quản lý dịch vụ',1,0,4,'fa-solid fa-bell-concierge','Admin','Service','Index',1),(57,'Danh sách tiêu chí',2,56,1,'far fa-circle','Admin','Criteria','Index',1),(58,'Danh sách dịch vụ',2,56,2,'far fa-circle','Admin','Service','Index',1),(59,'Quản lý phòng',1,0,6,'fa-solid fa-house-user','Admin','RoomStatus','Index',1),(60,'Trạng thái phòng',2,59,1,'far fa-circle','Admin','RoomStatus','Index',1),(61,'Phân loại phòng',2,59,2,'far fa-circle','Admin','RoomCategories','Index',1),(63,'Landlord Menu',2,43,2,'far fa-circle','Admin','LandlordMenu','Index',1),(65,'Trang chủ',1,0,1,'fa-solid fa-house-user','Landlord','Home','Index',1),(66,'Quản lý bài viết',1,0,3,'fa-solid fa-newspaper','Landlord','Post','Index',1),(67,'Danh sách bài viết',2,66,1,'far fa-circle','Landlord','Post','Index',1),(68,'Quản lý hình ảnh',1,0,2,'fa-solid fa-image','Landlord','FileManager','Index',1),(69,'Thêm mới bài viết',2,66,1,'far fa-circle','Landlord','Post','Create',1),(70,'Quản lý khách hàng',1,0,4,'fa-solid fa-user','Landlord','Customer','Index',1),(71,'Danh sách khách hàng',2,70,1,'far fa-circle','Landlord','Customer','Index',1),(72,'Thêm mới khách hàng',2,70,2,'far fa-circle','Landlord','Customer','Create',1),(73,'Quản lý phòng trọ',1,0,4,'fa-solid fa-bars','Landlord','Room','Index',1),(74,'Danh sách phòng trọ',2,73,1,'far fa-circle','Landlord','Room','Index',1),(75,'Thông tin cá nhân',1,0,10,'fa-solid fa-address-card','Admin','Profile','Index',1),(76,'Đổi mật khẩu',1,0,11,'fa-solid fa-lock','Admin','Profile','EditPassWord',1),(77,'Thêm mới phòng trọ',2,73,2,'far fa-circle','Landlord','Room','Create',1),(78,'Thông tin cá nhân',1,0,6,'fa-solid fa-address-card','Landlord','Profile','Index',1),(79,'Đổi mật khẩu',1,0,7,'fa-solid fa-lock','Landlord','Profile','EditPassWord',1),(80,'Quản lý thuê trọ',1,0,5,'fa-solid fa-file-contract','Landlord','#','#',1),(81,'Đã kết thúc',2,80,2,'far fa-circle','Landlord','Contract','Contract',1),(82,'Chờ phê duyệt',2,41,3,'far fa-circle','Admin','Post','Approve',1),(83,'Hợp đồng hiện tại',2,80,1,'far fa-circle','Landlord','Contract','Index',1),(84,'Quản lý slider',1,0,8,'fa-solid fa-sliders','Admin','Slider','Index',1),(85,'Danh sách Slider',2,84,1,'far fa-circle','Admin','MSlider','Index',1),(86,'Thêm mới slider',2,84,2,'far fa-circle','Admin','MSlider','Create',1),(87,'Quản lý người dùng',1,0,7,'fa-solid fa-user','Admin','Home','Index',1),(88,'Danh sách chủ trọ',2,87,1,'far fa-circle','Admin','User','ListLandlord',1),(89,'Danh sách khách hàng',2,87,2,'far fa-circle','Admin','User','ListCustomer',1),(90,'Danh sách quản trị',2,87,3,'far fa-circle','Admin','User','ListAdmin',1),(91,'Quản lý phản hồi',1,0,8,'fa-solid fa-comment','Admin','Home','Index',1),(92,'Danh sách phản hồi',2,91,1,'far fa-circle','Admin','Contact','Index',1),(93,'Danh sách bình luận',2,91,2,'far fa-circle','Admin','PostComment','Index',1),(94,'Duyệt chủ trọ',2,87,4,'far fa-circle','Admin','User','ListRegister',1);
/*!40000 ALTER TABLE `tb_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contact`
--

DROP TABLE IF EXISTS `tb_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_contact` (
  `ContactId` int NOT NULL AUTO_INCREMENT,
  `AccountId` int NOT NULL,
  `Message` text NOT NULL,
  `IsRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`ContactId`),
  KEY `contact_account_idx` (`AccountId`),
  CONSTRAINT `contact_account` FOREIGN KEY (`AccountId`) REFERENCES `tb_account` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contact`
--

LOCK TABLES `tb_contact` WRITE;
/*!40000 ALTER TABLE `tb_contact` DISABLE KEYS */;
INSERT INTO `tb_contact` VALUES (1,2,'Xin chào Admin',1),(2,2,'Web toàn lỗi fix đi',1),(3,2,'Bài viết bị lỗi không xem được',1),(6,2,'Xin vui lòng viết email cho chúng tôi để nhận phản hồi sớm nhất.',0),(7,2,'Liên hệ cho chúng tôi nếu bạn có thắc mắc cần được giải đáp.',0);
/*!40000 ALTER TABLE `tb_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contract_detail`
--

DROP TABLE IF EXISTS `tb_contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_contract_detail` (
  `ContractDetailId` int NOT NULL AUTO_INCREMENT,
  `ContractId` bigint NOT NULL,
  `RentalMonthId` bigint NOT NULL,
  `RoomServiceId` bigint NOT NULL,
  `ServicePrice` decimal(10,0) NOT NULL,
  `ServiceQuantity` int NOT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ContractDetailId`),
  KEY `contrac_detail_idx` (`ContractId`),
  KEY `room_service_idx` (`RoomServiceId`),
  KEY `rental_m_c_idx` (`RentalMonthId`),
  CONSTRAINT `contrac_detail` FOREIGN KEY (`ContractId`) REFERENCES `tb_contracts` (`ContractId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rental_m_c` FOREIGN KEY (`RentalMonthId`) REFERENCES `tb_rental_month` (`RentalMonthId`),
  CONSTRAINT `room_service` FOREIGN KEY (`RoomServiceId`) REFERENCES `tb_room_services` (`RoomServiceId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contract_detail`
--

LOCK TABLES `tb_contract_detail` WRITE;
/*!40000 ALTER TABLE `tb_contract_detail` DISABLE KEYS */;
INSERT INTO `tb_contract_detail` VALUES (4,1,1,1,2000,25,50000),(6,1,1,4,3000,30,90000),(16,1,1,5,50000,1,50000),(17,1,8,1,2000,20,40000),(18,1,8,4,3000,30,90000),(19,1,8,5,50000,1,50000);
/*!40000 ALTER TABLE `tb_contract_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contracts`
--

DROP TABLE IF EXISTS `tb_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_contracts` (
  `ContractId` bigint NOT NULL AUTO_INCREMENT,
  `RoomId` bigint NOT NULL,
  `CustomerId` bigint NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `PriceRoom` decimal(10,0) NOT NULL,
  `DepositAmount` decimal(10,0) NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`ContractId`),
  KEY `contracts_room_idx` (`RoomId`),
  KEY `contracts_cus_idx` (`CustomerId`),
  CONSTRAINT `contracts_cus` FOREIGN KEY (`CustomerId`) REFERENCES `tb_customer` (`CustomerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contracts_room` FOREIGN KEY (`RoomId`) REFERENCES `tb_room` (`RoomId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contracts`
--

LOCK TABLES `tb_contracts` WRITE;
/*!40000 ALTER TABLE `tb_contracts` DISABLE KEYS */;
INSERT INTO `tb_contracts` VALUES (1,1,1,'2024-09-24 00:00:00',4500000,2000000,0),(2,2,2,'2024-10-02 21:34:41',2500000,2500000,1);
/*!40000 ALTER TABLE `tb_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_criterias`
--

DROP TABLE IF EXISTS `tb_criterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_criterias` (
  `CriteriaId` int NOT NULL AUTO_INCREMENT,
  `CriteriaName` varchar(250) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`CriteriaId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_criterias`
--

LOCK TABLES `tb_criterias` WRITE;
/*!40000 ALTER TABLE `tb_criterias` DISABLE KEYS */;
INSERT INTO `tb_criterias` VALUES (3,'Có vệ sinh','#',1),(4,'Có nội thất phòng','#',1),(5,'Bãi để xe','#',1),(6,'Gác lửng','#',1),(7,'Nhà vệ sinh trong','#',1),(8,'Không chung chủ','#',1);
/*!40000 ALTER TABLE `tb_criterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_customer` (
  `CustomerId` bigint NOT NULL AUTO_INCREMENT,
  `Code` varchar(15) NOT NULL,
  `FullName` varchar(45) NOT NULL,
  `Avatar` varchar(45) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Gender` tinyint(1) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `AccountId` int NOT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `account_cus_idx` (`AccountId`),
  CONSTRAINT `account_cus` FOREIGN KEY (`AccountId`) REFERENCES `tb_account` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer`
--

LOCK TABLES `tb_customer` WRITE;
/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` VALUES (1,'040203013422','Nguyễn Văn Anh','/files_landlord/img/u5.jpg','2001-08-23',1,'0976576547',NULL,4),(2,'040302017653','Mai Thị Lựu','/files_landlord/img/u7.jpg','1999-12-21',0,'0764534367',NULL,4);
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_district`
--

DROP TABLE IF EXISTS `tb_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_district` (
  `DistrictId` int NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(250) NOT NULL,
  PRIMARY KEY (`DistrictId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_district`
--

LOCK TABLES `tb_district` WRITE;
/*!40000 ALTER TABLE `tb_district` DISABLE KEYS */;
INSERT INTO `tb_district` VALUES (1,'Thành phố Vinh');
/*!40000 ALTER TABLE `tb_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_invoice`
--

DROP TABLE IF EXISTS `tb_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_invoice` (
  `InvoiceId` bigint NOT NULL AUTO_INCREMENT,
  `ContractId` bigint NOT NULL,
  `RentalMonthId` bigint NOT NULL,
  `InvoiceDate` datetime NOT NULL,
  `TotalAmount` decimal(10,0) NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `invoice_contrac_idx` (`ContractId`),
  KEY `renter_month_invoice_idx` (`RentalMonthId`),
  CONSTRAINT `invoice_contrac` FOREIGN KEY (`ContractId`) REFERENCES `tb_contracts` (`ContractId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `renter_month_invoice` FOREIGN KEY (`RentalMonthId`) REFERENCES `tb_rental_month` (`RentalMonthId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_invoice`
--

LOCK TABLES `tb_invoice` WRITE;
/*!40000 ALTER TABLE `tb_invoice` DISABLE KEYS */;
INSERT INTO `tb_invoice` VALUES (1,1,1,'2024-09-30 00:43:17',4690000,1),(5,1,8,'2024-10-02 08:53:05',4680000,1);
/*!40000 ALTER TABLE `tb_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_menu` (
  `MenuId` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(250) NOT NULL,
  `Alias` varchar(250) DEFAULT NULL,
  `Levels` int NOT NULL,
  `ParentId` int NOT NULL,
  `Position` int NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MenuId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (8,'Trang chủ','Home',1,0,1,NULL,'2024-10-06 22:59:20','vanhoa123',1),(10,'Phòng trọ',NULL,1,0,2,NULL,'2024-10-06 23:15:05','vanhoa123',1),(11,'Bài viết','bai-viet',1,0,3,NULL,'2024-10-06 23:15:25','vanhoa123',1),(12,'Liên hệ','Contact',1,0,4,NULL,'2024-10-06 23:15:44','vanhoa123',1);
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post`
--

DROP TABLE IF EXISTS `tb_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_post` (
  `PostId` int NOT NULL AUTO_INCREMENT,
  `PostTitle` varchar(250) NOT NULL,
  `Alias` varchar(250) NOT NULL,
  `Abstract` text NOT NULL,
  `Content` text NOT NULL,
  `PostImage` varchar(250) DEFAULT NULL,
  `PostCategoryId` int NOT NULL,
  `AccountId` int NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`PostId`),
  KEY `tb_post_postcate_idx` (`PostCategoryId`),
  KEY `post_account_idx` (`AccountId`),
  CONSTRAINT `post_account` FOREIGN KEY (`AccountId`) REFERENCES `tb_account` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_post_postcate` FOREIGN KEY (`PostCategoryId`) REFERENCES `tb_post_categories` (`PostCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post`
--

LOCK TABLES `tb_post` WRITE;
/*!40000 ALTER TABLE `tb_post` DISABLE KEYS */;
INSERT INTO `tb_post` VALUES (1,'Vấn nạn an toàn phòng cháy chữa cháy tại các nhà trọ cho thuê','van-nan-an-toan-phong-chay-chua-chay-tai-cac-nha-tro-cho-thue','An toàn phòng cháy chữa cháy (PCCC) là vấn đề vô cùng quan trọng, đặc biệt là tại các khu vực nhà trọ tập trung đông người sinh sống. Do mật độ dân cư cao, cùng với ý thức và kiến thức về PCCC của một số người thuê trọ còn hạn chế, nguy cơ cháy nổ có thể xảy ra bất cứ lúc nào.','<h2 style=\"outline: 0px; line-height: 1.3;\"><span style=\"color: inherit; font-family: inherit; font-size: 1.75rem;\">1. Thực trạng PCCC tại các thành phố lớn</span><br></h2><p style=\"outline: 0px; line-height: 1.5;\">Tại các thành phố lớn như Hà Nội và TPHCM, hệ thống nhà trọ cho thuê phát triển nhanh chóng nhưng thiếu kiểm soát, dẫn đến nhiều bất cập về an toàn PCCC:</p><p style=\"outline: 0px; line-height: 1.5;\">- Nhiều nhà trọ được xây dựng chắp vá, cơi nới tùy tiện, không đảm bảo khoảng cách an toàn.</p><p style=\"outline: 0px; line-height: 1.5;\">- Hệ thống điện xuống cấp, chắp nối bừa bãi tiềm ẩn nguy cơ chập cháy.</p><p style=\"outline: 0px; line-height: 1.5;\">- Thiếu trang thiết bị PCCC cơ bản như bình chữa cháy, còi báo cháy.</p><p style=\"outline: 0px; line-height: 1.5;\">- Lối thoát hiểm bị bịt kín hoặc quá hẹp, không đảm bảo sơ tán khi có sự cố.</p><p style=\"outline: 0px; line-height: 1.5;\">Một trong những nguyên nhân chính dẫn đến tình trạng mất an toàn PCCC là nhận thức và ý thức của cả chủ phòng trọ lẫn người thuê còn hạn chế:</p><p style=\"outline: 0px; line-height: 1.5;\">- Nhiều chủ trọ chạy theo lợi nhuận, cắt giảm chi phí đầu tư cho hệ thống PCCC. Mặt khác, có những chủ trọ thiếu kiến thức về quy định PCCC và cách thức triển khai, nên không thường xuyên bảo trì, kiểm tra hệ thống PCCC.</p><p style=\"outline: 0px; line-height: 1.5;\">- Người thuê trọ chủ quan, coi nhẹ công tác PCCC. Điển hình là việc sử dụng điện, gas bừa bãi, không đúng quy cách. Bên cạnh đó, họ không nắm rõ cách sử dụng trang thiết bị PCCC và phương án thoát hiểm.</p><p style=\"outline: 0px; line-height: 1.5;\">Theo khảo sát tại 500 nhà trọ ở TP.HCM cho thấy chỉ 15% chủ phòng trọ nắm rõ các quy định về PCCC, trong khi đó tỷ lệ người thuê trọ biết cách sử dụng bình chữa cháy chỉ đạt 25%.</p><h3 style=\"outline: 0px; line-height: 1.3;\"><span style=\"outline-color: initial; outline-style: initial;\">2. Tai nạn cháy nổ tại các phòng trọ, nhà trọ</span></h3><p style=\"outline: 0px; line-height: 1.5;\">Mặc dù đã có nhiều nỗ lực, công tác kiểm tra, giám sát an toàn PCCC tại các phòng trọ cho thuê vẫn còn nhiều hạn chế. Chính vì thế, trong những năm gần đây đã xảy ra nhiều vụ cháy nhà trọ gây thiệt hại nghiêm trọng về người và tài sản. Theo thống kê từ Cục Cảnh sát PCCC và cứu nạn cứu hộ, trên toàn quốc đã xảy ra 2.222 vụ cháy trong nửa đầu năm 2024. Hậu quả từ những vụ cháy này khiến 57 người thiệt mạng, 45 người bị thương và thiệt hại về tài sản ước tính lên đến 127,9 tỷ đồng. Trong đó, 1.299/2.222 vụ cháy được điều tra nguyên nhân:</p><p style=\"outline: 0px; line-height: 1.5;\">- 72,9% do sự cố hệ thống, thiết bị điện .</p><p style=\"outline: 0px; line-height: 1.5;\">- 18,3% do sơ suất bất cẩn sử dụng nguồn lửa, nguồn nhiệt.</p><p style=\"outline: 0px; line-height: 1.5;\">- Các nguyên nhân khác đều chiếm tỷ lệ dưới 10%..</p><p style=\"outline: 0px; line-height: 1.5;\">Dưới đây là một số vụ cháy nổ nhà trọ điển hình:</p><p style=\"outline: 0px; line-height: 1.5;\">- Vụ cháy nhà trọ trong hẻm đường Tân Hòa Đông, quận Tân Bình, TPHCM khiến 1 người phụ nữ tử vong&nbsp;<span style=\"outline-color: initial; outline-style: initial;\">(9/6/2024)</span>.</p><p style=\"outline: 0px; line-height: 1.5;\">- Vào khoảng 20h ngày 10/7/2024, một vụ cháy đã xảy ra tại căn nhà trong hẻm 29 khu phố 10, phường Tân Chánh Hiệp, quận 12, TPHCM. Vụ cháy khiến nhiều người hoảng hốt, tháo chạy khỏi hiện trường.</p><p style=\"outline: 0px; line-height: 1.5;\">- Vào rạng sáng ngày 24/5/2024, một vụ hỏa hoạn đặc biệt nghiêm trọng đã xảy ra tại căn nhà trọ 5 tầng số 1, ngách 43/98/31 phố Trung Kính, phường Trung Hòa, quận Cầu Giấy, Hà Nội. Hậu quả thảm khốc của vụ cháy khiến 14 người thiệt mạng và 3 người khác bị thương nặng.</p>','/files_admin/post/quy-dinh-an-toan-phong-chay-chua-chay-tai-nha-tro-cho-thue_1720691139.jpg',2,1,'2024-10-08 23:22:12','vanhoa123',1),(5,'Đóng tiền thuê phòng trọ đầu tháng hay cuối tháng?','dong-tien-thue-phong-tro-dau-thang-hay-cuoi-thang','Theo quy định chung của pháp luật Việt Nam, không có quy định bắt buộc về thời điểm đóng tiền thuê phòng trọ.','<p style=\"outline: 0px; line-height: 1.5;\">Theo quy định chung của pháp luật Việt Nam, không có quy định bắt buộc về thời điểm đóng tiền thuê phòng trọ. Tuy nhiên,&nbsp;<span style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\">Điều 121 Luật nhà ở 2014</span>&nbsp;có quy định:&nbsp;</p><blockquote style=\"outline: 0px;\"><p style=\"outline: 0px; line-height: 1.5; padding-top: 0px;\"><span style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\"><span style=\"outline-color: initial; outline-style: initial;\">Điều 121.</span></span></p><p style=\"outline: 0px; line-height: 1.5;\"><span style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\">4. Thời hạn và phương thức thanh toán tiền nếu là trường hợp mua bán, cho thuê, cho thuê mua, chuyển nhượng hợp đồng mua bán nhà ở;</span><br style=\"outline: 0px;\"><span style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\">5. Thời gian giao nhận nhà ở; thời gian bảo hành nhà ở nếu là mua, thuê mua nhà ở được đầu tư xây dựng mới; thời hạn cho thuê, cho thuê mua, thế chấp, cho mượn, cho ở nhờ, ủy quyền quản lý nhà ở; thời hạn góp vốn;</span></p></blockquote><p style=\"outline: 0px; line-height: 1.5;\">Do đó, hai bên có thể tự do thỏa thuận về thời điểm đóng tiền trọ trong hợp đồng thuê&nbsp;phòng trọ&nbsp;dựa trên nhu cầu và điều kiện cụ thể của mỗi người. Thỏa thuận này cần được ghi rõ ràng, cụ thể và có giá trị pháp lý để tránh những tranh cãi phát sinh sau này. Về thời điểm đóng tiền trọ, bạn cần lưu ý các yếu tố này:</p><p style=\"outline: 0px; line-height: 1.5;\">- Thời điểm thanh toán: Đầu tháng, cuối tháng, hay ngày cụ thể trong tháng.</p><p style=\"outline: 0px; line-height: 1.5;\">- Hình thức thanh toán: Tiền mặt, chuyển khoản ngân hàng, hay phương thức khác.</p><p style=\"outline: 0px; line-height: 1.5;\">- Số tiền thanh toán: Bao gồm tiền thuê nhà chính và các khoản phí khác&nbsp;<span style=\"outline-color: initial; outline-style: initial;\">(nếu có)</span>.</p><p style=\"outline: 0px; line-height: 1.5;\">Theo điều tra thực tế của Phongtro123, thời điểm đóng tiền&nbsp;<a title=\"thuê phòng trọ\" href=\"https://phongtro123.com/cho-thue-phong-tro\" target=\"_blank\" style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\"><span style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\">thuê phòng trọ</span></a>&nbsp;phổ biến nhất tại TPHCM là vào đầu tháng. Việc đóng tiền thuê phòng trọ vào đầu tháng giúp người thuê dễ dàng ghi nhớ và sắp xếp các khoản chi tiêu trong tháng. Hơn nữa, hầu hết các chủ nhà đều muốn nhận tiền thuê phòng trọ vào đầu tháng để có thể trang trải các khoản chi phí liên quan đến việc cho thuê nhà như sửa chữa hoặc bảo dưỡng định kỳ.</p><p style=\"outline: 0px; line-height: 1.5;\">Tuy nhiên, cũng có trường hợp người thuê và chủ nhà thỏa thuận đóng tiền thuê phòng trọ vào cuối tháng. Cách thức này ít phổ biến hơn so với đóng tiền đầu tháng, nhưng cũng được áp dụng trong một số trường hợp. Việc đóng tiền cuối tháng thường phù hợp với những người có thu nhập không cố định hoặc mới nhận lương vào cuối tháng. Tuy nhiên, cần lưu ý rằng chủ nhà có thể yêu cầu người thuê trọ đóng tiền cọc để đảm bảo cam kết thanh toán đúng hạn.</p><p style=\"outline: 0px; line-height: 1.5;\">Ngoài ra, thời điểm đóng tiền thuê phòng trọ còn có thể thay đổi tùy theo thỏa thuận giữa chủ nhà và người thuê trọ. Ví dụ, hai bên có thể thống nhất đóng tiền vào ngày 5 hoặc ngày 15 hàng tháng. Điều quan trọng là cả hai bên đều đồng ý với thời điểm được lựa chọn và ghi rõ điều khoản này trong hợp đồng thuê nhà.</p>','/files_landlord/post/dong-tien-tro-dau-thang-hay-cuoi-thang_1720575516.jpg',4,4,'2024-10-08 20:58:54','A Hòa chủ trọ',1),(6,'Quy trình đăng ký tạm trú cho người thuê phòng trọ mới nhất','quy-trinh-dang-ky-tam-tru-cho-nguoi-thue-phong-tro-moi-nhat','Hiện nay, việc đăng ký tạm trú cho người thuê phòng trọ là một thủ tục quan trọng và cần thiết. Theo quy định của Luật Cư trú 2020, công dân đến sinh sống tại chỗ ở hợp pháp ngoài phạm vi đơn vị hành chính cấp xã nơi đã đăng ký thường trú để lao động, học tập hoặc vì mục đích khác từ 30 ngày trở lên thì phải thực hiện đăng ký tạm trú.','<h2 style=\"outline: 0px; line-height: 1.3;\">Đăng ký tạm trú là gì?</h2><p style=\"outline: 0px; line-height: 1.5;\">Tạm trú là nơi công dân sinh sống trong một khoảng thời gian nhất định ngoài nơi thường trú và đã được đăng ký tạm trú. Đăng ký tạm trú là việc công dân khai báo nơi sinh sống hiện tại của mình với cơ quan nhà nước có thẩm quyền. Đăng ký tạm trú chỉ thực hiện khi công dân đến sinh sống tại chỗ ở hợp pháp ngoài phạm vi đơn vị hành chính cấp xã nơi đã đăng ký thường trú, để lao động, học tập hoặc vì mục đích khác từ 30 ngày trở lên&nbsp;<span style=\"outline-color: initial; outline-style: initial;\">(Khoản 9 Điều 2 Luật cư trú năm 2020)</span>.</p><p style=\"outline: 0px; line-height: 1.5;\"><span style=\"outline: 0px; margin-top: 0px; padding-top: 0px;\">Đối tượng phải đăng ký tạm trú bao gồm</span>:</p><p style=\"outline: 0px; line-height: 1.5;\">- Công dân Việt Nam từ đủ 14 tuổi trở lên có chỗ ở hợp pháp ngoài phạm vi đơn vị hành chính cấp xã nơi đã đăng ký thường trú.</p><p style=\"outline: 0px; line-height: 1.5;\">- Người nước ngoài và người Việt Nam định cư ở nước ngoài tạm trú tại Việt Nam.</p><p style=\"outline: 0px; line-height: 1.5;\">Thời hạn đăng ký tạm trú là 30 ngày kể từ ngày đến sinh sống tại chỗ ở hợp pháp ngoài phạm vi đơn vị hành chính cấp xã nơi đã đăng ký thường trú.</p><p style=\"outline: 0px; line-height: 1.5;\">Mục đích khi đăng ký tạm trú giúp Nhà nước nắm được số lượng, phân bố dân cư trên từng địa bàn, từ đó có kế hoạch phát triển kinh tế - xã hội, an ninh - quốc phòng phù hợp. Cụ thể:</p><p style=\"outline: 0px; line-height: 1.5;\">- Giúp công dân được hưởng các quyền và lợi ích hợp pháp gắn liền với nơi cư trú, như: quyền học tập, quyền khám chữa bệnh, quyền bầu cử, quyền ứng cử, quyền tham gia các hoạt động xã hội,...</p><p style=\"outline: 0px; line-height: 1.5;\">- Giúp Nhà nước nắm được tình hình cư trú của công dân, từ đó có biện pháp phòng ngừa các hành vi vi phạm pháp luật, như: ma túy, mại dâm, trộm cắp,...</p><p style=\"outline: 0px; line-height: 1.5;\">- Là căn cứ để Nhà nước tổ chức thực hiện các chính sách, chế độ đối với công dân, như: cấp, đổi, cấp lại thẻ căn cước công dân, thẻ bảo hiểm y tế,...</p>','/files_landlord/post/dang-ky-tam-tru-cho-nguoi-thue-phong-tro_1705647964.jpg',4,4,'2024-10-08 21:02:59','A Hòa chủ trọ',1);
/*!40000 ALTER TABLE `tb_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post_categories`
--

DROP TABLE IF EXISTS `tb_post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_post_categories` (
  `PostCategoryId` int NOT NULL AUTO_INCREMENT,
  `PostCategoryName` varchar(250) NOT NULL,
  `Alias` varchar(250) NOT NULL,
  `Position` int DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`PostCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post_categories`
--

LOCK TABLES `tb_post_categories` WRITE;
/*!40000 ALTER TABLE `tb_post_categories` DISABLE KEYS */;
INSERT INTO `tb_post_categories` VALUES (2,'Nhà trọ bình dân','nha-tro-binh-dan',1,NULL,'2024-09-20 11:55:16','vanhoa123',1),(4,'Cẩm nang thuê trọ','cam-nang-thue-tro',2,NULL,'2024-10-08 20:52:38','vanhoa123',1);
/*!40000 ALTER TABLE `tb_post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_post_comment`
--

DROP TABLE IF EXISTS `tb_post_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_post_comment` (
  `PostCommentId` int NOT NULL AUTO_INCREMENT,
  `AccountId` int NOT NULL,
  `PostId` int NOT NULL,
  `Content` text NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`PostCommentId`),
  KEY `postcmt_post_idx` (`PostId`),
  KEY `postaccount_post_idx` (`AccountId`),
  CONSTRAINT `postaccount_post` FOREIGN KEY (`AccountId`) REFERENCES `tb_account` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `postcmt_post` FOREIGN KEY (`PostId`) REFERENCES `tb_post` (`PostId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_post_comment`
--

LOCK TABLES `tb_post_comment` WRITE;
/*!40000 ALTER TABLE `tb_post_comment` DISABLE KEYS */;
INSERT INTO `tb_post_comment` VALUES (1,2,5,'Bài viết rất hữu ích cho 1 like','2024-10-08 00:00:00',1),(2,2,5,'Theo quy định chung của pháp luật Việt Nam, không có quy định bắt buộc về thời điểm đóng tiền thuê phòng trọ.','2024-10-08 23:11:29',1),(3,2,6,'Tạm trú là nơi công dân sinh sống trong một khoảng thời gian nhất định ngoài nơi thường trú và đã được đăng ký tạm trú','2024-10-08 23:16:53',1),(4,2,1,'An toàn phòng cháy chữa cháy là vấn đề vô cùng quan trọng, đặc biệt là tại các khu vực nhà trọ tập trung đông người sinh sống','2024-10-08 23:20:06',1);
/*!40000 ALTER TABLE `tb_post_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rental_month`
--

DROP TABLE IF EXISTS `tb_rental_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rental_month` (
  `RentalMonthId` bigint NOT NULL AUTO_INCREMENT,
  `ContractId` bigint NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `PriceRoom` decimal(10,0) NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`RentalMonthId`),
  KEY `rental_idx` (`ContractId`),
  CONSTRAINT `rental` FOREIGN KEY (`ContractId`) REFERENCES `tb_contracts` (`ContractId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rental_month`
--

LOCK TABLES `tb_rental_month` WRITE;
/*!40000 ALTER TABLE `tb_rental_month` DISABLE KEYS */;
INSERT INTO `tb_rental_month` VALUES (1,1,'2024-09-24 00:00:00','2024-10-23 00:00:00',4500000,2),(8,1,'2024-10-24 00:00:00','2024-11-23 00:00:00',4500000,2),(9,2,'2024-10-02 21:34:41','2024-11-01 21:34:41',2500000,1);
/*!40000 ALTER TABLE `tb_rental_month` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `RoleId` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'Admin','Quản trị viên'),(2,'Landlord','Chủ trọ'),(3,'Customer','Khách hàng'),(4,'RLandlord','Chờ đăng ký chủ trọ');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room`
--

DROP TABLE IF EXISTS `tb_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room` (
  `RoomId` bigint NOT NULL AUTO_INCREMENT,
  `RoomName` varchar(250) NOT NULL,
  `RoomCategoryId` int NOT NULL,
  `RoomStatusId` int NOT NULL,
  `WardId` int NOT NULL,
  `AccountId` int NOT NULL,
  `Abstract` text NOT NULL,
  `Content` text NOT NULL,
  `Image` varchar(250) NOT NULL,
  `Acreage` int NOT NULL,
  `PriceRoom` decimal(10,0) NOT NULL,
  `MaxPeople` int NOT NULL,
  `Address` varchar(350) NOT NULL,
  `ViewCount` bigint NOT NULL,
  `Alias` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RoomId`),
  KEY `room_categories_idx` (`RoomCategoryId`),
  KEY `room_status_idx` (`RoomStatusId`),
  KEY `room_ward_idx` (`WardId`),
  KEY `room_account_idx` (`AccountId`),
  CONSTRAINT `room_account` FOREIGN KEY (`AccountId`) REFERENCES `tb_account` (`AccountId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_categories` FOREIGN KEY (`RoomCategoryId`) REFERENCES `tb_room_categories` (`RoomCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_status` FOREIGN KEY (`RoomStatusId`) REFERENCES `tb_room_status` (`RoomStatusId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_ward` FOREIGN KEY (`WardId`) REFERENCES `tb_ward` (`WardId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room`
--

LOCK TABLES `tb_room` WRITE;
/*!40000 ALTER TABLE `tb_room` DISABLE KEYS */;
INSERT INTO `tb_room` VALUES (1,'Trọ ở ghép số 30 Phong Định Cảng',1,1,12,4,'Anh Võ Văn Hòa, SĐT: 0349191354 Cho thuê phòng trọ số 30 Phong Định Cảng - TP.Vinh - Nghệ An giá 3 triệu/tháng, diện tích: 20m2.','<p style=\"outline: 0px;\">Diện tích: 90m2, mặt tiền 6m, lô góc 2 thoáng, thông 4 chỗ</p><p style=\"outline: 0px;\">Nhà chủ tự xây cực chắc chắn, đầy đủ GPXD, PCCC</p><p style=\"outline: 0px;\">Tầng 1: Gara, tháng máy, thang bộ,WC</p><p style=\"outline: 0px;\">Tầng 2: 2 căn hộ khép kín</p><p style=\"outline: 0px;\">Tầng 3 đến 7: Mỗi tầng 1 căn hộ</p><p style=\"outline: 0px;\">Tầng 8: 3 tầng hiện làm văn phòng</p><p style=\"outline: 0px;\">Tầng 9: Tum</p><p style=\"outline: 0px;\">Tổng 20 phòng</p><p style=\"outline: 0px;\">Giá: 21 tỷ, sổ đỏ chính chủ sang tên 1 nốt nhạc</p>','/files_landlord/room/tro1.webp',50,4500000,4,'Số 30 Phong Định Cảng ',1,'tro-o-ghep-so-30-phong-dinh-cang','2024-10-14 19:24:10','A Hòa chủ trọ'),(2,'Trọ Số 295 Hồng Bàng Lê Mao',2,3,10,4,'Anh Võ Văn Hòa, SĐT: 0349191354 Cho thuê phòng trọ 295b Hồng Bàng - Lê Mao - TP.Vinh - Nghệ An giá 3 triệu/tháng, diện tích: 20m2.','<p>Diện tích: 150m(5x30) sổ hồng riêng chính chủ.<br></p><p style=\"outline: 0px;\">- Giá bán: 1 tỷ 650/ triệu / dãy 150m2 (bớt lộc).</p><p style=\"outline: 0px;\">- Nhà xây dựng kiên cố gồm 1 căn nhà trệt lửng bên trước kèm 4 phòng trọ.</p><p style=\"outline: 0px;\">- Mặt tiền hiện tại đang cho thuê ở kinh doanh tạp hóa tháng 3,5 triệu, phòng trọ 1,2 triệu/tháng.</p><p style=\"outline: 0px;\">- Kinh doanh ổn định thu nhập hơn 8 triệu mỗi tháng.</p><p style=\"outline: 0px;\">- Vị trí nhà cách cao tốc Mỹ Phước Tân Vạn 200m, gần chợ tự phát, gần trường học, kế bên khu công nghiệp Mỹ Phước 2,3.</p><p style=\"outline: 0px;\">- Qúy anh chị có nhu cầu xem nhà liên hệ em Vương : 0949.082.381 để đi xem trọ</p>','/files_landlord/room/20240821144021-f36f_wm.jpg',20,2500000,3,'295b Hồng Bàng - Lê Mao - Tp.Vinh',0,'tro-so-295-hong-bang-le-mao','2024-10-14 19:22:40','A Hòa chủ trọ'),(4,'Trọ sinh viên Phường Trung Đô',1,1,2,4,'Anh Võ Văn Hòa, SĐT: 0349191354 Cho thuê phòng trọ Phường Trung Đô - TP.Vinh - Nghệ An giá 3,5 triệu/tháng, diện tích: 25m2.','<p>Diện tích: 25m².<br style=\"-webkit-tap-highlight-color: transparent;\">Vị trí:<br style=\"-webkit-tap-highlight-color: transparent;\">- Gần đại học Vinh<br style=\"-webkit-tap-highlight-color: transparent;\">- Thuận tiện di chuyển cho sinh viên đi học.<br style=\"-webkit-tap-highlight-color: transparent;\">- Khu vực gần chợ, siêu thị, cửa hàng tiện lợi, bhx.<br style=\"-webkit-tap-highlight-color: transparent;\">Tiện ích toà nhà:<br style=\"-webkit-tap-highlight-color: transparent;\">- Căn hộ đầy đủ nội thất.<br style=\"-webkit-tap-highlight-color: transparent;\">- Camera an ninh 24/7.<br style=\"-webkit-tap-highlight-color: transparent;\">- Không chung chủ.<br style=\"-webkit-tap-highlight-color: transparent;\">- Giờ giấc tự do.<br style=\"-webkit-tap-highlight-color: transparent;\"><br style=\"-webkit-tap-highlight-color: transparent;\">Tiện ích phòng:<br style=\"-webkit-tap-highlight-color: transparent;\">- Nhà mới, nội thất mới 100%.<br style=\"-webkit-tap-highlight-color: transparent;\">- Studio full cửa sổ trời.<br style=\"-webkit-tap-highlight-color: transparent;\">- Nội thất: Máy lạnh, tủ lạnh, tủ quần áo, kệ, máy nước nóng lạnh, giường, nệm, bàn ghế, bếp điện.<br style=\"-webkit-tap-highlight-color: transparent;\">- Có máy giặt riêng.<br style=\"-webkit-tap-highlight-color: transparent;\">Nhận tìm phòng / căn hộ theo nhu cầu của khách hàng, hỗ trợ tìm phòng theo yêu cầu của khách hàng về đặc sản căn hộ và vị trí đường mà khách hàng mong muốn.<br style=\"-webkit-tap-highlight-color: transparent;\">Trợ giúp tìm kiếm phòng (miễn phí).<br></p>','/files_landlord/room/20241001003316-8d40_wm.jpg',25,3500000,3,'25 - Phường Trung Đô - TP.Vinh - Nghệ An',2,'tro-sinh-vien-phuong-trung-do','2024-10-14 19:22:06','A Hòa chủ trọ'),(5,'Căn hộ Số 30 Hà Huy Tập TP Vinh',3,1,6,4,'Anh Võ Văn Hòa, SĐT: 0349191354 Cho thuê phòng trọ giá rẻ tại số 30 Hà Huy Tập - Tp.Vinh - Nghệ An, diện tích: 30m2, thiết kế: 2PN- 2WC.','<p style=\"outline: 0px;\">Căn hộ cho thuê với giá 13,5 triệu VND tại Phố Tạ Quang Bửu, Phường 5, Quận 8, Hồ Chí Minh, thuộc dự án Chánh Hưng Giai Việt, diện tích 115m², có 2 phòng ngủ.</p><p style=\"outline: 0px;\">Đặc điểm nổi bật</p><p style=\"outline: 0px;\">Pháp lý rõ ràng với sổ đỏ, sổ hồng, giúp đảm bảo quyền lợi cho người thuê. Đây là một yếu tố quan trọng khi tìm kiếm căn hộ.</p><p style=\"outline: 0px;\">Nội thất đầy đủ, giúp tiết kiệm thời gian và chi phí cho việc trang trí. Chỉ cần xách vali vào ở ngay.</p><p style=\"outline: 0px;\">Giá thuê 13,5 triệu VND, phù hợp với nhiều đối tượng khách hàng, từ sinh viên đến gia đình.</p><p style=\"outline: 0px;\">Diện tích 115m², không gian rộng rãi cho sinh hoạt thoải mái. Phù hợp cho những ai yêu thích sự thoáng đãng.</p><p style=\"outline: 0px;\">Có 2 phòng ngủ và 2 toilet, rất thuận tiện cho gia đình hoặc nhóm bạn sống chung.</p><p style=\"outline: 0px;\">Căn hộ nằm trong khu vực yên tĩnh, lý tưởng cho những ai muốn tìm một chốn an cư.</p><p style=\"outline: 0px;\">Gần các tiện ích cần thiết như chợ, siêu thị, giúp cuộc sống hàng ngày trở nên dễ dàng hơn.</p>','/files_landlord/room/tro30hht/20240919124948-7e6a_wm.jpg',30,5000000,3,'30 Hà Huy Tập - TP.Vinh - Nghệ An',8,'can-ho-so-30-ha-huy-tap-tp-vinh','2024-10-14 19:19:30','A Hòa chủ trọ'),(6,'Phòng trọ Đường Cù Chính Lan (gần Đại học Vinh)',2,1,12,4,'Anh Võ Văn Hòa, SĐT: 0349191354 Cho thuê phòng trọ 270 Đường Cù Chính Lan - TP.Vinh - Nghệ An giá 3 triệu/tháng, diện tích: 25m2.','<p style=\"outline: 0px;\">Phòng tuyệt đẹp tại trung tâm Quận 10, hẻm rộng rãi thông ra Lê Hồng Phong và Lý Thái Tổ</p><p style=\"outline: 0px;\">️- Nhà đẹp, hẻm rộng an ninh sạch sẽ</p><p style=\"outline: 0px;\">️- Bãi đậu xe rộng rãi an toàn</p><p style=\"outline: 0px;\">-Quạt trần sang trọng mát mẻ</p><p style=\"outline: 0px;\">️- WC sạch đẹp, sang trọng</p><p style=\"outline: 0px;\">️- Nước tắm nóng lạnh NLMT</p><p style=\"outline: 0px;\">️- Full nội thất và tiện ích: giường, tủ, bàn ghế, bếp, máy lạnh, tủ lạnh…</p><p style=\"outline: 0px;\">️- Máy giặt, máy sấy hiện đại</p><p style=\"outline: 0px;\">️Kế bên chợ hoa và Phố ẩm thực Hồ Thị Kỷ, bán kính 500m ko thiếu thứ gì</p><p style=\"outline: 0px;\">- Giá phòng: 4.0T/1ng</p><p style=\"outline: 0px;\">LH chính chủ: a. Manh 0909610581</p><p style=\"outline: 0px;\">Hân hạnh chào đón các bạn.</p>','/files_landlord/room/cuchinhlan/20240912172040-e1f0_wm.jpg',25,3000000,3,'270 Cù Chính Lan - Vinh - Nghệ An',6,'phong-tro-duong-cu-chinh-lan-gan-dai-hoc-vinh','2024-10-14 18:09:46','A Hòa chủ trọ'),(7,'Trọ gác bancol xây mới 100%',2,1,9,5,'76 Lê Lợi - Vinh - Nghệ An','<p style=\"outline: 0px; line-height: 1.5;\">Cách CV Hoàng Văn Thụ 150m</p><p style=\"outline: 0px; line-height: 1.5;\">Cách ĐH Tài Chính Marketing 300m</p><p style=\"outline: 0px; line-height: 1.5;\">Diện tích 20m2</p><p style=\"outline: 0px; line-height: 1.5;\">Mức giá: 3tr7</p><p style=\"outline: 0px; line-height: 1.5;\">Địa chỉ: Phạm Cự Lượng, P2, Tân Bình.</p><p style=\"outline: 0px; line-height: 1.5;\">Mô tả:</p><p style=\"outline: 0px; line-height: 1.5;\">- Có máy lạnh</p><p style=\"outline: 0px; line-height: 1.5;\">- Có kệ bếp và tủ bếp</p><p style=\"outline: 0px; line-height: 1.5;\">- Có gác</p><p style=\"outline: 0px; line-height: 1.5;\">- Toilet riêng</p><p style=\"outline: 0px; line-height: 1.5;\">- Có một bàn ăn 2 ghế.</p><p style=\"outline: 0px; line-height: 1.5;\">Ngoài ra còn có thang máy, hầm giữ xe, camera, quản lí và bảo vệ 24/7.</p><p style=\"outline: 0px; line-height: 1.5;\">Ra vào bằng cửa khóa vân tay.</p><p style=\"outline: 0px; line-height: 1.5;\">Điện 4k/ 1 kw</p><p style=\"outline: 0px; line-height: 1.5;\">Nước 100k 1 người / tháng</p><p style=\"outline: 0px; line-height: 1.5;\">Gửi xe máy (xe số 150k 1chiếc / tháng,xe tay ga 200k 1 chiếc / tháng)</p><p style=\"outline: 0px; line-height: 1.5;\">dịch vụ 100k 1 người / tháng</p><p style=\"outline: 0px; line-height: 1.5;\">wifi 100k 1 phòng / tháng</p><p style=\"outline: 0px; line-height: 1.5;\">Anh chị liên hệ Phòng trọ Be Home để xem phòng nhé.</p>','/files_landlord/room/leloi/20240925132628-8414_wm.jpg',20,2000000,2,'76 Lê Lợi - Vinh - Nghệ An',5,'tro-gac-bancol-xay-moi-100','2024-10-14 19:33:09','Trần Văn Hoàng'),(8,'Phòng cho thuê cao cấp, an ninh, giờ giấc tự do',3,1,10,5,'Bạn đang xem nội dung tin đăng: \"GẦN TRƯỜNG GTVT, NGOẠI THƯƠNG, HUTECH, HỒNG BÀNG, UEF - AN NINH, TIỆN NGHI - TT Q.BÌNH THẠNH ĐƯỜNG UNG VĂN KHIÊM - Mã tin: 649687\". ','<p style=\"outline: 0px; line-height: 1.5;\">&nbsp;Để đảm bảo an ninh cho Sinh Viên ở Ngõ Sen giờ hoạt động từ 6h - 24h (không có giờ tự do), ra vào cổng bằng khóa vân tay.</p><p style=\"outline: 0px; line-height: 1.5;\">- Đ/c: Ngõ Sen 97/15, Ung Văn Khiêm, Phường 25, Bình Thạnh (vào hẻm 97 Ung Văn Khiêm chạy thẳng là gặp Ngõ Sen)</p><p style=\"outline: 0px; line-height: 1.5;\">- Vị trí rất thuận tiện, gần các trường ĐH GTVT (cách 600m đi bộ 8\', đi xe 2\'), ĐH Ngoại Thương (cách 800m đi bộ 10\', đi xe 3\'), ĐH Hutech, ĐH Quốc tế Hồng Bàng, Landmark 81...</p><p style=\"outline: 0px; line-height: 1.5;\">- Tiện ích xung quanh đầy đủ: chợ, cửa hàng tiện lợi, cây xăng, ATM, quán xá,...</p><p style=\"outline: 0px; line-height: 1.5;\">- Hẻm xe hơi, khuôn viên rộng rãi thoáng mát.</p><p style=\"outline: 0px; line-height: 1.5;\">- Hệ thống PCCC, an ninh đầy đủ.</p><p style=\"outline: 0px; line-height: 1.5;\">- Thích hợp cho sinh viên và NVVP.</p>','/files_landlord/room/lemao/20240824113246-a92b_wm.jpg',16,4000000,2,'56 Lê Mao - Vinh - Nghệ An',2,'phong-cho-thue-cao-cap-an-ninh-gio-giac-tu-do','2024-10-14 19:32:07','Trần Văn Hoàng'),(9,'Cho thuê phòng tại Nguyễn Huy Oánh Bến Thủy',2,1,3,5,'Anh/chị NGUYỄN MẠNH TUẤN SĐT: 0979049334 Bán nhà trọ Đường Thiên Hiền, Phường Mỹ Đình 1, Nam Từ Liêm, Hà Nội giá 14.5 tỷ, diện tích: 59m2.','<p style=\"outline: 0px;\">Tòa CCMN Mỹ Đình 59m2 9 Tầng 21 Phòng khép kín cho thuê, trước nhà 4m, nhà mới tinh, chủ đầu tư uy tín</p><p style=\"outline: 0px;\">Vị trí: thuộc phường Mỹ Đình 1 TT Quận Nam Từ Liêm, ngay sát trường cấp 3 mỹ Đình, cách bến xe mỹ đình 300m. 1km các trường đại học lớn Quốc Gia, Sư Phạm, Thương Mại, Báo Chí…</p><p style=\"outline: 0px;\">Thiết kế: Chủ đầu tư uy tín có kinh nghiệm nhiều năm xây dựng Bất động sản cho thuê, nhà được thiết kế Tầng 3 Phòng thiết kế rất hợp lý, tầng 9 sân phơi</p><p style=\"outline: 0px;\">Thị trường cho thuê tại khu vực luon nóng, khách tìm thuê nhiều, giá thuê luon cao 4 đến 5 tr 1 phòng</p><p style=\"outline: 0px;\">Pháp lý nhà chuẩn, sổ vuông đẹp sẵn giao dịch.</p><p style=\"outline: 0px;\">Lh tư vấn BĐS Dòng tiền: 0979049334 Các Quận Hà Nội</p>','/files_landlord/room/nghuyoanh/20241003132342-9437_wm.jpg',25,3000000,3,'25 Nguyễn Huy Oánh - Bến Thủy - Vinh - Nghệ An',1,'cho-thue-phong-tai-nguyen-huy-oanh-ben-thuy','2024-10-14 19:31:12','Trần Văn Hoàng');
/*!40000 ALTER TABLE `tb_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_categories`
--

DROP TABLE IF EXISTS `tb_room_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room_categories` (
  `RoomCategoryId` int NOT NULL AUTO_INCREMENT,
  `RoomCategoryName` varchar(250) NOT NULL,
  `Alias` varchar(250) NOT NULL,
  `Image` varchar(250) NOT NULL,
  `Position` int NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `IsActive` tinyint NOT NULL,
  PRIMARY KEY (`RoomCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_categories`
--

LOCK TABLES `tb_room_categories` WRITE;
/*!40000 ALTER TABLE `tb_room_categories` DISABLE KEYS */;
INSERT INTO `tb_room_categories` VALUES (1,'Chung cư','chung-cu','/files_admin/Room/Categories/chungcu.webp',1,NULL,'2024-09-22 21:22:11','vanhoa123',1),(2,'Phòng trọ','phong-tro','/files_admin/Room/Categories/cate-tro.jpg',2,NULL,'2024-10-25 22:48:16','vanhoa123',1),(3,'Nhà ở','nha-o','/files_admin/Room/Categories/nhao.webp',3,NULL,'2024-09-24 19:59:02','vanhoa123',1);
/*!40000 ALTER TABLE `tb_room_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_criterias`
--

DROP TABLE IF EXISTS `tb_room_criterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room_criterias` (
  `RoomCriteriaId` bigint NOT NULL AUTO_INCREMENT,
  `RoomId` bigint NOT NULL,
  `CriteriaId` int NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`RoomCriteriaId`),
  KEY `room_criterias_idx` (`RoomId`),
  KEY `critrias_s_idx` (`CriteriaId`),
  CONSTRAINT `critrias_s` FOREIGN KEY (`CriteriaId`) REFERENCES `tb_criterias` (`CriteriaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_criterias` FOREIGN KEY (`RoomId`) REFERENCES `tb_room` (`RoomId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_criterias`
--

LOCK TABLES `tb_room_criterias` WRITE;
/*!40000 ALTER TABLE `tb_room_criterias` DISABLE KEYS */;
INSERT INTO `tb_room_criterias` VALUES (2,2,4,NULL,1),(3,2,6,NULL,1),(5,1,3,NULL,1),(6,1,6,NULL,1),(7,2,3,NULL,1);
/*!40000 ALTER TABLE `tb_room_criterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_customer`
--

DROP TABLE IF EXISTS `tb_room_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room_customer` (
  `RoomCustomerId` bigint NOT NULL AUTO_INCREMENT,
  `RoomId` bigint NOT NULL,
  `CustomerId` bigint NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`RoomCustomerId`),
  KEY `room_customer_idx` (`RoomId`),
  KEY `room_cus_idx` (`CustomerId`),
  CONSTRAINT `room_cus` FOREIGN KEY (`CustomerId`) REFERENCES `tb_customer` (`CustomerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_customer` FOREIGN KEY (`RoomId`) REFERENCES `tb_room` (`RoomId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_customer`
--

LOCK TABLES `tb_room_customer` WRITE;
/*!40000 ALTER TABLE `tb_room_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_room_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_images`
--

DROP TABLE IF EXISTS `tb_room_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room_images` (
  `RoomImageId` int NOT NULL AUTO_INCREMENT,
  `RoomId` bigint NOT NULL,
  `Image` varchar(250) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`RoomImageId`),
  KEY `room_image_idx` (`RoomId`),
  CONSTRAINT `room_image` FOREIGN KEY (`RoomId`) REFERENCES `tb_room` (`RoomId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_images`
--

LOCK TABLES `tb_room_images` WRITE;
/*!40000 ALTER TABLE `tb_room_images` DISABLE KEYS */;
INSERT INTO `tb_room_images` VALUES (2,2,'/files_landlord/room/20240821144021-8b98_wm.jpg',NULL,1),(3,2,'/files_landlord/room/20240821144022-fadb_wm.jpg',NULL,1),(4,2,'/files_landlord/room/20240821144021-8b98_wm.jpg',NULL,1),(5,2,'/files_landlord/room/20240821144021-5770_wm.jpg',NULL,1),(6,2,'/files_landlord/room/20240821144021-f14c_wm.jpg',NULL,1),(7,4,'/files_landlord/room/20241001003354-a328_wm.jpg',NULL,1),(8,4,'/files_landlord/room/20241001003429-4dce_wm.jpg',NULL,1),(9,4,'/files_landlord/room/20241001003532-8d4e_wm.jpg',NULL,1),(11,6,'/files_landlord/imgg/img/property-1/property3.jpg',NULL,1),(12,6,'/files_landlord/imgg/img/property-1/property2.jpg',NULL,1),(13,6,'/files_landlord/imgg/img/property-1/property1.jpg',NULL,1),(14,6,'/files_landlord/imgg/img/property-1/property4.jpg',NULL,1),(15,7,'/files_landlord/room/leloi/20240925132628-8414_wm.jpg',NULL,1),(16,7,'/files_landlord/room/leloi/20240925132704-25df_wm.jpg',NULL,1),(17,7,'/files_landlord/room/leloi/20240925132705-ef5a_wm.jpg',NULL,1),(18,7,'/files_landlord/room/leloi/20240925132708-1848_wm.jpg',NULL,1),(19,7,'/files_landlord/room/leloi/20240925132710-c2e3_wm.jpg',NULL,1),(20,8,'/files_landlord/room/lemao/20240824113245-8abc_wm.jpg',NULL,1),(21,8,'/files_landlord/room/lemao/20240824113245-784d_wm.jpg',NULL,1),(22,8,'/files_landlord/room/lemao/20240824113245-2367_wm.jpg',NULL,1),(23,8,'/files_landlord/room/lemao/20240824113246-a92b_wm.jpg',NULL,1),(24,8,'/files_landlord/room/lemao/20241005112454-cb87_wm.jpg',NULL,1),(25,8,'/files_landlord/room/lemao/20241005112454-fd5c_wm.jpg',NULL,1),(26,9,'/files_landlord/room/nghuyoanh/20241003132342-4a38_wm.jpg',NULL,1),(27,9,'/files_landlord/room/nghuyoanh/20241003132342-6a6b_wm.jpg',NULL,1),(28,9,'/files_landlord/room/nghuyoanh/20241003132342-952e_wm.jpg',NULL,1),(29,9,'/files_landlord/room/nghuyoanh/20241003132342-9437_wm.jpg',NULL,1),(30,9,'/files_landlord/room/nghuyoanh/20241003132342-be55_wm.jpg',NULL,1),(31,5,'/files_landlord/imgg/img/demo/property-1.jpg',NULL,1),(32,5,'/files_landlord/imgg/img/demo/property-5.jpg',NULL,1);
/*!40000 ALTER TABLE `tb_room_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_services`
--

DROP TABLE IF EXISTS `tb_room_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room_services` (
  `RoomServiceId` bigint NOT NULL AUTO_INCREMENT,
  `RoomId` bigint NOT NULL,
  `ServiceId` int NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`RoomServiceId`),
  KEY `room_services_idx` (`RoomId`),
  KEY `services_idx` (`ServiceId`),
  CONSTRAINT `room_services` FOREIGN KEY (`RoomId`) REFERENCES `tb_room` (`RoomId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `services` FOREIGN KEY (`ServiceId`) REFERENCES `tb_services` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_services`
--

LOCK TABLES `tb_room_services` WRITE;
/*!40000 ALTER TABLE `tb_room_services` DISABLE KEYS */;
INSERT INTO `tb_room_services` VALUES (1,1,1,2000,1),(2,2,1,2000,1),(4,1,3,3000,1),(5,1,6,50000,1),(6,2,3,3000,1),(7,2,6,50000,1);
/*!40000 ALTER TABLE `tb_room_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_room_status`
--

DROP TABLE IF EXISTS `tb_room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_room_status` (
  `RoomStatusId` int NOT NULL AUTO_INCREMENT,
  `RoomStatusName` varchar(45) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`RoomStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_room_status`
--

LOCK TABLES `tb_room_status` WRITE;
/*!40000 ALTER TABLE `tb_room_status` DISABLE KEYS */;
INSERT INTO `tb_room_status` VALUES (1,'Còn trống','#',1),(3,'Đang cho thuê','#',1),(4,'Đang sửa chữa','#',1);
/*!40000 ALTER TABLE `tb_room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_services`
--

DROP TABLE IF EXISTS `tb_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_services` (
  `ServiceId` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(45) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`ServiceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_services`
--

LOCK TABLES `tb_services` WRITE;
/*!40000 ALTER TABLE `tb_services` DISABLE KEYS */;
INSERT INTO `tb_services` VALUES (1,'Điện dân dụng','Dịch vụ điện dân dụng ',1),(3,'Nước sinh hoạt','Nước sinh hoạt phòng trọ',1),(5,'Gửi xe','Có chỗ để xe',1),(6,'Internet','Có mạng wifi',1);
/*!40000 ALTER TABLE `tb_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sliders`
--

DROP TABLE IF EXISTS `tb_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sliders` (
  `SliderId` int NOT NULL AUTO_INCREMENT,
  `SliderName` varchar(250) NOT NULL,
  `Alias` varchar(250) NOT NULL,
  `Position` int NOT NULL,
  `Image` varchar(250) NOT NULL,
  `Content` text,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(45) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`SliderId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sliders`
--

LOCK TABLES `tb_sliders` WRITE;
/*!40000 ALTER TABLE `tb_sliders` DISABLE KEYS */;
INSERT INTO `tb_sliders` VALUES (2,'Đa tính năng - Tăng hiệu quả','/Home',1,'/files_admin/slider/1.jpg',NULL,'2024-10-07 21:15:52','vanhoa123',1),(3,'Hình sao phòng vậy - Uy tín hàng đầu','/Home',2,'/files_admin/slider/slider-image-2.jpg',NULL,'2024-10-07 21:16:40','vanhoa123',1),(4,'Chi ít lợi nhiều','/Home',3,'/files_admin/slider/slider-image-4.jpg',NULL,'2024-10-07 21:18:03','vanhoa123',1);
/*!40000 ALTER TABLE `tb_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ward`
--

DROP TABLE IF EXISTS `tb_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ward` (
  `WardId` int NOT NULL AUTO_INCREMENT,
  `WardName` varchar(250) NOT NULL,
  `DistrictId` int NOT NULL,
  PRIMARY KEY (`WardId`),
  KEY `di_ward_idx` (`DistrictId`),
  CONSTRAINT `di_ward` FOREIGN KEY (`DistrictId`) REFERENCES `tb_district` (`DistrictId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ward`
--

LOCK TABLES `tb_ward` WRITE;
/*!40000 ALTER TABLE `tb_ward` DISABLE KEYS */;
INSERT INTO `tb_ward` VALUES (1,'Phường Hồng Sơn',1),(2,'Phường Trung Đô',1),(3,'Phường Bến Thủy',1),(4,'Phường Cửa Nam',1),(5,'Phường Đông Vĩnh',1),(6,'Phường Hà Huy Tập',1),(7,'Phường Hưng Bình',1),(8,'Phường Hưng Dũng',1),(9,'Phường Lê Lợi',1),(10,'Phường Lê Mao',1),(11,'Phường Quán Bàu',1),(12,'Phường Trường Thi',1),(13,'Phường Vinh Tân',1),(14,'Xã Hưng Chính',1),(15,'Xã Hưng Đông',1),(16,'Xã Hưng Hòa',1),(17,'Xã Nghi Ân',1),(18,'Xã Nghi Đức',1),(19,'Xã Nghi Kim',1),(20,'Xã Nghi Liên',1),(21,'Xã Nghi Phú',1);
/*!40000 ALTER TABLE `tb_ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 17:37:34
