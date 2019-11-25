-- заполнение структур тестовыми данными
INSERT INTO clients SELECT rownum FROM dual CONNECT BY ROWNUM <= 10;
/
INSERT INTO abonents SELECT ROWNUM, round(dbms_random.value(1,10)) FROM dual CONNECT BY ROWNUM <= 20;
/
INSERT INTO test_pay VALUES (10, 11, 100, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 500, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (10, 11, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 300, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 400, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 600, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 100, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (10, 11, 500, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 300, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 400, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (10, 11, 600, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 100, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 500, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 300, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (10, 11, 400, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (10, 11, 600, sysdate - round(dbms_random.value(1,30)), NULL);

INSERT INTO test_pay VALUES (1, 6, 100, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 500, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (1, 6, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 300, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 400, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 600, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 100, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (1, 6, 500, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 300, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 400, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (1, 6, 600, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 100, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 500, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 300, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (1, 6, 400, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (1, 6, 600, sysdate - round(dbms_random.value(1,30)), NULL);

INSERT INTO test_pay VALUES (4, 5, 100, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 500, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (4, 5, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 300, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 400, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 600, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 100, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (4, 5, 500, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 300, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 400, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (4, 5, 600, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 100, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 500, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 200, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 300, sysdate - round(dbms_random.value(1,30)), sysdate);
INSERT INTO test_pay VALUES (4, 5, 400, sysdate - round(dbms_random.value(1,30)), NULL);
INSERT INTO test_pay VALUES (4, 5, 600, sysdate - round(dbms_random.value(1,30)), NULL);

COMMIT;
