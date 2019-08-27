/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/08/2019 19:53:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_water_type_mapping
-- ----------------------------
DROP TABLE IF EXISTS `dept_water_type_mapping`;
CREATE TABLE `dept_water_type_mapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WART_TYPE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DES` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_water_type_mapping
-- ----------------------------
INSERT INTO `dept_water_type_mapping` VALUES (1, '1', '1', '化工部分包含甲醇厂区新水');
INSERT INTO `dept_water_type_mapping` VALUES (2, '2', '2', '炼油部分包含炼油1#新水表');
INSERT INTO `dept_water_type_mapping` VALUES (3, '3', '3', '一联合车间包含一套蒸馏新水');
INSERT INTO `dept_water_type_mapping` VALUES (4, '1', '4', '一套制氢机房新水\r\n 一套制氢机房新水\r\n');

-- ----------------------------
-- Table structure for new_water_monthly_info
-- ----------------------------
DROP TABLE IF EXISTS `new_water_monthly_info`;
CREATE TABLE `new_water_monthly_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WART_TYPE_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PEROID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TIME` date NULL DEFAULT NULL,
  `RATIO` int(11) NULL DEFAULT NULL,
  `TAG_NUMBER` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MONTHLY_VALUE` decimal(20, 2) NULL DEFAULT 0.00,
  `METERING_NUMBER` decimal(20, 2) NULL DEFAULT 0.00,
  `PIPE_CAL_NUMBER` decimal(20, 2) NULL DEFAULT 0.00,
  `INTERVAL_NUMBER` decimal(20, 2) NULL DEFAULT 0.00,
  `CONSUMING_NUMBER` decimal(20, 2) NULL DEFAULT 0.00,
  `MOMENT_NUMBER` decimal(20, 2) NULL DEFAULT 0.00,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pull_date` date NULL DEFAULT NULL,
  `FLEX_FILED1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_water_monthly_info
-- ----------------------------
INSERT INTO `new_water_monthly_info` VALUES (6, '1', '1', '2019-06', '2019-08-22', NULL, NULL, 111122.00, 61122.00, 0.00, 0.00, 1834.16, 87.44, NULL, '2019-06-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (7, '1', '4', '2019-06', '2019-08-22', NULL, NULL, 60000.00, 17000.00, 0.00, 0.00, 510.50, 24.32, NULL, '2019-06-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (8, '1', '1', '2019-07', '2019-08-22', NULL, NULL, 123244.00, 12122.00, 222.00, 123.00, 374.51, 19.82, NULL, '2019-07-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (9, '1', '4', '2019-07', '2019-08-22', NULL, NULL, 112234.00, 52234.00, 111.00, 1345.00, 1611.20, 85.34, NULL, '2019-07-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (10, '1', '1', '2019-05', '2019-08-22', NULL, NULL, 50000.00, 4001.00, 11.00, 0.00, 120.86, 4.78, NULL, '2019-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (11, '1', '4', '2019-05', '2019-08-22', NULL, NULL, 43000.00, 13000.00, 1110.00, 0.00, 423.80, 16.82, NULL, '2019-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (12, '1', '1', '2019-01', '2019-08-22', NULL, NULL, 1222.00, 1222.00, 0.00, 0.00, 37.16, 0.00, NULL, '2019-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (13, '1', '4', '2019-01', '2019-08-22', NULL, NULL, 2222.00, 2222.00, 0.00, 0.00, 67.16, 0.00, NULL, '2019-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (14, '1', '1', '2019-02', '2019-08-22', NULL, NULL, 22222.00, 21000.00, 0.00, 0.00, 630.50, 25.75, NULL, '2019-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (15, '1', '4', '2019-02', '2019-08-22', NULL, NULL, 11122.00, 8900.00, 0.00, 0.00, 267.50, 10.91, NULL, '2019-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (16, '1', '1', '2019-03', '2019-08-22', NULL, NULL, 33333.00, 11111.00, 0.00, 0.00, 333.83, 16.44, NULL, '2019-03-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (17, '1', '4', '2019-03', '2019-08-22', NULL, NULL, 22222.00, 11100.00, 0.00, 0.00, 333.50, 16.43, NULL, '2019-03-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (20, '1', '1', '2019-04', '2019-08-22', NULL, NULL, 45999.00, 12666.00, 0.00, 0.00, 380.48, 20.13, NULL, '2019-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `new_water_monthly_info` VALUES (21, '1', '4', '2019-04', '2019-08-22', NULL, NULL, 30000.00, 7778.00, 0.00, 0.00, 233.84, 12.36, NULL, '2019-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for new_water_type
-- ----------------------------
DROP TABLE IF EXISTS `new_water_type`;
CREATE TABLE `new_water_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE_DESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_water_type
-- ----------------------------
INSERT INTO `new_water_type` VALUES (1, 'xssr016', '甲醇厂区新水', '甲醇厂区新水', '', NULL, NULL);
INSERT INTO `new_water_type` VALUES (2, 'xssr201\r\n', ' 炼油1#新水表\r\n', ' 炼油1#新水表\r\n', NULL, NULL, NULL);
INSERT INTO `new_water_type` VALUES (3, 'xsly001\r\n', ' 一套蒸馏新水\r\n', ' 一套蒸馏新水\r\n', NULL, NULL, NULL);
INSERT INTO `new_water_type` VALUES (4, 'xsly020\r\n', ' 一套制氢机房新水\r\n', ' 一套制氢机房新水\r\n', NULL, NULL, NULL);
INSERT INTO `new_water_type` VALUES (5, 'xsly027\r\n', 'xsly027\r\n 一套高压加氢新水\r\n', 'xsly027\r\n 一套高压加氢新水\r\n', NULL, NULL, NULL);
INSERT INTO `new_water_type` VALUES (6, 'xsly035\r\n', ' 一套焦化新水\r\n', ' 一套焦化新水\r\n', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_department
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_DESC` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FLEX_FILED3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES (1, '1000', '化工部分', '统计化工部分新水的部门', NULL, NULL, NULL);
INSERT INTO `sys_department` VALUES (2, '1001', '炼油部分', '统计炼油部分新水的部门', NULL, NULL, NULL);
INSERT INTO `sys_department` VALUES (3, '1002', '一联合车间', '一联合车间部门', NULL, NULL, NULL);
INSERT INTO `sys_department` VALUES (4, '1003', '二联合车间', '统计化工部分新水的部门', NULL, NULL, NULL);
INSERT INTO `sys_department` VALUES (5, '1004', '三联合车间', '统计化工部分新水的部门', NULL, NULL, NULL);
INSERT INTO `sys_department` VALUES (6, '1005', '四联合车间', '统计化工部分新水的部门', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `userpass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('谢永恒', 'Run.$*!(@._xieyongheng');
INSERT INTO `userinfo` VALUES ('admin', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
