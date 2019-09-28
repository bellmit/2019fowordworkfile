with a as ( -- Ŀ��ʵ�ʺϳ�һ�ű�
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
(-- ��һ����ʵ��ֵ��һ���ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
      ,a.actual jt_actual
      ,a.actual -- һ���Ⱦ�̬ʵ��ֵ
      ,NVL(a.target,0) target -- һ���Ⱦ�̬����̬Ŀ��ֵ
      ,CASE
         WHEN target > actual or A.iscpx =0 then 
          target - actual
         ELSE
          0
       END addtarvalue -- һ����δ��ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN target <= actual and iscpx=1 then 
          actual - target
         ELSE
          0
       END addactvalue -- һ���ȳ�����ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ
      
  FROM a
) 

,
 w2 as �� -- ��һ�����ȶ�̬Ŀ��
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
            w1.actual -- һ�����Ⱦ�̬ʵ��ֵ
       when w1.z_quarter = 2 then
            w1.actual + nvl(t.addactvalue,0) --�����Ⱦ�̬ʵ��ֵ�� һ���ȳ�����ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ��+�����Ⱦ�̬ʵ��ֵ    
       end actual
      ,w1.target -- һ�����Ⱦ�̬Ŀ��ֵ
      ,CASE
         WHEN w1.z_quarter = 1 THEN
          w1.target -- һ���ȶ�̬Ŀ��ֵ��һ���Ⱦ�̬Ŀ��ֵ
         WHEN w1.z_quarter = 2 THEN
          w1.target + t.addtarvalue * 0.5 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ��*50%+�����Ⱦ�̬Ŀ��ֵ
         WHEN w1.z_quarter = 3 THEN
          w1.target + t.addtarvalue * 0.3 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*30%+�����Ⱦ�̬Ŀ��ֵ+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*60%
         WHEN w1.z_quarter = 4 THEN
          w1.target + t.addtarvalue * 0.2 -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�����ȶ�̬Ŀ��ֵ
  FROM w1 left join (SELECT * FROM w1 WHERE z_quarter = 1) t
 on t.second_dept = w1.second_dept and t.iscpx=w1.iscpx
�� 
,
w2t as (-- ��Ӷ�����ʵ��ֵ������ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT w2.group_id
      ,w2.group_name
      ,w2.first_dept_id
      ,w2.first_dept
      ,w2.second_dept_id
      ,w2.second_dept
      ,w2.z_quarter
      ,w2.iscpx
      ,w2.jt_actual
      ,w2.actual -- һ�����Ⱦ�̬ʵ��ֵ
      ,w2.target -- һ�����Ⱦ�̬Ŀ��ֵ
      ,NVL(w2.mtar,0) mtar-- һ�����ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar > actual or W2.iscpx=0 THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- һ������δ��ɲ��֣�һ�����ȶ�̬Ŀ��ֵ-һ������ʵ��ֵ
       ,CASE
         WHEN mtar <= actual and iscpx=1 then 
          actual - mtar
         ELSE
          0
       END addactvalue -- �����ȼ��ȳ�����ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ
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
          w2.actual -- һ�����Ⱦ�̬ʵ��ֵ
         WHEN w2.z_quarter = 3 THEN
          w2.actual + nvl(t.addactvalue,0) -- �����Ⱦ�̬ʵ��ֵ�������Ⱦ�̬ʵ��ֵ+�����ȳ�����ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
        END actual
      ,w2.target -- һ�������Ⱦ�̬Ŀ��ֵ
      ,CASE
         WHEN w2.z_quarter in ('1','2') THEN
          w2.mtar -- һ�����ȶ�̬Ŀ��ֵ
         WHEN w2.z_quarter = 3 THEN
          w2.mtar + t.addtarvalue * 0.6 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*30%+�����Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*60%
         WHEN w2.z_quarter = 4 THEN
         w2.mtar + t.addtarvalue * 0.4 -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�������ȶ�̬Ŀ��ֵ
  FROM w2 left join (SELECT * FROM w2t WHERE z_quarter = 2) t
 on t.second_dept = w2.second_dept and t.iscpx=w2.iscpx
)
,w3t as (-- ���������ʵ��ֵ�������ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT w3.group_id
      ,w3.group_name
      ,w3.first_dept_id
      ,w3.first_dept
      ,w3.second_dept_id
      ,w3.second_dept
      ,w3.z_quarter
      ,w3.iscpx
      ,w3.jt_actual
      ,w3.actual -- һ�������Ⱦ�̬ʵ��ֵ
      ,w3.target -- һ�������Ⱦ�̬Ŀ��ֵ
      ,NVL(w3.mtar,0)mtar -- һ�������ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar > actual or W3.iscpx=0 THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- һ��������δ��ɲ��֣�һ������ʵ��ֵ-һ�����ȶ�̬Ŀ��ֵ
       ,CASE
         WHEN mtar <= actual and iscpx=1 then 
          actual - mtar
         ELSE
          0
       END addactvalue -- �����ȼ��ȳ�����ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ
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
          w3.actual -- һ�������ȶ�̬Ŀ��ֵ
         WHEN w3.z_quarter = 4 THEN
         w3.actual + nvl(t.addactvalue,0)  -- �ļ��ȶ�̬Ŀ��ֵ���ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END actual 
      ,w3.target -- һ�����ļ��Ⱦ�̬Ŀ��ֵ
      ,CASE
        WHEN w3.z_quarter in ('1','2','3') THEN
          w3.mtar -- һ�������ȶ�̬Ŀ��ֵ
         WHEN w3.z_quarter = 4 THEN
         w3.mtar + t.addtarvalue  -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�����ļ��ȶ�̬Ŀ��ֵ
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
      ,w4.actual EX_ACTUAL-- ��̬ʵ��ֵ
      ,w4.target -- ��̬Ŀ��ֵ
      ,NVL(w4.mtar,0)mtar
      ,CASE
         WHEN w4.actual <= w4.mtar or iscpx=0 THEN
          NVL(w4.actual,0)
         ELSE
          NVL(w4.mtar,0)
       END mact
  FROM w4