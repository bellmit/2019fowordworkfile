--���۷�������

--������Ŀ������
  --��ͬ�ܶ�
  select * from  DW_SD_CONTRACT_TOTALSUM   
  select a.contractcode,
         a.province, --ʡ��
         a.city, --����
         a.departname, --����
         a.z_year, --��
         a.z_quarter, --����
         sum(a.contractPriceDouble)totalsum,
         
         sysdate etl_time
    from dw_bi_report_ygsj a
   group by a.contractcode,
            a.province, --ʡ��
            a.city, --����
            a.departname, --����
            a.z_year, --��
            a.z_quarter;
--ҵ��/�ؿ��
  --��ͬ�ܶ�
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
         --ҵ��
         select a.z_year, --��
                a.z_quarter, --����
                a.deptname, --����
                sum(a.jdtarget), --����ҵ��Ŀ��
                sum(a.jdrealtarget), --����ҵ��ʵ��
                0 RETURN_TARGET_QUAR,
                0 RETURN_ACTUAL_QUAR
           from dw_bi_report_yjmb a
           LEFT JOIN (select a.z_year, --��
                a.z_quarter, --����
                a.deptname, --����
                sum(a.jdtarget), --����ҵ��Ŀ��
                sum(a.jdrealtarget), --����ҵ��ʵ��
                FROM dw_bi_report_yjmb a)B
                ON A.z_year=B.z_year+1 AND A.z_quarter=B.z_quarter AND A.deptname=B.deptname
          where a.isdel is null
            and a.basetype = 1
          group by a.z_year, --��
                   a.z_quarter, --����
                   a.deptname
         UNION ALL
         --�ؿ�
         select a.z_year, --��
                a.z_quarter, --����
                a.deptname, --����
                0 YJ_TARGET_QUAR,
                0 YJ_ACTUAL_QUAR,
                sum(a.jdtarget), --���Ȼؿ�Ŀ��
                sum(a.jdrealtarget) --���Ȼؿ�ʵ��
                
           from dw_bi_report_yjmb a
          where a.isdel is null
            and a.basetype = 2
          group by a.z_year, --��
                   a.z_quarter, --����
                   a.deptname
         )
  GROUP BY YEAR, quarter, departname