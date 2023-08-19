--
-- Se√ß√£o 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 4 - Padr√µes de codifica„o sugeridos
--

-- Exemplo de uso dos Padr√µes de codificaÁ„o sugeridos

SET SERVEROUTPUT ON
DECLARE
  vBloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || vBloco1);
  -- Se voce referencia vbloco2 aqui ocorrer· Erro
  DECLARE
    vBloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || vBloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 2: ' || vBloco2);
  END;
  DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || vBloco1);
  -- Se voce referencia vbloco2 aqui ocorrer· Erro
END;

