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

 Date: 24/05/2019 09:51:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hardware_service_company_special
-- ----------------------------
DROP TABLE IF EXISTS `hardware_service_company_special`;
CREATE TABLE `hardware_service_company_special`  (
  `customername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customercode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hardware_service_port_standard_price
-- ----------------------------
DROP TABLE IF EXISTS `hardware_service_port_standard_price`;
CREATE TABLE `hardware_service_port_standard_price`  (
  `portservicename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `portname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `standardprice` decimal(10, 4) NULL DEFAULT NULL,
  `startperiod` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endperiod` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hardware_service_product
-- ----------------------------
DROP TABLE IF EXISTS `hardware_service_product`;
CREATE TABLE `hardware_service_product`  (
  `parentname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `childname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `childcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hardware_service_product_standard_price
-- ----------------------------
DROP TABLE IF EXISTS `hardware_service_product_standard_price`;
CREATE TABLE `hardware_service_product_standard_price`  (
  `productname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `standardprice` decimal(20, 4) NULL DEFAULT NULL,
  `port` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startperiod` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endperiod` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hs_data_period_detail
-- ----------------------------
DROP TABLE IF EXISTS `hs_data_period_detail`;
CREATE TABLE `hs_data_period_detail`  (
  `cinvsn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `ftaxnowsum` decimal(20, 2) NULL DEFAULT NULL,
  INDEX `hs_data_period_detail_u1`(`cinvsn`) USING BTREE,
  INDEX `hs_data_period_detail_n1`(`cinvsn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hs_load_device_activition
-- ----------------------------
DROP TABLE IF EXISTS `hs_load_device_activition`;
CREATE TABLE `hs_load_device_activition`  (
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `device_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_sn` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_use` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_type` int(10) NULL DEFAULT NULL,
  `first_bind_timestamp` date NULL DEFAULT NULL,
  INDEX `hs_load_device_activition_n1`(`device_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hs_load_order_data
-- ----------------------------
DROP TABLE IF EXISTS `hs_load_order_data`;
CREATE TABLE `hs_load_order_data`  (
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
  `cInvDefine7` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cParentCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cChildCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `hs_load_order_data_n1`(`cinvsn`) USING BTREE,
  INDEX `hs_load_order_data_n2`(`cParentCode`) USING BTREE,
  INDEX `hs_load_order_data_n3`(`cChildCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for hs_load_order_data_fix_order
-- ----------------------------
DROP TABLE IF EXISTS `hs_load_order_data_fix_order`;
CREATE TABLE `hs_load_order_data_fix_order`  (
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
  `row_number` int(10) NULL DEFAULT NULL,
  `var1` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `hs_load_order_data_n1`(`cinvsn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hs_load_order_data_hardwareservice
-- ----------------------------
DROP TABLE IF EXISTS `hs_load_order_data_hardwareservice`;
CREATE TABLE `hs_load_order_data_hardwareservice`  (
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
  `prodsp` decimal(20, 2) NULL DEFAULT NULL,
  `portsp` decimal(20, 2) NULL DEFAULT NULL,
  `pre` decimal(20, 2) NULL DEFAULT NULL,
  `amount` decimal(20, 2) NULL DEFAULT NULL,
  INDEX `hs_load_order_data_n1`(`cinvsn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hs_report
-- ----------------------------
DROP TABLE IF EXISTS `hs_report`;
CREATE TABLE `hs_report`  (
  `cinvsn` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cCusCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cCusName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dDate` date NULL DEFAULT NULL,
  `cInvCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cInvName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cSOCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_bind_timestamp` date NULL DEFAULT NULL,
  `pre` decimal(20, 2) NULL DEFAULT NULL,
  `amount` decimal(20, 2) NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `ftaxnowsum` decimal(20, 2) NULL DEFAULT NULL,
  INDEX `hs_report_n1`(`cinvsn`) USING BTREE,
  INDEX `hs_report_n2`(`use_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pay_record
-- ----------------------------
DROP TABLE IF EXISTS `pay_record`;
CREATE TABLE `pay_record`  (
  `entid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration` int(50) NULL DEFAULT NULL,
  `restype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `card_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rescmd` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `pay_record_u1`(`card_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sale_data
-- ----------------------------
DROP TABLE IF EXISTS `sale_data`;
CREATE TABLE `sale_data`  (
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ccardNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftaxsum` decimal(20, 2) NULL DEFAULT NULL,
  INDEX `sale_data_u1`(`ccardNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sale_data_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_data_detail`;
CREATE TABLE `sale_data_detail`  (
  `entid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duration` int(50) NULL DEFAULT NULL,
  `restype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `startperiod` int(11) NULL DEFAULT NULL,
  `endperiod` int(11) NULL DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordercode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ccardNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftaxsum` decimal(20, 2) NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  INDEX `sale_data_detail_u1`(`ccardNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sale_data_period_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_data_period_detail`;
CREATE TABLE `sale_data_period_detail`  (
  `ccardNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `ftaxnowsum` decimal(20, 0) NULL DEFAULT NULL,
  INDEX `sale_data_period_detail_u1`(`ccardNum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sale_report
-- ----------------------------
DROP TABLE IF EXISTS `sale_report`;
CREATE TABLE `sale_report`  (
  `ccardNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `restype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `custname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `use_time` date NULL DEFAULT NULL,
  `ftaxperiod` decimal(20, 2) NULL DEFAULT NULL,
  `ftaxsum` decimal(20, 2) NULL DEFAULT NULL,
  `ftaxnowsum` decimal(20, 2) NULL DEFAULT NULL,
  `source_use_time` date NULL DEFAULT NULL,
  `duration` int(50) NULL DEFAULT NULL,
  INDEX `sale_report_u1`(`ccardNum`) USING BTREE,
  INDEX `sale_report_u2`(`use_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for gethsperioddetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `gethsperioddetail`;
delimiter ;;
CREATE PROCEDURE `gethsperioddetail`()
BEGIN

 
 DECLARE done BOOLEAN DEFAULT 0;
 DECLARE tmp_cinvsn VARCHAR(50) DEFAULT null;
 	DECLARE tmp_ftaxperiod decimal(20,2) DEFAULT 0;
	DECLARE tmp_ftaxsum decimal(20,2) DEFAULT 0;  -- add
 DECLARE tmp_use_time date; 
 declare i int;
 DECLARE t_index CURSOR FOR select cinvsn,first_bind_timestamp,amount from  hs_load_order_data_hardwareservice where cast( DATE_FORMAT(dDate,'%Y%m') as signed) >=201711 and first_bind_timestamp is not null and prodsp is not null and portsp is not null ;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
 
 
 delete from hs_load_order_data_hardwareservice;
 delete from  hs_data_period_detail;
 insert into hs_load_order_data_hardwareservice (cinvsn,cCusCode,cCusName ,dDate ,cInvCode ,cInvName ,iQuantity ,iTaxUnitPrice ,iSum ,cSOCode ,iorderdid,first_bind_timestamp , prodsp ,portsp,pre ,amount )

select   a.cinvsn sn号码,a.cCusCode 客户编码,a.cCusName 客户名称,a.dDate 订单时间,a.cInvCode 存货料号,a.cInvName 存货名称,a.iQuantity 数量,a.iTaxUnitPrice 单价,a.iSum 订单总价,a.cSOCode 订单号,a.iorderdid,a.first_bind_timestamp 激活时间, a.prodsp 产品标准价格,a.portsp 端口标准价格,a.pre 折扣,a.amount 云服务分摊费用
from (
select  a.cinvsn,a.cCusCode,a.cCusName,a.dDate,a.cInvCode,a.cInvName,a.iQuantity,a.iTaxUnitPrice,a.iSum,a.cSOCode,a.iorderdid,a.first_bind_timestamp,b.standardprice prodsp,c.standardprice portsp ,(a.iTaxUnitPrice/0.7)/b.standardprice pre,c.standardprice*(a.iTaxUnitPrice/0.7)/b.standardprice amount from hs_load_order_data_fix a left join hardware_service_product_standard_price b
 on a.cInvCode=b.productcode and cast( DATE_FORMAT(a.dDate,'%Y%m') as signed) between cast(b.startperiod as signed) and cast(b.endperiod as signed) left join hardware_service_port_standard_price c
 on c.portname=b.`port` 
 and cast( DATE_FORMAT(a.dDate,'%Y%m') as signed) between cast(c.startperiod as signed) and cast(c.endperiod as signed) )a;
 

 OPEN t_index;
	
REPEAT
		FETCH t_index INTO tmp_cinvsn,tmp_use_time ,tmp_ftaxsum;
		-- WHILE done = 0 DO
	   IF done!=1 THEN
         	SET i = 1;
		  WHILE
			i <= 12 DO
			INSERT INTO hs_data_period_detail ( cinvsn, ftaxperiod, use_time, ftaxnowsum )
		VALUES	(
				tmp_cinvsn,
			CASE
					
					WHEN i = 12 THEN
					tmp_ftaxsum - ((tmp_ftaxsum/12) * 11) ELSE tmp_ftaxsum/12 
				END,
				tmp_use_time,
			CASE
					
					WHEN i = 12 THEN
					tmp_ftaxsum ELSE (tmp_ftaxsum/12) * i 
				END 
				);
			
			SET tmp_use_time = date_add( tmp_use_time, INTERVAL 1 MONTH );
			
			SET i = i + 1;
			
		END WHILE;
   END IF;
	-- END WHILE;
UNTIL DONE END REPEAT;

CLOSE t_index;
 
 
delete from  hs_report;
insert into hs_report 

select  a.cinvsn sn号码,a.cCusCode 客户编码,a.cCusName 客户名称,a.dDate 订单时间,a.cInvCode 存货料号,a.cInvName 存货名称,a.cSOCode 订单号,a.first_bind_timestamp 激活时间,a.pre 折扣,a.amount 总摊销费用,b.ftaxperiod 当月摊销,b.use_time 摊销时间,b.ftaxnowsum 累计摊销 from  hs_load_order_data_hardwareservice a,
hs_data_period_detail b 
where  a.cinvsn=b.cinvsn;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for getsaleperioddetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `getsaleperioddetail`;
delimiter ;;
CREATE PROCEDURE `getsaleperioddetail`()
BEGIN
 
	DECLARE done BOOLEAN DEFAULT 0;
	DECLARE tmp_ccardNum VARCHAR(50) DEFAULT null;
	DECLARE tmp_ftaxperiod decimal(20,2) DEFAULT 0;
	DECLARE tmp_ftaxsum decimal(20,2) DEFAULT 0;  -- add
	DECLARE tmp_duration int DEFAULT 0;
	DECLARE tmp_use_time date; 
  declare i int;
	DECLARE t_index CURSOR FOR SELECT ccardNum,ftaxperiod,duration,use_time,ftaxsum FROM sale_data_detail;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  
OPEN t_index;
  delete from  sale_data_period_detail;
	delete from  sale_report;
REPEAT
		FETCH t_index INTO tmp_ccardNum,tmp_ftaxperiod,tmp_duration ,tmp_use_time ,tmp_ftaxsum;
	IF done!=1 THEN
		  
      call  insertsaleperioddetail( tmp_ccardNum,  tmp_ftaxperiod,  tmp_duration,  tmp_use_time,  tmp_ftaxsum);
	END IF;
UNTIL DONE END REPEAT;
 insert into sale_report (ccardNum,restype,typename,custname,productname,use_time,ftaxperiod,ftaxsum,ftaxnowsum,source_use_time,duration)
 SELECT
	a.ccardNum,
	b.restype,
	b.typename,
	b.custname,
	b.productname,
	a.use_time,
	a.ftaxperiod,
  b.ftaxsum,
  a.ftaxnowsum,
  b.use_time,
  b.duration	
FROM
	sale_data_period_detail a,
	sale_data_detail b 
WHERE
	a.ccardNum = b.ccardNum ;
 
CLOSE t_index;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertsaleperioddetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertsaleperioddetail`;
delimiter ;;
CREATE PROCEDURE `insertsaleperioddetail`(IN tmp_ccardNum VARCHAR ( 50 ),
	IN tmp_ftaxperiod DECIMAL ( 20, 2 ),
	IN tmp_duration INT,
	IN tmp_use_time date,
	IN tmp_ftaxsum DECIMAL ( 20, 2 ))
BEGIN
	DECLARE
		i INT;
	
	SET i = 1;
	WHILE
			i <= tmp_duration DO
			INSERT INTO sale_data_period_detail ( ccardNum, ftaxperiod, use_time, ftaxnowsum )
		VALUES
			(
				tmp_ccardNum,
			CASE
					
					WHEN i = tmp_duration THEN
					tmp_ftaxsum - tmp_ftaxperiod * ( i - 1 ) ELSE tmp_ftaxperiod 
				END,
				tmp_use_time,
			CASE
					
					WHEN i = tmp_duration THEN
					tmp_ftaxsum ELSE tmp_ftaxperiod * i 
				END 
				);
			
			SET tmp_use_time = date_add( tmp_use_time, INTERVAL 1 MONTH );
			
			SET i = i + 1;
			
		END WHILE;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updatehsloadorderdatafix
-- ----------------------------
DROP PROCEDURE IF EXISTS `updatehsloadorderdatafix`;
delimiter ;;
CREATE PROCEDURE `updatehsloadorderdatafix`()
BEGIN
 delete from hs_load_order_data_fix;
 insert into hs_load_order_data_fix (	cinvsn,cCusCode,cCusName,dDate,cInvCode,cInvName,iQuantity,iTaxUnitPrice,iSum,cSOCode,iorderdid,first_bind_timestamp)
 SELECT
	a.cinvsn,a.cCusCode,a.cCusName,a.dDate,a.cInvCode,a.cInvName,a.iQuantity,a.iTaxUnitPrice,a.iSum,a.cSOCode,a.iorderdid,a.first_bind_timestamp
FROM
	hs_load_order_data_fix_order a 
WHERE
	a.row_number=1;


end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
