--
-- Seção 10 - Tipos Compostos - Variável Tipo PL/SQL Record
--
-- Aula 2 - Utilizando atributo %ROWTYPE
--

-- Criando um PL/SQL Record utilizando atributo %ROWTYPE
SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pemployee_id PROMPT 'Digite o Id do empregado: '
DECLARE
  employee_record   employees%rowtype;
  vEmployee_id      employees.employee_id%type := &pemployee_id;
BEGIN
  SELECT  * 
  INTO    employee_record
  FROM    employees
  WHERE   employee_id = vEmployee_id;
  DBMS_OUTPUT.PUT_LINE(employee_record.employee_id || ' - ' || 
                     employee_record.first_name || ' - ' || 
                     employee_record.last_name || ' - ' || 
                     employee_record.phone_number || ' - ' ||
                     employee_record.job_id);
END;

SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pdepartment_id PROMPT 'Digite o ID do Departamento: '
DECLARE
  department_record  departments%rowtype;
  vDepartment_id     departments.department_id%type := &pdepartment_id;
BEGIN
  SELECT  * 
  INTO    department_record
  FROM    departments
  WHERE   department_id = vDepartment_id;
  DBMS_OUTPUT.PUT_LINE(department_record.department_id || ' - ' || 
                     department_record.department_id || ' - ' || 
                     department_record.department_id || ' - ' || 
                     department_record.department_id || ' - ' ||
                     department_record.department_id);
END;


SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT pjob_id PROMPT 'Digite o ID do Jobs: '
DECLARE
  job_record  jobs%rowtype;
  vjob_id     jobs.job_id%type := '&pjob_id';
BEGIN
  SELECT  * 
  INTO    job_record
  FROM    jobs
  WHERE   job_id = vjob_id;
  DBMS_OUTPUT.PUT_LINE(job_record.job_id || ' - ' || 
                     job_record.job_id || ' - ' || 
                     job_record.job_id || ' - ' || 
                     job_record.job_id || ' - ' ||
                     job_record.job_id);
END;



  


