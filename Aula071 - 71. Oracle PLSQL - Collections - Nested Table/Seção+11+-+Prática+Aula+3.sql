--
-- Seção 11 - Tipos Compostos - Collections 
--
-- Aula 3 - Collections - Nested Table
--

-- Collections - Nested Table
-- Tipo muito semelhante ao assossiative array
-- Este tipo é o segundo mais utilizado no mercado.
-- Diferença entre associative arrya para nested table.
-- - Associative é temporario não armazena, Nested armazena em tabelas.
-- - Associative array ficando somente em memória, e o nested table, pode ser definido 
--   uma coluna em uma tabela que irá gravar informações. Embora esta prática não seja 
--   recomendada de fazer uma coluna do tipo array/nested.
-- - Pode ser dinamicamente extendida.
-- - Indices de nested table só podem ser positivos, ao contrário do associative array
--   que permiten de negativos, zeros e positivos.
-- - Nested table não inclui a clausuda INDEX BY
-- - O nested table é menos utilizado que o associative pela simplicidade do associative array.


SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  TYPE Numero_Table_Type IS TABLE OF INTEGER(2);
  Numero_table numero_table_type := numero_table_type();
BEGIN
  -- Armazena números de 1 a 10 em um Nested Table
  FOR i IN 1..10
  LOOP
    Numero_Table.extend;
    Numero_Table(i) := i;
  END LOOP;
  -- O programa vai fazer muitas coisas...
  -- Lê o Nested Table e imprime os números armazenados
  FOR I IN 1..10
  LOOP
    DBMS_OUTPUT.PUT_LINE('Nested Table: Indice = ' || TO_CHAR(i) || ', Valor = ' || TO_CHAR(Numero_Table(i)));
  END LOOP;
END;


