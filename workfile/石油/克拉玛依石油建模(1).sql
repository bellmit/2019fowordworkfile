-- 部门表
CREATE TABLE SYS_DEPARTMENT(
  ID varchar(16) NOT NULL ,  -- 主键 部门ID
  DEPT_CODE varchar(10) default NULL, -- 部门CODE
  DEPT_NAME varchar(50) default NULL, -- 部门名称
  DEPT_DESC varchar(255) default NULL, -- 部门描述
  FLEX_FILED1  varchar(255) default NULL,  -- 扩展字段1
  FLEX_FILED2 varchar(255) default NULL, -- 扩展字段2
  FLEX_FILED3 varchar(255) default NULL -- 扩展字段3

) ;
alter table SYS_DEPARTMENT drop primary key;
alter table SYS_DEPARTMENT add primary key(id);
ALTER TABLE `test`.`SYS_DEPARTMENT` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT  ;
INSERT INTO `SYS_DEPARTMENT`  (DEPT_CODE ,DEPT_NAME,DEPT_DESC ,FLEX_FILED1,FLEX_FILED2,FLEX_FILED3) VALUES ('1000', '化工部分', '统计化工部分新水的部门', NULL, NULL, NULL);
INSERT INTO `SYS_DEPARTMENT`  (DEPT_CODE ,DEPT_NAME,DEPT_DESC ,FLEX_FILED1,FLEX_FILED2,FLEX_FILED3) VALUES ('1001', '炼油部分', '统计炼油部分新水的部门', NULL, NULL, NULL);
INSERT INTO `SYS_DEPARTMENT`  (DEPT_CODE ,DEPT_NAME,DEPT_DESC ,FLEX_FILED1,FLEX_FILED2,FLEX_FILED3) VALUES ('1002', '一联合车间', '一联合车间部门', NULL, NULL, NULL);
INSERT INTO `SYS_DEPARTMENT`  (DEPT_CODE ,DEPT_NAME,DEPT_DESC ,FLEX_FILED1,FLEX_FILED2,FLEX_FILED3) VALUES ( '1003', '二联合车间', '统计化工部分新水的部门', NULL, NULL, NULL);
INSERT INTO `SYS_DEPARTMENT`  (DEPT_CODE ,DEPT_NAME,DEPT_DESC ,FLEX_FILED1,FLEX_FILED2,FLEX_FILED3) VALUES ('1004', '三联合车间', '统计化工部分新水的部门', NULL, NULL, NULL);
INSERT INTO `SYS_DEPARTMENT`   (DEPT_CODE ,DEPT_NAME,DEPT_DESC ,FLEX_FILED1,FLEX_FILED2,FLEX_FILED3)VALUES ('1005', '四联合车间', '统计化工部分新水的部门', NULL, NULL, NULL);


-- 新水类型
CREATE TABLE NEW_WATER_TYPE(
  ID varchar(16) NOT NULL ,  -- 主键 新水类别ID
  TYPE_CODE varchar(10) default NULL, -- 新水类型CODE
  TYPE_NAME varchar(50) default NULL, -- 新水类型名称
  TYPE_DESC varchar(255) default NULL, -- 新水类型描述
  FLEX_FILED1  varchar(255) default NULL, -- 扩展字段1
  FLEX_FILED2 varchar(255) default NULL, -- 扩展字段2
  FLEX_FILED3 varchar(255) default NULL -- 扩展字段3
  -- PRIMARY KEY  (ID)
) ;
-- alter table NEW_WATER_TYPE drop primary key;
alter table NEW_WATER_TYPE add primary key(id);
ALTER TABLE `test`.`NEW_WATER_TYPE` CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT  ;


INSERT INTO `NEW_WATER_TYPE` VALUES ( 'xssr016', '甲醇厂区新水', '甲醇厂区新水', NULL, NULL, NULL);
INSERT INTO `NEW_WATER_TYPE` VALUES ( 'xssr201', '炼油1#新水表', '炼油1#新水表', NULL, NULL, NULL);
INSERT INTO `NEW_WATER_TYPE` VALUES ( 'xsly001', '一套蒸馏新水', '一套蒸馏新水', NULL, NULL, NULL);
INSERT INTO `NEW_WATER_TYPE` VALUES ( 'xsly020', '一套制氢机房新水', '一套制氢机房新水', NULL, NULL, NULL);
INSERT INTO `NEW_WATER_TYPE` VALUES ( 'xsly027', '一套高压加氢新水', '一套高压加氢新水', NULL, NULL, NULL);
INSERT INTO `NEW_WATER_TYPE` VALUES ( 'xsly035', '一套焦化新水', '一套焦化新水', NULL, NULL, NULL);

--部门与新水类型映射表
CREATE TABLE DEPT_WATER_TYPE_MAPPING(
  ID varchar(16) NOT NULL ,  -- 主键映射ID
  DEPT_ID varchar(10) default NULL, -- 部门ID
  WART_TYPE_ID varchar(50) default NULL, -- 新水类型ID
  DESC varchar(255) default NULL, -- 映射描述
  PRIMARY KEY  (ID),
  FOREIGN KEY (DEPT_ID) references   SYS_DEPARTMENT(ID),
  FOREIGN KEY (WART_TYPE_ID) references   WART_TYPE_ID(ID),
) 

INSERT INTO `WARTER_CONSUMING_TYPE` VALUES ('3000', '1000', '2000', '化工部分包含甲醇厂区新水');
INSERT INTO `WARTER_CONSUMING_TYPE` VALUES ('3001', '1001', '2001', '炼油部分包含炼油1#新水表');
INSERT INTO `WARTER_CONSUMING_TYPE` VALUES ('3001', '1002', '2002', '一联合车间包含一套蒸馏新水');


--部门与新水类型映射表
CREATE TABLE NEW_WATER_MONTHLY_INFO(
  ID varchar(16) NOT NULL ,  -- 新水月报记录ID
  DEPT_ID varchar(10) default NULL, -- 部门ID
  WART_TYPE_ID varchar(10) default NULL, -- 新水类型ID
  PEROID varchar(50) default NULL, -- 填报期间 (2019-07)
  REPORT_TIME Timestamp default NULL, -- 填报时间 (2019-07-25 10:00:00)
  RATIO INTEGER  default NULL,  -- 系数
  TAG_NUMBER varchar(16) default NULL, -- 位号
  MONTHLY_VALUE NUMBER  default 0, --当月新水值
  METERING_NUMBER NUMBER  default 0, --表计量量
  PIPE_CAL_NUMBER NUMBER  default 0, --管径计算量
  INTERVAL_NUMBER NUMBER  default 0, --间隔量
  CONSUMING_NUMBER NUMBER  default 0, --损耗量
  CONSUMING_NUMBER NUMBER  default 0, --瞬时量
  COMMENTS varchar(255) default NULL, -- 备注
  FLEX_FILED1  varchar(255) default NULL, --扩展字段1
  FLEX_FILED2 varchar(255) default NULL, -- 扩展字段2
  FLEX_FILED3 varchar(255) default NULL -- 扩展字段3
  FLEX_FILED4  varchar(255) default NULL, --扩展字段4
  FLEX_FILED5 varchar(255) default NULL, -- 扩展字段5
  FLEX_FILED6 varchar(255) default NULL -- 扩展字段6
  FLEX_FILED7 varchar(255) default NULL -- 扩展字段7
  FLEX_FILED8 varchar(255) default NULL -- 扩展字段8
  FLEX_FILED9 varchar(255) default NULL -- 扩展字段9
  FLEX_FILED10 varchar(255) default NULL -- 扩展字段10
  PRIMARY KEY  (ID),
   FOREIGN KEY (DEPT_ID) references   SYS_DEPARTMENT(ID),
  FOREIGN KEY (WART_TYPE_ID) references   WART_TYPE_ID(ID),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `NEW_WATER_MONTHLY_INFO` VALUES ('1', '1000', '2001', '2019-06', '2019-06-24 10:00:00', 1, 'RTW1_FQ01_PV', 1345287, 153181, -27326, 0, 3776,174.2 '炼油1#新水表6月数据');














