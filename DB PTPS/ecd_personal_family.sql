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

 Date: 04/11/2021 11:25:33
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
  PRIMARY KEY (`id`),
  KEY `personal_id_per_fam_fk_personal_id` (`personal_id`),
  CONSTRAINT `personal_id_per_fam_fk_personal_id` FOREIGN KEY (`personal_id`) REFERENCES `ecd_personal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ecd_personal_family
-- ----------------------------
BEGIN;
INSERT INTO `ecd_personal_family` VALUES (1, 1, 'keluarga1', '123321');
INSERT INTO `ecd_personal_family` VALUES (2, 1, 'keluarga2', '123322');
INSERT INTO `ecd_personal_family` VALUES (3, 2, 'keluarga1', '123321');
INSERT INTO `ecd_personal_family` VALUES (4, 2, 'keluarga2', '123322');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
