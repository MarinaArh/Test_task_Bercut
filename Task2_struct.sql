-- Создание и заполнение структур для ЗАДАЧИ 2
CREATE TABLE test
    (n NUMBER(10) PRIMARY KEY);
/
COMMENT ON COLUMN test.n
   IS 'Порядковый номер';
/   
CREATE TABLE test_log
    (n NUMBER(10) PRIMARY KEY);
/
COMMENT ON COLUMN test_log.n
   IS 'Порядковый номер';
/
INSERT INTO test_log VALUES (8);
/
INSERT INTO test SELECT rownum FROM DUAL CONNECT BY ROWNUM <= 23;
/
COMMIT;
