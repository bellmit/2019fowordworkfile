OPTIONS (skip=1)
LOAD DATA
INFILE ""
truncate
INTO TABLE AICS_TASSET_LOANACCOUNT
fields terminated by "^*"
Optionally enclosed by '"'
trailing nullcols
(
  projectcode       ,
  subprojectcode    ,
  loanaccountcode   ,
  init_balance      ,
  current_balance   ,
  frozen_balance    ,
  unfrozen_balance  ,
  current_assetcost ,
  moneytype         ,
  createuser        ,
  createtime        DATE"DD-MM-YY" ,
  updateuser        ,
  updatetime        DATE"DD-MM-YY" ,
data_date  "(select data_date from etl_control.ctl_general_parameter)",
etl_date "sysdate "
)
