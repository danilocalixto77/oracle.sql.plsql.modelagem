--
-- Seção 11 
-- Exibindo dados a partir de MÃºltiplas Tabelas
--
-- Aula 5 - Produto Cartesiano
--
-- Videos 23

-- Gerando um Produto Cartesiano utilizando Cross Join
-- Este join faz a consulta e retorna cada registro da tabela 1 com todos os 
-- fazendo relação com todos os registros da tabela 2
SELECT last_name, department_name
FROM   employees
  CROSS JOIN departments;

