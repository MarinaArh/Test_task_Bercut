/*Нужно написать запрос, который выбирает сумму первых 10 не удалённых платежей на каждом из абонентов. 
Данные из запроса должны помещаться в коллекцию, содержащую поля: clnt_id, subs_id, all_pay_sum.

По завершению выборки данных в коллекцию, необходимо вставить каждую третью запись из этой коллекции в таблицу test_data. 
Допускается использование вспомогательных объектов и конструкций для решения задачи.
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
  --  выбираем сумму первых 10 неудаленных платежей по абоненту (первые - т.е. с ранней датой)
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
    
  -- таблица с индексами по коллекции для использования в FORALL 
   n := resQ.COUNT; 
   SELECT rownum BULK COLLECT INTO nums
   FROM dual 
   CONNECT BY rownum <= n;

  -- записываем каждый третий элемент из коллекции, проверяя по значению из таблицы с индексами  
   FORALL indx IN resQ.First .. resQ.LAST
      INSERT INTO test_data  
        SELECT test_data_seq.NEXTVAL, resQ(indx).clnt_id, resQ(indx).subs_id, resQ(indx).all_pay_sum 
        FROM DUAL
      WHERE MOD(nums(indx),rpt)=0;
   COMMIT;
/* Рассматривала также другие варианты реализации выборки каждой i-ой записи из коллекции для дальнейшей записи в таблице, например 
  - удаление неподходящих значений из коллекции 
  - перезапись в другую коллекцию 
  Выбор конкретной реализации зависит от количества записей в результирующем множестве и от значения i     
*/
end;
