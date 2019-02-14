#!/bin/bash
sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set feedback off
set colsep
set heading off
set trimout on 
set serveroutput off
set echo off
set pagesize 0
set define off
set serveroutput off
spool outresult.csv 
SELECT ETL_MODLE||'^*'||ETL_SOURCE FROM  ETL_CONTROL_LOG;
spool off
exit
EOF
