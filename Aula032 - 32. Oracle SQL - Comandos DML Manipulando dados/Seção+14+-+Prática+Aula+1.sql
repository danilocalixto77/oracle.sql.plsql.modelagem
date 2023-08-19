--
-- Seção 14 
-- Comandos DML - Manipulando dados 
--
-- Aula 1 - Comandos DML - Manipulando dados 
-- 
-- Aula 32
--

-- Utilizando o Comando INSERT
INSERT INTO departments(department_id,
department_name, manager_id, location_id)
VALUES (280, 'Project Management', 103, 1400);

-- Inserindo Linhas com valores NULOS - Método Explícito
INSERT INTO departments
VALUES (290, 'Data Science', NULL, NULL);

-- Inserindo Linhas com valores NULOS - Método Explícito
INSERT INTO departments(department_id,
department_name)
VALUES (300, 'Business Intelligence');
desc departments

-- Inserindo Linhas com valores NULOS - Método Explícito
-- Basta não declarar a coluna
INSERT INTO departments
VALUES (301, 'Inovation', NULL, NULL);

-- Inserindo Linhas com valores NULOS - Método Explícito
-- Basta não declarar a coluna
INSERT INTO departments(department_id,
department_name)
VALUES (302, 'IOT');

COMMIT;

-- Inserindo valores especiais retornados de Funções
-- Neste método é informado o valor Null para a coluna que deseja.
-- E para o a data a função SYSDATE
INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

-- Insert utilizando data e hora específicas
-- Formantando uma string para o formato data
INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
SELECT *
FROM   employees
ORDER BY employee_id DESC;

COMMIT;

-- Utilizando variáveis de Substituição
SELECT *
FROM departments
ORDER BY department_id DESC;

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name',&location);

COMMIT;

-- Inserindo linhas a partir de uma Sub-consulta
DROP TABLE sales_reps;

CREATE TABLE sales_reps
(id NUMBER(6,0),
 name VARCHAR2(20),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2));

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

SELECT * FROM SALES_REPS;

COMMIT;

SELECT *
FROM sales_reps;

-- Utilizando o comando UPDATE
UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

SELECT *
FROM employees
WHERE last_name = 'King';

-- Utilizando o comando UPDATE com Sub-consultas
UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 141)
WHERE employee_id = 140;

COMMIT;

-- Utilizando o comando DELETE
DELETE FROM countries
WHERE  country_name = 'Nigeria';

ROLLBACK;

-- Utilizando o comando ROLLBACK
DELETE FROM employees
WHERE employee_id = 208;

-- Utilizando o comando COMMIT

COMMIT;

-- Utilizando o comando COMMIT

-- Utilizando Savepoint

DELETE FROM employees
WHERE employee_id IN (207,208);

COMMIT;

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

SAVEPOINT A;

INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
ROLlBACK TO SAVEPOINT  A;

COMMIT; 

SELECT *
FROM employees
ORDER BY employee_id DESC;

-- Cláusula FOR UPDATE no comando SELECT 
-- O Select não gera lock, somente se tiver o FOR UPDATE
-- Esta cláusula da um lock nas linhs que estão sendo retornadas pelo select
SELECT employee_id, salary, commission_pct, job_id
FROM   employees
WHERE  job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;

COMMIT;

-- Neste "FOR UPDATE DO" irá fazer lock somente na linha de employes pois foi indicado uma coluna da tabela de employees
SELECT e.employee_id, e.salary, e.commission_pct
FROM employees e JOIN departments d
USING (department_id)
WHERE job_id = 'ST_CLERK'
AND location_id = 1500
FOR UPDATE of e.salary
ORDER BY e.employee_id;

COMMIT;