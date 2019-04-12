create or replace package tp_cash_flow is

  procedure etl_tp_cash_flow;

end tp_cash_flow;
/
create or replace package body tp_cash_flow is

  procedure etl_tp_cash_flow is
    --������������
    query_date date;
  
  begin
    --Ϊ�������ڱ�����ֵ
    select ma_data_date
      into query_date
      from etl_control.ctl_general_parameter;
  
    --����֮ǰɾ��������
    delete from ext_layer.ma_tp_cash_flow;
    commit;
  
    insert into ext_layer.ma_tp_cash_flow
    
    --��ծת�ɡ����ɻ�ծ-����
      select to_char(i.equityassetno) account_id, --�˻�
             p.pdate cf_date, --�ֽ�������
             'D00290001' cf_type, --����
             null interest_day_cnt, --��Ϣ����
             sum(nvl(p.mcapital, p.pcapital)) cf_amount, --�ֽ������ ����
             query_date data_date --��������
        from std_layer.t08_equity_assets_info i
        left join std_layer.t05_invest_plan p
          on p.equityassetno = i.equityassetno 
       where nvl(p.mcapital, nvl(p.pcapital, 0)) <> 0
       group by to_char(i.equityassetno), p.pdate
      
      union all
      
      --��ծת�ɡ����ɻ�ծ-����
      select to_char(i.equityassetno) account_id, --�˻�
             p.pdate cf_date, --�ֽ�������
             'D00290003' cf_type, --����ֺ�
             null interest_day_cnt, --��Ϣ����
             sum(nvl(p.mincome, p.pincome)) cf_amount, --�ֽ������ ����
             query_date data_date --��������
        from std_layer.t08_equity_assets_info i
        left join std_layer.t05_invest_plan p
          on p.equityassetno = i.equityassetno 
       where nvl(p.mincome, nvl(p.pincome, 0)) <> 0
       group by to_char(i.equityassetno), p.pdate
      
      union all
      
      --����ծȨ-����
      select t.creditorcontractnum account_id, --�˻�
             p.pdate cf_date, --�ֽ�������
             'D00290001' cf_type, --����
             null interest_day_cnt, --��Ϣ����
             sum(nvl(p.mcapital, p.pcapital)) cf_amount, --�ֽ������ ����
             query_date data_date --��������
        from std_layer.t04_asset_creditorcontract t
        left join std_layer.t05_invest_plan p
          on p.contractid = t.creditorcontractnum
       where nvl(p.mcapital, nvl(p.pcapital, 0)) <> 0
       group by t.creditorcontractnum, p.pdate
      
      union all
      
      --����ծȨ-����
      select t.creditorcontractnum account_id, --�˻�
             p.pdate cf_date, --�ֽ�������
             'D00290003' cf_type, --����ֺ�
             null interest_day_cnt, --��Ϣ����
             sum(nvl(p.mincome, p.pincome)) cf_amount, --�ֽ������ ����
             query_date data_date --��������
        from std_layer.t04_asset_creditorcontract t
        left join std_layer.t05_invest_plan p
          on p.contractid = t.creditorcontractnum
       where nvl(p.mincome, nvl(p.pincome, 0)) <> 0
       group by t.creditorcontractnum, p.pdate
      
      union all
      
      --��ѯҵ��-����
      select f.projectcode account_id, --�˻�
             p.pdate cf_date, --�ֽ�������
             'D00290001' cf_type, --����
             null interest_day_cnt, --��Ϣ����
             sum(nvl(p.mcapital, p.pcapital)) cf_amount, --�ֽ������ ����
             query_date data_date --��������
        from std_layer.t02_project_info f
        left join std_layer.t05_invest_plan p
          on p.projectcode = f.projectcode
       where nvl(p.mcapital, nvl(p.pcapital, 0)) <> 0
       group by f.projectcode, p.pdate
      
      union all
      
      --��ѯҵ��-����
      select f.projectcode account_id, --�˻�
             p.pdate cf_date, --�ֽ�������
             'D00290003' cf_type, --����ֺ�
             null interest_day_cnt, --��Ϣ����
             sum(nvl(p.mincome, p.pincome)) cf_amount, --�ֽ������ ����
             query_date data_date --��������
        from std_layer.t02_project_info f
        left join std_layer.t05_invest_plan p
          on p.projectcode = f.projectcode
       where nvl(p.mincome, nvl(p.pincome, 0)) <> 0
       group by f.projectcode, p.pdate
      
      union all
      
      --�����ծ�������̶�������֤ȯ�����н���ծȯ-����    
      select l.dealno account_id, --�˻�
             s.paydate cf_date, --�ֽ�������
             'D00290001' cf_type, --����
             null interest_day_cnt, --��Ϣ����
             case
               when s.schd_type = 'P' then
                -sum(s.cashflow)
               else
                sum(s.cashflow)
             end cf_amount, --�ֽ������ ����
             query_date data_date --��������    
        from std_layer.t05_security_deal l
        left join std_layer.t05_security_schedule s
          on s.security = l.security
       where nvl(s.cashflow, 0) <> 0
         and s.schd_type <> 'PY' --�ų���Ϣ
       group by l.dealno, s.paydate, s.schd_type
      
      union all
      
      --�����ծ�������̶�������֤ȯ�����н���ծȯ-����
      select l.dealno account_id, --�˻�
             s.paydate cf_date, --�ֽ�������
             'D00290003' cf_type, --����
             null interest_day_cnt, --��Ϣ����
             sum(s.cashflow) cf_amount, --�ֽ������ ����
             query_date data_date --��������    
        from std_layer.t05_security_deal l
        left join std_layer.t05_security_schedule s
          on s.security = l.security
       where nvl(s.cashflow, 0) <> 0
         and s.schd_type = 'PY' --��Ϣ
       group by l.dealno, s.paydate;
    commit;
  end;
end tp_cash_flow;
/
