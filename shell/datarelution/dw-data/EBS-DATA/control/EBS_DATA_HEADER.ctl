OPTIONS (load=1)
LOAD DATA
INFILE "/dw-data/EBS-DATA/20190116/csv/20190116_per_all_people_f_201901.csv"
append
INTO TABLE EBS_DATA_HEADER
fields terminated by "^*"
Optionally enclosed by '"'
trailing nullcols
(
report_id,
report_flag,
period_date,
data_date DATE"YYYYMMDD",
line_count_num "to_number(:line_count_num)",
etl_date "sysdate"
)
