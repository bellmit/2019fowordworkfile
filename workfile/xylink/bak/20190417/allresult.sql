SELECT
	entid,
	`name`,
	duration,
	restype,
	typename,
	use_time,
	startperiod,
	endperiod,
	(
		(
			floor( CASE WHEN 201803 < endperiod THEN 201803 ELSE endperiod END / 100 ) - floor( CASE WHEN 201710 > startperiod THEN 201710 ELSE startperiod END / 100 ) 
		) * 12 + ( CASE WHEN 201803 < endperiod THEN 201803 ELSE endperiod END % 100-case WHEN 201710 > startperiod THEN 201710 ELSE startperiod END % 100 ) + 1 
	) * ftaxperiod useamount,
	source,
	custname,
	ordercode,
	productname,
	ccardNum,
	ftaxsum,
	ftaxperiod 
FROM
	sale_data_detail 
WHERE
	startperiod <= 201803 AND endperiod >= 201710 -- 取开始日期小于等于最大条件日期，且结束日期大于等于最小条件日期的数据