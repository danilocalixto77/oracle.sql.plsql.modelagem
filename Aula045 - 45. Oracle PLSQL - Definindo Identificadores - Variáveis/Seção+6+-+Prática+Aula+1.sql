--
-- Seção 6 - Declaração de Identificadores - Variáveis e Constantes
--
-- Aula 1 - Definindo Identificadores - Variáveis
--
-- 

-- Declarando Variáveis 

-- Declarando uma variável Tipo NUMBER

SET SERVEROUTPUT ON
DECLARE
  vNumero NUMBER(11,2) := 1200.50;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' ||   vNumero);
END;

-- Declarando variáveis Tipo CHAR e VARCHAR2
SET SERVEROUTPUT ON
DECLARE
  vCaracterTamFixo     CHAR(2) := 'RS';
  vCaracterTamVariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavel );
END;

-- Declarando variáveis Tipo DATE

SET SERVEROUTPUT ON
DECLARE
  vData1     DATE := '29/04/20';
  vData2     DATE := '29/04/2020';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Data1 = ' || vData1 );
  DBMS_OUTPUT.PUT_LINE('Data2 = ' || vData2 );
END;


SET SERVEROUTPUT ON
DECLARE
  vNome VARCHAR2(40) NOT NULL := 'Danilo Holanda Calixto';
  vFlag CHAR(1)               := 'S'; 
  vSalario NUMBER(11,2)       := 3500.50;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Meu nome: ' || vNome);
  DBMS_OUTPUT.PUT_LINE('Valor da Flag: ' || vFlag);
  DBMS_OUTPUT.PUT_LINE('O Salário é: ' || vSalario);
END;

SET SERVEROUTPU ON  
DECLARE 
  vValorDouble NUMBER(11,2f) := 2.155;
  vValorFloat NUMBER(11,3d)  := 2.25645;
  vDataNascimento DATE := '16/07/1977';
BEGIN
  DBMS_OUTPUT.PUT_LINE(vValorDouble);
  DBMS_OUTPUT.PUT_LINE(vValorFloat);
  DBMS_OUTPUT.PUT_LINE(vDataNascimento);
END;

SET SERVEROUTPUT ON
DECLARE
  vValBoo BOOLEAN := TRUE;
BEGIN
  IF vValBoo THEN
     DBMS_OUTPUT.PUT_LINE('DEU VERDADEIRO (TRUE)');
  ELSE
    DBMS_OUTPUT.PUT_LINE('DEU FALSO');
  END IF;
END;


  
