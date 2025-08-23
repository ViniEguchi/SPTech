USE venda;

-- Funções Matemáticas

-- Count
SELECT COUNT(*) FROM produto;

-- Distinct
SELECT * FROM carrinho;
SELECT DISTINCT qtd FROM carrinho;

SELECT COUNT(DISTINCT qtd) FROM carrinho;

-- Max
SELECT MAX(preco) FROM produto;

-- Min
SELECT MIN(preco) FROM produto;

-- Sum
SELECT SUM(preco) FROM produto;

-- Avg
SELECT AVG(preco) FROM produto;

-- Round
SELECT ROUND(AVG(preco), 2) FROM produto;
SELECT ROUND(AVG(preco), 1) FROM produto;

-- Truncate
SELECT TRUNCATE(AVG(preco), 3) FROM produto;

-- Limit
SELECT * FROM venda;
SELECT * FROM venda LIMIT 3;
SELECT * FROM venda ORDER BY total DESC LIMIT 3;

-- Group By
SELECT fkVenda, SUM(preco) FROM carrinho
	JOIN produto ON idProduto = fkProduto
	JOIN venda ON idVenda = fkVenda
    GROUP BY fkVenda;
    
-- Extra
SELECT 
    nome, preco
FROM
    produto
WHERE
    preco > (SELECT 
            AVG(preco)
        FROM
            produto);