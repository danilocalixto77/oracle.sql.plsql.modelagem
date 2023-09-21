--
-- Seção 15 - Funções de Banco de Dados
--
-- Aula 4 - Removendo Funçõµes de Banco de Dados
--
-- Aula 092

--- Removendo Funções de Banco de Dados

DROP FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO;



create or replace FUNCTION FNC_CONSULTA_SALARIO_EMPREGADO
  (pemployee_id   IN NUMBER)
   RETURN NUMBER
IS 
  vSalary  employees.salary%TYPE;
BEGIN
  SELECT salary
  INTO   vsalary
  FROM   employees
  WHERE employee_id = pemployee_id;
  RETURN (vsalary);
EXCEPTION
  WHEN NO_DATA_FOUND THEN 
    RAISE_APPLICATION_ERROR(-20001, 'Empregado inexistente');
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || ' - ' || SQLERRM);
END;