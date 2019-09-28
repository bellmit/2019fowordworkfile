@echo off
set d=%date:~0,4%%date:~5,2%%date:~8,2%
set name=ind_rgic_%d%.log
d:
cd\
cd D:\pdi-ce-7.1.0.0-12\data-integration
kitchen.bat/file D:\ETL\ACT_ETL\J_DW_FI_INF_RGIC.kjb /logfile=D:\ETL\logs\%name%
exit