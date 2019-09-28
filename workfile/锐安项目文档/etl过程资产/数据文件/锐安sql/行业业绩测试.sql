-- select * from test_1 a
with w1 as 
(-- 添一季度实际值与一季度动态目标值的差值
SELECT a.jd -- 季度
      ,a.dept -- 部门
      ,a.actual -- 一季度静态实际值
      ,a.target -- 一季度静态、动态目标值
      ,CASE
         WHEN target > actual THEN
          target - actual
         ELSE
          0
       END addtarvalue -- 一季度未完成部分：一季度实际值-一季度动态目标值
      ,CASE
         WHEN target < actual THEN
          actual - target
         ELSE
          0
       END addactvalue -- 一季度超额完成部分：一季度目标值-一季度动态实际值
  FROM test_1 a
)
,
 w2 as （ -- 求一二季度动态目标
SELECT w1.dept -- 部门
      ,w1.jd -- 季度
      ,w1.actual -- 一二季度静态实际值
      ,w1.target -- 一二季度静态目标值
      ,CASE
         WHEN w1.jd = 1 THEN
          w1.target -- 一季度动态目标值：一季度静态目标值
         WHEN w1.jd = 2 THEN
          w1.target + t.addtarvalue * 0.5 -- 二季度动态目标值：一季度未完成部分（一季度实际值-一季度动态目标值）*50%+二季度静态目标值
         WHEN w1.jd = 3 THEN
          w1.target + t.addtarvalue * 0.3 -- 三季度动态目标值：一季度未完成部分*30%+三季度静态目标值+//二季度未完成部分（二季度实际值-二季度动态目标值）*60%
         WHEN w1.jd = 4 THEN
          w1.target + t.addtarvalue * 0.2 -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+//二季度未完成部分（二季度实际值-二季度动态目标值）*40%+三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二季度动态目标值
       FROM w1 left join 
      (SELECT * FROM w1 WHERE jd = 1) t
 on  t.dept = w1.dept 
）SELECT * from W2
,
w2t as (-- 添加二季度实际值与二季度动态目标值的差值
SELECT w2.jd -- 季度
      ,w2.dept -- 部门
      ,w2.actual -- 一二季度静态实际值
      ,w2.target -- 一二季度静态目标值
      ,w2.mtar -- 一二季度动态目标值
      ,CASE
         WHEN mtar > actual THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- 一二季度未完成部分：一二季度动态目标值-一二季度实际值
      ,CASE
         WHEN mtar < actual THEN
          mtar - actual
         ELSE
          0
       END addactvalue -- 一二季度超额完成部分：一二季度目标值-一二季度动态实际值
  FROM w2
),

 w3 as (
SELECT w2.dept -- 部门
      ,w2.jd -- 季度
      ,w2.actual -- 一二三季度静态实际值
      ,w2.target -- 一二三季度静态目标值
      ,CASE
         WHEN w2.jd in ('1','2') THEN
          w2.mtar -- 一二季度动态目标值
         WHEN w2.jd = 3 THEN
          w2.mtar + t.addtarvalue * 0.6 -- 三季度动态目标值：一季度未完成部分*30%+三季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*60%
         WHEN w2.jd = 4 THEN
         w2.mtar + t.addtarvalue * 0.4 -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*40%+//三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二三季度动态目标值
  FROM w2
      ,(SELECT * FROM w2t WHERE jd = 2) t
 WHERE t.dept = w2.dept 
)
,w3t as (-- 添加三季度实际值与三季度动态目标值的差值
SELECT w3.jd -- 季度
      ,w3.dept -- 部门
      ,w3.actual -- 一二三季度静态实际值
      ,w3.target -- 一二三季度静态目标值
      ,w3.mtar -- 一二三季度动态目标值
      ,CASE
         WHEN mtar > actual THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- 一二三季度未完成部分：一二季度实际值-一二季度动态目标值
      ,CASE
         WHEN mtar < actual THEN
          mtar - actual
         ELSE
          0
       END addactvalue -- 一二三季度超额完成部分：一二季度目标值-一二季度动态实际值
  FROM w3
  )
  ,w4 as(
SELECT w3.dept -- 部门
      ,w3.jd -- 季度
      ,w3.actual -- 一二三四季度静态实际值
      ,w3.target -- 一二三四季度静态目标值
      ,CASE
         WHEN w3.jd in ('1','2','3') THEN
          w3.mtar -- 一二三季度动态目标值
         WHEN w3.jd = 4 THEN
         w3.mtar + t.addtarvalue  -- 四季度动态目标值：一季度未完成部分*20%+四季度静态目标值+二季度未完成部分（二季度实际值-二季度动态目标值）*40%+三季度未完成部分（三季度实际值-三季度动态目标值）
       END mtar -- 求一二三四季度动态目标值
  FROM w3
      ,(SELECT * FROM w3t WHERE jd = 3) t
 WHERE t.dept = w3.dept 
 )
select w4.dept -- 部门
      ,w4.jd -- 季度
      ,w4.actual -- 静态实际值
      ,w4.target -- 静态目标值
      ,w4.mtar 
      ,case when w4.actual <=w4.mtar then w4.actual
            else w4.mtar 
            end mact
 from w4