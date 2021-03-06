-- 驾驶舱

SELECT case
         when a.province in ('内蒙古', '宁夏', '广西', '新疆', '西藏') then
          a.province || '自治区'
         when a.province in ('北京', '上海', '天津', '重庆') then
          a.province || '市'
         else
          a.province || '省'
       end province， a.yj_totalsum
  FROM DW_CT_MAP_YJ a;
  
  select tt.* from 
(select rownum rn,t.* from DW_CT_MAP_YJ t )tt
where tt.rn in 
(select trunc(dbms_random.value(1,(select count(*) from DW_CT_MAP_YJ )))
from dual
connect by rownum<=3)
----------------------------------------------
  
  
--业绩回款  
SELECT * FROM DW_SD_PERFORMANCE_PAYMENT;
-- 地图
SELECT * FROM DW_CT_MAP_YJ A;
-- 立项
SELECT * FROM DW_CT_BIGDATA_ITEM;
-- 应收
SELECT * FROM DW_CT_STOCK_DATA;
--人力
SELECT * FROM DW_CT_HR_DATA;

select * from dim_province