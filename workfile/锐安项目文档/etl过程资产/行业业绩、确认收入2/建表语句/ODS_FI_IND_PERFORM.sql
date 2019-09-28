/*
Navicat MySQL Data Transfer

Source Server         : 测试老家园
Source Server Version : 50045
Source Host           : 192.168.0.88:3306
Source Database       : bjrun

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2019-08-22 20:02:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ODS_FI_IND_PERFORM
-- ----------------------------
DROP TABLE IF EXISTS `ODS_FI_IND_PERFORM`;
CREATE TABLE `ODS_FI_IND_PERFORM` (
  `ID` varchar(200) NOT NULL COMMENT '编号',
  `CONTRACTCODE` varchar(200) default NULL COMMENT '合同号',
  `PROVINCE` varchar(200) default NULL COMMENT '省份',
  `CITY` varchar(200) default NULL COMMENT '地市',
  `ZJL` varchar(200) default NULL COMMENT '总经理',
  `DEPT_NAME` varchar(200) default NULL COMMENT '部门',
  `HANGYE` varchar(200) default NULL COMMENT '行业',
  `SELLPERSON` varchar(200) default NULL COMMENT '销售人员',
  `CONTRACTPRONAME` text COMMENT '合同名称',
  `LAST_USER` text COMMENT '最终用户名称',
  `PROCODE` varchar(200) default NULL COMMENT '项目编号',
  `SECONDDEPT` varchar(200) default NULL COMMENT '合同主体成本中心名称',
  `CONTRACTSIGNDATE` datetime default NULL COMMENT '合同签订日期',
  `CONTRACTPRICEDOUBLE` decimal(65,5) default NULL COMMENT '合同总金额',
  `RECORDDATE` datetime default NULL COMMENT '业绩记录日期',
  `PERFORMRECORDNUM` decimal(65,5) default NULL COMMENT '业绩记录金额',
  `CLIENTCOMPANYNAME` varchar(200) default NULL COMMENT '合同甲方名称',
  `FANGANJL` varchar(200) default NULL COMMENT '解决方案经理',
  `JLYJ` decimal(65,5) default NULL COMMENT '解决方案经理行业业绩',
  `GROUP_ID` varchar(200) default NULL COMMENT '事业群ID',
  `GROUP_NAME` varchar(200) default NULL COMMENT '事业群名称',
  `FIRST_DEPT_ID` varchar(200) default NULL COMMENT '一级部门id',
  `FIRST_DEPT` varchar(200) default NULL COMMENT '一级部门名称',
  `SECOND_DEPT_ID` varchar(200) default NULL COMMENT '二级部门（产品线）id',
  `SECOND_DEPT` varchar(200) default NULL COMMENT '二级部门名称',
  `HYYJ` decimal(65,5) default NULL COMMENT '行业业绩',
  `ISCPX` varchar(10) default NULL COMMENT '是否是产品线',
  `POST_CODE` varchar(50) default NULL COMMENT '岗位编号',
  `FX` varchar(200) default NULL COMMENT '行业方向'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行业业绩明细表';
