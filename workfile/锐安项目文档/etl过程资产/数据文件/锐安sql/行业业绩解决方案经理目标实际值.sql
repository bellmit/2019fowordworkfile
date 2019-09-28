with a as ( -- 目标实际合成一张表
SELECT z_quarter
      ,post_code
      ,SUM(actual) actual
      ,SUM(target) target
  FROM (SELECT to_char(a.recorddate, 'q') z_quarter
              ,a.post_code
              ,SUM(a.jlyj) actual
              ,0 target
          FROM ods_fi_ind_perform a
         WHERE a.jlyj is not null
         GROUP BY to_char(a.recorddate, 'q')
                 ,a.post_code
        UNION ALL
        SELECT a.z_quarter
              ,a.post_id
              ,0 actual
              ,SUM(target) target
          FROM ods_fi_indpf_pltarget a
         GROUP BY a.z_quarter
                 ,a.post_id) a
 GROUP BY z_quarter
         ,post_code
) 
SELECT a.z_quarter
      ,aa.staff_name as manger_name
      ,a.post_code 
      ,aa.group_id
      ,aa.group_name
      ,aa.first_dept_id
      ,aa.first_dept
      ,aa.hyfx
      ,aa.staff_name||'-'||aa.hyfx as abstract
      ,a.actual
      ,a.target       
  FROM a
  left join ( select distinct staff_name,post_id,a.group_id,a.group_name,a.first_dept_id,a.first_dept,a.hyfx from ods_fi_indpf_pltarget a) aa  
         on aa.post_id=a.post_code