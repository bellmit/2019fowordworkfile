echo "执行时间$1"

echo "执行src层数据抽取"
echo "开始执行ebsreport"
cd /dw-data/EBS-REPORT
./startreportetl.sh $1


echo "开始执行ebsreportaud"
cd /dw-data/EBS-REPORT-AUD
./startreportaudetl.sh $1

echo "开始执行ebsdata"
cd /dw-data/EBS-DATA
./start_etl.sh $1


echo "执行std层存储过程"
sqlplus etl_control/oracle@ICBCAMCDW<<EOF
begin
  -- Call the procedure
  etl_control_std_pkg.start_daily_process;
end;
exit;
EOF


echo "执行ext层存储过程"
sqlplus etl_control/oracle@ICBCAMCDW<<EOF
begin
  -- Call the procedure
  etl_control_ext_pkg.start_daily_process;
end;
exit;
EOF

echo "执行从数据仓库到管会的shell脚本"

cd /ma-data
./load_data $1


echo "执行maadmin层存储过程"
sqlplus maadmin/maadmin@MADB<<EOF
begin
  -- Call the procedure
  etl_to_ma_process_pck.ma_total_control;
end;
exit;
EOF

echo "执行maadmin层存储过程"
sqlplus maadmin/maadmin@MADB<<EOF
begin
  -- Call the procedure
  etl_data_process_pck.total_control;
end;
exit;
EOF






