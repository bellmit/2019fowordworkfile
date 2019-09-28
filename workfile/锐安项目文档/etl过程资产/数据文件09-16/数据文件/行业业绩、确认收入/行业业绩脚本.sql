prompt PL/SQL Developer import file
prompt Created on 2019年8月20日 by User
set feedback off
set define off
prompt Creating ODS_FI_INDPF_TARGET...
create table ODS_FI_INDPF_TARGET
(
  GROUP_ID       VARCHAR2(100),
  GROUP_NAME     VARCHAR2(200),
  FIRST_DEPT_ID  VARCHAR2(100),
  FIRST_DEPT     VARCHAR2(200),
  SECOND_DEPT_ID VARCHAR2(100),
  SECOND_DEPT    VARCHAR2(200),
  Z_QUARTER      VARCHAR2(100),
  TARGET         NUMBER,
  ISCPX          VARCHAR2(100)
)
tablespace DB_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table ODS_FI_INDPF_TARGET
  is '行业业绩事业部目标表';
comment on column ODS_FI_INDPF_TARGET.GROUP_ID
  is '事业群id';
comment on column ODS_FI_INDPF_TARGET.GROUP_NAME
  is '事业群名称';
comment on column ODS_FI_INDPF_TARGET.FIRST_DEPT_ID
  is '一级部门id';
comment on column ODS_FI_INDPF_TARGET.FIRST_DEPT
  is '一级部门名称';
comment on column ODS_FI_INDPF_TARGET.SECOND_DEPT_ID
  is '二级部门id';
comment on column ODS_FI_INDPF_TARGET.SECOND_DEPT
  is '二级部门名称';
comment on column ODS_FI_INDPF_TARGET.Z_QUARTER
  is '季度';
comment on column ODS_FI_INDPF_TARGET.TARGET
  is '目标值';
comment on column ODS_FI_INDPF_TARGET.ISCPX
  is '是否产品线【1 是 0 否】';

prompt Disabling triggers for ODS_FI_INDPF_TARGET...
alter table ODS_FI_INDPF_TARGET disable all triggers;
prompt Deleting ODS_FI_INDPF_TARGET...
delete from ODS_FI_INDPF_TARGET;
commit;
prompt Loading ODS_FI_INDPF_TARGET...
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '310', '实战创新产品线', '1', 600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '500', '综合GK产品线', '1', 1500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '263', 'WZ平台产品线', '1', 12900, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '435', '数据业务产品线', '1', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '436', '拓展业务产品线', '1', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', '414', 'JSD产品线', '1', 4500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '323', '第九事业部', '361', 'CFA产品线', '1', 2250, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '346', '第十一事业部', '497', '科信业务应用产品线', '1', 7500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '116', '分流设备产品线', '1', 3735, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '126', '网络数据解析产品线', '1', 15, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '322', '第七事业部', '487', '无线产品线', '1', 1200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '125', '第四事业部', '496', '网信产品线', '1', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '489', 'TZ产品线', '1', 750, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '490', '态势感知产品线', '1', 450, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '491', '数据交换平台产品线', '1', 600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '310', '实战创新产品线', '2', 800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '500', '综合GK产品线', '2', 2000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '263', 'WZ平台产品线', '2', 17200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '435', '数据业务产品线', '2', 4000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '436', '拓展业务产品线', '2', 4000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', '414', 'JSD产品线', '2', 6000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '323', '第九事业部', '361', 'CFA产品线', '2', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '346', '第十一事业部', '497', '科信业务应用产品线', '2', 10000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '116', '分流设备产品线', '2', 4980, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '126', '网络数据解析产品线', '2', 20, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '322', '第七事业部', '487', '无线产品线', '2', 1600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '125', '第四事业部', '496', '网信产品线', '2', 4000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '489', 'TZ产品线', '2', 1000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '490', '态势感知产品线', '2', 600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '491', '数据交换平台产品线', '2', 800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '310', '实战创新产品线', '3', 1240, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '500', '综合GK产品线', '3', 3100, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '263', 'WZ平台产品线', '3', 26660, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '435', '数据业务产品线', '3', 6200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '436', '拓展业务产品线', '3', 6200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', '414', 'JSD产品线', '3', 9300, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '323', '第九事业部', '361', 'CFA产品线', '3', 4650, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '346', '第十一事业部', '497', '科信业务应用产品线', '3', 15500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '116', '分流设备产品线', '3', 7719, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '126', '网络数据解析产品线', '3', 31, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '322', '第七事业部', '487', '无线产品线', '3', 2480, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '125', '第四事业部', '496', '网信产品线', '3', 6200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '489', 'TZ产品线', '3', 1550, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '490', '态势感知产品线', '3', 930, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '491', '数据交换平台产品线', '3', 1240, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '310', '实战创新产品线', '4', 1360, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '500', '综合GK产品线', '4', 3400, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', '263', 'WZ平台产品线', '4', 29240, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '435', '数据业务产品线', '4', 6800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '122', '第二事业部', '436', '拓展业务产品线', '4', 6800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', '414', 'JSD产品线', '4', 10200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '323', '第九事业部', '361', 'CFA产品线', '4', 5100, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '346', '第十一事业部', '497', '科信业务应用产品线', '4', 17000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '116', '分流设备产品线', '4', 8466, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', '126', '网络数据解析产品线', '4', 34, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '322', '第七事业部', '487', '无线产品线', '4', 2720, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '125', '第四事业部', '496', '网信产品线', '4', 6800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '489', 'TZ产品线', '4', 1700, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '490', '态势感知产品线', '4', 1020, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '483', '第十事业部', '491', '数据交换平台产品线', '4', 1360, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', null, '第一事业部-销售4', '1', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', null, '第一事业部-销售4', '2', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', null, '第一事业部-销售4', '3', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '网络安全与信息技术装备事业群', '95', '第一事业部', null, '第一事业部-销售4', '4', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', null, '网安事业部-销售4', '1', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', null, '网安事业部-销售4', '2', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', null, '网安事业部-销售4', '3', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '262', '网安事业部', null, '网安事业部-销售4', '4', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', null, '第五事业部-销售1', '1', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', null, '第五事业部-销售1', '2', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', null, '第五事业部-销售1', '3', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '大数据服务与解决方案事业群', '254', '第五事业部', null, '第五事业部-销售1', '4', 0, '0');
commit;
prompt 72 records loaded
prompt Enabling triggers for ODS_FI_INDPF_TARGET...
alter table ODS_FI_INDPF_TARGET enable all triggers;
set feedback on
set define on
prompt Done.
