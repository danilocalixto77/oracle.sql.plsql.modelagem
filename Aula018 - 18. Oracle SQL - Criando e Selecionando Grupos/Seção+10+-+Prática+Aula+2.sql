--
--
-- Se��o 10 
-- Agregando dados utilizando Fun��es de Grupo
--
-- Aula 2
-- 
-- Video 18
--

-- Criado Grupos utilizando a Cl�usula GROUP BY
SELECT department_id, AVG(salary)
FROM   employees
GROUP BY department_id 
ORDER BY department_id;

-- Utilizando a Cl�usula Group by com mais de uma Coluna ou Expressão
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas incorretas utilizando Fun��es de Grupo 
-- Corrigido inserito o group by
SELECT department_id, AVG(salary)
FROM   employees;
-- Corrigindo consultas incorretas utilizando Fun��es de Grupo
SELECT department_id,  AVG(salary)
FROM employees
GROUP BY department_id;

-- Consultas incorretas utilizando Fun��es de Grupo
SELECT department_id, MAX(salary)
FROM   employees
WHERE  MAX(salary) > 10000
GROUP BY department_id;

-- Corrigindo consultas incorretas utilizando Fun��es de Grupo

-- Restringindo Grupos utilizando a cl�usula HAVING
SELECT department_id, MAX(salary)
FROM   employees
GROUP BY department_id
HAVING MAX(salary)>10000;

SELECT job_id, SUM(salary) TOTAL
FROM   employees
WHERE  job_id <> 'SA_REP'
GROUP BY job_id
HAVING   SUM(salary) > 10000
ORDER BY SUM(salary);

-- Aninhando Fun��es de Grupo
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM   employees
GROUP BY department_id;