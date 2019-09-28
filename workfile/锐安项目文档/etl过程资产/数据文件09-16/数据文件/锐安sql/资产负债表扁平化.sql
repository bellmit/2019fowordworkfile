

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
,dept_header as (
select a.zc_index,a.zc_ktext,a.zc_cud,a.QC_HS,a.qm_hs,a.zc_fz , a.zc_item,
 nvl(replace(b.zc_sclass,' ',''),nvl(zc_sclass4,nvl(zc_sclass3,nvl(zc_sclass2,nvl(zc_sclass1,a.zc_index))))) zc_sclass
 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass4 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass3 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass2 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass1 from dw_fi_dept_header a left join (
select * from dw_fi_dept_item where from_racct=' ')b on a.zc_index=b.zc_index)a
left join (
select * from dw_fi_dept_item where from_racct=' ')b on a.zc_sclass1=b.zc_index)a
left join (
select * from dw_fi_dept_item where from_racct=' ')b on a.zc_sclass2=b.zc_index)a
left join (
select * from dw_fi_dept_item where from_racct=' ')b on a.zc_sclass3=b.zc_index)a
left join (
select * from dw_fi_dept_item where from_racct=' ')b on a.zc_sclass4=b.zc_index
order by a.zc_index,zc_sclass)
,exchange_detail as(
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
                      WHEN b.zc_cud='C' and b.qc_hs = 'H' then  -a.dmbtr1
                      WHEN b.zc_cud='C' and b.qc_hs <> 'H' then  a.dmbtr1
                      WHEN b.zc_cud='U' and b.qc_hs = 'H' then  -a.dmbtr1
                      WHEN b.zc_cud='U' and b.qc_hs <> 'H' then  a.dmbtr1
                    END) AS dmbtr_start --按本位币计的金额 
               ,0 AS dmbtr_end
          FROM dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_sclass
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
                      WHEN b.zc_cud='C' and b.qm_hs = 'H' then  -a.dmbtr1
                      WHEN b.zc_cud='C' and b.qm_hs <> 'H' then  a.dmbtr1
                      WHEN b.zc_cud='U' and b.qm_hs = 'H' then  -a.dmbtr1
                      WHEN b.zc_cud='U' and b.qm_hs <> 'H' then  a.dmbtr1
                    END)  AS dmbtr_end
          FROM dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_sclass
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
         ,b.zc_fz) --资产负债

--------------------------------------------------------------------
  ,begin_balance as(
--41表期初余额
SELECT b.zc_index --自动编号
      ,b.zc_ktext --描述 
      ,b.zc_item --输出顺序 
      ,b.zc_cud --计算类型
      ,b.zc_fz --资产负债
       -- ,b.qc_hs --借方正数或者贷方正数      
      ,SUM(CASE
           WHEN b.zc_cud='C' and b.qc_hs = 'H' then  -nvl(a.dmbtr,0)
           WHEN b.zc_cud='C' and b.qc_hs <> 'H' then  nvl(a.dmbtr,0)
           WHEN b.zc_cud='U' and b.qc_hs = 'H' then  -nvl(a.dmbtr,0)
           WHEN b.zc_cud='U' and b.qc_hs <> 'H' then  nvl(a.dmbtr,0)
           end) AS dmbtr_start --按本位币计的金额 
      ,SUM(CASE
           WHEN b.zc_cud='C' and b.qm_hs = 'H' then  -nvl(a.dmbtr,0)
           WHEN b.zc_cud='C' and b.qm_hs <> 'H' then  nvl(a.dmbtr,0)
           WHEN b.zc_cud='U' and b.qm_hs = 'H' then  -nvl(a.dmbtr,0)
           WHEN b.zc_cud='U' and b.qm_hs <> 'H' then  nvl(a.dmbtr,0)
           end)AS dmbtr_end
  FROM dept_header b
  LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_sclass
  LEFT JOIN (SELECT *
               FROM dw_fi_begin_balance a
              WHERE TRIM(leading '0' FROM a.prctr) IN
                    (SELECT dept FROM dept1 a)
                AND NOT EXISTS --排除内部交易
              (SELECT *
                       FROM dw_fi_begin_balance b
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
                       FROM dw_fi_begin_balance c
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
         ,b.zc_fz) --资产负债
      
-------------------------------------------------------------------------------

--科目余额年初和期末数据
,account_balance as(
SELECT b.zc_index --自动编号
      ,b.zc_ktext --描述 
      ,b.zc_item --输出顺序 
      ,b.zc_cud --计算类型
      ,b.zc_fz --资产负债
     -- ,'01' lvl
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
                     WHEN b.zc_cud = 'C' AND b.qc_hs = 'H' THEN
                      -nvl(a.dmbtr, 0)
                     WHEN b.zc_cud = 'C' AND b.qc_hs <> 'H' THEN
                      nvl(a.dmbtr, 0)
                     WHEN b.zc_cud = 'U' AND b.qc_hs = 'H' THEN
                     -nvl(a.dmbtr, 0)
                     WHEN b.zc_cud = 'U' AND b.qc_hs <> 'H' THEN
                      nvl(a.dmbtr, 0)
                   END) AS dmbtr_start --按本位币计的金额 
              ,0 AS dmbtr
          FROM dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_sclass
          LEFT JOIN (SELECT *
                       FROM dw_fi_account_balance a
                      WHERE a.gjahr < '2019' --年度参数
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
                     WHEN b.zc_cud = 'C' AND b.qm_hs = 'H' THEN
                      -nvl(a.dmbtr, 0)
                     WHEN b.zc_cud = 'C' AND b.qm_hs <> 'H' THEN
                      nvl(a.dmbtr, 0)
                     WHEN b.zc_cud = 'U' AND b.qm_hs = 'H' THEN
                      -nvl(a.dmbtr, 0)
                     WHEN b.zc_cud = 'U' AND b.qm_hs <> 'H' THEN
                      nvl(a.dmbtr, 0)
                   END) AS dmbtr
          FROM dept_header b
          LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_sclass
          LEFT JOIN (SELECT *
                       FROM dw_fi_account_balance a
                      WHERE a.gjahr = '2019' --年度参数
                        AND a.poper <= '006' --期间参数
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
      ,b.zc_fz ) --资产负债
      
, a as (
SELECT A.zc_index --自动编号
      ,A.zc_ktext
      ,a.zc_fz
      ,'1' lvl
      ,NVL(A.dmbtr_start,0)+NVL(B.dmbtr_start,0)+NVL(C.dmbtr_start,0) as dmbtr_start
      ,NVL(A.dmbtr_end,0)+NVL(B.dmbtr_end,0)+NVL(C.dmbtr_end,0) as dmbtr_end
  FROM account_balance a
  LEFT JOIN begin_balance b ON a.zc_index = b.zc_index
  LEFT JOIN exchange_detail c ON a.zc_index = c.zc_index
 )
 select * from a