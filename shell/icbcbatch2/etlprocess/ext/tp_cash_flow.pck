create or replace package tp_cash_flow is

  procedure etl_tp_cash_flow;

end tp_cash_flow;
/
create or replace package body tp_cash_flow is

  procedure etl_tp_cash_flow is
    --定义数据日期
    query_date date;
  
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from etl_control.ctl_general_parameter;
  
    --插入之前删除表数据
    delete from ext_layer.ma_tp_cash_flow;
    commit;
  
    insert into ext_layer.ma_tp_cash_flow
    
    --收债转股、发股还债-本金
      select to_char(i.equityassetno) account_id, --账户
             p.pdate cf_date, --现金流日期
             'D00290001' cf_type, --本金
             null interest_day_cnt, --计息天数
             sum(nvl(p.mcapital, p.pcapital)) cf_amount, --现金流金额 本金
             query_date data_date --数据日期
        from std_layer.t08_equity_assets_info i
        left join std_layer.t05_invest_plan p
          on p.equityassetno = i.equityassetno 
       where nvl(p.mcapital, nvl(p.pcapital, 0)) <> 0
       group by to_char(i.equityassetno), p.pdate
      
      union all
      
      --收债转股、发股还债-收益
      select to_char(i.equityassetno) account_id, --账户
             p.pdate cf_date, --现金流日期
             'D00290003' cf_type, --利润分红
             null interest_day_cnt, --计息天数
             sum(nvl(p.mincome, p.pincome)) cf_amount, --现金流金额 收益
             query_date data_date --数据日期
        from std_layer.t08_equity_assets_info i
        left join std_layer.t05_invest_plan p
          on p.equityassetno = i.equityassetno 
       where nvl(p.mincome, nvl(p.pincome, 0)) <> 0
       group by to_char(i.equityassetno), p.pdate
      
      union all
      
      --重组债权-本金
      select t.creditorcontractnum account_id, --账户
             p.pdate cf_date, --现金流日期
             'D00290001' cf_type, --本金
             null interest_day_cnt, --计息天数
             sum(nvl(p.mcapital, p.pcapital)) cf_amount, --现金流金额 本金
             query_date data_date --数据日期
        from std_layer.t04_asset_creditorcontract t
        left join std_layer.t05_invest_plan p
          on p.contractid = t.creditorcontractnum
       where nvl(p.mcapital, nvl(p.pcapital, 0)) <> 0
       group by t.creditorcontractnum, p.pdate
      
      union all
      
      --重组债权-收益
      select t.creditorcontractnum account_id, --账户
             p.pdate cf_date, --现金流日期
             'D00290003' cf_type, --利润分红
             null interest_day_cnt, --计息天数
             sum(nvl(p.mincome, p.pincome)) cf_amount, --现金流金额 收益
             query_date data_date --数据日期
        from std_layer.t04_asset_creditorcontract t
        left join std_layer.t05_invest_plan p
          on p.contractid = t.creditorcontractnum
       where nvl(p.mincome, nvl(p.pincome, 0)) <> 0
       group by t.creditorcontractnum, p.pdate
      
      union all
      
      --咨询业务-本金
      select f.projectcode account_id, --账户
             p.pdate cf_date, --现金流日期
             'D00290001' cf_type, --本金
             null interest_day_cnt, --计息天数
             sum(nvl(p.mcapital, p.pcapital)) cf_amount, --现金流金额 本金
             query_date data_date --数据日期
        from std_layer.t02_project_info f
        left join std_layer.t05_invest_plan p
          on p.projectcode = f.projectcode
       where nvl(p.mcapital, nvl(p.pcapital, 0)) <> 0
       group by f.projectcode, p.pdate
      
      union all
      
      --咨询业务-收益
      select f.projectcode account_id, --账户
             p.pdate cf_date, --现金流日期
             'D00290003' cf_type, --利润分红
             null interest_day_cnt, --计息天数
             sum(nvl(p.mincome, p.pincome)) cf_amount, --现金流金额 收益
             query_date data_date --数据日期
        from std_layer.t02_project_info f
        left join std_layer.t05_invest_plan p
          on p.projectcode = f.projectcode
       where nvl(p.mincome, nvl(p.pincome, 0)) <> 0
       group by f.projectcode, p.pdate
      
      union all
      
      --购买国债、其他固定收益类证券、发行金融债券-本金    
      select l.dealno account_id, --账户
             s.paydate cf_date, --现金流日期
             'D00290001' cf_type, --本金
             null interest_day_cnt, --计息天数
             case
               when s.schd_type = 'P' then
                -sum(s.cashflow)
               else
                sum(s.cashflow)
             end cf_amount, --现金流金额 本金
             query_date data_date --数据日期    
        from std_layer.t05_security_deal l
        left join std_layer.t05_security_schedule s
          on s.security = l.security
       where nvl(s.cashflow, 0) <> 0
         and s.schd_type <> 'PY' --排除付息
       group by l.dealno, s.paydate, s.schd_type
      
      union all
      
      --购买国债、其他固定收益类证券、发行金融债券-收益
      select l.dealno account_id, --账户
             s.paydate cf_date, --现金流日期
             'D00290003' cf_type, --收益
             null interest_day_cnt, --计息天数
             sum(s.cashflow) cf_amount, --现金流金额 收益
             query_date data_date --数据日期    
        from std_layer.t05_security_deal l
        left join std_layer.t05_security_schedule s
          on s.security = l.security
       where nvl(s.cashflow, 0) <> 0
         and s.schd_type = 'PY' --付息
       group by l.dealno, s.paydate;
    commit;
  end;
end tp_cash_flow;
/
