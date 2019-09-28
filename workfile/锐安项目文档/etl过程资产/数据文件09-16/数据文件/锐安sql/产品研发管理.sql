--��Ʒ�з�����
--�з���Ŀ����
select * from  DW_PD_PROJECT_ANALYSE ;
select a.id, --���
       a.PROJECT_SERIAL_NUM projcode, --��Ŀ���
       CH_VERSION, --��������
       FIRST_DEPT_ID,
       FIRST_DEPT, -- һ������
       SECOND_DEPT_ID,
       SECOND_DEPT, --��������
       start_time, --�ƻ�����ʱ��
       finished_time, --�ƻ�����ʱ��
       reality_start_time, --ʵ������ʱ��
       reality_finished_time , --ʵ�ʽ���ʱ��
       planReleaseTime plan_publish_time, --�ƻ�����ʱ��
       realReleaseTime act_publish_date, --ʵ�ʷ���ʱ��
       sum(scale_project) planhour, --�ƻ�������
       sum(b.workhour) workhour, --ʵ�ʹ�����
       sum(budget)budget, --Ԥ�����
       sum(c.spendsum) + SUM(D.FY_SUM) act_expense, --ʵ�ʷ���
       sysdate etl_time
  from dw_t_pro_setup_apply a
  left join (select projectid, sum(t.workhour) workhour
               from dw_m_daily_work t, dw_m_daily m
              where t.dailyid = m.id
                and m.state = 3
              group by projectid) b --ʵ�ʹ�����
on a.item_name = b.projectid
  left join (select s.ysbianhao, sum(a.spendsum) spendsum
               from dw_m_daily m, dw_m_daily_spend s, dw_m_assort_spend a
              where m.id = s.dailyid
                and s.id = a.spendid
                and m.state >= 2
                and s.flag != -2
              group by s.ysbianhao) c --�ճ��໨��
on a.item_name = c.ysbianhao
  LEFT JOIN (select J.XMBH, sum(j.price * j.count) FY_SUM
               from dw_wf_purchasecost p, dw_wf_purchase_jh j
              where p.id = j.purchaseCostApplyid
                and p.nonce_node_name not in
                    ('����', '�ݸ�', '�ݸ壨���أ�')
                and p.payProjectFee = 0
                and j.kmfpType = 'P'
                and j.fyTypeDescription not in ('����-�ɻ�Ʊ')
              group by J.XMBH) D --�����໨��
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