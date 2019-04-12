OPTIONS (load=1)
LOAD DATA
INFILE "/dw-data/EBS/20190131/csv/20190131_plsheet.csv"
truncate
INTO TABLE EBS_PLSHEET_HEADER
fields terminated by ","
Optionally enclosed by '"'
trailing nullcols
(
report_id,
report_flag,
period_date,
data_date DATE"YYYYMMDD",
com_code,
dept_code,
line_count_num "to_number(:line_count_num)",
etl_date "sysdate"
)
