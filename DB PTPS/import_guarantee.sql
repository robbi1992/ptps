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

 Date: 15/10/2021 07:24:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for import_guarantee
-- ----------------------------
DROP TABLE IF EXISTS `import_guarantee`;
CREATE TABLE `import_guarantee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` enum('1','2','3','4') NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `nominal` bigint(255) NOT NULL,
  `treasurer_name` varchar(128) NOT NULL,
  `treasurer_nip` varchar(32) NOT NULL,
  `doc_number` varchar(32) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_guarantee_header_id_fk_import_id` (`header_id`),
  CONSTRAINT `im_guarantee_header_id_fk_import_id` FOREIGN KEY (`header_id`) REFERENCES `import` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
