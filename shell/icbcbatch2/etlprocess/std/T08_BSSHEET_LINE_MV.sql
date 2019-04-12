create materialized view T08_BSSHEET_LINE_MV
refresh force on demand
as
select b.report_id,
       b.item_name,
       b.line_num,
       b.beginning_balances,
       b.ending_balances,
       b.data_date,
       b.etl_date,
       b.period_date,
       b.period_amount,
       b.dept_code,
       b.org_code from t08_bssheet_line b
 where (b.line_num, b.period_date,  b.org_code, b.data_date) in
       (select a.line_num,
               a.period_date,
               a.org_code,
               max(a.data_date)
          from std_layer.t08_bssheet_line a
         group by a.line_num, a.period_date, a.org_code);
