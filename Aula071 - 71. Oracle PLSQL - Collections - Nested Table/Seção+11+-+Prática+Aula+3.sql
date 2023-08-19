--
-- Se��o 11 - Tipos Compostos - Collections 
--
-- Aula 3 - Collections - Nested Table
--

-- Collections - Nested Table
-- Tipo muito semelhante ao assossiative array
-- Este tipo � o segundo mais utilizado no mercado.
-- Diferen�a entre associative arrya para nested table.
-- - Associative � temporario n�o armazena, Nested armazena em tabelas.
-- - Associative array ficando somente em mem�ria, e o nested table, pode ser definido 
--   uma coluna em uma tabela que ir� gravar informa��es. Embora esta pr�tica n�o seja 
--   recomendada de fazer uma coluna do tipo array/nested.
-- - Pode ser dinamicamente extendida.
-- - Indices de nested table s� podem ser positivos, ao contr�rio do associative array
--   que permiten de negativos, zeros e positivos.
-- - Nested table n�o inclui a clausuda INDEX BY
-- - O nested table � menos utilizado que o associative pela simplicidade do associative array.


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_Table_Type IS TABLE OF INTEGER(2);
  Numero_table numero_table_type := numero_table_type();
BEGIN
  -- Armazena n�meros de 1 a 10 em um Nested Table
  FOR i IN 1..10
  LOOP
    Numero_Table.extend;
    Numero_Table(i) := i;
  END LOOP;
  -- O programa vai fazer muitas coisas...
  -- L� o Nested Table e imprime os n�meros armazenados
  FOR I IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Nested Table: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
  END LOOP;
END;


