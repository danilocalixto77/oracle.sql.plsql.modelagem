--
-- Se��o 7 
-- Restringindo e Ordenando Dados
--
-- Aula 1
-- 

-- Utilizando a cláusula WHERE

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 60;

SELECT employee_id, last_name, job_id, department_id
FROM   employees
WHERE  job_id = 'IT_PROG';

-- Utilizando Strings de caractere na cl�usula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

-- Utilizando Strings de caractere com datas na cl�usula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = To_Date('30/01/2004', 'dd/mm/yyyy');

-- Utilizando operadores de compara��o na cl�sula WHERE
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

-- Combinando o uso de v�rios caracteres curinga
-- Underline funciona como curinga de maneira que o que for digitado ap�s o like ir� posicionar a consulta onde a letra estiver digitada.
-- Exemplo abaixo ir� retornar o funcion�rio que no last_name tiver a letra "v" na terceira posi��o da string.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '__v%';

-- Exemplo abaixo ir� retornar o funcion�rio que no last_name tiver a letra "a" no final da string.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a';

-- Compara��es com valor NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL ;

-- Utilizando a express�o de compara��o IS NULL
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

-- Regras de Preced�ncia
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP'  OR job_id = 'IT_PROG' AND salary > 10000;

-- Utilizando par�nteses para sobrepor as regras de preced�ncia
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP'  OR
               job_id = 'IT_PROG')
AND salary > 10000;

-- Utilizando a cl�usula ORDER BY - Ordem Ascendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

-- Utilizando a cl�usula ORDER BY - Ordem Descendente
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

-- Utilizando a cláusula ORDER BY - Referenciando ALIAS
SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

-- Utilizando a cl�usula ORDER BY - Referenciando a Posi��o
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Utilizando a cl�usula ORDER BY - M�ltiplas colunas ou express�es
SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- Utilizando Vari�veis de Substitui��o - &
-- Abre um prompt para digita��o do valor que deseja pesquisa
-- Abrir� todas as vezes em que o instru��o for executada.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

-- Utilizando Vari�veis de Substitui�o - &&
-- Abre um prompt para digita��o do valor que deseja pesquisa
-- Abrir� a primeira vez, as demais vezes em que a instru��o for executada ir� buscar na mem�ria o valor que foi digitado na primeira vez.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

-- Vari�veis de substitui��o com valores tipo Character e Date
SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id' ;

-- Utilizando o comando DEFINE
-- Define uma vari�vel na se��o
DEFINE employee_id = 101

-- Referenciando uma var�avel utilizada pelo Define
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id ;

DEFINE employee_id

-- Utilizando o comando DEFINE
-- Remove uma vari�vel na se��o
UNDEFINE employee_id