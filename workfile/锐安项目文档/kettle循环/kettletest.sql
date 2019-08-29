/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : kettletest

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 26/08/2019 19:07:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '研发部');
INSERT INTO `dept` VALUES (2, '财务部');
INSERT INTO `dept` VALUES (3, '采购部');
INSERT INTO `dept` VALUES (4, '战略部');
INSERT INTO `dept` VALUES (5, '市场部');

-- ----------------------------
-- Table structure for inserttable
-- ----------------------------
DROP TABLE IF EXISTS `inserttable`;
CREATE TABLE `inserttable`  (
  `dept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inserttable
-- ----------------------------
INSERT INTO `inserttable` VALUES ('研发部', '2019-01', '2019-08-26 19:04:42');
INSERT INTO `inserttable` VALUES ('研发部', '2019-02', '2019-08-26 19:04:42');
INSERT INTO `inserttable` VALUES ('研发部', '2019-03', '2019-08-26 19:04:42');
INSERT INTO `inserttable` VALUES ('研发部', '2019-04', '2019-08-26 19:04:42');
INSERT INTO `inserttable` VALUES ('研发部', '2019-05', '2019-08-26 19:04:42');
INSERT INTO `inserttable` VALUES ('研发部', '2019-06', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('研发部', '2019-07', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('研发部', '2019-08', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('研发部', '2019-09', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-01', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-02', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-03', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-04', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-05', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-06', '2019-08-26 19:04:43');
INSERT INTO `inserttable` VALUES ('财务部', '2019-07', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('财务部', '2019-08', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('财务部', '2019-09', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-01', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-02', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-03', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-04', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-05', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-06', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-07', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-08', '2019-08-26 19:04:44');
INSERT INTO `inserttable` VALUES ('采购部', '2019-09', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-01', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-02', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-03', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-04', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-05', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-06', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-07', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-08', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('战略部', '2019-09', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('市场部', '2019-01', '2019-08-26 19:04:45');
INSERT INTO `inserttable` VALUES ('市场部', '2019-02', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-03', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-04', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-05', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-06', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-07', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-08', '2019-08-26 19:04:46');
INSERT INTO `inserttable` VALUES ('市场部', '2019-09', '2019-08-26 19:04:46');

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of period
-- ----------------------------
INSERT INTO `period` VALUES (1, '2019-01');
INSERT INTO `period` VALUES (2, '2019-02');
INSERT INTO `period` VALUES (3, '2019-03');
INSERT INTO `period` VALUES (4, '2019-04');
INSERT INTO `period` VALUES (5, '2019-05');
INSERT INTO `period` VALUES (6, '2019-06');
INSERT INTO `period` VALUES (7, '2019-07');
INSERT INTO `period` VALUES (8, '2019-08');
INSERT INTO `period` VALUES (9, '2019-09');

SET FOREIGN_KEY_CHECKS = 1;
