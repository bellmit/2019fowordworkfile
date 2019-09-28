-- select * from test_1 a
with w1 as 
(-- ��һ����ʵ��ֵ��һ���ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT a.jd -- ����
      ,a.dept -- ����
      ,a.actual -- һ���Ⱦ�̬ʵ��ֵ
      ,a.target -- һ���Ⱦ�̬����̬Ŀ��ֵ
      ,CASE
         WHEN target > actual THEN
          target - actual
         ELSE
          0
       END addtarvalue -- һ����δ��ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN target < actual THEN
          actual - target
         ELSE
          0
       END addactvalue -- һ���ȳ�����ɲ��֣�һ����Ŀ��ֵ-һ���ȶ�̬ʵ��ֵ
  FROM test_1 a
)
,
 w2 as �� -- ��һ�����ȶ�̬Ŀ��
SELECT w1.dept -- ����
      ,w1.jd -- ����
      ,w1.actual -- һ�����Ⱦ�̬ʵ��ֵ
      ,w1.target -- һ�����Ⱦ�̬Ŀ��ֵ
      ,CASE
         WHEN w1.jd = 1 THEN
          w1.target -- һ���ȶ�̬Ŀ��ֵ��һ���Ⱦ�̬Ŀ��ֵ
         WHEN w1.jd = 2 THEN
          w1.target + t.addtarvalue * 0.5 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ��֣�һ����ʵ��ֵ-һ���ȶ�̬Ŀ��ֵ��*50%+�����Ⱦ�̬Ŀ��ֵ
         WHEN w1.jd = 3 THEN
          w1.target + t.addtarvalue * 0.3 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*30%+�����Ⱦ�̬Ŀ��ֵ+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*60%
         WHEN w1.jd = 4 THEN
          w1.target + t.addtarvalue * 0.2 -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�����ȶ�̬Ŀ��ֵ
       FROM w1 left join 
      (SELECT * FROM w1 WHERE jd = 1) t
 on  t.dept = w1.dept 
��SELECT * from W2
,
w2t as (-- ��Ӷ�����ʵ��ֵ������ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT w2.jd -- ����
      ,w2.dept -- ����
      ,w2.actual -- һ�����Ⱦ�̬ʵ��ֵ
      ,w2.target -- һ�����Ⱦ�̬Ŀ��ֵ
      ,w2.mtar -- һ�����ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar > actual THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- һ������δ��ɲ��֣�һ�����ȶ�̬Ŀ��ֵ-һ������ʵ��ֵ
      ,CASE
         WHEN mtar < actual THEN
          mtar - actual
         ELSE
          0
       END addactvalue -- һ�����ȳ�����ɲ��֣�һ������Ŀ��ֵ-һ�����ȶ�̬ʵ��ֵ
  FROM w2
),

 w3 as (
SELECT w2.dept -- ����
      ,w2.jd -- ����
      ,w2.actual -- һ�������Ⱦ�̬ʵ��ֵ
      ,w2.target -- һ�������Ⱦ�̬Ŀ��ֵ
      ,CASE
         WHEN w2.jd in ('1','2') THEN
          w2.mtar -- һ�����ȶ�̬Ŀ��ֵ
         WHEN w2.jd = 3 THEN
          w2.mtar + t.addtarvalue * 0.6 -- �����ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*30%+�����Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*60%
         WHEN w2.jd = 4 THEN
         w2.mtar + t.addtarvalue * 0.4 -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+//������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�������ȶ�̬Ŀ��ֵ
  FROM w2
      ,(SELECT * FROM w2t WHERE jd = 2) t
 WHERE t.dept = w2.dept 
)
,w3t as (-- ���������ʵ��ֵ�������ȶ�̬Ŀ��ֵ�Ĳ�ֵ
SELECT w3.jd -- ����
      ,w3.dept -- ����
      ,w3.actual -- һ�������Ⱦ�̬ʵ��ֵ
      ,w3.target -- һ�������Ⱦ�̬Ŀ��ֵ
      ,w3.mtar -- һ�������ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar > actual THEN
          mtar - actual
         ELSE
          0
       END addtarvalue -- һ��������δ��ɲ��֣�һ������ʵ��ֵ-һ�����ȶ�̬Ŀ��ֵ
      ,CASE
         WHEN mtar < actual THEN
          mtar - actual
         ELSE
          0
       END addactvalue -- һ�������ȳ�����ɲ��֣�һ������Ŀ��ֵ-һ�����ȶ�̬ʵ��ֵ
  FROM w3
  )
  ,w4 as(
SELECT w3.dept -- ����
      ,w3.jd -- ����
      ,w3.actual -- һ�����ļ��Ⱦ�̬ʵ��ֵ
      ,w3.target -- һ�����ļ��Ⱦ�̬Ŀ��ֵ
      ,CASE
         WHEN w3.jd in ('1','2','3') THEN
          w3.mtar -- һ�������ȶ�̬Ŀ��ֵ
         WHEN w3.jd = 4 THEN
         w3.mtar + t.addtarvalue  -- �ļ��ȶ�̬Ŀ��ֵ��һ����δ��ɲ���*20%+�ļ��Ⱦ�̬Ŀ��ֵ+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��*40%+������δ��ɲ��֣�������ʵ��ֵ-�����ȶ�̬Ŀ��ֵ��
       END mtar -- ��һ�����ļ��ȶ�̬Ŀ��ֵ
  FROM w3
      ,(SELECT * FROM w3t WHERE jd = 3) t
 WHERE t.dept = w3.dept 
 )
select w4.dept -- ����
      ,w4.jd -- ����
      ,w4.actual -- ��̬ʵ��ֵ
      ,w4.target -- ��̬Ŀ��ֵ
      ,w4.mtar 
      ,case when w4.actual <=w4.mtar then w4.actual
            else w4.mtar 
            end mact
 from w4