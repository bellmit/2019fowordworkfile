OPTIONS (skip=1)
LOAD DATA
INFILE "/dw-data/AICS/testcsv/TCREDITOR_VARY_RELATION.csv"
truncate
INTO TABLE AICS_CREDITOR_VARY_RELATION
fields terminated by "^*"
Optionally enclosed by '"'
trailing nullcols
(
  virtual_colum FILLER,
  relationid           ,
  ijourid              ,
  creditorcontractcode ,
  ofeesetcorpusamount  ,
  ofeesetinterest      ,
datadate  "(select data_date from etl_control.ctl_general_parameter)",
etl_date "sysdate "
)
