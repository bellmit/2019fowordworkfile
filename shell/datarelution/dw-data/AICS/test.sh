path="/dw-data/AICS"

 #truncate table EBS_DATA_HEADER
 sqlplus src_layer/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
truncate table AICS_DATA_HEADER;
commit;
exit;
EOF
 
 
# for file in $path/testcsv/* ;
# do  
#  #get  document name and period 
#  echo $file
#  #get filename
#  temp=${file##*/}
#  filename=${temp%.*}
#  echo filename is $filename  
#  echo "[INFO] $T $file is begining"
#  period=${file:0-10:6}
#  echo $period
#  echo "$T begin to load table  AICS_DATA_HEADER"
#  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
#  sed -i '3d' "$path"/control/AICS_DATA_HEADER.ctl 
#  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
#  sed -i "/LOAD DATA/aINFILE "\"$file\""" "$path"/control/AICS_DATA_HEADER.ctl 
#  # SQLLDR FOR LOADDATA
#  sqlldr src_layer/oracle@ICBCAMCDW control="$path"/control/AICS_DATA_HEADER.ctl bad="$path"/"$filename"_HEADER.bad log="$path"/"$filename"_HEADER.log
#  done
  

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_ACCOUNT_BANKINFO.ctl" log=bankinfo.log bad=backinfo.bad
 
sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_ASSET_LOANACCOUNT_INFO.ctl" log=losnsvvountinfo.log bad=losnsvvountinfo.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_CREDITOR_VARY_RELATION.ctl" log=creditorveryrelation.log bad=creditorveryrelation.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_CUSTOMER_INFO.ctl" log=customer.log bad=customer.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_EQUITY_ASSETS_INFO.ctl" log=equity_assets_info.log bad=equity_assets_info.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_INVEST_CONTRACT.ctl" log=invest_contract.log bad=invest_contract.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_INVEST_FUNDVARY.ctl" log=invest_fundvary.log bad=invest_fundvary.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_INVEST_PROFITDETAIL.ctl" log=invest_profitdetail.log bad=invest_profitdetail.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_REPAY_INFO.ctl" log=repay_info.log bad=repay_info.bad

sqlldr src_layer/oracle@ICBCAMCDW control="/dw-data/AICS/control/AICS_PROJECT_INFO.ctl" log=project_info.log bad=project_info.bad

