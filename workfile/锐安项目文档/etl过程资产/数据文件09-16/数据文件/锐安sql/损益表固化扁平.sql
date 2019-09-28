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

    SELECT a.*,b.parent_key parent_code,sysdate etl_time FROM (                       
     SELECT *
        FROM a）a
       left join dw_fi_dept b
      on a.dept_code=b.db_key