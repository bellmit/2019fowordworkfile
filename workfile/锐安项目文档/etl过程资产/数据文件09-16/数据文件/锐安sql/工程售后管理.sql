--工程售后管理：
  --工程售后项目分析
 -- 当年总项目数
SELECT YEAR(SYSDATE()) AS z_year
      ,'总项目数' AS TYPE
      ,COUNT(id) num
      ,SYSDATE() etl_time
  FROM construct_project a
 WHERE YEAR(a.plan_finish_date) = YEAR(SYSDATE())

UNION ALL

-- 当年完工项目数
SELECT YEAR(SYSDATE()) AS z_year
      ,'完工项目数' AS TYPE
      ,COUNT(id)
      ,SYSDATE() etl_time
  FROM construct_project a
 WHERE YEAR(a.plan_finish_date) = YEAR(SYSDATE())
   AND EXISTS (SELECT *
          FROM construct_milestone b
         WHERE b.milestone_name = '完工'
           AND a.id = b.construct_project_id)

UNION ALL

-- 当年验收项目数
SELECT YEAR(SYSDATE()) AS z_year
      ,'验收项目数' AS TYPE
      ,COUNT(id)
      ,SYSDATE() etl_time
  FROM check_project a
 WHERE YEAR(a.plan_finish_date) = YEAR(SYSDATE())
   AND EXISTS (SELECT *
          FROM check_milestone b
         WHERE b.milestone_name = '验收'
           AND a.id = b.check_project_id)

UNION ALL
-- 工程项目的按时完成率
SELECT a.z_year AS YEAR
      ,'按时完成率' AS TYPE
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
           AND a.milestone_name = '完工') b

UNION ALL
-- 验收项目的按时完成率
SELECT a.z_year AS YEAR
      ,'验收完成率' AS TYPE
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
           AND a.milestone_name = '终验') b
UNION ALL
-- 工程项目的提前启动率     
SELECT a.z_year AS YEAR
      ,'提前启动率' AS TYPE
      ,b.tq_xm / a.all_xm AS SUM -- 提前启动率
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
           AND a.milestone_name = '项目启动') b;
                     
                  
     --工程售后项目费用情况

      SELECT a.id
            , --编号
             a.project_sku projcode
            , --项目
             a.project_name projname
            , --项目名
             SUM(a.out_amount) expense
            , --费用
             SYSDATE etl_time
        FROM dw_budget_project a
       GROUP BY a.id, a.project_sku, a.project_name;
       
     --工程售后项目总人工时 、日均人工时    *挂起时间不确定*
  
 
      SELECT a.id
            , --项目id
             to_char(a.updated_at, 'yyyymmdd') -
             to_char(a.project_date, 'yyyymmdd') DAY
            , --日期=立项时间-结项时间（立项状态是结项的数据更新时间）             
             SUM(b.work_hour) hour
            , --项目人工时
             SUM(b.work_hour) /
             (to_char(a.updated_at, 'yyyymmdd') -
              to_char(a.project_date, 'yyyymmdd')) hour_avg
            , --日均人工时
             SYSDATE etl_time
        FROM dw_construct_project_temp a
        JOIN dw_daily_work_temp b ON a.id = b.project_id
      --或者join dw_NEW_m_daily_work b on a.PROJECT_NAME = b.PRO_NO
       WHERE a.project_state = '结项'
       GROUP BY a.id
               ,to_char(a.updated_at, 'yyyymmdd') -
                to_char(a.project_date, 'yyyymmdd');
       
      
      
  --售后400分析
  
SELECT YEAR(a.questioncreatetime) YEAR
      ,a.id
      ,a.questionxxms NAME
      ,CASE
         WHEN c.id IN ('101', '102') THEN
          1
         ELSE
          0
       END isresolved -- 101按期已完成，102延期已完成
      ,CASE
         WHEN b.VALUE IS NULL THEN
          '其他'
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
              WHERE b.description = '问题分类') b ON a.questiontype =
                                                     b.VALUE
  LEFT JOIN m_question_basicdata c ON a.questionisover = c.id
 WHERE a.questioncreatetime <= SYSDATE()
   AND YEAR(a.questioncreatetime) = YEAR(SYSDATE());
              
    --计算平均响应时长
   -- 当年平均响应时长、平均解决时长
SELECT b.YEAR
      ,CASE
         WHEN b.COUNT = 0 OR b.COUNT IS NULL THEN
          0
         ELSE
          SUM(a.TIME) / SUM(b.COUNT)
       END response_avgmin -- 平均响应时长  
      ,CASE
         WHEN b.COUNT = 0 OR b.COUNT IS NULL THEN
          0
         ELSE
          SUM(c.TIME) / SUM(d.COUNT)
       END solution_avgmin -- 平均解决时长
      ,SYSDATE() etl_time
  FROM (SELECT SUM(timestampdiff(minute, questioncreatetime, cnyhtime)) TIME
          FROM m_question a
         WHERE a.questioncreatetime <= SYSDATE()
           AND a.questioncreatetime <> ''
           AND a.cnyhtime <> ''
           AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())) a -- 总响应时长
      ,(SELECT YEAR(a.questioncreatetime) YEAR, COUNT(a.id) COUNT
          FROM m_question a
         WHERE a.questioncreatetime <= SYSDATE()
           AND a.cnyhtime <> ''
           AND a.questioncreatetime <> ''
           AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())
         GROUP BY YEAR(a.questioncreatetime)) b -- 响应时长问题总数
      ,(SELECT YEAR(a.questioncreatetime) YEAR, COUNT(a.id) COUNT
          FROM m_question a
         WHERE a.questioncreatetime <= SYSDATE()
           AND a.sjtime <> ''
           AND a.questioncreatetime <> ''
           AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())
         GROUP BY YEAR(a.questioncreatetime)) d -- 解决时长问题总数
      ,(SELECT SUM(timestampdiff(minute, questioncreatetime, sjtime)) TIME
         FROM m_question a
        WHERE a.questioncreatetime <= SYSDATE()
          AND a.questioncreatetime <> ''
          AND a.sjtime <> ''
          AND YEAR(a.questioncreatetime) = YEAR(SYSDATE())) c -- 总解决时长
 GROUP BY b.YEAR;

SELECT * FROM m_question_classify b;
SELECT DISTINCT a.questiontype, b.*
  FROM m_question a
  LEFT JOIN m_question_classify b ON a.questiontype = b. VALUE
 WHERE YEAR(a.questioncreatetime) = YEAR(SYSDATE());
      
    --客户评价
    SELECT *
      FROM dw_pas_fh_customer_review
            SELECT -- a.id,--编号
             a.questionisover department
            , --部门
             b.datavalue status
            , --问题状态
             SUM(questionmydfkbm) feedback_score
            , --反馈部门响应及时性分数
             SUM(questionmydjjbm) solve_score
            , --解决部门响应及时性分数
             SUM(questionmydfwtd) service_score
            , --服务态度分数
             SUM(questionmydjfzl) pay_score
            , --支付质量分数
             SYSDATE etl_time
              FROM dw_m_question a
              LEFT JOIN dw_m_question_basicdata b ON a.questionisover = b.id
             WHERE b.id IN ('102', '101')
             GROUP BY --a.id, 
                      a.questionisover
                     ,b.datavalue;