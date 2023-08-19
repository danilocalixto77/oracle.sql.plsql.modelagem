--
-- Seção 11 
-- Exibindo dados a partir de MÃºltiplas Tabelas
--
-- Aula 4 - OUTER JOINS
--
-- Video 22


-- LEFT OUTER JOIN
-- Retorna os registro que não possuem relacionamento da tabela a esquerda (employees)
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;

-- RIGHT OUTER JOIN
-- Retorna os registro que não possuem relacionamento da tabela a a direita (departaments)
SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM employees e RIGHT OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;

-- FULL OUTER JOIN
-- Retorna os registro que não possuem relacionamento nenhum em ambas tabelas
SELECT d.department_id, d.department_name, e.first_name, e.last_name
FROM   employees e FULL OUTER JOIN departments d
     ON (e.department_id = d.department_id) 
ORDER BY d.department_id;


