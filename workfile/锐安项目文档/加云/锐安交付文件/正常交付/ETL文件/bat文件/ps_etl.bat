@echo off
set d=%date:~0,4%%date:~5,2%%date:~8,2%
set name=ps_etl_%d%.log
d:
cd\
cd D:\Users\User\Desktop\pdi-ce-7.1.0.0-12\data-integration
kitchen.bat/file D:\ETL\ACT_ETL\J_DW_PS_ANALYSE.kjb /logfile=D:\ETL\logs\%name%
exit