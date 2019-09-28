with a as ( -- 目标实际合成一张表
select a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
      ,sum(nvl(actual,0))actual
      ,sum(nvl(target,0))target
      from (
SELECT a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,to_char(a.recorddate,'q')z_quarter
      ,a.iscpx
      ,sum(a.hyyj)actual
      ,0 target
  FROM ods_fi_ind_perform a
  where a.HYYJ is not null
   group by a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,to_char(a.recorddate,'q')
      ,a.iscpx
   union all
   SELECT a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
      ,0 actual
      ,sum(target) target
  FROM ods_fi_indpf_target a
   group by a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
      )a
      group by a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
)

,w1 as 
(-- 添一季度实际值与一季度动态目标值的差值
SELECT a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
      ,a.actual jt_actual
      ,a.actual -- 一季度静态实际值
      ,NVL(a.target,0) target -- 一季度静态、动态目标值
      ,CASE
         WHEN target > actual or A.iscpx =0 then 
          target - actual
         ELSE
          0
       END addtarvalue -- 一季度未完成部分：一季度实际值-一季度动态目标值
      ,CASE
         WHEN target <= actual and iscpx=1 then 
          actual - target
         ELSE
          0
       END addactvalue -- 一季度超额完成部分：一季度实际值-一季度动态目标值
      
  FROM a
) 

,
 w2 as （ -- 求一二季度动态目标
SELECT w1.group_id
      ,w1.group_name
      ,w1.first_dept_id
      ,w1.first_dept
      ,w1.second_dept_id
      ,w1.second_dept
      ,w1.z_quarter
      ,w1.iscpx
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
          w1.target + t.addtarvalue * 0.5 -- 二季度动态目标值：一季度未完成部分（一季度实际值-一季度动态目标值）*50%+二季度静态目标值
         WHEN w1.z_quarter = 3 THEN
          w1.target + t.addtarvalue * 0.3 -- 三季度动态目标值：一季度未完成部分*30%+三季度静态目标值+//二季度未完成部分（二季度实际值-二季度动态目标值）*60%
         WHEN w1.z_quarter = 4 THEN
          w1.target + t.addtarvalue * 0.2 -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+//二季度未完成部分（二季度实际值-二季度动态目标值）*40%+三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二季度动态目标值
  FROM w1 left join (SELECT * FROM w1 WHERE z_quarter = 1) t
 on t.second_dept = w1.second_dept and t.iscpx=w1.iscpx
） 
,
w2t as (-- 添加二季度实际值与二季度动态目标值的差值
SELECT w2.group_id
      ,w2.group_name
      ,w2.first_dept_id
      ,w2.first_dept
      ,w2.second_dept_id
      ,w2.second_dept
      ,w2.z_quarter
      ,w2.iscpx
      ,w2.jt_actual
      ,w2.actual -- 一二季度静态实际值
      ,w2.target -- 一二季度静态目标值
      ,NVL(w2.mtar,0) mtar-- 一二季度动态目标值
      ,CASE
         WHEN mtar > actual or W2.iscpx=0 THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- 一二季度未完成部分：一二季度动态目标值-一二季度实际值
       ,CASE
         WHEN mtar <= actual and iscpx=1 then 
          actual - mtar
         ELSE
          0
       END addactvalue -- 二季度季度超额完成部分：二季度实际值-二季度动态目标值
     FROM w2
)
,

 w3 as (
SELECT w2.group_id
      ,w2.group_name
      ,w2.first_dept_id
      ,w2.first_dept
      ,w2.second_dept_id
      ,w2.second_dept
      ,w2.z_quarter
      ,w2.iscpx
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
          w2.mtar + t.addtarvalue * 0.6 -- 三季度动态目标值：一季度未完成部分*30%+三季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*60%
         WHEN w2.z_quarter = 4 THEN
         w2.mtar + t.addtarvalue * 0.4 -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*40%+//三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二三季度动态目标值
  FROM w2 left join (SELECT * FROM w2t WHERE z_quarter = 2) t
 on t.second_dept = w2.second_dept and t.iscpx=w2.iscpx
)
,w3t as (-- 添加三季度实际值与三季度动态目标值的差值
SELECT w3.group_id
      ,w3.group_name
      ,w3.first_dept_id
      ,w3.first_dept
      ,w3.second_dept_id
      ,w3.second_dept
      ,w3.z_quarter
      ,w3.iscpx
      ,w3.jt_actual
      ,w3.actual -- 一二三季度静态实际值
      ,w3.target -- 一二三季度静态目标值
      ,NVL(w3.mtar,0)mtar -- 一二三季度动态目标值
      ,CASE
         WHEN mtar > actual or W3.iscpx=0 THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- 一二三季度未完成部分：一二季度实际值-一二季度动态目标值
       ,CASE
         WHEN mtar <= actual and iscpx=1 then 
          actual - mtar
         ELSE
          0
       END addactvalue -- 三季度季度超额完成部分：三季度实际值-三季度动态目标值
      FROM w3
  )
  ,w4 as(
SELECT w3.group_id
      ,w3.group_name
      ,w3.first_dept_id
      ,w3.first_dept
      ,w3.second_dept_id
      ,w3.second_dept
      ,w3.z_quarter
      ,w3.iscpx
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
         w3.mtar + t.addtarvalue  -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*40%+三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二三四季度动态目标值
  FROM w3 left join (SELECT * FROM w3t WHERE z_quarter = 3) t
 on  t.second_dept = w3.second_dept and t.iscpx=w3.iscpx
 )
SELECT w4.group_id
      ,w4.group_name
      ,w4.first_dept_id
      ,w4.first_dept
      ,w4.second_dept_id
      ,w4.second_dept
      ,w4.z_quarter
      ,w4.iscpx
      ,w4.jt_actual actual
      ,w4.actual EX_ACTUAL-- 静态实际值
      ,w4.target -- 静态目标值
      ,NVL(w4.mtar,0)mtar
      ,CASE
         WHEN w4.actual <= w4.mtar or iscpx=0 THEN
          NVL(w4.actual,0)
         ELSE
          NVL(w4.mtar,0)
       END mact
  FROM w4