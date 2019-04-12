create materialized view T08_EXPDETAIL_LINE_MV
refresh force on demand
as
select
      b.report_id,
       b.item_name,
       b.line_num,
       b.dept_code,
       b.dept_ytd,
       b.etl_date,
       b.data_date,
       b.period_date,
       b.dept_ptd,
       b.org_code
  from std_layer.t08_expdetail_line b
 where (b.line_num, b.period_date, b.dept_code, b.org_code, b.data_date) in
       (select a.line_num,
               a.period_date,
               a.dept_code,
               a.org_code,
               max(a.data_date)
          from std_layer.t08_expdetail_line a
         group by a.line_num, a.period_date, a.dept_code, a.org_code);
