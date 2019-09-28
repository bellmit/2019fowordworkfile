
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
   SELECT dept1 dept  FROM dept a WHERE a.dept1 = '8999'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 = '8999'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1 = '8999' 
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1 = '8999'          
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 = '8999' ) 
    --对调科目年初余额
                             
--,exchange_detail as(
SELECT b.zc_index --自动编号
      ,b.zc_ktext --描述 
      ,b.zc_item --输出顺序 
      ,b.zc_cud --计算类型
      ,b.zc_fz --资产负债
      ,SUM(dmbtr_start) dmbtr_start
      ,SUM(dmbtr_end) dmbtr_end
  FROM (
        --对调科目年初余额
        SELECT b.zc_index --自动编号
               ,b.zc_ktext --描述 
               ,b.zc_item --输出顺序 
               ,b.zc_cud --计算类型
               ,b.zc_fz --资产负债
                -- ,b.qc_hs --借方正数或者贷方正数
               ,SUM(CASE
                      WHEN b.qc_hs = 'H' THEN
                       -a.dmbtr1
                      else a.dmbtr1
                    END) AS dmbtr_start --按本位币计的金额 
               ,0 AS dmbtr_end
          FROM dw_fi_dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          LEFT JOIN (
          select *
                       FROM (SELECT a.*
                                   ,b.zbelnr1f
                                   ,b.zbelnr1t
                               FROM dw_fi_exchange_detail a
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                           b.zitem1) a
                      WHERE 1=1
                        AND zflag = 'X'--(当参数为2016年)
                       --and a.gjahr = '2016' - 1 --前一年参数(当参数不为2016年)
                       -- AND a.poper = '013' --固定的(当参数不为2016年)
                        AND TRIM(leading '0' FROM a.prctr) IN (SELECT dept FROM dept1 a) --利润中心
                        AND NOT EXISTS --排除内部交易
                      (
                      SELECT *
                               FROM (SELECT a.*
                                           ,b.zbelnr1f
                                           ,b.zbelnr1t
                                       FROM dw_fi_exchange_detail a
                                       JOIN (SELECT a.zitem1
                                                  ,a.zbelnr1f
                                                  ,a.zbelnr1t
                                              FROM dw_fi_exchange_allocate a
                                            UNION ALL
                                            SELECT a.zitem2
                                                  ,a.zbelnr2f
                                                  ,a.zbelnr2t
                                              FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                                   b.zitem1) b
                              WHERE TRIM(leading '0' FROM b.sprctr) IN (SELECT dept FROM dept1 a)
                                AND a.zbelnr1f = b.zbelnr1f
                                AND a.zbelnr1t = b.zbelnr1t
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr
                                )
                        
                    ) a --固定的
        ON a.zbelnr1f = c.from_racct
        AND a.zbelnr1t = c.to_racct
         GROUP BY b.zc_index --自动编号
                  ,b.zc_ktext --描述 
                  ,b.zc_item --输出顺序 
                  ,b.zc_cud --计算类型
                  ,b.zc_fz
        --对调科目当前余额
        UNION ALL
        SELECT b.zc_index --自动编号
              ,b.zc_ktext --描述 
              ,b.zc_item --输出顺序 
              ,b.zc_cud --计算类型
              ,b.zc_fz --资产负债
               -- ,b.qc_hs --借方正数或者贷方正数
              ,0 dmbtr_start --按本位币计的金额 
              ,SUM(CASE
                     WHEN b.QM_HS = 'H' THEN
                      -a.dmbtr1
                     else a.dmbtr1
                   END)  AS dmbtr_end
          FROM dw_fi_dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          LEFT JOIN (SELECT *
                       FROM (SELECT a.*
                                   ,b.zbelnr1f
                                   ,b.zbelnr1t
                               FROM dw_fi_exchange_detail a
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                           b.zitem1) a
                      WHERE 1=1
                       AND zflag = 'X'--(当参数为2016年)
                       --and a.gjahr = '2016' --参数(当参数不为2016年)
                       -- AND a.poper = '010' --参数(当参数不为2016年)
                        AND TRIM(leading '0' FROM a.prctr) IN (SELECT dept FROM dept1 a)--利润中心
                        AND NOT EXISTS --排除内部交易
                      (SELECT *
                               FROM (SELECT a.*
                                           ,b.zbelnr1f
                                           ,b.zbelnr1t
                                       FROM dw_fi_exchange_detail a
                                       JOIN (SELECT a.zitem1
                                                  ,a.zbelnr1f
                                                  ,a.zbelnr1t
                                              FROM dw_fi_exchange_allocate a
                                            UNION ALL
                                            SELECT a.zitem2
                                                  ,a.zbelnr2f
                                                  ,a.zbelnr2t
                                              FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                                   b.zitem1) b
                              WHERE TRIM(leading '0' FROM b.sprctr)IN (SELECT dept FROM dept1 a)
                                AND a.zbelnr1f = b.zbelnr1f
                                AND a.zbelnr1t = b.zbelnr1t
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr)
                       
                    ) a --固定的
        ON a.zbelnr1f = c.from_racct
        AND a.zbelnr1t = c.to_racct
         GROUP BY b.zc_index --自动编号
                 ,b.zc_ktext --描述 
                 ,b.zc_item --输出顺序 
                 ,b.zc_cud --计算类型
                 ,b.zc_fz) b
 GROUP BY b.zc_index --自动编号
         ,b.zc_ktext --描述 
         ,b.zc_item --输出顺序 
         ,b.zc_cud --计算类型
         ,b.zc_fz--资产负债
         --) 