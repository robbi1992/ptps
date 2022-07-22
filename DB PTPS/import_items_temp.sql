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

 Date: 22/07/2022 15:22:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for import_items_temp
-- ----------------------------
DROP TABLE IF EXISTS `import_items_temp`;
CREATE TABLE `import_items_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `bruto` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `package_type` int(11) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `kurs` float NOT NULL,
  `bm_tax` float NOT NULL,
  `cif` bigint(20) NOT NULL,
  `free_value` float NOT NULL,
  `free_currency` varchar(8) NOT NULL,
  `free` float NOT NULL,
  `ppn_tax` float NOT NULL,
  `pph_tax` float NOT NULL,
  `ppnbm_tax` float NOT NULL,
  `fine_tax` float NOT NULL,
  `fob` bigint(20) NOT NULL,
  `freight` bigint(20) NOT NULL,
  `insurance` bigint(20) NOT NULL,
  `key_item` varchar(64) NOT NULL,
  `key_header` varchar(64) NOT NULL,
  `pos_code` varchar(32) NOT NULL,
  `pos_desc` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pck_type_im_items_fk_qty_type_id` (`package_type`),
  KEY `im_items_header_id_fk_import_id` (`key_header`),
  CONSTRAINT `import_items_temp_ibfk_2` FOREIGN KEY (`package_type`) REFERENCES `quantity_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
