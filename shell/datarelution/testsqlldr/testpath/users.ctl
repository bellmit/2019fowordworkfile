OPTIONS (skip=1,rows=128)
LOAD DATA
INFILE "../csvdocument/20181224-TEST.csv"
truncate
INTO TABLE test_user
fields terminated by ","
Optionally enclosed by '"'
trailing nullcols
(
virtual_colum FILLER,
user_id "to_number(:user_id)",
user_name,
login_times,
last_login DATE"YYYY-MM-DD HH24:MI:SS",
times "sysdate",
id "test_user_s.nextval"
)

