/*
Navicat MySQL Data Transfer

Source Server         : 测试老家园
Source Server Version : 50045
Source Host           : 192.168.0.88:3306
Source Database       : bjrun

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2019-08-22 20:02:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ODS_FI_INDPF_PLTARGET
-- ----------------------------
DROP TABLE IF EXISTS `ODS_FI_INDPF_PLTARGET`;
CREATE TABLE `ODS_FI_INDPF_PLTARGET` (
  `STAFF_NAME` varchar(100) default NULL COMMENT '解决方案经理姓名',
  `FIRST_DEPT` varchar(200) default NULL COMMENT '一级部门名称',
  `HYFX` varchar(100) default NULL COMMENT '行业方向',
  `POST_ID` varchar(100) default NULL COMMENT '岗位编码',
  `Z_QUARTER` varchar(100) default NULL COMMENT '季度',
  `TARGET` decimal(65,5) default NULL COMMENT '目标值',
  `GROUP_ID` varchar(100) default NULL COMMENT '事业群ID',
  `GROUP_NAME` varchar(200) default NULL COMMENT '事业群名称',
  `FIRST_DEPT_ID` varchar(100) default NULL COMMENT '一级部门ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
