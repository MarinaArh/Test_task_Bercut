/*���������� �������� ���� �� 1 �� 23 (����� ���� ����� ��������� i), �������:
��������� ������ � ������� test ��� ������� n = i, ������������ n = n - 1;
��������� � ������� test_log ������ � n = i.

��� ���� ������ ����������� ��������� �������:
������ 5 ����� ������ ����������� �������� ��������� � ��������.
��������� �� ��� �����, ������� ����� ������, �� ������ ���� ������������� � ��������.
*/
DECLARE
 i PLS_INTEGER := 1;
 cnt CONSTANT PLS_INTEGER := 23;
 rpt CONSTANT PLS_INTEGER := 5;
begin
 WHILE i <= cnt LOOP
   begin
    SAVEPOINT p1;
    UPDATE test SET n = n-1 WHERE n = i;
    INSERT INTO test_log VALUES(i);
   EXCEPTION 
     WHEN OTHERS THEN
      ROLLBACK TO p1;
   END;
   IF mod(i, rpt) = 0 THEN
    COMMIT;
   END IF;
   i := i+1;
 END LOOP;
 COMMIT;
END;
