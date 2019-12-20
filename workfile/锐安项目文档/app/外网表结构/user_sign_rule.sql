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

 Date: 10/12/2019 16:49:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_sign_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_sign_rule`;
CREATE TABLE `user_sign_rule`  (
  `rule_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `sign_date` date NULL DEFAULT NULL COMMENT '打卡日期',
  `ms_time` datetime NULL DEFAULT NULL COMMENT '上午上班时间',
  `mso_time` datetime NULL DEFAULT NULL COMMENT '上午下班时间',
  `as_time` datetime NULL DEFAULT NULL COMMENT '下午上班时间',
  `aso_time` datetime NULL DEFAULT NULL COMMENT '下午下班时间',
  `sync_status` int(1) NULL DEFAULT NULL COMMENT '同步状态',
  `sync_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步信息',
  PRIMARY KEY USING BTREE (`rule_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '打卡规则表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
