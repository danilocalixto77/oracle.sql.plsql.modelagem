--
-- Se��o 15 
-- Comandos DDL 
--
-- Aula 2 - Alterando a Estrutura da Tabela
--

-- ALTER TABLE - Adicionando uma coluna
-- Comando DDL s�o auto commit
ALTER TABLE projects
ADD (department_id NUMBER(3)); 

DESC projects

-- ALTER TABLE - Removendo uma coluna
ALTER TABLE projects
DROP COLUMN department_id; 

DESC projects

-- ALTER TABLE - Adicionando uma coluna
ALTER TABLE projects
ADD (department_id NUMBER(4) NOT NULL); 

DESC projects

-- ALTER TABLE -- Modificando uma colunauma coluna
-- Modifica o tipo ou tamanho da coluna
-- Mudan�a de tamanho para inferior somente caso n�o resulte no truncamento dos dados
-- Mudan�a do tipo somente para tipos que possuam convers�o impl�cita. Exemplo: char para varchar2 
ALTER TABLE projects
MODIFY (project_code VARCHAR2(6));

alter table PROJECTS modify(PROJECT_CODE char(7));
alter table projects add (code2 number default 123456)             
alter table projects modify (code2 char(10));
alter table projects modify (code2 BINARY_DOUBLE)
                            
DESC PROJECTS

               
-- ALTER TABLE - Renomeando uma coluna
ALTER TABLE projects
RENAME COLUMN project_name TO name;

alter table projects rename column code2 to codigo_dois

DESC projects

-- ALTER TABLE - READ ONLY
-- Ap�s modificar o estado da tabela para este modo, n�o ser� mais permitido comando DDL ou DML
ALTER TABLE employees READ ONLY;

-- ALTER TABLE - READ WRITE
-- Retorna a tabela para o estado para permitir os comando DDL e DML 
ALTER TABLE employees READ WRITE;