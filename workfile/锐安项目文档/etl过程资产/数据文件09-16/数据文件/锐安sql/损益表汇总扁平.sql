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
   SELECT dept1 dept  FROM dept a WHERE a.dept1 = 'RA00'
   UNION  
   SELECT dept2  FROM dept a WHERE a.dept1 = 'RA00'
   UNION           
   SELECT dept3  FROM dept a WHERE a.dept1 = 'RA00' 
   UNION 
   SELECT dept4  FROM dept a WHERE a.dept1 = 'RA00'          
   UNION 
   SELECT dept5  FROM dept a WHERE a.dept1 = 'RA00' ) 
   
,list_items as (
select a.zc_index,a.zc_ktext,a.zc_cud,a.zc_hs,a.zc_item,
 nvl(replace(b.zc_sclass,' ',''),nvl(zc_sclass4,nvl(zc_sclass3,nvl(zc_sclass2,nvl(zc_sclass1,a.zc_index))))) zc_sclass
 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass4 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass3 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass2 from (
select a.*,replace(b.zc_sclass,' ','') zc_sclass1 from dw_fi_list_items a left join (
select * from dw_fi_subject where from_racct=' ')b on a.zc_index=b.zc_index)a
left join (
select * from dw_fi_subject where from_racct=' ')b on a.zc_sclass1=b.zc_index)a
left join (
select * from dw_fi_subject where from_racct=' ')b on a.zc_sclass2=b.zc_index)a
left join (
select * from dw_fi_subject where from_racct=' ')b on a.zc_sclass3=b.zc_index)a
left join (
select * from dw_fi_subject where from_racct=' ')b on a.zc_sclass4=b.zc_index
order by a.zc_index,zc_sclass)
SELECT b.zc_index --自动编号
        ,b.zc_ktext --描述
        ,b.zc_item --输出顺序 
        ,b.zc_cud --计算类型
        ,b.zc_hs
        ,'01'  Levl
        ,SUM(dmbtr) dmbtr
        ,SUM(dmbtr_year) dmbtr_year
    FROM (SELECT b.zc_index --自动编号
                ,b.zc_ktext --描述 
                ,b.zc_item --输出顺序 
                ,b.zc_cud --计算类型
                ,b.zc_hs --借方正数或者贷方正数
                ,SUM(CASE
                       WHEN b.zc_cud='C' and b.zc_hs = 'S' THEN
                        a.dmbtr
                       WHEN b.zc_cud='C'and b.zc_hs = 'H' THEN
                        -a.dmbtr
                       when  b.zc_cud='U' and b.zc_hs = 'S' THEN
                        -a.dmbtr
                       when b.zc_cud='U' and b.zc_hs = 'H' THEN
                        a.dmbtr
                     END) AS dmbtr --按本位币计的金额 
                ,0 AS dmbtr_year
            FROM (SELECT *
                    from list_items b
                   ) b --计算类型 
            LEFT JOIN dw_fi_subject c
              ON c.zc_index = b.zc_sclass
            LEFT JOIN (SELECT *
                        FROM dw_fi_account_balance a
                       WHERE a.gjahr = '2019' --年
                         AND a.poper= '006'
                         AND trim(leading '0'FROM a.prctr) IN  
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
           GROUP BY b.zc_index --自动编号
                   ,b.zc_ktext --描述  
                   ,b.zc_item --输出顺序 
                   ,b.zc_cud --计算类型
                   ,b.zc_hs --借方正数或者贷方正数
          UNION ALL
          SELECT b.zc_index --自动编号
                ,b.zc_ktext --描述 
                ,b.zc_item --输出顺序 
                ,b.zc_cud --计算类型
                ,b.zc_hs --借方正数或者贷方正数
                ,0 AS dmbtr --按本位币计的金额 
                ,SUM(CASE
                       WHEN b.zc_cud='C' and b.zc_hs = 'S' THEN
                        a.dmbtr
                       WHEN b.zc_cud='C'and b.zc_hs = 'H' THEN
                        -a.dmbtr
                       when b.zc_cud='U' and b.zc_hs = 'S' THEN
                        -a.dmbtr
                        when b.zc_cud='U' and b.zc_hs = 'H' THEN
                        a.dmbtr
                     END) AS dmbtr_year --按本位币计的金额 
            FROM (SELECT *
                    from list_items b
                   ) b --计算类型 
            LEFT JOIN dw_fi_subject c
              ON c.zc_index = b.zc_sclass
            LEFT JOIN (SELECT *
                        FROM dw_fi_account_balance a
                       WHERE a.gjahr = '2019' --年
                         AND a.poper<= '006'
                         AND trim(leading '0'FROM a.prctr) IN 
                          (SELECT dept  FROM dept1 a)
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
           GROUP BY b.zc_index --自动编号
                   ,b.zc_ktext --描述  
                   ,b.zc_item --输出顺序 
                   ,b.zc_cud --计算类型
                   ,b.zc_hs --借方正数或者贷方正数
          ) b --借方正数或者贷方正数
   GROUP BY b.zc_index --自动编号
           ,b.zc_ktext --描述  
            ,b.zc_item --输出顺序 
                   ,b.zc_cud --计算类型
                   ,b.zc_hs


 
      
 
       