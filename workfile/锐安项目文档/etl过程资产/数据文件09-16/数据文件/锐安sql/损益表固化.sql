with period as (--期间和部门的笛卡尔积
SELECT a.db_key dept_code
      ,b.gjahr || b.poper period
      ,c.zc_index
      ,c.zc_ktext
  FROM dw_fi_list_items c
      ,（select         *
  FROM dw_fi_dept a
 WHERE a.dept_level <= 4) a, dw_fi_period b
)
,act as (--实际值的笛卡尔积
select  b.zc_index -- 报表项
       ,b.zc_ktext
       ,b.period --期间
       ,b.dept_code --利润中心
       ,sum(nvl(a.dmbtr,0))dmbtr --当期值
   from period b 
left join (select * from DW_FI_PROFIT_LOSS_CIRCLE a where a.period is not null)a
 on a.dept_code=b.dept_code
and a.period=b.period
and a.zc_index=b.zc_index
group by b.zc_index
        ,b.zc_ktext
        ,b.period
        ,b.dept_code
       )
,a as (  
select a.zc_index -- 报表项
      ,a.zc_ktext
      ,a.period -- 期间
      ,a.dept_code --利润中心
      ,'01' levl
      ,SUM(nvl(a.dmbtr, 0)) dmbtr -- 当期值
      ,SUM(nvl(a.dmbtr_tq, 0)) dmbtr_tq -- 当期值
      ,SUM(nvl(a.dmbtr_year, 0)) dmbtr_year -- 当年累计
      ,SUM(nvl(a.dmbtr_year_tq, 0)) dmbtr_year_tq -- 去年累计 
from (
select a.zc_index -- 报表项
      ,a.zc_ktext
      ,a.period -- 期间
      ,a.dept_code --利润中心
      ,SUM(nvl(a.dmbtr, 0)) dmbtr -- 当期值
      ,0 dmbtr_tq --  去年同期
      ,0 dmbtr_year -- 当年累计 
      ,0 dmbtr_year_tq -- 去年累计
 FROM act a  
GROUP BY a.zc_index
        ,a.zc_ktext
         ,a.period
         ,a.dept_code
 union all
 -- 同期值  
 SELECT a.zc_index -- 报表项
      ,a.zc_ktext
      ,a.period -- 期间
      ,a.dept_code --利润中心
      ,0 dmbtr -- 当期值
      ,SUM(nvl(c.dmbtr, 0)) dmbtr_tq --  去年同期
      ,0 dmbtr_year --当年累计
      ,0 dmbtr_year_tq -- 去年累计      
  FROM act a
  LEFT JOIN act c 
  ON a.dept_code = c.dept_code
  AND substr(a.period, 1, 4) = substr(c.period, 1, 4)+1
  AND substr(a.period, 5) = substr(c.period, 5)
  AND a.zc_index = c.zc_index
 GROUP BY a.zc_index
         ,a.zc_ktext
         ,a.period
         ,a.dept_code
         
 union all             
--当期累计值
SELECT a.zc_index -- 报表项
      ,a.zc_ktext
      ,a.period -- 期间
      ,a.dept_code --利润中心
      ,0 dmbtr -- 当期值
      ,0 dmbtr_tq --同期值
      ,SUM(nvl(c.dmbtr, 0)) dmbtr_year -- 当年累计 
      ,0 dmbtr_year_tq -- 去年累计      
  FROM act a
  LEFT JOIN act c 
  ON a.dept_code = c.dept_code
  AND substr(a.period, 1, 4) = substr(c.period, 1, 4)
  AND substr(a.period, 5) >= substr(c.period, 5)
  AND a.zc_index = c.zc_index
 GROUP BY a.zc_index
         ,a.zc_ktext
         ,a.period
         ,a.dept_code
union all
-- 去年累计值
SELECT a.zc_index -- 报表项
      ,a.zc_ktext
      ,a.period -- 期间
      ,a.dept_code --利润中心
      ,0 dmbtr -- 当期值
      ,0 dmbtr_tq --同期值
      ,0 dmbtr_year -- 当年累计 
      ,SUM(nvl(c.dmbtr, 0)) dmbtr_year_tq -- 去年累计      
  FROM act a
  LEFT JOIN act c 
  ON a.dept_code = c.dept_code
  AND substr(a.period, 1, 4) = substr(c.period, 1, 4)+1
  AND substr(a.period, 5) >= substr(c.period, 5)
  AND a.zc_index = c.zc_index
 GROUP BY a.zc_index
         ,a.zc_ktext
         ,a.period
         ,a.dept_code 
 )a
 group by a.zc_index -- 报表项
         ,a.zc_ktext
         ,a.period -- 期间
         ,a.dept_code --利润中心
 ) 
 ,b AS (
      SELECT '00005' zc_index
            ,'二、主营业务利润（亏损以“-”号填列)' zc_ktext
            ,'02' Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,sum(CASE WHEN zc_index='00001' THEN b.dmbtr
             ELSE -b.dmbtr END)  dmbtr
             ,sum(CASE WHEN zc_index='00001' THEN b.dmbtr_tq
             ELSE -b.dmbtr_tq END)  dmbtr_tq
            ,sum(CASE WHEN zc_index='00001' THEN b.dmbtr_year
             ELSE -b.dmbtr_year END) dmbtr_year
            ,sum(CASE WHEN zc_index='00001' THEN b.dmbtr_year_tq
             ELSE -b.dmbtr_year_tq END) dmbtr_year_tq
        FROM  a b
       WHERE to_number(zc_index) >= 1
         AND to_number(zc_index) <= 4
    group by b.period -- 期间
            ,b.dept_code --利润中心
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,b.Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_tq) dmbtr_tq
            ,SUM(b.dmbtr_year) dmbtr_year
            ,sum(b.dmbtr_year_tq) dmbtr_year_tq
        FROM  a b
       WHERE b.zc_index <> '00005'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,b.Levl
              ,b.period -- 期间
              ,b.dept_code --利润中心
            )
            
,c AS (
      SELECT '00021' zc_index
            ,'三、营业利润（亏损以“-”号填列）' zc_ktext
            ,'03' Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,sum(CASE WHEN zc_index IN ('00005','00006') THEN b.dmbtr
             ELSE -b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index IN ('00005','00006') THEN b.dmbtr_tq
             ELSE -b.dmbtr_tq END)  dmbtr_tq
            ,sum(CASE WHEN zc_index IN ('00005','00006') THEN b.dmbtr_year
             ELSE -b.dmbtr_year END) dmbtr_year
             ,sum(CASE WHEN zc_index IN ('00005','00006') THEN b.dmbtr_year_tq
             ELSE -b.dmbtr_year_tq END) dmbtr_year_tq
        FROM b
       WHERE to_number(zc_index) >= 5
         AND to_number(zc_index) <= 20
   group by  b.period -- 期间
            ,b.dept_code --利润中心 
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,b.Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_tq) dmbtr_tq
            ,SUM(b.dmbtr_year) dmbtr_year
            ,sum(b.dmbtr_year_tq) dmbtr_year_tq
        FROM b
       WHERE b.zc_index <> '00021'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,b.Levl
              ,b.period -- 期间
              ,b.dept_code --利润中心
              ) 
              
   
 ,d AS (  
   SELECT '00027' zc_index
            ,'四、利润总额（亏损总额以“-”号填列）' zc_ktext
            ,'04' Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,sum(CASE WHEN zc_index IN ('00025','00026') THEN -b.dmbtr
             ELSE b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index IN ('00025','00026') THEN -b.dmbtr_tq
             ELSE b.dmbtr_tq END)  dmbtr_tq
            ,sum(CASE WHEN zc_index IN ('00025','00026') THEN -b.dmbtr_year
             ELSE b.dmbtr_year END) dmbtr_year
             ,sum(CASE WHEN zc_index IN ('00025','00026') THEN -b.dmbtr_year_tq
             ELSE b.dmbtr_year_tq END) dmbtr_year_tq
        FROM c b
       WHERE to_number(zc_index) >= 21
         AND to_number(zc_index) <= 26
     group by b.period -- 期间
             ,b.dept_code --利润中心
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,b.Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_tq) dmbtr_tq
            ,SUM(b.dmbtr_year) dmbtr_year
            ,sum(b.dmbtr_year_tq) dmbtr_year_tq
        FROM c b
       WHERE b.zc_index <> '00027'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,b.Levl
              ,b.period -- 期间
              ,b.dept_code --利润中心
              )
  select count(*) from (  
    SELECT a.*,b.parent_key,sysdate etl_time FROM (                       
     SELECT '00029' zc_index
            ,'五、净利润（净亏损以“-”号填列）' zc_ktext
            ,'05' Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,sum(CASE WHEN zc_index IN ('00027') THEN b.dmbtr
             ELSE -b.dmbtr END)  dmbtr
            ,sum(CASE WHEN zc_index IN ('00027') THEN b.dmbtr_tq
             ELSE -b.dmbtr_tq END)  dmbtr_tq
            ,sum(CASE WHEN zc_index IN ('00027') THEN b.dmbtr_year
             ELSE -b.dmbtr_year END) dmbtr_year
             ,sum(CASE WHEN zc_index IN ('00027') THEN b.dmbtr_year_tq
             ELSE -b.dmbtr_year_tq END) dmbtr_year_tq
        FROM d b
       WHERE to_number(zc_index) >= 27
         AND to_number(zc_index) <= 28
    group by b.period -- 期间
            ,b.dept_code --利润中心
        
      UNION ALL
      SELECT to_char(b.zc_index)zc_index
            ,to_char(b.zc_ktext)zc_ktext
            ,b.Levl
            ,b.period -- 期间
            ,b.dept_code --利润中心
            ,SUM(b.dmbtr) dmbtr
            ,SUM(b.dmbtr_tq) dmbtr_tq
            ,SUM(b.dmbtr_year) dmbtr_year
            ,sum(b.dmbtr_year_tq) dmbtr_year_tq
        FROM  d b
       WHERE b.zc_index <> '00029'
      GROUP BY b.zc_index
              ,b.zc_ktext
              ,b.Levl 
              ,b.period -- 期间
              ,b.dept_code --利润中心
              )a
       left join dw_fi_dept b
      on a.dept_code=b.db_key
       )
      
      
