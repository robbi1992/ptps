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

 Date: 10/11/2021 20:28:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ecd_personal_family
-- ----------------------------
DROP TABLE IF EXISTS `ecd_personal_family`;
CREATE TABLE `ecd_personal_family` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personal_id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `passport_number` varchar(32) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_id_per_fam_fk_personal_id` (`personal_id`),
  CONSTRAINT `personal_id_per_fam_fk_personal_id` FOREIGN KEY (`personal_id`) REFERENCES `ecd_personal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
