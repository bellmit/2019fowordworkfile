create or replace package AICS_ETL_PAG1 is

  --��ծת��
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

  --��ծת��
  procedure DEBT_TO_EQUITY_SWAP is
    query_date date;
  begin
    --Ϊ�������ڱ�����ֵ
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('��ʼ������ծת�ɵ�����');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101011';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       �ʺ�
       FUND_SRC_TYPE, --         ����ͨ��
       DATA_DATE, --   ��������
       PROJECT_ID, --       ��Ŀ��
       PROJECT_NAME, --         ��Ŀ����
       ORG_UNIT_ID, --       ҵ���ź�
       COUNTER_PTY_ID, --         ���ױ�Ŀͻ���
       COUNTER_PTY_NAME, --           ���ױ�Ŀͻ�����
       ASSET_TRANS_PTY_ID, --           �ʲ����۷����
       ASSET_TRANS_PTY_NAME, --             �ʲ����۷�����
       PRODUCT_ID, --       ҵ�����ͺ�
       PRODUCT_NAME, --         ҵ����������
       ORIGINATION_DATE, --       ��Ϣ����
       CUR_PAR_BAL, --   Ʊ����
       CUR_BOOK_BAL, --     ������
       ACCU_BAL_MTD, --     �³����������ۼƻ���
       ACCU_BAL_MTD_DAY, --       �³����������ۼ�����
       AVG_BAL_YTD, --   ������������ۼƻ���
       ACCU_BAL_YTD_DAY, --       ������������ۼ�����
       CURRENCY_ID, --       ���ִ���
       ORG_TERM, --   ҵ������
       ORG_TERM_MULT, --         ҵ�����޵�λ
       MATURITY_DATE, --     ������
       INTEREST_RATE_FLR, --       ���������޻�ǰ������
       INTEREST_RATE_CEIL, --       ����������
       ACCRUAL_BASIS_Y, --         ������������ϵ��
       ACCRUAL_BASIS_M, --         �������������
       ADJUST_TYPE, --       �����ʵ�����ʽ
       FIRST_ADJ_DATE, --     �״������ʵ�����
       ADJUST_TERM, --   �����ʵ�������
       ADJUST_TERM_MULT, --           �����ʵ������ڵ�λ
       AMORTIZATION_TYPE, --           �ʽ���շ�ʽ
       PAYMENT_AMOUNT, --     ������
       FIRST_PMT_DATE, --     Լ�����������
       PMT_TERM, --   �����������
       PMT_TERM_MULT, --         ����������ڵ�λ
       BONUS_YTD, --   ��������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_YTD, --     ��������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_YTD, --     ��������ۼƹ����ҵ����֧
       INTEREST_YTD, --     ��������ۼ���Ϣ��֧
       INVEST_GAIN_YTD, --     ��������ۼ�Ͷ������-�˳����
       TAX_YTD, -- ��������ۼ�����˰��
       BONUS_MTD, --   �³������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_MTD, --     �³������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_MTD, --     �³������ۼƹ����ҵ����֧
       INTEREST_MTD, --     �³������ۼ���Ϣ��֧
       INVEST_GAIN_MTD, --     �³������ۼ�Ͷ������-�˳����
       TAX_MTD, -- �³������ۼ�����˰��
       DEPR_RESERVE_YTD, --       ��ֵ׼����
       MKT_VALUE_YTD, --     ���ʼ�ֵ�䶯����
       EXCHANGE_GAIN_YTD, --       �������
       OTHER_GAIN_YTD, --     ����ҵ����֧
       PRINCIPAL_ACCT_ID, --           �����Ŀ��
       INTEREST_ACCT_ID, --           ��Ϣ��֧��Ŀ��
       INVEST_GAIN_ACCT_ID, --           Ͷ�������Ŀ��
       BONUS_ACCT_ID, --         �����ֺ��Ŀ��
       ADVISER_FEE_ACCT_ID, --           ���ʷ������Ŀ��
       ADMIN_FEE_ACCT_ID, --           �������֧��Ŀ��
       TAX_ACCT_ID, --       ����/����˰��Ŀ��
       DEPR_RESERVE_ACCT_ID, --             ��ֵ׼�����Ŀ��
       MKT_VALUE_ACCT_ID, --           ���ʼ�ֵ�䶯�����Ŀ��
       EXCHANGE_GAIN_ACCT_ID --              ��������Ŀ��
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
                     '��ծת��' PRODUCT_NAME,
                     eai.realinvestdate ORIGINATION_DATE,
                     ic.contractbalance CUR_PAR_BAL,
                     ic.transfermoney CUR_BOOK_BAL,
                     null ACCU_BAL_MTD,
                     null ACCU_BAL_MTD_DAY,
                     null AVG_BAL_YTD,
                     null ACCU_BAL_YTD_DAY,
                     pi.moneytype CURRENCY_ID,
                     pi.timelimit ORG_TERM,
                     '��' ORG_TERM_MULT,
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
                             and f.repay_type = '20041��Ȩ�ֺ�') rc1
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '22111����Ѽ�Ӷ��') rc2
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '��ծת��' --?�ĵ���ʶΪ��ծת�� ��Ŀǰδ֪
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result
       where result.PRODUCT_ID = 'ת��'; -- ?ԭ���ݽ��з����ֵ
    --������־��������
    update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --������־��������
      update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end DEBT_TO_EQUITY_SWAP;

  --����ծȨ
  procedure REORGANIZATION_OF_CLAIMS is
    query_date date;
  begin
    --Ϊ�������ڱ�����ֵ
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('��ʼ��������ծȨ������');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101013';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       �ʺ�
       FUND_SRC_TYPE, --         ����ͨ��
       DATA_DATE, --   ��������
       PROJECT_ID, --       ��Ŀ��
       PROJECT_NAME, --         ��Ŀ����
       ORG_UNIT_ID, --       ҵ���ź�
       COUNTER_PTY_ID, --         ���ױ�Ŀͻ���
       COUNTER_PTY_NAME, --           ���ױ�Ŀͻ�����
       ASSET_TRANS_PTY_ID, --           �ʲ����۷����
       ASSET_TRANS_PTY_NAME, --             �ʲ����۷�����
       PRODUCT_ID, --       ҵ�����ͺ�
       PRODUCT_NAME, --         ҵ����������
       ORIGINATION_DATE, --       ��Ϣ����
       CUR_PAR_BAL, --   Ʊ����
       CUR_BOOK_BAL, --     ������
       ACCU_BAL_MTD, --     �³����������ۼƻ���
       ACCU_BAL_MTD_DAY, --       �³����������ۼ�����
       AVG_BAL_YTD, --   ������������ۼƻ���
       ACCU_BAL_YTD_DAY, --       ������������ۼ�����
       CURRENCY_ID, --       ���ִ���
       ORG_TERM, --   ҵ������
       ORG_TERM_MULT, --         ҵ�����޵�λ
       MATURITY_DATE, --     ������
       INTEREST_RATE_FLR, --       ���������޻�ǰ������
       INTEREST_RATE_CEIL, --       ����������
       ACCRUAL_BASIS_Y, --         ������������ϵ��
       ACCRUAL_BASIS_M, --         �������������
       ADJUST_TYPE, --       �����ʵ�����ʽ
       FIRST_ADJ_DATE, --     �״������ʵ�����
       ADJUST_TERM, --   �����ʵ�������
       ADJUST_TERM_MULT, --           �����ʵ������ڵ�λ
       AMORTIZATION_TYPE, --           �ʽ���շ�ʽ
       PAYMENT_AMOUNT, --     ������
       FIRST_PMT_DATE, --     Լ�����������
       PMT_TERM, --   �����������
       PMT_TERM_MULT, --         ����������ڵ�λ
       BONUS_YTD, --   ��������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_YTD, --     ��������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_YTD, --     ��������ۼƹ����ҵ����֧
       INTEREST_YTD, --     ��������ۼ���Ϣ��֧
       INVEST_GAIN_YTD, --     ��������ۼ�Ͷ������-�˳����
       TAX_YTD, -- ��������ۼ�����˰��
       BONUS_MTD, --   �³������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_MTD, --     �³������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_MTD, --     �³������ۼƹ����ҵ����֧
       INTEREST_MTD, --     �³������ۼ���Ϣ��֧
       INVEST_GAIN_MTD, --     �³������ۼ�Ͷ������-�˳����
       TAX_MTD, -- �³������ۼ�����˰��
       DEPR_RESERVE_YTD, --       ��ֵ׼����
       MKT_VALUE_YTD, --     ���ʼ�ֵ�䶯����
       EXCHANGE_GAIN_YTD, --       �������
       OTHER_GAIN_YTD, --     ����ҵ����֧
       PRINCIPAL_ACCT_ID, --           �����Ŀ��
       INTEREST_ACCT_ID, --           ��Ϣ��֧��Ŀ��
       INVEST_GAIN_ACCT_ID, --           Ͷ�������Ŀ��
       BONUS_ACCT_ID, --         �����ֺ��Ŀ��
       ADVISER_FEE_ACCT_ID, --           ���ʷ������Ŀ��
       ADMIN_FEE_ACCT_ID, --           �������֧��Ŀ��
       TAX_ACCT_ID, --       ����/����˰��Ŀ��
       DEPR_RESERVE_ACCT_ID, --             ��ֵ׼�����Ŀ��
       MKT_VALUE_ACCT_ID, --           ���ʼ�ֵ�䶯�����Ŀ��
       EXCHANGE_GAIN_ACCT_ID --              ��������Ŀ��
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
                     '����ծȨ' PRODUCT_NAME,
                     ccdate.contractstartdate ORIGINATION_DATE, 
                     cc.corpusamount+cc.interest CUR_PAR_BAL, 
                     null CUR_BOOK_BAL, --? ���������
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
                     null FIRST_ADJ_DATE,       --? ����ir��       
                     ir.settlefreq ADJUST_TERM,                    
                     ir.settlefreq ADJUST_TERM_MULT,               
                     null AMORTIZATION_TYPE,   --? ����            
                     null PAYMENT_AMOUNT,       --? ����           
                     null FIRST_PMT_DATE,      --? ����ir��        
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
                             and f.repay_type = '?????') rc1      --?��������ۼ���Ϣ��֧��repay_type�Ľ��
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '?????') rc2      --?��������ۼ�Ͷ�������repay_type�Ľ��
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '��ծת��' --?�ĵ���ʶΪ��ծת�� ��Ŀǰδ֪
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result
       where result.PRODUCT_ID = '����'; --? ԭ���ݽ��з����ֵ
    --������־��������
    update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --������־��������
      update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end REORGANIZATION_OF_CLAIMS;
  
  --���ɻ�ծ
  procedure ISSUING_SHARE_TO_DEBTS is
    query_date date;
  begin
    --Ϊ�������ڱ�����ֵ
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('��ʼ���뷢�ɻ�ծ������');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101010';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       �ʺ�
       FUND_SRC_TYPE, --         ����ͨ��
       DATA_DATE, --   ��������
       PROJECT_ID, --       ��Ŀ��
       PROJECT_NAME, --         ��Ŀ����
       ORG_UNIT_ID, --       ҵ���ź�
       COUNTER_PTY_ID, --         ���ױ�Ŀͻ���
       COUNTER_PTY_NAME, --           ���ױ�Ŀͻ�����
       ASSET_TRANS_PTY_ID, --           �ʲ����۷����
       ASSET_TRANS_PTY_NAME, --             �ʲ����۷�����
       PRODUCT_ID, --       ҵ�����ͺ�
       PRODUCT_NAME, --         ҵ����������
       ORIGINATION_DATE, --       ��Ϣ����
       CUR_PAR_BAL, --   Ʊ����
       CUR_BOOK_BAL, --     ������
       ACCU_BAL_MTD, --     �³����������ۼƻ���
       ACCU_BAL_MTD_DAY, --       �³����������ۼ�����
       AVG_BAL_YTD, --   ������������ۼƻ���
       ACCU_BAL_YTD_DAY, --       ������������ۼ�����
       CURRENCY_ID, --       ���ִ���
       ORG_TERM, --   ҵ������
       ORG_TERM_MULT, --         ҵ�����޵�λ
       MATURITY_DATE, --     ������
       INTEREST_RATE_FLR, --       ���������޻�ǰ������
       INTEREST_RATE_CEIL, --       ����������
       ACCRUAL_BASIS_Y, --         ������������ϵ��
       ACCRUAL_BASIS_M, --         �������������
       ADJUST_TYPE, --       �����ʵ�����ʽ
       FIRST_ADJ_DATE, --     �״������ʵ�����
       ADJUST_TERM, --   �����ʵ�������
       ADJUST_TERM_MULT, --           �����ʵ������ڵ�λ
       AMORTIZATION_TYPE, --           �ʽ���շ�ʽ
       PAYMENT_AMOUNT, --     ������
       FIRST_PMT_DATE, --     Լ�����������
       PMT_TERM, --   �����������
       PMT_TERM_MULT, --         ����������ڵ�λ
       BONUS_YTD, --   ��������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_YTD, --     ��������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_YTD, --     ��������ۼƹ����ҵ����֧
       INTEREST_YTD, --     ��������ۼ���Ϣ��֧
       INVEST_GAIN_YTD, --     ��������ۼ�Ͷ������-�˳����
       TAX_YTD, -- ��������ۼ�����˰��
       BONUS_MTD, --   �³������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_MTD, --     �³������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_MTD, --     �³������ۼƹ����ҵ����֧
       INTEREST_MTD, --     �³������ۼ���Ϣ��֧
       INVEST_GAIN_MTD, --     �³������ۼ�Ͷ������-�˳����
       TAX_MTD, -- �³������ۼ�����˰��
       DEPR_RESERVE_YTD, --       ��ֵ׼����
       MKT_VALUE_YTD, --     ���ʼ�ֵ�䶯����
       EXCHANGE_GAIN_YTD, --       �������
       OTHER_GAIN_YTD, --     ����ҵ����֧
       PRINCIPAL_ACCT_ID, --           �����Ŀ��
       INTEREST_ACCT_ID, --           ��Ϣ��֧��Ŀ��
       INVEST_GAIN_ACCT_ID, --           Ͷ�������Ŀ��
       BONUS_ACCT_ID, --         �����ֺ��Ŀ��
       ADVISER_FEE_ACCT_ID, --           ���ʷ������Ŀ��
       ADMIN_FEE_ACCT_ID, --           �������֧��Ŀ��
       TAX_ACCT_ID, --       ����/����˰��Ŀ��
       DEPR_RESERVE_ACCT_ID, --             ��ֵ׼�����Ŀ��
       MKT_VALUE_ACCT_ID, --           ���ʼ�ֵ�䶯�����Ŀ��
       EXCHANGE_GAIN_ACCT_ID --              ��������Ŀ��
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
                     '���ɻ�ծ' PRODUCT_NAME,
                     eai.realinvestdate ORIGINATION_DATE,
                     ic.contractbalance CUR_PAR_BAL,
                     ic.transfermoney CUR_BOOK_BAL,
                     null ACCU_BAL_MTD,
                     null ACCU_BAL_MTD_DAY,
                     null AVG_BAL_YTD,
                     null ACCU_BAL_YTD_DAY,
                     pi.moneytype CURRENCY_ID,
                     pi.timelimit ORG_TERM,
                     '��' ORG_TERM_MULT,
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
                             --? ��Ҫ��������Ҫ�õ��ֶ� and c.investplantype='���ɻ�ծ'    
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
                             and f.repay_type = '20041��Ȩ�ֺ�') rc1
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '22111����Ѽ�Ӷ��') rc2
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '���ɻ�ծ' --?�ĵ���ʶΪ���ɻ�ծ ��Ŀǰδ֪
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result;
    --������־��������
    update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --������־��������
      update_log('t02_project_info t04_invest_contract t08_equity_assets_info t05_repay_confirm',
                 'EXT_LAYER.ma_business_account_infor',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end ISSUING_SHARE_TO_DEBTS;
  
  
    --ԭʼծȨ
  procedure ORIGINAL_CREDITOR_RIGHTS is
    query_date date;
  begin
    --Ϊ�������ڱ�����ֵ
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('��ʼ��������ծȨ������');
  
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID = '101013';
  
    INSERT INTO ma_business_account_infor
      (ACCOUNT_ID, --       �ʺ�
       FUND_SRC_TYPE, --         ����ͨ��
       DATA_DATE, --   ��������
       PROJECT_ID, --       ��Ŀ��
       PROJECT_NAME, --         ��Ŀ����
       ORG_UNIT_ID, --       ҵ���ź�
       COUNTER_PTY_ID, --         ���ױ�Ŀͻ���
       COUNTER_PTY_NAME, --           ���ױ�Ŀͻ�����
       ASSET_TRANS_PTY_ID, --           �ʲ����۷����
       ASSET_TRANS_PTY_NAME, --             �ʲ����۷�����
       PRODUCT_ID, --       ҵ�����ͺ�
       PRODUCT_NAME, --         ҵ����������
       ORIGINATION_DATE, --       ��Ϣ����
       CUR_PAR_BAL, --   Ʊ����
       CUR_BOOK_BAL, --     ������
       ACCU_BAL_MTD, --     �³����������ۼƻ���
       ACCU_BAL_MTD_DAY, --       �³����������ۼ�����
       AVG_BAL_YTD, --   ������������ۼƻ���
       ACCU_BAL_YTD_DAY, --       ������������ۼ�����
       CURRENCY_ID, --       ���ִ���
       ORG_TERM, --   ҵ������
       ORG_TERM_MULT, --         ҵ�����޵�λ
       MATURITY_DATE, --     ������
       INTEREST_RATE_FLR, --       ���������޻�ǰ������
       INTEREST_RATE_CEIL, --       ����������
       ACCRUAL_BASIS_Y, --         ������������ϵ��
       ACCRUAL_BASIS_M, --         �������������
       ADJUST_TYPE, --       �����ʵ�����ʽ
       FIRST_ADJ_DATE, --     �״������ʵ�����
       ADJUST_TERM, --   �����ʵ�������
       ADJUST_TERM_MULT, --           �����ʵ������ڵ�λ
       AMORTIZATION_TYPE, --           �ʽ���շ�ʽ
       PAYMENT_AMOUNT, --     ������
       FIRST_PMT_DATE, --     Լ�����������
       PMT_TERM, --   �����������
       PMT_TERM_MULT, --         ����������ڵ�λ
       BONUS_YTD, --   ��������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_YTD, --     ��������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_YTD, --     ��������ۼƹ����ҵ����֧
       INTEREST_YTD, --     ��������ۼ���Ϣ��֧
       INVEST_GAIN_YTD, --     ��������ۼ�Ͷ������-�˳����
       TAX_YTD, -- ��������ۼ�����˰��
       BONUS_MTD, --   �³������ۼ�Ͷ������-�����ֺ�
       ADVISER_FEE_MTD, --     �³������ۼƹ��ʷ�ҵ������
       ADMIN_FEE_MTD, --     �³������ۼƹ����ҵ����֧
       INTEREST_MTD, --     �³������ۼ���Ϣ��֧
       INVEST_GAIN_MTD, --     �³������ۼ�Ͷ������-�˳����
       TAX_MTD, -- �³������ۼ�����˰��
       DEPR_RESERVE_YTD, --       ��ֵ׼����
       MKT_VALUE_YTD, --     ���ʼ�ֵ�䶯����
       EXCHANGE_GAIN_YTD, --       �������
       OTHER_GAIN_YTD, --     ����ҵ����֧
       PRINCIPAL_ACCT_ID, --           �����Ŀ��
       INTEREST_ACCT_ID, --           ��Ϣ��֧��Ŀ��
       INVEST_GAIN_ACCT_ID, --           Ͷ�������Ŀ��
       BONUS_ACCT_ID, --         �����ֺ��Ŀ��
       ADVISER_FEE_ACCT_ID, --           ���ʷ������Ŀ��
       ADMIN_FEE_ACCT_ID, --           �������֧��Ŀ��
       TAX_ACCT_ID, --       ����/����˰��Ŀ��
       DEPR_RESERVE_ACCT_ID, --             ��ֵ׼�����Ŀ��
       MKT_VALUE_ACCT_ID, --           ���ʼ�ֵ�䶯�����Ŀ��
       EXCHANGE_GAIN_ACCT_ID --              ��������Ŀ��
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
                     '����ծȨ' PRODUCT_NAME,
                     ccdate.contractstartdate ORIGINATION_DATE, 
                     cc.corpusamount+cc.interest CUR_PAR_BAL, 
                     null CUR_BOOK_BAL, --? ���������
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
                     null FIRST_ADJ_DATE,       --? ����ir��       
                     ir.settlefreq ADJUST_TERM,                    
                     ir.settlefreq ADJUST_TERM_MULT,               
                     null AMORTIZATION_TYPE,   --? ����            
                     null PAYMENT_AMOUNT,       --? ����           
                     null FIRST_PMT_DATE,      --? ����ir��        
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
                             and f.repay_type = '?????') rc1      --?��������ۼ���Ϣ��֧��repay_type�Ľ��
                  on rc1.projectcode = pi.projectcode
                left join (select *
                            from std_layer.t05_repay_confirm f
                           where to_char(f.start_date, 'yyyymmdd') <=
                                 to_char(query_date, 'yyyymmdd')
                             and to_char(f.end_date, 'yyyymmdd') >
                                 to_char(query_date, 'yyyymmdd')
                             and f.repay_type = '?????') rc2      --?��������ۼ�Ͷ�������repay_type�Ľ��
                  on rc2.projectcode = pi.projectcode
               where pi.projectnature = '��ծת��' --?�ĵ���ʶΪ��ծת�� ��Ŀǰδ֪
                 and to_char(pi.start_date, 'yyyymmdd') <=
                     to_char(query_date, 'yyyymmdd')
                 and to_char(pi.end_date, 'yyyymmdd') >
                     to_char(query_date, 'yyyymmdd')) result
       where result.PRODUCT_ID = '����'; --? ԭ���ݽ��з����ֵ
    --������־��������
    update_log('t02_project_info t04_invest_contract t04_asset_creditorcontract t04_invest_rate t05_repay_confirm',
               'EXT_LAYER.ma_business_account_infor',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --������־��������
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
