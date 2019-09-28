--35,36表科目核对表
SELECT racct
      ,SUM(detail_dmbtr) detail_dmbtr
      ,SUM(total_dmbtr) total_dmbtr
      ,SUM(detail_dmbtr) - SUM(total_dmbtr) different
  FROM (SELECT racct
              ,SUM(dmbtr1) detail_dmbtr
              ,0 total_dmbtr
          FROM dw_fi_detail a
         GROUP BY racct
        UNION ALL
        SELECT racct
              ,0 detail_dmbtr
              ,SUM(dmbtr) dmbtr
          FROM dw_fi_account_balance a
         GROUP BY racct)         
 GROUP BY racct;
 

 
                                  
 