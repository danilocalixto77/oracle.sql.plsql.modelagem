--
-- Seção 9 - Estruturas de Controle 
--
-- Aula 5 - FOR LOOP
--

-- FOR LOOP

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vInicio  INTEGER(3) := 1;
  vFim     NUMBER(38) := &pLimite;
BEGIN
FOR i IN vinicio..vfim  LOOP
  DBMS_OUTPUT.PUT_LINE('Número = ' || to_char(i) );
END LOOP;
END;



SET SERVEROUTPUT ON
DECLARE
  vIni Integer(3) := 1;
  vFin Integer(10) := 5;
BEGIN
  FOR I IN REVERSE vIni..vFin  LOOP
    DBMS_OUTPUT.PUT_LINE('Contando REVERSE:  '||I);
  END LOOP;
END;