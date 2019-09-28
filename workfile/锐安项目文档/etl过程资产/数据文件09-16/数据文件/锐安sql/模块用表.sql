
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
select * from dw_fi_authority;

-- 行业业绩：
SELECT * FROM ODS_FI_INDPF_TARGET; -- 事业部目标
SELECT * FROM ODS_FI_INDPF_PLTARGET;-- 解决方案经理目标
SELECT * FROM ODS_FI_IND_PERFORM ; -- 明细数据 
SELECT * FROM ODS_FI_INDPF_MANGER_DETAIL;--行业业绩解决方案经理明细数据
select * from DW_FI_INDPF_RGIC_PERIOD;--季度维度表
SELECT * FROM DW_FI_INDPF_DEPT; -- 二级部门行业业绩
SELECT * FROM DW_FI_INDPF_FIRSTDEPT; -- 事业群、一级部门行业业绩
SELECT * FROM DW_FI_INDPF_MANGER a ; -- 解决方案经理行业业绩
SELECT * FROM DW_FI_INDPF_ATGMANGER ; -- 解决方案经理完全静态目标实际
SELECT * FROM DW_FI_INDPF_ATGDEPT;--事业部完全静态目标实际
 
-- 确认收入：
SELECT * FROM ODS_FI_RGIC_TARGET;--目标
SELECT * FROM ODS_FI_RECOG_INCOME ;  --明细数据
SELECT * FROM DW_FI_RGIC_DEPT ;-- 二级部门确认收入
SELECT * FROM DW_FI_RGIC_FIRSTDEPT ;--事业群、一级部门确认收入
SELECT * FROM DW_FI_RGIC_REPRESENT ;-- 代表处确认收入
SELECT * FROM DW_FI_RGIC_ATGDEPT ;-- 事业部确认收入目标实际值
SELECT * FROM DW_FI_RGIC_ATGREPRESENT ;-- 代表处确认收入目标实际值
select * from kettle_transform_log;
 
--损益表固化：
SELECT * FROM dw_fi_profit_loss; --损益表
SELECT * FROM dw_fi_profit_loss_circle;--损益表循环

-- 采购
SELECT * FROM DW_MM_DETAIL ; -- 采购

-- 产品研发
SELECT * FROM DW_RD_PRO_MILESTONE; --研发里程碑
SELECT * FROM DW_RD_PRO_DETAIL;--研发

-- 驾驶舱
select * from  dw_ps_project_info ; -- 项目管理列表
select * from  dw_ps_ctck_project ;  -- 工程售后项目
select * from  dw_ps_project_boost  -- 驾驶舱项目推进
select * from dw_fi_profit_fee_target ;--驾驶舱净利润费用目标值
select * from dw_fi_profit_fee; -- 净利润费用目标实际
select * from dw_fi_profit_fee1;-- 净利润费用横向
select * from dw_fi_profit_fee2;-- 净利润费用季度月实际值


