create or replace package CORE_BUSINESS_ETL_PKG is

  -- Author  : GYTZ-KAIF1
  -- Created : 2019/3/1 14:03:38
  -- Purpose : 核心业务的取数逻辑

  --存放同业、拆放同业、同业拆借、同业借款和降准资金的取数逻辑
  procedure etl_deposit_business;

  --购买国债、其他固定收益类证券、债券逆回购、债券正回购和咨询业务的取数逻辑
  procedure etl_bond_business;

end CORE_BUSINESS_ETL_PKG;
/
create or replace package body CORE_BUSINESS_ETL_PKG is

  procedure etl_deposit_business is
    --定义数据日期
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    --删除存放同业和拆放同业的数据 
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID in ('101014', '101015', '102012', '102013', '102014');
  
    --插入数据
    --存放同业
    INSERT INTO MA_BUSINESS_ACCOUNT_INFOR
      (DATA_DATE,
       ACCOUNT_ID,
       ORG_UNIT_ID,
       COUNTER_PTY_ID,
       ASSET_TRANS_PTY_ID,
       PRODUCT_ID,
       PRODUCT_NAME,
       ORIGINATION_DATE,
       CUR_PAR_BAL,
       CUR_BOOK_BAL,
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID,
       ORG_TERM,
       ORG_TERM_MULT,
       MATURITY_DATE,
       INTEREST_RATE_FLR,
       ACCRUAL_BASIS_Y,
       ACCRUAL_BASIS_M,
       ADJUST_TYPE,
       AMORTIZATION_TYPE,
       INTEREST_YTD,
       EXCHANGE_GAIN_YTD,
       PRINCIPAL_ACCT_ID,
       INTEREST_ACCT_ID,
       EXCHANGE_GAIN_ACCT_ID)
    
      (SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID
              '0602800009', --开展业务的部门代码，默认为金融市场团队
              NULL, --交易对手的代号
              A.CUST, --交易对手ID 
              '101014', --“存放同业”业务的代码 
              '存放同业', --存放同业
              A.VDATE, --存放日期 
              NULL, --存放金额
              A.AMT, --存放金额
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              A.CCY, --币种代码
              A.TENOR, --定期存放：存放期限； 活期存放：1天
              A.TENOR_UNIT, --单位
              A.MDATE, --定期存放：存放到期日；活期存放：数据日期+1
              NULL, --存放同业的年化利率
              A.BASIS, --年利率折日利率系数
              A.BASIS, --每月计息天数
              A.RATECODE, --利率的变动方式。（一般为固定）
              'D00280002', --一般为到期还本付息, 默认到期还本付息 
              NULL, --年初至今的累计利息收入  @@@@@@@@@@@@@@@@@@@@@@@@@@@@
              NULL, --数据日期当天的汇兑损益余额
              NULL, --本金的入账科目号
              NULL, --利息收支的入账科目号
              NULL --汇兑损益的入账科目号
       
         FROM MA_DEPOSITS_LOANS_DEAL_v A
       
        WHERE 1 = 1
          AND A.DL_PS = 'CT' --CT 存放同业
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD')
       --AND A.PAYRECIND = '' --筛选C_PAYRECIND为付款，筛选“业务类型”
       
       UNION ALL
       
       --拆放同业
       
       SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID
              '0602800009', --开展业务的部门代码，默认为金融市场团队
              NULL, --交易对手的代号
              A.CUST, --交易对手ID 
              '101015', --“拆放同业”业务的代码 
              '拆放同业', --拆放同业
              A.VDATE, --拆放日期 
              NULL, --拆放金额
              A.AMT, --拆放金额
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              A.CCY, --币种代码
              A.TENOR, --定期存放：存放期限； 活期存放：1天
              A.TENOR_UNIT, --单位
              A.MDATE, --定期存放：存放到期日；活期存放：数据日期+1
              NULL, --存放同业的年化利率
              A.BASIS, --年利率折日利率系数
              A.BASIS, --每月计息天数
              A.RATECODE, --利率的变动方式。（一般为固定）
              'D00280002', --一般为到期还本付息, 默认到期还本付息 
              NULL, --年初至今的累计利息收入 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
              NULL, --数据日期当天的汇兑损益余额
              NULL, --本金的入账科目号
              NULL, --利息收支的入账科目号
              NULL --汇兑损益的入账科目号
       
         FROM MA_DEPOSITS_LOANS_DEAL_v A
       
        WHERE 1 = 1
          AND A.DL_PS = 'BO' --BO 贷(拆出)
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD'))
    --AND A.PAYRECIND = '' --筛选C_PAYRECIND为付款，筛选“业务类型”
    ;
    --commit;
    --同业拆借
    INSERT INTO MA_BUSINESS_ACCOUNT_INFOR
      (DATA_DATE,
       ACCOUNT_ID,
       ORG_UNIT_ID,
       ASSET_TRANS_PTY_ID,
       PRODUCT_ID,
       PRODUCT_NAME,
       ORIGINATION_DATE,
       CUR_PAR_BAL,
       CUR_BOOK_BAL,
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID,
       ORG_TERM,
       ORG_TERM_MULT， MATURITY_DATE,
       INTEREST_RATE_FLR,
       ACCRUAL_BASIS_Y,
       ACCRUAL_BASIS_M,
       ADJUST_TYPE,
       AMORTIZATION_TYPE,
       INTEREST_YTD,
       PRINCIPAL_ACCT_ID,
       INTEREST_ACCT_ID)
    
      (SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID
              '0602800009', --开展业务的部门代码，默认为金融市场团队
              A.CUST, --交易对手ID 
              '102012', --“同业拆借”业务的代码 
              '同业拆借', --同业拆借
              A.VDATE, --拆放日期 
              NULL, --拆放金额
              A.AMT, --拆放金额
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              A.CCY, --币种代码
              A.TENOR, --定期存放：存放期限； 活期存放：1天
              A.TENOR_UNIT, --单位
              A.MDATE, --定期存放：存放到期日；活期存放：数据日期+1
              NULL, --存放同业的年化利率
              A.BASIS, --年利率折日利率系数
              A.BASIS, --每月计息天数
              A.RATECODE, --利率的变动方式。（一般为固定）
              'D00280002', --一般为到期还本付息, 默认到期还本付息 
              NULL, --年初至今的累计利息收入 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
              NULL, --本金的入账科目号
              NULL --利息收支的入账科目号
       
         FROM MA_DEPOSITS_LOANS_DEAL_v A
       
        WHERE 1 = 1
          AND A.DL_PS IN ('LE','TC') --LE 借(拆入)、TC 同业存放
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD')
       --AND A.PAYRECIND = '' --筛选C_PAYRECIND为付款，筛选“业务类型”
       UNION ALL
       --同业借款
       
       SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID
              '0602800009', --开展业务的部门代码，默认为金融市场团队
              A.CUST, --交易对手ID 
              '102013', --“同业借款”业务的代码 
              '同业借款', --同业借款
              A.VDATE, --拆放日期 
              NULL, --拆放金额
              A.AMT, --拆放金额
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              A.CCY, --币种代码
              A.TENOR, --定期存放：存放期限； 活期存放：1天
              A.TENOR_UNIT, --单位
              A.MDATE, --定期存放：存放到期日；活期存放：数据日期+1
              NULL, --存放同业的年化利率
              A.BASIS, --年利率折日利率系数
              A.BASIS, --每月计息天数
              A.RATECODE, --利率的变动方式。（一般为固定）
              'D00280002', --一般为到期还本付息, 默认到期还本付息 
              NULL, --年初至今的累计利息收入 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
              NULL, --本金的入账科目号
              NULL --利息收支的入账科目号
       
         FROM MA_DEPOSITS_LOANS_DEAL_v A
       
        WHERE 1 = 1
          AND A.DL_PS = 'LO' --LO 同业借款
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD'))
    --AND A.PAYRECIND = '' --筛选C_PAYRECIND为付款，筛选“业务类型”
    ;
  
    --降准资金
  
    --降准资金
    INSERT INTO MA_BUSINESS_ACCOUNT_INFOR
      (DATA_DATE,
       ACCOUNT_ID,
       ORG_UNIT_ID,
       ASSET_TRANS_PTY_ID,
       PRODUCT_ID,
       PRODUCT_NAME,
       ORIGINATION_DATE,
       CUR_PAR_BAL,
       CUR_BOOK_BAL,
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID,
       ORG_TERM,
       ORG_TERM_MULT,
       MATURITY_DATE,
       INTEREST_RATE_FLR,
       ACCRUAL_BASIS_Y,
       ACCRUAL_BASIS_M,
       ADJUST_TYPE,
       AMORTIZATION_TYPE,
       INTEREST_YTD,
       PRINCIPAL_ACCT_ID,
       INTEREST_ACCT_ID)
    
      SELECT QUERY_DATE, --数据日期
             A.DEALNO, --业务唯一ID
             '0602800009', --开展业务的部门代码，默认为金融市场团队
             A.CUST, --交易对手ID
             '102014', --“降准资金”业务的代码
             '降准资金', --降准资金
             A.VDATE, --借款起息日
             NULL, --借款金额
             A.AMT, --借款金额 
             A.BAL_ACCU_M,
             A.DAY_ACCU_M,
             A.BAL_ACCU_Y,
             A.DAY_ACCU_Y,
             A.CCY, --币种代码 
             A.TENOR, --定期：借款期限；活期：1天  
             A.TENOR_UNIT, --单位
             A.MDATE, --借款到期日  
             NULL, --降准资金的借款年化利率
             A.BASIS, --年利率折日利率系数  
             A.BASIS, --每月计息天数 
             A.RATECODE, --利率调整方式（一般为固定）
             'D00280002', --本息支付方式（一般为到期还本付息） 
             NULL, --年初至今的累计利息支出 @@@@@@@@@@@@@@@@@@@@@@@@@@@@
             NULL, --本金的入账科目号
             NULL --利息收支的入账科目号
      
        FROM MA_DEPOSITS_LOANS_DEAL_v A
      
       WHERE 1 = 1
            --AND A.DL_PS=''
         AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
             TO_CHAR(SYSDATE, 'YYYYMMDD')
         AND TO_CHAR(A.END_DATE, 'YYYYMMDD') < TO_CHAR(SYSDATE, 'YYYYMMDD')
      --AND A.PAYRECIND = '' --筛选C_PAYRECIND为付款，筛选“业务类型”
      ;
  
  end;

  procedure etl_bond_business is
    --定义数据日期
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    --删除购买国债、其他固定收益类证券、债券逆回购、债券正回购以及咨询业务的数据 
    delete from ma_business_account_infor
     where data_date = query_date
       and PRODUCT_ID in ('101016', '101018', '101017', '102011', '201016');
    --购买国债
    INSERT INTO MA_BUSINESS_ACCOUNT_INFOR
      (DATA_DATE,
       ACCOUNT_ID,
       ORG_UNIT_ID,
       ASSET_TRANS_PTY_ID,
       PRODUCT_ID,
       PRODUCT_NAME,
       ORIGINATION_DATE,
       CUR_PAR_BAL,
       CUR_BOOK_BAL,
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID,
       ORG_TERM,
       MATURITY_DATE,
       INTEREST_RATE_FLR,
       ACCRUAL_BASIS_Y,
       ACCRUAL_BASIS_M,
       ADJUST_TYPE,
       FIRST_ADJ_DATE,
       ADJUST_TERM,
       ADJUST_TERM_MULT,
       AMORTIZATION_TYPE,
       FIRST_PMT_DATE,
       PMT_TERM,
       PMT_TERM_MULT,
       INTEREST_YTD,
       INVEST_GAIN_YTD,
       MKT_VALUE_YTD,
       PRINCIPAL_ACCT_ID,
       INTEREST_ACCT_ID,
       INVEST_GAIN_ACCT_ID,
       MKT_VALUE_ACCT_ID)
    
      (SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID,筛选C_PS为“P买入”
              '0602800009', --开展业务的部门代码,默认金融市场团队 
              NULL, --交易对手ID
              '101016', --“购买国债”业务的代码,,TB为国债 
              '购买国债', --购买国债
              A.VDATE, --债券的起息日 
              A.FACEAMOUNT, --债券票面金额
              A.AMOUNT, --债券账面金额 
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              B.CCY, --币种代码
              NULL, --债券的期限
              B.MDATE, --债券到期日
              B.FIXRATE, --票面利率
              B.BASIS, --票面利率折日利率系数
              B.BASIS, --月实际计息天数
              B.RATECODE, --利率调整方式
              NULL, --如利率为可调整，债券首次利率调整的日期
              SRA.EFF_RULE, --如利率为可调整，债券利率调整的周期,1-当期生效 2-下一周期生效 3-下一年度生效 4-特定日期
              NULL, --如利率为可调整，债券利率调整周期的单位
              'D00280003', --债券本息支付方式，到期还本付息、到期还本分期付息,按现金流
              NULL, --首次付息日期
              NULL, --付息周期
              NULL, --付息周期的单位
              P.TD_INTAMT, --年初至今的累计利息收入
              P.TD_SALEGAIN, --年初至今累计投资收益
              NULL, --数据日期当天的公允价值变动损益余额
              NULL, --本金的入账科目号
              NULL, --利息收支的入账科目号
              NULL, --投资收益的入账科目号
              NULL --公允价值变动损益的入账科目号
       
         FROM MA_SECURITY_DEAL_v A
        INNER JOIN MA_SECURITY_MASTER_v B
           ON A.SECURITY = B.SECURITY
        INNER JOIN MA_SECURITY_POSITION_v P
           ON A.SECURITY = P.SECURITY
        INNER JOIN MA_SECURITY_RATE_ADJUST_v SRA
           ON A.SECURITY = SRA.SECURITY
        WHERE 1 = 1
          AND A.PS = 'P' --筛选C_PS为“P买入”
          AND B.TYPE = 'TB' --TB为国债
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD')
       
       UNION ALL
       
       SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID,筛选C_PS为“P买入”
              '0602800009', --开展业务的部门代码,默认金融市场团队
              NULL, --交易对手ID
              '101018', --“其他固定收益类证券”业务的代码,,TB不为国债 
              '其他固定收益类证券', --其他固定收益类证券
              A.VDATE, --债券的起息日 
              A.FACEAMOUNT, --债券票面金额
              A.AMOUNT, --债券账面金额 
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              B.CCY, --币种代码
              NULL, --债券的期限
              B.MDATE, --债券到期日
              B.FIXRATE, --票面利率
              B.BASIS, --票面利率折日利率系数
              B.BASIS, --月实际计息天数
              B.RATECODE, --利率调整方式
              NULL, --如利率为可调整，债券首次利率调整的日期
              SRA.EFF_RULE, --如利率为可调整，债券利率调整的周期,1-当期生效 2-下一周期生效 3-下一年度生效 4-特定日期
              NULL, --如利率为可调整，债券利率调整周期的单位
              'D00280003', --债券本息支付方式，到期还本付息、到期还本分期付息,按现金流
              NULL, --首次付息日期
              NULL, --付息周期
              NULL, --付息周期的单位
              P.TD_INTAMT, --年初至今的累计利息收入
              P.TD_SALEGAIN, --年初至今累计投资收益
              NULL, --数据日期当天的公允价值变动损益余额
              NULL, --本金的入账科目号
              NULL, --利息收支的入账科目号
              NULL, --投资收益的入账科目号
              NULL --公允价值变动损益的入账科目号
       
         FROM MA_SECURITY_DEAL_v A
        INNER JOIN MA_SECURITY_MASTER_v B
           ON A.SECURITY = B.SECURITY
        INNER JOIN MA_SECURITY_POSITION_v P
           ON A.SECURITY = P.SECURITY
        INNER JOIN MA_SECURITY_RATE_ADJUST_v SRA
           ON A.SECURITY = SRA.SECURITY
        WHERE 1 = 1
          AND A.PS = 'P' --筛选C_PS为“P买入”
          AND B.TYPE <> 'TB' --TB为国债
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD'));
  
    --债券逆回购
    INSERT INTO MA_BUSINESS_ACCOUNT_INFOR
      (DATA_DATE,
       ACCOUNT_ID,
       ORG_UNIT_ID,
       ASSET_TRANS_PTY_ID,
       PRODUCT_ID,
       PRODUCT_NAME,
       ORIGINATION_DATE,
       CUR_PAR_BAL,
       CUR_BOOK_BAL,
       ACCU_BAL_MTD, --     月初至今余额的累计积数
       ACCU_BAL_MTD_DAY, --       月初至今余额的累计天数
       AVG_BAL_YTD, --   年初至今余额的累计积数
       ACCU_BAL_YTD_DAY, --       年初至今余额的累计天数
       CURRENCY_ID,
       ORG_TERM,
       MATURITY_DATE,
       INTEREST_RATE_FLR,
       ACCRUAL_BASIS_Y,
       ACCRUAL_BASIS_M,
       ADJUST_TYPE,
       AMORTIZATION_TYPE,
       INTEREST_YTD,
       INVEST_GAIN_YTD,
       PRINCIPAL_ACCT_ID,
       INTEREST_ACCT_ID,
       INVEST_GAIN_ACCT_ID)
    
      (SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID
              '0602800009', --开展业务的部门代码,默认为金融市场团队
              A.CUST, --交易对手ID
              '101017', --“债券逆回购”业务的代码C_PS,C_PRODUCT 
              '债券逆回购', --债券逆回购
              A.VDATE, --回购起息日
              A.FACEAMOUNT, --交割券面金额  
              A.AMOUNT, --交易的账面金额 
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              A.CCY, --币种代码
              A.TENOR, --买入返售的期限
              A.MDATE, --逆回购到期日
              A.REPORATE, --逆回购年化收益率  
              A.BASIS, --年化收益率折日利率系数  
              A.BASIS, --月实际计息天数  
              'D00190001', --收益率调整方式（一般为固定）,默认为固定  
              'D00280002', --本息支付方式（一般为到期还本付息）,到期还本付息  
              NULL, --年初至今的累计利息收入 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
              NULL, --年初至今累计投资收益
              NULL, --本金的入账科目号
              NULL, --利息收支的入账科目号
              NULL --投资收益的入账科目号
       
         FROM MA_REPO_DEAL_v A
        WHERE 1 = 1
          AND A.PS = 'RREPO' --逆回购
             
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD')
       
       UNION ALL
       --债券正回购
       
       SELECT QUERY_DATE, --数据日期
              A.DEALNO, --业务唯一ID
              '0602800009', --开展业务的部门代码,默认为金融市场团队
              A.CUST, --交易对手ID
              '102011', --“债券正回购”业务的代码C_PS,C_PRODUCT  
              '债券正回购', --债券正回购
              A.VDATE, --债券卖出交割日期
              A.FACEAMOUNT, --交割券面金额  
              A.AMOUNT, --卖出金额 
              A.BAL_ACCU_M,
              A.DAY_ACCU_M,
              A.BAL_ACCU_Y,
              A.DAY_ACCU_Y,
              A.CCY, --卖出币种
              A.TENOR, --卖出回购期限
              A.MDATE, --债权回购日期
              A.REPORATE, --正回购年化利率 
              A.BASIS, --年化收益率折日利率系数  
              A.BASIS, --月实际计息天数 
              'D00190001', --收益率调整方式（一般为固定）,默认为固定 
              'D00280002', --本息支付方式（一般为到期还本付息）,到期还本付息
              NULL, --年初至今的累计利息收入，支出以负数表示   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
              NULL, --年初至今累计投资收益，支出以负数表示
              NULL, --本金的入账科目号
              NULL, --利息收支的入账科目号
              NULL --投资收益的入账科目号
       
         FROM MA_REPO_DEAL_v A
        WHERE 1 = 1
          AND A.PS = 'REPO'
          AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
              TO_CHAR(SYSDATE, 'YYYYMMDD')
          AND TO_CHAR(A.END_DATE, 'YYYYMMDD') <
              TO_CHAR(SYSDATE, 'YYYYMMDD')); --正回购
    --咨询业务
    INSERT INTO MA_BUSINESS_ACCOUNT_INFOR
      (DATA_DATE,
       ACCOUNT_ID,
       PROJECT_ID,
       PROJECT_NAME,
       ORG_UNIT_ID,
       ASSET_TRANS_PTY_ID,
       PRODUCT_ID,
       PRODUCT_NAME,
       CURRENCY_ID,
       AMORTIZATION_TYPE,
       FIRST_PMT_DATE,
       PMT_TERM,
       PMT_TERM_MULT,
       ADVISER_FEE_YTD,
       ADMIN_FEE_YTD,
       ADVISER_FEE_ACCT_ID)
    
      SELECT QUERY_DATE, --数据日期
             A.PROJECTCODE, --业务唯一ID
             A.PROJECTCODE, --项目号PROJECTCODE   @@@@@@@@@@@@@@@@@
             A.PROJECTNAME, --项目名称PROJECTNAME   @@@@@@@@@@@@@@@@@
             A.DPTID, --开展业务的部门代码
             A.PSHORGNO, --服务对象ID
             '201016', --咨询业务 的代码,摘选类型为“10金融服务业务”
             '咨询业务', --咨询业务 的名称
             A.MONEYTYPE, --业务的币种  
             'D00280003', --资金回收方式,默认为按现金流  @@@@@@@@@@@@@@
             NULL, --合同约定的中间业务收入收取日期
             NULL, --合同约定的中间业务收入的收取周期
             NULL, --合同约定的中间业务收入收取周期的单位
             B.AMOUNT, --年初至今累计中间业务收入,筛选C_REPAY_TYPE 
             NULL,
             NULL
      
        FROM MA_PROJECT_INFO_v A
       INNER JOIN MA_REPAY_CONFIRM_v B
          ON A.PROJECTCODE = B.PROJECTCODE
       WHERE 1 = 1
         AND A.PROJECTNATURE = '10'
         AND B.REPAY_TYPE = '22111服务费及佣金' --暂定
         AND TO_CHAR(A.START_DATE, 'YYYYMMDD') >=
             TO_CHAR(SYSDATE, 'YYYYMMDD')
         AND TO_CHAR(A.END_DATE, 'YYYYMMDD') < TO_CHAR(SYSDATE, 'YYYYMMDD') --摘选类型为“10金融服务业务”
      ;
  
  end;

end CORE_BUSINESS_ETL_PKG;
/
