WITH dept AS (
SELECT a.db_key dept1
      ,b.db_key dept2
      ,c.db_key dept3
      ,d.db_key dept4
      ,f.db_key dept5
  FROM dw_fi_dept a
  LEFT JOIN dw_fi_dept b ON b.parent_key = a.db_key
  LEFT JOIN dw_fi_dept c ON c.parent_key = b.db_key
  LEFT JOIN dw_fi_dept d ON d.parent_key = c.db_key
  LEFT JOIN dw_fi_dept f ON f.parent_key = d.db_key)

 ,dept1 AS (--用户的利润中心：用来排除内部交易
   SELECT dept1 dept  FROM dept a WHERE a.dept1 ='RA00'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 ='RA00'--用户对应的利润中心
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1='RA00'
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1='RA00'       
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 ='RA00')  
   
   
  ,dept2 AS (--参数的利润中心：用来排除底层数据
   SELECT dept1 dept  FROM dept a WHERE a.dept1 ='RA00'--利润中心参数
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 ='RA00'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1='RA00'
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1='RA00'       
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 ='RA00')  
, base as (
select * from dw_fi_detail a where a.racct between '1001000000' and '1001999999'
union all
select * from dw_fi_detail a where a.racct between '1002000000' and '1002999999'
union all
select * from dw_fi_detail a where a.racct between '1003000000' and '1003999999'
union all
select * from dw_fi_detail a where a.racct between 'A100100000' and 'A100199999')
, detail AS( 
SELECT b.parent_key parent_key4 , a.*
  FROM (
SELECT b.parent_key parent_key3 , a.*
  FROM (SELECT b.parent_key parent_key2 , a.*
          FROM (SELECT b.parent_key parent_key1, a.*
                  FROM base a
                  JOIN dw_fi_dept b ON TRIM(leading '0' FROM a.prctr) =
                                       b.db_key) a
          JOIN dw_fi_dept b ON a.parent_key1 = b.db_key) a
  JOIN dw_fi_dept b ON a.parent_key2 = b.db_key) a
  JOIN dw_fi_dept b ON a.parent_key3 = b.db_key)

 SELECT b.zc_index --自动编号
        ,b.parent_key3--如果传过来的参数等于parent_key3，则为参数的下级利润中心parent_key3
        ,SUM(dmbtr) dmbtr
        ,SUM(dmbtr_year) dmbtr_year
    FROM (
    SELECT b.zc_index --自动编号
                ,a.parent_key3 --利润中心
                ,SUM(CASE
                       WHEN b.zc_zf = 'S' THEN
                       -a.dmbtr1
                       else a.dmbtr1
                     END) AS dmbtr --按本位币计的金额 
                ,0 AS dmbtr_year
            FROM (SELECT *
                    FROM dw_fi_cash_header b
                   WHERE b.zc_index='11'  --报表项             
                  ) b 
            JOIN (SELECT *
                        FROM detail a
                       WHERE a.gjahr = '2019' --年
                         AND a.poper= '006'--期间
                         AND trim(leading '0'FROM a.prctr) IN  
                         (SELECT dept FROM dept2 a )
                         AND NOT EXISTS
                       (SELECT *
                                FROM detail b
                               WHERE b.racct LIKE 'A%'
                                 AND trim(leading '0'FROM b.SPRCTR) IN
                                     (SELECT dept FROM dept1 a)
                                 AND a.racct = b.racct 
                                 AND a.sprctr=b.sprctr 
                                 AND a.gjahr=b.gjahr 
                                 AND a.poper=b.poper 
                                 AND a.prctr=b.prctr)) a 
              ON a.rstgr=b.reason_code
           WHERE 1 = 1
           GROUP BY b.zc_index --自动编号
                   ,a.parent_key3--如果传过来的参数等于parent_key2，则为参数的下级利润中心parent_key3
          UNION ALL
          SELECT b.zc_index --自动编号
                ,a.parent_key3-- 如果传过来的参数等于parent_key2，则为参数的下级利润中心parent_key3
                ,0 AS dmbtr --按本位币计的金额 
                ,SUM(CASE
                       WHEN  b.zc_zf = 'S' THEN
                       -a.dmbtr1
                       else a.dmbtr1
                     END) AS dmbtr_year
            FROM (SELECT *
                    FROM dw_fi_cash_header b
                   WHERE b.zc_index='11'--报表项
                ) b 
            JOIN (SELECT *
                        FROM detail a
                       WHERE a.gjahr = '2019' --年
                         AND a.poper<= '006'--期间
                         AND trim(leading '0'FROM a.prctr) IN 
                          (SELECT dept  FROM dept1 a)
                         AND NOT EXISTS
                       (SELECT *
                                FROM detail b
                               WHERE b.racct LIKE 'A%'
                                 AND trim(leading '0'FROM b.SPRCTR) IN
                                     (SELECT dept FROM dept2 a)
                                 AND a.racct = b.racct 
                                 AND a.sprctr=b.sprctr 
                                 AND a.gjahr=b.gjahr 
                                 AND a.poper=b.poper 
                                 AND a.prctr=b.prctr)) a 
              on a.rstgr=b.reason_code
           WHERE 1 = 1
           GROUP BY b.zc_index --自动编号
                ,a.parent_key3--如果传过来的参数等于parent_key2，则为参数的下级利润中心parent_key3
          ) b --借方正数或者贷方正数
    GROUP BY b.zc_index --自动编号
             ,b.parent_key3



