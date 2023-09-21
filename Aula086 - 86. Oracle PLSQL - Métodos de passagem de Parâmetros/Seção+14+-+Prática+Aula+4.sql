--
--
-- Seção 14 - Procedures de Banco de Dados
--
-- Aula 4 - Métodos de Passagem de Parametros
--
-- Aula 086

-- Métodos de Passagem de Parametros

-- Método Posicional
-- Os parâmetros devem ser passado conforme a sequência da criação dos parâmetros dentro da procedure.

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
  employees_record  employees%ROWTYPE;
BEGIN
  PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
    employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary, 
    employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
  DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;

-- Método Nomeado
-- Os parâmetros são passados informando o parâmetro e valor.
-- Desta maneira os parâmetros podem ser passardo em qualquer ordem pois os parâmetros estão sendo informados, e não somente seus respectivos valores.
-- Caso algum valor seja omitido, e ele possua um valor default não haverá problema.


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  VEMPLOYEE_ID NUMBER := 100;
  VFIRST_NAME VARCHAR2(200);
  VLAST_NAME VARCHAR2(200);
  VEMAIL VARCHAR2(200);
  VPHONE_NUMBER VARCHAR2(200);
  VHIRE_DATE DATE;
  VJOB_ID VARCHAR2(200);
  VSALARY NUMBER;
  VCOMMISSION_PCT NUMBER;
  VMANAGER_ID NUMBER;
  VDEPARTMENT_ID NUMBER;
BEGIN

  PRC_CONSULTA_EMPREGADO(
    PEMPLOYEE_ID => VEMPLOYEE_ID,
    PFIRST_NAME => VFIRST_NAME,
    PLAST_NAME => VLAST_NAME,
    PEMAIL => VEMAIL,
    PPHONE_NUMBER => VPHONE_NUMBER,
    PHIRE_DATE => VHIRE_DATE,
    PJOB_ID => VJOB_ID,
    PSALARY => VSALARY,
    PCOMMISSION_PCT => VCOMMISSION_PCT,
    PMANAGER_ID => VMANAGER_ID,
    PDEPARTMENT_ID => VDEPARTMENT_ID
  );

  DBMS_OUTPUT.PUT_LINE('PFIRST_NAME = ' || VFIRST_NAME);
  DBMS_OUTPUT.PUT_LINE('PLAST_NAME = ' || VLAST_NAME);
  DBMS_OUTPUT.PUT_LINE('PEMAIL = ' || VEMAIL);
  DBMS_OUTPUT.PUT_LINE('PPHONE_NUMBER = ' || VPHONE_NUMBER);
  DBMS_OUTPUT.PUT_LINE('PHIRE_DATE = ' || VHIRE_DATE);
  DBMS_OUTPUT.PUT_LINE('PJOB_ID = ' || VJOB_ID);
  DBMS_OUTPUT.PUT_LINE('PSALARY = ' || VSALARY);
  DBMS_OUTPUT.PUT_LINE('PCOMMISSION_PCT = ' || VCOMMISSION_PCT);
  DBMS_OUTPUT.PUT_LINE('PMANAGER_ID = ' || VMANAGER_ID);
  DBMS_OUTPUT.PUT_LINE('PDEPARTMENT_ID = ' || VDEPARTMENT_ID);
END;

