#! /bin/bash
cd /dw-data/EBS
echo "strat to load data for csv document"
echo "date is " $1
DOCUMENTNAME="$1-READY"
echo "$DOCUMENTNAME will be used for etl"
T=`date +%D:%r`:
echo "NOW: $T"
# path location 
path="/dw-data/EBS"
echo " ">>"$path"/error.log
echo " ">>"$path"/error.log
echo "***********************">>"$path"/error.log
echo "start to etl the base data">>"$path"/error.log
echo "time: $T">>"$path"/error.log
echo "document: $1-EBS">>"$path"/error.log
echo "***********************">>"$path"/error.log

# find the document named xxxx.xx.xx.READY is exist in the folder or not 
if [ -f "$path/$DOCUMENTNAME" ];then 
  echo "$T $DOCUMENTNAME ready to load data "
  echo "[INFO] $T $DOCUMENTNAME ready to load data ">>"$path"/error.log
  
  # create new folder  when the timefolder not exist
  if [ ! -d "$path/$1" ];then 
    echo "$T $1 folder is not exist , will create the folder after"
	mkdir "$path/$1"
    mkdir "$path/$1"/csv
	mkdir "$path/$1"/log
	mkdir "$path/$1"/bad
    echo "[INFO] $T create folder named $1">>"$path"/error.log
  else
  # delete the tar file befor tar-x 
    echo "$T $1 folder is existed , will delete the folder befor tar"
    echo "[INFO] $T $1 is created will delete befor tar">>"$path"/error.log
    rm -rf "$path/$1"
	mkdir "$path/$1"
    mkdir "$path/$1"/csv
	mkdir "$path/$1"/log
	mkdir "$path/$1"/bad
    echo "[INFO] $T new a folder named $1 again">>"$path"/error.log
  fi
  
  # tar-x the time.tar to the folder time/csv 
  echo "$T tar-x to the folder named $1"
  echo "[INFO] $T tar-x the file to $1/csv">>"$path"/error.log
  if [ -f "$path/$1-EBS.tar" ];then
    echo "[INFO] $T tar -xvf start:">>"$path"/error.log
    tar -xvf "$path/$1-EBS.tar" -C "$1"/csv >>"$path"/error.log
  else 
    echo "$T $1-EBS.tar is not existed "
    echo "[ERROR] $T $1-EBS.tar is not existed ">>"$path"/error.log
  fi
  #######ONLOADDATE#######
 
  echo " ">>"$path"/error.log
 # ONLOAD TABLE EBS_BSSHEET_HEADER
  echo "$T begin to load table EBS_BSSHEET_HEADER"
  echo "[INFO] $T begin to load table EBS_BSSHEET_HEADER">>"$path"/error.log
  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
  sed -i '3d' control/EBS_BSSHEET_HEADER.ctl 
  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
  sed -i "/LOAD DATA/aINFILE "\"$path/$1/csv/$1_bssheet.csv\""" "$path"/control/EBS_BSSHEET_HEADER.ctl 
  echo "************begin**************">>"$path"/error.log
  # SQLLDR FOR LOADDATA
  sqlldr src_layer/oracle@ICBCAMCDW control=control/EBS_BSSHEET_HEADER.ctl bad="$path/$1"/bad/EBS_BSSHEET_HEADER.bad log="$path/$1"/log/EBS_BSSHEET_HEADER.log>>"$path"/error.log
  # IS SUCCESS OR NOT 
  if [ -f "$path/$1"/bad/EBS_BSSHEET_HEADER.bad ];then  
  is_success="no"
  else
  is_success="yes"
  fi
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'$path/$1/csv/$1_bssheet.csv',
'src_layer.EBS_BSSHEET_HEADER',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'$is_success',
'$path/$1/log/EBS_BSSHEET_HEADER.log',
'$path/$1/bad/EBS_BSSHEET_HEADER.bad');
commit;
exit;
EOF
  echo "*************end***************">>"$path"/error.log


  echo " ">>"$path"/error.log
 # ONLOAD TABLE EBS_BSSHEET_LINE
  echo "$T begin to load table EBS_BSSHEET_LINE"
  echo "[INFO] $T begin to load table EBS_BSSHEET_LINE">>"$path"/error.log
  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
  sed -i '3d' control/EBS_BSSHEET_LINE.ctl 
  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
  sed -i "/LOAD DATA/aINFILE "\"$path/$1/csv/$1_bssheet.csv\""" "$path"/control/EBS_BSSHEET_LINE.ctl
  echo "************begin**************">>"$path"/error.log  
  # SQLLDR FOR LOADDATA
  sqlldr src_layer/oracle@ICBCAMCDW control=control/EBS_BSSHEET_LINE.ctl bad="$path/$1"/bad/EBS_BSSHEET_LINE.bad log="$path/$1"/log/EBS_BSSHEET_LINE.log>>"$path"/error.log
    # IS SUCCESS OR NOT 
  if [ -f "$path/$1"/bad/EBS_BSSHEET_LINE.bad ];then  
  is_success="no"
  else
  is_success="yes"
  fi
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'$path/$1/csv/$1_bssheet.csv',
'src_layer.EBS_BSSHEET_LINE',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'$is_success',
'$path/$1/log/EBS_BSSHEET_LINE.log',
'$path/$1/bad/EBS_BSSHEET_LINE.bad');
commit;
exit;
EOF
  echo "*************end***************">>"$path"/error.log
  
  
  echo " ">>"$path"/error.log
 # ONLOAD TABLE EBS_PLSHEET_HEADER
  echo "$T begin to load table EBS_PLSHEET_HEADER"
  echo "[INFO] $T begin to load table EBS_PLSHEET_HEADER">>"$path"/error.log
  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
  sed -i '3d' control/EBS_PLSHEET_HEADER.ctl 
  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
  sed -i "/LOAD DATA/aINFILE "\"$path/$1/csv/$1_plsheet.csv\""" "$path"/control/EBS_PLSHEET_HEADER.ctl 
  echo "************begin**************">>"$path"/error.log
  # SQLLDR FOR LOADDATA
  sqlldr src_layer/oracle@ICBCAMCDW control=control/EBS_PLSHEET_HEADER.ctl bad="$path/$1"/bad/EBS_PLSHEET_HEADER.bad log="$path/$1"/log/EBS_PLSHEET_HEADER.log>>"$path"/error.log
  # IS SUCCESS OR NOT 
  if [ -f "$path/$1"/bad/EBS_PLSHEET_HEADER.bad ];then  
  is_success="no"
  else
  is_success="yes"
  fi
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'$path/$1/csv/$1_plsheet.csv',
'src_layer.EBS_PLSHEET_HEADER',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'$is_success',
'$path/$1/log/EBS_PLSHEET_HEADER.log',
'$path/$1/bad/EBS_PLSHEET_HEADER.bad');
commit;
exit;
EOF
  echo "*************end***************">>"$path"/error.log
  
  
  echo " ">>"$path"/error.log
 # ONLOAD TABLE EBS_PLSHEET_LINE
  echo "$T begin to load table EBS_PLSHEET_LINE"
  echo "[INFO] $T begin to load table EBS_PLSHEET_LINE">>"$path"/error.log
  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
  sed -i '3d' control/EBS_PLSHEET_LINE.ctl 
  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
  sed -i "/LOAD DATA/aINFILE "\"$path/$1/csv/$1_plsheet.csv\""" "$path"/control/EBS_PLSHEET_LINE.ctl 
  echo "************begin**************">>"$path"/error.log
  # SQLLDR FOR LOADDATA
  sqlldr src_layer/oracle@ICBCAMCDW control=control/EBS_PLSHEET_LINE.ctl bad="$path/$1"/bad/EBS_PLSHEET_LINE.bad log="$path/$1"/log/EBS_PLSHEET_LINE.log>>"$path"/error.log
  # IS SUCCESS OR NOT 
  if [ -f "$path/$1"/bad/EBS_PLSHEET_LINE.bad ];then  
  is_success="no"
  else
  is_success="yes"
  fi
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'$path/$1/csv/$1_plsheet.csv',
'src_layer.EBS_PLSHEET_LINE',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'$is_success',
'$path/$1/log/EBS_PLSHEET_LINE.log',
'$path/$1/bad/EBS_PLSHEET_LINE.bad');
commit;
exit;
EOF
  echo "*************end***************">>"$path"/error.log


  echo " ">>"$path"/error.log
 # ONLOAD TABLE EBS_EXPDETAIL_HEADER
  echo "$T begin to load table EBS_EXPDETAIL_HEADER"
  echo "[INFO] $T begin to load table EBS_EXPDETAIL_HEADER">>"$path"/error.log
  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
  sed -i '3d' control/EBS_EXPDETAIL_HEADER.ctl 
  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
  sed -i "/LOAD DATA/aINFILE "\"$path/$1/csv/$1_expdetail.csv\""" "$path"/control/EBS_EXPDETAIL_HEADER.ctl 
  echo "************begin**************">>"$path"/error.log
  # SQLLDR FOR LOADDATA
  sqlldr src_layer/oracle@ICBCAMCDW control=control/EBS_EXPDETAIL_HEADER.ctl bad="$path/$1"/bad/EBS_EXPDETAIL_HEADER.bad log="$path/$1"/log/EBS_EXPDETAIL_HEADER.log>>"$path"/error.log
  # IS SUCCESS OR NOT 
  if [ -f "$path/$1"/bad/EBS_EXPDETAIL_HEADER.bad ];then  
  is_success="no"
  else
  is_success="yes"
  fi
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'$path/$1/csv/$1_expdetail.csv',
'src_layer.EBS_EXPDETAIL_HEADER',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'$is_success',
'$path/$1/log/EBS_EXPDETAIL_HEADER.log',
'$path/$1/bad/EBS_EXPDETAIL_HEADER.bad');
commit;
exit;
EOF
  echo "*************end***************">>"$path"/error.log
  
  
  echo " ">>"$path"/error.log
 # ONLOAD TABLE EBS_EXPDETAIL_LINE
  echo "$T begin to load table EBS_EXPDETAIL_LINE"
  echo "[INFO] $T begin to load table EBS_EXPDETAIL_LINE">>"$path"/error.log
  # UPDATE THE PROPERTY CSV DOCUMENT TO ADAPT HAVING DOCUMENT
  sed -i '3d' control/EBS_EXPDETAIL_LINE.ctl 
  # INSERT TRUE CONFIG FOR CONTROL DOCUMENT
  sed -i "/LOAD DATA/aINFILE "\"$path/$1/csv/$1_expdetail.csv\""" "$path"/control/EBS_EXPDETAIL_LINE.ctl 
  echo "************begin**************">>"$path"/error.log
  # SQLLDR FOR LOADDATA
  sqlldr src_layer/oracle@ICBCAMCDW control=control/EBS_EXPDETAIL_LINE.ctl bad="$path/$1"/bad/EBS_EXPDETAIL_LINE.bad log="$path/$1"/log/EBS_EXPDETAIL_LINE.log>>"$path"/error.log
    # IS SUCCESS OR NOT 
  if [ -f "$path/$1"/bad/EBS_EXPDETAIL_LINE.bad ];then  
  is_success="no"
  else
  is_success="yes"
  fi
  # INSERT THE ETL RESULT INTO DATABASE  
  sqlplus etl_control/oracle@ICBCAMCDW<<EOF
set linesize 200
set pagesize 200
insert into ETL_CONTROL_LOG 
(ETL_MODLE,ETL_SOURCE,ETL_TARGET,DATA_DATE,ETL_DATE,IS_SUCCESS,LOG_PATH,ERROR_PATH) 
values 
('src_layer',
'$path/$1/csv/$1_expdetail.csv',
'src_layer.EBS_EXPDETAIL_LINE',
(select data_date from etl_control.ctl_general_parameter where rownum=1),
sysdate,
'$is_success',
'$path/$1/log/EBS_EXPDETAIL_LINE.log',
'$path/$1/bad/EBS_EXPDETAIL_LINE.bad');
commit;
exit;
EOF
  echo "*************end***************">>"$path"/error.log
  
  
else 
echo "$T the ready document is not exist ,please check whether the file is ready "
echo "[ERROR] $T startelt at  not exist $DOCUMENTNAME">>"$path"/error.log
fi
