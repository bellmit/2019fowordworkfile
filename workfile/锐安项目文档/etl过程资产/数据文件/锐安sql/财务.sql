--²ÆÎñSAP
SELECT * FROM ods_sap_fi_dept_header;
SELECT * FROM ods_sap_fi_dept_item;
SELECT * FROM ods_sap_fi_exchange_allocate;
SELECT * FROM ods_sap_fi_dept;
SELECT * FROM ods_sap_fi_list_items;
SELECT * FROM ods_sap_fi_subject;
SELECT * FROM ods_sap_fi_dept_des;
SELECT * FROM ods_sap_fi_deptgroup_des; 
SELECT * FROM ods_sap_fi_cost_factor_des;
SELECT * FROM ods_sap_fi_client_des;
SELECT * FROM ods_sap_fi_reason_des ;
SELECT * FROM ods_sap_fi_begin_balance ;
SELECT * FROM ods_sap_fi_supplier_des; 



SELECT * FROM ods_sap_fi_batch_cntrl ORDER BY batch_id DESC;


SELECT a.tdate,count(*) FROM ods_sap_fi_detail A  WHERE a.batch_id='201908140500081001' group by a.tdate;
SELECT a.tdate,COUNT(*) FROM dw_fi_detail A WHERE a.batch_num='201908160500541002' group by a.tdate;



SELECT AEDAT,COUNT(*) FROM ods_sap_fi_account_balance WHERE batch_id in ('201908150500001002','201908160500541002')group by AEDAT;
SELECT AEDAT,COUNT(*) FROM dw_fi_account_balance WHERE batch_num in ('201908150500001002') group by AEDAT;



SELECT COUNT(*) FROM ods_sap_fi_exchange_detail WHERE batch_id='201907130600091003';
SELECT COUNT(*) FROM dw_fi_exchange_detail WHERE batch_num='201907130600091003';






