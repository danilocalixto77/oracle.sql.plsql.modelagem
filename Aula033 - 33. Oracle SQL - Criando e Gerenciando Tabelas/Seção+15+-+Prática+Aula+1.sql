--
-- Seção 15 
-- Comandos DDL 
--
-- Aula 1 - Criando e Gerenciando Tabelas
--
-- Video 33


-- Consultando os objetos do schema do usuario HR
select * 
from user_objects
order by object_type;

 
 
 
-- Criando Tabelas
-- Precisa do previlégio CREATE TABLE  e espaço.
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100) NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400) NOT NULL);
 
 DESC projects
 
 SELECT *  FROM projects;
 
DROP TABLE TEAMS;

CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL);
 
 
 select * from teams;
 

-- Consultando a Estrutura da Tabela
DESC projects
DESC teams;

-- TIPOS DE DADOS
-- ## varchar2(tamanho) : 
---- Usa somente o que for utilizado dentro da variável.
---- Tamanho 4000bytes ou até 32767 caso dba defina na BD o parametros MAX_STRING_SIZE = EXTENDED
-- ## char(tamanho) : tamanho de até 2000bytes
---- Usa todo espaço definido na declaração da variável
-- ## date :
---- Dados de (dia, mês, ano, hora, minuto, segundo)
---- Suporta o periodo desde : 01 janeiro de 4712 A.C. até 31 de dezembro de 9999
---- Parametro que defino o formato da data pelo dba é o  NLS_DATE_FORMAT (Exemplo: DD/MM/YY)
-- ## number(p, s) -  precision / scale -> tamanho e decimais.
-- ## ROWID - Guarda o endereço lógico de uma coluna.
-- ## timestamp
---- Campo do tipo data entretanto dá maior precisão na casa de segundo com 9 dígitos nos segundos.
-- ## INTERVAL YER TO MONTH 
---- Armazena o intervalo de ANOS e MESES.
-- ## INTERVAL DAY TO SECOND 
---- Armazena o intevalo de DIAS, HORAS, MINUTOS e SEGUNDOS.



-- Tipo ROWID
-- Esse é o endereço em que está localizado esta linha dentro do banco de dados.
DESC employees

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from   employees

SELECT employee_id, first_name, rowid, LENGTH(rowid)
from   employees
WHERE rowid = 'AAASfEAAMAAAADLAAA';

-- Consultando as Tabelas existentes pelo Dicionário de Dados
DESC user_tables

SELECT table_name
FROM   user_tables;

-- Consultando os Objetos do tipo TABLE do usuário
DESC user_objects

SELECT object_name, object_type
FROM   user_objects
WHERE  object_type = 'TABLE';

-- Criando uma Tabela utilizando uma Sub-consulta

DROP TABLE employees_department60;

CREATE TABLE employees_department602
AS
SELECT employee_id, last_name,salary*12 ANNSAL, hire_date
FROM employees
WHERE department_id = 60;

DESC employees_department60

SELECT *
FROM   employees_department60;

-- TRUNCATE TABLE
TRUNCATE TABLE employees_department60;

SELECT *
FROM   employees_department60;

-- DROP TABLE
DROP TABLE employees_department60;
DROP TABLE employees_department601;
-- DROP TABLE COM PURGE
-- Tabela não irá para a lixeira (user_recyclebin)
DROP TABLE employees_department602 purge;

-- DROP TABLE em caso de constraints
-- sintaxe: 
-- DROP TABLE NOME_DA_TABELA CASCADE_CONSTRAINTS [PURGE];

SELECT *
FROM   employees_department602;

-- Consultando a Lixeira
SELECT *
FROM user_recyclebin;