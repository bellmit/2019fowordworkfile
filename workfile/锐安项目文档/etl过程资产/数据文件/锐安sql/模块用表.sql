
--用户信息（BI权限控制）
select * from dw_staff;
select * from dw_dept;
-- 财务权限
select * from dw_fi_authority;

-- 经营分析
select * from dw_ps_xsxmlx_sp;
select * from dw_sd_pfrt_sum;
select * from dw_sd_ctpf_detail;
select * from dw_sd_rt_detail;
select * from dw_ps_sd_yszk;
select * from dw_sd_ctpf_firstdept;
-- 人力
select * from dw_hr_act_data_info;
select * from dw_hr_work_hour_data;
select * from dw_hr_employee_detail;
select * from dw_hr_employee_list a ;

-- 工程售后

SELECT * FROM DW_PS_PROSUM_LV a;--项目数据及完成率
SELECT * FROM dw_ps_project_fee;--项目费用
SELECT * FROM DW_PS_CONSTRUCT_PRO_TEMP; --临时表
SELECT * FROM dw_ps_fee_temp; --临时表
SELECT * FROM DW_PS_WORKHOUR;--各月人工时
SELECT * FROM dw_ps_recognit_income;--确认收入
SELECT * FROM dw_PS_question_detail;--问题清单
SELECT * FROM dw_ps_projectnum_provice;--省份项目数
SELECT * FROM dim_city;--地区表


--财务SAP
SELECT * FROM DW_FI_DETAIL;
SELECT * FROM DW_FI_ACCOUNT_BALANCE;
SELECT * FROM DW_FI_BEGIN_BALANCE;
SELECT * FROM DW_FI_EXCHANGE_DETAIL;
SELECT * FROM DW_FI_DEPT_HEADER;
SELECT * FROM DW_FI_DEPT_ITEM;
SELECT * FROM DW_FI_EXCHANGE_ALLOCATE;
SELECT * FROM DW_FI_DEPT;
SELECT * FROM DW_FI_LIST_ITEMS;
SELECT * FROM DW_FI_SUBJECT;
SELECT * FROM DW_FI_DEPT_DES;
SELECT * FROM DW_FI_DEPTGROUP_DES;
SELECT * FROM DW_FI_SUBJECT_DES;
SELECT * FROM DW_FI_COST_FACTOR_DES;
SELECT * FROM DW_FI_CLIENT_DES;
SELECT * FROM DW_FI_SUPPLIER_DES;
SELECT * FROM DW_FI_REASON_DES;
SELECT * FROM DW_FI_PROJECT_DES;
SELECT * FROM DW_FI_WBS_DES;
SELECT * FROM dw_fi_period;

select * from dw_fi_indpf_dept;



