/*����� �������� ������, ������� �������� ����� ������ 10 �� �������� �������� �� ������ �� ���������. 
������ �� ������� ������ ���������� � ���������, ���������� ����: clnt_id, subs_id, all_pay_sum.

�� ���������� ������� ������ � ���������, ���������� �������� ������ ������ ������ �� ���� ��������� � ������� test_data. 
����������� ������������� ��������������� �������� � ����������� ��� ������� ������.
*/
DECLARE
 TYPE rec IS RECORD (
    clnt_id  test_data.clnt_id%TYPE,
    subs_id  test_data.subs_id%TYPE,
    all_pay_sum  test_data.all_pay_sum%TYPE
    );
 TYPE tResQ IS TABLE OF rec;
 resQ tResQ;
 
 TYPE t_number IS TABLE OF NUMBER;
 nums t_number;
 
 cntPay CONSTANT PLS_INTEGER := 10;
 rpt CONSTANT PLS_INTEGER := 3;
 
 n PLS_INTEGER;
begin
  --  �������� ����� ������ 10 ����������� �������� �� �������� (������ - �.�. � ������ �����)
  SELECT clnt_id,
          subs_id,
          SUM(pay_sum) 
  BULK COLLECT INTO resQ
   FROM
     (SELECT clnt_id,
          subs_id,
          pay_sum,
          pay_date,
          row_number() OVER (PARTITION BY clnt_id,
                                          subs_id
                             ORDER BY pay_date) rn
     FROM test_pay
     WHERE del_date IS NULL )
  WHERE rn <= cntPay
  GROUP BY clnt_id,
           subs_id;
    
  -- ������� � ��������� �� ��������� ��� ������������� � FORALL 
   n := resQ.COUNT; 
   SELECT rownum BULK COLLECT INTO nums
   FROM dual 
   CONNECT BY rownum <= n;

  -- ���������� ������ ������ ������� �� ���������, �������� �� �������� �� ������� � ���������  
   FORALL indx IN resQ.First .. resQ.LAST
      INSERT INTO test_data  
        SELECT test_data_seq.NEXTVAL, resQ(indx).clnt_id, resQ(indx).subs_id, resQ(indx).all_pay_sum 
        FROM DUAL
      WHERE MOD(nums(indx),rpt)=0;
   COMMIT;
/* ������������� ����� ������ �������� ���������� ������� ������ i-�� ������ �� ��������� ��� ���������� ������ � �������, �������� 
  - �������� ������������ �������� �� ��������� 
  - ���������� � ������ ��������� 
  ����� ���������� ���������� ������� �� ���������� ������� � �������������� ��������� � �� �������� i     
*/
end;
