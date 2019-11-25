--создание таблицы
CREATE TABLE test_pay
    (clnt_id  NUMBER(10) NOT NULL,
     subs_id  NUMBER(10) NOT NULL,
     pay_sum  NUMBER(8, 2) NOT NULL,
     pay_date DATE NOT NULL,
     del_date DATE
     );
/
COMMENT ON COLUMN test_pay.clnt_id 
   IS 'ID клиента';
COMMENT ON COLUMN test_pay.subs_id
   IS 'ID абонента';
COMMENT ON COLUMN test_pay.pay_sum
   IS 'Сумма платежа';
COMMENT ON COLUMN test_pay.pay_date
   IS 'Дата платежа';
COMMENT ON COLUMN test_pay.del_date
   IS 'Дата удаления платежа';
/
CREATE TABLE test_data
    (n        NUMBER(10) PRIMARY KEY,
     clnt_id  NUMBER(10) NOT NULL,
     subs_id  NUMBER(10) NOT NULL,
     all_pay_sum  NUMBER(8, 2) NOT NULL
     );
/     
COMMENT ON COLUMN test_data.n
   IS 'ID (порядковый номер)';
COMMENT ON COLUMN test_data.clnt_id 
   IS 'ID клиента';
COMMENT ON COLUMN test_data.subs_id
   IS 'ID абонента';
COMMENT ON COLUMN test_data.all_pay_sum
   IS 'Сумма платежей';
/ 
-- для первичного ключа в таблице test_data
CREATE SEQUENCE test_data_seq
 START WITH     1
 INCREMENT BY   1
 NOCYCLE;
/
-- таблица клиентов
CREATE TABLE clients
    (id NUMBER(10) PRIMARY KEY
    );
/ 
-- таблица абонентов
CREATE TABLE abonents
     (id NUMBER(10) PRIMARY KEY,
      id_client NUMBER(10),
      CONSTRAINT un_key UNIQUE (id, id_client),
      CONSTRAINT fk_cli FOREIGN KEY (id_client) REFERENCES clients (id)
    );
