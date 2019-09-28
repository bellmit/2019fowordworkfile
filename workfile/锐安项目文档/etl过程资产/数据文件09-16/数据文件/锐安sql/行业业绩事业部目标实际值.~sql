SELECT a.group_id
      ,a.group_name
      ,a.first_dept_id
      ,a.first_dept
      ,a.second_dept_id
      ,a.second_dept
      ,a.z_quarter
      ,a.iscpx
      ,SUM(nvl(actual, 0)) actual
      ,SUM(nvl(target, 0)) target
  FROM (SELECT a.group_id
              ,a.group_name
              ,a.first_dept_id
              ,a.first_dept
              ,a.second_dept_id
              ,a.second_dept
              ,to_char(a.recorddate, 'q') z_quarter
              ,a.iscpx
              ,SUM(a.hyyj) actual
              ,0 target
          FROM ods_fi_ind_perform a
         WHERE a.hyyj IS NOT NULL
         GROUP BY a.group_id
                 ,a.group_name
                 ,a.first_dept_id
                 ,a.first_dept
                 ,a.second_dept_id
                 ,a.second_dept
                 ,to_char(a.recorddate, 'q')
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
          FROM ods_fi_indpf_target a
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