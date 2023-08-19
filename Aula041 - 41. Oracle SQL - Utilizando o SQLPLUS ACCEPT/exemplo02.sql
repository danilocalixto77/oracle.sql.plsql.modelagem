ACCEPT pnome PROMPT 'Digite o Sobre-nome do empregado:'
select employee_id, first_name, last_name 
from employees
where upper(last_name) = upper('&pnome');

ACCEPT pid PROMPT 'Digite o ID do empregado:'
select employee_id, first_name, last_name 
from employees
where employee_id = &pid;
