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

 Date: 10/12/2019 16:48:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_client_op_log
-- ----------------------------
DROP TABLE IF EXISTS `app_client_op_log`;
CREATE TABLE `app_client_op_log`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `operation_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作CODE（用户登录：  OP_001，用户登出： OP_002，上传地理位置： OP_003，开启自动打卡： OP_004，关闭自动打卡: OP_005，杀掉APP进程： OP_006\r\n）',
  `operation_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `sign_channel` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打卡渠道 (1: 自动打卡，2:手动打卡)',
  `longitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打卡经度',
  `latitude` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打卡纬度',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打卡地址',
  `os_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统类型',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动打卡app用户操作日志' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
