create or replace package AICS_ETL_PAG1 is

  --收债转股
  procedure DEBT_TO_EQUITY_SWAP;
  procedure REORGANIZATION_OF_CLAIMS;
  procedure ISSUING_SHARE_TO_DEBTS;
  procedure ORIGINAL_CREDITOR_RIGHTS;

  procedure update_log(source_sheet      varchar2,
                       target_sheet      varchar2,
                       query_date        date,
                       success_status    varchar2,
                       exception_message varchar2 default NULL);

end AICS_ETL_PAG1;
/
create or replace package body AICS_ETL_PAG1 is

  --收债转股
  procedure DEBT_TO_EQUITY_SWAP is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('开始导入收债转股的数据');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101011';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       帐号
       FUND_SRC_TYPE, --         筹资通道
       DATA_DATE, --   数据日期
       PROJECT_ID, --       项目号
       PROJECT_NAME, --         项目名称
       ORG_UNIT_ID, --       业务部门号
       COUNTER_PTY_ID, --         交易标的客户号
       COUNTER_PTY_NAME, --           交易标的客户名称
       ASSET_TRANS_PTY_ID, --           资产出售方编号
       ASSET_TRANS_PTY_NAME, --             资产出售方名称
       PRODUCT_ID, --       业务类型号
       PRODUCT_NAME, --         业务类型名称
       ORIGINATION_DATE, --       起息日期
       CUR_PAR_BAL, --   票面金额
       CUR_BOOK_BAL, --     账面金额
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID, --       币种代码
       ORG_TERM, --   业务期限
       ORG_TERM_MULT, --         业务期限单位
       MATURITY_DATE, --     到期日
       INTEREST_RATE_FLR, --       收益率下限或当前收益率
       INTEREST_RATE_CEIL, --       收益率上限
       ACCRUAL_BASIS_Y, --         年收益率折算系数
       ACCRUAL_BASIS_M, --         月收益计算天数
       ADJUST_TYPE, --       收益率调整方式
       FIRST_ADJ_DATE, --     首次收益率调整日
       ADJUST_TERM, --   收益率调整周期
       ADJUST_TERM_MULT, --           收益率调整周期单位
       AMORTIZATION_TYPE, --           资金回收方式
       PAYMENT_AMOUNT, --     还款金额
       FIRST_PMT_DATE, --     约定收益回收日
       PMT_TERM, --   收益回收周期
       PMT_TERM_MULT, --         收益回收周期单位
       BONUS_YTD, --   年初至今累计投资收益-股利分红
       ADVISER_FEE_YTD, --     年初至今累计顾问费业务收入
       ADMIN_FEE_YTD, --     年初至今累计管理费业务收支
       INTEREST_YTD, --     年初至今累计利息收支
       INVEST_GAIN_YTD, --     年初至今累计投资收益-退出溢价
       TAX_YTD, -- 年初至今累计销项税额
       BONUS_MTD, --   月初至今累计投资收益-股利分红
       ADVISER_FEE_MTD, --     月初至今累计顾问费业务收入
       ADMIN_FEE_MTD, --     月初至今累计管理费业务收支
       INTEREST_MTD, --     月初至今累计利息收支
       INVEST_GAIN_MTD, --     月初至今累计投资收益-退出溢价
       TAX_MTD, -- 月初至今累计销项税额
       DEPR_RESERVE_YTD, --       减值准备金
       MKT_VALUE_YTD, --     公允价值变动损益
       EXCHANGE_GAIN_YTD, --       汇兑损益
       OTHER_GAIN_YTD, --     其它业务收支
       PRINCIPAL_ACCT_ID, --           本金科目号
       INTEREST_ACCT_ID, --           利息收支科目号
       INVEST_GAIN_ACCT_ID, --           投资收益科目号
       BONUS_ACCT_ID, --         股利分红科目号
       ADVISER_FEE_ACCT_ID, --           顾问费收入科目号
       ADMIN_FEE_ACCT_ID, --           管理费收支科目号
       TAX_ACCT_ID, --       进项/销项税科目号
       DEPR_RESERVE_ACCT_ID, --             减值准备金科目号
       MKT_VALUE_ACCT_ID, --           公允价值变动损益科目号
       EXCHANGE_GAIN_ACCT_ID --              汇兑损益科目号
       )
    
      select ACCOUNT_ID,
             FUND_SRC_TYPE,
             DATA_DATE,
             PROJECT_ID,
             PROJECT_NAME,
             ORG_UNIT_ID,
             COUNTER_PTY_ID,
             COUNTER_PTY_NAME,
             ASSET_TRANS_PTY_ID,
             ASSET_TRANS_PTY_NAME,
             '101011',
             PRODUCT_NAME,
             ORIGINATION_DATE,
             CUR_PAR_BAL,
             CUR_BOOK_BAL,
             ACCU_BAL_MTD,
             ACCU_BAL_MTD_DAY,
             AVG_BAL_YTD,
             ACCU_BAL_YTD_DAY,
             CURRENCY_ID,
             ORG_TERM,
             ORG_TERM_MULT,
             MATURITY_DATE,
             INTEREST_RATE_FLR,
             INTEREST_RATE_CEIL,
             ACCRUAL_BASIS_Y,
             ACCRUAL_BASIS_M,
             ADJUST_TYPE,
             FIRST_ADJ_DATE,
             ADJUST_TERM,
             ADJUST_TERM_MULT,
             AMORTIZATION_TYPE,
             PAYMENT_AMOUNT,
             FIRST_PMT_DATE,
             PMT_TERM,
             PMT_TERM_MULT,
             BONUS_YTD,
             ADVISER_FEE_YTD,
             ADMIN_FEE_YTD,
             INTEREST_YTD,
             INVEST_GAIN_YTD,
             TAX_YTD,
             BONUS_MTD,
             ADVISER_FEE_MTD,
             ADMIN_FEE_MTD,
             INTEREST_MTD,
             INVEST_GAIN_MTD,
             TAX_MTD,
             DEPR_RESERVE_YTD,
             MKT_VALUE_YTD,
             EXCHANGE_GAIN_YTD,
             OTHER_GAIN_YTD,
             PRINCIPAL_ACCT_ID,
             INTEREST_ACCT_ID,
             INVEST_GAIN_ACCT_ID,
             BONUS_ACCT_ID,
             ADVISER_FEE_ACCT_ID,
             ADMIN_FEE_ACCT_ID,
             TAX_ACCT_ID,
             DEPR_RESERVE_ACCT_ID,
             MKT_VALUE_ACCT_ID,
             EXCHANGE_GAIN_ACCT_ID
      
        from (select null ACCOUNT_ID,
                     pi.extfield10 FUND_SRC_TYPE,
                     query_date DATA_DATE,
                     pi.projectcode PROJECT_ID,
                     pi.projectname PROJECT_NAME,
                     pi.dptid ORG_UNIT_ID,
                     eaiall.enterprise COUNTER_PTY_ID,
                     null COUNTER_PTY_NAME,
                     pi.assetseller ASSET_TRANS_PTY_ID,
                     null ASSET_TRANS_PTY_NAME,
                     ic.investplantype PRODUCT_ID,
                     '收债转股' PRODUCT_NAME,
                     eai.realinvestdate ORIGINATION_DATE,
                     ic.contractbalance CUR_PAR_BAL,
                     ic.transfermoney CUR_BOOK_BAL,
                     null ACCU_BAL_MTD,
                     null ACCU_BAL_MTD_DAY,
                     null AVG_BAL_YTD,
                     null ACCU_BAL_YTD_DAY,
                     pi.moneytype CURRENCY_ID,
                     pi.timelimit ORG_TERM,
                     '月' ORG_TERM_MULT,
                     null MATURITY_DATE,
                     eaiall.predictyield INTEREST_RATE_FLR,
                     eaiall.predictyieldlimit INTEREST_RATE_CEIL,
                     null ACCRUAL_BASIS_Y,
                     null ACCRUAL_BASIS_M,
                     null ADJUST_TYPE,
                     null FIRST_ADJ_DATE,
                     null ADJUST_TERM,
                     null ADJUST_TERM_MULT,
                     null AMORTIZATION_TYPE,
                     null PAYMENT_AMOUNT,
                     null FIRST_PMT_DATE,
                     null PMT_TERM,
                     null PMT_TERM_MULT,
                     rc1.amount BONUS_YTD,
                     rc2.amount ADVISER_FEE_YTD,
                     null ADMIN_FEE_YTD,
                     null INTEREST_YTD,
                     null INVEST_GAIN_YTD,
                     null TAX_YTD,
                     null BONUS_MTD,
                     null ADVISER_FEE_MTD,
                     null ADMIN_FEE_MTD,
                     null INTEREST_MTD,
                     null INVEST_GAIN_MTD,
                     null TAX_MTD,
                     null DEPR_RESERVE_YTD,
                     null MKT_VALUE_YTD,
                     null EXCHANGE_GAIN_YTD,
                     null OTHER_GAIN_YTD,
                     null PRINCIPAL_ACCT_ID,
                     null INTEREST_ACCT_ID,
                     null INVEST_GAIN_ACCT_ID,
                     null BONUS_ACCT_ID,
                     null ADVISER_FEE_ACCT_ID,
                     null ADMIN_FEE_ACCT_ID,
                     null TAX_ACCT_ID,
                     null DEPR_RESERVE_ACCT_ID,
                     null MKT_VALUE_ACCT_ID,
                     null EXCHANGE_GAIN_ACCT_ID
                from std_layer.t02_project_info pi
                left join (select *
                            from std_layer.t04_invest_contract c
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) ic
                  on pi.projectcode = ic.projectcode
                left join (select eai.projectcode,
                                 eai.assetholder,
                                 eai.enterprise,
                                 eai.realinvestdate
                            from (select i.projectcode,
                                         i.assetholder,
                                         i.enterprise,
                                         i.realinvestdate,
                                         row_number() over(partition by i.projectcode, i.assetholder, i.enterprise order by i.realinvestdate) oradernum
                                    from std_layer.t08_equity_assets_info i
                                   where to_char(i.start_date, 'yyyymmdd') <=
                                         to_char(query_date, 'yyyymmdd')
                                     and to_char(i.end_date, 'yyyymmdd') >
                                         to_char(query_date, 'yyyymmdd')) eai
                           where eai.oradernum = 1) eai
                  on eai.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t08_equity_assets_info i
                           where to_char(i.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(i.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) eaiall
                  on eaiall.projectcode = pi.projectcode
                 and eai.assetholder = eaiall.assetholder
                 and eai.enterprise = eaiall.enterprise
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '20041股权分红') rc1
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '22111服务费及佣金') rc2
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '收债转股' --?文档标识为收债转股 ，目前未知
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result
       where result.PRODUCT_ID = '转股'; -- ?原数据进行分类的值
    --插入日志表中数据
    update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --插入日志表中数据
      update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end DEBT_TO_EQUITY_SWAP;

  --重组债权
  procedure REORGANIZATION_OF_CLAIMS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('开始导入重组债权的数据');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101013';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       帐号
       FUND_SRC_TYPE, --         筹资通道
       DATA_DATE, --   数据日期
       PROJECT_ID, --       项目号
       PROJECT_NAME, --         项目名称
       ORG_UNIT_ID, --       业务部门号
       COUNTER_PTY_ID, --         交易标的客户号
       COUNTER_PTY_NAME, --           交易标的客户名称
       ASSET_TRANS_PTY_ID, --           资产出售方编号
       ASSET_TRANS_PTY_NAME, --             资产出售方名称
       PRODUCT_ID, --       业务类型号
       PRODUCT_NAME, --         业务类型名称
       ORIGINATION_DATE, --       起息日期
       CUR_PAR_BAL, --   票面金额
       CUR_BOOK_BAL, --     账面金额
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID, --       币种代码
       ORG_TERM, --   业务期限
       ORG_TERM_MULT, --         业务期限单位
       MATURITY_DATE, --     到期日
       INTEREST_RATE_FLR, --       收益率下限或当前收益率
       INTEREST_RATE_CEIL, --       收益率上限
       ACCRUAL_BASIS_Y, --         年收益率折算系数
       ACCRUAL_BASIS_M, --         月收益计算天数
       ADJUST_TYPE, --       收益率调整方式
       FIRST_ADJ_DATE, --     首次收益率调整日
       ADJUST_TERM, --   收益率调整周期
       ADJUST_TERM_MULT, --           收益率调整周期单位
       AMORTIZATION_TYPE, --           资金回收方式
       PAYMENT_AMOUNT, --     还款金额
       FIRST_PMT_DATE, --     约定收益回收日
       PMT_TERM, --   收益回收周期
       PMT_TERM_MULT, --         收益回收周期单位
       BONUS_YTD, --   年初至今累计投资收益-股利分红
       ADVISER_FEE_YTD, --     年初至今累计顾问费业务收入
       ADMIN_FEE_YTD, --     年初至今累计管理费业务收支
       INTEREST_YTD, --     年初至今累计利息收支
       INVEST_GAIN_YTD, --     年初至今累计投资收益-退出溢价
       TAX_YTD, -- 年初至今累计销项税额
       BONUS_MTD, --   月初至今累计投资收益-股利分红
       ADVISER_FEE_MTD, --     月初至今累计顾问费业务收入
       ADMIN_FEE_MTD, --     月初至今累计管理费业务收支
       INTEREST_MTD, --     月初至今累计利息收支
       INVEST_GAIN_MTD, --     月初至今累计投资收益-退出溢价
       TAX_MTD, -- 月初至今累计销项税额
       DEPR_RESERVE_YTD, --       减值准备金
       MKT_VALUE_YTD, --     公允价值变动损益
       EXCHANGE_GAIN_YTD, --       汇兑损益
       OTHER_GAIN_YTD, --     其它业务收支
       PRINCIPAL_ACCT_ID, --           本金科目号
       INTEREST_ACCT_ID, --           利息收支科目号
       INVEST_GAIN_ACCT_ID, --           投资收益科目号
       BONUS_ACCT_ID, --         股利分红科目号
       ADVISER_FEE_ACCT_ID, --           顾问费收入科目号
       ADMIN_FEE_ACCT_ID, --           管理费收支科目号
       TAX_ACCT_ID, --       进项/销项税科目号
       DEPR_RESERVE_ACCT_ID, --             减值准备金科目号
       MKT_VALUE_ACCT_ID, --           公允价值变动损益科目号
       EXCHANGE_GAIN_ACCT_ID --              汇兑损益科目号
       )
    
      select ACCOUNT_ID,
             FUND_SRC_TYPE,
             DATA_DATE,
             PROJECT_ID,
             PROJECT_NAME,
             ORG_UNIT_ID,
             COUNTER_PTY_ID,
             COUNTER_PTY_NAME,
             ASSET_TRANS_PTY_ID,
             ASSET_TRANS_PTY_NAME,
             '101013',
             PRODUCT_NAME,
             ORIGINATION_DATE,
             CUR_PAR_BAL,
             CUR_BOOK_BAL,
             ACCU_BAL_MTD,
             ACCU_BAL_MTD_DAY,
             AVG_BAL_YTD,
             ACCU_BAL_YTD_DAY,
             CURRENCY_ID,
             ORG_TERM,
             ORG_TERM_MULT,
             MATURITY_DATE,
             INTEREST_RATE_FLR,
             INTEREST_RATE_CEIL,
             ACCRUAL_BASIS_Y,
             ACCRUAL_BASIS_M,
             ADJUST_TYPE,
             FIRST_ADJ_DATE,
             ADJUST_TERM,
             ADJUST_TERM_MULT,
             AMORTIZATION_TYPE,
             PAYMENT_AMOUNT,
             FIRST_PMT_DATE,
             PMT_TERM,
             PMT_TERM_MULT,
             BONUS_YTD,
             ADVISER_FEE_YTD,
             ADMIN_FEE_YTD,
             INTEREST_YTD,
             INVEST_GAIN_YTD,
             TAX_YTD,
             BONUS_MTD,
             ADVISER_FEE_MTD,
             ADMIN_FEE_MTD,
             INTEREST_MTD,
             INVEST_GAIN_MTD,
             TAX_MTD,
             DEPR_RESERVE_YTD,
             MKT_VALUE_YTD,
             EXCHANGE_GAIN_YTD,
             OTHER_GAIN_YTD,
             PRINCIPAL_ACCT_ID,
             INTEREST_ACCT_ID,
             INVEST_GAIN_ACCT_ID,
             BONUS_ACCT_ID,
             ADVISER_FEE_ACCT_ID,
             ADMIN_FEE_ACCT_ID,
             TAX_ACCT_ID,
             DEPR_RESERVE_ACCT_ID,
             MKT_VALUE_ACCT_ID,
             EXCHANGE_GAIN_ACCT_ID
      
        from (select null ACCOUNT_ID,
                     pi.extfield10 FUND_SRC_TYPE,
                     query_date DATA_DATE,
                     pi.projectcode PROJECT_ID,
                     pi.projectname PROJECT_NAME,
                     pi.dptid ORG_UNIT_ID,
                     ccdate.loanaccountcode COUNTER_PTY_ID, 
                     null COUNTER_PTY_NAME,
                     pi.assetseller ASSET_TRANS_PTY_ID,
                     null ASSET_TRANS_PTY_NAME,
                     ic.investplantype PRODUCT_ID,
                     '重组债权' PRODUCT_NAME,
                     ccdate.contractstartdate ORIGINATION_DATE, 
                     cc.corpusamount+cc.interest CUR_PAR_BAL, 
                     null CUR_BOOK_BAL, --? 账面金额待定
                     null ACCU_BAL_MTD,
                     null ACCU_BAL_MTD_DAY,
                     null AVG_BAL_YTD,
                     null ACCU_BAL_YTD_DAY,
                     pi.moneytype CURRENCY_ID,
                     null ORG_TERM, 
                     null ORG_TERM_MULT, 
                     ccdate.contractenddate MATURITY_DATE, 
                     ir.rate INTEREST_RATE_FLR,
                     null INTEREST_RATE_CEIL,
                     ir.calccycle ACCRUAL_BASIS_Y,                 
                     ir.calccycle ACCRUAL_BASIS_M,                 
                     ir.ratetype ADJUST_TYPE,                      
                     null FIRST_ADJ_DATE,       --? 待定ir列       
                     ir.settlefreq ADJUST_TERM,                    
                     ir.settlefreq ADJUST_TERM_MULT,               
                     null AMORTIZATION_TYPE,   --? 待定            
                     null PAYMENT_AMOUNT,       --? 待定           
                     null FIRST_PMT_DATE,      --? 待定ir列        
                     ir.settlefreq PMT_TERM,                       
                     ir.settlefreq PMT_TERM_MULT,                  
                     rc1.amount BONUS_YTD,                         
                     rc2.amount ADVISER_FEE_YTD,                   
                     null ADMIN_FEE_YTD,                           
                     null INTEREST_YTD,                            
                     null INVEST_GAIN_YTD,                         
                     null TAX_YTD,                                 
                     null BONUS_MTD,                               
                     null ADVISER_FEE_MTD,                         
                     null ADMIN_FEE_MTD,                           
                     null INTEREST_MTD,                            
                     null INVEST_GAIN_MTD,                         
                     null TAX_MTD,                                 
                     null DEPR_RESERVE_YTD,                        
                     null MKT_VALUE_YTD,                           
                     null EXCHANGE_GAIN_YTD,                       
                     null OTHER_GAIN_YTD,                          
                     null PRINCIPAL_ACCT_ID,                       
                     null INTEREST_ACCT_ID,                        
                     null INVEST_GAIN_ACCT_ID,                     
                     null BONUS_ACCT_ID,                           
                     null ADVISER_FEE_ACCT_ID,                     
                     null ADMIN_FEE_ACCT_ID,                       
                     null TAX_ACCT_ID,                             
                     null DEPR_RESERVE_ACCT_ID,                    
                     null MKT_VALUE_ACCT_ID,                       
                     null EXCHANGE_GAIN_ACCT_ID                    
                from std_layer.t02_project_info pi
                left join (select *
                            from std_layer.t04_invest_contract c
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) ic
                  on pi.projectcode = ic.projectcode
                left join (select *
                            from std_layer.t04_asset_creditorcontract c1
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and c1.escrowstatus in ('02','03','04') 
                             and c1.creditorassettype='3'
                             
                             ) cc
                  on cc.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t04_asset_creditorcontract
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) ccdate
                  on ccdate.projectcode = pi.projectcode
                left join (select * from std_layer.t04_invest_rate r  where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                                 ) ir
                                 on ir.contractid= cc.creditorcontractnum
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '?????') rc1      --?年初至今累计利息收支等repay_type的结果
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '?????') rc2      --?年初至今累计投资收益等repay_type的结果
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '收债转股' --?文档标识为收债转股 ，目前未知
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result
       where result.PRODUCT_ID = '重组'; --? 原数据进行分类的值
    --插入日志表中数据
    update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --插入日志表中数据
      update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end REORGANIZATION_OF_CLAIMS;
  
  --发股还债
  procedure ISSUING_SHARE_TO_DEBTS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('开始导入发股还债的数据');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101010';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       帐号
       FUND_SRC_TYPE, --         筹资通道
       DATA_DATE, --   数据日期
       PROJECT_ID, --       项目号
       PROJECT_NAME, --         项目名称
       ORG_UNIT_ID, --       业务部门号
       COUNTER_PTY_ID, --         交易标的客户号
       COUNTER_PTY_NAME, --           交易标的客户名称
       ASSET_TRANS_PTY_ID, --           资产出售方编号
       ASSET_TRANS_PTY_NAME, --             资产出售方名称
       PRODUCT_ID, --       业务类型号
       PRODUCT_NAME, --         业务类型名称
       ORIGINATION_DATE, --       起息日期
       CUR_PAR_BAL, --   票面金额
       CUR_BOOK_BAL, --     账面金额
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID, --       币种代码
       ORG_TERM, --   业务期限
       ORG_TERM_MULT, --         业务期限单位
       MATURITY_DATE, --     到期日
       INTEREST_RATE_FLR, --       收益率下限或当前收益率
       INTEREST_RATE_CEIL, --       收益率上限
       ACCRUAL_BASIS_Y, --         年收益率折算系数
       ACCRUAL_BASIS_M, --         月收益计算天数
       ADJUST_TYPE, --       收益率调整方式
       FIRST_ADJ_DATE, --     首次收益率调整日
       ADJUST_TERM, --   收益率调整周期
       ADJUST_TERM_MULT, --           收益率调整周期单位
       AMORTIZATION_TYPE, --           资金回收方式
       PAYMENT_AMOUNT, --     还款金额
       FIRST_PMT_DATE, --     约定收益回收日
       PMT_TERM, --   收益回收周期
       PMT_TERM_MULT, --         收益回收周期单位
       BONUS_YTD, --   年初至今累计投资收益-股利分红
       ADVISER_FEE_YTD, --     年初至今累计顾问费业务收入
       ADMIN_FEE_YTD, --     年初至今累计管理费业务收支
       INTEREST_YTD, --     年初至今累计利息收支
       INVEST_GAIN_YTD, --     年初至今累计投资收益-退出溢价
       TAX_YTD, -- 年初至今累计销项税额
       BONUS_MTD, --   月初至今累计投资收益-股利分红
       ADVISER_FEE_MTD, --     月初至今累计顾问费业务收入
       ADMIN_FEE_MTD, --     月初至今累计管理费业务收支
       INTEREST_MTD, --     月初至今累计利息收支
       INVEST_GAIN_MTD, --     月初至今累计投资收益-退出溢价
       TAX_MTD, -- 月初至今累计销项税额
       DEPR_RESERVE_YTD, --       减值准备金
       MKT_VALUE_YTD, --     公允价值变动损益
       EXCHANGE_GAIN_YTD, --       汇兑损益
       OTHER_GAIN_YTD, --     其它业务收支
       PRINCIPAL_ACCT_ID, --           本金科目号
       INTEREST_ACCT_ID, --           利息收支科目号
       INVEST_GAIN_ACCT_ID, --           投资收益科目号
       BONUS_ACCT_ID, --         股利分红科目号
       ADVISER_FEE_ACCT_ID, --           顾问费收入科目号
       ADMIN_FEE_ACCT_ID, --           管理费收支科目号
       TAX_ACCT_ID, --       进项/销项税科目号
       DEPR_RESERVE_ACCT_ID, --             减值准备金科目号
       MKT_VALUE_ACCT_ID, --           公允价值变动损益科目号
       EXCHANGE_GAIN_ACCT_ID --              汇兑损益科目号
       )
    
      select ACCOUNT_ID,
             FUND_SRC_TYPE,
             DATA_DATE,
             PROJECT_ID,
             PROJECT_NAME,
             ORG_UNIT_ID,
             COUNTER_PTY_ID,
             COUNTER_PTY_NAME,
             ASSET_TRANS_PTY_ID,
             ASSET_TRANS_PTY_NAME,
             '101010',
             PRODUCT_NAME,
             ORIGINATION_DATE,
             CUR_PAR_BAL,
             CUR_BOOK_BAL,
             ACCU_BAL_MTD,
             ACCU_BAL_MTD_DAY,
             AVG_BAL_YTD,
             ACCU_BAL_YTD_DAY,
             CURRENCY_ID,
             ORG_TERM,
             ORG_TERM_MULT,
             MATURITY_DATE,
             INTEREST_RATE_FLR,
             INTEREST_RATE_CEIL,
             ACCRUAL_BASIS_Y,
             ACCRUAL_BASIS_M,
             ADJUST_TYPE,
             FIRST_ADJ_DATE,
             ADJUST_TERM,
             ADJUST_TERM_MULT,
             AMORTIZATION_TYPE,
             PAYMENT_AMOUNT,
             FIRST_PMT_DATE,
             PMT_TERM,
             PMT_TERM_MULT,
             BONUS_YTD,
             ADVISER_FEE_YTD,
             ADMIN_FEE_YTD,
             INTEREST_YTD,
             INVEST_GAIN_YTD,
             TAX_YTD,
             BONUS_MTD,
             ADVISER_FEE_MTD,
             ADMIN_FEE_MTD,
             INTEREST_MTD,
             INVEST_GAIN_MTD,
             TAX_MTD,
             DEPR_RESERVE_YTD,
             MKT_VALUE_YTD,
             EXCHANGE_GAIN_YTD,
             OTHER_GAIN_YTD,
             PRINCIPAL_ACCT_ID,
             INTEREST_ACCT_ID,
             INVEST_GAIN_ACCT_ID,
             BONUS_ACCT_ID,
             ADVISER_FEE_ACCT_ID,
             ADMIN_FEE_ACCT_ID,
             TAX_ACCT_ID,
             DEPR_RESERVE_ACCT_ID,
             MKT_VALUE_ACCT_ID,
             EXCHANGE_GAIN_ACCT_ID
      
        from (select null ACCOUNT_ID,
                     pi.extfield10 FUND_SRC_TYPE,
                     query_date DATA_DATE,
                     pi.projectcode PROJECT_ID,
                     pi.projectname PROJECT_NAME,
                     pi.dptid ORG_UNIT_ID,
                     eaiall.enterprise COUNTER_PTY_ID,
                     null COUNTER_PTY_NAME,
                     pi.assetseller ASSET_TRANS_PTY_ID,
                     null ASSET_TRANS_PTY_NAME,
                     pi.projectnature PRODUCT_ID,
                     '发股还债' PRODUCT_NAME,
                     eai.realinvestdate ORIGINATION_DATE,
                     ic.contractbalance CUR_PAR_BAL,
                     ic.transfermoney CUR_BOOK_BAL,
                     null ACCU_BAL_MTD,
                     null ACCU_BAL_MTD_DAY,
                     null AVG_BAL_YTD,
                     null ACCU_BAL_YTD_DAY,
                     pi.moneytype CURRENCY_ID,
                     pi.timelimit ORG_TERM,
                     '月' ORG_TERM_MULT,
                     null MATURITY_DATE,
                     eaiall.predictyield INTEREST_RATE_FLR,
                     eaiall.predictyieldlimit INTEREST_RATE_CEIL,
                     null ACCRUAL_BASIS_Y,
                     null ACCRUAL_BASIS_M,
                     null ADJUST_TYPE,
                     null FIRST_ADJ_DATE,
                     null ADJUST_TERM,
                     null ADJUST_TERM_MULT,
                     null AMORTIZATION_TYPE,
                     null PAYMENT_AMOUNT,
                     null FIRST_PMT_DATE,
                     null PMT_TERM,
                     null PMT_TERM_MULT,
                     rc1.amount BONUS_YTD,
                     rc2.amount ADVISER_FEE_YTD,
                     null ADMIN_FEE_YTD,
                     null INTEREST_YTD,
                     null INVEST_GAIN_YTD,
                     null TAX_YTD,
                     null BONUS_MTD,
                     null ADVISER_FEE_MTD,
                     null ADMIN_FEE_MTD,
                     null INTEREST_MTD,
                     null INVEST_GAIN_MTD,
                     null TAX_MTD,
                     null DEPR_RESERVE_YTD,
                     null MKT_VALUE_YTD,
                     null EXCHANGE_GAIN_YTD,
                     null OTHER_GAIN_YTD,
                     null PRINCIPAL_ACCT_ID,
                     null INTEREST_ACCT_ID,
                     null INVEST_GAIN_ACCT_ID,
                     null BONUS_ACCT_ID,
                     null ADVISER_FEE_ACCT_ID,
                     null ADMIN_FEE_ACCT_ID,
                     null TAX_ACCT_ID,
                     null DEPR_RESERVE_ACCT_ID,
                     null MKT_VALUE_ACCT_ID,
                     null EXCHANGE_GAIN_ACCT_ID
                from std_layer.t02_project_info pi
                left join (select *
                            from std_layer.t04_invest_contract c
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             --? 需要增加真正要用的字段 and c.investplantype='发股还债'    
                                 ) ic
                  on pi.projectcode = ic.projectcode
                left join (select eai.projectcode,
                                 eai.assetholder,
                                 eai.enterprise,
                                 eai.realinvestdate
                            from (select i.projectcode,
                                         i.assetholder,
                                         i.enterprise,
                                         i.realinvestdate,
                                         row_number() over(partition by i.projectcode, i.assetholder, i.enterprise order by i.realinvestdate) oradernum
                                    from std_layer.t08_equity_assets_info i
                                   where to_char(i.start_date, 'yyyymmdd') <=
                                         to_char(query_date, 'yyyymmdd')
                                     and to_char(i.end_date, 'yyyymmdd') >
                                         to_char(query_date, 'yyyymmdd')) eai
                           where eai.oradernum = 1) eai
                  on eai.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t08_equity_assets_info i
                           where to_char(i.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(i.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) eaiall
                  on eaiall.projectcode = pi.projectcode
                 and eai.assetholder = eaiall.assetholder
                 and eai.enterprise = eaiall.enterprise
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '20041股权分红') rc1
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '22111服务费及佣金') rc2
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '发股还债' --?文档标识为发股还债 ，目前未知
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result;
    --插入日志表中数据
    update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --插入日志表中数据
      update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end ISSUING_SHARE_TO_DEBTS;
  
  
    --原始债权
  procedure ORIGINAL_CREDITOR_RIGHTS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('开始导入重组债权的数据');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101013';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       帐号
       FUND_SRC_TYPE, --         筹资通道
       DATA_DATE, --   数据日期
       PROJECT_ID, --       项目号
       PROJECT_NAME, --         项目名称
       ORG_UNIT_ID, --       业务部门号
       COUNTER_PTY_ID, --         交易标的客户号
       COUNTER_PTY_NAME, --           交易标的客户名称
       ASSET_TRANS_PTY_ID, --           资产出售方编号
       ASSET_TRANS_PTY_NAME, --             资产出售方名称
       PRODUCT_ID, --       业务类型号
       PRODUCT_NAME, --         业务类型名称
       ORIGINATION_DATE, --       起息日期
       CUR_PAR_BAL, --   票面金额
       CUR_BOOK_BAL, --     账面金额
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID, --       币种代码
       ORG_TERM, --   业务期限
       ORG_TERM_MULT, --         业务期限单位
       MATURITY_DATE, --     到期日
       INTEREST_RATE_FLR, --       收益率下限或当前收益率
       INTEREST_RATE_CEIL, --       收益率上限
       ACCRUAL_BASIS_Y, --         年收益率折算系数
       ACCRUAL_BASIS_M, --         月收益计算天数
       ADJUST_TYPE, --       收益率调整方式
       FIRST_ADJ_DATE, --     首次收益率调整日
       ADJUST_TERM, --   收益率调整周期
       ADJUST_TERM_MULT, --           收益率调整周期单位
       AMORTIZATION_TYPE, --           资金回收方式
       PAYMENT_AMOUNT, --     还款金额
       FIRST_PMT_DATE, --     约定收益回收日
       PMT_TERM, --   收益回收周期
       PMT_TERM_MULT, --         收益回收周期单位
       BONUS_YTD, --   年初至今累计投资收益-股利分红
       ADVISER_FEE_YTD, --     年初至今累计顾问费业务收入
       ADMIN_FEE_YTD, --     年初至今累计管理费业务收支
       INTEREST_YTD, --     年初至今累计利息收支
       INVEST_GAIN_YTD, --     年初至今累计投资收益-退出溢价
       TAX_YTD, -- 年初至今累计销项税额
       BONUS_MTD, --   月初至今累计投资收益-股利分红
       ADVISER_FEE_MTD, --     月初至今累计顾问费业务收入
       ADMIN_FEE_MTD, --     月初至今累计管理费业务收支
       INTEREST_MTD, --     月初至今累计利息收支
       INVEST_GAIN_MTD, --     月初至今累计投资收益-退出溢价
       TAX_MTD, -- 月初至今累计销项税额
       DEPR_RESERVE_YTD, --       减值准备金
       MKT_VALUE_YTD, --     公允价值变动损益
       EXCHANGE_GAIN_YTD, --       汇兑损益
       OTHER_GAIN_YTD, --     其它业务收支
       PRINCIPAL_ACCT_ID, --           本金科目号
       INTEREST_ACCT_ID, --           利息收支科目号
       INVEST_GAIN_ACCT_ID, --           投资收益科目号
       BONUS_ACCT_ID, --         股利分红科目号
       ADVISER_FEE_ACCT_ID, --           顾问费收入科目号
       ADMIN_FEE_ACCT_ID, --           管理费收支科目号
       TAX_ACCT_ID, --       进项/销项税科目号
       DEPR_RESERVE_ACCT_ID, --             减值准备金科目号
       MKT_VALUE_ACCT_ID, --           公允价值变动损益科目号
       EXCHANGE_GAIN_ACCT_ID --              汇兑损益科目号
       )
    
      select ACCOUNT_ID,
             FUND_SRC_TYPE,
             DATA_DATE,
             PROJECT_ID,
             PROJECT_NAME,
             ORG_UNIT_ID,
             COUNTER_PTY_ID,
             COUNTER_PTY_NAME,
             ASSET_TRANS_PTY_ID,
             ASSET_TRANS_PTY_NAME,
             '101013',
             PRODUCT_NAME,
             ORIGINATION_DATE,
             CUR_PAR_BAL,
             CUR_BOOK_BAL,
             ACCU_BAL_MTD,
             ACCU_BAL_MTD_DAY,
             AVG_BAL_YTD,
             ACCU_BAL_YTD_DAY,
             CURRENCY_ID,
             ORG_TERM,
             ORG_TERM_MULT,
             MATURITY_DATE,
             INTEREST_RATE_FLR,
             INTEREST_RATE_CEIL,
             ACCRUAL_BASIS_Y,
             ACCRUAL_BASIS_M,
             ADJUST_TYPE,
             FIRST_ADJ_DATE,
             ADJUST_TERM,
             ADJUST_TERM_MULT,
             AMORTIZATION_TYPE,
             PAYMENT_AMOUNT,
             FIRST_PMT_DATE,
             PMT_TERM,
             PMT_TERM_MULT,
             BONUS_YTD,
             ADVISER_FEE_YTD,
             ADMIN_FEE_YTD,
             INTEREST_YTD,
             INVEST_GAIN_YTD,
             TAX_YTD,
             BONUS_MTD,
             ADVISER_FEE_MTD,
             ADMIN_FEE_MTD,
             INTEREST_MTD,
             INVEST_GAIN_MTD,
             TAX_MTD,
             DEPR_RESERVE_YTD,
             MKT_VALUE_YTD,
             EXCHANGE_GAIN_YTD,
             OTHER_GAIN_YTD,
             PRINCIPAL_ACCT_ID,
             INTEREST_ACCT_ID,
             INVEST_GAIN_ACCT_ID,
             BONUS_ACCT_ID,
             ADVISER_FEE_ACCT_ID,
             ADMIN_FEE_ACCT_ID,
             TAX_ACCT_ID,
             DEPR_RESERVE_ACCT_ID,
             MKT_VALUE_ACCT_ID,
             EXCHANGE_GAIN_ACCT_ID
      
        from (select null ACCOUNT_ID,
                     pi.extfield10 FUND_SRC_TYPE,
                     query_date DATA_DATE,
                     pi.projectcode PROJECT_ID,
                     pi.projectname PROJECT_NAME,
                     pi.dptid ORG_UNIT_ID,
                     ccdate.loanaccountcode COUNTER_PTY_ID, 
                     null COUNTER_PTY_NAME,
                     pi.assetseller ASSET_TRANS_PTY_ID,
                     null ASSET_TRANS_PTY_NAME,
                     ic.investplantype PRODUCT_ID,
                     '重组债权' PRODUCT_NAME,
                     ccdate.contractstartdate ORIGINATION_DATE, 
                     cc.corpusamount+cc.interest CUR_PAR_BAL, 
                     null CUR_BOOK_BAL, --? 账面金额待定
                     null ACCU_BAL_MTD,
                     null ACCU_BAL_MTD_DAY,
                     null AVG_BAL_YTD,
                     null ACCU_BAL_YTD_DAY,
                     pi.moneytype CURRENCY_ID,
                     null ORG_TERM, 
                     null ORG_TERM_MULT, 
                     ccdate.contractenddate MATURITY_DATE, 
                     ir.rate INTEREST_RATE_FLR,
                     null INTEREST_RATE_CEIL,
                     ir.calccycle ACCRUAL_BASIS_Y,                 
                     ir.calccycle ACCRUAL_BASIS_M,                 
                     ir.ratetype ADJUST_TYPE,                      
                     null FIRST_ADJ_DATE,       --? 待定ir列       
                     ir.settlefreq ADJUST_TERM,                    
                     ir.settlefreq ADJUST_TERM_MULT,               
                     null AMORTIZATION_TYPE,   --? 待定            
                     null PAYMENT_AMOUNT,       --? 待定           
                     null FIRST_PMT_DATE,      --? 待定ir列        
                     ir.settlefreq PMT_TERM,                       
                     ir.settlefreq PMT_TERM_MULT,                  
                     rc1.amount BONUS_YTD,                         
                     rc2.amount ADVISER_FEE_YTD,                   
                     null ADMIN_FEE_YTD,                           
                     null INTEREST_YTD,                            
                     null INVEST_GAIN_YTD,                         
                     null TAX_YTD,                                 
                     null BONUS_MTD,                               
                     null ADVISER_FEE_MTD,                         
                     null ADMIN_FEE_MTD,                           
                     null INTEREST_MTD,                            
                     null INVEST_GAIN_MTD,                         
                     null TAX_MTD,                                 
                     null DEPR_RESERVE_YTD,                        
                     null MKT_VALUE_YTD,                           
                     null EXCHANGE_GAIN_YTD,                       
                     null OTHER_GAIN_YTD,                          
                     null PRINCIPAL_ACCT_ID,                       
                     null INTEREST_ACCT_ID,                        
                     null INVEST_GAIN_ACCT_ID,                     
                     null BONUS_ACCT_ID,                           
                     null ADVISER_FEE_ACCT_ID,                     
                     null ADMIN_FEE_ACCT_ID,                       
                     null TAX_ACCT_ID,                             
                     null DEPR_RESERVE_ACCT_ID,                    
                     null MKT_VALUE_ACCT_ID,                       
                     null EXCHANGE_GAIN_ACCT_ID                    
                from std_layer.t02_project_info pi
                left join (select *
                            from std_layer.t04_invest_contract c
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) ic
                  on pi.projectcode = ic.projectcode
                left join (select *
                            from std_layer.t04_asset_creditorcontract c1
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and c1.escrowstatus in ('02','03','04') 
                             and c1.creditorassettype='3'
                             
                             ) cc
                  on cc.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t04_asset_creditorcontract
                           where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')) ccdate
                  on ccdate.projectcode = pi.projectcode
                left join (select * from std_layer.t04_invest_rate r  where to_char(start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                                 ) ir
                                 on ir.contractid= cc.creditorcontractnum
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '?????') rc1      --?年初至今累计利息收支等repay_type的结果
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '?????') rc2      --?年初至今累计投资收益等repay_type的结果
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '收债转股' --?文档标识为收债转股 ，目前未知
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result
       where result.PRODUCT_ID = '重组'; --? 原数据进行分类的值
    --插入日志表中数据
    update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --插入日志表中数据
      update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end ORIGINAL_CREDITOR_RIGHTS;
  


  -- update log in etl_control 
  procedure update_log(source_sheet      varchar2,
                       target_sheet      varchar2,
                       query_date        date,
                       success_status    varchar2,
                       exception_message varchar2 default NULL) is
  begin
    insert into etl_control.etl_control_log
      (etl_modle,
       etl_source,
       etl_target,
       data_date,
       etl_date,
       is_success,
       exceptionerrormsg)
    values
      ('EXT_LAYER',
       source_sheet,
       target_sheet,
       query_date,
       sysdate,
       success_status,
       exception_message);
    commit;
  end update_log;

end AICS_ETL_PAG1;
/
