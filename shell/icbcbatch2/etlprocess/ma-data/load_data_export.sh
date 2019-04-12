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


