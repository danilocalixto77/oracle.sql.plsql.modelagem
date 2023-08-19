--
-- Se��o 9 - Estruturas de Controle 
--
-- Aula 2 - Utilizando o comando IF
--

-- Utilizando o comando IF
SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
  vpercentual     NUMBER(3);
  vDepartment_id  employees.employee_id%type := &pdepartment_id;
BEGIN
  IF  vDepartment_id  =  80 THEN 
    vpercentual := 10; -- Sales
  ELSE 
    IF  vDepartment_id  =  20 THEN 
      vpercentual := 15; -- Marketing
    ELSE
      IF  vDepartment_id  =  60  THEN 
        vpercentual := 20; -- IT
      ELSE 
        vpercentual := 5;
      END IF;
    END IF;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Id do Departamento: ' || vDepartment_id);   
  DBMS_OUTPUT.PUT_LINE('Percentual: ' || vpercentual );   
  
  UPDATE employees 
  SET    salary = salary * (1 + vpercentual / 100)
  WHERE department_id =  vDepartment_id;
  COMMIT;
END;

-- Comando IF  com ELSIF
SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
  vpercentual     NUMBER(3);
  vDepartment_id  employees.employee_id%type := &pdepartment_id;
BEGIN
  IF vDepartment_id  = 80 THEN 
    vpercentual := 10; -- Sales 
  ELSIF vDepartment_id  =  20 THEN 
    vpercentual := 15; -- Marketing
  ELSIF vDepartment_id  =  60 THEN 
    vpercentual := 20; -- IT
  ELSE
    vpercentual := 5;
  END IF;
  
  DBMS_OUTPUT.PUT_LINE('Id do Departamento: ' || vDepartment_id);   
  DBMS_OUTPUT.PUT_LINE('percentual: ' || vpercentual );   
  
  UPDATE employees 
  SET    salary = salary * (1 + vpercentual / 100)
  WHERE department_id =  vDepartment_id;
  COMMIT;
END;

-- PARA O TRATAMENTO DE NULL UTILIZAR AS EXPRESS�ES IS NULL OU NOT NULL
-- PARA TRATAMENTO DE VALORES NULL PODEM SER UTILIZADAS AS FUN��ES NVL OU A NVL2
-- NVL SUBSTITUI O VALOR NULO POR UM VALOR DA EMPRESS�O EX: NVL(EXMPRESSION1, EXPRESSION2)
-- NVL2 SUBISTITUI O VALOR DA EXPRESS�O POR UM VALOR N�O NULO OU NULO EX: NVL2(EXPRESSION1, SEN�ONULO_EXPRESSAO2, SENULO_EXPRESS�O3)

