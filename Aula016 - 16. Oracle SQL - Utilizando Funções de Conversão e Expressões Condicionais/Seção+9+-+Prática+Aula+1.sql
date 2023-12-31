--
-- Se��o 9 
-- Utilizando Fun��es de Convers�o e Express�es Condicionais 
--
-- Aula 1
--
-- V�deo 16

-- Utilizando a Fun��o TO_CHAR com Datas
SELECT last_name,TO_CHAR(hire_date, 'DD/MM/YYYY  HH24:MI:SS') DT_ADMISS�O
FROM employees;

SELECT sysdate,TO_CHAR(sysdate, 'DD/MM/YYYY  HH24:MI:SS') DATA
FROM   dual;

SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;

SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISS�O
FROM employees;

-- Utilizando a Fun��o TO_CHAR com N�meros
SELECT first_name, last_name, TO_CHAR(salary, 'L99G999G999D99') SALARIO
FROM employees;

SELECT first_name, last_name, TO_CHAR(salary, 'L99G999G999D99') SALARIO
FROM employees;

-- Utilizando a Fun��o TO_NUMBER
SELECT TO_NUMBER('12000,50')
FROM  dual;

-- Utilizando a Fun��o TO_DATE
SELECT TO_DATE('06/02/2020','DD/MM/YYYY') DATA
FROM  dual;

SELECT first_name, last_name, hire_date
FROM   employees
WHERE  hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Utilizando Fun��es Aninhadas
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0) NUMERO_MESES
FROM   employees
WHERE  hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Utilizando a Fun��o NVL
-- A fun��o substitui o valor null pelo argumento passado. (SEMELHANTE AO COALESCE DO MSSQL)
SELECT last_name, salary, NVL(commission_pct, 0), salary*12 SALARIO_ANUAL, 
       (salary*12) + (salary*12*NVL(commission_pct, 0)) REMUNERACAO_ANUAL
FROM employees;

-- Utilizando a Fun��o COALESCE
-- A fun��o recebe v�rios argumentos e ir� retornar o valor do primeiro argumento diferente de null.
SELECT COALESCE(NULL, NULL, 'Express�o 3'), 
       COALESCE(NULL, 'Express�o 2', 'Express�o 3'),
       COALESCE('Express�o 1', 'Express�o 2', 'Express�o 3'),
       COALESCE(NULL, NULL, 'Express�o 3', NULl)
FROM dual;

SELECT last_name, employee_id, commission_pct, manager_id, 
       COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id),
       'Sem percentual de comiss�o e sem gerente')
FROM employees;

-- Utilizando a Fun��o NVL2
-- A fun��o recebe tr�s argumentos, primeiro a coluna a ser analisada, o segundo
-- e o terceiro ser�o os valores para subistituir.
-- Sendo que se o valor for diferente de null ele ir� retornar o segundo argumento, 
-- se o valor for null retorna o terceiro argumento.
SELECT last_name, salary, commission_pct, 
       NVL2(commission_pct, 10, 0) PERCENTUAL_ATERADO
FROM employees;

-- Utilizando a Fun��o NULLIF
-- A fun��o recebe dois argumento, e faz a compara��o entre eles, se forem iguais
-- retorna NULL, caso sejam diferentes retorna o primeiro argumento.
SELECT NULLIF(1000,1000), NULLIF(1000,2000)
FROM dual;

SELECT first_name, last_name, LENGTH(first_name) "Express�o 1",
       LENGTH(last_name) "Express�o 2", NULLIF(LENGTH(first_name), LENGTH(last_name)) RESULTADO
FROM employees;

-- Express�o CASE
SELECT last_name, job_id, salary,
                          CASE job_id
                             WHEN 'IT_PROG'   
                               THEN 1.10*salary
                             WHEN 'ST_CLERK' 
                               THEN 1.15*salary
                             WHEN 'SA_REP' 
                               THEN 1.20*salary
                             ELSE salary 
                           END "NOVO SALARIO"
FROM employees;

-- Utilizando a Fun��o DECODE
-- Fun��o recebe os argumento avalia uma coluna, faz as an�lises apartir do argumento e resultado.
-- Funciona semelhante ao case.
SELECT last_name, job_id, salary,
DECODE(job_id, 'IT_PROG' , 1.10*salary,
               'ST_CLERK', 1.15*salary,
               'SA_REP'  , 1.20*salary
                         , salary) "NOVO SALARIO"
FROM employees;