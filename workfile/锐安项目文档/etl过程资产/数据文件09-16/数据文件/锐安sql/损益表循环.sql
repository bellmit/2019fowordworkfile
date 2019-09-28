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
   SELECT dept1 dept  FROM dept a WHERE a.dept1 = '${dept_code}'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 = '${dept_code}'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1 = '${dept_code}' 
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1 = '${dept_code}'          
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 = '${dept_code}' ) 
   


          SELECT b.zc_index --�Զ����
                ,b.zc_ktext --���� 
                ,'${dept_code}'dept_code
                ,a.gjahr||a.poper period
                ,SUM(CASE
                       WHEN b.zc_hs = 'S' THEN
                        a.dmbtr
                       WHEN b.zc_hs = 'H' THEN
                        -a.dmbtr
                     END) AS dmbtr --����λ�ҼƵĽ�� 
                ,sysdate as etl_time
            FROM (SELECT *
                    FROM dw_fi_list_items b
                   WHERE 1 = 1
                  --   AND b.zc_cud = 'C'
                  ) b --�������� 
            LEFT JOIN dw_fi_subject c
              ON c.zc_index = b.zc_index
            LEFT JOIN (SELECT *
                        FROM dw_fi_account_balance a
                       WHERE --a.gjahr = '2019' --��
                        -- AND a.poper= '006'
                          trim(leading '0'FROM a.prctr) IN  
                         (SELECT dept FROM dept1 a )
                         AND NOT EXISTS
                       (SELECT *
                                FROM dw_fi_account_balance b
                               WHERE b.racct LIKE 'A%'
                                 AND trim(leading '0'FROM b.SPRCTR) IN
                                     (SELECT dept FROM dept1 a)
                                 AND a.racct = b.racct 
                                 AND a.sprctr=b.sprctr 
                                 AND a.gjahr=b.gjahr 
                                 AND a.poper=b.poper 
                                 AND a.prctr=b.prctr)) a 
              ON a.racct BETWEEN c.from_racct AND c.to_racct
           WHERE 1 = 1
           GROUP BY b.zc_index --�Զ����
                   ,b.zc_ktext --����  
                   ,b.zc_item --���˳�� 
                   ,b.zc_cud --��������
                   ,b.zc_hs --�跽�������ߴ�������
                   ,a.gjahr||a.poper
          


  
      
 
       