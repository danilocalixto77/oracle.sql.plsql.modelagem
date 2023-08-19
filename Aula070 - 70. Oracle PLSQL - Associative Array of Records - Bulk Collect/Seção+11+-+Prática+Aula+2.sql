--
-- Se��o 11 - Tipos Compostos - Collections 
--
-- Aula 2 - Associative Array of Records - Bulk Collect
--

-- Associative Array of Records - Bulk Collect
-- Essa array � destinada a records, desta forma cada linha dela ir� armazenar todos valores de um registro 
-- que tenha sido consultado de uma tabela.
-- Usar este tipo com modera��o por n�o � aconselhavel pois o BULK carrega toda tabela.
-- Tipo de array/collection mais utilizado no mercado. Conforme experi�ncia do instrutor.

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE employees_table_type IS TABLE OF employees%rowtype
  INDEX BY BINARY_INTEGER;  -- Type Associative Array
  employees_table  employees_table_type;
BEGIN
  SELECT *
    BULK COLLECT INTO employees_table 
  FROM employees;
  FOR i IN employees_table.first..employees_table.last  
  LOOP
    DBMS_OUTPUT.PUT_LINE(employees_table(i).employee_id || ' - ' || 
                         employees_table(i).first_name || ' - ' || 
                         employees_table(i).last_name || ' - ' ||
                         employees_table(i).phone_number || ' - ' ||
                         employees_table(i).job_id || ' - ' ||
                         TO_CHAR(employees_table(i).salary,'99G999G999D99'));   
  END LOOP;
END;
