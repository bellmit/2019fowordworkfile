WITH dept AS (
SELECT a.db_key dept1
      ,b.db_key dept2
      ,c.db_key dept3
      ,d.db_key dept4
      ,f.db_key dept5
  FROM dw_fi_dept a
  LEFT JOIN dw_fi_dept b ON b.parent_key = a.db_key
  LEFT JOIN dw_fi_dept c ON c.parent_key = b.db_key
  LEFT JOIN dw_fi_dept d ON d.parent_key = c.db_key
  LEFT JOIN dw_fi_dept f ON f.parent_key = d.db_key)
 ,dept1 AS (--�û����������ģ������ų��ڲ�����
   SELECT dept1 dept  FROM dept a WHERE a.dept1 ='8999'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 ='8999'--�û���Ӧ����������
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1='8999'
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1='8999'       
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 ='8999')
   
  ,dept2 AS (--�������������ģ������ų��ײ�����
   SELECT dept1 dept  FROM dept a WHERE a.dept1 ='8999'--�������Ĳ���
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 ='8999'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1='8999'
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1='8999'       
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 ='8999') 
, base as (
select * from dw_fi_detail a where a.racct between '1001000000' and '1001999999'
union all
select * from dw_fi_detail a where a.racct between '1002000000' and '1002999999'
union all
select * from dw_fi_detail a where a.racct between '1003000000' and '1003999999'
union all
select * from dw_fi_detail a where a.racct between 'A100100000' and 'A100199999')
    
select a.batch_num
      ,a.gjahr --��
      ,a.poper --����ڼ�
      ,a.budat --��������
      ,a.belnr --ƾ֤��
      ,a.prctr --��������         
      ,a.sprctr --�����������
      ,a.racct --��Ŀ
      ,a.racct_t --ժҪ
      ,a.mat_pspnr --WBSԪ��
      ,a.RSTGR --ԭ�����
      ,tdate --��������
      ,dmbtr1 --��λ�ҽ��
  FROM base a
 WHERE a.gjahr = '2019' --�����   
   AND a.poper = '006' --�ڼ���� ����ȡ�������Ҫ<='006'
   AND a.RSTGR in  (select A.rstgr 
from (select * from dw_fi_cash_header B where B.zc_index='11')B--���������
left join (select rstgr ,txt20  from dw_fi_reason_des)A
on a.rstgr=b.reason_code)
   AND TRIM(leading '0' FROM a.prctr) in  (SELECT dept FROM dept2 where DEPT is not null)
   AND NOT EXISTS
 (
SELECT *
  FROM base b
 WHERE b.racct LIKE 'A%'
  AND TRIM(leading '0' FROM b.sprctr) in  (SELECT dept FROM dept1)
           AND a.racct = b.racct
           AND a.sprctr = b.sprctr
           AND a.gjahr = b.gjahr
           AND a.poper = b.poper
           AND a.prctr = b.prctr);
           
          
