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
  
, base as (
select * from dw_fi_detail a where a.racct between '1001000000' and '1001999999'
union all
select * from dw_fi_detail a where a.racct between '1002000000' and '1002999999'
union all
select * from dw_fi_detail a where a.racct between '1003000000' and '1003999999'
union all
select * from dw_fi_detail a where a.racct between 'A100100000' and 'A100199999')
,account_balance as (
select * from dw_fi_account_balance a where a.racct between '1001000000' and '1001999999'
union all
select * from dw_fi_account_balance a where a.racct between '1002000000' and '1002999999'
union all
select * from dw_fi_account_balance a where a.racct between '1003000000' and '1003999999'
union all
select * from dw_fi_account_balance a where a.racct between 'A100100000' and 'A100199999')
,begin_balance as (
select * from dw_fi_begin_balance a where a.racct between '1001000000' and '1001999999'
union all
select * from dw_fi_begin_balance a where a.racct between '1002000000' and '1002999999'
union all
select * from dw_fi_begin_balance a where a.racct between '1003000000' and '1003999999'
union all
select * from dw_fi_begin_balance a where a.racct between 'A100100000' and 'A100199999')
--,a as (
SELECT a.zc_index
      ,a.zc_txt
      ,SUM(CASE
             WHEN zc_zf = 'S' THEN
              -dmbtr
             ELSE
              dmbtr
           END) dmbtr
      ,SUM(CASE
             WHEN zc_zf = 'S' THEN
              -dmbtr_year
             ELSE
              dmbtr_year
           END) dmbtr_year
  FROM (
  SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,SUM(dmbtr1) dmbtr
              ,0 dmbtr_year
          FROM dw_fi_cash_header a
          LEFT JOIN (SELECT *
                      FROM base a
                     WHERE a.gjahr = '2019' --????????
                       AND a.poper = '006' --????????
                       AND TRIM(leading '0' FROM a.prctr) IN
                           (SELECT dept FROM dept1 a)
                       AND NOT EXISTS --????????????
                     (SELECT *
                              FROM dw_fi_account_balance b
                             WHERE b.racct LIKE 'A%'
                               AND TRIM(leading '0' FROM b.sprctr) IN
                                   (SELECT dept FROM dept1 a)
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr)) b
                 ON a.reason_code = b.rstgr
         GROUP BY a.zc_index
                 ,a.zc_txt
                 ,a.zc_cud
                 ,a.zc_zf
  union all--36??
  --??39??
     SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,SUM(b.dmbtr) dmbtr
              ,0 dmbtr_year
          FROM (select * from dw_fi_cash_header a where a.zc_cud='T')a, 
          (select * from account_balance a
           WHERE a.gjahr||a.poper<'2019006'--????????????
             AND TRIM(leading '0' FROM a.prctr) IN
                           (SELECT dept FROM dept1 a)
                       AND NOT EXISTS --????????????
                     (SELECT *
                              FROM account_balance b
                             WHERE b.racct LIKE 'A%'
                               AND TRIM(leading '0' FROM b.sprctr) IN
                                   (SELECT dept FROM dept1 a)
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr)
              AND NOT EXISTS --??????????13????????????????????A??????.
                     (SELECT *
                              FROM account_balance b
                             WHERE b.racct not LIKE 'A%'
                               and a.gjahr||a.poper='2018013'--????????????????13????????????????????A??????.
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr))b 
                               group by a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
   union all--41??
      SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,SUM(b.dmbtr) dmbtr
              ,0 dmbtr_year
          FROM (select * from dw_fi_cash_header a where a.zc_cud='T')a, 
          (select * from begin_balance a
           WHERE 1=1
           AND TRIM(leading '0' FROM a.prctr) IN
                           (SELECT dept FROM dept1 a)
                       AND NOT EXISTS --????????????
                     (SELECT *
                              FROM begin_balance b
                             WHERE b.racct LIKE 'A%'
                               AND TRIM(leading '0' FROM b.sprctr) IN
                                   (SELECT dept FROM dept1 a)
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr))b 
      group by a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf        
--????????
        UNION ALL
        SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,0 dmbtr
              ,SUM(dmbtr1) dmbtr_year
          FROM dw_fi_cash_header a
          LEFT JOIN (SELECT *
                       FROM base a
                      WHERE a.gjahr = '2019' --????????
                        AND a.poper <= '006' --????????
                        AND TRIM(leading '0' FROM a.prctr) IN
                            (SELECT dept FROM dept1 a)
                        AND NOT EXISTS --????????????
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
                    ) b 
                ON a.reason_code = b.rstgr
         GROUP BY a.zc_index
                 ,a.zc_txt
                 ,a.zc_cud
                 ,a.zc_zf
             union all--36??
  --??39??
     SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,0 dmbtr
              ,SUM(b.dmbtr) dmbtr_year
          FROM (select * from dw_fi_cash_header a where a.zc_cud='T')a, 
          (select * from account_balance a
           WHERE a.gjahr < '2019' --????????             
            AND TRIM(leading '0' FROM a.prctr) IN
                           (SELECT dept FROM dept1 a)
                       AND NOT EXISTS --????????????
                     (SELECT *
                              FROM account_balance b
                             WHERE b.racct LIKE 'A%'
                               AND TRIM(leading '0' FROM b.sprctr) IN
                                   (SELECT dept FROM dept1 a)
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr)
                        AND NOT EXISTS --??????????13????????????????????A??????.
                     (SELECT *
                              FROM account_balance b
                             WHERE b.racct not LIKE 'A%'
                               and a.gjahr||a.poper='2018013'--????????????????13????????????????????A??????.
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr))b
                               group by a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
   union all--41??
      SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,0 dmbtr
              ,SUM(b.dmbtr) dmbtr_year
          FROM (select * from dw_fi_cash_header a where a.zc_cud='T')a, 
          (select * from begin_balance a
           WHERE 1=1
           AND TRIM(leading '0' FROM a.prctr) IN
                           (SELECT dept FROM dept1 a)
                       AND NOT EXISTS --????????????
                     (SELECT *
                              FROM begin_balance b
                             WHERE b.racct LIKE 'A%'
                               AND TRIM(leading '0' FROM b.sprctr) IN
                                   (SELECT dept FROM dept1 a)
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr))b
      group by a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf) a
 GROUP BY a.zc_index
         ,a.zc_txt
   
   
  
         
         