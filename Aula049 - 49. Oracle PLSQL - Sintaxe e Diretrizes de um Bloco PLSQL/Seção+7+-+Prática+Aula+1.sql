--
-- Se��o 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 1 - Sintaxe e Diretrizes de um Bloco PL/SQL
--

-- Comentando o C�digo

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declara��o de vari�vel para o Primeiro n�mero
  vNumero2  NUMBER(13,2);  -- Declara��o de vari�vel para o Segundo n�mero
  vMedia    NUMBER(13,2);  -- Declara��o de vari�vel para receber a Media calculada
BEGIN
  /* C�lculo do valor da m�dia entre dois n�meros
     Autor: Em�lio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  8000;
  vNumero2  :=  4000;
  vmedia    := (vNumero1 + vNumero2) / 2;           -- C�lculo da Media entre os dois n�meros  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impressão do Primeiro N�mero
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impressão do Segundo N�mero
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);     -- Impressão da M�dia calculada 
END;


