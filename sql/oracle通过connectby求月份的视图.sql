-- CONNECT BY用法求某年到现在所有月份的视图
create view V_yearmonth
as
SELECT TO_CHAR (ADD_MONTHS (SYSDATE, - (ROWNUM - 1)), 'yyyy-mm') yyyymm
FROM DUAL CONNECT BY ROWNUM < MONTHS_BETWEEN(SYSDATE, TO_DATE ('20000101', 'yyyymmdd'))+1