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

 Date: 20/12/2021 23:14:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for reff_atensi_merah_header
-- ----------------------------
DROP TABLE IF EXISTS `reff_atensi_merah_header`;
CREATE TABLE `reff_atensi_merah_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(256) DEFAULT NULL,
  `no_paspor` varchar(32) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jns_dok_hist` varchar(32) DEFAULT NULL,
  `no_dok_hist` varchar(256) DEFAULT NULL,
  `tgl_dok_hist` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `year_increment` int(4) DEFAULT NULL,
  `number_increment` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reff_header_nama_idx` (`nama`(191)) USING BTREE,
  KEY `reff_header_paspor_idx` (`no_paspor`) USING BTREE,
  KEY `reff_header_tgl_lahir_idx` (`tgl_lahir`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
