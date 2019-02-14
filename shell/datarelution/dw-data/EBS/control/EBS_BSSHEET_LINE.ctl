OPTIONS (skip=1)
LOAD DATA
INFILE "/dw-data/EBS/20190131/csv/20190131_bssheet.csv"
truncate
INTO TABLE EBS_BSSHEET_LINE
fields terminated by ","
Optionally enclosed by '"'
trailing nullcols
(
report_id,
ITEM_NAME,
LINE_NUM,
BEGINNING_BALANCES "to_number(:BEGINNING_BALANCES)",
ENDING_BALANCES "to_number(:ENDING_BALANCES)",
etl_date "sysdate",
data_date "(select data_date from etl_control.ctl_general_parameter)",
line_id "line_sequence.nextval",
header_id "10"
)
