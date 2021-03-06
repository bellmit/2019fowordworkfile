--财务SAP
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
SELECT * FROM dw_fi_profit_loss; --损益表
SELECT * FROM dw_fi_profit_loss_circle;--损益表循环
select * from dw_fi_dept a  WHERE a.db_key



SELECT * FROM ods_sap_fi_batch_cntrl ORDER BY batch_id DESC;


SELECT a.tdate,count(*) FROM ods_sap_fi_detail A  WHERE a.batch_id='201909030500591001' group by a.tdate;
SELECT a.tdate,COUNT(*) FROM dw_fi_detail A WHERE a.batch_num='201909030500591001' group by a.tdate;



SELECT AEDAT,COUNT(*) FROM ods_sap_fi_account_balance WHERE batch_id in ('201909030500591002')group by AEDAT;
SELECT AEDAT,COUNT(*) FROM dw_fi_account_balance WHERE batch_num in ('201909030500591002') group by AEDAT;



SELECT COUNT(*) FROM ods_sap_fi_exchange_detail WHERE batch_id='201909030500591003';
SELECT COUNT(*) FROM dw_fi_exchange_detail WHERE batch_num='201909030500591003';




