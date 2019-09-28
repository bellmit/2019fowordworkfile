--�����ۺ����
  --�����ۺ���Ŀ����
 -- ��������Ŀ��
SELECT YEAR(SYSDATE()) AS z_year
      ,'����Ŀ��' AS TYPE
      ,COUNT(id) num
      ,SYSDATE() etl_time
  FROM construct_project a
 WHERE YEAR(a.plan_finish_date) = YEAR(SYSDATE())

UNION ALL

-- �����깤��Ŀ��
SELECT YEAR(SYSDATE()) AS z_year
      ,'�깤��Ŀ��' AS TYPE
      ,COUNT(id)
      ,SYSDATE() etl_time
  FROM construct_project a
 WHERE YEAR(a.plan_finish_date) = YEAR(SYSDATE())
   AND EXISTS (SELECT *
          FROM construct_milestone b
         WHERE b.milestone_name = '�깤'
           AND a.id = b.construct_project_id)

UNION ALL

-- ����������Ŀ��
SELECT YEAR(SYSDATE()) AS z_year
      ,'������Ŀ��' AS TYPE
      ,COUNT(id)
      ,SYSDATE() etl_time
  FROM check_project a
 WHERE YEAR(a.plan_finish_date) = YEAR(SYSDATE())
   AND EXISTS (SELECT *
          FROM check_milestone b
         WHERE b.milestone_name = '����'
           AND a.id = b.check_project_id)

UNION ALL
-- ������Ŀ�İ�ʱ�����
SELECT a.z_year AS YEAR
      ,'��ʱ�����' AS TYPE
      ,b.tq_xm / a.all_xm AS SUM
      ,SYSDATE() etl_time
  FROM (SELECT YEAR(plan_finish_date) AS z_year
              ,COUNT(DISTINCT construct_project_id) all_xm
          FROM construct_milestone
         WHERE YEAR(plan_finish_date) = YEAR(SYSDATE())
         GROUP BY YEAR(plan_finish_date)) a
      ,(SELECT COUNT(DISTINCT construct_project_id) tq_xm
          FROM construct_milestone a
         WHERE a.actual_finish_date > a.plan_finish_date
           AND YEAR(plan_finish_date) = YEAR(SYSDATE())
           AND a.milestone_name = '�깤') b

UNION ALL
-- ������Ŀ�İ�ʱ�����
SELECT a.z_year AS YEAR
      ,'���������' AS TYPE
      ,b.tq_xm / a.all_xm AS SUM
      ,SYSDATE() etl_time
  FROM (SELECT YEAR(plan_finish_date) AS z_year
              ,COUNT(DISTINCT check_project_id) all_xm
          FROM check_milestone
         WHERE YEAR(plan_finish_date) = YEAR(SYSDATE())
         GROUP BY YEAR(plan_finish_date)) a
      ,(SELECT COUNT(DISTINCT check_project_id) tq_xm
          FROM check_milestone a
         WHERE a.actual_finish_date > a.plan_finish_date
           AND YEAR(plan_finish_date) = YEAR(SYSDATE())
           AND a.milestone_name = '����') b
UNION ALL
-- ������Ŀ����ǰ������     
SELECT a.z_year AS YEAR
      ,'��ǰ������' AS TYPE
      ,b.tq_xm / a.all_xm AS SUM -- ��ǰ������
      ,SYSDATE() etl_time
  FROM (SELECT YEAR(plan_finish_date) AS z_year
              ,COUNT(DISTINCT construct_project_id) all_xm
          FROM construct_milestone
         WHERE YEAR(plan_finish_date) = YEAR(SYSDATE())
         GROUP BY YEAR(plan_finish_date)) a
      ,(SELECT COUNT(DISTINCT construct_project_id) tq_xm
          FROM construct_milestone a
         WHERE a.actual_finish_date > a.plan_finish_date
           AND YEAR(plan_finish_date) = YEAR(SYSDATE())
           AND a.milestone_name = '��Ŀ����') b;
                     
                  
     --�����ۺ���Ŀ�������

      SELECT a.id
            , --���
             a.project_sku projcode
            , --��Ŀ
             a.project_name projname
            , --��Ŀ��
             SUM(a.out_amount) expense
            , --����
             SYSDATE etl_time
        FROM dw_budget_project a
       GROUP BY a.id, a.project_sku, a.project_name;
       
     --�����ۺ���Ŀ���˹�ʱ ���վ��˹�ʱ    *����ʱ�䲻ȷ��*
  
 
      SELECT a.id
            , --��Ŀid
             to_char(a.updated_at, 'yyyymmdd') -
             to_char(a.project_date, 'yyyymmdd') DAY
            , --����=����ʱ��-����ʱ�䣨����״̬�ǽ�������ݸ���ʱ�䣩             
             SUM(b.work_hour) hour
            , --��Ŀ�˹�ʱ
             SUM(b.work_hour) /
             (to_char(a.updated_at, 'yyyymmdd') -
              to_char(a.project_date, 'yyyymmdd')) hour_avg
            , --�վ��˹�ʱ
             SYSDATE etl_time
        FROM dw_construct_project_temp a
        JOIN dw_daily_work_temp b ON a.id = b.project_id
      --����join dw_NEW_m_daily_work b on a.PROJECT_NAME = b.PRO_NO
       WHERE a.project_state = '����'
       GROUP BY a.id
               ,to_char(a.updated_at, 'yyyymmdd') -
                to_char(a.project_date, 'yyyymmdd');
       
      
      
  --�ۺ�400����
  
SELECT YEAR(a.questioncreatetime) YEAR
      ,a.id
      ,a.questionxxms NAME
      ,CASE
         WHEN c.id IN ('101', '102') THEN
          1
         ELSE
          0
       END isresolved -- 101��������ɣ�102���������
      ,CASE
         WHEN b.VALUE IS NULL THEN
          '����'
         ELSE
          b.VALUE
       END TYPE
      ,c.datavalue status
      ,'' ts_type
      ,a.productnames product
      ,SYSDATE() etl_time
  FROM m_question a
  LEFT JOIN (SELECT *
               FROM m_question_classify b
              WHERE b.description = '�������') b ON a.questiontype =
                                                     b.VALUE
  LEFT JOIN m_question_basicdata c ON a.questionisover = c.id
 WHERE a.questioncreatetime <= SYSDATE()
   AND YEAR(a.questioncreatetime) = YEAR(SYSDATE());
              
    --����ƽ����Ӧʱ��
   -- ����ƽ����Ӧʱ����ƽ�����ʱ��
SELECT b.YEAR
      ,CASE
         WHEN b.COUNT = 0 OR b.COUNT IS NULL THEN
          0
         ELSE
          SUM(a.TIME) / SUM(b.COUNT)
       END response_avgmin -- ƽ����Ӧʱ��  
      ,CASE
         WHEN b.COUNT = 0 OR b.COUNT IS NULL THEN
          0
         ELSE
          SUM(c.TIME) / SUM(d.COUNT)
       END solution_avgmin -- ƽ�����ʱ��
      ,SYSDATE() etl_time
  FROM (SELECT SUM(timestampdiff(minute, questioncreatetime, cnyhtime)) TIME
          FROM m_question a
         WHERE a.questioncreatetime <= SYSDATE()
           AND a.questioncreatetime <> ''
           AND a.cnyhtime <> ''
           AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())) a -- ����Ӧʱ��
      ,(SELECT YEAR(a.questioncreatetime) YEAR, COUNT(a.id) COUNT
          FROM m_question a
         WHERE a.questioncreatetime <= SYSDATE()
           AND a.cnyhtime <> ''
           AND a.questioncreatetime <> ''
           AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())
         GROUP BY YEAR(a.questioncreatetime)) b -- ��Ӧʱ����������
      ,(SELECT YEAR(a.questioncreatetime) YEAR, COUNT(a.id) COUNT
          FROM m_question a
         WHERE a.questioncreatetime <= SYSDATE()
           AND a.sjtime <> ''
           AND a.questioncreatetime <> ''
           AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())
         GROUP BY YEAR(a.questioncreatetime)) d -- ���ʱ����������
      ,(SELECT SUM(timestampdiff(minute, questioncreatetime, sjtime)) TIME
         FROM m_question a
        WHERE a.questioncreatetime <= SYSDATE()
          AND a.questioncreatetime <> ''
          AND a.sjtime <> ''
          AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())) c -- �ܽ��ʱ��
 GROUP BY b.YEAR;

SELECT * FROM m_question_classify b;
SELECT DISTINCT a.questiontype, b.*
  FROM m_question a
  LEFT JOIN m_question_classify b ON a.questiontype = b. VALUE
 WHERE YEAR(a.questioncreatetime) = YEAR(SYSDATE());
      
    --�ͻ�����
    SELECT *
      FROM dw_pas_fh_customer_review
            SELECT -- a.id,--���
             a.questionisover department
            , --����
             b.datavalue status
            , --����״̬
             SUM(questionmydfkbm) feedback_score
            , --����������Ӧ��ʱ�Է���
             SUM(questionmydjjbm) solve_score
            , --���������Ӧ��ʱ�Է���
             SUM(questionmydfwtd) service_score
            , --����̬�ȷ���
             SUM(questionmydjfzl) pay_score
            , --֧����������
             SYSDATE etl_time
              FROM dw_m_question a
              LEFT JOIN dw_m_question_basicdata b ON a.questionisover = b.id
             WHERE b.id IN ('102', '101')
             GROUP BY --a.id, 
                      a.questionisover
                     ,b.datavalue;