CREATE TABLE test
    (n NUMBER(10) PRIMARY KEY);
/
CREATE TABLE test_log
    (n NUMBER(10) PRIMARY KEY);
/
INSERT INTO test_log VALUES (8);
/
INSERT INTO test SELECT rownum FROM DUAL CONNECT BY ROWNUM <= 23;
/
COMMIT;
