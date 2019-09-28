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
 ,dept1 AS (
   SELECT dept1 dept  FROM dept a WHERE a.dept1 = 'RA00'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 = 'RA00'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1 = 'RA00' 
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1 = 'RA00'          
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 = 'RA00' ) 
   

, a AS
 (SELECT b.zc_index --自动编号
        ,b.zc_ktext --描述
        ,b.zc_item --输出顺序 
        ,b.zc_cud --计算类型
        ,b.zc_hs
        ,'01'  Levl
        ,SUM(dmbtr) dmbtr
        ,SUM(dmbtr_year) dmbtr_year
    FROM (SELECT b.zc_index --自动编号
                ,b.zc_ktext --描述 
                ,b.zc_item --输出顺序 
                ,b.zc_cud --计算类型
                ,b.zc_hs --借方正数或者贷方正数
                ,SUM(CASE
                       WHEN b.zc_hs = 'S' THEN
                        a.dmbtr
                       WHEN b.zc_hs = 'H' THEN
                        -a.dmbtr
                     END) AS dmbtr --按本位币计的金额 
                ,0 AS dmbtr_year
            FROM (SELECT *
                    FROM dw_fi_list_items b
                   WHERE 1 = 1
                  --   AND b.zc_cud = 'C'
                  ) b --计算类型 
            LEFT JOIN dw_fi_subject c
              ON c.zc_index = b.zc_index
            LEFT JOIN (SELECT *
                        FROM dw_fi_account_balance a
                       WHERE a.gjahr = '2019' --年
                         AND a.poper= '006'
                         AND trim(leading '0'FROM a.prctr) IN  
                         (SELECT dept FROM dept1 a )
                         AND NOT EXISTS
                       (SELECT *
                                FROM dw_fi_account_balance b
                               WHERE b.racct LIKE 'A%'
                                 AND trim(leading '0'FROM b.SPRCTR) IN
                                     (SELECT dept FROM dept1 a)
                                 AND a.racct = b.racct 
                                 AND a.sprctr=b.sprctr 
                                 AND a.gjahr=b.gjahr 
                                 AND a.poper=b.poper 
                                 AND a.prctr=b.prctr)) a 
              ON a.racct BETWEEN c.from_racct AND c.to_racct
           WHERE 1 = 1
           GROUP BY b.zc_index --自动编号
                   ,b.zc_ktext --描述  
                   ,b.zc_item --输出顺序 
                   ,b.zc_cud --计算类型
                   ,b.zc_hs --借方正数或者贷方正数
          UNION ALL
          SELECT b.zc_index --自动编号
                ,b.zc_ktext --描述 
                ,b.zc_item --输出顺序 
                ,b.zc_cud --计算类型
                ,b.zc_hs --借方正数或者贷方正数
                ,0 AS dmbtr --按本位币计的金额 
                ,SUM(CASE
                       WHEN b.zc_hs = 'S' THEN
                        a.dmbtr
                       WHEN b.zc_hs = 'H' THEN
                        -a.dmbtr
                     END) AS dmbtr_year
            FROM (SELECT *
                    FROM dw_fi_list_items b
                   WHERE 1 = 1
                  -- AND b.zc_cud = 'C'
                  ) b --计算类型 
            LEFT JOIN dw_fi_subject c
              ON c.zc_index = b.zc_index
            LEFT JOIN (SELECT *
                        FROM dw_fi_account_balance a
                       WHERE a.gjahr = '2019' --年
                         AND a.poper<= '006'
                         AND trim(leading '0'FROM a.prctr) IN 
                          (SELECT dept  FROM dept1 a)
                         AND NOT EXISTS
                       (SELECT *
                                FROM dw_fi_account_balance b
                               WHERE b.racct LIKE 'A%'
                                 AND trim(leading '0'FROM b.SPRCTR) IN
                                     (SELECT dept FROM dept1 a)
                                 AND a.racct = b.racct 
                                 AND a.sprctr=b.sprctr 
                                 AND a.gjahr=b.gjahr 
                                 AND a.poper=b.poper 
                                 AND a.prctr=b.prctr)) a 
              ON a.racct BETWEEN c.from_racct AND c.to_racct
           WHERE 1 = 1
           GROUP BY b.zc_index --自动编号
                   ,b.zc_ktext --描述  
                   ,b.zc_item --输出顺序 
                   ,b.zc_cud --计算类型
                   ,b.zc_hs --借方正数或者贷方正数
          ) b --借方正数或者贷方正数
   GROUP BY b.zc_index --自动编号
           ,b.zc_ktext --描述  
            ,b.zc_item --输出顺序 
                   ,b.zc_cud --计算类型
                   ,b.zc_hs)


  ,b AS (
      SELECT '00005' zc_index
            ,'二、主营业务利润（亏损以“-”号填列)' zc_ktext
            ,'02' Levl
            ,sum(CASE WHEN zc_index='00001' THEN b.dmbtr
             ELSE -b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index='00001' THEN b.dmbtr_year
             ELSE -b.dmbtr_year END) dmbtr_year
        FROM  a b
       WHERE to_number(zc_index) >= 1
         AND to_number(zc_index) <= 4
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,Levl
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_year) dmbtr_year
        FROM  a b
       WHERE b.zc_index <> '00005'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,Levl
            )

,c AS (
      SELECT '00021' zc_index
            ,'三、营业利润（亏损以“-”号填列）' zc_ktext
            ,'03' Levl
            ,sum(CASE WHEN zc_index IN ('00005','00006') THEN b.dmbtr
             ELSE -b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index IN ('00005','00006') THEN b.dmbtr_year
             ELSE -b.dmbtr_year END) dmbtr_year
        FROM b
       WHERE to_number(zc_index) >= 5
         AND to_number(zc_index) <= 20
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,Levl
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_year) dmbtr_year
        FROM b
       WHERE b.zc_index <> '00021'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,Levl)
   
 ,d AS (  
   SELECT '00027' zc_index
            ,'四、利润总额（亏损总额以“-”号填列）' zc_ktext
            ,'04' Levl
            ,sum(CASE WHEN zc_index IN ('00025','00026') THEN -b.dmbtr
             ELSE b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index IN ('00025','00026') THEN -b.dmbtr_year
             ELSE b.dmbtr_year END) dmbtr_year
        FROM c b
       WHERE to_number(zc_index) >= 21
         AND to_number(zc_index) <= 26
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,Levl
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_year) dmbtr_year
        FROM c b
       WHERE b.zc_index <> '00027'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,Levl
              )
    
    SELECT * FROM (                       
     SELECT '00029' zc_index
            ,'五、净利润（净亏损以“-”号填列）' zc_ktext
            ,'05' Levl
            ,sum(CASE WHEN zc_index IN ('00027') THEN b.dmbtr
             ELSE -b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index IN ('00027') THEN b.dmbtr_year
             ELSE -b.dmbtr_year END) dmbtr_year
        FROM d b
       WHERE to_number(zc_index) >= 27
         AND to_number(zc_index) <= 28
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,Levl
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_year) dmbtr_year
        FROM  d b
       WHERE b.zc_index <> '00029'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,Levl )a
              ORDER BY a.zc_index;
      
 
       