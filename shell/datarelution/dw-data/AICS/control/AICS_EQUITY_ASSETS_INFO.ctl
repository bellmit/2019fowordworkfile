OPTIONS (skip=1)
LOAD DATA
INFILE "/dw-data/AICS/testcsv/TEQUITY_ASSETS_INFO.csv"
truncate
INTO TABLE AICS_EQUITY_ASSETS_INFO
fields terminated by "^*"
Optionally enclosed by '"'
trailing nullcols
(
  virtual_colum FILLER,
  equityassetno      ,
  equityassetname    ,
  projectcode        ,
  assetholder        ,
  equitynature       ,
  equitybalance      ,
  stockamount        ,
  equityratio        ,
  equitystatus       ,
  checkflag          ,
  markettype         ,
  enterprise         ,
  investindustry     ,
  cykind             ,
  investbalance      ,
  remark             ,
  heldhandlestatus   ,
  rejecttype         ,
  propertynature     ,
  updateuser         ,
  accountvalue       ,
  equityassetcode    ,
  shareholding       ,
  stockcode          ,
  releasedate        DATE"YYYY-MM-DD HH24:MI:SS" ,
  stockname          ,
  holdingnumber      ,
  carrycost          ,
  carrybalance       ,
  latestbalance      ,
  predictyield       ,
  predictyieldlimit  ,
  realinvestdate     DATE"YYYY-MM-DD HH24:MI:SS" ,
  serialno           ,
  maininvestpart     ,
  process_instanceid ,
datadate  "(select data_date from etl_control.ctl_general_parameter)",
etl_date "sysdate "
)
