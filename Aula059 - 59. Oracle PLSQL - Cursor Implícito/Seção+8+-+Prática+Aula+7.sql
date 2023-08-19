---
-- Se��o 8 - Utilizando comandos SQL no PL/SQL
--
-- Aula 7 - Cursor Impl�cito
--

-- Utilizando atributos de Cursor Impl�cito

-- COMANDO QUE PODEM SER EXECUTADOS PARA CHECAGEM DO CURSO:
-- SQL%ROWCOUNT - RETORNA NUMERO DE LINHAS AFETADAS POR UM COMANDO ORACLE
-- SQL%FOUND -  RETORNA TRUE SE AFETOU UMA OU MAIS DE UMA LINHAS
-- SQL%NOTFOUND - RETORNA TRUE SE N�O AFETOU NENHUMA LINHA.
-- SQL%ISOPEN - SEMPRE RETORNA FALSE POIS O CURSO � CONTROLADO PELO ORACLE

SET SERVEROUTPUT ON
DECLARE
   vdepartment_id  employees.department_id%type := 60;
   vpercentual     NUMBER(3) := 10;
BEGIN
   UPDATE employees 
   SET salary = salary * (1 + vpercentual / 100)
   WHERE department_id =  vdepartment_id;
   DBMS_OUTPUT.PUT_LINE('Numero de empregados atualizados: ' || SQL%ROWCOUNT);
   -- COMMIT;  
END;

ROLLBACK;