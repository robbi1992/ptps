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

 Date: 08/10/2021 16:05:18
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for arr_valas_cash
-- ----------------------------
DROP TABLE IF EXISTS `arr_valas_cash`;
CREATE TABLE `arr_valas_cash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(32) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `arr_val_cash_header_id_fk_header_id` (`header_id`),
  CONSTRAINT `arr_val_cash_header_id_fk_header_id` FOREIGN KEY (`header_id`) REFERENCES `arr_valas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for arr_valas_corp
-- ----------------------------
DROP TABLE IF EXISTS `arr_valas_corp`;
CREATE TABLE `arr_valas_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `type` enum('1','2','3') NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `corp_header_id_fk_arr_valas_id` (`header_id`),
  CONSTRAINT `corp_header_id_fk_arr_valas_id` FOREIGN KEY (`header_id`) REFERENCES `arr_valas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for arr_valas_ipl
-- ----------------------------
DROP TABLE IF EXISTS `arr_valas_ipl`;
CREATE TABLE `arr_valas_ipl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(32) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `type` enum('1','2','3','4','5') NOT NULL,
  `number` varchar(32) NOT NULL,
  `date` date NOT NULL,
  `bank` varchar(128) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `arr_val_cash_header_id_fk_header_id` (`header_id`),
  CONSTRAINT `arr_valas_ipl_ibfk_1` FOREIGN KEY (`header_id`) REFERENCES `arr_valas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for arr_valas_others
-- ----------------------------
DROP TABLE IF EXISTS `arr_valas_others`;
CREATE TABLE `arr_valas_others` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `nationality` varchar(128) NOT NULL,
  `identity_number` varchar(32) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `residence_address` varchar(255) NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `header_id_fk_arr_valas_id` (`header_id`),
  CONSTRAINT `header_id_fk_arr_valas_id` FOREIGN KEY (`header_id`) REFERENCES `arr_valas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `no` int(11) NOT NULL,
  `id` longtext,
  `ip_address` varchar(100) DEFAULT NULL,
  `timestamp` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of countries
-- ----------------------------
BEGIN;
INSERT INTO `countries` VALUES (1, 'Singapura');
INSERT INTO `countries` VALUES (2, 'Malaysia');
INSERT INTO `countries` VALUES (3, 'Jepang');
INSERT INTO `countries` VALUES (4, 'Thailand');
INSERT INTO `countries` VALUES (5, 'Korea Selatan');
INSERT INTO `countries` VALUES (6, 'Perancis');
INSERT INTO `countries` VALUES (7, 'Jerman');
INSERT INTO `countries` VALUES (8, 'Belanda');
INSERT INTO `countries` VALUES (9, 'Arab Saudi');
INSERT INTO `countries` VALUES (10, 'Turki');
INSERT INTO `countries` VALUES (11, 'China');
INSERT INTO `countries` VALUES (12, 'Hongkong');
INSERT INTO `countries` VALUES (13, 'Uni Emirat Arab');
INSERT INTO `countries` VALUES (14, 'Taiwan');
INSERT INTO `countries` VALUES (15, 'Qatar');
INSERT INTO `countries` VALUES (16, 'Afganistan');
INSERT INTO `countries` VALUES (17, 'Afrika Selatan');
INSERT INTO `countries` VALUES (18, 'Afrika Tengah');
INSERT INTO `countries` VALUES (19, 'Albania');
INSERT INTO `countries` VALUES (20, 'Aljazair');
INSERT INTO `countries` VALUES (21, 'Amerika Serikat');
INSERT INTO `countries` VALUES (22, 'Andorra');
INSERT INTO `countries` VALUES (23, 'Angola');
INSERT INTO `countries` VALUES (24, 'Antigua dan Barbuda');
INSERT INTO `countries` VALUES (25, 'Argentina');
INSERT INTO `countries` VALUES (26, 'Armenia');
INSERT INTO `countries` VALUES (27, 'Australia');
INSERT INTO `countries` VALUES (28, 'Austria');
INSERT INTO `countries` VALUES (29, 'Azerbaijan');
INSERT INTO `countries` VALUES (30, 'Bahama');
INSERT INTO `countries` VALUES (31, 'Bahrain');
INSERT INTO `countries` VALUES (32, 'Bangladesh');
INSERT INTO `countries` VALUES (33, 'Barbados');
INSERT INTO `countries` VALUES (34, 'Belarus');
INSERT INTO `countries` VALUES (35, 'Belgia');
INSERT INTO `countries` VALUES (36, 'Belize');
INSERT INTO `countries` VALUES (37, 'Benin');
INSERT INTO `countries` VALUES (38, 'Bhutan');
INSERT INTO `countries` VALUES (39, 'Bolivia');
INSERT INTO `countries` VALUES (40, 'Bosnia dan Herzegovina');
INSERT INTO `countries` VALUES (41, 'Botswana');
INSERT INTO `countries` VALUES (42, 'Brazil');
INSERT INTO `countries` VALUES (43, 'Britania Raya');
INSERT INTO `countries` VALUES (44, 'Brunei Darussalam');
INSERT INTO `countries` VALUES (45, 'Bulgaria');
INSERT INTO `countries` VALUES (46, 'Burkina Faso');
INSERT INTO `countries` VALUES (47, 'Burundi');
INSERT INTO `countries` VALUES (48, 'Ceko');
INSERT INTO `countries` VALUES (49, 'Chad');
INSERT INTO `countries` VALUES (50, 'Chili');
INSERT INTO `countries` VALUES (51, 'Denmark');
INSERT INTO `countries` VALUES (52, 'Djibouti');
INSERT INTO `countries` VALUES (53, 'Dominika');
INSERT INTO `countries` VALUES (54, 'Ekuador');
INSERT INTO `countries` VALUES (55, 'El Salvador');
INSERT INTO `countries` VALUES (56, 'Eritrea');
INSERT INTO `countries` VALUES (57, 'Estonia');
INSERT INTO `countries` VALUES (58, 'Ethiopia');
INSERT INTO `countries` VALUES (59, 'Fiji');
INSERT INTO `countries` VALUES (60, 'Filipina');
INSERT INTO `countries` VALUES (61, 'Finlandia');
INSERT INTO `countries` VALUES (62, 'Gabon');
INSERT INTO `countries` VALUES (63, 'Gambia');
INSERT INTO `countries` VALUES (64, 'Georgia');
INSERT INTO `countries` VALUES (65, 'Ghana');
INSERT INTO `countries` VALUES (66, 'Grenada');
INSERT INTO `countries` VALUES (67, 'Guatemala');
INSERT INTO `countries` VALUES (68, 'Guinea');
INSERT INTO `countries` VALUES (69, 'Guinea Bissau');
INSERT INTO `countries` VALUES (70, 'Guinea Khatulistiwa');
INSERT INTO `countries` VALUES (71, 'Guyana');
INSERT INTO `countries` VALUES (72, 'Haiti');
INSERT INTO `countries` VALUES (73, 'Honduras');
INSERT INTO `countries` VALUES (74, 'Hongaria');
INSERT INTO `countries` VALUES (75, 'India');
INSERT INTO `countries` VALUES (76, 'Indonesia');
INSERT INTO `countries` VALUES (77, 'Irak');
INSERT INTO `countries` VALUES (78, 'Iran');
INSERT INTO `countries` VALUES (79, 'Irlandia');
INSERT INTO `countries` VALUES (80, 'Islandia');
INSERT INTO `countries` VALUES (81, 'Israel');
INSERT INTO `countries` VALUES (82, 'Italia');
INSERT INTO `countries` VALUES (83, 'Jamaika');
INSERT INTO `countries` VALUES (84, 'Kamboja');
INSERT INTO `countries` VALUES (85, 'Kamerun');
INSERT INTO `countries` VALUES (86, 'Kanada');
INSERT INTO `countries` VALUES (87, 'Kazakhstan');
INSERT INTO `countries` VALUES (88, 'Kenya');
INSERT INTO `countries` VALUES (89, 'Kirgizstan');
INSERT INTO `countries` VALUES (90, 'Kiribati');
INSERT INTO `countries` VALUES (91, 'Kolombia');
INSERT INTO `countries` VALUES (92, 'Komoro');
INSERT INTO `countries` VALUES (93, 'Republik Kongo');
INSERT INTO `countries` VALUES (94, 'Korea Utara');
INSERT INTO `countries` VALUES (95, 'Kosta Rika');
INSERT INTO `countries` VALUES (96, 'Kroasia');
INSERT INTO `countries` VALUES (97, 'Kuba');
INSERT INTO `countries` VALUES (98, 'Kuwait');
INSERT INTO `countries` VALUES (99, 'Laos');
INSERT INTO `countries` VALUES (100, 'Latvia');
INSERT INTO `countries` VALUES (101, 'Lebanon');
INSERT INTO `countries` VALUES (102, 'Lesotho');
INSERT INTO `countries` VALUES (103, 'Liberia');
INSERT INTO `countries` VALUES (104, 'Libya');
INSERT INTO `countries` VALUES (105, 'Liechtenstein');
INSERT INTO `countries` VALUES (106, 'Lituania');
INSERT INTO `countries` VALUES (107, 'Luksemburg');
INSERT INTO `countries` VALUES (108, 'Madagaskar');
INSERT INTO `countries` VALUES (109, 'Makedonia');
INSERT INTO `countries` VALUES (110, 'Maladewa');
INSERT INTO `countries` VALUES (111, 'Malawi');
INSERT INTO `countries` VALUES (112, 'Mali');
INSERT INTO `countries` VALUES (113, 'Malta');
INSERT INTO `countries` VALUES (114, 'Maroko');
INSERT INTO `countries` VALUES (115, 'Marshall');
INSERT INTO `countries` VALUES (116, 'Mauritania');
INSERT INTO `countries` VALUES (117, 'Mauritius');
INSERT INTO `countries` VALUES (118, 'Meksiko');
INSERT INTO `countries` VALUES (119, 'Mesir');
INSERT INTO `countries` VALUES (120, 'Mikronesia');
INSERT INTO `countries` VALUES (121, 'Moldova');
INSERT INTO `countries` VALUES (122, 'Monako');
INSERT INTO `countries` VALUES (123, 'Mongolia');
INSERT INTO `countries` VALUES (124, 'Montenegro');
INSERT INTO `countries` VALUES (125, 'Mozambik');
INSERT INTO `countries` VALUES (126, 'Myanmar');
INSERT INTO `countries` VALUES (127, 'Namibia');
INSERT INTO `countries` VALUES (128, 'Nauru');
INSERT INTO `countries` VALUES (129, 'Nepal');
INSERT INTO `countries` VALUES (130, 'Niger');
INSERT INTO `countries` VALUES (131, 'Nigeria');
INSERT INTO `countries` VALUES (132, 'Nikaragua');
INSERT INTO `countries` VALUES (133, 'Norwegia');
INSERT INTO `countries` VALUES (134, 'Oman');
INSERT INTO `countries` VALUES (135, 'Pakistan');
INSERT INTO `countries` VALUES (136, 'Palau');
INSERT INTO `countries` VALUES (137, 'Panama');
INSERT INTO `countries` VALUES (138, 'Pantai Gading - Cote divoire');
INSERT INTO `countries` VALUES (139, 'Papua Nugini');
INSERT INTO `countries` VALUES (140, 'Paraguay');
INSERT INTO `countries` VALUES (141, 'Peru');
INSERT INTO `countries` VALUES (142, 'Polandia');
INSERT INTO `countries` VALUES (143, 'Portugal');
INSERT INTO `countries` VALUES (144, 'Republik Demokratik Kongo');
INSERT INTO `countries` VALUES (145, 'Republik Dominika');
INSERT INTO `countries` VALUES (146, 'Rumania');
INSERT INTO `countries` VALUES (147, 'Rusia');
INSERT INTO `countries` VALUES (148, 'Rwanda');
INSERT INTO `countries` VALUES (149, 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES (150, 'Saint Lucia');
INSERT INTO `countries` VALUES (151, 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES (152, 'Samoa');
INSERT INTO `countries` VALUES (153, 'San Marino');
INSERT INTO `countries` VALUES (154, 'Sao Tome and Principe');
INSERT INTO `countries` VALUES (155, 'Selandia Baru');
INSERT INTO `countries` VALUES (156, 'Senegal');
INSERT INTO `countries` VALUES (157, 'Serbia');
INSERT INTO `countries` VALUES (158, 'Seychelles');
INSERT INTO `countries` VALUES (159, 'Sierra Leone');
INSERT INTO `countries` VALUES (160, 'Siprus');
INSERT INTO `countries` VALUES (161, 'Slovenia');
INSERT INTO `countries` VALUES (162, 'Slowakia');
INSERT INTO `countries` VALUES (163, 'Solomon');
INSERT INTO `countries` VALUES (164, 'Somalia');
INSERT INTO `countries` VALUES (165, 'Spanyol');
INSERT INTO `countries` VALUES (166, 'Sri Lanka');
INSERT INTO `countries` VALUES (167, 'Sudan');
INSERT INTO `countries` VALUES (168, 'Sudan Selatan');
INSERT INTO `countries` VALUES (169, 'Suriah');
INSERT INTO `countries` VALUES (170, 'Suriname');
INSERT INTO `countries` VALUES (171, 'Swaziland');
INSERT INTO `countries` VALUES (172, 'Swedia');
INSERT INTO `countries` VALUES (173, 'Swiss');
INSERT INTO `countries` VALUES (174, 'Tajikistan');
INSERT INTO `countries` VALUES (175, 'Tanjung Verde');
INSERT INTO `countries` VALUES (176, 'Tanzania');
INSERT INTO `countries` VALUES (177, 'Timor Leste');
INSERT INTO `countries` VALUES (178, 'Togo');
INSERT INTO `countries` VALUES (179, 'Tonga');
INSERT INTO `countries` VALUES (180, 'Trinidad and Tobago');
INSERT INTO `countries` VALUES (181, 'Tunisia');
INSERT INTO `countries` VALUES (182, 'Turkmenistan');
INSERT INTO `countries` VALUES (183, 'Tuvalu');
INSERT INTO `countries` VALUES (184, 'Uganda');
INSERT INTO `countries` VALUES (185, 'Ukraina');
INSERT INTO `countries` VALUES (186, 'Uruguay');
INSERT INTO `countries` VALUES (187, 'Uzbekistan');
INSERT INTO `countries` VALUES (188, 'Vanuatu');
INSERT INTO `countries` VALUES (189, 'Venezuela');
INSERT INTO `countries` VALUES (190, 'Vietnam');
INSERT INTO `countries` VALUES (191, 'Yaman');
INSERT INTO `countries` VALUES (192, 'Yordania');
INSERT INTO `countries` VALUES (193, 'Yunani');
INSERT INTO `countries` VALUES (194, 'Zambia');
INSERT INTO `countries` VALUES (195, 'Zimbabwe');
INSERT INTO `countries` VALUES (196, 'Vatican City');
INSERT INTO `countries` VALUES (197, 'Palestina');
COMMIT;

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of currency
-- ----------------------------
BEGIN;
INSERT INTO `currency` VALUES (1, 'IDR');
INSERT INTO `currency` VALUES (2, 'USD');
COMMIT;

-- ----------------------------
-- Table structure for dep_valas
-- ----------------------------
DROP TABLE IF EXISTS `dep_valas`;
CREATE TABLE `dep_valas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_number` varchar(32) NOT NULL,
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
  `is_permit_bank` enum('0','1') NOT NULL,
  `permit_number` varchar(32) NOT NULL,
  `permit_date` date NOT NULL,
  `office` varchar(255) NOT NULL,
  `officer_name` varchar(128) NOT NULL,
  `officer_nip` varchar(32) NOT NULL,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `origin_country_id_fk_country_id` (`origin_country`),
  KEY `nationality_arr_valas_fk_origin_id` (`nationality`),
  CONSTRAINT `dep_valas_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `countries` (`id`),
  CONSTRAINT `dep_valas_ibfk_2` FOREIGN KEY (`origin_country`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dep_valas_cash
-- ----------------------------
DROP TABLE IF EXISTS `dep_valas_cash`;
CREATE TABLE `dep_valas_cash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(32) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `arr_val_cash_header_id_fk_header_id` (`header_id`),
  CONSTRAINT `dev_valas_cash_header_id_fk1` FOREIGN KEY (`header_id`) REFERENCES `dep_valas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dep_valas_corp
-- ----------------------------
DROP TABLE IF EXISTS `dep_valas_corp`;
CREATE TABLE `dep_valas_corp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `type` enum('1','2','3') NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `corp_header_id_fk_arr_valas_id` (`header_id`),
  CONSTRAINT `dep_valas_corp_ibfk_1` FOREIGN KEY (`header_id`) REFERENCES `dep_valas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dep_valas_ipl
-- ----------------------------
DROP TABLE IF EXISTS `dep_valas_ipl`;
CREATE TABLE `dep_valas_ipl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(32) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `type` enum('1','2','3','4','5') NOT NULL,
  `number` varchar(32) NOT NULL,
  `date` date NOT NULL,
  `bank` varchar(128) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `arr_val_cash_header_id_fk_header_id` (`header_id`),
  CONSTRAINT `dep_valas_ipl_ibfk_1` FOREIGN KEY (`header_id`) REFERENCES `dep_valas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dep_valas_others
-- ----------------------------
DROP TABLE IF EXISTS `dep_valas_others`;
CREATE TABLE `dep_valas_others` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `nationality` varchar(128) NOT NULL,
  `identity_number` varchar(32) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `residence_address` varchar(255) NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `header_id_fk_arr_valas_id` (`header_id`),
  CONSTRAINT `dep_valas_others_ibfk_1` FOREIGN KEY (`header_id`) REFERENCES `dep_valas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for docs
-- ----------------------------
DROP TABLE IF EXISTS `docs`;
CREATE TABLE `docs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_type` varchar(64) NOT NULL,
  `doc_number` varchar(64) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_attach` varchar(128) DEFAULT NULL,
  `header_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docs
-- ----------------------------
BEGIN;
INSERT INTO `docs` VALUES (1, 'dasd', 'asdad', '2021-09-09', '1632819844.jpg', 1);
COMMIT;

-- ----------------------------
-- Table structure for docs_temp
-- ----------------------------
DROP TABLE IF EXISTS `docs_temp`;
CREATE TABLE `docs_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_type` varchar(64) NOT NULL,
  `doc_number` varchar(64) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_attach` varchar(128) DEFAULT NULL,
  `header_id` int(10) NOT NULL,
  `nip_user` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for import
-- ----------------------------
DROP TABLE IF EXISTS `import`;
CREATE TABLE `import` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_number` varchar(32) NOT NULL,
  `doc_date` date NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `import_air_in_fk_office_id` (`airport_in`),
  KEY `import_air_out_fk_office_id` (`airport_out`),
  CONSTRAINT `import_air_in_fk_office_id` FOREIGN KEY (`airport_in`) REFERENCES `office` (`id`),
  CONSTRAINT `import_air_out_fk_office_id` FOREIGN KEY (`airport_out`) REFERENCES `office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for import_account
-- ----------------------------
DROP TABLE IF EXISTS `import_account`;
CREATE TABLE `import_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `number` varchar(32) NOT NULL,
  `bank` varchar(128) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_acc_header_id_fk_import_id` (`header_id`),
  CONSTRAINT `im_acc_header_id_fk_import_id` FOREIGN KEY (`header_id`) REFERENCES `import` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

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
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_guarantee_header_id_fk_import_id` (`header_id`),
  CONSTRAINT `im_guarantee_header_id_fk_import_id` FOREIGN KEY (`header_id`) REFERENCES `import` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for import_items
-- ----------------------------
DROP TABLE IF EXISTS `import_items`;
CREATE TABLE `import_items` (
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
  `ppn_tax` float NOT NULL,
  `pph_tax` float NOT NULL,
  `ppnbm_tax` float NOT NULL,
  `fob` bigint(20) NOT NULL,
  `freight` bigint(20) NOT NULL,
  `insurance` bigint(20) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pck_type_im_items_fk_qty_type_id` (`package_type`),
  KEY `im_items_header_id_fk_import_id` (`header_id`),
  CONSTRAINT `im_items_header_id_fk_import_id` FOREIGN KEY (`header_id`) REFERENCES `import` (`id`),
  CONSTRAINT `pck_type_im_items_fk_qty_type_id` FOREIGN KEY (`package_type`) REFERENCES `quantity_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for import_items_attachment
-- ----------------------------
DROP TABLE IF EXISTS `import_items_attachment`;
CREATE TABLE `import_items_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iia_item_id_fk_import_items_id` (`item_id`),
  CONSTRAINT `iia_item_id_fk_import_items_id` FOREIGN KEY (`item_id`) REFERENCES `import_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for import_items_attachment_temp
-- ----------------------------
DROP TABLE IF EXISTS `import_items_attachment_temp`;
CREATE TABLE `import_items_attachment_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `key_item` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iia_item_id_fk_import_items_id` (`key_item`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

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
  `ppn_tax` float NOT NULL,
  `pph_tax` float NOT NULL,
  `ppnbm_tax` float NOT NULL,
  `fob` bigint(20) NOT NULL,
  `freight` bigint(20) NOT NULL,
  `insurance` bigint(20) NOT NULL,
  `key_item` varchar(64) NOT NULL,
  `key_header` varchar(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pck_type_im_items_fk_qty_type_id` (`package_type`),
  KEY `im_items_header_id_fk_import_id` (`key_header`),
  CONSTRAINT `import_items_temp_ibfk_2` FOREIGN KEY (`package_type`) REFERENCES `quantity_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for import_sponsor
-- ----------------------------
DROP TABLE IF EXISTS `import_sponsor`;
CREATE TABLE `import_sponsor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `identity_number` varchar(32) NOT NULL,
  `location` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `header_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `im_sponsor_header_id_fk_import_id` (`header_id`),
  CONSTRAINT `im_sponsor_header_id_fk_import_id` FOREIGN KEY (`header_id`) REFERENCES `import` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item_categories
-- ----------------------------
DROP TABLE IF EXISTS `item_categories`;
CREATE TABLE `item_categories` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of item_categories
-- ----------------------------
BEGIN;
INSERT INTO `item_categories` VALUES (1, 'HVG (High Value Goods)');
INSERT INTO `item_categories` VALUES (2, 'Sepeda');
INSERT INTO `item_categories` VALUES (3, 'Tas');
INSERT INTO `item_categories` VALUES (4, 'Jam Tangan');
INSERT INTO `item_categories` VALUES (5, 'Kamera dan Perlengapan lainnya');
INSERT INTO `item_categories` VALUES (6, 'Handphone, Gadget, part, dan aksesories');
INSERT INTO `item_categories` VALUES (7, 'Elektronik');
INSERT INTO `item_categories` VALUES (8, 'Kendaraan, Part dan aksesories');
INSERT INTO `item_categories` VALUES (9, 'Besi, Baja dan produknya');
INSERT INTO `item_categories` VALUES (10, 'Logam Mulia dan Perhiasan');
INSERT INTO `item_categories` VALUES (11, 'Logam Non Mulia');
INSERT INTO `item_categories` VALUES (12, 'Makanan dan Minuman (Olahan/Kemasan)');
INSERT INTO `item_categories` VALUES (13, 'Kosmetik');
INSERT INTO `item_categories` VALUES (14, 'Alas Kaki');
INSERT INTO `item_categories` VALUES (15, 'Tekstil & Produk Tekstil & Accessories');
INSERT INTO `item_categories` VALUES (16, 'Obat-Obatan');
INSERT INTO `item_categories` VALUES (17, 'Produk Mainan dan Olahraga');
INSERT INTO `item_categories` VALUES (18, 'Alat Berat, Part & ACC');
INSERT INTO `item_categories` VALUES (19, 'Mesin (Bakar, Listrik, Pompa, DLL)');
INSERT INTO `item_categories` VALUES (20, 'Alat Kesehatan');
INSERT INTO `item_categories` VALUES (21, 'Perkakas (Mekanik/Elektrik)');
INSERT INTO `item_categories` VALUES (22, 'Perlatan Dapur & Kamar mandi');
INSERT INTO `item_categories` VALUES (23, 'Hewan dan Bagian Tubuh');
INSERT INTO `item_categories` VALUES (24, 'Barang Lainnya');
COMMIT;

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS `office`;
CREATE TABLE `office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of office
-- ----------------------------
BEGIN;
INSERT INTO `office` VALUES (1, 'BLBC KELAS II SURABAYA');
INSERT INTO `office` VALUES (2, 'KANWIL DJBC ACEH');
INSERT INTO `office` VALUES (3, 'KANWIL DJBC ACEH');
INSERT INTO `office` VALUES (4, 'KANWIL DJBC BANTEN');
INSERT INTO `office` VALUES (5, 'KANWIL DJBC JAKARTA');
INSERT INTO `office` VALUES (6, 'KANWIL DJBC JAWA BARAT');
INSERT INTO `office` VALUES (7, 'KANWIL DJBC JAWA TENGAH DAN D.I. YOGYAKARTA');
INSERT INTO `office` VALUES (8, 'KANWIL DJBC JAWA TIMUR I');
INSERT INTO `office` VALUES (9, 'KANWIL DJBC JAWA TIMUR II');
INSERT INTO `office` VALUES (10, 'KANWIL DJBC KALIMANTAN BAGIAN BARAT');
INSERT INTO `office` VALUES (11, 'KANWIL DJBC KALIMANTAN BAGIAN SELATAN');
INSERT INTO `office` VALUES (12, 'KANWIL DJBC KALIMANTAN BAGIAN TIMUR');
INSERT INTO `office` VALUES (13, 'KANWIL DJBC KHUSUS KEPULAUAN RIAU');
INSERT INTO `office` VALUES (14, 'KANWIL DJBC KHUSUS PAPUA');
INSERT INTO `office` VALUES (15, 'KANWIL DJBC MALUKU');
INSERT INTO `office` VALUES (16, 'KANWIL DJBC RIAU');
INSERT INTO `office` VALUES (17, 'KANWIL DJBC SULAWESI BAGIAN SELATAN');
INSERT INTO `office` VALUES (18, 'KANWIL DJBC SULAWESI BAGIAN UTARA');
INSERT INTO `office` VALUES (19, 'KANWIL DJBC SULAWESI BAGIAN BARAT');
INSERT INTO `office` VALUES (20, 'KANWIL DJBC SULAWESI BAGIAN TIMUR');
INSERT INTO `office` VALUES (21, 'KANWIL DJBC SUMATERA UTARA');
INSERT INTO `office` VALUES (22, 'KPPBC ATAPUPU ');
INSERT INTO `office` VALUES (23, 'KPPBC BAGAN SIAPIAPI');
INSERT INTO `office` VALUES (24, 'KPPBC BAJOE');
INSERT INTO `office` VALUES (25, 'KPPBC BENOA');
INSERT INTO `office` VALUES (26, 'KPPBC BINTUNI');
INSERT INTO `office` VALUES (27, 'KPPBC DABO SINGKEP');
INSERT INTO `office` VALUES (28, 'KPPBC FAK-FAK');
INSERT INTO `office` VALUES (29, 'KPPBC KAIMANA');
INSERT INTO `office` VALUES (30, 'KPPBC NABIRE');
INSERT INTO `office` VALUES (31, 'KPPBC PANGKALAN SUSU');
INSERT INTO `office` VALUES (32, 'KPPBC PEKALONGAN');
INSERT INTO `office` VALUES (33, 'KPPBC POMALAA');
INSERT INTO `office` VALUES (34, 'KPPBC SIAK SRI INDRAPURA');
INSERT INTO `office` VALUES (35, 'KPPBC TAREMPA');
INSERT INTO `office` VALUES (36, 'KPPBC TMC KEDIRI');
INSERT INTO `office` VALUES (37, 'KPPBC TMC KUDUS');
INSERT INTO `office` VALUES (38, 'KPPBC TMC MALANG');
INSERT INTO `office` VALUES (39, 'KPPBC TMP A BANDUNG');
INSERT INTO `office` VALUES (40, 'KPPBC TMP A BEKASI');
INSERT INTO `office` VALUES (41, 'KPPBC TMP A BOGOR');
INSERT INTO `office` VALUES (42, 'KPPBC TMP A DENPASAR');
INSERT INTO `office` VALUES (43, 'KPPBC TMP A JAKARTA');
INSERT INTO `office` VALUES (44, 'KPPBC TMP A MARUNDA');
INSERT INTO `office` VALUES (45, 'KPPBC TMP A PASURUAN');
INSERT INTO `office` VALUES (46, 'KPPBC TMP A PURWAKARTA');
INSERT INTO `office` VALUES (47, 'KPPBC TMP A SEMARANG');
INSERT INTO `office` VALUES (48, 'KPPBC TMP A TANGERANG');
INSERT INTO `office` VALUES (49, 'KPPBC TMP B ATAMBUA');
INSERT INTO `office` VALUES (50, 'KPPBC TMP B BALIKPAPAN');
INSERT INTO `office` VALUES (51, 'KPPBC TMP B BANDAR LAMPUNG');
INSERT INTO `office` VALUES (52, 'KPPBC TMP B BANJARMASIN');
INSERT INTO `office` VALUES (53, 'KPPBC TMP B DUMAI');
INSERT INTO `office` VALUES (54, 'KPPBC TMP B GRESIK');
INSERT INTO `office` VALUES (55, 'KPPBC TMP B JAMBI');
INSERT INTO `office` VALUES (56, 'KPPBC TMP B KUALANAMU');
INSERT INTO `office` VALUES (57, 'KPPBC TMP B MAKASSAR');
INSERT INTO `office` VALUES (58, 'KPPBC TMP B MEDAN');
INSERT INTO `office` VALUES (59, 'KPPBC TMP B PALEMBANG');
INSERT INTO `office` VALUES (60, 'KPPBC TMP B PEKANBARU');
INSERT INTO `office` VALUES (61, 'KPPBC TMP B PONTIANAK');
INSERT INTO `office` VALUES (62, 'KPPBC TMP B SAMARINDA');
INSERT INTO `office` VALUES (63, 'KPPBC TMP B SIDOARJO');
INSERT INTO `office` VALUES (64, 'KPPBC TMP B SURAKARTA');
INSERT INTO `office` VALUES (65, 'KPPBC TMP B TANJUNG BALAI KARIMUN');
INSERT INTO `office` VALUES (66, 'KPPBC TMP B TANJUNGPINANG');
INSERT INTO `office` VALUES (67, 'KPPBC TMP B TARAKAN');
INSERT INTO `office` VALUES (68, 'KPPBC TMP B TELUK BAYUR');
INSERT INTO `office` VALUES (69, 'KPPBC TMP B YOGYAKARTA');
INSERT INTO `office` VALUES (70, 'KPPBC TMP BELAWAN');
INSERT INTO `office` VALUES (71, 'KPPBC TMP C AMAMAPARE');
INSERT INTO `office` VALUES (72, 'KPPBC TMP C AMBON');
INSERT INTO `office` VALUES (73, 'KPPBC TMP C BABO');
INSERT INTO `office` VALUES (74, 'KPPBC TMP C BANDA ACEH');
INSERT INTO `office` VALUES (75, 'KPPBC TMP C BANYUWANGI');
INSERT INTO `office` VALUES (76, 'KPPBC TMP C BENGKALIS');
INSERT INTO `office` VALUES (77, 'KPPBC TMP C BENGKULU');
INSERT INTO `office` VALUES (78, 'KPPBC TMP C BIAK');
INSERT INTO `office` VALUES (79, 'KPPBC TMP C BITUNG');
INSERT INTO `office` VALUES (80, 'KPPBC TMP C BLITAR');
INSERT INTO `office` VALUES (81, 'KPPBC TMP C BOJONEGORO');
INSERT INTO `office` VALUES (82, 'KPPBC TMP C BONTANG');
INSERT INTO `office` VALUES (83, 'KPPBC TMP C CILACAP');
INSERT INTO `office` VALUES (84, 'KPPBC TMP C CIREBON');
INSERT INTO `office` VALUES (85, 'KPPBC TMP C ENTIKONG');
INSERT INTO `office` VALUES (86, 'KPPBC TMP C GORONTALO');
INSERT INTO `office` VALUES (87, 'KPPBC TMP C JAGOI BABANG');
INSERT INTO `office` VALUES (88, 'KPPBC TMP C JAYAPURA');
INSERT INTO `office` VALUES (89, 'KPPBC TMP C JEMBER');
INSERT INTO `office` VALUES (90, 'KPPBC TMP C KANTOR POS PASAR BARU');
INSERT INTO `office` VALUES (91, 'KPPBC TMP C KENDARI');
INSERT INTO `office` VALUES (92, 'KPPBC TMP C KETAPANG');
INSERT INTO `office` VALUES (93, 'KPPBC TMP C KOTABARU');
INSERT INTO `office` VALUES (94, 'KPPBC TMP C KUALA LANGSA');
INSERT INTO `office` VALUES (95, 'KPPBC TMP C KUALA TANJUNG');
INSERT INTO `office` VALUES (96, 'KPPBC TMP C KUPANG');
INSERT INTO `office` VALUES (97, 'KPPBC TMP C LHOKSEUMAWE');
INSERT INTO `office` VALUES (98, 'KPPBC TMP C LUWUK');
INSERT INTO `office` VALUES (99, 'KPPBC TMP C MADIUN');
INSERT INTO `office` VALUES (100, 'KPPBC TMP C MADURA');
INSERT INTO `office` VALUES (101, 'KPPBC TMP C MAGELANG');
INSERT INTO `office` VALUES (102, 'KPPBC TMP C MALILI');
INSERT INTO `office` VALUES (103, 'KPPBC TMP C MANADO');
INSERT INTO `office` VALUES (104, 'KPPBC TMP C MANOKWARI');
INSERT INTO `office` VALUES (105, 'KPPBC TMP C MATARAM');
INSERT INTO `office` VALUES (106, 'KPPBC TMP C MAUMERE');
INSERT INTO `office` VALUES (107, 'KPPBC TMP C MERAUKE');
INSERT INTO `office` VALUES (108, 'KPPBC TMP C MEULABOH');
INSERT INTO `office` VALUES (109, 'KPPBC TMP C MOROWALI');
INSERT INTO `office` VALUES (110, 'KPPBC TMP C NANGA BADAU');
INSERT INTO `office` VALUES (111, 'KPPBC TMP C NUNUKAN');
INSERT INTO `office` VALUES (112, 'KPPBC TMP C PANGKALAN BUN');
INSERT INTO `office` VALUES (113, 'KPPBC TMP C PANGKALPINANG');
INSERT INTO `office` VALUES (114, 'KPPBC TMP C PANTOLOAN');
INSERT INTO `office` VALUES (115, 'KPPBC TMP C PAREPARE');
INSERT INTO `office` VALUES (116, 'KPPBC TMP C PEMATANGSIANTAR');
INSERT INTO `office` VALUES (117, 'KPPBC TMP C PROBOLINGGO');
INSERT INTO `office` VALUES (118, 'KPPBC TMP C PULANG PISAU');
INSERT INTO `office` VALUES (119, 'KPPBC TMP C PURWOKERTO');
INSERT INTO `office` VALUES (120, 'KPPBC TMP C SABANG');
INSERT INTO `office` VALUES (121, 'KPPBC TMP C SAMPIT');
INSERT INTO `office` VALUES (122, 'KPPBC TMP C SANGATTA');
INSERT INTO `office` VALUES (123, 'KPPBC TMP C SIBOLGA');
INSERT INTO `office` VALUES (124, 'KPPBC TMP C SINTETE');
INSERT INTO `office` VALUES (125, 'KPPBC TMP C SORONG');
INSERT INTO `office` VALUES (126, 'KPPBC TMP C SUMBAWA');
INSERT INTO `office` VALUES (127, 'KPPBC TMP C TANJUNGPANDAN');
INSERT INTO `office` VALUES (128, 'KPPBC TMP C TASIKMALAYA');
INSERT INTO `office` VALUES (129, 'KPPBC TMP C TEGAL');
INSERT INTO `office` VALUES (130, 'KPPBC TMP C TELUK NIBUNG');
INSERT INTO `office` VALUES (131, 'KPPBC TMP C TEMBILAHAN');
INSERT INTO `office` VALUES (132, 'KPPBC TMP C TERNATE');
INSERT INTO `office` VALUES (133, 'KPPBC TMP C TUAL');
INSERT INTO `office` VALUES (134, 'KPPBC TMP CIKARANG');
INSERT INTO `office` VALUES (135, 'KPPBC TMP JUANDA');
INSERT INTO `office` VALUES (136, 'KPPBC TMP MERAK');
INSERT INTO `office` VALUES (137, 'KPPBC TMP NGURAH RAI');
INSERT INTO `office` VALUES (138, 'KPPBC TMP TANJUNG EMAS');
INSERT INTO `office` VALUES (139, 'KPPBC TMP TANJUNG PERAK');
INSERT INTO `office` VALUES (140, 'KPPBC TULUNG AGUNG');
INSERT INTO `office` VALUES (141, 'KPU BEA DAN CUKAI TIPE A TANJUNG PRIOK');
INSERT INTO `office` VALUES (142, 'KPU BEA DAN CUKAI TIPE B BATAM');
INSERT INTO `office` VALUES (143, 'KPU BEA DAN CUKAI TIPE C SOEKARNO-HATTA');
INSERT INTO `office` VALUES (144, 'PANGSAROP BC TIPE A TANJUNG BALAI KARIMUN');
INSERT INTO `office` VALUES (145, 'PANGSAROP BC TIPE B PANTOLOAN');
INSERT INTO `office` VALUES (146, 'PANGSAROP BC TIPE B SORONG');
INSERT INTO `office` VALUES (147, 'PANGSAROP BC TIPE B TANJUNG PRIOK');
COMMIT;

-- ----------------------------
-- Table structure for quantity_type
-- ----------------------------
DROP TABLE IF EXISTS `quantity_type`;
CREATE TABLE `quantity_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of quantity_type
-- ----------------------------
BEGIN;
INSERT INTO `quantity_type` VALUES (1, 'PCE (Piece)');
INSERT INTO `quantity_type` VALUES (2, 'SET (Set)');
INSERT INTO `quantity_type` VALUES (3, 'GRM (Gram)');
INSERT INTO `quantity_type` VALUES (4, 'BO (Botol)');
INSERT INTO `quantity_type` VALUES (5, 'CLY (Colly)');
INSERT INTO `quantity_type` VALUES (6, 'KGM (Kilogram)');
INSERT INTO `quantity_type` VALUES (7, 'LTR (Liter)');
INSERT INTO `quantity_type` VALUES (8, 'NMP (Pack)');
INSERT INTO `quantity_type` VALUES (9, 'PR (Pair)');
INSERT INTO `quantity_type` VALUES (10, 'NRL (Roll)');
INSERT INTO `quantity_type` VALUES (11, 'RO (Roll)');
INSERT INTO `quantity_type` VALUES (12, 'PLT (Pallet)');
INSERT INTO `quantity_type` VALUES (13, 'NIU (Unit)');
INSERT INTO `quantity_type` VALUES (14, 'BTG (Batang)');
INSERT INTO `quantity_type` VALUES (15, 'LBR (Lbs)');
INSERT INTO `quantity_type` VALUES (16, 'AV (Capsule)');
INSERT INTO `quantity_type` VALUES (17, '5Q (Seismic Line)');
INSERT INTO `quantity_type` VALUES (18, 'ACR (Acre (4840 yd2))');
INSERT INTO `quantity_type` VALUES (19, 'AL (Access Line)');
INSERT INTO `quantity_type` VALUES (20, 'AM (Ampul)');
INSERT INTO `quantity_type` VALUES (21, 'AMH (Ampere-hour  (3,6 kC))');
INSERT INTO `quantity_type` VALUES (22, 'AMP (Ampere)');
INSERT INTO `quantity_type` VALUES (23, 'ANN (Year)');
INSERT INTO `quantity_type` VALUES (24, 'APZ (Ounce GB,US (31,10348 g))');
INSERT INTO `quantity_type` VALUES (25, 'ARE (Are (100m2))');
INSERT INTO `quantity_type` VALUES (26, 'ATM (Standard atmosphere (101325 Pa))');
INSERT INTO `quantity_type` VALUES (27, 'ATT (Technical atmosphere (98066,5 Pa))');
INSERT INTO `quantity_type` VALUES (28, 'BAR (Bar)');
INSERT INTO `quantity_type` VALUES (29, 'BIL (Trillion US / Billion)');
INSERT INTO `quantity_type` VALUES (30, 'BLD (Dry barrel (115,627 dm3))');
INSERT INTO `quantity_type` VALUES (31, 'BLL (Barrel)');
INSERT INTO `quantity_type` VALUES (32, 'BTU (British thermal unit)');
INSERT INTO `quantity_type` VALUES (33, 'BUA (Bushel (35,2391 dm3))');
INSERT INTO `quantity_type` VALUES (34, 'BUI (Bushel (36,36874 dm3))');
INSERT INTO `quantity_type` VALUES (35, 'BZ (MBTU)');
INSERT INTO `quantity_type` VALUES (36, 'CCT (Carrying capacity in metric tonnes)');
INSERT INTO `quantity_type` VALUES (37, 'CDL (Candela)');
INSERT INTO `quantity_type` VALUES (38, 'CEL (Degree celcius)');
INSERT INTO `quantity_type` VALUES (39, 'CEN (Hundred)');
INSERT INTO `quantity_type` VALUES (40, 'CJ (Cone)');
INSERT INTO `quantity_type` VALUES (41, 'CKG (Coulomb per kilogram)');
INSERT INTO `quantity_type` VALUES (42, 'CLT (Centilitre)');
INSERT INTO `quantity_type` VALUES (43, 'CMK (Square centimetre)');
INSERT INTO `quantity_type` VALUES (44, 'CMQ (Cubic centimetre)');
INSERT INTO `quantity_type` VALUES (45, 'CMT (Centimetre)');
INSERT INTO `quantity_type` VALUES (46, 'CNP (Hundred packs)');
INSERT INTO `quantity_type` VALUES (47, 'CNT (Cental GB (45,359237 kg))');
INSERT INTO `quantity_type` VALUES (48, 'COU (Coulomb)');
INSERT INTO `quantity_type` VALUES (49, 'CTM (Carat)');
INSERT INTO `quantity_type` VALUES (50, 'CWA (Hundredweight, US (45,3592 kg))');
INSERT INTO `quantity_type` VALUES (51, 'CWI (Long/ hundredweight GB (50,802345 kg))');
INSERT INTO `quantity_type` VALUES (52, 'D40 (Kilo Liter)');
INSERT INTO `quantity_type` VALUES (53, 'DAA (Decare)');
INSERT INTO `quantity_type` VALUES (54, 'DAD (Ten day)');
INSERT INTO `quantity_type` VALUES (55, 'DAY (Day)');
INSERT INTO `quantity_type` VALUES (56, 'DBC (Decade (ten years))');
INSERT INTO `quantity_type` VALUES (57, 'DMK (Square decimetre)');
INSERT INTO `quantity_type` VALUES (58, 'DMQ (Cubic decimetre)');
INSERT INTO `quantity_type` VALUES (59, 'DMT (Decimetre)');
INSERT INTO `quantity_type` VALUES (60, 'DPT (Displecement tonnege)');
INSERT INTO `quantity_type` VALUES (61, 'DRA (Dram US (3,887935 g))');
INSERT INTO `quantity_type` VALUES (62, 'DRI (Dram GB (1,771745 g))');
INSERT INTO `quantity_type` VALUES (63, 'DRL (Dozen rolls)');
INSERT INTO `quantity_type` VALUES (64, 'DRM (Drachm, GB (3,887935 g))');
INSERT INTO `quantity_type` VALUES (65, 'DT (Dry Ton)');
INSERT INTO `quantity_type` VALUES (66, 'DTN (Decitonne, Centner, Quintall, metric (100 kg))');
INSERT INTO `quantity_type` VALUES (67, 'DWT (Pennyweight GB,US (1,555174 g))');
INSERT INTO `quantity_type` VALUES (68, 'EA (Ea)');
INSERT INTO `quantity_type` VALUES (69, 'FAH (degree Fahrenheit)');
INSERT INTO `quantity_type` VALUES (70, 'FOT (Foot (0.3048 m))');
INSERT INTO `quantity_type` VALUES (71, 'FTK (Square foot)');
INSERT INTO `quantity_type` VALUES (72, 'FTQ (Cubic foot)');
INSERT INTO `quantity_type` VALUES (73, 'GBQ (Gigabecquerel)');
INSERT INTO `quantity_type` VALUES (74, 'GGR (Great gross (12 gross))');
INSERT INTO `quantity_type` VALUES (75, 'GIA (Gill (11,8294 cm3))');
INSERT INTO `quantity_type` VALUES (76, 'GII (Gill (0,142065 dm3))');
INSERT INTO `quantity_type` VALUES (77, 'GLD (Dry gallon (4,404884 dm3))');
INSERT INTO `quantity_type` VALUES (78, 'GLI (Gallon (4,546092 dm3))');
INSERT INTO `quantity_type` VALUES (79, 'GLL (Liquid gallon (3,78541 dm3))');
INSERT INTO `quantity_type` VALUES (80, 'GRN (Grain GB,US (64,798910 mg))');
INSERT INTO `quantity_type` VALUES (81, 'GRO (Gross)');
INSERT INTO `quantity_type` VALUES (82, 'GRT (Gross (register) ton)');
INSERT INTO `quantity_type` VALUES (83, 'GWH (Gigawatt-hour (1 million KW/h))');
INSERT INTO `quantity_type` VALUES (84, 'HAR (Hectare)');
INSERT INTO `quantity_type` VALUES (85, 'HBA (Hectobar)');
INSERT INTO `quantity_type` VALUES (86, 'HGM (Hectogram)');
INSERT INTO `quantity_type` VALUES (87, 'HIU (Hundred intenational units)');
INSERT INTO `quantity_type` VALUES (88, 'HLT (Hectolitre)');
INSERT INTO `quantity_type` VALUES (89, 'HMQ (Million cubic metres)');
INSERT INTO `quantity_type` VALUES (90, 'HMT (Hectometre)');
INSERT INTO `quantity_type` VALUES (91, 'HPA (Hectolitre of pure alcohol)');
INSERT INTO `quantity_type` VALUES (92, 'HTZ (Hertz)');
INSERT INTO `quantity_type` VALUES (93, 'HUR (Hour)');
INSERT INTO `quantity_type` VALUES (94, 'INH (Inch (2.54 mm))');
INSERT INTO `quantity_type` VALUES (95, 'INK (Square inch)');
INSERT INTO `quantity_type` VALUES (96, 'INQ (Cubic inch)');
INSERT INTO `quantity_type` VALUES (97, 'JO (Joint)');
INSERT INTO `quantity_type` VALUES (98, 'JOU (Joule)');
INSERT INTO `quantity_type` VALUES (99, 'KBA (Kilobar)');
INSERT INTO `quantity_type` VALUES (100, 'KEL (Kelvin)');
INSERT INTO `quantity_type` VALUES (101, 'KGS (KGS)');
INSERT INTO `quantity_type` VALUES (102, 'KJO (Kilojoule)');
INSERT INTO `quantity_type` VALUES (103, 'KMH (Kilometre per hour)');
INSERT INTO `quantity_type` VALUES (104, 'KMK (Square kilometre)');
INSERT INTO `quantity_type` VALUES (105, 'KMQ (Kilogram per cubic meter)');
INSERT INTO `quantity_type` VALUES (106, 'KMT (Kilometer)');
INSERT INTO `quantity_type` VALUES (107, 'KNI (Kilogram of nitrogen)');
INSERT INTO `quantity_type` VALUES (108, 'KNS (Kilogram of named substance)');
INSERT INTO `quantity_type` VALUES (109, 'KNT (Knot ( 1 n mile oer hour)');
INSERT INTO `quantity_type` VALUES (110, 'KPH (Kilogram of potassium hydroxide (caustic pota)');
INSERT INTO `quantity_type` VALUES (111, 'KPO (Kilogram of potassium oxide)');
INSERT INTO `quantity_type` VALUES (112, 'KPP (Kilogram of phosphorus pentoxide  (phosphoric)');
INSERT INTO `quantity_type` VALUES (113, 'KSD (Kilogram of substance 90 per cent dry)');
INSERT INTO `quantity_type` VALUES (114, 'KSH (Kilogram of sodium hydyoxide  (caustic soda))');
INSERT INTO `quantity_type` VALUES (115, 'KT (Kit)');
INSERT INTO `quantity_type` VALUES (116, 'KTN (Kiloton)');
INSERT INTO `quantity_type` VALUES (117, 'KUR (Kilogram of uranium)');
INSERT INTO `quantity_type` VALUES (118, 'KVA (Kilovolt - ampere)');
INSERT INTO `quantity_type` VALUES (119, 'KWH (Kilowatt-hour)');
INSERT INTO `quantity_type` VALUES (120, 'KWT (Kilowatt)');
INSERT INTO `quantity_type` VALUES (121, 'LBT (Troy pound, US 9373,242 g))');
INSERT INTO `quantity_type` VALUES (122, 'LNT (Long ton GB, US 2/ (1,0160469 t))');
INSERT INTO `quantity_type` VALUES (123, 'LO (Lot)');
INSERT INTO `quantity_type` VALUES (124, 'LPA (Litre of pure alcohol)');
INSERT INTO `quantity_type` VALUES (125, 'LUM (Lumen)');
INSERT INTO `quantity_type` VALUES (126, 'MAL (Megalitre)');
INSERT INTO `quantity_type` VALUES (127, 'MAM (Megametre)');
INSERT INTO `quantity_type` VALUES (128, 'MAW (Megawatt)');
INSERT INTO `quantity_type` VALUES (129, 'MGM (Milligram)');
INSERT INTO `quantity_type` VALUES (130, 'MID (Thousand)');
INSERT INTO `quantity_type` VALUES (131, 'MIK (Square mile)');
INSERT INTO `quantity_type` VALUES (132, 'MIN (Minute)');
INSERT INTO `quantity_type` VALUES (133, 'MIO (Million)');
INSERT INTO `quantity_type` VALUES (134, 'MIU (Million international units)');
INSERT INTO `quantity_type` VALUES (135, 'MLD (Milliard, Billion US)');
INSERT INTO `quantity_type` VALUES (136, 'MLT (Millilitre)');
INSERT INTO `quantity_type` VALUES (137, 'MMK (Square millimetre)');
INSERT INTO `quantity_type` VALUES (138, 'MMQ (Cubic millimetre)');
INSERT INTO `quantity_type` VALUES (139, 'MMT (Milimeter)');
INSERT INTO `quantity_type` VALUES (140, 'MON (Month)');
INSERT INTO `quantity_type` VALUES (141, 'MQH (cubic metre per hour)');
INSERT INTO `quantity_type` VALUES (142, 'MSK (Metre per second squared)');
INSERT INTO `quantity_type` VALUES (143, 'MTK (M2)');
INSERT INTO `quantity_type` VALUES (144, 'MTQ (Meter Kubik)');
INSERT INTO `quantity_type` VALUES (145, 'MTR (Meter)');
INSERT INTO `quantity_type` VALUES (146, 'MVA (Megavolt -  ampere (1000 KVA))');
INSERT INTO `quantity_type` VALUES (147, 'MWH (Megawatt-hour (1000 KW/h))');
INSERT INTO `quantity_type` VALUES (148, 'N2 (Line)');
INSERT INTO `quantity_type` VALUES (149, 'NAR (Number of articles)');
INSERT INTO `quantity_type` VALUES (150, 'NBB (Number bobbins)');
INSERT INTO `quantity_type` VALUES (151, 'NEW (Newton)');
INSERT INTO `quantity_type` VALUES (152, 'NMB (Number)');
INSERT INTO `quantity_type` VALUES (153, 'NMI (Nautical mile (1852 m))');
INSERT INTO `quantity_type` VALUES (154, 'NOS (NOS)');
INSERT INTO `quantity_type` VALUES (155, 'NPL (Number of parcels)');
INSERT INTO `quantity_type` VALUES (156, 'NPR (number of pairs)');
INSERT INTO `quantity_type` VALUES (157, 'NPT (Number of parts)');
INSERT INTO `quantity_type` VALUES (158, 'NTT (Net (regirter) ton)');
INSERT INTO `quantity_type` VALUES (159, 'OHM (Ohm)');
INSERT INTO `quantity_type` VALUES (160, 'ONZ (Ounce GB,US (28,349523 g))');
INSERT INTO `quantity_type` VALUES (161, 'OZA (Fluid ounce (29,5735 cm3))');
INSERT INTO `quantity_type` VALUES (162, 'OZI (Fluid ounce (29,5735 cm3))');
INSERT INTO `quantity_type` VALUES (163, 'PAL (Pascal)');
INSERT INTO `quantity_type` VALUES (164, 'PGL (Proof gallon)');
INSERT INTO `quantity_type` VALUES (165, 'PL (Pail)');
INSERT INTO `quantity_type` VALUES (166, 'PTD (Dry pint (0.55061 dm3))');
INSERT INTO `quantity_type` VALUES (167, 'PTI (Pint (0,568262 dm3))');
INSERT INTO `quantity_type` VALUES (168, 'PTL (Liquid Pint (0,473176 dm3))');
INSERT INTO `quantity_type` VALUES (169, 'QAN (Quarter (of a year))');
INSERT INTO `quantity_type` VALUES (170, 'QTD (Dry quart (1,101221 dm3))');
INSERT INTO `quantity_type` VALUES (171, 'QTI (Quart (1,136523 dm3))');
INSERT INTO `quantity_type` VALUES (172, 'QTL (Liquid quart (0,946353 dm3))');
INSERT INTO `quantity_type` VALUES (173, 'QTR (Quarter GB (12,700586 kg))');
INSERT INTO `quantity_type` VALUES (174, 'RM (Ream)');
INSERT INTO `quantity_type` VALUES (175, 'RPM (Revolution per minute)');
INSERT INTO `quantity_type` VALUES (176, 'RPS (Revolution per second)');
INSERT INTO `quantity_type` VALUES (177, 'SAN (Half year (six Months))');
INSERT INTO `quantity_type` VALUES (178, 'SCO (Score)');
INSERT INTO `quantity_type` VALUES (179, 'SCR (Scruple GP,US (1,295982 g))');
INSERT INTO `quantity_type` VALUES (180, 'SEC (Second)');
INSERT INTO `quantity_type` VALUES (181, 'SHT (Shipping ton)');
INSERT INTO `quantity_type` VALUES (182, 'SIE (Siemens)');
INSERT INTO `quantity_type` VALUES (183, 'SKD (Skid)');
INSERT INTO `quantity_type` VALUES (184, 'SMI (Statute mile (1609.344 m))');
INSERT INTO `quantity_type` VALUES (185, 'SST (Short standard  (7200 matches ))');
INSERT INTO `quantity_type` VALUES (186, 'ST (Sheet)');
INSERT INTO `quantity_type` VALUES (187, 'STI (Stone GB (6,350293 kg))');
INSERT INTO `quantity_type` VALUES (188, 'STN (Short ton GB, US 2/ (0,90718474 t))');
INSERT INTO `quantity_type` VALUES (189, 'TAH (Thousand ampere-hour)');
INSERT INTO `quantity_type` VALUES (190, 'TNE (Ton)');
INSERT INTO `quantity_type` VALUES (191, 'TPR (Ten pairs)');
INSERT INTO `quantity_type` VALUES (192, 'TQD (Thousand cubic metres per day)');
INSERT INTO `quantity_type` VALUES (193, 'TRL (Trillion Eur)');
INSERT INTO `quantity_type` VALUES (194, 'TSD (Tonne of subtance 90 per cent dry)');
INSERT INTO `quantity_type` VALUES (195, 'TSH (Ton of steam per hour)');
INSERT INTO `quantity_type` VALUES (196, 'U2 (Tablet)');
INSERT INTO `quantity_type` VALUES (197, 'VI (Vial)');
INSERT INTO `quantity_type` VALUES (198, 'VLT (Volt)');
INSERT INTO `quantity_type` VALUES (199, 'WCD (Cord (3,63 m3))');
INSERT INTO `quantity_type` VALUES (200, 'WEB (Weber)');
INSERT INTO `quantity_type` VALUES (201, 'WEE (Week)');
INSERT INTO `quantity_type` VALUES (202, 'WHR (Watt-hour)');
INSERT INTO `quantity_type` VALUES (203, 'WSD (Standard)');
INSERT INTO `quantity_type` VALUES (204, 'WTT (Watt)');
INSERT INTO `quantity_type` VALUES (205, 'YDK (Square yard)');
INSERT INTO `quantity_type` VALUES (206, 'YDQ (Cubic yard)');
INSERT INTO `quantity_type` VALUES (207, 'YRD (Yard)');
COMMIT;

-- ----------------------------
-- Table structure for spmb_barang
-- ----------------------------
DROP TABLE IF EXISTS `spmb_barang`;
CREATE TABLE `spmb_barang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `header_id` bigint(20) unsigned DEFAULT NULL,
  `status_barang` int(1) DEFAULT '0',
  `nama_barang` text COLLATE utf8mb4_unicode_ci,
  `jumlah_kemasan` decimal(8,2) DEFAULT NULL,
  `jenis_kemasan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_satuan` int(11) DEFAULT NULL,
  `jenis_satuan` int(11) DEFAULT NULL,
  `hs_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nomor_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `nilai_pabean` int(50) DEFAULT NULL,
  `bruto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lampiran` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(4) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `attachment` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_idx_spmb_barang_temp` (`currency_id`),
  KEY `category_id_fk_id_item_category` (`category_id`),
  KEY `jenis_satuan_fk_qty_type_id` (`jenis_satuan`),
  CONSTRAINT `jenis_satuan_fk_qty_type_id` FOREIGN KEY (`jenis_satuan`) REFERENCES `quantity_type` (`id`),
  CONSTRAINT `spmb_barang_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `item_categories` (`id`),
  CONSTRAINT `spmb_barang_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for spmb_barang_temp
-- ----------------------------
DROP TABLE IF EXISTS `spmb_barang_temp`;
CREATE TABLE `spmb_barang_temp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `header_id` bigint(20) unsigned DEFAULT NULL,
  `nama_barang` text COLLATE utf8mb4_unicode_ci,
  `jumlah_kemasan` decimal(8,2) DEFAULT NULL,
  `jenis_kemasan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_satuan` int(11) DEFAULT NULL,
  `jenis_satuan` int(11) DEFAULT NULL,
  `hs_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nomor_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `nilai_pabean` int(50) DEFAULT NULL,
  `bruto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lampiran` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(4) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `attachment` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_user` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_idx_spmb_barang_temp` (`currency_id`),
  KEY `category_id_fk_id_item_category` (`category_id`),
  CONSTRAINT `category_id_fk_id_item_category` FOREIGN KEY (`category_id`) REFERENCES `item_categories` (`id`),
  CONSTRAINT `currency_idx_spmb_barang_temp` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for spmb_header
-- ----------------------------
DROP TABLE IF EXISTS `spmb_header`;
CREATE TABLE `spmb_header` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `nomor_paspor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_telepon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik_npwp_nib` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kebangsaan` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kantor_pabean_keberangkatan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kantor_pabean_kedatangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bandara_keberangkatan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bandara_kedatangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_penerbangan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_dokumen` date DEFAULT NULL,
  `input_by` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `jumlah_barang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `print_status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `nomor_paspor` (`nomor_paspor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of spmb_header
-- ----------------------------
BEGIN;
INSERT INTO `spmb_header` VALUES (1, 'as', '2021-09-08', 'asd', 'asdas', 'asd', 'asdada', '80', 'asd@asd.asd', '2021-09-28 16:04:11', NULL, 'KPU BEA DAN CUKAI TIPE C SOEKARNO-HATTA', 'KPU BEA DAN CUKAI TIPE C SOEKARNO-HATTA', NULL, '5', 'asd', '1', '1/KB/T3U/SH/2021', '2021-09-28', 'Robbi Amirudin-123123123123123123', 2, 'asdasd', NULL, 'asdas', 0);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` int(10) DEFAULT NULL,
  `unit` varchar(12) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `images` text,
  `date_registration` datetime DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `by` bigint(11) DEFAULT NULL,
  `description` text,
  `is_notif` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
