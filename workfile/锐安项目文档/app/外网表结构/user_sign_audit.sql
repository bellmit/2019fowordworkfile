/*
 Navicat Premium Data Transfer

 Source Server         : 202.189.0.20
 Source Server Type    : MySQL
 Source Server Version : 50067
 Source Host           : 202.189.0.20:3306
 Source Schema         : bjrun_mobile

 Target Server Type    : MySQL
 Target Server Version : 50067
 File Encoding         : 65001

 Date: 10/12/2019 16:49:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_sign_audit
-- ----------------------------
DROP TABLE IF EXISTS `user_sign_audit`;
CREATE TABLE `user_sign_audit`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `punch_time` datetime NULL DEFAULT NULL COMMENT '推送时间',
  `sign_date` date NULL DEFAULT NULL COMMENT '打卡时间',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `longitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维度',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `os_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统类型',
  INDEX `sign_date_idx` USING BTREE(`sign_date`),
  INDEX `username_idx` USING BTREE(`user_name`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户打卡信息记录表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
