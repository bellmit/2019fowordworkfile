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

 Date: 23/05/2019 19:59:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hs_load_order_data_fix
-- ----------------------------
DROP TABLE IF EXISTS `hs_load_order_data_fix`;
CREATE TABLE `hs_load_order_data_fix`  (
  `cinvsn` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cCusCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cCusName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dDate` date NULL DEFAULT NULL,
  `cInvCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cInvName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iQuantity` int(10) NULL DEFAULT NULL,
  `iTaxUnitPrice` decimal(20, 2) NULL DEFAULT NULL,
  `iSum` decimal(20, 2) NULL DEFAULT NULL,
  `cSOCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iorderdid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_bind_timestamp` date NULL DEFAULT NULL,
  INDEX `hs_load_order_data_n1`(`cinvsn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
