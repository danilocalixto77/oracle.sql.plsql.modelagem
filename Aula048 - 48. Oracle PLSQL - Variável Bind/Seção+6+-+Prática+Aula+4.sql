--
-- Se��o 6 - Declaraa��o de Identificadores - Vari�veis e Constantes
--
-- Aula 4 - Vari�vel Bind
--

-- Utilizando Vari�vel Bind

SET SERVEROUTPUT ON
VARIABLE gmedia NUMBER
DECLARE
  vnumero1  NUMBER(11,2) := 2000;
  vnumero2  NUMBER(11,2) := 5000;
BEGIN  
  :gmedia := (vnumero1 + vnumero2) / 2;
  DBMS_OUTPUT.PUT_LINE('Media = ' || TO_CHAR(:gmedia));
EXCEPTION
  WHEN OTHERS 
  THEN 
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;


