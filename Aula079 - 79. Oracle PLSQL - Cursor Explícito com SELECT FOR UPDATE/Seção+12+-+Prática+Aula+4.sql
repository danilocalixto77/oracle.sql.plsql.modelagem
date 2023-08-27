-- Se��o 12 - Cursor Expl�cito
-- Aula 4 - Cursor Expl�cito com SELECT FOR UPDATE
-- Aula 079

/*
= FOR UPDATE CAUSA LOCK NA TABELA.
= USAR COM MODERA��O, EM CASO DE UM SELECT FOR UPDATE IR� CAUSAR LOCK EM MUITOS REGISTROS
= CLAUSULA "WHERE CURRENT OF" IR� APLICAR A A��O DE UPDATE OU DELETE NA LINHA DO FETCH
*/

-- Cursor Expl�cito com SELECT FOR UPDATE
SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor (pjob_id VARCHAR2)
  IS SELECT * FROM    employees WHERE   job_id = pjob_id
  FOR UPDATE; -- CURSOR SENDO DECLARADO COMO DO TIPO FOR UPDATE
BEGIN
  FOR employees_record IN  employees_cursor ('AD_VP')
  LOOP
      UPDATE employees
      SET salary = salary * (1 + 10 / 100)
      WHERE CURRENT OF employees_cursor;
  END LOOP;
  COMMIT;
END;


