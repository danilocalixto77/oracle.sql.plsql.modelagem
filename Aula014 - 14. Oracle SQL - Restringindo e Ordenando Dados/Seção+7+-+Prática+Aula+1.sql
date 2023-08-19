--
-- Seção 7 
-- Restringindo e Ordenando Dados
--
-- Aula 1
-- 

-- Utilizando a clÃ¡usula WHERE

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 60;

SELECT employee_id, last_name, job_id, department_id
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Utilizando Strings de caractere na cláusula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

-- Utilizando Strings de caractere com datas na cláusula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = To_Date('30/01/2004', 'dd/mm/yyyy');

-- Utilizando operadores de comparação na clásula WHERE
SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

-- Selecionando faixas de valores utilizando o operador BETWEEN
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

-- Selecionando valores dentro de uma lista utilizando o operador IN
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP') ;

-- Utilizando o operador LIKE
SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de vários caracteres curinga
-- Underline funciona como curinga de maneira que o que for digitado após o like irá posicionar a consulta onde a letra estiver digitada.
-- Exemplo abaixo irá retornar o funcionário que no last_name tiver a letra "v" na terceira posição da string.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '__v%';

-- Exemplo abaixo irá retornar o funcionário que no last_name tiver a letra "a" no final da string.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a';

-- Comparações com valor NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL ;

-- Utilizando a expressão de comparação IS NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- Utilizando o operador AND
SELECT employee_id, last_name, job_id, salary
FROM    employees
WHERE salary >= 5000
AND   job_id =  'IT_PROG' ;

-- Utilizando o operador OR
SELECT employee_id, last_name, job_id, salary
FROM    employees
WHERE salary >= 5000
OR   job_id =  'IT_PROG';

-- Utilizando o operador NOT
SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

-- Regras de Precedência
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'  OR job_id = 'IT_PROG' AND salary > 10000;

-- Utilizando parênteses para sobrepor as regras de precedência
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'  OR
               job_id = 'IT_PROG')
AND salary > 10000;

-- Utilizando a clá¡usula ORDER BY - Ordem Ascendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- Utilizando a cláusula ORDER BY - Ordem Descendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- Utilizando a clÃ¡usula ORDER BY - Referenciando ALIAS
SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cláusula ORDER BY - Referenciando a Posição
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Utilizando a cláusula ORDER BY - Múltiplas colunas ou expressões
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- Utilizando Variáveis de Substituição - &
-- Abre um prompt para digitação do valor que deseja pesquisa
-- Abrirá todas as vezes em que o instrução for executada.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

-- Utilizando Variáveis de Substituião - &&
-- Abre um prompt para digitação do valor que deseja pesquisa
-- Abrirá a primeira vez, as demais vezes em que a instrução for executada irá buscar na memória o valor que foi digitado na primeira vez.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

-- Variáveis de substituição com valores tipo Character e Date
SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id' ;

-- Utilizando o comando DEFINE
-- Define uma variável na seção
DEFINE employee_id = 101

-- Referenciando uma varíavel utilizada pelo Define
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id ;

DEFINE employee_id

-- Utilizando o comando DEFINE
-- Remove uma variável na seção
UNDEFINE employee_id