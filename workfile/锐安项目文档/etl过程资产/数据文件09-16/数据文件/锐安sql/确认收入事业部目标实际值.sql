SELECT a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,substr(a.z_quarter,1,4)||'Äê'||substr(a.z_quarter,6,1)||'¼¾' yearquarter
      ,substr(a.z_quarter,1,4) z_year
      ,a.iscpx
      ,SUM(nvl(actual, 0)) actual
      ,SUM(nvl(target, 0)) target
  FROM (SELECT a.group_id
              ,a.group_name
              ,a.first_dept_id
              ,a.first_dept
              ,a.second_dept_id
              ,a.second_dept
              ,to_char(a.COMFIRM_TIME,'yyyy') ||'Q' ||to_char(a.COMFIRM_TIME,'q')  z_quarter
              ,a.iscpx
              ,SUM(a.comfirm_amount) actual
              ,0 target
          FROM ods_fi_recog_income a
         WHERE a.is_syb = '1'
           AND a.comfirm_amount IS NOT NULL
         GROUP BY a.group_id
                 ,a.group_name
                 ,a.first_dept_id
                 ,a.first_dept
                 ,a.second_dept_id
                 ,a.second_dept
                 ,to_char(a.COMFIRM_TIME,'yyyy') ||'Q' ||to_char(a.COMFIRM_TIME,'q') 
                 ,a.iscpx
        UNION ALL
        SELECT a.group_id
              ,a.group_name
              ,a.first_dept_id
              ,a.first_dept
              ,a.second_dept_id
              ,a.second_dept
              ,a.z_quarter
              ,a.iscpx
              ,0 actual
              ,SUM(target) target
          FROM ods_fi_rgic_target a
         WHERE a.is_syb = '1'
         GROUP BY a.group_id
                 ,a.group_name
                 ,a.first_dept_id
                 ,a.first_dept
                 ,a.second_dept_id
                 ,a.second_dept
                 ,a.z_quarter
                 ,a.iscpx) a

 GROUP BY a.group_id
         ,a.group_name
         ,a.first_dept_id
         ,a.first_dept
         ,a.second_dept_id
         ,a.second_dept
         ,a.z_quarter
         ,a.iscpx