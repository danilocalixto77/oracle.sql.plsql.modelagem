--
--
-- Se��o 12 - Cursor Expl�cito
--
-- Aula 3 - Cursor Expl�cito com Par�metros
--
-- Aula 078

-- CURSOR FOR LOOP com par�metros
/*
OS PARAMETROS S�O DECLARADOS LOGO AP�S A DECLARA��O DO CURSO
OS VALORES DO PAR�METROS S�O INFORMADO DENTRO DO OPEN
*/
SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor 
    (
    pdepartment_id NUMBER,
    pjob_id VARCHAR2
    ) --DECLARA��O DOS PARAMETROS
  IS SELECT  *
  FROM    employees
  WHERE   department_id = pdepartment_id  AND
          job_id = pjob_id;
BEGIN
  FOR employees_record IN  employees_cursor (60, 'IT_PROG') --VALORES DOS PAR�METROS
  LOOP
     DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));

  END LOOP;
END;

