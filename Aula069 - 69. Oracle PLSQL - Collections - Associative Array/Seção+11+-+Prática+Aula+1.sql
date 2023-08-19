--
-- Seção 11 - Tipos Compostos - Collections 
--
-- Aula 1 - Collections - Associative Array
--

-- Collections - Associative Array
-- É uma array de uma dimensão. Desta forma destina-se a guardar um único valor.
--TIPO DE COLLECTIONS
-- ASSOCIATIVE ARRAY / NESTED TABLE / VARRAY

-- ASSOCIATIVE ARRAY CONHECIDO TAMBEM COMO INDEX-BY-TABLE, ORACLE TABLE, PL/SQL TABLE MAS ATUALMENTE ASSOSIATIVE ARRAY.


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_Table_Type IS TABLE OF NUMBER(2) 
  INDEX BY BINARY_INTEGER;
  Numero_table  Numero_Table_Type;
BEGIN
  -- Armazena números de 1 a 10 em um Associative Array
  FOR i IN 1..10
  LOOP
    Numero_Table(i) := i;
  END LOOP;
  -- Programa faz uma série de coisas...
  -- Lê o Associative Array e imprime os nÃºmeros armazenados
  FOR i IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Associative Array: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(I)));
  END LOOP;
END;

