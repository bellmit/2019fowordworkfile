/*
 Navicat Premium Data Transfer

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 10.81.8.91:3306
 Source Schema         : sale

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 23/05/2019 12:49:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_report
-- ----------------------------
DROP TABLE IF EXISTS `sale_report`;
CREATE TABLE `sale_report`  (
  `ccardNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `restype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  `ftaxsum` decimal(20, 2) NULL DEFAULT NULL,
  `ftaxnowsum` decimal(20, 2) NULL DEFAULT NULL,
  `source_use_time` date NULL DEFAULT NULL,
  `duration` int(50) NULL DEFAULT NULL,
  INDEX `sale_report_u1`(`ccardNum`) USING BTREE,
  INDEX `sale_report_u2`(`use_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
