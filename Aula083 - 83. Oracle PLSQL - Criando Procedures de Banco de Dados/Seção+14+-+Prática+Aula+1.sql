--
--
-- Seção 14 - Procedures de Banco de Dados
--
-- Aula 1 - Criando Procedures de Banco de Dados
--
-- Aula 083


-- Blocos anônimos são temporários.
-- Procedures são criadas e salvas no banco.
-- Código compilado da procedure salvo no bancco chama-se (P-Code)
-- Permitindo ser utilizado pelas linguagens de programação (Java, Delphi, Python e etc...)
-- Procedures permitem 3 tipos de parâmetros:
---- Entrada (In)
---- Saida (Out)
---- Entrada/Saida (In/Out)
-- IS ou AS representa a mesma coisa na PROCEDURE
-- IS ou AS subistitui o DECLARE do bloco anônimo.
-- Após executar o scrip a PROCEDURE fica gravada na aba de Procedures, as mesmas podem ser editadas diretamente pela ferramenta SQL Developer.
-- Após alterar uma procedure é necessário compilar novamente.


-- Criando uma Procedure de Banco de Dados
-- Após criada a procedure ela poder utilizada para ser executada seja via SGDB ou programa em outras linguagens.
-- Exemplo abaixo utilizando a procedure:

CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO
  (pfirst_name    IN VARCHAR2,
   plast_name     IN VARCHAR2,
   pemail         IN VARCHAR2,
   pphone_number  IN VARCHAR2,
   phire_date     IN DATE DEFAULT SYSDATE,
   pjob_id        IN VARCHAR2,
   pSALARY        IN NUMBER,
   pCOMMICION_PCT IN NUMBER,
   pMANAGER_ID    IN NUMBER,
   pDEPARTMENT_ID IN NUMBER)
IS 
  -- Nenhuma variável declarada
BEGIN
  INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id )
  VALUES (
    employees_seq.nextval,
    pfirst_name,
    plast_name,
    pemail,
    pphone_number,
    phire_date,
    pjob_id,
    psalary,
    pcommicion_pct,
    pmanager_id,
    pdepartment_id );
EXCEPTION
  WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando a Procedure pelo Bloco PL/SQL

BEGIN
  PRC_INSERE_EMPREGADO('David', 'Bowie','DBOWIE','515.127.4861',SYSDATE,'IT_PROG',15000,NULL,103,60);
  COMMIT;
END;

-- Consultando o empregado inserido
SELECT *
FROM   employees
WHERE  first_name = 'David' AND
       last_name = 'Bowie';

-- Executando a Procedure com o comando EXECUTE do SQL*PLUS
EXEC PRC_INSERE_EMPREGADO('Greg', 'Lake','GLAKE','515.127.4961',SYSDATE,'IT_PROG',15000,NULL,103,60)

COMMIT;

-- Consultando o empregado inserido
SELECT *
FROM   employees
WHERE  first_name = 'Greg' AND
       last_name = 'Lake';


