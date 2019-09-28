with period as (--�ڼ�Ͳ��ŵĵѿ�����
SELECT a.db_key dept_code
      ,b.gjahr || b.poper period
      ,c.zc_index
      ,c.zc_ktext
  FROM dw_fi_list_items c
      ,��select         *
  FROM dw_fi_dept a
 WHERE a.dept_level <= 4) a, dw_fi_period b
)
,act as (--ʵ��ֵ�ĵѿ�����
select  b.zc_index -- ������
       ,b.zc_ktext
       ,b.period --�ڼ�
       ,b.dept_code --��������
       ,sum(nvl(a.dmbtr,0))dmbtr --����ֵ
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
select a.zc_index -- ������
      ,a.zc_ktext
      ,a.period -- �ڼ�
      ,a.dept_code --��������
      ,'01' levl
      ,SUM(nvl(a.dmbtr, 0)) dmbtr -- ����ֵ
      ,SUM(nvl(a.dmbtr_tq, 0)) dmbtr_tq -- ����ֵ
      ,SUM(nvl(a.dmbtr_year, 0)) dmbtr_year -- �����ۼ�
      ,SUM(nvl(a.dmbtr_year_tq, 0)) dmbtr_year_tq -- ȥ���ۼ� 
from (
select a.zc_index -- ������
      ,a.zc_ktext
      ,a.period -- �ڼ�
      ,a.dept_code --��������
      ,SUM(nvl(a.dmbtr, 0)) dmbtr -- ����ֵ
      ,0 dmbtr_tq --  ȥ��ͬ��
      ,0 dmbtr_year -- �����ۼ� 
      ,0 dmbtr_year_tq -- ȥ���ۼ�
 FROM act a  
GROUP BY a.zc_index
        ,a.zc_ktext
         ,a.period
         ,a.dept_code
 union all
 -- ͬ��ֵ  
 SELECT a.zc_index -- ������
      ,a.zc_ktext
      ,a.period -- �ڼ�
      ,a.dept_code --��������
      ,0 dmbtr -- ����ֵ
      ,SUM(nvl(c.dmbtr, 0)) dmbtr_tq --  ȥ��ͬ��
      ,0 dmbtr_year --�����ۼ�
      ,0 dmbtr_year_tq -- ȥ���ۼ�      
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
--�����ۼ�ֵ
SELECT a.zc_index -- ������
      ,a.zc_ktext
      ,a.period -- �ڼ�
      ,a.dept_code --��������
      ,0 dmbtr -- ����ֵ
      ,0 dmbtr_tq --ͬ��ֵ
      ,SUM(nvl(c.dmbtr, 0)) dmbtr_year -- �����ۼ� 
      ,0 dmbtr_year_tq -- ȥ���ۼ�      
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
-- ȥ���ۼ�ֵ
SELECT a.zc_index -- ������
      ,a.zc_ktext
      ,a.period -- �ڼ�
      ,a.dept_code --��������
      ,0 dmbtr -- ����ֵ
      ,0 dmbtr_tq --ͬ��ֵ
      ,0 dmbtr_year -- �����ۼ� 
      ,SUM(nvl(c.dmbtr, 0)) dmbtr_year_tq -- ȥ���ۼ�      
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
 group by a.zc_index -- ������
         ,a.zc_ktext
         ,a.period -- �ڼ�
         ,a.dept_code --��������
 ) 

    SELECT a.*,b.parent_key parent_code,sysdate etl_time FROM (                       
     SELECT *
        FROM a��a
       left join dw_fi_dept b
      on a.dept_code=b.db_key