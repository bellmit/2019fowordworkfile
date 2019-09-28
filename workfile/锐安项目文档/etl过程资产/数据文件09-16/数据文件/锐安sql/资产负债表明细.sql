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
   SELECT dept1 dept  FROM dept a WHERE a.dept1 = '81005'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 = '81005'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1 = '81005' 
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1 = '81005'          
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 = '81005' ) 
--��Ŀ����������ĩ����
,account_balance as(
SELECT b.zc_index --�Զ����
      ,b.zc_ktext --���� 
      ,B.racct --��Ŀ
      ,b.zc_fz --�ʲ���ծ
      ,SUM(dmbtr_start) dmbtr_start--���
      ,SUM(dmbtr_start) + SUM(dmbtr) as dmbtr_end--��ĩ
  FROM (
        --��Ŀ�����������
        SELECT b.zc_index --�Զ����
               ,b.zc_ktext --���� 
               ,a.racct --��Ŀ
               ,b.zc_fz
               ,sum(a.dmbtr) AS dmbtr_start --����λ�ҼƵĽ�� 
               ,0 AS dmbtr
          FROM dw_fi_dept_header b
          JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          JOIN (SELECT *
                       FROM dw_fi_account_balance a
                      WHERE a.gjahr < '2019' --��Ȳ���
                       -- AND a.poper < '005' --�ڼ����
                        AND TRIM(leading '0' FROM a.prctr) IN
                            (SELECT dept FROM dept1 a)
                        AND NOT EXISTS --�ų��ڲ�����
                      (SELECT *
                               FROM dw_fi_account_balance b
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
                               FROM dw_fi_account_balance c
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
               ,a.racct
               ,b.zc_fz
        UNION ALL
        --��Ŀ�����귢����
        SELECT b.zc_index --�Զ����
               ,b.zc_ktext --���� 
               ,a.racct --��Ŀ
               ,b.zc_fz
              ,0 dmbtr_start
              ,sum(a.dmbtr) AS dmbtr
          FROM dw_fi_dept_header b
          JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          JOIN (SELECT *
                       FROM dw_fi_account_balance a
                      WHERE a.gjahr = '2019' --��Ȳ���
                        AND a.poper <= '005' --�ڼ����
                        AND TRIM(leading '0' FROM a.prctr) IN
                            (SELECT dept FROM dept1 a)
                        AND NOT EXISTS --�ų��ڲ�����
                      (SELECT *
                               FROM dw_fi_account_balance b
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
                               FROM dw_fi_account_balance c
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
         GROUP BY  b.zc_index --�Զ����
               ,b.zc_ktext --���� 
               ,a.racct --��Ŀ
               ,b.zc_fz
                 )b
 GROUP by b.zc_index --�Զ����
         ,b.zc_ktext --���� 
         ,B.racct 
         ,b.zc_fz) --�ʲ���ծ
    --  select * from account_balance
 
  ,begin_balance as(
--41���ڳ����
SELECT b.zc_index --�Զ����
      ,b.zc_ktext --���� 
      ,a.racct
      ,b.zc_fz
      ,sum(nvl(a.dmbtr,0)) AS dmbtr_start --����λ�ҼƵĽ�� 
      ,sum(nvl(a.dmbtr,0)) AS dmbtr_end
  FROM dw_fi_dept_header b
  JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
  JOIN (SELECT *
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
      ,a.racct
      ,b.zc_fz) --�ʲ���ծ  
 --select * from begin_balance  
 
,exchange_detail as (
SELECT b.zc_index --�Զ����
      ,b.zc_ktext --���� 
      ,b.zitem1
      ,b.zc_fz --�ʲ���ծ
      ,SUM(dmbtr_start) dmbtr_start
      ,SUM(dmbtr_end) dmbtr_end
  FROM (
        --�Ե���Ŀ������
        SELECT b.zc_index --�Զ����
               ,b.zc_ktext --���� 
               ,a.zitem1
               ,b.zc_fz --�ʲ���ծ
               ,sum(a.dmbtr1) AS dmbtr_start --����λ�ҼƵĽ�� 
               ,0 AS dmbtr_end
          FROM dw_fi_dept_header b
          JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          JOIN (
          select *
                       FROM (SELECT a.*
                                   ,b.zbelnr1f
                                   ,b.zbelnr1t
                               FROM dw_fi_exchange_detail a
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                           b.zitem1) a
                      WHERE a.gjahr = '2019' - 1 --ǰһ�����
                        AND a.poper = '013' --�̶���
                        AND TRIM(leading '0' FROM a.prctr) IN (SELECT dept FROM dept1 a) --��������
                        AND NOT EXISTS --�ų��ڲ�����
                      (
                      SELECT *
                               FROM (SELECT a.*
                                           ,b.zbelnr1f
                                           ,b.zbelnr1t
                                       FROM dw_fi_exchange_detail a
                                       JOIN (SELECT a.zitem1
                                                  ,a.zbelnr1f
                                                  ,a.zbelnr1t
                                              FROM dw_fi_exchange_allocate a
                                            UNION ALL
                                            SELECT a.zitem2
                                                  ,a.zbelnr2f
                                                  ,a.zbelnr2t
                                              FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                                   b.zitem1) b
                              WHERE TRIM(leading '0' FROM b.sprctr) IN (SELECT dept FROM dept1 a)
                                AND a.zbelnr1f = b.zbelnr1f
                                AND a.zbelnr1t = b.zbelnr1t
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr
                                )
                        AND a.gjahr <> '2016' --�̶���
                     UNION ALL
                     SELECT *
                       FROM (SELECT a.*
                                   ,b.zbelnr1f
                                   ,b.zbelnr1t
                               FROM dw_fi_exchange_detail a
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                           b.zitem1) a
                      WHERE 1=1
                      AND TRIM(leading '0' FROM a.prctr)IN (SELECT dept FROM dept1 a) --��������
                        AND NOT EXISTS --�ų��ڲ�����
                      (SELECT *
                               FROM (SELECT a.*
                                           ,b.zbelnr1f
                                           ,b.zbelnr1t
                                       FROM dw_fi_exchange_detail a
                                       JOIN (SELECT a.zitem1
                                                  ,a.zbelnr1f
                                                  ,a.zbelnr1t
                                              FROM dw_fi_exchange_allocate a
                                            UNION ALL
                                            SELECT a.zitem2
                                                  ,a.zbelnr2f
                                                  ,a.zbelnr2t
                                              FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                                   b.zitem1) b
                              WHERE TRIM(leading '0' FROM b.sprctr) IN (SELECT dept FROM dept1 a)
                                AND a.zbelnr1f = b.zbelnr1f
                                AND a.zbelnr1t = b.zbelnr1t
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr)
                        AND zflag = 'X'
                        AND a.gjahr = '2016') a --�̶���
        ON a.zbelnr1f = c.from_racct
        AND a.zbelnr1t = c.to_racct
         GROUP BY b.zc_index --�Զ����
                  ,b.zc_ktext --���� 
                  ,a.zitem1
                  ,b.zc_fz
        --�Ե���Ŀ��ǰ���
        UNION ALL
        SELECT b.zc_index --�Զ����
              ,b.zc_ktext --���� 
              ,a.zitem1
              ,b.zc_fz --�ʲ���ծ
              ,0 dmbtr_start --����λ�ҼƵĽ�� 
              ,sum(a.dmbtr1)  AS dmbtr_end
          FROM dw_fi_dept_header b
          JOIN dw_fi_dept_item c ON c.zc_index = b.zc_index
          JOIN (SELECT *
                       FROM (SELECT a.*
                                   ,b.zbelnr1f
                                   ,b.zbelnr1t
                               FROM dw_fi_exchange_detail a
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                           b.zitem1) a
                      WHERE a.gjahr = '2019' --��Ȳ���
                        AND a.poper = '006' --�ڼ����
                        AND TRIM(leading '0' FROM a.prctr) IN (SELECT dept FROM dept1 a)--��������
                        AND NOT EXISTS --�ų��ڲ�����
                      (SELECT *
                               FROM (SELECT a.*
                                           ,b.zbelnr1f
                                           ,b.zbelnr1t
                                       FROM dw_fi_exchange_detail a
                                       JOIN (SELECT a.zitem1
                                                  ,a.zbelnr1f
                                                  ,a.zbelnr1t
                                              FROM dw_fi_exchange_allocate a
                                            UNION ALL
                                            SELECT a.zitem2
                                                  ,a.zbelnr2f
                                                  ,a.zbelnr2t
                                              FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                                   b.zitem1) b
                              WHERE TRIM(leading '0' FROM b.sprctr)IN (SELECT dept FROM dept1 a)
                                AND a.zbelnr1f = b.zbelnr1f
                                AND a.zbelnr1t = b.zbelnr1t
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr)
                        AND a.gjahr <> '2016' --�̶���
                     UNION ALL
                     SELECT *
                       FROM (SELECT a.*
                                   ,b.zbelnr1f
                                   ,b.zbelnr1t
                               FROM dw_fi_exchange_detail a
                               JOIN (SELECT a.zitem1
                                          ,a.zbelnr1f
                                          ,a.zbelnr1t
                                      FROM dw_fi_exchange_allocate a
                                    UNION ALL
                                    SELECT a.zitem2
                                          ,a.zbelnr2f
                                          ,a.zbelnr2t
                                      FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                           b.zitem1) a
                      WHERE 1=1
                        AND TRIM(leading '0' FROM a.prctr)IN (SELECT dept FROM dept1 a) --��������
                        AND NOT EXISTS --�ų��ڲ�����
                      (SELECT *
                               FROM (SELECT a.*
                                           ,b.zbelnr1f
                                           ,b.zbelnr1t
                                       FROM dw_fi_exchange_detail a
                                       JOIN (SELECT a.zitem1
                                                  ,a.zbelnr1f
                                                  ,a.zbelnr1t
                                              FROM dw_fi_exchange_allocate a
                                            UNION ALL
                                            SELECT a.zitem2
                                                  ,a.zbelnr2f
                                                  ,a.zbelnr2t
                                              FROM dw_fi_exchange_allocate a) b ON a.zitem1 =
                                                                                   b.zitem1) b
                              WHERE TRIM(leading '0' FROM b.sprctr) IN (SELECT dept FROM dept1 a)
                                AND a.zbelnr1f = b.zbelnr1f
                                AND a.zbelnr1t = b.zbelnr1t
                                AND a.sprctr = b.sprctr
                                AND a.gjahr = b.gjahr
                                AND a.poper = b.poper
                                AND a.prctr = b.prctr)
                        AND zflag = 'X'
                        AND a.gjahr = '2016') a --�̶���
        ON a.zbelnr1f = c.from_racct
        AND a.zbelnr1t = c.to_racct
         GROUP BY b.zc_index --�Զ����
                 ,b.zc_ktext --���� 
                 ,a.zitem1
                 ,b.zc_fz ) b
 GROUP BY b.zc_index --�Զ����
         ,b.zc_ktext --���� 
         ,b.zitem1
         ,b.zc_fz ) --�ʲ���ծ
         
       
      
select * from (
SELECT * from account_balance 
  union all
select * from  begin_balance 
 union all
select * from  exchange_detail )a
order by to_number(a.zc_index)