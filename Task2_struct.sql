-- �������� � ���������� �������� ��� ������ 2
CREATE TABLE test
    (n NUMBER(10) PRIMARY KEY);
/
COMMENT ON COLUMN test.n
   IS '���������� �����';
/   
CREATE TABLE test_log
    (n NUMBER(10) PRIMARY KEY);
/
COMMENT ON COLUMN test_log.n
   IS '���������� �����';
/
INSERT INTO test_log VALUES (8);
/
INSERT INTO test SELECT rownum FROM DUAL CONNECT BY ROWNUM <= 23;
/
COMMIT;
