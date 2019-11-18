/*Необходимо написать цикл от 1 до 23 (номер шага цикла обозначим i), который:
Обновляет данные в таблице test для каждого n = i, устанавливая n = n - 1;
Вставляет в таблицу test_log запись с n = i.

При этом должны выполняться следующие условия:
Каждые 5 шагов должна выполняться фиксация изменений в таблицах.
Изменения по тем шагам, которые имели ошибки, НЕ должны быть зафиксированы в таблицах.
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
