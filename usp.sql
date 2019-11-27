/*
 Navicat Premium Data Transfer

 Source Server         : Uspevaimost
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : localhost:3306
 Source Schema         : usp

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 28/02/2019 15:43:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ball_stud
-- ----------------------------
DROP TABLE IF EXISTS `ball_stud`;
CREATE TABLE `ball_stud`  (
  `id_ball_stud` int(255) NOT NULL AUTO_INCREMENT,
  `id_prepod` int(255) NULL DEFAULT NULL,
  `id_stud_grup` int(255) NULL DEFAULT NULL,
  `id_ucheb_plan` int(255) NULL DEFAULT NULL,
  `vist_ball` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_ball_stud`) USING BTREE,
  INDEX `id_ucheb_plan`(`id_ucheb_plan`) USING BTREE,
  INDEX `id_prepod`(`id_prepod`) USING BTREE,
  INDEX `id_stud_grup`(`id_stud_grup`) USING BTREE,
  CONSTRAINT `ball_stud_ibfk_1` FOREIGN KEY (`id_ucheb_plan`) REFERENCES `ucheb_plan` (`id_ucheb_plan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ball_stud_ibfk_2` FOREIGN KEY (`id_prepod`) REFERENCES `prepod` (`id_prepod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ball_stud_ibfk_3` FOREIGN KEY (`id_stud_grup`) REFERENCES `student_guppa` (`id_stud_grup`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ball_stud
-- ----------------------------
INSERT INTO `ball_stud` VALUES (1, 1, 1, 1, '1');
INSERT INTO `ball_stud` VALUES (2, 1, 1, 1, '2');
INSERT INTO `ball_stud` VALUES (3, 2, 1, 2, '3');
INSERT INTO `ball_stud` VALUES (4, 2, 2, 2, '4');

-- ----------------------------
-- Table structure for distepl
-- ----------------------------
DROP TABLE IF EXISTS `distepl`;
CREATE TABLE `distepl`  (
  `id_distepl` int(255) NOT NULL,
  `distepl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_distepl`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of distepl
-- ----------------------------
INSERT INTO `distepl` VALUES (0, 'Компьютерные системы');
INSERT INTO `distepl` VALUES (1, 'Базы данных');
INSERT INTO `distepl` VALUES (2, 'История');
INSERT INTO `distepl` VALUES (3, 'Руссский');
INSERT INTO `distepl` VALUES (4, 'Математика');
INSERT INTO `distepl` VALUES (5, 'Литература');
INSERT INTO `distepl` VALUES (6, 'Компьютерные системы');
INSERT INTO `distepl` VALUES (7, 'Право');
INSERT INTO `distepl` VALUES (8, 'Философия');
INSERT INTO `distepl` VALUES (9, 'Менеджмент');
INSERT INTO `distepl` VALUES (10, 'Физичиская культура');

-- ----------------------------
-- Table structure for doljnost
-- ----------------------------
DROP TABLE IF EXISTS `doljnost`;
CREATE TABLE `doljnost`  (
  `id_doljnosti` int(255) NOT NULL,
  `doljnost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_doljnosti`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fakul
-- ----------------------------
DROP TABLE IF EXISTS `fakul`;
CREATE TABLE `fakul`  (
  `id_fakul` int(255) NOT NULL,
  `fakul` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_fakul`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fakul
-- ----------------------------
INSERT INTO `fakul` VALUES (1, 'Информатика');
INSERT INTO `fakul` VALUES (2, 'Юриспруденция');
INSERT INTO `fakul` VALUES (3, 'Менеждмент');

-- ----------------------------
-- Table structure for felial
-- ----------------------------
DROP TABLE IF EXISTS `felial`;
CREATE TABLE `felial`  (
  `id_fel` int(255) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_fel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of felial
-- ----------------------------
INSERT INTO `felial` VALUES (1, 'Головной');
INSERT INTO `felial` VALUES (2, 'Фелиал');

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `id_form` int(255) NOT NULL,
  `form` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id_form`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES (1, 'Очная');
INSERT INTO `form` VALUES (2, 'Заочная');
INSERT INTO `form` VALUES (3, 'dfhgdfh');

-- ----------------------------
-- Table structure for god
-- ----------------------------
DROP TABLE IF EXISTS `god`;
CREATE TABLE `god`  (
  `Id_god` int(255) NOT NULL,
  `god` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id_god`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of god
-- ----------------------------
INSERT INTO `god` VALUES (1, '2011');
INSERT INTO `god` VALUES (2, '2012');
INSERT INTO `god` VALUES (3, '2013');
INSERT INTO `god` VALUES (4, '2014');
INSERT INTO `god` VALUES (5, '2015');

-- ----------------------------
-- Table structure for gruppa
-- ----------------------------
DROP TABLE IF EXISTS `gruppa`;
CREATE TABLE `gruppa`  (
  `Id_grup` int(255) NOT NULL,
  `id_fel` int(255) NULL DEFAULT NULL,
  `id_form` int(255) NULL DEFAULT NULL,
  `Id_god` int(255) NULL DEFAULT NULL,
  `id_fakul` int(255) NULL DEFAULT NULL,
  `id_spec` int(255) NULL DEFAULT NULL,
  `grup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id_grup`) USING BTREE,
  INDEX `Id_god`(`Id_god`) USING BTREE,
  INDEX `id_fakul`(`id_fakul`) USING BTREE,
  INDEX `id_form`(`id_form`) USING BTREE,
  INDEX `id_spec`(`id_spec`) USING BTREE,
  INDEX `id_fel`(`id_fel`) USING BTREE,
  CONSTRAINT `gruppa_ibfk_1` FOREIGN KEY (`Id_god`) REFERENCES `god` (`Id_god`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gruppa_ibfk_2` FOREIGN KEY (`id_fakul`) REFERENCES `fakul` (`id_fakul`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gruppa_ibfk_4` FOREIGN KEY (`id_form`) REFERENCES `form` (`id_form`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gruppa_ibfk_5` FOREIGN KEY (`id_spec`) REFERENCES `spec` (`id_spec`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gruppa_ibfk_6` FOREIGN KEY (`id_fel`) REFERENCES `felial` (`id_fel`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gruppa
-- ----------------------------
INSERT INTO `gruppa` VALUES (1, 1, 1, 2, 1, 1, 'ДЛИ-501');
INSERT INTO `gruppa` VALUES (2, 1, 1, 2, 1, 1, 'ДЛЭ-501');

-- ----------------------------
-- Table structure for gruppa_ucheb_plan
-- ----------------------------
DROP TABLE IF EXISTS `gruppa_ucheb_plan`;
CREATE TABLE `gruppa_ucheb_plan`  (
  `id_gruppa_ucheb_plan` int(255) NOT NULL AUTO_INCREMENT,
  `id_grup` int(255) NULL DEFAULT NULL,
  `id_ucheb_plan` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_gruppa_ucheb_plan`) USING BTREE,
  INDEX `id_grup`(`id_grup`) USING BTREE,
  INDEX `id_ucheb_plan`(`id_ucheb_plan`) USING BTREE,
  CONSTRAINT `gruppa_ucheb_plan_ibfk_1` FOREIGN KEY (`id_grup`) REFERENCES `gruppa` (`Id_grup`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gruppa_ucheb_plan_ibfk_2` FOREIGN KEY (`id_ucheb_plan`) REFERENCES `ucheb_plan` (`id_ucheb_plan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for kafed
-- ----------------------------
DROP TABLE IF EXISTS `kafed`;
CREATE TABLE `kafed`  (
  `id_kafed` int(255) NOT NULL,
  `kafed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kafed`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prepod
-- ----------------------------
DROP TABLE IF EXISTS `prepod`;
CREATE TABLE `prepod`  (
  `id_prepod` int(255) NOT NULL,
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` int(255) NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_t` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password_t` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_prepod`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of prepod
-- ----------------------------
INSERT INTO `prepod` VALUES (1, 'Герасимов', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `prepod` VALUES (2, 'Осипова', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for prepod-doljnosti
-- ----------------------------
DROP TABLE IF EXISTS `prepod-doljnosti`;
CREATE TABLE `prepod-doljnosti`  (
  `id_spr_1` int(255) NOT NULL,
  `id_prepod` int(255) NULL DEFAULT NULL,
  `id_doljnosti` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_spr_1`) USING BTREE,
  INDEX `id_doljnosti`(`id_doljnosti`) USING BTREE,
  INDEX `id_prepod`(`id_prepod`) USING BTREE,
  CONSTRAINT `prepod-doljnosti_ibfk_1` FOREIGN KEY (`id_prepod`) REFERENCES `prepod` (`id_prepod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prepod-doljnosti_ibfk_2` FOREIGN KEY (`id_doljnosti`) REFERENCES `doljnost` (`id_doljnosti`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prepod-kafed
-- ----------------------------
DROP TABLE IF EXISTS `prepod-kafed`;
CREATE TABLE `prepod-kafed`  (
  `id_spr_4` int(255) NOT NULL,
  `id_prepod` int(255) NULL DEFAULT NULL,
  `id_kafed` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_spr_4`) USING BTREE,
  INDEX `id_kafed`(`id_kafed`) USING BTREE,
  INDEX `prepod-kafed_ibfk_2`(`id_prepod`) USING BTREE,
  CONSTRAINT `prepod-kafed_ibfk_1` FOREIGN KEY (`id_kafed`) REFERENCES `kafed` (`id_kafed`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prepod-kafed_ibfk_2` FOREIGN KEY (`id_prepod`) REFERENCES `prepod` (`id_prepod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prepod-ut_step
-- ----------------------------
DROP TABLE IF EXISTS `prepod-ut_step`;
CREATE TABLE `prepod-ut_step`  (
  `id_spr_3` int(255) NOT NULL,
  `id_prepod` int(255) NULL DEFAULT NULL,
  `id_ut_step` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_spr_3`) USING BTREE,
  INDEX `id_ut_step`(`id_ut_step`) USING BTREE,
  INDEX `prepod-ut_step_ibfk_3`(`id_prepod`) USING BTREE,
  CONSTRAINT `prepod-ut_step_ibfk_1` FOREIGN KEY (`id_ut_step`) REFERENCES `ut_step` (`id_ut_step`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prepod-ut_step_ibfk_3` FOREIGN KEY (`id_prepod`) REFERENCES `prepod` (`id_prepod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for prepod-ut_zvan
-- ----------------------------
DROP TABLE IF EXISTS `prepod-ut_zvan`;
CREATE TABLE `prepod-ut_zvan`  (
  `id_spr_2` int(255) NOT NULL,
  `id_ut_zvan` int(255) NULL DEFAULT NULL,
  `id_prepod` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_spr_2`) USING BTREE,
  INDEX `id_ut_zvan`(`id_ut_zvan`) USING BTREE,
  INDEX `id_prepod`(`id_prepod`) USING BTREE,
  CONSTRAINT `prepod-ut_zvan_ibfk_1` FOREIGN KEY (`id_prepod`) REFERENCES `prepod` (`id_prepod`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prepod-ut_zvan_ibfk_2` FOREIGN KEY (`id_ut_zvan`) REFERENCES `ut_zvan` (`id_ut_zvan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sim
-- ----------------------------
DROP TABLE IF EXISTS `sim`;
CREATE TABLE `sim`  (
  `id_sim` int(255) NOT NULL,
  `sim` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_sim`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sim
-- ----------------------------
INSERT INTO `sim` VALUES (1, '1');
INSERT INTO `sim` VALUES (2, '2');
INSERT INTO `sim` VALUES (3, '3');
INSERT INTO `sim` VALUES (4, '4');
INSERT INTO `sim` VALUES (5, '5');
INSERT INTO `sim` VALUES (6, '6');
INSERT INTO `sim` VALUES (7, '7');
INSERT INTO `sim` VALUES (8, '8');
INSERT INTO `sim` VALUES (9, '9');
INSERT INTO `sim` VALUES (10, '10');

-- ----------------------------
-- Table structure for spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec`  (
  `id_spec` int(255) NOT NULL,
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_spec`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of spec
-- ----------------------------
INSERT INTO `spec` VALUES (1, 'Прикладная информатика');
INSERT INTO `spec` VALUES (2, 'Банковское дело');
INSERT INTO `spec` VALUES (3, 'Менеджмент');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id_stud` int(255) NOT NULL AUTO_INCREMENT,
  `fname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gorod` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `login_s` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password_s` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_stud`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'Иванов', 'Иван', 'Иванович', '89521684', 'Ярославль', 'login1', '111');
INSERT INTO `student` VALUES (2, 'Калинин', 'Максим', 'Евгенивич', '000000001', 'Урюпинск', 'login2', '222');

-- ----------------------------
-- Table structure for student_guppa
-- ----------------------------
DROP TABLE IF EXISTS `student_guppa`;
CREATE TABLE `student_guppa`  (
  `id_stud_grup` int(255) NOT NULL AUTO_INCREMENT,
  `id_stud` int(255) NULL DEFAULT NULL,
  `id_grup` int(255) NULL DEFAULT NULL,
  `Sum_ball` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_stud_grup`) USING BTREE,
  INDEX `id_stud`(`id_stud`) USING BTREE,
  INDEX `id_grup`(`id_grup`) USING BTREE,
  CONSTRAINT `student_guppa_ibfk_1` FOREIGN KEY (`id_stud`) REFERENCES `student` (`id_stud`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_guppa_ibfk_2` FOREIGN KEY (`id_grup`) REFERENCES `gruppa` (`Id_grup`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_guppa
-- ----------------------------
INSERT INTO `student_guppa` VALUES (1, 1, 1, '50');
INSERT INTO `student_guppa` VALUES (2, 2, 1, '30');

-- ----------------------------
-- Table structure for ucheb_plan
-- ----------------------------
DROP TABLE IF EXISTS `ucheb_plan`;
CREATE TABLE `ucheb_plan`  (
  `id_ucheb_plan` int(255) NOT NULL AUTO_INCREMENT,
  `id_vid_rabot` int(255) NULL DEFAULT NULL,
  `id_sim` int(255) NULL DEFAULT NULL,
  `id_distepl` int(255) NULL DEFAULT NULL,
  `kal_ballov` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_ucheb_plan`) USING BTREE,
  INDEX `id_vid_rabot`(`id_vid_rabot`) USING BTREE,
  INDEX `id_sim`(`id_sim`) USING BTREE,
  INDEX `id_distepl`(`id_distepl`) USING BTREE,
  CONSTRAINT `ucheb_plan_ibfk_1` FOREIGN KEY (`id_vid_rabot`) REFERENCES `vid_rabot` (`id_vid_rabot`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ucheb_plan_ibfk_2` FOREIGN KEY (`id_sim`) REFERENCES `sim` (`id_sim`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ucheb_plan_ibfk_3` FOREIGN KEY (`id_distepl`) REFERENCES `distepl` (`id_distepl`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ucheb_plan
-- ----------------------------
INSERT INTO `ucheb_plan` VALUES (1, 1, 1, 0, '15');
INSERT INTO `ucheb_plan` VALUES (2, 2, 1, 1, '10');

-- ----------------------------
-- Table structure for ut_step
-- ----------------------------
DROP TABLE IF EXISTS `ut_step`;
CREATE TABLE `ut_step`  (
  `id_ut_step` int(255) NOT NULL,
  `ut_step` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_ut_step`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ut_zvan
-- ----------------------------
DROP TABLE IF EXISTS `ut_zvan`;
CREATE TABLE `ut_zvan`  (
  `id_ut_zvan` int(255) NOT NULL,
  `ut_zvan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_ut_zvan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for vid_rabot
-- ----------------------------
DROP TABLE IF EXISTS `vid_rabot`;
CREATE TABLE `vid_rabot`  (
  `id_vid_rabot` int(255) NOT NULL AUTO_INCREMENT,
  `vid_rabot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_vid_rabot`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vid_rabot
-- ----------------------------
INSERT INTO `vid_rabot` VALUES (1, 'Контрольная');
INSERT INTO `vid_rabot` VALUES (2, 'Классная');
INSERT INTO `vid_rabot` VALUES (3, 'Домашняя');
INSERT INTO `vid_rabot` VALUES (4, 'Реферат');

SET FOREIGN_KEY_CHECKS = 1;
