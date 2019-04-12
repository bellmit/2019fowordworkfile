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
create or replace package body etl_cal_accu_bal_pkg_v1 is
  procedure main(p_date date) is
  begin
    etl_cal_accu_bal_pkg_v1.deposits_lons_deal(p_date);
    etl_cal_accu_bal_pkg_v1.security_deal(p_date);
    etl_cal_accu_bal_pkg_v1.repo_deal(p_date);
    etl_cal_accu_bal_pkg_v1.debt_to_equity_swap(p_date);
    commit;
  end;

  --购买国债、其他固定收益类证券等余额
  procedure deposits_lons_deal(p_date date) is
  begin
    delete from std_layer.temp_deposits_lons_deal;
    commit;
    insert into std_layer.temp_deposits_lons_deal
      select w2.dealno,
             w2.p_date,
             w2.last_date,
             w2.vdate,
             w2.start_date,
             w2.tobe_accu_m,
             w2.tobe_accu_y,
             w2.tobe_day_accu_m,
             w2.tobe_day_accu_y,
             w2.bal_accu_m,
             w2.bal_accu_y,
             w2.day_accu_m,
             w2.day_accu_y,
             w2.amt,
             w2.last_bal_accu_m,
             w2.last_bal_accu_y,
             w2.last_day_accu_m,
             w2.last_day_accu_y,
             w2.last_amt,
             w1.br,
             w1.buis_module,
             w1.cost,
             w1.product,
             w1.prodtype,
             w1.dl_ps,
             w1.dealdate,
             w1.tenor,
             w1.tenor_unit,
             w1.mdate,
             w1.cust,
             w1.cust_acct,
             w1.ccy,
             w1.ratecode,
             w1.intrate,
             w1.int_amt,
             w1.basis,
             w1.acrfrstlst,
             w1.dealtext,
             w1.status,
             w1.reversal_status,
             w1.trad,
             w1.createuser,
             w1.createtime,
             w1.reviewuser,
             w1.reviewtime,
             w1.reversaluser,
             w1.reversaltime,
             w1.lstmntuser,
             w1.lstmnttime,
             w1.fedealno,
             w1.settlement_path,
             w1.end_date
        from (select dealno,
                     p_date,
                     last_date,
                     vdate,
                     start_date,
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        amt
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        amt
                       else
                        (start_date - last_date - 1) * last_amt + amt +
                        last_bal_accu_m --月末及其他
                     end tobe_accu_m, --月余额结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        amt
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        amt + last_bal_accu_y
                       else
                        (start_date - last_date - 1) * last_amt + amt +
                        last_bal_accu_y
                     end tobe_accu_y, --年余额结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        1
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_m, --月日期结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        1
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_y, --年日期结果
                     sum(bal_accu_m) bal_accu_m,
                     sum(bal_accu_y) bal_accu_y,
                     sum(day_accu_m) day_accu_m,
                     sum(day_accu_y) day_accu_y,
                     sum(amt) amt,
                     sum(last_bal_accu_m) last_bal_accu_m,
                     sum(last_bal_accu_y) last_bal_accu_y,
                     sum(last_day_accu_m) last_day_accu_m,
                     sum(last_day_accu_y) last_day_accu_y,
                     sum(last_amt) last_amt
                from (select d.dealno, --交易编号
                             p_date, --参数日期
                             t.last_date, --上一个日期
                             d.vdate, --起息日
                             max(d.start_date) start_date, --开始日期
                             sum(d.amt) amt, --金额
                             t.last_bal_accu_m, --上一个日期月金额
                             t.last_bal_accu_y, --上一个日期年金额
                             t.last_day_accu_m, --上一个日期月天数
                             t.last_day_accu_y, --上一个日期月天数
                             t.last_amt, --上一个日期的金额
                             t.bal_accu_m,
                             t.bal_accu_y,
                             t.day_accu_m,
                             t.day_accu_y
                        from std_layer.t08_deposits_loans_deal_v1 d
                        left join (select m.dealno,
                                         m.start_date,
                                         m.last_date,
                                         d.bal_accu_m last_bal_accu_m,
                                         d.bal_accu_y last_bal_accu_y,
                                         d.day_accu_m last_day_accu_m,
                                         d.day_accu_y last_day_accu_y,
                                         d.amt        last_amt,
                                         m.bal_accu_m,
                                         m.bal_accu_y,
                                         m.day_accu_m,
                                         m.day_accu_y
                                  
                                    from (select d.dealno,
                                                 d.start_date,
                                                 (d.start_date - d.vdate) *
                                                 d.amt + d.amt bal_accu_m,
                                                 (d.start_date - d.vdate) *
                                                 d.amt + d.amt bal_accu_y,
                                                 d.start_date - d.vdate + 1 day_accu_m,
                                                 d.start_date - d.vdate + 1 day_accu_y,
                                                 lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date
                                            from std_layer.t08_deposits_loans_deal_v1 d) m
                                    left join std_layer.t08_deposits_loans_deal_v1 d
                                      on m.dealno = d.dealno
                                     and m.last_date = d.start_date
                                   where (m.start_date, m.dealno) in
                                         (select max(start_date), dealno
                                            from std_layer.t08_deposits_loans_deal_v1
                                           group by dealno)) t
                          on d.dealno = t.dealno
                       group by d.dealno,
                                t.last_date,
                                d.vdate， t.last_bal_accu_m, --上一个日期月金额
                                t.last_bal_accu_y, --上一个日期年金额
                                t.last_day_accu_m, --上一个日期月天数
                                t.last_day_accu_y, --上一个日期月天数
                                t.last_amt, --上一个日期的金额
                                t.bal_accu_m,
                                t.bal_accu_y,
                                t.day_accu_m,
                                t.day_accu_y) w1
              
               group by dealno,
                        p_date,
                        last_date,
                        vdate,
                        start_date,
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           amt
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           amt
                          else
                           (start_date - last_date - 1) * last_amt + amt +
                           last_bal_accu_m --月末及其他
                        end, --月余额结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           amt
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           amt + last_bal_accu_y
                          else
                           (start_date - last_date - 1) * last_amt + amt +
                           last_bal_accu_y
                        end, --年余额结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           1
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end, --月日期结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           1
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end --年日期结果
              
              ) w2
        left join std_layer.t08_deposits_loans_deal_v1 w1
          on w1.dealno = w2.dealno
         and w1.start_date = w2.start_date;
    commit;
  
    --当最近日期为空时：
    merge into std_layer.t08_deposits_loans_deal_v1 w1
    using std_layer.temp_deposits_lons_deal w2
    on (w1.dealno = w2.dealno and w1.start_date = p_date and w2.last_date is null)
    when matched then
      update
         set w1.bal_accu_m = w2.bal_accu_m,
             w1.bal_accu_y = w2.bal_accu_y,
             w1.day_accu_m = w2.day_accu_m,
             w1.day_accu_y = w2.day_accu_y;
    commit;
  
    --当最近日期不为空时：
    MERGE INTO std_layer.t08_deposits_loans_deal_v1 W1
    USING std_layer.temp_deposits_lons_deal W2
    on (w1.dealno = w2.dealno and w1.start_date = p_date and w2.last_date is not null)
    when matched then
      update
         set w1.bal_accu_m = w2.tobe_accu_m,
             w1.bal_accu_y = w2.tobe_accu_y,
             w1.day_accu_m = w2.tobe_day_accu_m,
             w1.day_accu_y = w2.tobe_day_accu_y
    when not matched then
      insert
        (w1.br,
         w1.dealno,
         w1.buis_module,
         w1.cost,
         w1.product,
         w1.prodtype,
         w1.dl_ps,
         w1.dealdate,
         w1.vdate,
         w1.tenor,
         w1.tenor_unit,
         w1.mdate,
         w1.cust,
         w1.cust_acct,
         w1.ccy,
         w1.amt,
         w1.ratecode,
         w1.intrate,
         w1.int_amt,
         w1.basis,
         w1.acrfrstlst,
         w1.dealtext,
         w1.status,
         w1.reversal_status,
         w1.trad,
         w1.createuser,
         w1.createtime,
         w1.reviewuser,
         w1.reviewtime,
         w1.reversaluser,
         w1.reversaltime,
         w1.lstmntuser,
         w1.lstmnttime,
         w1.fedealno,
         w1.settlement_path,
         w1.start_date,
         w1.end_date,
         w1.bal_accu_m,
         w1.bal_accu_y,
         w1.day_accu_m,
         w1.day_accu_y)
      values
        (w2.br,
         w2.dealno,
         w2.buis_module,
         w2.cost,
         w2.product,
         w2.prodtype,
         w2.dl_ps,
         w2.dealdate,
         w2.vdate,
         w2.tenor,
         w2.tenor_unit,
         w2.mdate,
         w2.cust,
         w2.cust_acct,
         w2.ccy,
         w2.amt,
         w2.ratecode,
         w2.intrate,
         w2.int_amt,
         w2.basis,
         w2.acrfrstlst,
         w2.dealtext,
         w2.status,
         w2.reversal_status,
         w2.trad,
         w2.createuser,
         w2.createtime,
         w2.reviewuser,
         w2.reviewtime,
         w2.reversaluser,
         w2.reversaltime,
         w2.lstmntuser,
         w2.lstmnttime,
         w2.fedealno,
         w2.settlement_path,
         p_date,
         to_date('9999-12-31', 'yyyy/mm/dd'),
         w2.tobe_accu_m,
         w2.tobe_accu_y,
         w2.tobe_day_accu_m,
         w2.tobe_day_accu_y);
    commit;
  end;
  --债券正回购、债券逆回购等余额
  procedure security_deal(p_date date) is
  begin
    delete from std_layer.temp_t05_security_deal;
    commit;
    insert into std_layer.temp_t05_security_deal
      select w2.dealno,
             w2.p_date,
             w2.last_date,
             w2.vdate,
             w2.start_date,
             w2.tobe_accu_m,
             w2.tobe_accu_y,
             w2.tobe_day_accu_m,
             w2.tobe_day_accu_y,
             w2.bal_accu_m,
             w2.bal_accu_y,
             w2.day_accu_m,
             w2.day_accu_y,
             w2.amount,
             w2.last_bal_accu_m,
             w2.last_bal_accu_y,
             w2.last_day_accu_m,
             w2.last_day_accu_y,
             w2.last_amount,
             w1.ps,
             w1.ccy,
             w1.prinamt,
             w1.quantity,
             w1.price,
             w1.custcode,
             w1.dealdate,
             w1.ratecode,
             w1.rate,
             w1.contractid,
             w1.fedealno,
             w1.faceamount,
             w1.fixrate,
             w1.security,
             w1.costcentertype,
             w1.costcenter,
             w1.deptid,
             w1.createuser,
             w1.createtime,
             w1.reviewuser,
             w1.reviewtime,
             w1.reversaluser,
             w1.reversaltime,
             w1.reversal_reason,
             w1.lstmntuser,
             w1.lstmnttime,
             w1.status,
             w1.posflag,
             w1.glno,
             w1.account,
             w1.extfiled1,
             w1.reversal_status,
             w1.tempcode,
             w1.reject_remark,
             w1.ps_type,
             w1.mdate,
             w1.acup_postdate,
             w1.frozen,
             w1.frozenunit,
             w1.dealphase,
             w1.br,
             w1.settlement_path,
             w1.buis_module,
             w1.agreementid,
             w1.product,
             w1.prodtype,
             w1.marketissue,
             w1.feeaimt,
             w1.taxamt,
             w1.trftfeeamt,
             w1.totalamt,
             w1.settlement,
             w1.auto_verify,
             w1.full_price,
             w1.average_cost,
             w1.auto_settlement,
             w1.end_date
        from (select dealno,
                     to_date('2019-03-06', 'yyyy-mm-dd') p_date,
                     last_date,
                     vdate,
                     start_date,
                     case
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --年初
                        then
                        amount
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'mm') and
                            to_date('2019-03-06', 'yyyy-mm-dd') <>
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --月初
                        then
                        amount
                       else
                        (start_date - last_date - 1) * last_amount + amount +
                        last_bal_accu_m --月末及其他
                     end tobe_accu_m, --月余额结果
                     case
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --年初
                        then
                        amount
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'mm') and
                            to_date('2019-03-06', 'yyyy-mm-dd') <>
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --月初
                        then
                        amount + last_bal_accu_y
                       else
                        (start_date - last_date - 1) * last_amount + amount +
                        last_bal_accu_y
                     end tobe_accu_y, --年余额结果
                     case
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --年初
                        then
                        1
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'mm') and
                            to_date('2019-03-06', 'yyyy-mm-dd') <>
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_m, --月日期结果
                     case
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --年初
                        then
                        1
                       when to_date('2019-03-06', 'yyyy-mm-dd') =
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'mm') and
                            to_date('2019-03-06', 'yyyy-mm-dd') <>
                            trunc(to_date('2019-03-06', 'yyyy-mm-dd'), 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_y, --年日期结果
                     sum(bal_accu_m) bal_accu_m,
                     sum(bal_accu_y) bal_accu_y,
                     sum(day_accu_m) day_accu_m,
                     sum(day_accu_y) day_accu_y,
                     sum(amount) amount,
                     sum(last_bal_accu_m) last_bal_accu_m,
                     sum(last_bal_accu_y) last_bal_accu_y,
                     sum(last_day_accu_m) last_day_accu_m,
                     sum(last_day_accu_y) last_day_accu_y,
                     sum(last_amount) last_amount
                from (select d.dealno, --交易编号
                             to_date('2019-03-06', 'yyyy-mm-dd'), --参数日期
                             t.last_date, --上一个日期
                             d.vdate, --起息日
                             max(d.start_date) start_date, --开始日期
                             sum(d.amount) amount, --金额
                             t.last_bal_accu_m, --上一个日期月金额
                             t.last_bal_accu_y, --上一个日期年金额
                             t.last_day_accu_m, --上一个日期月天数
                             t.last_day_accu_y, --上一个日期月天数
                             t.last_amount, --上一个日期的金额
                             t.bal_accu_m,
                             t.bal_accu_y,
                             t.day_accu_m,
                             t.day_accu_y
                        from std_layer.t05_security_deal_v1 d
                        left join (select m.dealno,
                                         m.start_date,
                                         m.last_date,
                                         d.bal_accu_m last_bal_accu_m,
                                         d.bal_accu_y last_bal_accu_y,
                                         d.day_accu_m last_day_accu_m,
                                         d.day_accu_y last_day_accu_y,
                                         d.amount     last_amount,
                                         m.bal_accu_m,
                                         m.bal_accu_y,
                                         m.day_accu_m,
                                         m.day_accu_y
                                  
                                    from (select d.dealno,
                                                 d.start_date,
                                                 (d.start_date - d.vdate) *
                                                 d.amount + d.amount bal_accu_m,
                                                 (d.start_date - d.vdate) *
                                                 d.amount + d.amount bal_accu_y,
                                                 d.start_date - d.vdate + 1 day_accu_m,
                                                 d.start_date - d.vdate + 1 day_accu_y,
                                                 lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date
                                            from std_layer.t05_security_deal_v1 d) m
                                    left join std_layer.t05_security_deal_v1 d
                                      on m.dealno = d.dealno
                                     and m.last_date = d.start_date
                                   where (m.start_date, m.dealno) in
                                         (select max(start_date), dealno
                                            from std_layer.t05_security_deal_v1
                                           group by dealno)) t
                          on d.dealno = t.dealno
                       group by d.dealno,
                                t.last_date,
                                d.vdate， t.last_bal_accu_m, --上一个日期月金额
                                t.last_bal_accu_y, --上一个日期年金额
                                t.last_day_accu_m, --上一个日期月天数
                                t.last_day_accu_y, --上一个日期月天数
                                t.last_amount, --上一个日期的金额
                                t.bal_accu_m,
                                t.bal_accu_y,
                                t.day_accu_m,
                                t.day_accu_y) w1
              
               group by dealno,
                        to_date('2019-03-06', 'yyyy-mm-dd'),
                        last_date,
                        vdate,
                        start_date,
                        case
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --年初
                           then
                           amount
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'mm') and
                               to_date('2019-03-06', 'yyyy-mm-dd') <>
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --月初
                           then
                           amount
                          else
                           (start_date - last_date - 1) * last_amount +
                           amount + last_bal_accu_m --月末及其他
                        end, --月余额结果
                        case
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --年初
                           then
                           amount
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'mm') and
                               to_date('2019-03-06', 'yyyy-mm-dd') <>
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --月初
                           then
                           amount + last_bal_accu_y
                          else
                           (start_date - last_date - 1) * last_amount +
                           amount + last_bal_accu_y
                        end, --年余额结果
                        case
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --年初
                           then
                           1
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'mm') and
                               to_date('2019-03-06', 'yyyy-mm-dd') <>
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end, --月日期结果
                        case
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --年初
                           then
                           1
                          when to_date('2019-03-06', 'yyyy-mm-dd') =
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'mm') and
                               to_date('2019-03-06', 'yyyy-mm-dd') <>
                               trunc(to_date('2019-03-06', 'yyyy-mm-dd'),
                                     'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end --年日期结果
              
              ) w2
        left join std_layer.t05_security_deal_v1 w1
          on w1.dealno = w2.dealno
         and w1.start_date = w2.start_date;
    commit;
  
    --当最近日期为空时：
    merge into std_layer.t05_security_deal_v1 w1
    using w2
    on (w1.dealno = w2.dealno and w1.start_date = p_date and w2.last_date is null)
    when matched then
      update
         set w1.bal_accu_m = w2.bal_accu_m,
             w1.bal_accu_y = w2.bal_accu_y,
             w1.day_accu_m = w2.day_accu_m,
             w1.day_accu_y = w2.day_accu_y;
    commit;
  
    --当最近日期不为空时：
    MERGE INTO std_layer.t05_security_deal_v1 W1
    USING temp_t05_security_deal W2
    on (w1.dealno = w2.dealno and w1.start_date = p_date and w2.last_date is not null)
    when matched then
      update
         set w1.bal_accu_m = w2.tobe_accu_m,
             w1.bal_accu_y = w2.tobe_accu_y,
             w1.day_accu_m = w2.tobe_day_accu_m,
             w1.day_accu_y = w2.tobe_day_accu_y
    when not matched then
      insert
        (w1.dealno,
         w1.ps,
         w1.ccy,
         w1.amount,
         w1.prinamt,
         w1.quantity,
         w1.price,
         w1.custcode,
         w1.dealdate,
         w1.vdate,
         w1.ratecode,
         w1.rate,
         w1.contractid,
         w1.fedealno,
         w1.faceamount,
         w1.fixrate,
         w1.security,
         w1.costcentertype,
         w1.costcenter,
         w1.deptid,
         w1.createuser,
         w1.createtime,
         w1.reviewuser,
         w1.reviewtime,
         w1.reversaluser,
         w1.reversaltime,
         w1.reversal_reason,
         w1.lstmntuser,
         w1.lstmnttime,
         w1.status,
         w1.posflag,
         w1.glno,
         w1.account,
         w1.extfiled1,
         w1.reversal_status,
         w1.tempcode,
         w1.reject_remark,
         w1.ps_type,
         w1.mdate,
         w1.acup_postdate,
         w1.frozen,
         w1.frozenunit,
         w1.dealphase,
         w1.br,
         w1.settlement_path,
         w1.buis_module,
         w1.agreementid,
         w1.product,
         w1.prodtype,
         w1.marketissue,
         w1.feeaimt,
         w1.taxamt,
         w1.trftfeeamt,
         w1.totalamt,
         w1.settlement,
         w1.auto_verify,
         w1.full_price,
         w1.average_cost,
         w1.auto_settlement,
         w1.start_date,
         w1.end_date,
         w1.bal_accu_m,
         w1.bal_accu_y,
         w1.day_accu_m,
         w1.day_accu_y)
      values
        (w2.dealno,
         w2.ps,
         w2.ccy,
         w2.amount,
         w2.prinamt,
         w2.quantity,
         w2.price,
         w2.custcode,
         w2.dealdate,
         w2.vdate,
         w2.ratecode,
         w2.rate,
         w2.contractid,
         w2.fedealno,
         w2.faceamount,
         w2.fixrate,
         w2.security,
         w2.costcentertype,
         w2.costcenter,
         w2.deptid,
         w2.createuser,
         w2.createtime,
         w2.reviewuser,
         w2.reviewtime,
         w2.reversaluser,
         w2.reversaltime,
         w2.reversal_reason,
         w2.lstmntuser,
         w2.lstmnttime,
         w2.status,
         w2.posflag,
         w2.glno,
         w2.account,
         w2.extfiled1,
         w2.reversal_status,
         w2.tempcode,
         w2.reject_remark,
         w2.ps_type,
         w2.mdate,
         w2.acup_postdate,
         w2.frozen,
         w2.frozenunit,
         w2.dealphase,
         w2.br,
         w2.settlement_path,
         w2.buis_module,
         w2.agreementid,
         w2.product,
         w2.prodtype,
         w2.marketissue,
         w2.feeaimt,
         w2.taxamt,
         w2.trftfeeamt,
         w2.totalamt,
         w2.settlement,
         w2.auto_verify,
         w2.full_price,
         w2.average_cost,
         w2.auto_settlement,
         p_date， to_date('9999-12-31', 'yyyy/mm/dd'),
         w2.tobe_accu_m,
         w2.tobe_accu_y,
         w2.tobe_day_accu_m,
         w2.tobe_day_accu_y);
    commit;
  end;
  ----债券正回购、债券逆回购等余额
  procedure repo_deal(p_date date) is
  
  begin
    delete from std_layer.temp_t05_repo_deal;
    commit;
    insert into std_layer.temp_t05_repo_deal
      select w2.dealno,
             w2.p_date,
             w2.last_date,
             w2.vdate,
             w2.start_date,
             w2.tobe_accu_m,
             w2.tobe_accu_y,
             w2.tobe_day_accu_m,
             w2.tobe_day_accu_y,
             w2.bal_accu_m,
             w2.bal_accu_y,
             w2.day_accu_m,
             w2.day_accu_y,
             w2.amount,
             w2.last_bal_accu_m,
             w2.last_bal_accu_y,
             w2.last_day_accu_m,
             w2.last_day_accu_y,
             w2.last_amount,
             w1.br,
             w1.buis_module,
             w1.trader,
             w1.market,
             w1.product,
             w1.security,
             w1.ps,
             w1.ratecode,
             w1.reporate,
             w1.cust,
             w1.ccy,
             w1.quantity,
             w1.faceamount,
             w1.totlint,
             w1.dealdate,
             w1.settdays,
             w1.tenor,
             w1.mdate,
             w1.basis,
             w1.feeccy,
             w1.feeamt,
             w1.settle_acct_type,
             w1.settle_acct,
             w1.v_settlement,
             w1.m_settlement,
             w1.costcenter,
             w1.status,
             w1.mstatus,
             w1.reversal_status,
             w1.fedealno,
             w1.createuser,
             w1.createtime,
             w1.reviewuser,
             w1.reviewtime,
             w1.reversaluser,
             w1.reversaltime,
             w1.reversareason,
             w1.lstmntuser,
             w1.lstmnttime,
             w1.settlement_path,
             w1.end_date
      
        from (select dealno,
                     p_date,
                     last_date,
                     vdate,
                     start_date,
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        amount
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        amount
                       else
                        (start_date - last_date - 1) * last_amount + amount +
                        last_bal_accu_m --月末及其他
                     end tobe_accu_m, --月余额结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        amount
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        amount + last_bal_accu_y
                       else
                        (start_date - last_date - 1) * last_amount + amount +
                        last_bal_accu_y
                     end tobe_accu_y, --年余额结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        1
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_m, --月日期结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        1
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_y, --年日期结果
                     sum(bal_accu_m) bal_accu_m,
                     sum(bal_accu_y) bal_accu_y,
                     sum(day_accu_m) day_accu_m,
                     sum(day_accu_y) day_accu_y,
                     sum(amount) amount,
                     sum(last_bal_accu_m) last_bal_accu_m,
                     sum(last_bal_accu_y) last_bal_accu_y,
                     sum(last_day_accu_m) last_day_accu_m,
                     sum(last_day_accu_y) last_day_accu_y,
                     sum(last_amount) last_amount
                from (select d.dealno, --交易编号
                             p_date, --参数日期
                             t.last_date, --上一个日期
                             d.vdate, --起息日
                             max(d.start_date) start_date, --开始日期
                             sum(d.amount) amount, --金额
                             t.last_bal_accu_m, --上一个日期月金额
                             t.last_bal_accu_y, --上一个日期年金额
                             t.last_day_accu_m, --上一个日期月天数
                             t.last_day_accu_y, --上一个日期月天数
                             t.last_amount, --上一个日期的金额
                             t.bal_accu_m,
                             t.bal_accu_y,
                             t.day_accu_m,
                             t.day_accu_y
                        from std_layer.t05_repo_deal_v1 d
                        left join (select m.dealno,
                                         m.start_date,
                                         m.last_date,
                                         d.bal_accu_m last_bal_accu_m,
                                         d.bal_accu_y last_bal_accu_y,
                                         d.day_accu_m last_day_accu_m,
                                         d.day_accu_y last_day_accu_y,
                                         d.amount     last_amount,
                                         m.bal_accu_m,
                                         m.bal_accu_y,
                                         m.day_accu_m,
                                         m.day_accu_y
                                  
                                    from (select d.dealno,
                                                 d.start_date,
                                                 (d.start_date - d.vdate) *
                                                 d.amount + d.amount bal_accu_m,
                                                 (d.start_date - d.vdate) *
                                                 d.amount + d.amount bal_accu_y,
                                                 d.start_date - d.vdate + 1 day_accu_m,
                                                 d.start_date - d.vdate + 1 day_accu_y,
                                                 lag(d.start_date, 1) over(partition by d.dealno order by d.start_date) as last_date
                                            from std_layer.t05_repo_deal_v1 d) m
                                    left join std_layer.t05_repo_deal_v1 d
                                      on m.dealno = d.dealno
                                     and m.last_date = d.start_date
                                   where (m.start_date, m.dealno) in
                                         (select max(start_date), dealno
                                            from std_layer.t05_repo_deal_v1
                                           group by dealno)) t
                          on d.dealno = t.dealno
                       group by d.dealno,
                                t.last_date,
                                d.vdate， t.last_bal_accu_m, --上一个日期月金额
                                t.last_bal_accu_y, --上一个日期年金额
                                t.last_day_accu_m, --上一个日期月天数
                                t.last_day_accu_y, --上一个日期月天数
                                t.last_amount, --上一个日期的金额
                                t.bal_accu_m,
                                t.bal_accu_y,
                                t.day_accu_m,
                                t.day_accu_y) w1
              
               group by dealno,
                        p_date,
                        last_date,
                        vdate,
                        start_date,
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           amount
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           amount
                          else
                           (start_date - last_date - 1) * last_amount +
                           amount + last_bal_accu_m --月末及其他
                        end, --月余额结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           amount
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           amount + last_bal_accu_y
                          else
                           (start_date - last_date - 1) * last_amount +
                           amount + last_bal_accu_y
                        end, --年余额结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           1
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end, --月日期结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           1
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end --年日期结果
              
              ) w2
        left join std_layer.t05_repo_deal_v1 w1
          on w1.dealno = w2.dealno
         and w1.start_date = w2.start_date;
    commit;
  
    --当最近日期为空时：
    merge into std_layer.t05_repo_deal_v1 w1
    using std_layer.temp_t05_repo_deal w2
    on (w1.dealno = w2.dealno and w1.start_date = p_date and w2.last_date is null)
    when matched then
      update
         set w1.bal_accu_m = w2.bal_accu_m,
             w1.bal_accu_y = w2.bal_accu_y,
             w1.day_accu_m = w2.day_accu_m,
             w1.day_accu_y = w2.day_accu_y;
    commit;
  
    --当最近日期不为空时：
    MERGE INTO std_layer.t05_repo_deal_v1 W1
    USING std_layer.temp_t05_repo_deal W2
    on (w1.dealno = w2.dealno and w1.start_date = p_date and w2.last_date is not null)
    when matched then
      update
         set w1.bal_accu_m = w2.tobe_accu_m,
             w1.bal_accu_y = w2.tobe_accu_y,
             w1.day_accu_m = w2.tobe_day_accu_m,
             w1.day_accu_y = w2.tobe_day_accu_y
    when not matched then
      insert
        (w1.br,
         w1.dealno,
         w1.buis_module,
         w1.trader,
         w1.market,
         w1.product,
         w1.security,
         w1.ps,
         w1.ratecode,
         w1.reporate,
         w1.cust,
         w1.ccy,
         w1.quantity,
         w1.faceamount,
         w1.amount,
         w1.totlint,
         w1.dealdate,
         w1.settdays,
         w1.vdate,
         w1.tenor,
         w1.mdate,
         w1.basis,
         w1.feeccy,
         w1.feeamt,
         w1.settle_acct_type,
         w1.settle_acct,
         w1.v_settlement,
         w1.m_settlement,
         w1.costcenter,
         w1.status,
         w1.mstatus,
         w1.reversal_status,
         w1.fedealno,
         w1.createuser,
         w1.createtime,
         w1.reviewuser,
         w1.reviewtime,
         w1.reversaluser,
         w1.reversaltime,
         w1.reversareason,
         w1.lstmntuser,
         w1.lstmnttime,
         w1.settlement_path,
         w1.start_date,
         w1.end_date,
         w1.bal_accu_m,
         w1.bal_accu_y,
         w1.day_accu_m,
         w1.day_accu_y)
      values
        (w2.br,
         w2.dealno,
         w2.buis_module,
         w2.trader,
         w2.market,
         w2.product,
         w2.security,
         w2.ps,
         w2.ratecode,
         w2.reporate,
         w2.cust,
         w2.ccy,
         w2.quantity,
         w2.faceamount,
         w2.amount,
         w2.totlint,
         w2.dealdate,
         w2.settdays,
         w2.vdate,
         w2.tenor,
         w2.mdate,
         w2.basis,
         w2.feeccy,
         w2.feeamt,
         w2.settle_acct_type,
         w2.settle_acct,
         w2.v_settlement,
         w2.m_settlement,
         w2.costcenter,
         w2.status,
         w2.mstatus,
         w2.reversal_status,
         w2.fedealno,
         w2.createuser,
         w2.createtime,
         w2.reviewuser,
         w2.reviewtime,
         w2.reversaluser,
         w2.reversaltime,
         w2.reversareason,
         w2.lstmntuser,
         w2.lstmnttime,
         w2.settlement_path,
         p_date， to_date('9999-12-31', 'yyyy/mm/dd'),
         w2.tobe_accu_m,
         w2.tobe_accu_y,
         w2.tobe_day_accu_m,
         w2.tobe_day_accu_y);
    commit;
  end;
  --收债转股、发股还债余额
  procedure debt_to_equity_swap(p_date date) is
  begin
    delete from std_layer.temp_t04_invest_contract;
    commit;
    insert into std_layer.temp_t04_invest_contract
      select w2.contractid,
             w2.p_date,
             w2.last_date,
             w2.realinvestdate,
             w2.start_date,
             w2.tobe_accu_m,
             w2.tobe_accu_y,
             w2.tobe_day_accu_m,
             w2.tobe_day_accu_y,
             w2.bal_accu_m,
             w2.bal_accu_y,
             w2.day_accu_m,
             w2.day_accu_y,
             w2.transfermoney,
             w2.last_bal_accu_m,
             w2.last_bal_accu_y,
             w2.last_day_accu_m,
             w2.last_day_accu_y,
             w2.last_transfermoney,
             w1.projectcode,
             w1.rivalid,
             w1.contractno,
             w1.contractname,
             w1.signdate,
             w1.begdate,
             w1.prestopdate,
             w1.cykind,
             w1.contractbalance,
             w1.industry,
             w1.stcokamount,
             w1.investratio,
             w1.isrepurchase,
             w1.remark,
             w1.repurchaser,
             w1.extendillustration2,
             w1.stock_price,
             w1.investfundname,
             w1.interest,
             w1.stopinterestday,
             w1.startcountday,
             w1.debtamount,
             w1.accrualtaxrate,
             w1.startorg,
             w1.ischeckbycondition,
             w1.checkcondition,
             w1.maininvestpart,
             w1.isenjoyvoteright,
             w1.issendhighsup,
             w1.assetrate,
             w1.transferor,
             w1.dealtype,
             w1.purchasebanlance,
             w1.paymenttype,
             w1.fxassetrate,
             w1.otherremark,
             w1.profitlevel,
             w1.investplantype,
             w1.underdescr,
             w1.etl_date,
             w1.end_date
        from (select contractid,
                     p_date,
                     last_date,
                     realinvestdate,
                     start_date,
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        transfermoney
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        transfermoney
                       else
                        (start_date - last_date - 1) * last_transfermoney +
                        transfermoney + last_bal_accu_m --月末及其他
                     end tobe_accu_m, --月余额结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        transfermoney
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        transfermoney + last_bal_accu_y
                       else
                        (start_date - last_date - 1) * last_transfermoney +
                        transfermoney + last_bal_accu_y
                     end tobe_accu_y, --年余额结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        1
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_m, --月日期结果
                     case
                       when p_date = trunc(p_date, 'yyyy') --年初
                        then
                        1
                       when p_date = trunc(p_date, 'mm') and
                            p_date <> trunc(p_date, 'yyyy') --月初
                        then
                        1
                       else
                        start_date - last_date + 1
                     end tobe_day_accu_y, --年日期结果
                     sum(bal_accu_m) bal_accu_m,
                     sum(bal_accu_y) bal_accu_y,
                     sum(day_accu_m) day_accu_m,
                     sum(day_accu_y) day_accu_y,
                     sum(transfermoney) transfermoney,
                     sum(last_bal_accu_m) last_bal_accu_m,
                     sum(last_bal_accu_y) last_bal_accu_y,
                     sum(last_day_accu_m) last_day_accu_m,
                     sum(last_day_accu_y) last_day_accu_y,
                     sum(last_transfermoney) last_transfermoney
                from (select d.contractid, --交易编号
                             p_date, --参数日期
                             t.last_date, --上一个日期
                             b.realinvestdate, --起息日
                             max(d.start_date) start_date, --开始日期
                             sum(d.transfermoney) transfermoney, --金额
                             t.last_bal_accu_m, --上一个日期月金额
                             t.last_bal_accu_y, --上一个日期年金额
                             t.last_day_accu_m, --上一个日期月天数
                             t.last_day_accu_y, --上一个日期月天数
                             t.last_transfermoney, --上一个日期的金额
                             t.bal_accu_m,
                             t.bal_accu_y,
                             t.day_accu_m,
                             t.day_accu_y
                        from std_layer.t04_invest_contract_v1 d
                        left join std_layer.t08_equity_assets_info b
                          on d.projectcode = b.projectcode
                        left join (select m.contractid,
                                         m.start_date,
                                         m.last_date,
                                         d.bal_accu_m    last_bal_accu_m,
                                         d.bal_accu_y    last_bal_accu_y,
                                         d.day_accu_m    last_day_accu_m,
                                         d.day_accu_y    last_day_accu_y,
                                         d.transfermoney last_transfermoney,
                                         m.bal_accu_m,
                                         m.bal_accu_y,
                                         m.day_accu_m,
                                         m.day_accu_y
                                  
                                    from (select d.contractid,
                                                 d.start_date,
                                                 (d.start_date -
                                                 b.realinvestdate) *
                                                 d.transfermoney +
                                                 d.transfermoney bal_accu_m,
                                                 (d.start_date -
                                                 b.realinvestdate) *
                                                 d.transfermoney +
                                                 d.transfermoney bal_accu_y,
                                                 d.start_date -
                                                 b.realinvestdate + 1 day_accu_m,
                                                 d.start_date -
                                                 b.realinvestdate + 1 day_accu_y,
                                                 lag(d.start_date, 1) over(partition by d.contractid order by d.start_date) as last_date
                                            from std_layer.t04_invest_contract_v1 d
                                            left join std_layer.t08_equity_assets_info b
                                              on d.projectcode = b.projectcode) m
                                    left join std_layer.t04_invest_contract_v1 d
                                      on m.contractid = d.contractid
                                     and m.last_date = d.start_date
                                   where (m.start_date, m.contractid) in
                                         (select max(start_date), contractid
                                            from std_layer.t04_invest_contract_v1
                                           group by contractid)) t
                          on d.contractid = t.contractid
                       group by d.contractid,
                                t.last_date,
                                b.realinvestdate， t.last_bal_accu_m, --上一个日期月金额
                                t.last_bal_accu_y, --上一个日期年金额
                                t.last_day_accu_m, --上一个日期月天数
                                t.last_day_accu_y, --上一个日期月天数
                                t.last_transfermoney, --上一个日期的金额
                                t.bal_accu_m,
                                t.bal_accu_y,
                                t.day_accu_m,
                                t.day_accu_y) w1
              
               group by contractid,
                        p_date,
                        last_date,
                        realinvestdate,
                        start_date,
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           transfermoney
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           transfermoney
                          else
                           (start_date - last_date - 1) * last_transfermoney +
                           transfermoney + last_bal_accu_m --月末及其他
                        end, --月余额结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           transfermoney
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           transfermoney + last_bal_accu_y
                          else
                           (start_date - last_date - 1) * last_transfermoney +
                           transfermoney + last_bal_accu_y
                        end, --年余额结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           1
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end, --月日期结果
                        case
                          when p_date = trunc(p_date, 'yyyy') --年初
                           then
                           1
                          when p_date = trunc(p_date, 'mm') and
                               p_date <> trunc(p_date, 'yyyy') --月初
                           then
                           1
                          else
                           start_date - last_date + 1
                        end --年日期结果
              
              ) w2
        left join std_layer.t04_invest_contract_v1 w1
          on w1.contractid = w2.contractid
         and w1.start_date = w2.start_date;
    commit;
  
    --当最近日期为空时：
    merge into std_layer.t04_invest_contract_v1 w1
    using std_layer.temp_t04_invest_contract w2
    on (w1.contractid = w2.contractid and w1.start_date = p_date and w2.last_date is null)
    when matched then
      update
         set w1.bal_accu_m = w2.bal_accu_m,
             w1.bal_accu_y = w2.bal_accu_y,
             w1.day_accu_m = w2.day_accu_m,
             w1.day_accu_y = w2.day_accu_y;
    commit;
    --where d.start_date = p_date
    --当最近日期不为空时：
    MERGE INTO std_layer.t04_invest_contract_v1 W1
    USING temp_t04_invest_contract W2
    on (w1.contractid = w2.contractid and w1.start_date = p_date and w2.last_date is not null)
    when matched then
      update
         set w1.bal_accu_m = w2.tobe_accu_m,
             w1.bal_accu_y = w2.tobe_accu_y,
             w1.day_accu_m = w2.tobe_day_accu_m,
             w1.day_accu_y = w2.tobe_day_accu_y
    when not matched then
      insert
        (w1.contractid,
         w1.projectcode,
         w1.rivalid,
         w1.contractno,
         w1.contractname,
         w1.signdate,
         w1.begdate,
         w1.prestopdate,
         w1.cykind,
         w1.contractbalance,
         w1.industry,
         w1.stcokamount,
         w1.investratio,
         w1.isrepurchase,
         w1.remark,
         w1.repurchaser,
         w1.extendillustration2,
         w1.stock_price,
         w1.investfundname,
         w1.interest,
         w1.stopinterestday,
         w1.startcountday,
         w1.debtamount,
         w1.accrualtaxrate,
         w1.startorg,
         w1.ischeckbycondition,
         w1.checkcondition,
         w1.maininvestpart,
         w1.isenjoyvoteright,
         w1.issendhighsup,
         w1.assetrate,
         w1.transferor,
         w1.dealtype,
         w1.purchasebanlance,
         w1.transfermoney,
         w1.paymenttype,
         w1.fxassetrate,
         w1.otherremark,
         w1.profitlevel,
         w1.investplantype,
         w1.underdescr,
         w1.etl_date,
         w1.start_date,
         w1.end_date,
         w1.bal_accu_m,
         w1.bal_accu_y,
         w1.day_accu_m,
         w1.day_accu_y)
      values
        (w2.contractid,
         w2.projectcode,
         w2.rivalid,
         w2.contractno,
         w2.contractname,
         w2.signdate,
         w2.begdate,
         w2.prestopdate,
         w2.cykind,
         w2.contractbalance,
         w2.industry,
         w2.stcokamount,
         w2.investratio,
         w2.isrepurchase,
         w2.remark,
         w2.repurchaser,
         w2.extendillustration2,
         w2.stock_price,
         w2.investfundname,
         w2.interest,
         w2.stopinterestday,
         w2.startcountday,
         w2.debtamount,
         w2.accrualtaxrate,
         w2.startorg,
         w2.ischeckbycondition,
         w2.checkcondition,
         w2.maininvestpart,
         w2.isenjoyvoteright,
         w2.issendhighsup,
         w2.assetrate,
         w2.transferor,
         w2.dealtype,
         w2.purchasebanlance,
         w2.transfermoney,
         w2.paymenttype,
         w2.fxassetrate,
         w2.otherremark,
         w2.profitlevel,
         w2.investplantype,
         w2.underdescr,
         w2.etl_date,
         p_date， to_date('9999-12-31', 'yyyy/mm/dd'),
         w2.tobe_accu_m,
         w2.tobe_accu_y,
         w2.tobe_day_accu_m,
         w2.tobe_day_accu_y);
    commit;
  end;
end etl_cal_accu_bal_pkg_v1;
/
