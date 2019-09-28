prompt PL/SQL Developer import file
prompt Created on 2019��8��20�� by User
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
  is '��ҵҵ����ҵ��Ŀ���';
comment on column ODS_FI_INDPF_TARGET.GROUP_ID
  is '��ҵȺid';
comment on column ODS_FI_INDPF_TARGET.GROUP_NAME
  is '��ҵȺ����';
comment on column ODS_FI_INDPF_TARGET.FIRST_DEPT_ID
  is 'һ������id';
comment on column ODS_FI_INDPF_TARGET.FIRST_DEPT
  is 'һ����������';
comment on column ODS_FI_INDPF_TARGET.SECOND_DEPT_ID
  is '��������id';
comment on column ODS_FI_INDPF_TARGET.SECOND_DEPT
  is '������������';
comment on column ODS_FI_INDPF_TARGET.Z_QUARTER
  is '����';
comment on column ODS_FI_INDPF_TARGET.TARGET
  is 'Ŀ��ֵ';
comment on column ODS_FI_INDPF_TARGET.ISCPX
  is '�Ƿ��Ʒ�ߡ�1 �� 0 ��';

prompt Disabling triggers for ODS_FI_INDPF_TARGET...
alter table ODS_FI_INDPF_TARGET disable all triggers;
prompt Deleting ODS_FI_INDPF_TARGET...
delete from ODS_FI_INDPF_TARGET;
commit;
prompt Loading ODS_FI_INDPF_TARGET...
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '310', 'ʵս���²�Ʒ��', '1', 600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '500', '�ۺ�GK��Ʒ��', '1', 1500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '263', 'WZƽ̨��Ʒ��', '1', 12900, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '435', '����ҵ���Ʒ��', '1', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '436', '��չҵ���Ʒ��', '1', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', '414', 'JSD��Ʒ��', '1', 4500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '323', '�ھ���ҵ��', '361', 'CFA��Ʒ��', '1', 2250, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '346', '��ʮһ��ҵ��', '497', '����ҵ��Ӧ�ò�Ʒ��', '1', 7500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '116', '�����豸��Ʒ��', '1', 3735, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '126', '�������ݽ�����Ʒ��', '1', 15, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '322', '������ҵ��', '487', '���߲�Ʒ��', '1', 1200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '125', '������ҵ��', '496', '���Ų�Ʒ��', '1', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '489', 'TZ��Ʒ��', '1', 750, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '490', '̬�Ƹ�֪��Ʒ��', '1', 450, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '491', '���ݽ���ƽ̨��Ʒ��', '1', 600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '310', 'ʵս���²�Ʒ��', '2', 800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '500', '�ۺ�GK��Ʒ��', '2', 2000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '263', 'WZƽ̨��Ʒ��', '2', 17200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '435', '����ҵ���Ʒ��', '2', 4000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '436', '��չҵ���Ʒ��', '2', 4000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', '414', 'JSD��Ʒ��', '2', 6000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '323', '�ھ���ҵ��', '361', 'CFA��Ʒ��', '2', 3000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '346', '��ʮһ��ҵ��', '497', '����ҵ��Ӧ�ò�Ʒ��', '2', 10000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '116', '�����豸��Ʒ��', '2', 4980, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '126', '�������ݽ�����Ʒ��', '2', 20, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '322', '������ҵ��', '487', '���߲�Ʒ��', '2', 1600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '125', '������ҵ��', '496', '���Ų�Ʒ��', '2', 4000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '489', 'TZ��Ʒ��', '2', 1000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '490', '̬�Ƹ�֪��Ʒ��', '2', 600, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '491', '���ݽ���ƽ̨��Ʒ��', '2', 800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '310', 'ʵս���²�Ʒ��', '3', 1240, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '500', '�ۺ�GK��Ʒ��', '3', 3100, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '263', 'WZƽ̨��Ʒ��', '3', 26660, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '435', '����ҵ���Ʒ��', '3', 6200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '436', '��չҵ���Ʒ��', '3', 6200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', '414', 'JSD��Ʒ��', '3', 9300, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '323', '�ھ���ҵ��', '361', 'CFA��Ʒ��', '3', 4650, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '346', '��ʮһ��ҵ��', '497', '����ҵ��Ӧ�ò�Ʒ��', '3', 15500, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '116', '�����豸��Ʒ��', '3', 7719, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '126', '�������ݽ�����Ʒ��', '3', 31, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '322', '������ҵ��', '487', '���߲�Ʒ��', '3', 2480, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '125', '������ҵ��', '496', '���Ų�Ʒ��', '3', 6200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '489', 'TZ��Ʒ��', '3', 1550, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '490', '̬�Ƹ�֪��Ʒ��', '3', 930, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '491', '���ݽ���ƽ̨��Ʒ��', '3', 1240, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '310', 'ʵս���²�Ʒ��', '4', 1360, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '500', '�ۺ�GK��Ʒ��', '4', 3400, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', '263', 'WZƽ̨��Ʒ��', '4', 29240, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '435', '����ҵ���Ʒ��', '4', 6800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '122', '�ڶ���ҵ��', '436', '��չҵ���Ʒ��', '4', 6800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', '414', 'JSD��Ʒ��', '4', 10200, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '323', '�ھ���ҵ��', '361', 'CFA��Ʒ��', '4', 5100, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '346', '��ʮһ��ҵ��', '497', '����ҵ��Ӧ�ò�Ʒ��', '4', 17000, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '116', '�����豸��Ʒ��', '4', 8466, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', '126', '�������ݽ�����Ʒ��', '4', 34, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '322', '������ҵ��', '487', '���߲�Ʒ��', '4', 2720, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '125', '������ҵ��', '496', '���Ų�Ʒ��', '4', 6800, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '489', 'TZ��Ʒ��', '4', 1700, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '490', '̬�Ƹ�֪��Ʒ��', '4', 1020, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '483', '��ʮ��ҵ��', '491', '���ݽ���ƽ̨��Ʒ��', '4', 1360, '1');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', null, '��һ��ҵ��-����4', '1', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', null, '��һ��ҵ��-����4', '2', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', null, '��һ��ҵ��-����4', '3', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('482', '���簲ȫ����Ϣ����װ����ҵȺ', '95', '��һ��ҵ��', null, '��һ��ҵ��-����4', '4', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', null, '������ҵ��-����4', '1', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', null, '������ҵ��-����4', '2', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', null, '������ҵ��-����4', '3', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '262', '������ҵ��', null, '������ҵ��-����4', '4', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', null, '������ҵ��-����1', '1', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', null, '������ҵ��-����1', '2', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', null, '������ҵ��-����1', '3', 0, '0');
insert into ODS_FI_INDPF_TARGET (GROUP_ID, GROUP_NAME, FIRST_DEPT_ID, FIRST_DEPT, SECOND_DEPT_ID, SECOND_DEPT, Z_QUARTER, TARGET, ISCPX)
values ('402', '�����ݷ�������������ҵȺ', '254', '������ҵ��', null, '������ҵ��-����1', '4', 0, '0');
commit;
prompt 72 records loaded
prompt Enabling triggers for ODS_FI_INDPF_TARGET...
alter table ODS_FI_INDPF_TARGET enable all triggers;
set feedback on
set define on
prompt Done.
