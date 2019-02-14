# spool 导出csv样例
- **exmaple**
```sql
set feedback off
set colsep
set heading off
set trimout on
set serveroutput off
set echo off
set pagesize 0
spool C:\outresult.csv
select etl_modle||'^*'||etl_source from etl_control_log
spool off
```