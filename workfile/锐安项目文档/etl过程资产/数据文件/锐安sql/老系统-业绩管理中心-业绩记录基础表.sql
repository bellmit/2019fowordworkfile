--��ϵͳ-ҵ����������-ҵ����¼������
select a.id, --���
       a.contractcode, --��ͬ��
       a.htjfname, --��ͬ�׷�����
       a.province, --ʡ��
       a.city, --����
       a.zjl, --�ܾ���
       a.departname, --����
       a.hangye, --��ҵ
       a.sellperson, --������Ա
       a.contractproname, --��ͬ����
       a.clientcompanyname, --�����û�����
       a.procode, --��Ŀ���
       a.htztcostname, --��ͬ����ɱ���������
       a.contractsigndate, --��ͬǩ������
       a.z_year, --��
       a.z_quarter, --����
       sum(a.contractpricedouble), --��ͬ�ܽ��(��Ԫ)
       sum(a.performrecordnum), --ҵ����¼���(��Ԫ)
       sum(a.contractdivide) --��ͬ��ֽ��(��Ԫ)
  from dw_bi_report_ygsj a
 group by a.id, --���
          a.contractcode, --��ͬ��
          a.htjfname, --��ͬ�׷�����
          a.province, --ʡ��
          a.city, --����
          a.zjl, --�ܾ���
          a.departname, --����
          a.hangye, --��ҵ
          a.sellperson, --������Ա
          a.contractproname, --��ͬ����
          a.clientcompanyname, --�����û�����
          a.procode, --��Ŀ���
          a.htztcostname, --��ͬ����ɱ���������
          a.contractsigndate, --��ͬǩ������
          a.z_year, --��
          a.z_quarter --����
 order by a.id desc;

