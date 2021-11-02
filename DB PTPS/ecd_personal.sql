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

 Date: 02/11/2021 22:00:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ecd_personal
-- ----------------------------
DROP TABLE IF EXISTS `ecd_personal`;
CREATE TABLE `ecd_personal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `nationality` int(11) NOT NULL,
  `passport_number` varchar(32) NOT NULL,
  `address_in_indo` varchar(255) NOT NULL,
  `flight_number` varchar(16) NOT NULL,
  `arrival_date` date NOT NULL,
  `baggage_in` int(4) NOT NULL,
  `baggage_ex` int(4) NOT NULL,
  `scan_status` enum('0','1') NOT NULL DEFAULT '0',
  `zone` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `personal_nationality_fk_country_id` (`nationality`),
  CONSTRAINT `personal_nationality_fk_country_id` FOREIGN KEY (`nationality`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ecd_personal
-- ----------------------------
BEGIN;
INSERT INTO `ecd_personal` VALUES (1, 'john', '2021-11-02', 'baby', 1, 'a123', 'rain city', 'GA 123', '2021-11-02', 0, 0, '0', '1', '2021-11-02 21:51:32');
INSERT INTO `ecd_personal` VALUES (2, 'john', '2021-11-02', 'baby', 1, 'a123', 'rain city', 'GA 123', '2021-11-02', 0, 0, '1', '0', '2021-11-02 21:51:32');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
