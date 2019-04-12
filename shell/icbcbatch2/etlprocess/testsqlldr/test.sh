#!/bin/bash
sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
spool outresult.csv 
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'path',
'test',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'yes',
'loction',
'errorlocation');
commit;
exit;
spool off
EOF
