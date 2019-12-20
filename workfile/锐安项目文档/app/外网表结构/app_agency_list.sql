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

 Date: 10/12/2019 16:48:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_agency_list
-- ----------------------------
DROP TABLE IF EXISTS `app_agency_list`;
CREATE TABLE `app_agency_list`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `agency_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待办key值',
  `agency_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待办名称',
  `agency_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待办内网key值',
  `agency_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'common' COMMENT '待办类型',
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '待办列表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
