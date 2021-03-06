

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

--科目余额年初和期末数据
--,account_balance as(
SELECT b.zc_index --自动编号
      ,b.zc_ktext --描述 
      ,b.zc_item --输出顺序 
      ,b.zc_cud --计算类型
      ,b.zc_fz --资产负债
      ,SUM(dmbtr_start) dmbtr_start--年初
     -- ,SUM(dmbtr) dmbtr--发生额
      ,SUM(dmbtr_start) + SUM(dmbtr) as dmbtr_end--期末
  FROM (
        --科目余额表年初数据
        SELECT b.zc_index --自动编号
               ,b.zc_ktext --描述 
               ,b.zc_item --输出顺序 
               ,b.zc_cud --计算类型
               ,b.zc_fz --资产负债
              -- ,b.qc_hs --借方正数或者贷方正数
               ,SUM(CASE
                      WHEN b.qc_hs = 'H' THEN
                       -a.dmbtr
                      else a.dmbtr
                    END) AS dmbtr_start --按本位币计的金额 
               ,0 AS dmbtr
          FROM dw_fi_dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          LEFT JOIN (SELECT *
                       FROM dw_fi_account_balance a
                      WHERE a.gjahr < '2016' --年度参数
                       AND TRIM(leading '0' FROM a.prctr) IN
                            (SELECT dept FROM dept1 a)
                        AND NOT EXISTS --排除内部交易
                      (SELECT *
                               FROM dw_fi_account_balance b
                              WHERE b.racct LIKE 'A%'
                                AND TRIM(leading '0' FROM b.sprctr) IN
                                    (SELECT dept FROM dept1 a)
                                AND a.racct = b.racct
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr)
                        AND NOT EXISTS --排除对调科目
                      (SELECT c.*
                               FROM dw_fi_account_balance c
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON c.racct BETWEEN
                                                                           b.zbelnr1f AND
                                                                           b.zbelnr1t
                              WHERE a.racct = c.racct
                                AND a.sprctr = c.sprctr
                                AND a.gjahr = c.gjahr
                                AND a.poper = c.poper
                                AND a.prctr = c.prctr)) a ON a.racct BETWEEN
                                                             c.from_racct AND
                                                             c.to_racct
         GROUP BY b.zc_index --自动编号
                  ,b.zc_ktext --描述 
                  ,b.zc_item --输出顺序 
                  ,b.zc_cud --计算类型
                  ,b.zc_fz --资产负债
                 -- ,b.qc_hs
        UNION ALL
        --科目余额表本年发生额
        SELECT b.zc_index --自动编号
              ,b.zc_ktext --描述 
              ,b.zc_item --输出顺序 
              ,b.zc_cud --计算类型
              ,b.zc_fz --资产负债
             -- ,b.qc_hs --借方正数或者贷方正数
              ,0 dmbtr_start
              ,SUM(CASE
                     WHEN b.QM_HS = 'H' THEN
                      -a.dmbtr
                     else a.dmbtr
                   END) AS dmbtr
          FROM dw_fi_dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          LEFT JOIN (SELECT *
                       FROM dw_fi_account_balance a
                      WHERE a.gjahr = '2016' --年度参数
                        AND a.poper <= '011' --期间参数
                        AND TRIM(leading '0' FROM a.prctr) IN
                            (SELECT dept FROM dept1 a)
                        AND NOT EXISTS --排除内部交易
                      (SELECT *
                               FROM dw_fi_account_balance b
                              WHERE b.racct LIKE 'A%'
                                AND TRIM(leading '0' FROM b.sprctr) IN
                                    (SELECT dept FROM dept1 a)
                                AND a.racct = b.racct
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr)
                        AND NOT EXISTS --排除对调科目
                      (SELECT c.*
                               FROM dw_fi_account_balance c
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON c.racct BETWEEN
                                                                           b.zbelnr1f AND
                                                                           b.zbelnr1t
                              WHERE a.racct = c.racct
                                AND a.sprctr = c.sprctr
                                AND a.gjahr = c.gjahr
                                AND a.poper = c.poper
                                AND a.prctr = c.prctr)) a ON a.racct BETWEEN
                                                             c.from_racct AND
                                                             c.to_racct
         GROUP BY b.zc_index --自动编号
                 ,b.zc_ktext --描述 
                 ,b.zc_item --输出顺序 
                 ,b.zc_cud --计算类型
                 ,b.zc_fz --资产负债
                -- ,b.qc_hs
                 )b
 GROUP BY b.zc_index --自动编号
      ,b.zc_ktext --描述 
      ,b.zc_item --输出顺序 
      ,b.zc_cud --计算类型
      ,b.zc_fz --资产负债
      -- )