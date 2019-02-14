OPTIONS (skip=1)
LOAD DATA
INFILE "/dw-data/AICS/testcsv/TINVEST_PROFITDETAIL.csv"
truncate
INTO TABLE AICS_INVEST_PROFITDETAIL
fields terminated by "^*"
Optionally enclosed by '"'
trailing nullcols
(
  virtual_colum FILLER,
  pkid                   ,
  ijourid                ,
  projectcode            ,
  subprojectcode         ,
  investcode             ,
  contractid             ,
  assetid                ,
  repayway               ,
  extflag                ,
  profitkind             ,
  occur_invest           ,
  bdate                  DATE"YYYY-MM-DD HH24:MI:SS" ,
  edate                  DATE"YYYY-MM-DD HH24:MI:SS" ,
  settldate              DATE"YYYY-MM-DD HH24:MI:SS" ,
  calcway                ,
  rate                   ,
  profit                 ,
  balance                ,
  afflid                 ,
  modiflag               ,
  status                 ,
  rateid                 ,
  planid                 ,
  remark                 ,
  remitstatus            ,
  extid                  ,
  days                   ,
  ratedays               ,
  loanaccountcode        ,
  repay_confirmdetail_id ,
datadate  "(select data_date from etl_control.ctl_general_parameter)",
etl_date "sysdate "
)
