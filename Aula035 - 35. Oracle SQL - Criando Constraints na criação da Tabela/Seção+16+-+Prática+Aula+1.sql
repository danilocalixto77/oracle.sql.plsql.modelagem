--
-- Seção 16 
-- Criando e Gerenciando Constraints 
--
-- Aula 1 - Criando e Gerenciando Constraints na criaÃ§Ã£o da Tabela
--


-- ## CONSTRAINTS
-- São regras de integridade
-- Tipos de constraints:
---- NOT NUL
---- UNIQUE
---- PRIMARY KEY
---- FOREIGN KEY
---- CHECK
----
--- Nome padrão para as Constraints caso o DBA não defina: SYS_Cn + um numero sequencial.
--- Normalmente NOT NULL deixa o default mesmo.

-- Definindo Constraint NOT NULL
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nível de Coluna
DROP TABLE projects;
CREATE TABLE projects 
(project_id    NUMBER(6)    NOT NULL CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint PRIMARY KEY a nível de Tabela
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id));
 
-- Definindo Constraint UNIQUE a nível de Coluna
-- É um identificador unico da tabela além da primary key.
-- Entretanto null é permitido na constraint UNIQUE, para tanto declarando o NOT NULL da coluna pode restringir nulos.
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint UNIQUE a nível de Tabela
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code));
 
-- Definindo Constraint FOREIGN KEY a nível de Coluna
-- Estabelece a relação da tabela com outra tabela
-- A FOREING KEY pode referenciar uma coluna PRIMARY KEY ou UNIQUE, entretanto por prática normalmente se referencia REFERENCES a PRIMARY KEY
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL CONSTRAINT projects_department_id_fk REFERENCES departments (department_id),
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
 -- Definindo Constraint FOREIGN KEY a nível de Tabela
DROP TABLE projects;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(department_id));
 
-- FOREIGN KEY - Regras de deleção -- Default No Action
-- OPÇÃO MAIS UTILIZADA DE REGRAS DE DELEÇÃO
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id) REFERENCES projects(project_id),
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(employee_id));

desc projects;
desc employees;
desc teams;
 
-- FOREIGN KEY - Regras de deleção -- ON DELETE CASCADE
-- OPÇÃO MENOS COMUM DE UTILIZAÇÃO
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6)  NOT NULL,
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id) REFERENCES employees(employee_id));
 
-- FOREIGN KEY - Regras de deleção -- ON DELETE SET NULL
-- OPÇÃO MENOS COMUM DE UTILIZAÇÃO
DROP TABLE TEAMS;
CREATE TABLE TEAMS
(project_id    NUMBER(6),
 employee_id   NUMBER(6)  NOT NULL,
 CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
 REFERENCES projects(project_id) ON DELETE SET NULL,
 CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
 REFERENCES employees(employee_id));
 

-- CHECK CONSTRAINT - colunas que não podem ser referenciadas
select uid, userenv('language'), user, sysdate from dual;
select employee_id, first_name, rownum from employees;

-- Definindo Constraint CHECK a nível de Coluna
DROP TABLE projects cascade constraints;
CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL CONSTRAINT projects_project_id_pk PRIMARY KEY,
 project_code  VARCHAR2(10) NOT NULL CONSTRAINT projects_project_code_uk UNIQUE,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL CONSTRAINT projects_department_id_fk REFERENCES departments,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL CONSTRAINT projects_budget_ck CHECK (budget > 0),
 DESCRIPTION   VARCHAR2(400)NOT NULL);
 
-- Definindo Constraint CHECK a nível de Tabela
DROP TABLE projects cascade constraints;

CREATE TABLE projects
(project_id    NUMBER(6)    NOT NULL, 
 project_code  VARCHAR2(10) NOT NULL,
 project_name  VARCHAR2(100)NOT NULL,
 department_id NUMBER(4)    NOT NULL,
 CREATION_DATE DATE DEFAULT sysdate NOT NULL,
 START_DATE    DATE,
 END_DATE      DATE,
 STATUS        VARCHAR2(20) NOT NULL,
 PRIORITY      VARCHAR2(10) NOT NULL,
 BUDGET        NUMBER(11,2) NOT NULL,
 DESCRIPTION   VARCHAR2(400)NOT NULL,
 CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
 CONSTRAINT projects_project_code_uk UNIQUE (project_code),
 CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id) REFERENCES departments(department_id),
 CONSTRAINT projects_budget_ck CHECK (budget > 0));

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Violando Constraints - Erro
 
 INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 77,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');
   
-- Violando Constraints - Corrigindo 
INSERT INTO projects (
    project_id, project_code, project_name, department_id,
    creation_date, start_date, end_date, status, priority,
    budget, description) 
    VALUES (
    1, 'ERPIMP', 'ERP Implementation', 60,
    sysdate, null, null, 'Aproved', 'HIGH',
    1000000.00, 'Oracle ERP Implementation');

COMMIT;

-- Consultando Constraints pelo Dicionário de Dados
DESC user_constraints
DESC user_cons_columns

SELECT co.constraint_name,
       co.constraint_type,
       co.search_condition,
       co.r_constraint_name,
       co.delete_rule,
       cc.column_name,
       cc.position,
       co.status
 FROM   user_constraints co
   JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND 
                                (co.table_name = cc.table_name)
 WHERE  co.table_name = 'PROJECTS'
 ORDER BY co.constraint_name,
          cc.position;