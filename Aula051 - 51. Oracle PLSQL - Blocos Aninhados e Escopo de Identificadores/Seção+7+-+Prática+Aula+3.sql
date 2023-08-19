--
-- SeÁ„o 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 3 - Blocos Aninhados e Escopo de Identificadores (vari·veis e constantes)
--

-- Escopo de Identificadores e Blocos Aninhados
SET SERVEROUTPUT ON
DECLARE
  vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer· Erro
  DECLARE
    vbloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || vbloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 2: ' || vbloco2);
  END;
  DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer· Erro
END;

-- Identificando Blocos atravÈs de Labels
-- Utilizar sinal de maior e menor duplo para declarar o label <<BLOCO>>
-- Entretanto n„o È uma boa pr·tica.
SET SERVEROUTPUT ON
<<BLOCO1>>
DECLARE
  vbloco1 VARCHAR2(20) := 'Bloco 1';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Referenciando vari√°vel do Bloco 1: ' || bloco1.vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer· Erro
  <<BLOCO2>>
  DECLARE
    vbloco2 VARCHAR2(20) := 'Bloco 2';
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Referenciando vari√°vel do Bloco 1: ' || bloco1.vbloco1);
    DBMS_OUTPUT.PUT_LINE('Referenciando vari√°vel do Bloco 2: ' || bloco2.vbloco2);
  END;
  DBMS_OUTPUT.PUT_LINE('Referenciando vari·vel do Bloco 1: ' || bloco1.vbloco1);
  -- Se voce referencia vbloco2 aqui ocorrer· Erro
END;