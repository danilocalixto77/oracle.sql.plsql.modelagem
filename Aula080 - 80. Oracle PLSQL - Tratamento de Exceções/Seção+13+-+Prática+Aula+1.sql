--
--
-- Se��o 13 - Tratamento de Exce��es
--
-- Aula 1 - Tratamento de Exce��es
--
-- Aula 080

-- Tratamento de Exce��es Pr�-definidas Oracle
/*
- S�O AS EXCE��ES EM QUE AO OCORRER J� EXISTE UM TRATAMENTO DE UMA MENSAGEM PR�-DEFINIDA
  DO BD ORACLE.
- H� AS EXCE��ES DEFINIDAS PELO DESENVOLVEDOR. QUE UTILIZAM O PRAGMA EXCEPTION_INIT
- EXCE��ES N�O TRATADAS SE PROPAGAM PARA O AMBIENTE CHAMADOR, EXEMPLO UM BLOCO SUPERIOR
  QUE TENHA CHAMADO AQUELE BLOCO PL/SQL INFERIOR. CASO N�O HAJA MAIS BLOCOS HIERARQUICOS
  PARA SE PROPAGAR RETORNA A EXCE��O PARA O USU�RIO OU PARA O PROGRAMA QUE O CHAMOU.
  EXCE��O TRATADA N�O � UM ERRO. CASO N�O SEJA TRATADA SE TORNA UM ERRO.
  EXEMPLO DE EXCE�OES PR�-DEFINIDAS:
  COLLECTION_IS_NULL    ORA-06531 - TENTATIVA DE APLICAR UM M�TODO QUE N�O EXISTE
  CURSOR_ALREADY_OPEN   ORA-06511 - TENTATIVA DE ABRIR UM CURSOR J� ABERTO
  DUP_VAL_ON_INDEX      ORA-00001 - TENTATIVA DE INSERIR UM VALOR DUPLICADO EM UM INDICE �NICO
  INVALID_CURSOR        ORA-01001 - OPERA��O ILEGAL EM UM CURSOR.
  INVALID_NUMBER        ORA-01722 - FALHA NA CONVERS�O
  LOGIN_DENIED          ORA-01017 - USU�RIO OU SENHA INV�LIDO
  NO_DATA_FOUND         ORA-01403 - SELECT N�O RETORNA NENHUMA LINHA
  NOT_LOGGED_ON         ORA-01012 - PL/SQL EXECUTADA COM BANCO N�O LOGADO
  TIMEOUT_ON_RESOURCE
  TOO_MANY_ROWS
  VALUE_ERROR
  ZERO_DIVIDE
  
  SQLCODE - RETRORNA O C�DIGO DO ERRO.
  SQLERRM - RETORNA A MENSAGEM DO ERRO.
  
*/
SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT  pEmployee_id PROMPT 'Digite o Id do Empregado: '
DECLARE
  vFirst_name   employees.first_name%TYPE;
  vLast_name    employees.last_name%TYPE;
  vEmployee_id  employees.employee_id%TYPE := &pEmployee_id;
BEGIN
  SELECT first_name, last_name
  INTO   vfirst_name, vlast_name
  FROM   employees
  WHERE  employee_id = vEmployee_id;
  DBMS_OUTPUT.PUT_LINE('Empregado: ' || vfirst_name || ' ' || vlast_name);
EXCEPTION
  WHEN NO_DATA_FOUND 
  THEN
     RAISE_APPLICATION_ERROR(-20001, 'Empregado n�o encontrado, id = ' || 
     TO_CHAR(vEmployee_id));
  WHEN OTHERS 
  THEN
     RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle - ' || SQLCODE || SQLERRM);
END;


