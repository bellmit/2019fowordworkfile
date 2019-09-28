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
   SELECT dept1 dept  FROM dept a WHERE a.dept1 ='8999'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 ='8999'--用户对应的利润中心
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1='8999'
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1='8999'       
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 ='8999')
   
  ,dept2 AS (--参数的利润中心：用来排除底层数据
   SELECT dept1 dept  FROM dept a WHERE a.dept1 ='8999'--利润中心参数
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 ='8999'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1='8999'
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1='8999'       
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 ='8999') 
, base as (
select * from dw_fi_detail a where a.racct between '1001000000' and '1001999999'
union all
select * from dw_fi_detail a where a.racct between '1002000000' and '1002999999'
union all
select * from dw_fi_detail a where a.racct between '1003000000' and '1003999999'
union all
select * from dw_fi_detail a where a.racct between 'A100100000' and 'A100199999')
    
select a.batch_num
      ,a.gjahr --年
      ,a.poper --会计期间
      ,a.budat --过账日期
      ,a.belnr --凭证号
      ,a.prctr --利润中心         
      ,a.sprctr --伙伴利润中心
      ,a.racct --科目
      ,a.racct_t --摘要
      ,a.mat_pspnr --WBS元素
      ,a.RSTGR --原因代码
      ,tdate --传输日期
      ,dmbtr1 --本位币金额
  FROM base a
 WHERE a.gjahr = '2019' --年参数   
   AND a.poper = '006' --期间参数 若钻取年度则需要<='006'
   AND a.RSTGR in  (select A.rstgr 
from (select * from dw_fi_cash_header B where B.zc_index='11')B--报表项参数
left join (select rstgr ,txt20  from dw_fi_reason_des)A
on a.rstgr=b.reason_code)
   AND TRIM(leading '0' FROM a.prctr) in  (SELECT dept FROM dept2 where DEPT is not null)
   AND NOT EXISTS
 (
SELECT *
  FROM base b
 WHERE b.racct LIKE 'A%'
  AND TRIM(leading '0' FROM b.sprctr) in  (SELECT dept FROM dept1)
           AND a.racct = b.racct
           AND a.sprctr = b.sprctr
           AND a.gjahr = b.gjahr
           AND a.poper = b.poper
           AND a.prctr = b.prctr);
           
          
