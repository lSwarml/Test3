/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 27/11/2019 22:40:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `NameCom` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TextCom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateCom` datetime(0) NOT NULL,
  `FileCom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 231 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (5, 'Соня', '55555555555555555555555555555555555555555555555555', '2019-11-17 03:05:45', NULL);
INSERT INTO `comment` VALUES (6, 'Лена', '6666666666666666666666666666666666666666666666666666', '2019-11-22 12:05:45', NULL);
INSERT INTO `comment` VALUES (7, 'Роман', '77777777777777777777777777777777777777777777777777', '2019-11-22 06:06:00', NULL);
INSERT INTO `comment` VALUES (223, 'Макс', 'Комент', '2019-11-27 18:22:12', '127stats_on_gen_x.png');
INSERT INTO `comment` VALUES (224, 'Саня', 'Комент2', '2019-11-27 18:22:41', '1784ava.jpg');
INSERT INTO `comment` VALUES (230, 'Леша', 'Кек', '2019-11-27 19:47:56', '66249sn7opflixg.jpg');

SET FOREIGN_KEY_CHECKS = 1;
