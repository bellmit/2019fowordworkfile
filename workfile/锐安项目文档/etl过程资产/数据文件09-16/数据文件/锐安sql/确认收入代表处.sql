with a as ( -- 目标实际合成一张表
select a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.z_quarter
      ,sum(nvl(actual,0))actual
      ,sum(nvl(target,0))target
      from (
select a.jf_group_id group_id
      ,a.jf_group_name group_name
      ,a.jf_deptid first_dept_id
      ,a.jf_dept first_dept
      ,to_char(a.COMFIRM_TIME,'yyyy') ||'Q' ||to_char(a.COMFIRM_TIME,'q')  z_quarter
      ,a.iscpx
      ,sum(a.comfirm_amount)actual
      ,0 target
  FROM ods_fi_recog_income a
  where 1=1
    and a.comfirm_amount is not null
    and a.jf_dept like'%代表处%'
   group by a.jf_group_id
      ,a.jf_group_name
      ,a.jf_deptid
      ,a.jf_dept
      ,to_char(a.COMFIRM_TIME,'yyyy') ||'Q' ||to_char(a.COMFIRM_TIME,'q') 
      ,a.iscpx
   union all
   select a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.z_quarter
      ,a.iscpx
      ,0 actual
      ,sum(target) target
  FROM ods_fi_rgic_target a
  where a.is_syb='0'
   group by  a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.z_quarter
      ,a.iscpx
      )a
      group by  a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.z_quarter
      
)
,b as (-- 事业部拆分到代表处的业绩实际值
SELECT a.jf_deptid
      ,a.jf_dept
      ,to_char(a.recorddate,'yyyy') ||'Q' ||to_char(a.recorddate,'q') z_quarter
      ,SUM(a.performrecordnum) addtarvalue1
  FROM ods_fi_recog_income a
 WHERE a.is_syb = '1'
   AND a.dept_name LIKE '%事业部%'
   AND a.jf_dept LIKE '%代表处%'
   AND to_char(a.recorddate, 'yyyy') = '2019'
 GROUP BY a.jf_deptid
         ,a.jf_dept
         ,to_char(a.recorddate,'yyyy') ||'Q' ||to_char(a.recorddate,'q')
    )

,w1 as 
(-- 添一季度实际值与一季度动态目标值的差值
SELECT  a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.z_quarter
      ,a.actual jt_actual
      ,a.actual -- 一季度静态实际值
      ,NVL(a.target,0) target -- 一季度静态、动态目标值
      ,CASE
         WHEN target > actual  then 
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
select w1.group_id
      ,w1.group_name
      ,w1.first_dept_id
      ,w1.first_dept
      ,w1.z_quarter
      ,w1.jt_actual
      ,case
       when substr(w1.z_quarter,6,1) in('1','3','4') then 
            w1.actual -- 一二季度静态实际值
       when substr(w1.z_quarter,6,1) = 2 then
            w1.actual + nvl(t.addactvalue,0) --二季度静态实际值： 一季度超额完成部分（一季度实际值-一季度动态目标值）+二季度静态实际值    
       end actual
      ,w1.target -- 一二季度静态目标值
      ,CASE
         WHEN substr(w1.z_quarter,6,1) = 1 THEN
          w1.target -- 一季度动态目标值：一季度静态目标值
         WHEN substr(w1.z_quarter,6,1) = 2 THEN
          w1.target + t.addtarvalue +nvl(b.addtarvalue1,0)*0.25 -- 二季度动态目标值：一季度未完成部分（一季度动态目标值-一季度静态实际值）+一季度事业部拆分到代表处的业绩实际值 *25%+二季度静态目标值
         WHEN substr(w1.z_quarter,6,1) = 3 THEN
          w1.target + nvl(b.addtarvalue1,0) * 0.55 -- 三季度动态目标值：一季度事业部拆分到代表处的业绩实际值 *55%++三季度静态目标值+//二季度未完成部分（二季度动态目标值-二季度静态实际值）+二季度事业部拆分到代表处的业绩实际值 *25%
         WHEN substr(w1.z_quarter,6,1) = 4 THEN
          w1.target + nvl(b.addtarvalue1,0) * 0.2 -- 四季度动态目标值：一季度事业部拆分到代表处的业绩实际值 *20%+四季度静态目标值+//二季度事业部拆分到代表处的业绩实际值 *55%+三季度事业部拆分到代表处的业绩实际值 *25%+三季度未完成部分（三季度动态目标值-三季度静态实际值）
       END mtar -- 求一二季度动态目标值
  FROM w1 left join (SELECT * FROM w1 where substr(z_quarter,6,1) = 1) t  
 on t.first_dept_id = w1.first_dept_id and substr(w1.z_quarter,1,4)=  substr(t.z_quarter,1,4)
 left join (select * from b where substr(z_quarter,6,1) =1)b
 on w1.first_dept_id=b.jf_deptid and substr(w1.z_quarter,1,4)=  substr(b.z_quarter,1,4)
） 
,
w2t as (-- 添加二季度实际值与二季度动态目标值的差值
select w2.group_id
      ,w2.group_name
      ,w2.first_dept_id
      ,w2.first_dept
      ,w2.z_quarter
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
SELECT w2.group_id
      ,w2.group_name
      ,w2.first_dept_id
      ,w2.first_dept
      ,w2.z_quarter
      ,w2.jt_actual
      ,CASE
         WHEN substr(w2.z_quarter,6,1) in ('1','2','4') THEN
          w2.actual -- 一二季度静态实际值
         WHEN substr(w2.z_quarter,6,1) = 3 THEN
          w2.actual + nvl(t.addactvalue,0) -- 三季度静态实际值：三季度静态实际值+二季度超额完成部分（二季度实际值-二季度动态目标值）
        END actual
      ,w2.target -- 一二三季度静态目标值
      ,CASE
         WHEN substr(w2.z_quarter,6,1) in ('1','2') THEN
          w2.mtar -- 一二季度动态目标值
         WHEN substr(w2.z_quarter,6,1) = 3 THEN
          w2.mtar + t.addtarvalue +nvl(b.addtarvalue1,0)*0.25 -- 三季度动态目标值：一季度事业部拆分到代表处的业绩实际值 *55%+三季度静态目标值+二季度未完成部分（二季度动态目标值-二季度静态实际值）+二季度事业部拆分到代表处的业绩实际值 *25%
         WHEN substr(w2.z_quarter,6,1) = 4 THEN
         w2.mtar + nvl(b.addtarvalue1,0) * 0.55-- 四季度动态目标值：一季度事业部拆分到代表处的业绩实际值 *20%+四季度静态目标值+二季度事业部拆分到代表处的业绩实际值 *55%+//三季度事业部拆分到代表处的业绩实际值 *25%+三季度未完成部分（三季度动态目标值-三季度静态实际值）
       END mtar -- 求一二三季度动态目标值
  FROM w2 left join (SELECT * FROM w2t WHERE substr(z_quarter,6,1) = 2) t
 on t.first_dept_id = w2.first_dept_id and substr(w2.z_quarter,1,4)=  substr(t.z_quarter,1,4)
 left join (select * from b where substr(z_quarter,6,1) =2)b
 on w2.first_dept_id=b.jf_deptid and substr(w2.z_quarter,1,4)=  substr(b.z_quarter,1,4)
)
,w3t as (-- 添加三季度实际值与三季度动态目标值的差值
SELECT  w3.group_id
      ,w3.group_name
      ,w3.first_dept_id
      ,w3.first_dept
      ,w3.z_quarter
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
SELECT w3.group_id
      ,w3.group_name
      ,w3.first_dept_id
      ,w3.first_dept
      ,w3.z_quarter
      ,w3.jt_actual
      ,CASE
        WHEN substr(w3.z_quarter,6,1) in ('1','2','3') THEN
          w3.actual -- 一二三季度动态目标值
         WHEN substr(w3.z_quarter,6,1) = 4 THEN
         w3.actual + nvl(t.addactvalue,0)  -- 四季度动态目标值：四季度静态目标值+三季度未完成部分（三季度实际值-三季度动态目标值）
       END actual
      ,w3.target -- 一二三四季度静态目标值
      ,CASE
        WHEN substr(w3.z_quarter,6,1) in ('1','2','3') THEN
          w3.mtar -- 一二三季度动态目标值
         WHEN substr(w3.z_quarter,6,1) = 4 THEN
         w3.mtar + t.addtarvalue+nvl(b.addtarvalue1,0)*0.25  -- 四季度动态目标值：一季度事业部拆分到代表处的业绩实际值 *20%+四季度静态目标值+二季度事业部拆分到代表处的业绩实际值 *55%+三季度事业部拆分到代表处的业绩实际值 *25%+三季度未完成部分（三季度动态目标值-三季度静态实际值）
       END mtar -- 求一二三四季度动态目标值
  FROM w3 left join (SELECT * FROM w3t WHERE substr(z_quarter,6,1) = 3) t
  on t.first_dept_id = w3.first_dept_id and substr(w3.z_quarter,1,4)=  substr(t.z_quarter,1,4)
 left join (select * from b where substr(z_quarter,6,1) =3)b
 on w3.first_dept_id=b.jf_deptid and substr(w3.z_quarter,1,4)=  substr(b.z_quarter,1,4)
 ) 
SELECT w4.group_id
      ,w4.group_name
      ,w4.first_dept_id
      ,w4.first_dept
      ,w4.z_quarter
      ,substr(w4.z_quarter,1,4)||'年'||substr(w4.z_quarter,6,1)||'季' yearquarter
      ,substr(w4.z_quarter,1,4) z_year
      ,w4.jt_actual actual
      ,w4.actual ex_actual -- 静态实际值
      ,w4.target -- 静态目标值
      ,NVL(w4.mtar,0)mtar
      ,CASE
         WHEN w4.actual <= w4.mtar THEN
          NVL(w4.actual,0)
         ELSE
          NVL(w4.mtar,0)
       END mact
  FROM w4
  