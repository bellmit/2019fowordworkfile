

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
 ,dept1 AS (
   SELECT dept1 dept  FROM dept a WHERE a.dept1 = '8999'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 = '8999'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1 = '8999' 
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1 = '8999'          
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 = '8999' )
--,begin_balance as(
--41���ڳ����
SELECT b.zc_index --�Զ����
      ,b.zc_ktext --���� 
      ,b.zc_item --���˳�� 
      ,b.zc_cud --��������
      ,b.zc_fz --�ʲ���ծ
       -- ,b.qc_hs --�跽�������ߴ�������
      ,SUM(CASE
             WHEN b.qc_hs = 'H' THEN
              -nvl(a.dmbtr,0)
             else nvl(a.dmbtr,0)
           END) AS dmbtr_start --����λ�ҼƵĽ�� 
      ,SUM(CASE
             WHEN b.QM_HS = 'H' THEN
              -nvl(a.dmbtr,0)
             else nvl(a.dmbtr,0)
           END) AS dmbtr_end
  FROM dw_fi_dept_header b
  LEFT JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
  LEFT JOIN (SELECT *
               FROM dw_fi_begin_balance a
              WHERE TRIM(leading '0' FROM a.prctr) IN
                    (SELECT dept FROM dept1 a)
                AND NOT EXISTS --�ų��ڲ�����
              (SELECT *
                       FROM dw_fi_begin_balance b
                      WHERE b.racct LIKE 'A%'
                        AND TRIM(leading '0' FROM b.sprctr) IN
                            (SELECT dept FROM dept1 a)
                        AND a.racct = b.racct
                        AND a.sprctr = b.sprctr
                        AND a.gjahr = b.gjahr
                        AND a.poper = b.poper
                        AND a.prctr = b.prctr)
                AND NOT EXISTS --�ų��Ե���Ŀ
              (SELECT c.*
                       FROM dw_fi_begin_balance c
                       JOIN (SELECT a.zitem1
                                  ,a.zbelnr1f
                                  ,a.zbelnr1t
                              FROM dw_fi_exchange_allocate a
                            UNION ALL
                            SELECT a.zitem2
                                  ,a.zbelnr2f
                                  ,a.zbelnr2t
                              FROM dw_fi_exchange_allocate a) b ON c.racct BETWEEN
                                                                   b.zbelnr1f AND
                                                                   b.zbelnr1t
                      WHERE a.racct = c.racct
                        AND a.sprctr = c.sprctr
                        AND a.gjahr = c.gjahr
                        AND a.poper = c.poper
                        AND a.prctr = c.prctr)) a ON a.racct BETWEEN
                                                     c.from_racct AND
                                                     c.to_racct
 GROUP BY b.zc_index --�Զ����
         ,b.zc_ktext --���� 
         ,b.zc_item --���˳�� 
         ,b.zc_cud --��������
         ,b.zc_fz --�ʲ���ծ
      --)