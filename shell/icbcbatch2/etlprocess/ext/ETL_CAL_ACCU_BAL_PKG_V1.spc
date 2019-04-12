create or replace package ETL_CAL_ACCU_BAL_PKG_V1 is

  -- Author  : GYTZ-KAIF1
  -- Created : 2019/3/6 11:28:28
  -- Purpose : 计算本月、本年累计的金额
  --总程序
  procedure main(p_date date);
  --存放同业、拆放同业、同业拆借、同业借款等余额
  procedure deposits_lons_deal(p_date date);

  --购买国债、其他固定收益类证券等余额
  procedure security_deal(p_date date);

  --债券正回购、债券逆回购等余额
  procedure repo_deal(p_date date);

  --收债转股、发股还债余额
  procedure debt_to_equity_swap(p_date date);

end ETL_CAL_ACCU_BAL_PKG_v1;
/
