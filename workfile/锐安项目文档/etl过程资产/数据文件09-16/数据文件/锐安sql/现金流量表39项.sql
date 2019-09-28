--第39项
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
     SELECT a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
              ,0 dmbtr
              ,SUM(b.dmbtr) dmbtr_year
          FROM (select * from dw_fi_cash_header a where a.zc_cud='T')a, 
          (select * from account_balance a
           WHERE a.gjahr = '2018' --年度参数  
            -- and a.poper<'006'          
             AND TRIM(leading '0' FROM a.prctr) IN
                           (SELECT dept FROM dept1 a)
             AND NOT EXISTS --排除内部交易
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
            AND NOT EXISTS --排除上年的13期数据中账号开头不为A的数据.
                     (SELECT *
                              FROM account_balance b
                             WHERE b.racct not LIKE 'A%'
                               and a.gjahr||a.poper='2018013'--参数：排除上年的13期数据中账号开头不为A的数据.
                               AND a.racct = b.racct
                               AND a.sprctr = b.sprctr
                               AND a.gjahr = b.gjahr
                               AND a.poper = b.poper
                               AND a.prctr = b.prctr))b
                               group by a.zc_index
              ,a.zc_txt
              ,a.zc_cud
              ,a.zc_zf
   union all--41表
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
                       AND NOT EXISTS --排除内部交易
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