--��˾��Ӫָ�����

 --������Ӫָ�����(����)
   --��ͬ�ܶ�
   SELECT * FROM  DW_BM_CONTRACT_TOTALSUM 
   select a.departname, --����
          a.z_year,--����
          sum(a.contractPriceDouble) --��ͬ�ܶ�
     from dw_bi_report_ygsj a
    group by a.DEPARTNAME, a.z_year;
    
   --ҵ���ܶ�
   SELECT * FROM   DW_BM_YJ_TOTALSUM 

   select a.deptname, --����
          a.z_year YEAR, --����
          A.Z_QUARTER QUARTER,--����
          sum(a.ndtarget)target, --��Ȼؿ�Ŀ��
          sum(a.ndreal)actual_sum, --��Ȼؿ�ʵ��
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
    group by a.deptname, a.z_year��A.Z_QUARTER;
   --�ؿ����
   SELECT * FROM   DW_BM_RETURN_TOTALSUM 
 
   select a.deptname, --����
           a.z_year,--����
          sum(a.ndreal) --�ؿ��ܶ�
     from dw_bi_report_yjmb a
    where a.isdel is null
      and a.basetype = 2
    group by a.deptname, a.z_year;
    
   
          
          

          
---------------------------------------------------------------------
   --�깤���
   select *  from  DW_BM_FINISHED_DETAIL  
   select a.project_organization_code department, --����
          to_char(b.actual_finish_date,'YYYY')YEAR,-- ���
          SUM(A.CONTRACT_AMOUNT)CONTRACT_AMOUNT,--��ͬ���
          sysdate etl_time
     from dw_construct_project a
     join dw_construct_milestone b on a.id = b.construct_project_id
    where b.milestone_name = '�깤'
      and b.actual_finish_date is not null
      GROUP BY  a.project_organization_code,to_char(b.actual_finish_date,'YYYY');
   --�������
   select * from   DW_BM_CHECK_DETAIL  
   select a.project_organization_code department, 
          to_char(b.actual_finish_date,'YYYY')YEAR,-- ���
          SUM(A.CONTRACT_AMOUNT)CONTRACT_AMOUNT,--��ͬ���
          sysdate etl_time
     from dw_check_project a
     join dw_check_milestone b on a.id = b.check_project_id
    where b.milestone_name = '����'
      and b.actual_finish_date is not null
       GROUP BY  a.project_organization_code,to_char(b.actual_finish_date,'YYYY');

