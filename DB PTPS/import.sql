/*
 Navicat Premium Data Transfer

 Source Server         : localhost-xampp
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : localhost:3306
 Source Schema         : patops

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : 65001

 Date: 03/01/2022 14:36:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for import
-- ----------------------------
DROP TABLE IF EXISTS `import`;
CREATE TABLE `import` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_number` varchar(32) NOT NULL,
  `doc_date` date NOT NULL,
  `year_increment` int(4) DEFAULT NULL,
  `number_increment` int(4) DEFAULT NULL,
  `identity_type` enum('1','2','3') NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `passport` varchar(64) NOT NULL,
  `periode` int(8) NOT NULL,
  `return_type` enum('1','2','3') NOT NULL,
  `airport_in` int(11) NOT NULL,
  `airport_out` int(11) NOT NULL,
  `inv_number` varchar(32) NOT NULL,
  `inv_date` date NOT NULL,
  `carrier_info` varchar(128) NOT NULL,
  `status` enum('1','2','3') NOT NULL,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `officer_nip` varchar(32) NOT NULL,
  `officer_name` varchar(128) NOT NULL,
  `inv_date_out` date NOT NULL,
  `re_office` int(11) DEFAULT NULL,
  `re_date` date DEFAULT NULL,
  `re_doc_number` varchar(32) DEFAULT NULL,
  `re_name` varchar(128) DEFAULT NULL,
  `re_notes` varchar(255) DEFAULT NULL,
  `re_status` enum('0','1','2') DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `import_air_in_fk_office_id` (`airport_in`),
  KEY `import_air_out_fk_office_id` (`airport_out`),
  KEY `import__re_office_fk_off_id` (`re_office`),
  CONSTRAINT `import__re_office_fk_off_id` FOREIGN KEY (`re_office`) REFERENCES `office` (`id`),
  CONSTRAINT `import_air_in_fk_office_id` FOREIGN KEY (`airport_in`) REFERENCES `office` (`id`),
  CONSTRAINT `import_air_out_fk_office_id` FOREIGN KEY (`airport_out`) REFERENCES `office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
