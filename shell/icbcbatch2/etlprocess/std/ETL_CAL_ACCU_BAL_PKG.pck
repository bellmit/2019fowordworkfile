create or replace package ETL_CAL_ACCU_BAL_PKG is

  -- Author  : GYTZ-KAIF1
  -- Created : 2019/3/6 11:28:28
  -- Purpose : 计算本月、本年累计的金额
  --总程序
  procedure main(p_date date);
  --存放同业、拆放同业、同业拆借、同业借款等月初余额
  procedure deposits_lons_deal_begin(p_date date);

  --存放同业、拆放同业、同业拆借、同业借款等年初余额
  procedure deposits_lons_deal_by(p_date date);
  --存放同业、拆放同业、同业拆借、同业借款等月末余额及其他
  procedure deposits_lons_deal_other(p_date date);

  --购买国债、其他固定收益类证券等月初余额
  procedure security_deal_begin(p_date date);

  --购买国债、其他固定收益类证券等年初余额
  procedure security_deal_by(p_date date);
  --购买国债、其他固定收益类证券等月末余额及其他
  procedure security_deal_other(p_date date);

  --债券正回购、债券逆回购等月初余额
  procedure repo_deal_begin(p_date date);

  --债券正回购、债券逆回购等年初余额
  procedure repo_deal_by(p_date date);
  --债券正回购、债券逆回购月末余额及其他
  procedure repo_deal_other(p_date date);

  --收债转股、发股还债月初余额
  procedure debt_to_equity_swap_begin(p_date date);

  --存放收债转股、发股还债年初余额
  procedure debt_to_equity_swap_by(p_date date);

  --存放收债转股、发股还债月末及其他
  procedure debt_to_equity_swap_other(p_date date);
 
end ETL_CAL_ACCU_BAL_PKG;
/
create or replace package body etl_cal_accu_bal_pkg is

  procedure main(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
  begin
  
      --如果参数日期是月初的话
      if  p_date = trunc(p_date, 'mm') and
          p_date <> trunc(p_date, 'yyyy') then
        etl_cal_accu_bal_pkg.deposits_lons_deal_begin(p_date);
        etl_cal_accu_bal_pkg.security_deal_begin(p_date);
        etl_cal_accu_bal_pkg.repo_deal_begin(p_date);
        etl_cal_accu_bal_pkg.debt_to_equity_swap_begin(p_date);
        --如果参数日期是年初的话
      elsif p_date = trunc(p_date, 'yyyy') then
        etl_cal_accu_bal_pkg.deposits_lons_deal_by(p_date);
        etl_cal_accu_bal_pkg.security_deal_by(p_date);
        etl_cal_accu_bal_pkg.repo_deal_by(p_date);
        etl_cal_accu_bal_pkg.debt_to_equity_swap_by(p_date);
      else
        etl_cal_accu_bal_pkg.deposits_lons_deal_other(p_date);
        etl_cal_accu_bal_pkg.security_deal_other(p_date);
        etl_cal_accu_bal_pkg.repo_deal_other(p_date);
        etl_cal_accu_bal_pkg.debt_to_equity_swap_other(p_date);
      end if;
    commit;
  end;
  --月初余额
  procedure deposits_lons_deal_begin(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t08_deposits_loans_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t08_deposits_loans_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t08_deposits_loans_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amt + d.amt,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amt + d.amt,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空
        elsif c_data.last_date is not null then
        
          insert into std_layer.t08_deposits_loans_deal
            select distinct br,
                   dealno,
                   buis_module,
                   cost,
                   product,
                   prodtype,
                   dl_ps,
                   dealdate,
                   vdate,
                   tenor,
                   tenor_unit,
                   mdate,
                   cust,
                   cust_acct,
                   ccy,
                   amt,
                   ratecode,
                   intrate,
                   int_amt,
                   basis,
                   acrfrstlst,
                   dealtext,
                   status,
                   reversal_status,
                   trad,
                   createuser,
                   createtime,
                   reviewuser,
                   reviewtime,
                   reversaluser,
                   reversaltime,
                   lstmntuser,
                   lstmnttime,
                   fedealno,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t08_deposits_loans_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amt,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t08_deposits_loans_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =d.amt,
                 d.bal_accu_y =d.amt + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t08_deposits_loans_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t08_deposits_loans_deal
            select distinct br,
                   dealno,
                   buis_module,
                   cost,
                   product,
                   prodtype,
                   dl_ps,
                   dealdate,
                   vdate,
                   tenor,
                   tenor_unit,
                   mdate,
                   cust,
                   cust_acct,
                   ccy,
                   amt,
                   ratecode,
                   intrate,
                   int_amt,
                   basis,
                   acrfrstlst,
                   dealtext,
                   status,
                   reversal_status,
                   trad,
                   createuser,
                   createtime,
                   reviewuser,
                   reviewtime,
                   reversaluser,
                   reversaltime,
                   lstmntuser,
                   lstmnttime,
                   fedealno,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t08_deposits_loans_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amt,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t08_deposits_loans_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =d.amt,
                 d.bal_accu_y =d.amt + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --年初
  procedure deposits_lons_deal_by(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t08_deposits_loans_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t08_deposits_loans_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t08_deposits_loans_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amt + d.amt,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amt + d.amt,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空
        elsif c_data.last_date is not null then
        
          insert into std_layer.t08_deposits_loans_deal
            select distinct br,
                   dealno,
                   buis_module,
                   cost,
                   product,
                   prodtype,
                   dl_ps,
                   dealdate,
                   vdate,
                   tenor,
                   tenor_unit,
                   mdate,
                   cust,
                   cust_acct,
                   ccy,
                   amt,
                   ratecode,
                   intrate,
                   int_amt,
                   basis,
                   acrfrstlst,
                   dealtext,
                   status,
                   reversal_status,
                   trad,
                   createuser,
                   createtime,
                   reviewuser,
                   reviewtime,
                   reversaluser,
                   reversaltime,
                   lstmntuser,
                   lstmnttime,
                   fedealno,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t08_deposits_loans_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amt,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t08_deposits_loans_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =d.amt,
                 d.bal_accu_y =d.amt,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t08_deposits_loans_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t08_deposits_loans_deal
            select distinct br,
                   dealno,
                   buis_module,
                   cost,
                   product,
                   prodtype,
                   dl_ps,
                   dealdate,
                   vdate,
                   tenor,
                   tenor_unit,
                   mdate,
                   cust,
                   cust_acct,
                   ccy,
                   amt,
                   ratecode,
                   intrate,
                   int_amt,
                   basis,
                   acrfrstlst,
                   dealtext,
                   status,
                   reversal_status,
                   trad,
                   createuser,
                   createtime,
                   reviewuser,
                   reviewtime,
                   reversaluser,
                   reversaltime,
                   lstmntuser,
                   lstmnttime,
                   fedealno,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t08_deposits_loans_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amt,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t08_deposits_loans_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =d.amt,
                 d.bal_accu_y =d.amt,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --月末及其他
  procedure deposits_lons_deal_other(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t08_deposits_loans_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t08_deposits_loans_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t08_deposits_loans_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amt + d.amt,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amt + d.amt,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空，且参数日期有数据时
        elsif c_data.last_date is not null then
        
          insert into std_layer.t08_deposits_loans_deal
            select distinct br,
                   dealno,
                   buis_module,
                   cost,
                   product,
                   prodtype,
                   dl_ps,
                   dealdate,
                   vdate,
                   tenor,
                   tenor_unit,
                   mdate,
                   cust,
                   cust_acct,
                   ccy,
                   amt,
                   ratecode,
                   intrate,
                   int_amt,
                   basis,
                   acrfrstlst,
                   dealtext,
                   status,
                   reversal_status,
                   trad,
                   createuser,
                   createtime,
                   reviewuser,
                   reviewtime,
                   reversaluser,
                   reversaltime,
                   lstmntuser,
                   lstmnttime,
                   fedealno,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t08_deposits_loans_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amt,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t08_deposits_loans_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =
                 (d.start_date - last_date - 1) * bal_last + d.amt +
                 last_bal_accu_m,
                 d.bal_accu_y =
                 (d.start_date - last_date - 1) * bal_last + d.amt +
                 last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t08_deposits_loans_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t08_deposits_loans_deal
            select distinct br,
                   dealno,
                   buis_module,
                   cost,
                   product,
                   prodtype,
                   dl_ps,
                   dealdate,
                   vdate,
                   tenor,
                   tenor_unit,
                   mdate,
                   cust,
                   cust_acct,
                   ccy,
                   amt,
                   ratecode,
                   intrate,
                   int_amt,
                   basis,
                   acrfrstlst,
                   dealtext,
                   status,
                   reversal_status,
                   trad,
                   createuser,
                   createtime,
                   reviewuser,
                   reviewtime,
                   reversaluser,
                   reversaltime,
                   lstmntuser,
                   lstmnttime,
                   fedealno,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t08_deposits_loans_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amt,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t08_deposits_loans_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t08_deposits_loans_deal d
             set d.bal_accu_m =
                 (d.start_date - last_date - 1) * bal_last + d.amt +
                 last_bal_accu_m,
                 d.bal_accu_y =
                 (d.start_date - last_date - 1) * bal_last + d.amt +
                 last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  
  --月初余额
  procedure security_deal_begin(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t05_security_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t05_security_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t05_security_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空
        elsif c_data.last_date is not null then
        
          insert into std_layer.t05_security_deal
            select distinct dealno,
                  ps,
                  ccy,
                  amount,
                  prinamt,
                  quantity,
                  price,
                  custcode,
                  dealdate,
                  vdate,
                  ratecode,
                  rate,
                  contractid,
                  fedealno,
                  faceamount,
                  fixrate,
                  security,
                  costcentertype,
                  costcenter,
                  deptid,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversal_reason,
                  lstmntuser,
                  lstmnttime,
                  status,
                  posflag,
                  glno,
                  account,
                  extfiled1,
                  reversal_status,
                  tempcode,
                  reject_remark,
                  ps_type,
                  mdate,
                  acup_postdate,
                  frozen,
                  frozenunit,
                  dealphase,
                  br,
                  settlement_path,
                  buis_module,
                  agreementid,
                  product,
                  prodtype,
                  marketissue,
                  feeaimt,
                  taxamt,
                  trftfeeamt,
                  totalamt,
                  settlement,
                  auto_verify,
                  full_price,
                  average_cost,
                  auto_settlement,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_security_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_security_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t05_security_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t05_security_deal
            select distinct  dealno,
                  ps,
                  ccy,
                  amount,
                  prinamt,
                  quantity,
                  price,
                  custcode,
                  dealdate,
                  vdate,
                  ratecode,
                  rate,
                  contractid,
                  fedealno,
                  faceamount,
                  fixrate,
                  security,
                  costcentertype,
                  costcenter,
                  deptid,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversal_reason,
                  lstmntuser,
                  lstmnttime,
                  status,
                  posflag,
                  glno,
                  account,
                  extfiled1,
                  reversal_status,
                  tempcode,
                  reject_remark,
                  ps_type,
                  mdate,
                  acup_postdate,
                  frozen,
                  frozenunit,
                  dealphase,
                  br,
                  settlement_path,
                  buis_module,
                  agreementid,
                  product,
                  prodtype,
                  marketissue,
                  feeaimt,
                  taxamt,
                  trftfeeamt,
                  totalamt,
                  settlement,
                  auto_verify,
                  full_price,
                  average_cost,
                  auto_settlement,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_security_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_security_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --年初
  procedure security_deal_by(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t05_security_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t05_security_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t05_security_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空
        elsif c_data.last_date is not null then
        
          insert into std_layer.t05_security_deal
            select distinct dealno,
                  ps,
                  ccy,
                  amount,
                  prinamt,
                  quantity,
                  price,
                  custcode,
                  dealdate,
                  vdate,
                  ratecode,
                  rate,
                  contractid,
                  fedealno,
                  faceamount,
                  fixrate,
                  security,
                  costcentertype,
                  costcenter,
                  deptid,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversal_reason,
                  lstmntuser,
                  lstmnttime,
                  status,
                  posflag,
                  glno,
                  account,
                  extfiled1,
                  reversal_status,
                  tempcode,
                  reject_remark,
                  ps_type,
                  mdate,
                  acup_postdate,
                  frozen,
                  frozenunit,
                  dealphase,
                  br,
                  settlement_path,
                  buis_module,
                  agreementid,
                  product,
                  prodtype,
                  marketissue,
                  feeaimt,
                  taxamt,
                  trftfeeamt,
                  totalamt,
                  settlement,
                  auto_verify,
                  full_price,
                  average_cost,
                  auto_settlement,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_security_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_security_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t05_security_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t05_security_deal
            select distinct dealno,
                  ps,
                  ccy,
                  amount,
                  prinamt,
                  quantity,
                  price,
                  custcode,
                  dealdate,
                  vdate,
                  ratecode,
                  rate,
                  contractid,
                  fedealno,
                  faceamount,
                  fixrate,
                  security,
                  costcentertype,
                  costcenter,
                  deptid,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversal_reason,
                  lstmntuser,
                  lstmnttime,
                  status,
                  posflag,
                  glno,
                  account,
                  extfiled1,
                  reversal_status,
                  tempcode,
                  reject_remark,
                  ps_type,
                  mdate,
                  acup_postdate,
                  frozen,
                  frozenunit,
                  dealphase,
                  br,
                  settlement_path,
                  buis_module,
                  agreementid,
                  product,
                  prodtype,
                  marketissue,
                  feeaimt,
                  taxamt,
                  trftfeeamt,
                  totalamt,
                  settlement,
                  auto_verify,
                  full_price,
                  average_cost,
                  auto_settlement,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_security_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_security_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --月末及其他
  procedure security_deal_other(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t05_security_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t05_security_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t05_security_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空，且参数日期有数据时
        elsif c_data.last_date is not null then
        
          insert into std_layer.t05_security_deal
           select distinct dealno,
                  ps,
                  ccy,
                  amount,
                  prinamt,
                  quantity,
                  price,
                  custcode,
                  dealdate,
                  vdate,
                  ratecode,
                  rate,
                  contractid,
                  fedealno,
                  faceamount,
                  fixrate,
                  security,
                  costcentertype,
                  costcenter,
                  deptid,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversal_reason,
                  lstmntuser,
                  lstmnttime,
                  status,
                  posflag,
                  glno,
                  account,
                  extfiled1,
                  reversal_status,
                  tempcode,
                  reject_remark,
                  ps_type,
                  mdate,
                  acup_postdate,
                  frozen,
                  frozenunit,
                  dealphase,
                  br,
                  settlement_path,
                  buis_module,
                  agreementid,
                  product,
                  prodtype,
                  marketissue,
                  feeaimt,
                  taxamt,
                  trftfeeamt,
                  totalamt,
                  settlement,
                  auto_verify,
                  full_price,
                  average_cost,
                  auto_settlement,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_security_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_security_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_m,
                 d.bal_accu_y =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t05_security_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t05_security_deal
            select distinct dealno,
                  ps,
                  ccy,
                  amount,
                  prinamt,
                  quantity,
                  price,
                  custcode,
                  dealdate,
                  vdate,
                  ratecode,
                  rate,
                  contractid,
                  fedealno,
                  faceamount,
                  fixrate,
                  security,
                  costcentertype,
                  costcenter,
                  deptid,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversal_reason,
                  lstmntuser,
                  lstmnttime,
                  status,
                  posflag,
                  glno,
                  account,
                  extfiled1,
                  reversal_status,
                  tempcode,
                  reject_remark,
                  ps_type,
                  mdate,
                  acup_postdate,
                  frozen,
                  frozenunit,
                  dealphase,
                  br,
                  settlement_path,
                  buis_module,
                  agreementid,
                  product,
                  prodtype,
                  marketissue,
                  feeaimt,
                  taxamt,
                  trftfeeamt,
                  totalamt,
                  settlement,
                  auto_verify,
                  full_price,
                  average_cost,
                  auto_settlement,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_security_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_security_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t05_security_deal d
             set d.bal_accu_m =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_m,
                 d.bal_accu_y =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  
  --月初余额
  procedure repo_deal_begin(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t05_repo_deal t,
             (select max(d.start_date) start_date, d.dealno
                from std_layer.t05_repo_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t05_repo_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空
        elsif c_data.last_date is not null then
        
          insert into std_layer.t05_repo_deal
            select distinct br,
                  dealno,
                  buis_module,
                  trader,
                  market,
                  product,
                  security,
                  ps,
                  ratecode,
                  reporate,
                  cust,
                  ccy,
                  quantity,
                  faceamount,
                  amount,
                  totlint,
                  dealdate,
                  settdays,
                  vdate,
                  tenor,
                  mdate,
                  basis,
                  feeccy,
                  feeamt,
                  settle_acct_type,
                  settle_acct,
                  v_settlement,
                  m_settlement,
                  costcenter,
                  status,
                  mstatus,
                  reversal_status,
                  fedealno,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversareason,
                  lstmntuser,
                  lstmnttime,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_repo_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_repo_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t05_repo_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t05_repo_deal
            select distinct br,
                  dealno,
                  buis_module,
                  trader,
                  market,
                  product,
                  security,
                  ps,
                  ratecode,
                  reporate,
                  cust,
                  ccy,
                  quantity,
                  faceamount,
                  amount,
                  totlint,
                  dealdate,
                  settdays,
                  vdate,
                  tenor,
                  mdate,
                  basis,
                  feeccy,
                  feeamt,
                  settle_acct_type,
                  settle_acct,
                  v_settlement,
                  m_settlement,
                  costcenter,
                  status,
                  mstatus,
                  reversal_status,
                  fedealno,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversareason,
                  lstmntuser,
                  lstmnttime,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_repo_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_repo_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --年初
  procedure repo_deal_by(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t05_repo_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t05_repo_deal d
               where d.start_date < p_date
            group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t05_repo_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空
        elsif c_data.last_date is not null then
        
          insert into std_layer.t05_repo_deal
            select distinct br,
                  dealno,
                  buis_module,
                  trader,
                  market,
                  product,
                  security,
                  ps,
                  ratecode,
                  reporate,
                  cust,
                  ccy,
                  quantity,
                  faceamount,
                  amount,
                  totlint,
                  dealdate,
                  settdays,
                  vdate,
                  tenor,
                  mdate,
                  basis,
                  feeccy,
                  feeamt,
                  settle_acct_type,
                  settle_acct,
                  v_settlement,
                  m_settlement,
                  costcenter,
                  status,
                  mstatus,
                  reversal_status,
                  fedealno,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversareason,
                  lstmntuser,
                  lstmnttime,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_repo_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_repo_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t05_repo_deal d
      where d.start_date<p_date;
      
     insert into std_layer.t05_repo_deal
            select distinct br,
                  dealno,
                  buis_module,
                  trader,
                  market,
                  product,
                  security,
                  ps,
                  ratecode,
                  reporate,
                  cust,
                  ccy,
                  quantity,
                  faceamount,
                  amount,
                  totlint,
                  dealdate,
                  settdays,
                  vdate,
                  tenor,
                  mdate,
                  basis,
                  feeccy,
                  feeamt,
                  settle_acct_type,
                  settle_acct,
                  v_settlement,
                  m_settlement,
                  costcenter,
                  status,
                  mstatus,
                  reversal_status,
                  fedealno,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversareason,
                  lstmntuser,
                  lstmnttime,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_repo_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_repo_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =d.amount,
                 d.bal_accu_y =d.amount,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --月末及其他
  procedure repo_deal_other(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_dealno     varchar2(100);
    l_dealno_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.dealno,
                      t.start_date,
                      case
                        when t.dealno = e.dealno then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t05_repo_deal t,
             (select max(d.start_date)start_date, d.dealno
                from std_layer.t05_repo_deal d
               where d.start_date < p_date
              group by d.dealno) e
       where t.start_date = p_date;
    /*    select * from(select d.dealno, d.start_date, lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date from std_layer.t08_deposits_loans_deal d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t05_repo_deal d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);
  
    if l_count <>0 then
      for c_data in l_data loop
      
        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.bal_accu_y =
                 (d.start_date - d.vdate) * d.amount + d.amount,
                 d.day_accu_m = d.start_date - d.vdate+1,
                 d.day_accu_y = d.start_date - d.vdate+1
           where d.start_date = p_date
             and d.dealno = c_data.dealno;
        
          --如果最近日期不为空，且参数日期有数据时
        elsif c_data.last_date is not null then
        
          insert into std_layer.t05_repo_deal
            select distinct br,
                  dealno,
                  buis_module,
                  trader,
                  market,
                  product,
                  security,
                  ps,
                  ratecode,
                  reporate,
                  cust,
                  ccy,
                  quantity,
                  faceamount,
                  amount,
                  totlint,
                  dealdate,
                  settdays,
                  vdate,
                  tenor,
                  mdate,
                  basis,
                  feeccy,
                  feeamt,
                  settle_acct_type,
                  settle_acct,
                  v_settlement,
                  m_settlement,
                  costcenter,
                  status,
                  mstatus,
                  reversal_status,
                  fedealno,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversareason,
                  lstmntuser,
                  lstmnttime,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_repo_deal
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and dealno = c_data.dealno;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_repo_deal d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.dealno = c_data.dealno;
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_m,
                 d.bal_accu_y =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.dealno = last_dealno;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t05_repo_deal d
      where d.start_date<p_date;
      
      insert into std_layer.t05_repo_deal
            select distinct br,
                  dealno,
                  buis_module,
                  trader,
                  market,
                  product,
                  security,
                  ps,
                  ratecode,
                  reporate,
                  cust,
                  ccy,
                  quantity,
                  faceamount,
                  amount,
                  totlint,
                  dealdate,
                  settdays,
                  vdate,
                  tenor,
                  mdate,
                  basis,
                  feeccy,
                  feeamt,
                  settle_acct_type,
                  settle_acct,
                  v_settlement,
                  m_settlement,
                  costcenter,
                  status,
                  mstatus,
                  reversal_status,
                  fedealno,
                  createuser,
                  createtime,
                  reviewuser,
                  reviewtime,
                  reversaluser,
                  reversaltime,
                  reversareason,
                  lstmntuser,
                  lstmnttime,
                   settlement_path,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t05_repo_deal
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.amount,
                          d.dealno
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_dealno
            from std_layer.t05_repo_deal d
           where d.start_date = l_max_date;
        
          update std_layer.t05_repo_deal d
             set d.bal_accu_m =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_m,
                 d.bal_accu_y =
                 (d.start_date - last_date - 1) * bal_last + d.amount +
                 last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.dealno = last_dealno;
    end if;
    commit;
  end;
  --收债转股
--月初余额
procedure debt_to_equity_swap_begin(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_contractid     varchar2(100);
    l_contractid_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.contractid,
                      t.start_date,
                      case
                        when t.contractid = e.contractid then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t04_invest_contract t,
             (select max(d.start_date)start_date, d.contractid
                from std_layer.t04_invest_contract d
               where d.start_date < p_date
            group by d.contractid) e
       where t.start_date = p_date;
    /*    select * from(select d.contractid, d.start_date, lag(d.start_date, 1) over(partition by d.contractid order by d.start_date) as last_date from std_layer.t04_invest_contract d) t where t.start_date = p_date;
    */
  begin

    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t04_invest_contract d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);

    if l_count <>0 then
      for c_data in l_data loop

        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =(select (d.start_date - b.realinvestdate) * d.transfermoney + d.transfermoney
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode),
                 d.bal_accu_y =(select (d.start_date - b.realinvestdate) * d.transfermoney + d.transfermoney
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode) ,
                 d.day_accu_m = (select d.start_date - b.realinvestdate+1
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode),
                 d.day_accu_y = (select d.start_date - b.realinvestdate+1
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode)
           where d.start_date = p_date
             and d.contractid = c_data.contractid;

          --如果最近日期不为空
        elsif c_data.last_date is not null then

          insert into std_layer.t04_invest_contract
            select distinct
                   a.contractid,
                   a.projectcode,
                   a.rivalid,
                   a.contractno,
                   a.contractname,
                   a.signdate,
                   a.begdate,
                   a.prestopdate,
                   a.cykind,
                   a.contractbalance,
                   a.industry,
                   a.stcokamount,
                   a.investratio,
                   a.isrepurchase,
                   a.remark,
                   a.repurchaser,
                   a.extendillustration2,
                   a.stock_price,
                   a.investfundname,
                   a.interest,
                   a.stopinterestday,
                   a.startcountday,
                   a.debtamount,
                   a.accrualtaxrate,
                   a.startorg,
                   a.ischeckbycondition,
                   a.checkcondition,
                   a.maininvestpart,
                   a.isenjoyvoteright,
                   a.issendhighsup,
                   a.assetrate,
                   a.transferor,
                   a.dealtype,
                   a.purchasebanlance,
                   a.transfermoney,
                   a.paymenttype,
                   a.fxassetrate,
                   a.otherremark,
                   a.profitlevel,
                   a.investplantype,
                   a.underdescr,
                   a.etl_date,
                    p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t04_invest_contract a
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and contractid = c_data.contractid;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.transfermoney,
                          d.contractid
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_contractid
            from std_layer.t04_invest_contract d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.contractid = c_data.contractid;

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =d.transfermoney,
                 d.bal_accu_y =d.transfermoney + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.contractid = last_contractid;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t04_invest_contract d
      where d.start_date<p_date;

      insert into std_layer.t04_invest_contract
            select distinct
                   a.contractid,
                   a.projectcode,
                   a.rivalid,
                   a.contractno,
                   a.contractname,
                   a.signdate,
                   a.begdate,
                   a.prestopdate,
                   a.cykind,
                   a.contractbalance,
                   a.industry,
                   a.stcokamount,
                   a.investratio,
                   a.isrepurchase,
                   a.remark,
                   a.repurchaser,
                   a.extendillustration2,
                   a.stock_price,
                   a.investfundname,
                   a.interest,
                   a.stopinterestday,
                   a.startcountday,
                   a.debtamount,
                   a.accrualtaxrate,
                   a.startorg,
                   a.ischeckbycondition,
                   a.checkcondition,
                   a.maininvestpart,
                   a.isenjoyvoteright,
                   a.issendhighsup,
                   a.assetrate,
                   a.transferor,
                   a.dealtype,
                   a.purchasebanlance,
                   a.transfermoney,
                   a.paymenttype,
                   a.fxassetrate,
                   a.otherremark,
                   a.profitlevel,
                   a.investplantype,
                   a.underdescr,
                   a.etl_date,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t04_invest_contract a
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.transfermoney,
                          d.contractid
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_contractid
            from std_layer.t04_invest_contract d
           where d.start_date = l_max_date;

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =d.transfermoney,
                 d.bal_accu_y =d.transfermoney + last_bal_accu_y,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.contractid = last_contractid;
    end if;
  end;
--年初余额
 procedure debt_to_equity_swap_by(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_contractid     varchar2(100);
    l_contractid_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.contractid,
                      t.start_date,
                      case
                        when t.contractid = e.contractid then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t04_invest_contract t,
             (select max(d.start_date)start_date, d.contractid
                from std_layer.t04_invest_contract d
               where d.start_date < p_date
            group by d.contractid) e
       where t.start_date = p_date;
    /*    select * from(select d.contractid, d.start_date, lag(d.start_date, 1) over(partition by d.contractid order by d.start_date) as last_date from std_layer.t04_invest_contract d) t where t.start_date = p_date;
    */
  begin

    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t04_invest_contract d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);

    if l_count <>0 then
      for c_data in l_data loop

        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =(select (d.start_date - b.realinvestdate) * d.transfermoney + d.transfermoney
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode),
                 d.bal_accu_y =(select (d.start_date - b.realinvestdate) * d.transfermoney + d.transfermoney
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode) ,
                 d.day_accu_m = (select d.start_date - b.realinvestdate+1
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode),
                 d.day_accu_y = (select d.start_date - b.realinvestdate+1
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode)
           where d.start_date = p_date
             and d.contractid = c_data.contractid;


          --如果最近日期不为空
        elsif c_data.last_date is not null then

          insert into std_layer.t04_invest_contract
            select distinct
                   a.contractid,
                   a.projectcode,
                   a.rivalid,
                   a.contractno,
                   a.contractname,
                   a.signdate,
                   a.begdate,
                   a.prestopdate,
                   a.cykind,
                   a.contractbalance,
                   a.industry,
                   a.stcokamount,
                   a.investratio,
                   a.isrepurchase,
                   a.remark,
                   a.repurchaser,
                   a.extendillustration2,
                   a.stock_price,
                   a.investfundname,
                   a.interest,
                   a.stopinterestday,
                   a.startcountday,
                   a.debtamount,
                   a.accrualtaxrate,
                   a.startorg,
                   a.ischeckbycondition,
                   a.checkcondition,
                   a.maininvestpart,
                   a.isenjoyvoteright,
                   a.issendhighsup,
                   a.assetrate,
                   a.transferor,
                   a.dealtype,
                   a.purchasebanlance,
                   a.transfermoney,
                   a.paymenttype,
                   a.fxassetrate,
                   a.otherremark,
                   a.profitlevel,
                   a.investplantype,
                   a.underdescr,
                   a.etl_date,
                    p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t04_invest_contract a
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and contractid = c_data.contractid;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.transfermoney,
                          d.contractid
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_contractid
            from std_layer.t04_invest_contract d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.contractid = c_data.contractid;

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =d.transfermoney,
                 d.bal_accu_y =d.transfermoney ,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.contractid = last_contractid;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t04_invest_contract d
      where d.start_date<p_date;

      insert into std_layer.t04_invest_contract
            select distinct
                   a.contractid,
                   a.projectcode,
                   a.rivalid,
                   a.contractno,
                   a.contractname,
                   a.signdate,
                   a.begdate,
                   a.prestopdate,
                   a.cykind,
                   a.contractbalance,
                   a.industry,
                   a.stcokamount,
                   a.investratio,
                   a.isrepurchase,
                   a.remark,
                   a.repurchaser,
                   a.extendillustration2,
                   a.stock_price,
                   a.investfundname,
                   a.interest,
                   a.stopinterestday,
                   a.startcountday,
                   a.debtamount,
                   a.accrualtaxrate,
                   a.startorg,
                   a.ischeckbycondition,
                   a.checkcondition,
                   a.maininvestpart,
                   a.isenjoyvoteright,
                   a.issendhighsup,
                   a.assetrate,
                   a.transferor,
                   a.dealtype,
                   a.purchasebanlance,
                   a.transfermoney,
                   a.paymenttype,
                   a.fxassetrate,
                   a.otherremark,
                   a.profitlevel,
                   a.investplantype,
                   a.underdescr,
                   a.etl_date,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t04_invest_contract a
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.transfermoney,
                          d.contractid
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_contractid
            from std_layer.t04_invest_contract d
           where d.start_date = l_max_date;

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =d.transfermoney,
                 d.bal_accu_y =d.transfermoney,
                 d.day_accu_m = 1,
                 d.day_accu_y = 1
           where d.start_date = p_date
             and d.contractid = last_contractid;
    end if;
  commit;
  end;
--月末及其他
procedure debt_to_equity_swap_other(p_date date) is
    l_count         number;
    last_bal_accu_m number;
    last_bal_accu_y number;
    bal_last        number;
    last_date       date;
    last_contractid     varchar2(100);
    l_contractid_count  number; --判断参数日期对应的上个日期的交易编号是否已经存在
    l_max_date    date;
    cursor l_data is
      select distinct t.contractid,
                      t.start_date,
                      case
                        when t.contractid = e.contractid then
                         to_char(e.start_date, 'yyyy/mm/dd')
                        else
                         ''
                      end last_date
        from std_layer.t04_invest_contract t,
             (select max(d.start_date)start_date, d.contractid
                from std_layer.t04_invest_contract d
               where d.start_date < p_date
            group by d.contractid) e
       where t.start_date = p_date;
    /*    select * from(select d.contractid, d.start_date, lag(d.start_date, 1) over(partition by d.contractid order by d.start_date) as last_date from std_layer.t04_invest_contract d) t where t.start_date = p_date;
    */
  begin
    --循环
    --判断参数日期是否插入数据
    select count(*)
      into l_count
      from std_layer.t04_invest_contract d
     where d.start_date = p_date;
    dbms_output.put_line(l_count);

    if l_count <>0 then
      for c_data in l_data loop

        --执行过程，从贴源层插入数据到标准差
        -- std_layer.etl_process_aics.update_deposits_loans_deal;
        --如果最近日期为空，那么累计余额start_date-vdate(起始日期)
        if c_data.last_date is null then

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =(select (d.start_date - b.realinvestdate) * d.transfermoney + d.transfermoney
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode),
                 d.bal_accu_y =(select (d.start_date - b.realinvestdate) * d.transfermoney + d.transfermoney
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode) ,
                 d.day_accu_m = (select d.start_date - b.realinvestdate+1
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode),
                 d.day_accu_y = (select d.start_date - b.realinvestdate+1
                                  from std_layer.t08_equity_assets_info b
                                 where d.projectcode = b.projectcode)
           where d.start_date = p_date
             and d.contractid = c_data.contractid;
             commit;

          --如果最近日期不为空
        elsif c_data.last_date is not null then

          insert into std_layer.t04_invest_contract
            select distinct
                   a.contractid,
                   a.projectcode,
                   a.rivalid,
                   a.contractno,
                   a.contractname,
                   a.signdate,
                   a.begdate,
                   a.prestopdate,
                   a.cykind,
                   a.contractbalance,
                   a.industry,
                   a.stcokamount,
                   a.investratio,
                   a.isrepurchase,
                   a.remark,
                   a.repurchaser,
                   a.extendillustration2,
                   a.stock_price,
                   a.investfundname,
                   a.interest,
                   a.stopinterestday,
                   a.startcountday,
                   a.debtamount,
                   a.accrualtaxrate,
                   a.startorg,
                   a.ischeckbycondition,
                   a.checkcondition,
                   a.maininvestpart,
                   a.isenjoyvoteright,
                   a.issendhighsup,
                   a.assetrate,
                   a.transferor,
                   a.dealtype,
                   a.purchasebanlance,
                   a.transfermoney,
                   a.paymenttype,
                   a.fxassetrate,
                   a.otherremark,
                   a.profitlevel,
                   a.investplantype,
                   a.underdescr,
                   a.etl_date,
                    p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t04_invest_contract a
             where start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
               and contractid = c_data.contractid;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.transfermoney,
                          d.contractid
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_contractid
            from std_layer.t04_invest_contract d
           where d.start_date = to_date(c_data.last_date, 'yyyy/mm/dd')
             and d.contractid = c_data.contractid;

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =(d.start_date - last_date - 1) * bal_last + d.transfermoney + last_bal_accu_m,
                 d.bal_accu_y =(d.start_date - last_date - 1) * bal_last + d.transfermoney + last_bal_accu_y,
                 d.day_accu_m =d.start_date - last_date+1,
                 d.day_accu_y =d.start_date - last_date+1
           where d.start_date = p_date
             and d.contractid = last_contractid;
             commit;
        end if;
      end loop;
    else
      select max(d.start_date)
      into l_max_date
      from std_layer.t04_invest_contract d
      where d.start_date<p_date;

      insert into std_layer.t04_invest_contract
            select distinct
                   a.contractid,
                   a.projectcode,
                   a.rivalid,
                   a.contractno,
                   a.contractname,
                   a.signdate,
                   a.begdate,
                   a.prestopdate,
                   a.cykind,
                   a.contractbalance,
                   a.industry,
                   a.stcokamount,
                   a.investratio,
                   a.isrepurchase,
                   a.remark,
                   a.repurchaser,
                   a.extendillustration2,
                   a.stock_price,
                   a.investfundname,
                   a.interest,
                   a.stopinterestday,
                   a.startcountday,
                   a.debtamount,
                   a.accrualtaxrate,
                   a.startorg,
                   a.ischeckbycondition,
                   a.checkcondition,
                   a.maininvestpart,
                   a.isenjoyvoteright,
                   a.issendhighsup,
                   a.assetrate,
                   a.transferor,
                   a.dealtype,
                   a.purchasebanlance,
                   a.transfermoney,
                   a.paymenttype,
                   a.fxassetrate,
                   a.otherremark,
                   a.profitlevel,
                   a.investplantype,
                   a.underdescr,
                   a.etl_date,
                   p_date,
                   to_date('9999-12-31', 'yyyy/mm/dd'),
                   null,
                   null,
                   null,
                   null
              from std_layer.t04_invest_contract a
             where start_date = l_max_date;
          commit;
          --参数日期对应的上个日期的相关数据
          select distinct d.bal_accu_m,
                          d.bal_accu_y,
                          d.start_date,
                          d.transfermoney,
                          d.contractid
            into last_bal_accu_m,
                 last_bal_accu_y,
                 last_date,
                 bal_last,
                 last_contractid
            from std_layer.t04_invest_contract d
           where d.start_date = l_max_date;

          update std_layer.t04_invest_contract d
             set d.bal_accu_m =(d.start_date - last_date - 1) * bal_last + d.transfermoney + last_bal_accu_m,
                 d.bal_accu_y =(d.start_date - last_date - 1) * bal_last + d.transfermoney + last_bal_accu_y,
                 d.day_accu_m = d.start_date - last_date+1,
                 d.day_accu_y = d.start_date - last_date+1
           where d.start_date = p_date
             and d.contractid = last_contractid;
         commit;
    end if;
    commit;
   end;
end etl_cal_accu_bal_pkg;
/
