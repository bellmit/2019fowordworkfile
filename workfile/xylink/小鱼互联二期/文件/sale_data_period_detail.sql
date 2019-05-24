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

 Date: 23/05/2019 10:55:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sale_data_period_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_data_period_detail`;
CREATE TABLE `sale_data_period_detail`  (
  `ccardNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `ftaxnowsum` decimal(20, 0) NULL DEFAULT NULL,
  INDEX `sale_data_period_detail_u1`(`ccardNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
