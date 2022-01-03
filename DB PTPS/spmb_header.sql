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

 Date: 03/01/2022 14:42:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `id_dokumen` bigint(20) DEFAULT NULL,
  `nomor_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_dokumen` date DEFAULT NULL,
  `year_increment` int(4) DEFAULT NULL,
  `number_increment` int(4) DEFAULT NULL,
  `input_by` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `jumlah_barang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `print_status` int(2) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `nomor_paspor` (`nomor_paspor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
