
--�û���Ϣ��BIȨ�޿��ƣ�
select * from dw_staff;
select * from dw_dept;
-- ����Ȩ��
select * from dw_fi_authority;

-- ��Ӫ����
select * from dw_ps_xsxmlx_sp;
select * from dw_sd_pfrt_sum;
select * from dw_sd_ctpf_detail;
select * from dw_sd_rt_detail;
select * from dw_ps_sd_yszk;
select * from dw_sd_ctpf_firstdept;
-- ����
select * from dw_hr_act_data_info;
select * from dw_hr_work_hour_data;
select * from dw_hr_employee_detail;
select * from dw_hr_employee_list a ;

-- �����ۺ�

SELECT * FROM DW_PS_PROSUM_LV a;--��Ŀ���ݼ������
SELECT * FROM dw_ps_project_fee;--��Ŀ����
SELECT * FROM DW_PS_CONSTRUCT_PRO_TEMP; --��ʱ��
SELECT * FROM dw_ps_fee_temp; --��ʱ��
SELECT * FROM DW_PS_WORKHOUR;--�����˹�ʱ
SELECT * FROM dw_ps_recognit_income;--ȷ������
SELECT * FROM dw_PS_question_detail;--�����嵥
SELECT * FROM dw_ps_projectnum_provice;--ʡ����Ŀ��
SELECT * FROM dim_city;--������


--����SAP
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

-- ��ҵҵ����
SELECT * FROM ODS_FI_INDPF_TARGET; -- ��ҵ��Ŀ��
SELECT * FROM ODS_FI_INDPF_PLTARGET;-- �����������Ŀ��
SELECT * FROM ODS_FI_IND_PERFORM ; -- ��ϸ���� 
SELECT * FROM ODS_FI_INDPF_MANGER_DETAIL;--��ҵҵ���������������ϸ����
select * from DW_FI_INDPF_RGIC_PERIOD;--����ά�ȱ�
SELECT * FROM DW_FI_INDPF_DEPT; -- ����������ҵҵ��
SELECT * FROM DW_FI_INDPF_FIRSTDEPT; -- ��ҵȺ��һ��������ҵҵ��
SELECT * FROM DW_FI_INDPF_MANGER a ; -- �������������ҵҵ��
SELECT * FROM DW_FI_INDPF_ATGMANGER ; -- �������������ȫ��̬Ŀ��ʵ��
SELECT * FROM DW_FI_INDPF_ATGDEPT;--��ҵ����ȫ��̬Ŀ��ʵ��
 
-- ȷ�����룺
SELECT * FROM ODS_FI_RGIC_TARGET;--Ŀ��
SELECT * FROM ODS_FI_RECOG_INCOME ;  --��ϸ����
SELECT * FROM DW_FI_RGIC_DEPT ;-- ��������ȷ������
SELECT * FROM DW_FI_RGIC_FIRSTDEPT ;--��ҵȺ��һ������ȷ������
SELECT * FROM DW_FI_RGIC_REPRESENT ;-- ����ȷ������
SELECT * FROM DW_FI_RGIC_ATGDEPT ;-- ��ҵ��ȷ������Ŀ��ʵ��ֵ
SELECT * FROM DW_FI_RGIC_ATGREPRESENT ;-- ����ȷ������Ŀ��ʵ��ֵ
select * from kettle_transform_log;
 
--�����̻���
SELECT * FROM dw_fi_profit_loss; --�����
SELECT * FROM dw_fi_profit_loss_circle;--�����ѭ��

-- �ɹ�
SELECT * FROM DW_MM_DETAIL ; -- �ɹ�

-- ��Ʒ�з�
SELECT * FROM DW_RD_PRO_MILESTONE; --�з���̱�
SELECT * FROM DW_RD_PRO_DETAIL;--�з�

-- ��ʻ��
select * from  dw_ps_project_info ; -- ��Ŀ�����б�
select * from  dw_ps_ctck_project ;  -- �����ۺ���Ŀ
select * from  dw_ps_project_boost  -- ��ʻ����Ŀ�ƽ�
select * from dw_fi_profit_fee_target ;--��ʻ�վ��������Ŀ��ֵ
select * from dw_fi_profit_fee; -- ���������Ŀ��ʵ��
select * from dw_fi_profit_fee1;-- ��������ú���
select * from dw_fi_profit_fee2;-- ��������ü�����ʵ��ֵ


