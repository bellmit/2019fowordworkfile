OPTIONS (skip=1)
LOAD DATA
INFILE "/dw-data/EBS/20190131/csv/20190131_expdetail.csv"
truncate
INTO TABLE EBS_EXPDETAIL_LINE
fields terminated by ","
Optionally enclosed by '"'
trailing nullcols
(
report_id,
ITEM_NAME,
LINE_NUM,
DEPT_0602800001 "to_number(:DEPT_0602800001)",
DEPT_0602800002 "to_number(:DEPT_0602800002)",
DEPT_0602800003 "to_number(:DEPT_0602800003)",
DEPT_0602800004 "to_number(:DEPT_0602800004)",
DEPT_0602800005 "to_number(:DEPT_0602800005)",
DEPT_0602800006 "to_number(:DEPT_0602800006)",
DEPT_0602800007 "to_number(:DEPT_0602800007)",
DEPT_0602800008 "to_number(:DEPT_0602800008)",
DEPT_0602800009 "to_number(:DEPT_0602800009)",
DEPT_0602800010 "to_number(:DEPT_0602800010)",
DEPT_0602800011 "to_number(:DEPT_0602800011)",
DEPT_0602800012 "to_number(:DEPT_0602800012)",
DEPT_0602800013 "to_number(:DEPT_0602800013)",
DEPT_9999999 "to_number(:DEPT_9999999)",
DEPT_0 "to_number(:DEPT_0)",
etl_date "sysdate",
data_date "(select data_date from etl_control.ctl_general_parameter)"
)
