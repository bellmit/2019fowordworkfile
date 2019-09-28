--采购管理
  --采购管理分析
    --按供应商汇总采购金额 "(统计期间内) " 
    select * from DW_PC_SUPPLIER_TOTALSUM  
    select a.cg_gys, --供应商
           a.lastindate, --最后一次入库日期
           sum(gysmoney)gysmoney, --采购总金额
           sysdate etl_time
      from dw_cg_sp a
     group by a.cg_gys, a.lastindate;
    
    --项目采购金额及合同额对比关系"(统计期间内)” 
   select * from  DW_PC_CONTRACT_COMPARISION      
    select a.procode, --项目编号
           a.z_year year, --年份
           sum(a.contractpricedouble)contractprice, --合同额
           sum(b.gysmoney)gysmoney, --采购额
           sysdate etl_time
      from dw_bi_report_ygsj a
      join dw_cg_sp b 
        on a.procode = b.xmbh
       and a.z_year = to_char(b.applydate, 'yyyy')
     group by a.procode, a.z_year;