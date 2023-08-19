--
-- Se√ß√£o 17 
-- Criando e Gerenciando Visıes - VIEW
--
-- Aula 1 - Criando e Gerenciando Vis√µes
--

-- Criando uma Vis„o - VIEW
CREATE OR REPLACE VIEW vemployeesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployeesdept60

-- Recuperando dados utilizando uma Vis„o
SELECT * FROM   vemployeesdept60;

-- Criando uma Vis„o Complexa 
CREATE OR REPLACE VIEW vdepartments_total (department_id, department_name, minsal, maxsal, avgsal)
AS 
SELECT e.department_id, d.department_name, MIN(e.salary), MAX(e.salary),AVG(e.salary)
FROM employees e 
JOIN departments d ON (e.department_id = d.department_id)
GROUP BY e.department_id, department_name;

SELECT * FROM vdepartments_total;

-- Utilizando a Cl·sula CHECK OPTION
-- Cria uma validaÁ„o em cima do where n„o permitindo insers„o na view que n„o seja igual ao valor do where.
CREATE OR REPLACE VIEW vemployeesdept100
AS 
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck;

-- Utilizando a Cl·usula READ ONLY
-- Deste modo a view mesmo que seja simples n„o ir· permitir comandos DML
CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

-- Removendo uma Vis„o
DROP VIEW vemployeesdept20;
