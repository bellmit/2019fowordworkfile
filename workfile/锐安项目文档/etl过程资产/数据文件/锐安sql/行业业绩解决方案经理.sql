
with a as ( -- Ŀ��ʵ�ʺϳ�һ�ű�
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
(-- ��һ����ʵ��ֵ��һ���ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT a.z_quarter
      ,a.post_code
      ,a.actual jt_actual
      ,a.actual -- һ���Ⱦ�̬ʵ��ֵ
      ,NVL(a.target,0) target -- һ���Ⱦ�̬����̬Ŀ��ֵ
      ,CASE
         WHEN target > actual then 
          target - actual
         ELSE
          0
       END addtarvalue -- һ����δ��ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN target <= actual  then 
          actual - target
         ELSE
          0
       END addactvalue -- һ���ȳ�����ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ      
  FROM a
)

,
 w2 as �� -- ��һ�����ȶ�̬Ŀ��
SELECT w1.z_quarter
      ,w1.post_code
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
          w1.target + nvl(t.addtarvalue,0) * 0.5 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ��*50%+�����Ⱦ�̬Ŀ��ֵ
         WHEN w1.z_quarter = 3 THEN
          w1.target + nvl(t.addtarvalue,0) * 0.3 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*30%+�����Ⱦ�̬Ŀ��ֵ+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*60%
         WHEN w1.z_quarter = 4 THEN
          w1.target + nvl(t.addtarvalue,0) * 0.2 -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�����ȶ�̬Ŀ��ֵ
  FROM w1 left join (SELECT * FROM w1 WHERE z_quarter = 1) t
 on t.post_code = w1.post_code 
��  
,
w2t as (-- ��Ӷ�����ʵ��ֵ������ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT w2.z_quarter
      ,w2.post_code
      ,w2.jt_actual
      ,w2.actual -- һ�����Ⱦ�̬ʵ��ֵ
      ,w2.target -- һ�����Ⱦ�̬Ŀ��ֵ
      ,NVL(w2.mtar,0) mtar-- һ�����ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar > actual THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- һ������δ��ɲ��֣�һ�����ȶ�̬Ŀ��ֵ-һ������ʵ��ֵ
       ,CASE
         WHEN mtar <= actual  then 
          actual - mtar
         ELSE
          0
       END addactvalue -- �����ȼ��ȳ�����ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ
      FROM w2
)
,

 w3 as (
SELECT w2.z_quarter
      ,w2.post_code
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
          w2.mtar + nvl(t.addtarvalue,0) * 0.6 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*30%+�����Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*60%
         WHEN w2.z_quarter = 4 THEN
         w2.mtar +nvl(t.addtarvalue,0) * 0.4 -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�������ȶ�̬Ŀ��ֵ
  FROM w2 left join (SELECT * FROM w2t WHERE z_quarter = 2) t
 on t.post_code = w2.post_code 
)
,w3t as (-- ���������ʵ��ֵ�������ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT w3.z_quarter
      ,w3.post_code
      ,w3.jt_actual
      ,w3.actual -- һ�������Ⱦ�̬ʵ��ֵ
      ,w3.target -- һ�������Ⱦ�̬Ŀ��ֵ
      ,NVL(w3.mtar,0)mtar -- һ�������ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar > actual  THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- һ��������δ��ɲ��֣�һ������ʵ��ֵ-һ�����ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar <= actual  then 
          actual - mtar
         ELSE
          0
       END addactvalue -- �����ȼ��ȳ�����ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ
       FROM w3
  )
  ,w4 as(
SELECT w3.z_quarter
      ,w3.post_code
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
         w3.mtar + nvl(t.addtarvalue,0)  -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�����ļ��ȶ�̬Ŀ��ֵ
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
      ,w4.actual ex_actual-- ��̬ʵ��ֵ
      ,w4.target -- ��̬Ŀ��ֵ
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
  
  