create or replace package EBS_ETL_PKG is

  -- Author  : GYTZ-KAIF1
  -- Created : 2019/1/8 15:49:02
  -- Purpose : 

  -- 总控从std层到ext层
  procedure ALL_REPORT_CONTROL;

  -- load MA_BSSHEET_HEADER 的数据
  procedure LOAD_BSSHEET_HEADER;

  --load MA_PLSHEET_HEADER 的数据
  procedure LOAD_PLSHEET_HEADER;

  --load MA_EXPDETAIL_HEADER 的数据
  procedure LOAD_EXPDETAIL_HEADER;

  --load MA_BSSHEET_LINE 的数据
  procedure LOAD_BSSHEET_LINE;

  --load MA_PLSHEET_LINE 的数据
  procedure LOAD_PLSHEET_LINE;

  --load MA_EXPDETAIL_LINE 的数据
  procedure LOAD_EXPDETAIL_LINE;

  --load MA_AP_SUPPLIERS 的数据
  procedure LOAD_AP_SUPPLIERS;

  --load MA_AP_INVOICES_ALL 的数据
  procedure LOAD_AP_INVOICE_ALL;

  --load MA_AP_INVOICE_LINES_ALL 的数据
  procedure LOAD_AP_INVOICE_LINES_ALL;

  --load MA_AP_INVOICE_DISTRIBUTIONS_ALL 的数据
  procedure LOAD_AP_INVOICE_DISTRIBUTIONS_ALL;

  --load MA_GL_LEDGERS 的数据
  procedure LOAD_GL_LEDGERS;

  --load MA_FND_FLEX_VALUE_SETS 的数据
  procedure LOAD_FND_FLEX_VALUE_SETS;

  --load MA_FND_FLEX_VALUES 的数据
  procedure LOAD_FND_FLEX_VALUES;

  --load MA_GL_BALANCES 的数据
  procedure LOAD_GL_BALANCES;

  --load MA_FND_ID_FLEX_SEGMENTS 的数据
  procedure LOAD_FND_ID_FLEX_SEGMENTS;

  --load MA_GL_CODE_COMBINATIONS 的数据
  procedure LOAD_GL_CODE_COMBINATIONS;

  procedure update_log(source_sheet      varchar2,
                       target_sheet      varchar2,
                       query_date        date,
                       success_status    varchar2,
                       exception_message varchar2 DEFAULT NULL);

end EBS_ETL_PKG;
/
create or replace package body EBS_ETL_PKG is
  -- 总控从std层到ext层
  procedure ALL_REPORT_CONTROL is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    if trunc(query_date) = last_day(trunc(query_date)) then
      dbms_output.put_line('i`t the last day of this mouth,start load data');
      -- 删除各表的数据
      delete from MA_BSSHEET_HEADER;
      delete from MA_PLSHEET_HEADER;
      delete from MA_EXPDETAIL_HEADER;
      delete from MA_BSSHEET_LINE;
      delete from MA_PLSHEET_LINE;
      delete from MA_EXPDETAIL_LINE;
      delete from MA_AP_INVOICES_ALL;
      delete from MA_AP_INVOICE_LINES_ALL;
      delete from MA_AP_INVOICE_DISTRIBUTIONS_ALL;
      delete from MA_AP_SUPPLIERS;
      delete from MA_GL_LEDGERS;
      delete from MA_FND_FLEX_VALUE_SETS;
      delete from MA_FND_FLEX_VALUES;
      delete from MA_GL_CODE_COMBINATIONS;
      delete from MA_GL_BALANCES;
      delete from MA_FND_ID_FLEX_SEGMENTS;
    
      -- 载入各表的数据
      LOAD_BSSHEET_HEADER;
      LOAD_PLSHEET_HEADER;
      LOAD_EXPDETAIL_HEADER;
      LOAD_BSSHEET_LINE;
      LOAD_PLSHEET_LINE;
      LOAD_EXPDETAIL_LINE;
      LOAD_AP_SUPPLIERS;
      LOAD_AP_INVOICE_ALL;
      LOAD_AP_INVOICE_LINES_ALL;
      LOAD_AP_INVOICE_DISTRIBUTIONS_ALL;
      LOAD_GL_LEDGERS;
      LOAD_FND_FLEX_VALUE_SETS;
      LOAD_FND_FLEX_VALUES;
      LOAD_GL_BALANCES;
      LOAD_FND_ID_FLEX_SEGMENTS;
      LOAD_GL_CODE_COMBINATIONS;
    else
      dbms_output.put_line('it`s not the last day of this mouth,etl progress will exit');
    end if;
  end ALL_REPORT_CONTROL;

  -- load MA_BSSHEET_HEADER 的数据
  procedure LOAD_BSSHEET_HEADER is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_BSSHEET_HEADER');
    --删除数据日期的数据
    delete from ma_bssheet_header where data_date = query_date;
    --插入数据日期的数据
    insert into ma_bssheet_header
      (report_id,
       report_flag,
       period_date,
       data_date,
       com_code,
       dept_code,
       line_count_num,
       etl_date)
      select report_id,
             report_flag,
             period_date,
             query_date,
             com_code,
             dept_code,
             line_count_num,
             etl_date
      
        from ext_layer.ma_bssheet_header_v
      /*where data_date = query_date*/
      ;
  
    DELETE FROM EXT_LAYER.MA_BSSHEET_HEADER A
     where substr(a.period_date, 6) IN ('13', '14', '15');
    --插入日志表中数据
    update_log('STD_LAYER.T08_BSSHEET_HEADER',
               'EXT_LAYER.MA_BSSHEET_HEADER',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback LOAD_BSSHEET_HEADER');
      --插入日志表中数据
      update_log('STD_LAYER.T08_BSSHEET_HEADER',
                 'EXT_LAYER.MA_BSSHEET_HEADER',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_BSSHEET_HEADER;

  --load MA_PLSHEET_HEADER 的数据
  procedure LOAD_PLSHEET_HEADER is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_PLSHEET_HEADER');
    --删除数据日期的数据
    delete from ma_plsheet_header where data_date = query_date;
    --插入数据日期的数据
    insert into ma_plsheet_header
      (
       
       report_id,
       report_flag,
       period_date,
       data_date,
       com_code,
       dept_code,
       line_count_num,
       etl_date
       
       )
      select
      
       report_id,
       report_flag,
       period_date,
       query_date,
       com_code,
       dept_code,
       line_count_num,
       etl_date
      
        from ma_plsheet_header_v
      /*where data_date = query_date*/
      ;
  
    DELETE FROM EXT_LAYER.MA_PLSHEET_HEADER A
     where substr(a.period_date, 6) IN ('13', '14', '15');
    --插入日志表中数据
    update_log('STD_LAYER.T08_PLSHEET_HEADER',
               'EXT_LAYER.MA_PLSHEET_HEADER',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback LOAD_PLSHEET_HEADER');
      --插入日志表中数据
      update_log('STD_LAYER.T08_PLSHEET_HEADER',
                 'EXT_LAYER.MA_PLSHEET_HEADER',
                 query_date,
                 'no',
                 sqlerrm);
    
      Rollback;
    
  end LOAD_PLSHEET_HEADER;

  --load MA_EXPDETAIL_HEADER 的数据
  procedure LOAD_EXPDETAIL_HEADER is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_EXPDETAIL_HEADER');
    --删除数据日期的数据
    delete from ma_expdetail_header where data_date = query_date;
    --插入数据日期的数据
    insert into ma_expdetail_header
      (report_id,
       report_flag,
       period_date,
       data_date,
       com_code,
       dept_code,
       line_count_num,
       etl_date
       
       )
      select
      
       report_id,
       report_flag,
       period_date,
       query_date,
       com_code,
       dept_code,
       line_count_num,
       etl_date
      
        from ma_expdetail_header_v
      /*where data_date = query_date*/
      ;
  
    DELETE FROM EXT_LAYER.MA_EXPDETAIL_HEADER A
     where substr(a.period_date, 6) IN ('13', '14', '15');
    --插入日志表中数据
    update_log('STD_LAYER.T08_EXPDETAIL_HEADER',
               'EXT_LAYER.MA_EXPDETAIL_HEADER',
               query_date,
               'yes',
               NULL);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback LOAD_EXPDETAIL_HEADER');
      --插入日志表中数据
      update_log('STD_LAYER.T08_EXPDETAIL_HEADER',
                 'EXT_LAYER.MA_EXPDETAIL_HEADER',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_EXPDETAIL_HEADER;

  --load MA_BSSHEET_LINE 的数据
  procedure LOAD_BSSHEET_LINE is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_BSSHEET_LINE');
    --删除数据日期的数据
    delete from ma_bssheet_line where data_date = query_date;
    --插入数据日期的数据
    --工银投资本部下部门不为0
    insert into ma_bssheet_line
      (report_id,
       item_name,
       line_num,
       beginning_balances,
       ending_balances,
       data_date,
       etl_date,
       period_date,
       period_amount,
       dept_code)
      select report_id,
             item_name,
             line_num,
             beginning_balances,
             ending_balances,
             query_date,
             etl_date,
             period_date,
             period_amount,
             dept_code
      
        from ma_bssheet_line_v
       where org_code = '1010000000'
         and dept_code <> 'T';
    --工银投资本部、工银投资资本、工银投资合并下部门为0
    insert into ma_bssheet_line
      (report_id,
       item_name,
       line_num,
       beginning_balances,
       ending_balances,
       data_date,
       etl_date,
       period_date,
       period_amount,
       dept_code)
      select report_id,
             item_name,
             line_num,
             beginning_balances,
             ending_balances,
             query_date,
             etl_date,
             period_date,
             period_amount,
             org_code
      
        from ma_bssheet_line_v
       where org_code in ('1010000000', '0060200801', 'T')
         and dept_code = 'T';
  
    merge into EXT_LAYER.MA_BSSHEET_LINE a
    using (select item_name, ending_balances, line_num, org_code
             from ma_bssheet_line_v
            where substr(period_date, 6) = '15') t
    on (a.item_name = t.item_name and a.line_num = t.line_num and a.dept_code = t.org_code)
    when matched then
      update
         set a.ending_balances = t.ending_balances
       where substr(a.period_date, 6) = '12';
    dbms_output.put_line('---');
    DELETE FROM EXT_LAYER.MA_BSSHEET_LINE A
     where substr(a.period_date, 6) IN ('13', '14', '15');
  
    --插入日志表中数据
    update_log('STD_LAYER.T08_BSSHEET_LINE',
               'EXT_LAYER.MA_BSSHEET_LINE',
               query_date,
               'yes',
               NULL);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback LOAD_BSSHEET_LINE');
      --插入日志表中数据
      update_log('STD_LAYER.T08_BSSHEET_LINE',
                 'EXT_LAYER.MA_BSSHEET_LINE',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_BSSHEET_LINE;

  --load MA_PLSHEET_LINE 的数据
  procedure LOAD_PLSHEET_LINE is
    query_date   date;
    period_count number;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_PLSHEET_LINE');
    --删除数据日期的数据
    delete from ma_plsheet_line where data_date = query_date;
    --插入数据日期的数据
    --工银投资本部、工银投资资本、工银投资合并下部门为0
    insert into ma_plsheet_line
      (report_id,
       item_name,
       line_num,
       dept_code,
       dept_ytd,
       etl_date,
       data_date,
       period_date,
       dept_ptd
       
       )
      select report_id,
             item_name,
             line_num,
             dept_code,
             dept_ytd,
             etl_date,
             query_date,
             period_date,
             dept_ptd
      
        from ma_plsheet_line_v
       where org_code = '1010000000'
         and dept_code <> 'T';
    --工银投资本部、工银投资资本、工银投资合并下部门为0
    insert into ma_plsheet_line
      (report_id,
       item_name,
       line_num,
       dept_code,
       dept_ytd,
       etl_date,
       data_date,
       period_date,
       dept_ptd)
      select report_id,
             item_name,
             line_num,
             org_code,
             dept_ytd,
             etl_date,
             query_date,
             period_date,
             dept_ptd
      
        from ma_plsheet_line_v
       where org_code in ('1010000000', '0060200801', 'T')
         and dept_code = 'T';
  commit;
    -- if period 13,14,15 co-exist 
    select count(*)
      into period_count
      from (select distinct period_date
              from EXT_LAYER.MA_PLSHEET_LINE
             where to_number(substr(period_date, 6)) between 13 and 15);
  
    if period_count = 3 then
    
      -- substitute YTD period 12 with 15 
      merge into EXT_LAYER.MA_PLSHEET_LINE a
      using (select line_num, DEPT_YTD, dept_code
               from EXT_LAYER.MA_PLSHEET_LINE
              where substr(period_date, 6) = '15') t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_YTD = t.DEPT_YTD
         where substr(a.period_date, 6) = '12';
    
      -- combine period 12,13,14,15 PTD
      merge into EXT_LAYER.MA_PLSHEET_LINE a
      using (select distinct *
               from (select line_num,
                            dept_code,
                            sum(dept_ptd) over(partition by dept_code, line_num) as sum_ptd
                       from EXT_LAYER.MA_PLSHEET_LINE
                      where substr(period_date, 6) IN ('13', '14', '15'))) t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_PTD = a.DEPT_PTD + t.sum_ptd
         where substr(a.period_date, 6) = '12';
      commit;
    end if;
  
    DELETE FROM EXT_LAYER.MA_PLSHEET_LINE A
     WHERE substr(a.period_date, 6) IN ('13', '14', '15');
  
    --插入日志表中数据
    update_log('STD_LAYER.T08_PLSHEET_LINE',
               'EXT_LAYER.MA_PLSHEET_LINE',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_PLSHEET_LINE');
      --插入日志表中数据
      update_log('STD_LAYER.T08_PLSHEET_LINE',
                 'EXT_LAYER.MA_PLSHEET_LINE',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_PLSHEET_LINE;

  --load MA_EXPDETAIL_LINE 的数据
  procedure LOAD_EXPDETAIL_LINE is
    query_date   date;
    period_count number;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_EXPDETAIL_LINE');
    --删除数据日期的数据
    delete from ma_expdetail_line where data_date = query_date;
    --插入数据日期的数据
    --工银投资本部、工银投资资本、工银投资合并下部门为0
    insert into ma_expdetail_line
      (report_id,
       item_name,
       line_num,
       dept_code,
       dept_ytd,
       etl_date,
       data_date,
       period_date,
       dept_ptd
       
       )
      select report_id,
             item_name,
             line_num,
             dept_code,
             dept_ytd,
             etl_date,
             query_date,
             period_date,
             dept_ptd
      
        from ma_expdetail_line_v
       where org_code = '1010000000'
         and dept_code <> 'T';
    --工银投资本部、工银投资资本、工银投资合并下部门为0   
    insert into ma_expdetail_line
      (report_id,
       item_name,
       line_num,
       dept_code,
       dept_ytd,
       etl_date,
       data_date,
       period_date,
       dept_ptd
       
       )
      select report_id,
             item_name,
             line_num,
             org_code,
             dept_ytd,
             etl_date,
             query_date,
             period_date,
             dept_ptd
      
        from ma_expdetail_line_v
       where org_code in ('1010000000', '0060200801', 'T')
         and dept_code = 'T';
     commit;
    -- if period 13,14,15 co-exist 
    select count(*)
      into period_count
      from (select distinct period_date
              from EXT_LAYER.MA_EXPDETAIL_LINE
             where to_number(substr(period_date, 6)) between 13 and 15);
  
    if period_count = 3 then
    
      -- substitute YTD period 12 with 15 
      merge into EXT_LAYER.MA_EXPDETAIL_LINE a
      using (select line_num, DEPT_YTD, dept_code
               from EXT_LAYER.MA_EXPDETAIL_LINE
              where substr(period_date, 6) = '15') t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_YTD = t.DEPT_YTD
         where substr(a.period_date, 6) = '12';
    
      -- combine period 12,13,14,15 PTD
      merge into EXT_LAYER.MA_EXPDETAIL_LINE a
      using (select distinct *
               from (select line_num,
                            dept_code,
                            sum(dept_ptd) over(partition by dept_code, line_num) as sum_ptd
                       from EXT_LAYER.MA_EXPDETAIL_LINE)) t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_PTD = a.DEPT_PTD + t.sum_ptd
         where substr(a.period_date, 6) = '12';
      commit;
    end if;
    DELETE FROM EXT_LAYER.MA_EXPDETAIL_LINE A
     WHERE substr(a.period_date, 6) IN ('13', '14', '15');
    --插入日志表中数据
    update_log('STD_LAYER.T08_EXPDETAIL_LINE',
               'EXT_LAYER.MA_EXPDETAIL_LINE',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_EXPDETAIL_LINE');
      --插入日志表中数据
      update_log('STD_LAYER.T08_EXPDETAIL_LINE',
                 'EXT_LAYER.MA_EXPDETAIL_LINE',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_EXPDETAIL_LINE;

  --load MA_AP_SUPPLIERS 的数据
  procedure LOAD_AP_SUPPLIERS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_AP_SUPPLIERS');
    --删除数据日期的数据
    delete from MA_AP_SUPPLIERS where data_date = query_date;
    --插入数据日期的数据
    insert into MA_AP_SUPPLIERS
      (report_id,
       vendor_id,
       last_update_date,
       last_updated_by,
       vendor_name,
       summary_flag,
       enabled_flag,
       creation_date,
       created_by,
       employee_id,
       vendor_type_lookup_code,
       set_of_books_id,
       invoice_currency_code,
       etl_date,
       data_date)
      select report_id,
             vendor_id,
             last_update_date,
             last_updated_by,
             vendor_name,
             summary_flag,
             enabled_flag,
             creation_date,
             created_by,
             employee_id,
             vendor_type_lookup_code,
             set_of_books_id,
             invoice_currency_code,
             etl_date,
             query_date
      
        from ma_ap_suppliers_v
      /*where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T01_AP_SUPPLIERS',
               'EXT_LAYER.MA_AP_SUPPLIERS',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_AP_SUPPLIERS');
      --插入日志表中数据
      update_log('STD_LAYER.T01_AP_SUPPLIERS',
                 'EXT_LAYER.MA_AP_SUPPLIERS',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_AP_SUPPLIERS;

  --load MA_AP_INVOICES_ALL 的数据
  procedure LOAD_AP_INVOICE_ALL is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_AP_INVOICES_ALL');
    --删除数据日期的数据
    delete from MA_AP_INVOICES_ALL where data_date = query_date;
    --插入数据日期的数据
    insert into MA_AP_INVOICES_ALL
      (report_id,
       invoice_id,
       invoice_num,
       vendor_id,
       set_of_books_id,
       invoice_currency_code,
       invoice_amount,
       invoice_date,
       invoice_type_lookup_code,
       org_id,
       project_id,
       last_update_date,
       last_updated_by,
       last_update_login,
       creation_date,
       created_by,
       etl_date,
       data_date)
      select report_id,
             invoice_id,
             invoice_num,
             vendor_id,
             set_of_books_id,
             invoice_currency_code,
             invoice_amount,
             invoice_date,
             invoice_type_lookup_code,
             org_id,
             project_id,
             last_update_date,
             last_updated_by,
             last_update_login,
             creation_date,
             created_by,
             etl_date,
             query_date
        from ma_ap_invoices_all_v
      /*where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T05_AP_INVOICES_ALL',
               'EXT_LAYER.MA_AP_INVOICES_ALL',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_AP_INVOICES_ALL');
      --插入日志表中数据
      update_log('STD_LAYER.T05_AP_INVOICES_ALL',
                 'EXT_LAYER.MA_AP_INVOICES_ALL',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_AP_INVOICE_ALL;

  --load MA_AP_INVOICE_LINES_ALL 的数据
  procedure LOAD_AP_INVOICE_LINES_ALL is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_AP_INVOICE_LINES_ALL');
    --删除数据日期的数据
    delete from MA_AP_INVOICE_LINES_ALL where data_date = query_date;
    --插入数据日期的数据
    insert into MA_AP_INVOICE_LINES_ALL
      (report_id,
       invoice_id,
       line_number,
       line_type_lookup_code,
       org_id,
       default_dist_ccid,
       accounting_date,
       period_name,
       def_acctg_start_date,
       def_acctg_end_date,
       def_acctg_number_of_periods,
       def_acctg_period_type,
       set_of_books_id,
       amount,
       base_amount,
       asset_book_type_code,
       asset_category_id,
       project_id,
       start_expense_date,
       end_expense_date,
       creation_date,
       created_by,
       last_updated_by,
       last_update_date,
       last_update_login,
       etl_date,
       data_date)
      select report_id,
             invoice_id,
             line_number,
             line_type_lookup_code,
             org_id,
             default_dist_ccid,
             accounting_date,
             period_name,
             def_acctg_start_date,
             def_acctg_end_date,
             def_acctg_number_of_periods,
             def_acctg_period_type,
             set_of_books_id,
             amount,
             base_amount,
             asset_book_type_code,
             asset_category_id,
             project_id,
             start_expense_date,
             end_expense_date,
             creation_date,
             created_by,
             last_updated_by,
             last_update_date,
             last_update_login,
             etl_date,
             query_date
      
        from ma_ap_invoice_lines_all_v
      /* where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T05_AP_INVOICE_LINES_ALL',
               'EXT_LAYER.MA_AP_INVOICE_LINES_ALL',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_AP_INVOICE_LINES_ALL');
      --插入日志表中数据
      update_log('STD_LAYER.T05_AP_INVOICE_LINES_ALL',
                 'EXT_LAYER.MA_AP_INVOICE_LINES_ALL',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_AP_INVOICE_LINES_ALL;

  --load MA_AP_INVOICE_DISTRIBUTIONS_ALL 的数据
  procedure LOAD_AP_INVOICE_DISTRIBUTIONS_ALL is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_AP_INVOICE_DISTRIBUTIONS_ALL');
    --删除数据日期的数据
    delete from MA_AP_INVOICE_DISTRIBUTIONS_ALL
     where data_date = query_date;
    --插入数据日期的数据
    insert into MA_AP_INVOICE_DISTRIBUTIONS_ALL
      (report_id,
       accounting_date,
       distribution_line_number,
       dist_code_combination_id,
       invoice_id,
       line_type_lookup_code,
       period_name,
       set_of_books_id,
       amount,
       base_amount,
       project_id,
       org_id,
       start_expense_date,
       end_expense_date,
       invoice_line_number,
       asset_book_type_code,
       asset_category_id,
       creation_date,
       created_by,
       last_updated_by,
       last_update_date,
       last_update_login,
       etl_date,
       data_date)
      select report_id,
             accounting_date,
             distribution_line_number,
             dist_code_combination_id,
             invoice_id,
             line_type_lookup_code,
             period_name,
             set_of_books_id,
             amount,
             base_amount,
             project_id,
             org_id,
             start_expense_date,
             end_expense_date,
             invoice_line_number,
             asset_book_type_code,
             asset_category_id,
             creation_date,
             created_by,
             last_updated_by,
             last_update_date,
             last_update_login,
             etl_date,
             query_date
      
        from ma_ap_invoice_distributions_all_v
      /*    where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T05_AP_INVOICE_DISTRIBUTIONS_ALL',
               'EXT_LAYER.MA_AP_INVOICE_DISTRIBUTIONS_ALL',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_AP_INVOICE_DISTRIBUTIONS_ALL');
      --插入日志表中数据
      update_log('STD_LAYER.T05_AP_INVOICE_DISTRIBUTIONS_ALL',
                 'EXT_LAYER.MA_AP_INVOICE_DISTRIBUTIONS_ALL',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_AP_INVOICE_DISTRIBUTIONS_ALL;

  --load MA_GL_LEDGERS的数据
  procedure LOAD_GL_LEDGERS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_GL_LEDGERS');
    --删除数据日期的数据
    delete from MA_GL_LEDGERS where start_date = query_date;
    --插入数据日期的数据
    insert into MA_GL_LEDGERS
      (report_id,
       ledger_id,
       name,
       short_name,
       description,
       ledger_category_code,
       chart_of_accounts_id,
       currency_code,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by,
       last_update_login,
       etl_date,
       start_date)
      select report_id,
             ledger_id,
             name,
             short_name,
             description,
             ledger_category_code,
             chart_of_accounts_id,
             currency_code,
             creation_date,
             created_by,
             last_update_date,
             last_updated_by,
             last_update_login,
             etl_date,
             query_date
      
        from ma_gl_ledgers_v
      /*where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T08_GL_LEDGERS',
               'EXT_LAYER.MA_GL_LEDGERS',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_LEDGERS');
      --插入日志表中数据
      update_log('STD_LAYER.T08_GL_LEDGERS',
                 'EXT_LAYER.MA_GL_LEDGERS',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_GL_LEDGERS;

  --load MA_FND_FLEX_VALUE_SETS 的数据
  procedure LOAD_FND_FLEX_VALUE_SETS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_FND_FLEX_VALUE_SETS');
    --删除数据日期的数据
    delete from MA_FND_FLEX_VALUE_SETS where data_date = query_date;
    --插入数据日期的数据
    insert into MA_FND_FLEX_VALUE_SETS
      (report_id,
       flex_value_set_id,
       flex_value_set_name,
       last_update_date,
       last_updated_by,
       creation_date,
       created_by,
       last_update_login,
       description,
       etl_date,
       data_date)
      select report_id,
             flex_value_set_id,
             flex_value_set_name,
             last_update_date,
             last_updated_by,
             creation_date,
             created_by,
             last_update_login,
             description,
             etl_date,
             query_date
      
        from ma_fnd_flex_value_sets_v
      /*where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T08_FND_FLEX_VALUE_SETS',
               'EXT_LAYER.MA_FND_FLEX_VALUE_SETS',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_FND_FLEX_VALUE_SETS');
      --插入日志表中数据
      update_log('STD_LAYER.T08_FND_FLEX_VALUE_SETS',
                 'EXT_LAYER.MA_FND_FLEX_VALUE_SETS',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_FND_FLEX_VALUE_SETS;

  --load MA_FND_FLEX_VALUES 的数据
  procedure LOAD_FND_FLEX_VALUES is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_FND_FLEX_VALUES');
    --删除数据日期的数据
    delete from MA_FND_FLEX_VALUES where data_date = query_date;
    --插入数据日期的数据
    insert into MA_FND_FLEX_VALUES
      (report_id,
       flex_value_set_id,
       flex_value_id,
       flex_value,
       last_update_date,
       last_updated_by,
       creation_date,
       created_by,
       last_update_login,
       enabled_flag,
       summary_flag,
       start_date_active,
       end_date_active,
       parent_flex_value_low,
       parent_flex_value_high,
       structured_hierarchy_level,
       hierarchy_level,
       etl_date,
       data_date)
      select report_id,
             flex_value_set_id,
             flex_value_id,
             flex_value,
             last_update_date,
             last_updated_by,
             creation_date,
             created_by,
             last_update_login,
             enabled_flag,
             summary_flag,
             start_date_active,
             end_date_active,
             parent_flex_value_low,
             parent_flex_value_high,
             structured_hierarchy_level,
             hierarchy_level,
             etl_date,
             query_date
      
        from ma_fnd_flex_values_v
      /* where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T08_FND_FLEX_VALUES',
               'EXT_LAYER.MA_FND_FLEX_VALUES',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_FND_FLEX_VALUES');
      --插入日志表中数据
      update_log('STD_LAYER.T08_FND_FLEX_VALUES',
                 'EXT_LAYER.MA_FND_FLEX_VALUES',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_FND_FLEX_VALUES;

  --load MA_GL_BALANCES 的数据
  procedure LOAD_GL_BALANCES is
    query_date   date;
    period_count number;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_GL_BALANCES');
    --删除数据日期的数据
    delete from MA_GL_BALANCES where data_date = query_date;
    --插入数据日期的数据
    insert into MA_GL_BALANCES
      (report_id,
       ledger_id,
       org_unit_id,
       cost_center_id,
       gl_account_id,
       product_id,
       currency_code,
       period_name,
       actual_flag,
       last_update_date,
       last_updated_by,
       budget_version_id,
       period_net_dr,
       period_net_cr,
       begin_balance_dr,
       begin_balance_cr,
       period_net_dr_beq,
       period_net_cr_beq,
       begin_balance_dr_beq,
       begin_balance_cr_beq,
       etl_date,
       data_date)
      select b.report_id,
             b.ledger_id,
             gcc.segment1,
             gcc.segment2,
             gcc.segment3,
             gcc.segment7,
             b.currency_code,
             b.period_name,
             b.actual_flag,
             b.last_update_date,
             b.last_updated_by,
             b.budget_version_id,
             b.period_net_dr,
             b.period_net_cr,
             b.begin_balance_dr,
             b.begin_balance_cr,
             b.period_net_dr_beq,
             b.period_net_cr_beq,
             b.begin_balance_dr_beq,
             b.begin_balance_cr_beq,
             b.etl_date,
             query_date
      
        from ma_gl_balances_v b, std_layer.t08_gl_code_combinations gcc
       where query_date >= b.start_date
         and query_date < b.end_date
         and b.period_name =
             substr(to_char(query_date, 'yyyy-mm-dd'), 1, 7)
         and b.code_combination_id = gcc.code_combination_id;
    commit;
    select count(*)
      into period_count
      from (select distinct period_name
              from ext_layer.ma_gl_balances
             where to_number(substr(period_name, 6)) between 13 and 15);
  
    if period_count = 3 then
    
      -- substitute YTD period 12 with 15 
      merge into EXT_LAYER.Ma_Gl_Balances a
      using (select ledger_id,
                    org_unit_id,
                    cost_center_id,
                    gl_account_id,
                    currency_code,
                    period_name,
                    actual_flag,
                    etl_date,
                    data_date,
                    sum(period_net_dr) period_net_dr,
                    sum(period_net_cr) period_net_cr,
                    sum(period_net_dr_beq) period_net_dr_beq,
                    sum(period_net_cr_beq) period_net_cr_beq
               from EXT_LAYER.Ma_Gl_Balances
              where substr(period_name, 6) IN ('13', '14', '15')) t
      on (a.ledger_id = t.ledger_id and a.org_unit_id = t.org_unit_id and a.cost_center_id = t.cost_center_id and a.gl_account_id = t.gl_account_id and a.currency_code = t.currency_code and a.period_name = t.period_name and a.actual_flag = t.actual_flag and a.etl_date = t.etl_date and a.data_date = t.data_date)
      when matched then
        update
           set a.period_net_dr     = a.period_net_dr + t.period_net_dr,
               a.period_net_cr     = a.period_net_cr + t.period_net_cr,
               a.period_net_dr_beq = a.period_net_dr_beq +
                                     t.period_net_dr_beq,
               a.period_net_cr_beq = a.period_net_cr_beq +
                                     t.period_net_cr_beq
         where substr(a.period_name, 6) = '12';
      commit;
    
    end if;
  
    DELETE FROM EXT_LAYER.MA_PLSHEET_LINE A
     WHERE substr(a.period_date, 6) IN ('13', '14', '15');
    --插入日志表中数据
    update_log('STD_LAYER.T08_GL_BALANCES',
               'EXT_LAYER.MA_GL_BALANCES',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_BALANCES');
      --插入日志表中数据
      update_log('STD_LAYER.T08_GL_BALANCES',
                 'EXT_LAYER.MA_GL_BALANCES',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_GL_BALANCES;

  --load MA_FND_ID_FLEX_SEGMENTS 的数据
  procedure LOAD_FND_ID_FLEX_SEGMENTS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_FND_ID_FLEX_SEGMENTS');
    --删除数据日期的数据
    delete from MA_FND_ID_FLEX_SEGMENTS where data_date = query_date;
    --插入数据日期的数据
    insert into MA_FND_ID_FLEX_SEGMENTS
      (REPORT_ID,
       APPLICATION_ID,
       ID_FLEX_CODE,
       ID_FLEX_NUM,
       APPLICATION_COLUMN_NAME,
       SEGMENT_NAME,
       LAST_UPDATE_DATE,
       LAST_UPDATED_BY,
       CREATION_DATE,
       CREATED_BY,
       LAST_UPDATE_LOGIN,
       SEGMENT_NUM,
       APPLICATION_COLUMN_INDEX_FLAG,
       ENABLED_FLAG,
       REQUIRED_FLAG,
       DISPLAY_FLAG,
       DISPLAY_SIZE,
       SECURITY_ENABLED_FLAG,
       MAXIMUM_DESCRIPTION_LEN,
       CONCATENATION_DESCRIPTION_LEN,
       FLEX_VALUE_SET_ID,
       RANGE_CODE,
       DEFAULT_TYPE,
       DEFAULT_VALUE,
       RUNTIME_PROPERTY_FUNCTION,
       ADDITIONAL_WHERE_CLAUSE,
       DATA_DATE,
       ETL_DATE)
      select REPORT_ID,
             APPLICATION_ID,
             ID_FLEX_CODE,
             ID_FLEX_NUM,
             APPLICATION_COLUMN_NAME,
             SEGMENT_NAME,
             LAST_UPDATE_DATE,
             LAST_UPDATED_BY,
             CREATION_DATE,
             CREATED_BY,
             LAST_UPDATE_LOGIN,
             SEGMENT_NUM,
             APPLICATION_COLUMN_INDEX_FLAG,
             ENABLED_FLAG,
             REQUIRED_FLAG,
             DISPLAY_FLAG,
             DISPLAY_SIZE,
             SECURITY_ENABLED_FLAG,
             MAXIMUM_DESCRIPTION_LEN,
             CONCATENATION_DESCRIPTION_LEN,
             FLEX_VALUE_SET_ID,
             RANGE_CODE,
             DEFAULT_TYPE,
             DEFAULT_VALUE,
             RUNTIME_PROPERTY_FUNCTION,
             ADDITIONAL_WHERE_CLAUSE,
             query_date,
             ETL_DATE
      
        from ma_fnd_id_flex_segments_v
      /*where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T08_FND_ID_FLEX_SEGMENTS',
               'EXT_LAYER.MA_FND_ID_FLEX_SEGMENTS',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_FND_ID_FLEX_SEGMENTS');
      --插入日志表中数据
      update_log('STD_LAYER.T08_FND_ID_FLEX_SEGMENTS',
                 'EXT_LAYER.MA_FND_ID_FLEX_SEGMENTS',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_FND_ID_FLEX_SEGMENTS;

  --load MA_GL_CODE_COMBINATIONS 的数据
  procedure LOAD_GL_CODE_COMBINATIONS is
    query_date date;
  begin
    --为数据日期变量赋值
    select ma_data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    dbms_output.put_line('begin insert date into table MA_GL_CODE_COMBINATIONS');
    --删除数据日期的数据
    delete from MA_GL_CODE_COMBINATIONS where data_date = query_date;
    --插入数据日期的数据
    insert into MA_GL_CODE_COMBINATIONS
      (REPORT_ID,
       CODE_COMBINATION_ID,
       LAST_UPDATE_DATE,
       LAST_UPDATED_BY,
       CHART_OF_ACCOUNTS_ID,
       DETAIL_POSTING_ALLOWED_FLAG,
       DETAIL_BUDGETING_ALLOWED_FLAG,
       ACCOUNT_TYPE,
       ENABLED_FLAG,
       SUMMARY_FLAG,
       SEGMENT1,
       SEGMENT2,
       SEGMENT3,
       SEGMENT4,
       SEGMENT5,
       SEGMENT6,
       SEGMENT7,
       SEGMENT8,
       SEGMENT9,
       SEGMENT10,
       DESCRIPTION,
       TEMPLATE_ID,
       START_DATE_ACTIVE,
       END_DATE_ACTIVE,
       DATA_DATE,
       ETL_DATE)
      select REPORT_ID,
             CODE_COMBINATION_ID,
             LAST_UPDATE_DATE,
             LAST_UPDATED_BY,
             CHART_OF_ACCOUNTS_ID,
             DETAIL_POSTING_ALLOWED_FLAG,
             DETAIL_BUDGETING_ALLOWED_FLAG,
             ACCOUNT_TYPE,
             ENABLED_FLAG,
             SUMMARY_FLAG,
             SEGMENT1,
             SEGMENT2,
             SEGMENT3,
             SEGMENT4,
             SEGMENT5,
             SEGMENT6,
             SEGMENT7,
             SEGMENT8,
             SEGMENT9,
             SEGMENT10,
             DESCRIPTION,
             TEMPLATE_ID,
             START_DATE_ACTIVE,
             END_DATE_ACTIVE,
             query_date,
             ETL_DATE
      
        from ma_gl_code_combinations_v
      /*where end_date > query_date*/
      ;
    --插入日志表中数据
    update_log('STD_LAYER.T08_GL_CODE_COMBINATIONS',
               'EXT_LAYER.MA_GL_CODE_COMBINATIONS',
               query_date,
               'yes',
               null);
    commit;
  exception
    when others then
      dbms_output.put_line('error now,rollback MA_GL_CODE_COMBINATIONS');
      --插入日志表中数据
      update_log('STD_LAYER.T08_GL_CODE_COMBINATIONS',
                 'EXT_LAYER.MA_GL_CODE_COMBINATIONS',
                 query_date,
                 'no',
                 sqlerrm);
      Rollback;
  end LOAD_GL_CODE_COMBINATIONS;

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

end EBS_ETL_PKG;
/
