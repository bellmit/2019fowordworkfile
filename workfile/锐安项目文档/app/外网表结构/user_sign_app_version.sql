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

 Date: 10/12/2019 16:48:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_sign_app_version
-- ----------------------------
DROP TABLE IF EXISTS `user_sign_app_version`;
CREATE TABLE `user_sign_app_version`  (
  `version_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本ID',
  `os_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统类型',
  `upgrade_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新路径',
  `version_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `create_date` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` date NULL DEFAULT NULL COMMENT '更新时间',
  `object_number` int(11) NULL DEFAULT NULL COMMENT '序列号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动打卡app版本信息' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
