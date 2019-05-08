/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : sale

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 19/04/2019 13:37:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
