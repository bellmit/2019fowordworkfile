--老系统-业绩管理中心-业绩记录基础表
select a.id, --编号
       a.contractcode, --合同号
       a.htjfname, --合同甲方名称
       a.province, --省份
       a.city, --地市
       a.zjl, --总经理
       a.departname, --部门
       a.hangye, --行业
       a.sellperson, --销售人员
       a.contractproname, --合同名称
       a.clientcompanyname, --最终用户名称
       a.procode, --项目编号
       a.htztcostname, --合同主体成本中心名称
       a.contractsigndate, --合同签订日期
       a.z_year, --年
       a.z_quarter, --季度
       sum(a.contractpricedouble), --合同总金额(万元)
       sum(a.performrecordnum), --业绩记录金额(万元)
       sum(a.contractdivide) --合同拆分金额(万元)
  from dw_bi_report_ygsj a
 group by a.id, --编号
          a.contractcode, --合同号
          a.htjfname, --合同甲方名称
          a.province, --省份
          a.city, --地市
          a.zjl, --总经理
          a.departname, --部门
          a.hangye, --行业
          a.sellperson, --销售人员
          a.contractproname, --合同名称
          a.clientcompanyname, --最终用户名称
          a.procode, --项目编号
          a.htztcostname, --合同主体成本中心名称
          a.contractsigndate, --合同签订日期
          a.z_year, --年
          a.z_quarter --季度
 order by a.id desc;

