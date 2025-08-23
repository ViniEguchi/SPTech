create database venda;

use venda;

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    rua VARCHAR(45),
    numero CHAR(5)
);

insert into cliente values
	(default, 'Vinicius', 'vinicius@gmail.com', 'Cebola', '262'),
	(default, 'Lucca', 'lucca@gmail.com', 'Alho', '444'),
	(default, 'Edu', 'edu@gmail.com', 'Batata', '30');

SELECT * FROM cliente;

alter table cliente add column fkIndicador int;

alter table cliente add constraint fkClienteIndicador
	foreign key (fkIndicador) references cliente(idCliente);

UPDATE cliente SET fkIndicador = 1
	WHERE idCliente != 1;

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(45),
    preco FLOAT
)  AUTO_INCREMENT=100;

insert into produto values
	(default, 'Cabelos brilhantes', 'Shampoo', '70'),
	(default, 'Anti CC', 'Perfume', '100');
    
SELECT * FROM produto;

CREATE TABLE venda (
    idVenda INT AUTO_INCREMENT,
    fkCliente INT,
    CONSTRAINT pkConposta PRIMARY KEY (idVenda , fkCliente),
    total FLOAT,
    dtVenda DATE,
    CONSTRAINT fkVendaCliente FOREIGN KEY (fkCliente)
        REFERENCES cliente (idCliente)
)  AUTO_INCREMENT=1000;

insert into venda values
	(default, 1, 1000, '2024-10-27'),
	(default, 2, 700, '2024-10-27'),
	(default, 3, 140, '2024-10-27'),
	(default, 1, 800, '2024-10-27'),
	(default, 3, 1200, '2024-10-27');

SELECT * FROM venda;

CREATE TABLE carrinho (
    fkVenda INT,
    fkProduto INT,
    PRIMARY KEY (fkVenda , fkProduto),
    qtd CHAR(3),
    desconto FLOAT,
    CONSTRAINT fkCarrinhoVenda FOREIGN KEY (fkVenda)
        REFERENCES venda (idVenda),
    CONSTRAINT fkCarrinhoProduto FOREIGN KEY (fkProduto)
        REFERENCES produto (idProduto)
)  AUTO_INCREMENT=10000;

insert into carrinho values
	(1000, 101, 10, 0),
	(1001, 100, 10, 0),
	(1002, 100, 2, 0),
	(1003, 101, 9, 100),
	(1004, 101, 13, 100);

SELECT * FROM carrinho;

SELECT 
    c.nome, v.total, v.dtVenda
FROM
    cliente AS c
        JOIN
    venda AS v ON c.idcliente = v.fkCliente;

SELECT 
    nome, email, total, dtVenda
FROM
    cliente
        JOIN
    venda ON idCliente = fkCliente
WHERE
    nome = 'Edu';

SELECT 
    c.nome AS 'nome do indicado',
    i.nome AS 'nome de quem indicou'
FROM
    cliente AS c
        JOIN
    cliente AS i ON c.fkIndicador = i.idCliente;

SELECT 
    i.nome AS 'cliente indicador',
    i.email AS 'email do indicador',
    c.nome AS 'cliente indicado',
    c.email AS 'email do indicado'
FROM
    cliente AS c
        JOIN
    cliente AS i ON i.idCliente = c.fkIndicador;

SELECT 
    i.nome AS 'cliente indicador',
    c.nome AS 'cliente indicado',
    v.total AS 'valor total da venda',
    v.dtVenda AS 'Data da venda',
    p.nome AS 'Nome do produto',
    p.preco AS 'Preço do produto',
    car.qtd AS 'Quantidade vendida',
    car.desconto AS 'Desconto aplicado'
FROM
    cliente AS c
        JOIN
    cliente AS i ON c.fkIndicador = i.idCliente
        JOIN
    venda AS v ON v.fkCliente = c.idCliente
        JOIN
    carrinho AS car ON v.idVenda = car.fkVenda
        JOIN
    produto AS p ON p.idProduto = car.fkProduto;

SELECT 
    v.dtVenda, p.nome, c.qtd
FROM
    venda AS v
        JOIN
    carrinho AS c ON v.idVenda = c.fkVenda
        JOIN
    produto AS p ON p.idProduto = c.fkProduto;

SELECT 
    SUM(qtd), nome, preco
FROM
    produto
        JOIN
    carrinho ON idProduto = fkProduto
GROUP BY nome , preco;

insert into cliente values
	(default, 'Shirley', 'Shirley@gmail.com', 'Paulista', '1000', null);

SELECT 
    c.*, v.*
FROM
    cliente AS c
        LEFT JOIN
    venda AS v ON c.idCliente = v.fkCliente;

SELECT 
    MAX(preco) AS 'Maior preço', MIN(preco) AS 'Menor preço'
FROM
    produto;

SELECT 
    SUM(preco), AVG(preco)
FROM
    produto;

SELECT 
    COUNT(preco)
FROM
    produto
WHERE
    preco > (SELECT 
            AVG(preco)
        FROM
            produto);
    
SELECT 
    SUM(DISTINCT preco)
FROM
    produto;

SELECT fkVenda, SUM(preco) FROM carrinho
	JOIN produto ON idProduto = fkProduto
	JOIN venda ON idVenda = fkVenda
    GROUP BY fkVenda;