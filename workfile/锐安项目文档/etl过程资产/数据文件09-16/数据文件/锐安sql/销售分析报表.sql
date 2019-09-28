--销售分析报表

--销售项目分析：
  --合同总额
  select * from  DW_SD_CONTRACT_TOTALSUM   
  select a.contractcode,
         a.province, --省份
         a.city, --地市
         a.departname, --部门
         a.z_year, --年
         a.z_quarter, --季度
         sum(a.contractPriceDouble)totalsum,
         
         sysdate etl_time
    from dw_bi_report_ygsj a
   group by a.contractcode,
            a.province, --省份
            a.city, --地市
            a.departname, --部门
            a.z_year, --年
            a.z_quarter;
--业绩/回款报表
  --合同总额
select * from  DW_SD_PERFORMANCE_PAYMENT
 SELECT YEAR,
        quarter,
        departname,
        SUM(YJ_TARGET_QUAR) YJ_TARGET_QUAR,
        SUM(YJ_ACTUAL_QUAR) YJ_ACTUAL_QUAR,
        SUM(RETURN_TARGET_QUAR)RETURN_TARGET_QUAR,
        SUM(RETURN_ACTUAL_QUAR)RETURN_ACTUAL_QUAR,
        SYSDATE ETL_TIME
   FROM (
         --业绩
         select a.z_year, --年
                a.z_quarter, --季度
                a.deptname, --部门
                sum(a.jdtarget), --季度业绩目标
                sum(a.jdrealtarget), --季度业绩实际
                0 RETURN_TARGET_QUAR,
                0 RETURN_ACTUAL_QUAR
           from dw_bi_report_yjmb a
           LEFT JOIN (select a.z_year, --年
                a.z_quarter, --季度
                a.deptname, --部门
                sum(a.jdtarget), --季度业绩目标
                sum(a.jdrealtarget), --季度业绩实际
                FROM dw_bi_report_yjmb a)B
                ON A.z_year=B.z_year+1 AND A.z_quarter=B.z_quarter AND A.deptname=B.deptname
          where a.isdel is null
            and a.basetype = 1
          group by a.z_year, --年
                   a.z_quarter, --季度
                   a.deptname
         UNION ALL
         --回款
         select a.z_year, --年
                a.z_quarter, --季度
                a.deptname, --部门
                0 YJ_TARGET_QUAR,
                0 YJ_ACTUAL_QUAR,
                sum(a.jdtarget), --季度回款目标
                sum(a.jdrealtarget) --季度回款实际
                
           from dw_bi_report_yjmb a
          where a.isdel is null
            and a.basetype = 2
          group by a.z_year, --年
                   a.z_quarter, --季度
                   a.deptname
         )
  GROUP BY YEAR, quarter, departname