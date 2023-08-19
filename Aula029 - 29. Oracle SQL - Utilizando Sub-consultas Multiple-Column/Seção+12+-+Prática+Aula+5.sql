--
-- Seção 12 
-- Utilizando Sub-Consultas
--
-- Aula 5 - Utilizando Sub-consultas Multiple-Column 
-- 
-- Video 29
  
-- Utilizando Sub-consultas Multiple-Column 
-- Esse tipo de consulta para a quantidade de expressões que tiver na consulta
-- deverá ter na sub-consulta. Para cláusula WHERE.
-- No exemplo abaixo contém 2, desta forma a sub-consulta deve ter 2 também.
SELECT e1.employee_id, e1.first_name, e1.job_id, e1.salary
FROM   employees e1
WHERE (e1.job_id, e1.salary) IN (SELECT   e2.job_id, MAX(e2.salary)
                                 FROM     employees e2
                                 GROUP by e2.job_id);
								 
