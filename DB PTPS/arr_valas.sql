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

 Date: 03/01/2022 14:36:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for arr_valas
-- ----------------------------
DROP TABLE IF EXISTS `arr_valas`;
CREATE TABLE `arr_valas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_number` varchar(32) NOT NULL,
  `year_increment` int(4) DEFAULT NULL,
  `number_increment` int(4) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `arrival_date` date NOT NULL,
  `nationality` int(11) NOT NULL,
  `origin_country` int(11) NOT NULL,
  `identity_number` varchar(32) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `residence_address` varchar(255) NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `flight_number` varchar(32) NOT NULL,
  `last_port` varchar(128) NOT NULL,
  `next_port` varchar(128) NOT NULL,
  `address_in_indonesia` varchar(255) NOT NULL,
  `purpose_of_visit` varchar(255) NOT NULL,
  `type` enum('1','2') NOT NULL,
  `intended_use` enum('1','2','3','4') NOT NULL,
  `reason` enum('1','2','3') NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `is_suspicious` enum('0','1') NOT NULL DEFAULT '0',
  `is_result` enum('0','1') NOT NULL DEFAULT '1',
  `is_count` enum('0','1') NOT NULL,
  `officer_name` varchar(128) NOT NULL,
  `officer_nip` varchar(32) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `origin_country_id_fk_country_id` (`origin_country`),
  KEY `nationality_arr_valas_fk_origin_id` (`nationality`),
  CONSTRAINT `nationality_arr_valas_fk_origin_id` FOREIGN KEY (`nationality`) REFERENCES `countries` (`id`),
  CONSTRAINT `origin_country_id_fk_country_id` FOREIGN KEY (`origin_country`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;