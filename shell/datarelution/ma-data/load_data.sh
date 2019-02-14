#! /bin/bash
cd /ma-data

echo "date is " $1
path="/ma-data"

T=`date +%D:%r`:
echo "NOW: $T"
echo " ">>"$path"/error.log
echo " ">>"$path"/error.log
echo "***********************">>"$path"/error.log
echo "start to loaddata">>"$path"/error.log
echo "time: $T">>"$path"/error.log
echo "document: $1-EBS-MA.dmp">>"$path"/error.log
echo "***********************">>"$path"/error.log

# 将数据导出

rm /dw-data/EBS/$1-EBS-MA.dmp

exp ext_layer/oracle@ICBCAMCDW file=/dw-data/EBS/$1-EBS-MA.dmp tables="(MA_BSSHEET_HEADER,MA_PLSHEET_HEADER,MA_EXPDETAIL_HEADER,MA_BSSHEET_LINE,MA_PLSHEET_LINE,MA_EXPDETAIL_LINE,MA_AP_INVOICES_ALL
,MA_AP_INVOICE_LINES_ALL,MA_AP_INVOICE_DISTRIBUTIONS_ALL,MA_AP_SUPPLIERS,MA_GL_LEDGERS,MA_FND_FLEX_VALUE_SETS,MA_FND_FLEX_VALUES,MA_GL_CODE_COMBINATIONS,MA_GL_BALANCES,MA_FND_ID_FLEX_SEGMENTS)"

# 将数据置于本文件夹中文件
rm /ma-data/$1-EBS-MA.dmp

cp /dw-data/EBS/$1-EBS-MA.dmp /ma-data

echo "drop and create user"
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus maetl/maetl@madb<<EOF
TRUNCATE table  MA_BSSHEET_HEADER;
TRUNCATE table  MA_PLSHEET_HEADER;
TRUNCATE table  MA_EXPDETAIL_HEADER;
TRUNCATE table  MA_BSSHEET_LINE;
TRUNCATE table  MA_PLSHEET_LINE;
TRUNCATE table  MA_EXPDETAIL_LINE;
TRUNCATE table  MA_AP_INVOICES_ALL;
TRUNCATE table  MA_AP_INVOICE_LINES_ALL;
TRUNCATE table  MA_AP_INVOICE_DISTRIBUTIONS_ALL;
TRUNCATE table  MA_AP_SUPPLIERS;
TRUNCATE table  MA_GL_LEDGERS;
TRUNCATE table  MA_FND_FLEX_VALUE_SETS;
TRUNCATE table  MA_FND_FLEX_VALUES;
TRUNCATE table  MA_GL_CODE_COMBINATIONS;
TRUNCATE table  MA_GL_BALANCES;
TRUNCATE table  MA_FND_ID_FLEX_SEGMENTS;
exit;
EOF
if [ -f "$1-EBS-MA.dmp" ];then 
  imp maetl/maetl@madb file=/ma-data/"$1"-EBS-MA.dmp tables="(MA_BSSHEET_HEADER,MA_PLSHEET_HEADER,MA_EXPDETAIL_HEADER,MA_BSSHEET_LINE,MA_PLSHEET_LINE,MA_EXPDETAIL_LINE,MA_AP_INVOICES_ALL
,MA_AP_INVOICE_LINES_ALL,MA_AP_INVOICE_DISTRIBUTIONS_ALL,MA_AP_SUPPLIERS,MA_GL_LEDGERS,MA_FND_FLEX_VALUE_SETS,MA_FND_FLEX_VALUES,MA_GL_CODE_COMBINATIONS,MA_GL_BALANCES,MA_FND_ID_FLEX_SEGMENTS)" fromuser=ext_layer touser=MAETL ignore=y>>error.log
  else 
  echo "file is not exist on the parm date"
fi