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
sqlplus etl_control/oracle@82.211.13.98:1521/ICBCAMCDW<<EOF
begin
  -- Call the procedure
  etl_control_std_pkg.start_daily_process;
end;
exit;
EOF







