
with a as ( -- 目标实际合成一张表
SELECT z_quarter
      ,post_code
      ,SUM(actual) actual
      ,SUM(target) target
  FROM (SELECT to_char(a.recorddate, 'q') z_quarter
              ,a.post_code
              ,SUM(a.jlyj) actual
              ,0 target
          FROM ods_fi_ind_perform a
         WHERE a.jlyj is not null
         GROUP BY to_char(a.recorddate, 'q')
                 ,a.post_code
        UNION ALL
        SELECT a.z_quarter
              ,a.post_id
              ,0 actual
              ,SUM(target) target
          FROM ods_fi_indpf_pltarget a
         GROUP BY a.z_quarter
                 ,a.post_id) a
 GROUP BY z_quarter
         ,post_code
) 

,w1 as 
(-- 添一季度实际值与一季度动态目标值的差值
SELECT a.z_quarter
      ,a.post_code
      ,a.actual jt_actual
      ,a.actual -- 一季度静态实际值
      ,NVL(a.target,0) target -- 一季度静态、动态目标值
      ,CASE
         WHEN target > actual then 
          target - actual
         ELSE
          0
       END addtarvalue -- 一季度未完成部分：一季度实际值-一季度动态目标值
      ,CASE
         WHEN target <= actual  then 
          actual - target
         ELSE
          0
       END addactvalue -- 一季度超额完成部分：一季度实际值-一季度动态目标值      
  FROM a
)

,
 w2 as （ -- 求一二季度动态目标
SELECT w1.z_quarter
      ,w1.post_code
      ,w1.jt_actual
      ,case
       when w1.z_quarter in('1','3','4') then 
            w1.actual -- 一二季度静态实际值
       when w1.z_quarter = 2 then
            w1.actual + nvl(t.addactvalue,0) --二季度静态实际值： 一季度超额完成部分（一季度实际值-一季度动态目标值）+二季度静态实际值    
       end actual
      ,w1.target -- 一二季度静态目标值
      ,CASE
         WHEN w1.z_quarter = 1 THEN
          w1.target -- 一季度动态目标值：一季度静态目标值
         WHEN w1.z_quarter = 2 THEN
          w1.target + nvl(t.addtarvalue,0) * 0.5 -- 二季度动态目标值：一季度未完成部分（一季度实际值-一季度动态目标值）*50%+二季度静态目标值
         WHEN w1.z_quarter = 3 THEN
          w1.target + nvl(t.addtarvalue,0) * 0.3 -- 三季度动态目标值：一季度未完成部分*30%+三季度静态目标值+//二季度未完成部分（二季度实际值-二季度动态目标值）*60%
         WHEN w1.z_quarter = 4 THEN
          w1.target + nvl(t.addtarvalue,0) * 0.2 -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+//二季度未完成部分（二季度实际值-二季度动态目标值）*40%+三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二季度动态目标值
  FROM w1 left join (SELECT * FROM w1 WHERE z_quarter = 1) t
 on t.post_code = w1.post_code 
）  
,
w2t as (-- 添加二季度实际值与二季度动态目标值的差值
SELECT w2.z_quarter
      ,w2.post_code
      ,w2.jt_actual
      ,w2.actual -- 一二季度静态实际值
      ,w2.target -- 一二季度静态目标值
      ,NVL(w2.mtar,0) mtar-- 一二季度动态目标值
      ,CASE
         WHEN mtar > actual THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- 一二季度未完成部分：一二季度动态目标值-一二季度实际值
       ,CASE
         WHEN mtar <= actual  then 
          actual - mtar
         ELSE
          0
       END addactvalue -- 二季度季度超额完成部分：二季度实际值-二季度动态目标值
      FROM w2
)
,

 w3 as (
SELECT w2.z_quarter
      ,w2.post_code
      ,w2.jt_actual
      ,CASE
         WHEN w2.z_quarter in ('1','2','4') THEN
          w2.actual -- 一二季度静态实际值
         WHEN w2.z_quarter = 3 THEN
          w2.actual + nvl(t.addactvalue,0) -- 三季度静态实际值：三季度静态实际值+二季度超额完成部分（二季度实际值-二季度动态目标值）
        END actual
      ,w2.target -- 一二三季度静态目标值
      ,CASE
         WHEN w2.z_quarter in ('1','2') THEN
          w2.mtar -- 一二季度动态目标值
         WHEN w2.z_quarter = 3 THEN
          w2.mtar + nvl(t.addtarvalue,0) * 0.6 -- 三季度动态目标值：一季度未完成部分*30%+三季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*60%
         WHEN w2.z_quarter = 4 THEN
         w2.mtar +nvl(t.addtarvalue,0) * 0.4 -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*40%+//三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二三季度动态目标值
  FROM w2 left join (SELECT * FROM w2t WHERE z_quarter = 2) t
 on t.post_code = w2.post_code 
)
,w3t as (-- 添加三季度实际值与三季度动态目标值的差值
SELECT w3.z_quarter
      ,w3.post_code
      ,w3.jt_actual
      ,w3.actual -- 一二三季度静态实际值
      ,w3.target -- 一二三季度静态目标值
      ,NVL(w3.mtar,0)mtar -- 一二三季度动态目标值
      ,CASE
         WHEN mtar > actual  THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- 一二三季度未完成部分：一二季度实际值-一二季度动态目标值
      ,CASE
         WHEN mtar <= actual  then 
          actual - mtar
         ELSE
          0
       END addactvalue -- 三季度季度超额完成部分：三季度实际值-三季度动态目标值
       FROM w3
  )
  ,w4 as(
SELECT w3.z_quarter
      ,w3.post_code
      ,w3.jt_actual      
       ,CASE
        WHEN w3.z_quarter in ('1','2','3') THEN
          w3.actual -- 一二三季度动态目标值
         WHEN w3.z_quarter = 4 THEN
         w3.actual + nvl(t.addactvalue,0)  -- 四季度动态目标值：四季度静态目标值+三季度未完成部分（三季度实际值-三季度动态目标值）
       END actual 
      ,w3.target -- 一二三四季度静态目标值
      ,CASE
        WHEN w3.z_quarter in ('1','2','3') THEN
             w3.mtar -- 一二三季度动态目标值
         WHEN w3.z_quarter = 4 THEN
         w3.mtar + nvl(t.addtarvalue,0)  -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*40%+三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二三四季度动态目标值
  FROM w3 left join (SELECT * FROM w3t WHERE z_quarter = 3) t
 on  t.post_code = w3.post_code 
 ) 
SELECT w4.z_quarter
      ,aa.staff_name as manger_name
      ,w4.post_code 
      ,aa.group_id
      ,aa.group_name
      ,aa.first_dept_id
      ,aa.first_dept
      ,aa.hyfx
      ,aa.staff_name||'-'||aa.hyfx as abstract
      ,w4.jt_actual actual
      ,w4.actual ex_actual-- 静态实际值
      ,w4.target -- 静态目标值
      ,NVL(w4.mtar,0)mtar
      ,CASE
         WHEN w4.actual <= w4.mtar THEN
          NVL(w4.actual,0)
         ELSE
          NVL(w4.mtar,0)
       END mact
  FROM w4
  left join ( select distinct staff_name,post_id,a.group_id,a.group_name,a.first_dept_id,a.first_dept,a.hyfx from ods_fi_indpf_pltarget a) aa  
         on aa.post_id=w4.post_code;
  
  