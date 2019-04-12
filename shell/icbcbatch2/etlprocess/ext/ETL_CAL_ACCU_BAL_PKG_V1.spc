create or replace package ETL_CAL_ACCU_BAL_PKG_V1 is

  -- Author  : GYTZ-KAIF1
  -- Created : 2019/3/6 11:28:28
  -- Purpose : ���㱾�¡������ۼƵĽ��
  --�ܳ���
  procedure main(p_date date);
  --���ͬҵ�����ͬҵ��ͬҵ��衢ͬҵ�������
  procedure deposits_lons_deal(p_date date);

  --�����ծ�������̶�������֤ȯ�����
  procedure security_deal(p_date date);

  --ծȯ���ع���ծȯ��ع������
  procedure repo_deal(p_date date);

  --��ծת�ɡ����ɻ�ծ���
  procedure debt_to_equity_swap(p_date date);

end ETL_CAL_ACCU_BAL_PKG_v1;
/
