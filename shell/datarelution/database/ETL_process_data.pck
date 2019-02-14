create or replace package ETL_process_data is

  -- Author  : YAO Xinjie
  -- Created : 2019/1/4 10:15:50
  -- Purpose : Process balance sheet, profit&loss sheet, expense detail from src_layer to std_layer
  
procedure concat_bssheet_header;
procedure concat_bssheet_line;
procedure concat_plsheet_header;
procedure concat_plsheet_line;
procedure concat_expdetail_header;
procedure concat_expdetail_line;
procedure update_bssheet;
procedure update_plsheet;
procedure update_expdetail;
procedure  get_period_amount;
procedure update_log(source_sheet   varchar2,
                     target_sheet   varchar2,
                     query_date     date,
                     success_status varchar2,
                     exception_message varchar2 DEFAULT NULL);

end ETL_process_data;
/
create or replace package body ETL_process_data is

  -- append bssheet header
  procedure concat_bssheet_header is
    query_date date;
  
  begin
    -- save query_date from etl_control 
    select data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    -- remove duplicated record identified by data_date
    delete from STD_LAYER.T08_BSSHEET_HEADER where data_date = query_date;
    -- remove recurred record in the past 12 months
    delete from STD_LAYER.T08_BSSHEET_HEADER
     where period_date in
           (select distinct period_date from SRC_LAYER.EBS_BSSHEET_HEADER);
  
    -- insert records except period 13-15 from src_layer 
    insert into STD_LAYER.T08_BSSHEET_HEADER
      select report_id,
             report_flag,
             period_date,
             data_date,
             com_code,
             dept_code,
             line_count_num,
             etl_date,
             header_sequence.nextval
        from SRC_LAYER.EBS_BSSHEET_HEADER;
      -- where substr(period_date, 6) not in ('13', '14', '15');
    commit;
  
    -- update system timestamp 
    update STD_LAYER.T08_BSSHEET_HEADER
       set etl_date = sysdate
     where data_date = query_date;
    -- update system log in etl_control
    update_log('SRC_LAYER.EBS_BSSHEET_HEADER',
               'STD_LAYER.T08_BSSHEET_HEADER',
               query_date,
               'yes');
  exception
    -- error handling if exception happens
    when others then
      update_log('SRC_LAYER.EBS_BSSHEET_HEADER',
                 'STD_LAYER.T08_BSSHEET_HEADER',
                 query_date,
                 'no',
                 sqlerrm);
      dbms_output.put_line(sqlerrm);
      rollback;
  end concat_bssheet_header;

  --append bssheet line
  procedure concat_bssheet_line is
    query_date date;
  
  begin
    -- save query_date from etl_control 
    select data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    -- remove duplicated record identified by data_date
    delete from STD_LAYER.T08_BSSHEET_LINE where data_date = query_date;
    -- remove recurred record in the past 12 months
    delete from STD_LAYER.T08_BSSHEET_LINE
     where period_date in
           (select distinct period_date from SRC_LAYER.EBS_BSSHEET_LINE);
  
    insert into STD_LAYER.T08_BSSHEET_LINE
      (report_id,
       item_name,
       line_num,
       beginning_balances,
       ending_balances,
       data_date,
       etl_date,
       period_date,
       header_id,
       line_id)
      select report_id,
             item_name,
             line_num,
             beginning_balances,
             ending_balances,
             data_date,
             sysdate,
             period_date,
             -1,
             line_sequence.nextval
        from SRC_LAYER.EBS_BSSHEET_LINE;
       -- where substr(period_date, 6) not in ('13', '14', '15');
    commit;
    -- set header_id linked with header table
    merge into STD_LAYER.T08_BSSHEET_LINE a
    using (select * from STD_LAYER.T08_BSSHEET_HEADER) b
    on (a.period_date = b.period_date)
    when matched then
      update set header_id = b.header_id;
  
    -- substitute ending_balances period 12 with 15 
    /*
    merge into STD_LAYER.T08_BSSHEET_LINE a
    using (select item_name, ending_balances
             from SRC_LAYER.EBS_BSSHEET_LINE
            where substr(period_date, 6) = '15') t
    on (a.item_name = t.item_name)
    when matched then
      update
         set a.ending_balances = t.ending_balances
       where substr(a.period_date, 6) = '12';
    -- update period_amount by the differece of balances 
    */
    get_period_amount;

    -- update system log in etl_control
    update_log('SRC_LAYER.EBS_BSSHEET_LINE',
               'STD_LAYER.T08_BSSHEET_LINE',
               query_date,
               'yes');
  exception
    -- error handling if exception happens
    when others then
      update_log('SRC_LAYER.EBS_BSSHEET_LINE',
                 'STD_LAYER.T08_BSSHEET_LINE',
                 query_date,
                 'no',
                 sqlerrm);
      dbms_output.put_line(sqlerrm);
      rollback;
  end concat_bssheet_line;

  -- append plsheet header
  procedure concat_plsheet_header is
    query_date date;
  
  begin
    select data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    -- remove duplicated record identified by data_date
    delete from STD_LAYER.T08_PLSHEET_HEADER where data_date = query_date;
    -- remove recurred record in the past 12 months
    delete from STD_LAYER.T08_PLSHEET_HEADER
     where period_date in
           (select distinct period_date from SRC_LAYER.EBS_PLSHEET_HEADER);
  
    insert into STD_LAYER.T08_PLSHEET_HEADER
      select report_id,
             report_flag,
             period_date,
             data_date,
             com_code,
             dept_code,
             line_count_num,
             sysdate,
             header_sequence.nextval
        from SRC_LAYER.EBS_PLSHEET_HEADER;
      -- where substr(period_date, 6) not in ('13', '14', '15');
    commit;
  
    update_log('SRC_LAYER.EBS_PLSHEET_HEADER',
               'STD_LAYER.T08_PLSHEET_HEADER',
               query_date,
               'yes');
  exception
    when others then
      update_log('SRC_LAYER.EBS_PLSHEET_HEADER',
                 'STD_LAYER.T08_PLSHEET_HEADER',
                 query_date,
                 'no',
                 sqlerrm);
      dbms_output.put_line(sqlerrm);
      rollback;
  end concat_plsheet_header;

  -- append plsheet line
  procedure concat_plsheet_line is
    query_date   date;
    --period_count number;
    dept_code    varchar2(40);
    -- point to columns identified by dept 
    cursor dept_list is
      select column_name
        from all_tab_columns
       where owner = 'SRC_LAYER'
         AND TABLE_NAME = 'EBS_PLSHEET_LINE'
         AND COLUMN_NAME LIKE 'DEPT%'
         AND COLUMN_NAME LIKE '%PTD%';
  begin
    select data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    delete from STD_LAYER.T08_PLSHEET_LINE where data_date = query_date;
    -- remove recurred record in the past 12 months
    delete from STD_LAYER.T08_PLSHEET_LINE
     where period_date in
           (select distinct period_date from SRC_LAYER.EBS_PLSHEET_LINE);
  
    for dept_record in dept_list loop
      dept_code := substr(dept_record.column_name, 10);
      execute immediate 'insert into T08_PLSHEET_LINE 
        (report_id, item_name,line_num ,etl_date, Data_Date, period_date, dept_code, dept_ptd, dept_ytd, header_id, line_id) 
        select report_id, item_name, line_num, etl_date, Data_Date, period_date , ''' ||
                        dept_code || ''' , DEPT_PTD_' || dept_code ||
                        ' , DEPT_YTD_' || dept_code ||
                        ' , -1 , line_sequence.nextval from src_layer.EBS_PLSHEET_LINE ';
                       -- where substr(period_date, 6) not in (''13'', ''14'', ''15'')
    /*
      execute immediate 'insert into T08_PLSHEET_LINE_temp 
        (report_id, item_name,line_num ,etl_date, Data_Date, period_date, dept_code, dept_ptd, dept_ytd) 
        select report_id, item_name, line_num, etl_date, Data_Date, period_date , ''' ||
                        dept_code || ''' , DEPT_PTD_' || dept_code ||
                        ' , DEPT_YTD_' || dept_code ||
                        ' from src_layer.EBS_PLSHEET_LINE 
                        where substr(period_date, 6) in (''13'', ''14'', ''15'')';
                        */
      commit;
    end loop;
    
    /*
    -- if period 13,14,15 co-exist 
    select count(*)
      into period_count
      from (select distinct period_date
              from STD_LAYER.T08_PLSHEET_LINE_temp
             where to_number(substr(period_date, 6)) between 13 and 15);
  
    if period_count = 3 then
    
      -- substitute YTD period 12 with 15 
      merge into STD_LAYER.T08_PLSHEET_LINE a
      using (select line_num, DEPT_YTD, dept_code
               from STD_LAYER.T08_PLSHEET_LINE_temp
              where substr(period_date, 6) = '15') t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_YTD = t.DEPT_YTD
         where substr(a.period_date, 6) = '12';
    
      -- combine period 12,13,14,15 PTD
      merge into STD_LAYER.T08_PLSHEET_LINE a
      using (select distinct *
               from (select line_num,
                            dept_code,
                            sum(dept_ptd) over(partition by dept_code, line_num) as sum_ptd
                       from STD_LAYER.T08_PLSHEET_LINE_temp)) t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_PTD = a.DEPT_PTD + t.sum_ptd
         where substr(a.period_date, 6) = '12';
      commit;
    end if;
    */
    -- set header_id linked with header table
    merge into STD_LAYER.T08_PLSHEET_LINE a
    using (select * from STD_LAYER.T08_PLSHEET_HEADER) b
    on (a.period_date = b.period_date)
    when matched then
      update set a.header_id = b.header_id;
    -- update etl date
    update STD_LAYER.T08_PLSHEET_LINE
       set etl_date = sysdate
     where data_date = query_date;
  
    update_log('SRC_LAYER.EBS_PLSHEET_LINE',
               'STD_LAYER.T08_PLSHEET_LINE',
               query_date,
               'yes');
  exception
    when others then
      update_log('SRC_LAYER.EBS_PLSHEET_LINE',
                 'STD_LAYER.T08_PLSHEET_LINE',
                 query_date,
                 'no',
                 sqlerrm);
      dbms_output.put_line(sqlerrm);
      rollback;
  end concat_plsheet_line;

  -- append expdetail header
  procedure concat_expdetail_header is
    query_date date;
  
    dept_code varchar2(40);
  begin
    select data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    delete from STD_LAYER.T08_EXPDETAIL_HEADER
     where data_date = query_date;
    -- remove recurred record in the past 12 months
    delete from STD_LAYER.T08_EXPDETAIL_HEADER
     where period_date in
           (select distinct period_date from SRC_LAYER.EBS_EXPDETAIL_HEADER);
  
    insert into STD_LAYER.T08_EXPDETAIL_HEADER
      select report_id,
             report_flag,
             period_date,
             data_date,
             com_code,
             dept_code,
             line_count_num,
             sysdate,
             header_sequence.nextval
        from SRC_LAYER.EBS_EXPDETAIL_HEADER;
       --where substr(period_date, 6) not in ('13', '14', '15');
    commit;
  
    update_log('SRC_LAYER.EBS_EXPDETAIL_HEADER',
               'STD_LAYER.T08_EXPDETAIL_HEADER',
               query_date,
               'yes');
  exception
    when others then
      update_log('SRC_LAYER.EBS_EXPDETAIL_HEADER',
                 'STD_LAYER.T08_EXPDETAIL_HEADER',
                 query_date,
                 'no',
                 sqlerrm);
      dbms_output.put_line(sqlerrm);
      rollback;
  end concat_expdetail_header;

  -- append expdetail line
  procedure concat_expdetail_line is
    query_date   date;
    --period_count number;
    dept_code    varchar2(40);
    -- point to columns identified by dept 
    cursor dept_list is
      select column_name
        from all_tab_columns
       where owner = 'SRC_LAYER'
         AND TABLE_NAME = 'EBS_EXPDETAIL_LINE'
         AND COLUMN_NAME LIKE 'DEPT%'
         AND COLUMN_NAME LIKE '%PTD%';
  begin
    select data_date
      into query_date
      from ETL_CONTROL.CTL_GENERAL_PARAMETER;
    delete from STD_LAYER.T08_EXPDETAIL_LINE where data_date = query_date;
    -- remove recurred record in the past 12 months
    delete from STD_LAYER.T08_EXPDETAIL_LINE
     where period_date in
           (select distinct period_date from SRC_LAYER.EBS_EXPDETAIL_LINE);
  
    for dept_record in dept_list loop
      dept_code := substr(dept_record.column_name, 10);
      execute immediate 'insert into T08_EXPDETAIL_LINE 
        (report_id, item_name,line_num ,etl_date, Data_Date, period_date, dept_code, dept_ptd, dept_ytd, header_id, line_id) 
        select report_id, item_name, line_num, etl_date, Data_Date, period_date , ''' ||
                        dept_code || ''' , DEPT_PTD_' || dept_code ||
                        ' , DEPT_YTD_' || dept_code ||
                        ' , -1 , line_sequence.nextval from src_layer.EBS_EXPDETAIL_LINE';
                        -- where substr(period_date, 6) not in (''13'', ''14'', ''15'')';
    /*
      execute immediate 'insert into T08_EXPDETAIL_LINE_temp 
        (report_id, item_name,line_num ,etl_date, Data_Date, period_date, dept_code, dept_ptd, dept_ytd) 
        select report_id, item_name, line_num, etl_date, Data_Date, period_date , ''' ||
                        dept_code || ''' , DEPT_PTD_' || dept_code ||
                        ' , DEPT_YTD_' || dept_code ||
                        ' from src_layer.EBS_EXPDETAIL_LINE 
                        where substr(period_date, 6) in (''13'', ''14'', ''15'')';
      */                  
      commit;
    end loop;
    -- if period 13,14,15 co-exist 
    /*
    select count(*)
      into period_count
      from (select distinct period_date
              from STD_LAYER.T08_EXPDETAIL_LINE_temp
             where to_number(substr(period_date, 6)) between 13 and 15);
  
    if period_count = 3 then
    
      -- substitute YTD period 12 with 15 
      merge into STD_LAYER.T08_EXPDETAIL_LINE a
      using (select line_num, DEPT_YTD, dept_code
               from STD_LAYER.T08_EXPDETAIL_LINE_temp
              where substr(period_date, 6) = '15') t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_YTD = t.DEPT_YTD
         where substr(a.period_date, 6) = '12';
    
      -- combine period 12,13,14,15 PTD
      merge into STD_LAYER.T08_EXPDETAIL_LINE a
      using (select distinct *
               from (select line_num,
                            dept_code,
                            sum(dept_ptd) over(partition by dept_code, line_num) as sum_ptd
                       from STD_LAYER.T08_EXPDETAIL_LINE_temp)) t
      on (a.line_num = t.line_num and a.dept_code = t.dept_code)
      when matched then
        update
           set a.DEPT_PTD = a.DEPT_PTD + t.sum_ptd
         where substr(a.period_date, 6) = '12';
      commit;
    end if;
    */
    -- set header_id linked with header table
    merge into STD_LAYER.T08_EXPDETAIL_LINE a
    using (select * from STD_LAYER.T08_EXPDETAIL_HEADER) b
    on (a.period_date = b.period_date)
    when matched then
      update set a.header_id = b.header_id;
    -- update etl-date
    update STD_LAYER.T08_EXPDETAIL_LINE
       set etl_date = sysdate
     where data_date = query_date;
  
    update_log('SRC_LAYER.EBS_EXPDETAIL_LINE',
               'STD_LAYER.T08_EXPDETAIL_LINE',
               query_date,
               'yes');
  exception
    when others then
      update_log('SRC_LAYER.EBS_EXPDETAIL_LINE',
                 'STD_LAYER.T08_EXPDETAIL_LINE',
                 query_date,
                 'no',
                 sqlerrm);
      dbms_output.put_line(sqlerrm);
      rollback;
  end concat_expdetail_line;

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
      ('STD_LAYER',
       source_sheet,
       target_sheet,
       query_date,
       sysdate,
       success_status,
       exception_message);
    commit;
  end update_log;

  -- compute period amount by delta ending balance
  procedure get_period_amount is
  begin
    merge into STD_LAYER.T08_BSSHEET_LINE bs
    using (select line_num,
                  period_date,
                  nvl(a.ending_balances - a.previous_balances,
                      a.ending_balances - a.beginning_balances) as period_amount
             from (select line_num,
                          period_date,
                          ending_balances,
                          beginning_balances,
                          lag(ending_balances) over(partition by line_num order by period_date) as previous_balances
                     from STD_LAYER.T08_BSSHEET_LINE) a) re
    on (bs.line_num = re.line_num and bs.period_date = re.period_date)
    when matched then
      update set bs.period_amount = re.period_amount;
    commit;
  end get_period_amount;

  procedure update_bssheet is
  begin
    concat_bssheet_header;
    concat_bssheet_line;
  end update_bssheet;

  procedure update_plsheet is
  begin
    concat_plsheet_header;
    concat_plsheet_line;
  end update_plsheet;

  procedure update_expdetail is
  begin
    concat_expdetail_header;
    concat_expdetail_line;
  end update_expdetail;

end ETL_process_data;
/
