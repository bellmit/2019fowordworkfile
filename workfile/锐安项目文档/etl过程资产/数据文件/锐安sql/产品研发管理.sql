--产品研发管理
--研发项目分析
select * from  DW_PD_PROJECT_ANALYSE ;
select a.id, --编号
       a.PROJECT_SERIAL_NUM projcode, --项目编号
       CH_VERSION, --中文名称
       FIRST_DEPT_ID,
       FIRST_DEPT, -- 一级部门
       SECOND_DEPT_ID,
       SECOND_DEPT, --二级部门
       start_time, --计划立项时间
       finished_time, --计划结项时间
       reality_start_time, --实际立项时间
       reality_finished_time , --实际结项时间
       planReleaseTime plan_publish_time, --计划发布时间
       realReleaseTime act_publish_date, --实际发布时间
       sum(scale_project) planhour, --计划工作量
       sum(b.workhour) workhour, --实际工作量
       sum(budget)budget, --预算费用
       sum(c.spendsum) + SUM(D.FY_SUM) act_expense, --实际费用
       sysdate etl_time
  from dw_t_pro_setup_apply a
  left join (select projectid, sum(t.workhour) workhour
               from dw_m_daily_work t, dw_m_daily m
              where t.dailyid = m.id
                and m.state = 3
              group by projectid) b --实际工作量
on a.item_name = b.projectid
  left join (select s.ysbianhao, sum(a.spendsum) spendsum
               from dw_m_daily m, dw_m_daily_spend s, dw_m_assort_spend a
              where m.id = s.dailyid
                and s.id = a.spendid
                and m.state >= 2
                and s.flag != -2
              group by s.ysbianhao) c --日常类花销
on a.item_name = c.ysbianhao
  LEFT JOIN (select J.XMBH, sum(j.price * j.count) FY_SUM
               from dw_wf_purchasecost p, dw_wf_purchase_jh j
              where p.id = j.purchaseCostApplyid
                and p.nonce_node_name not in
                    ('作废', '草稿', '草稿（驳回）')
                and p.payProjectFee = 0
                and j.kmfpType = 'P'
                and j.fyTypeDescription not in ('差旅-飞机票')
              group by J.XMBH) D --费用类花销
ON A.PROJECT_SERIAL_NUM = D.XMBH
 group by a.id,
          a.PROJECT_SERIAL_NUM,
          CH_VERSION,
            FIRST_DEPT_ID,
          FIRST_DEPT,
          SECOND_DEPT_ID,
          SECOND_DEPT,
          start_time,
          finished_time,
          reality_start_time,
          reality_finished_time,
          planReleaseTime,
          realReleaseTime;