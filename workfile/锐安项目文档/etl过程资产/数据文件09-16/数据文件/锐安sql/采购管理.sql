--�ɹ�����
  --�ɹ��������
    --����Ӧ�̻��ܲɹ���� "(ͳ���ڼ���) " 
    select * from DW_PC_SUPPLIER_TOTALSUM  
    select a.cg_gys, --��Ӧ��
           a.lastindate, --���һ���������
           sum(gysmoney)gysmoney, --�ɹ��ܽ��
           sysdate etl_time
      from dw_cg_sp a
     group by a.cg_gys, a.lastindate;
    
    --��Ŀ�ɹ�����ͬ��Աȹ�ϵ"(ͳ���ڼ���)�� 
   select * from  DW_PC_CONTRACT_COMPARISION      
    select a.procode, --��Ŀ���
           a.z_year year, --���
           sum(a.contractpricedouble)contractprice, --��ͬ��
           sum(b.gysmoney)gysmoney, --�ɹ���
           sysdate etl_time
      from dw_bi_report_ygsj a
      join dw_cg_sp b 
        on a.procode = b.xmbh
       and a.z_year = to_char(b.applydate, 'yyyy')
     group by a.procode, a.z_year;