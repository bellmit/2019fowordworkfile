--公司经营指标分析

 --基础经营指标分析(当年)
   --合同总额
   SELECT * FROM  DW_BM_CONTRACT_TOTALSUM 
   select a.departname, --部门
          a.z_year,--当年
          sum(a.contractPriceDouble) --合同总额
     from dw_bi_report_ygsj a
    group by a.DEPARTNAME, a.z_year;
    
   --业绩总额
   SELECT * FROM   DW_BM_YJ_TOTALSUM 

   select a.deptname, --部门
          a.z_year YEAR, --当年
          A.Z_QUARTER QUARTER,--季度
          sum(a.ndtarget)target, --年度回款目标
          sum(a.ndreal)actual_sum, --年度回款实际
          case
            when nvl(sum(a.ndtarget), 0) = 0 then
             0
            else
             sum(a.ndreal) / sum(a.ndtarget)
          end nd_lv,
          SYSDATE ETL_TIME
     from dw_bi_report_yjmb a
    where a.isdel is null
      and a.basetype = 1
    group by a.deptname, a.z_year，A.Z_QUARTER;
   --回款情况
   SELECT * FROM   DW_BM_RETURN_TOTALSUM 
 
   select a.deptname, --部门
           a.z_year,--当年
          sum(a.ndreal) --回款总额
     from dw_bi_report_yjmb a
    where a.isdel is null
      and a.basetype = 2
    group by a.deptname, a.z_year;
    
   
          
          

          
---------------------------------------------------------------------
   --完工情况
   select *  from  DW_BM_FINISHED_DETAIL  
   select a.project_organization_code department, --部门
          to_char(b.actual_finish_date,'YYYY')YEAR,-- 年度
          SUM(A.CONTRACT_AMOUNT)CONTRACT_AMOUNT,--合同金额
          sysdate etl_time
     from dw_construct_project a
     join dw_construct_milestone b on a.id = b.construct_project_id
    where b.milestone_name = '完工'
      and b.actual_finish_date is not null
      GROUP BY  a.project_organization_code,to_char(b.actual_finish_date,'YYYY');
   --验收情况
   select * from   DW_BM_CHECK_DETAIL  
   select a.project_organization_code department, 
          to_char(b.actual_finish_date,'YYYY')YEAR,-- 年度
          SUM(A.CONTRACT_AMOUNT)CONTRACT_AMOUNT,--合同金额
          sysdate etl_time
     from dw_check_project a
     join dw_check_milestone b on a.id = b.check_project_id
    where b.milestone_name = '终验'
      and b.actual_finish_date is not null
       GROUP BY  a.project_organization_code,to_char(b.actual_finish_date,'YYYY');

