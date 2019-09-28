/*
Navicat MySQL Data Transfer

Source Server         : 测试老家园
Source Server Version : 50045
Source Host           : 192.168.0.88:3306
Source Database       : bjrun

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2019-08-22 20:02:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ODS_FI_INDPF_TARGET
-- ----------------------------
DROP TABLE IF EXISTS `ODS_FI_INDPF_TARGET`;
CREATE TABLE `ODS_FI_INDPF_TARGET` (
  `GROUP_ID` varchar(100) default NULL COMMENT '事业群id',
  `GROUP_NAME` varchar(200) default NULL COMMENT '事业群名称',
  `FIRST_DEPT_ID` varchar(100) default NULL COMMENT '一级部门id',
  `FIRST_DEPT` varchar(200) default NULL COMMENT '一级部门名称',
  `SECOND_DEPT_ID` varchar(100) default NULL COMMENT '二级部门id',
  `SECOND_DEPT` varchar(200) default NULL COMMENT '二级部门名称',
  `Z_QUARTER` varchar(100) default NULL COMMENT '季度',
  `TARGET` decimal(65,5) default NULL COMMENT '目标值',
  `ISCPX` varchar(100) default NULL COMMENT '是否产品线【1 是 0 否】'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行业业绩事业部目标表';
