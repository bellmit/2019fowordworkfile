@echo off
set name=mm_etl.log
d:
cd\
cd D:\pdi-ce-7.1.0.0-12\data-integration
kitchen.bat/file D:\ETL\ACT_ETL\J_DW_MM_ANALYSE.kjb /logfile=D:\ETL\logs\%name%
exit