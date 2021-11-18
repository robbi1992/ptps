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

 Date: 11/11/2021 19:59:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `en_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of countries
-- ----------------------------
BEGIN;
INSERT INTO `countries` VALUES (1, 'Singapura', 'Singapore');
INSERT INTO `countries` VALUES (2, 'Malaysia', 'Malaysia');
INSERT INTO `countries` VALUES (3, 'Jepang', 'Japan');
INSERT INTO `countries` VALUES (4, 'Thailand', 'Thailand');
INSERT INTO `countries` VALUES (5, 'Korea Selatan', 'South Korea');
INSERT INTO `countries` VALUES (6, 'Perancis', 'France');
INSERT INTO `countries` VALUES (7, 'Jerman', 'German');
INSERT INTO `countries` VALUES (8, 'Belanda', 'Dutch');
INSERT INTO `countries` VALUES (9, 'Arab Saudi', 'Saudi Arabia');
INSERT INTO `countries` VALUES (10, 'Turki', 'Turkey');
INSERT INTO `countries` VALUES (11, 'China', 'China');
INSERT INTO `countries` VALUES (12, 'Hongkong', 'Hongkong');
INSERT INTO `countries` VALUES (13, 'Uni Emirat Arab', 'United Arab Emirates');
INSERT INTO `countries` VALUES (14, 'Taiwan', 'Taiwan');
INSERT INTO `countries` VALUES (15, 'Qatar', 'Qatar');
INSERT INTO `countries` VALUES (16, 'Afganistan', 'Afghanistan');
INSERT INTO `countries` VALUES (17, 'Afrika Selatan', 'south Africa');
INSERT INTO `countries` VALUES (18, 'Afrika Tengah', 'Central Africa');
INSERT INTO `countries` VALUES (19, 'Albania', 'Albania');
INSERT INTO `countries` VALUES (20, 'Aljazair', 'Algeria');
INSERT INTO `countries` VALUES (21, 'Amerika Serikat', 'United States of America\n\n');
INSERT INTO `countries` VALUES (22, 'Andorra', 'Andorra');
INSERT INTO `countries` VALUES (23, 'Angola', 'Angola');
INSERT INTO `countries` VALUES (24, 'Antigua dan Barbuda', 'Antigua and Barbuda');
INSERT INTO `countries` VALUES (25, 'Argentina', 'Argentina');
INSERT INTO `countries` VALUES (26, 'Armenia', 'Armenia');
INSERT INTO `countries` VALUES (27, 'Australia', 'Australia');
INSERT INTO `countries` VALUES (28, 'Austria', 'Austria');
INSERT INTO `countries` VALUES (29, 'Azerbaijan', 'Azerbaijan');
INSERT INTO `countries` VALUES (30, 'Bahama', 'Bahama');
INSERT INTO `countries` VALUES (31, 'Bahrain', 'Bahrain');
INSERT INTO `countries` VALUES (32, 'Bangladesh', 'Bangladesh');
INSERT INTO `countries` VALUES (33, 'Barbados', 'Barbados');
INSERT INTO `countries` VALUES (34, 'Belarus', 'Belarus');
INSERT INTO `countries` VALUES (35, 'Belgia', 'Belgium');
INSERT INTO `countries` VALUES (36, 'Belize', 'Belize');
INSERT INTO `countries` VALUES (37, 'Benin', 'Benin');
INSERT INTO `countries` VALUES (38, 'Bhutan', 'Bhutan');
INSERT INTO `countries` VALUES (39, 'Bolivia', 'Bolivia');
INSERT INTO `countries` VALUES (40, 'Bosnia dan Herzegovina', 'Bosnia and Herzegovina');
INSERT INTO `countries` VALUES (41, 'Botswana', 'Botswana');
INSERT INTO `countries` VALUES (42, 'Brazil', 'Brazil');
INSERT INTO `countries` VALUES (43, 'Britania Raya', 'United Kingdom');
INSERT INTO `countries` VALUES (44, 'Brunei Darussalam', 'Brunei Darussalam');
INSERT INTO `countries` VALUES (45, 'Bulgaria', 'Bulgaria');
INSERT INTO `countries` VALUES (46, 'Burkina Faso', 'Burkina Faso');
INSERT INTO `countries` VALUES (47, 'Burundi', 'Burundi');
INSERT INTO `countries` VALUES (48, 'Ceko', 'Czech');
INSERT INTO `countries` VALUES (49, 'Chad', 'Chad');
INSERT INTO `countries` VALUES (50, 'Chili', 'Chili');
INSERT INTO `countries` VALUES (51, 'Denmark', 'Denmark');
INSERT INTO `countries` VALUES (52, 'Djibouti', 'Djibouti');
INSERT INTO `countries` VALUES (53, 'Dominika', 'Dominika');
INSERT INTO `countries` VALUES (54, 'Ekuador', 'Ecuador');
INSERT INTO `countries` VALUES (55, 'El Salvador', 'The Savior');
INSERT INTO `countries` VALUES (56, 'Eritrea', 'Eritrea');
INSERT INTO `countries` VALUES (57, 'Estonia', 'Estonia');
INSERT INTO `countries` VALUES (58, 'Ethiopia', 'Ethiopia');
INSERT INTO `countries` VALUES (59, 'Fiji', 'Fiji');
INSERT INTO `countries` VALUES (60, 'Filipina', 'Filipina');
INSERT INTO `countries` VALUES (61, 'Finlandia', 'Finland');
INSERT INTO `countries` VALUES (62, 'Gabon', 'Gabon');
INSERT INTO `countries` VALUES (63, 'Gambia', 'Gambia');
INSERT INTO `countries` VALUES (64, 'Georgia', 'Georgia');
INSERT INTO `countries` VALUES (65, 'Ghana', 'Ghana');
INSERT INTO `countries` VALUES (66, 'Grenada', 'Grenada');
INSERT INTO `countries` VALUES (67, 'Guatemala', 'Guatemala');
INSERT INTO `countries` VALUES (68, 'Guinea', 'Guinea');
INSERT INTO `countries` VALUES (69, 'Guinea Bissau', 'Guinea Bissau');
INSERT INTO `countries` VALUES (70, 'Guinea Khatulistiwa', 'Equatorial Guinea');
INSERT INTO `countries` VALUES (71, 'Guyana', 'Guyana');
INSERT INTO `countries` VALUES (72, 'Haiti', 'Haiti');
INSERT INTO `countries` VALUES (73, 'Honduras', 'Honduras');
INSERT INTO `countries` VALUES (74, 'Hongaria', 'Hungary');
INSERT INTO `countries` VALUES (75, 'India', 'India');
INSERT INTO `countries` VALUES (76, 'Indonesia', 'Indonesia');
INSERT INTO `countries` VALUES (77, 'Irak', 'Iraq');
INSERT INTO `countries` VALUES (78, 'Iran', 'Iran');
INSERT INTO `countries` VALUES (79, 'Irlandia', 'Ireland');
INSERT INTO `countries` VALUES (80, 'Islandia', 'Iceland');
INSERT INTO `countries` VALUES (81, 'Israel', 'Israel');
INSERT INTO `countries` VALUES (82, 'Italia', 'Italy');
INSERT INTO `countries` VALUES (83, 'Jamaika', 'Jamaica');
INSERT INTO `countries` VALUES (84, 'Kamboja', 'Cambodia');
INSERT INTO `countries` VALUES (85, 'Kamerun', 'Cameroon');
INSERT INTO `countries` VALUES (86, 'Kanada', 'Canada');
INSERT INTO `countries` VALUES (87, 'Kazakhstan', 'Kazakhstan');
INSERT INTO `countries` VALUES (88, 'Kenya', 'Kenya');
INSERT INTO `countries` VALUES (89, 'Kirgizstan', 'Kyrgyzstan');
INSERT INTO `countries` VALUES (90, 'Kiribati', 'Kiribati');
INSERT INTO `countries` VALUES (91, 'Kolombia', 'Colombia');
INSERT INTO `countries` VALUES (92, 'Komoro', 'Comoros');
INSERT INTO `countries` VALUES (93, 'Republik Kongo', 'Republic of the Congo');
INSERT INTO `countries` VALUES (94, 'Korea Utara', 'North Korea');
INSERT INTO `countries` VALUES (95, 'Kosta Rika', 'Costa Rica');
INSERT INTO `countries` VALUES (96, 'Kroasia', 'Croatia');
INSERT INTO `countries` VALUES (97, 'Kuba', 'Cuba');
INSERT INTO `countries` VALUES (98, 'Kuwait', 'Kuwait');
INSERT INTO `countries` VALUES (99, 'Laos', 'Laos');
INSERT INTO `countries` VALUES (100, 'Latvia', 'Latvia');
INSERT INTO `countries` VALUES (101, 'Lebanon', 'Lebanon');
INSERT INTO `countries` VALUES (102, 'Lesotho', 'Lesotho');
INSERT INTO `countries` VALUES (103, 'Liberia', 'Liberia');
INSERT INTO `countries` VALUES (104, 'Libya', 'Libya');
INSERT INTO `countries` VALUES (105, 'Liechtenstein', 'Liechtenstein');
INSERT INTO `countries` VALUES (106, 'Lituania', 'Lithuania');
INSERT INTO `countries` VALUES (107, 'Luksemburg', 'Luxembourg');
INSERT INTO `countries` VALUES (108, 'Madagaskar', 'Madagascar');
INSERT INTO `countries` VALUES (109, 'Makedonia', 'Macedonian');
INSERT INTO `countries` VALUES (110, 'Maladewa', 'Maldives');
INSERT INTO `countries` VALUES (111, 'Malawi', 'Malawi');
INSERT INTO `countries` VALUES (112, 'Mali', 'Mali');
INSERT INTO `countries` VALUES (113, 'Malta', 'Malta');
INSERT INTO `countries` VALUES (114, 'Maroko', 'Morocco');
INSERT INTO `countries` VALUES (115, 'Marshall', 'Marshall');
INSERT INTO `countries` VALUES (116, 'Mauritania', 'Mauritania');
INSERT INTO `countries` VALUES (117, 'Mauritius', 'Mauritius');
INSERT INTO `countries` VALUES (118, 'Meksiko', 'Mexico');
INSERT INTO `countries` VALUES (119, 'Mesir', 'Egypt');
INSERT INTO `countries` VALUES (120, 'Mikronesia', 'Micronesia');
INSERT INTO `countries` VALUES (121, 'Moldova', 'Moldova');
INSERT INTO `countries` VALUES (122, 'Monako', 'Monaco');
INSERT INTO `countries` VALUES (123, 'Mongolia', 'Mongolia');
INSERT INTO `countries` VALUES (124, 'Montenegro', 'Montenegro');
INSERT INTO `countries` VALUES (125, 'Mozambik', 'Mozambique');
INSERT INTO `countries` VALUES (126, 'Myanmar', 'Myanmar');
INSERT INTO `countries` VALUES (127, 'Namibia', 'Namibia');
INSERT INTO `countries` VALUES (128, 'Nauru', 'Nauru');
INSERT INTO `countries` VALUES (129, 'Nepal', 'Nepal');
INSERT INTO `countries` VALUES (130, 'Niger', 'Nigeria');
INSERT INTO `countries` VALUES (131, 'Nigeria', 'Nigeria');
INSERT INTO `countries` VALUES (132, 'Nikaragua', 'Nikaragua');
INSERT INTO `countries` VALUES (133, 'Norwegia', 'Norwegia');
INSERT INTO `countries` VALUES (134, 'Oman', 'Oman');
INSERT INTO `countries` VALUES (135, 'Pakistan', 'Pakistan');
INSERT INTO `countries` VALUES (136, 'Palau', 'Palau');
INSERT INTO `countries` VALUES (137, 'Panama', 'Panama');
INSERT INTO `countries` VALUES (138, 'Pantai Gading - Cote divoire', 'Ivory Coast - Cote divoire');
INSERT INTO `countries` VALUES (139, 'Papua Nugini', 'Papua New Guinea');
INSERT INTO `countries` VALUES (140, 'Paraguay', 'Paraguay');
INSERT INTO `countries` VALUES (141, 'Peru', 'Peru');
INSERT INTO `countries` VALUES (142, 'Polandia', 'Poland');
INSERT INTO `countries` VALUES (143, 'Portugal', 'Portugal');
INSERT INTO `countries` VALUES (144, 'Republik Demokratik Kongo', 'Democratic Republic of the Congo');
INSERT INTO `countries` VALUES (145, 'Republik Dominika', 'Dominican Republic');
INSERT INTO `countries` VALUES (146, 'Rumania', 'Romania');
INSERT INTO `countries` VALUES (147, 'Rusia', 'Russia');
INSERT INTO `countries` VALUES (148, 'Rwanda', 'Rwanda');
INSERT INTO `countries` VALUES (149, 'Saint Kitts and Nevis', 'Saint Kitts and Nevis');
INSERT INTO `countries` VALUES (150, 'Saint Lucia', 'Saint Lucia');
INSERT INTO `countries` VALUES (151, 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines');
INSERT INTO `countries` VALUES (152, 'Samoa', 'Samoa');
INSERT INTO `countries` VALUES (153, 'San Marino', 'San Marino');
INSERT INTO `countries` VALUES (154, 'Sao Tome and Principe', 'Sao Tome and Principe');
INSERT INTO `countries` VALUES (155, 'Selandia Baru', 'New Zealand');
INSERT INTO `countries` VALUES (156, 'Senegal', 'Senegal');
INSERT INTO `countries` VALUES (157, 'Serbia', 'Serbia');
INSERT INTO `countries` VALUES (158, 'Seychelles', 'Seychelles');
INSERT INTO `countries` VALUES (159, 'Sierra Leone', 'Sierra Leone');
INSERT INTO `countries` VALUES (160, 'Siprus', 'Cyprus');
INSERT INTO `countries` VALUES (161, 'Slovenia', 'Slovenia');
INSERT INTO `countries` VALUES (162, 'Slowakia', 'Slovakia');
INSERT INTO `countries` VALUES (163, 'Solomon', 'Solomon');
INSERT INTO `countries` VALUES (164, 'Somalia', 'Somalia');
INSERT INTO `countries` VALUES (165, 'Spanyol', 'Spanish');
INSERT INTO `countries` VALUES (166, 'Sri Lanka', 'Sri Lanka');
INSERT INTO `countries` VALUES (167, 'Sudan', 'Sudan');
INSERT INTO `countries` VALUES (168, 'Sudan Selatan', 'South Sudan');
INSERT INTO `countries` VALUES (169, 'Suriah', 'Syria');
INSERT INTO `countries` VALUES (170, 'Suriname', 'Suriname');
INSERT INTO `countries` VALUES (171, 'Swaziland', 'Swaziland');
INSERT INTO `countries` VALUES (172, 'Swedia', 'Sweden');
INSERT INTO `countries` VALUES (173, 'Swiss', 'Switzerland');
INSERT INTO `countries` VALUES (174, 'Tajikistan', 'Tajikistan');
INSERT INTO `countries` VALUES (175, 'Tanjung Verde', 'Cape Verde');
INSERT INTO `countries` VALUES (176, 'Tanzania', 'Tanzania');
INSERT INTO `countries` VALUES (177, 'Timor Leste', 'Timor Leste');
INSERT INTO `countries` VALUES (178, 'Togo', 'Togo');
INSERT INTO `countries` VALUES (179, 'Tonga', 'Tonga');
INSERT INTO `countries` VALUES (180, 'Trinidad and Tobago', 'Trinidad and Tobago');
INSERT INTO `countries` VALUES (181, 'Tunisia', 'Tunis');
INSERT INTO `countries` VALUES (182, 'Turkmenistan', 'Turkmenistan');
INSERT INTO `countries` VALUES (183, 'Tuvalu', 'Tuvalu');
INSERT INTO `countries` VALUES (184, 'Uganda', 'Uganda');
INSERT INTO `countries` VALUES (185, 'Ukraina', 'Ukraine');
INSERT INTO `countries` VALUES (186, 'Uruguay', 'Uruguay');
INSERT INTO `countries` VALUES (187, 'Uzbekistan', 'Uzbekistan');
INSERT INTO `countries` VALUES (188, 'Vanuatu', 'Vanuatu');
INSERT INTO `countries` VALUES (189, 'Venezuela', 'Venezuela');
INSERT INTO `countries` VALUES (190, 'Vietnam', 'Vietnam');
INSERT INTO `countries` VALUES (191, 'Yaman', 'Yemen');
INSERT INTO `countries` VALUES (192, 'Yordania', 'Jordan');
INSERT INTO `countries` VALUES (193, 'Yunani', 'Greece');
INSERT INTO `countries` VALUES (194, 'Zambia', 'Zambia');
INSERT INTO `countries` VALUES (195, 'Zimbabwe', 'Zimbabwe');
INSERT INTO `countries` VALUES (196, 'Vatican City', 'Vatican City');
INSERT INTO `countries` VALUES (197, 'Palestina', 'Palestine');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
