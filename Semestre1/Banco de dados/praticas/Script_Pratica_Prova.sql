-- Ex 1


create database ingles;

use ingles;

CREATE TABLE aluno (
    idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNasc DATE,
    RA CHAR(8) UNIQUE
);

insert into aluno values
	(default, 'Vinicius', '1999-12-30', '01242095'),
    (default, 'Shirley', '1999-10-20', '55447876 '),
    (default, 'Lucca', '1999-01-10', '12097351 '),
    (default, 'Lucas', '1999-03-09', '98394561 '),
    (default, 'Luiza', '1999-04-19', '30123961'),
    (default, 'Caio', '1999-09-28', '37153618'),
    (default, 'Guilherme', '1999-07-15', '18060224'),
    (default, 'Diego', '1999-05-11', '10895021'),
    (default, 'Eduardo', '1999-07-20', '69993714'),
    (default, 'João', '1999-02-02', '93209894');

SELECT 
    *
FROM
    aluno;

CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100),
    numero CHAR(5),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    estado VARCHAR(45),
    CEP CHAR(8),
    fkAluno INT UNIQUE,
    FOREIGN KEY (fkAluno)
        REFERENCES Aluno (idAluno)
)  AUTO_INCREMENT=100;

insert into endereco values
	(default, 'Rua Pescoço', '751', 'Louro', 'São Paulo', 'São Paulo', '45235849', 1),
    (default, 'Rua Acém', '620', 'Orégano', 'Berinjela', 'Rio de Janeiro', '76191362', 2),
    (default, 'Rua Paleta', '669', 'Salsinha', 'Arroz', 'Minas Gerais', '37139853', 3),
    (default, 'Rua Alcatra', '188', 'Chimichurri', 'Banana', 'São Paulo', '09935973', 4),
    (default, 'Avenida Picanha', '158', 'Pimenta', 'Cenoura', 'Minas Gerais', '05693122', 5),
    (default, 'Rua Patinho', '424', 'Cebola', 'Feijão', 'Rio de Janeiro', '42733927', 6),
    (default, 'Rua Maminha', '848', 'Alho', 'Banana', 'São Paulo', '19469912', 7),
    (default, 'Avenida Lagarto', '488', 'Paprica', 'Arroz', 'Minas Gerais', '82881843', 8),
    (default, 'Rua Cupim', '847', 'Açucar', 'Feijão', 'Rio de Janeiro', '17723224', 9),
    (default, 'Avenida Contra Filé', '317', 'Sal', 'Abobora', 'São Paulo', '10516370', 10);
    
SELECT 
    *
FROM
    endereco;

SELECT 
    *
FROM
    aluno
        JOIN
    endereco ON endereco.fkAluno = aluno.idAluno;

UPDATE endereco 
SET 
    logradouro = 'Rua Coixão Mole',
    numero = 38
WHERE
    fkAluno = 2;

SELECT 
    *
FROM
    aluno
        JOIN
    endereco ON endereco.fkAluno = aluno.idAluno
WHERE
    cidade = 'São Paulo';

DELETE FROM endereco 
WHERE
    estado = 'Rio de Janeiro';

alter table endereco add column pais varchar(50);

DELETE FROM endereco 
WHERE
    bairro LIKE '_a%';

alter table endereco rename column CEP to codigoPostal;

describe endereco;

SELECT 
    *
FROM
    aluno
        JOIN
    endereco ON endereco.fkAluno = aluno.idAluno
ORDER BY aluno.nome;

SELECT 
    a.*,
    CASE
        WHEN ISNULL(e.fkAluno) THEN 'Aluno não tem endereço'
    END AS 'situação endereço'
FROM
    aluno AS a
        LEFT JOIN
    endereco AS e ON e.fkAluno = a.idAluno;

SELECT 
    a.nome AS nomeAluno, e.logradouro AS logradouroEndereco
FROM
    aluno AS a
        JOIN
    endereco AS e ON e.fkAluno = a.idAluno;

SELECT 
    *
FROM
    aluno
WHERE
    idAluno <= 5
ORDER BY nome;

-- não estava indo com <> ou !=
SELECT 
    *
FROM
    aluno
WHERE
    nome NOT LIKE '%A%';

truncate table endereco;

truncate table aluno;


-- Ex 2


create database RockInRio;

use RockInRio;

CREATE TABLE palco (
    idPalco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    artista VARCHAR(45),
    qtd CHAR(5),
    preco CHAR(4)
);

insert into palco values
	(default, 'Estrela', 'Nirvana', '10000', '800'),
    (default, 'Céu', 'Baby Metal', '5000', '250'),
    (default, 'Inferno', 'Slipknot', '1000', '150'),
    (default, 'Noite', 'My Chemical Romance', '7500', '200'),
    (default, 'Dia', 'BTS', '90000', '500');

SELECT 
    *
FROM
    palco;

CREATE TABLE participante (
    idParticipante INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    CPF CHAR(11),
    telefone CHAR(11),
    fkResponsavel INT,
    fkPalco INT,
    FOREIGN KEY (fkPalco)
        REFERENCES palco (idPalco)
);

insert into participante values
	(default, 'Vinicius', '05955873630', '11991914946', null, '1'),
    (default, 'Lucca', '31426051217', '11984747490', null, '3'),
    (default, 'Lucas', '73694030062', '11953753283', null, '4'),
    (default, 'Diego', '40037085816', '11955927987', null, '3'),
    (default, 'Eduardo', '36123101592', '11933918464', null, '2'),
    (default, 'Guilherme', '74711123562', '11933185609', null, '3'),
    (default, 'Vermelho', '17269485867', '11918624903', null, '4'),
    (default, 'Azul', '03042596600', '11945987956', null, '5'),
    (default, 'Verde', '13673537266', '11945791785', null, '3'),
    (default, 'Branco', '09845138146', '11959351721', null, '5'),
    (default, 'Preto', '53223366057', '11929725158', null, '1'),
    (default, 'Amarelo', '29557384859', '11999475515', null, '4'),
    (default, 'Roxo', '32670142602', '11985533026', null, '5'),
    (default, 'Laranja', '92675870087', '11975184978', null, '2'),
    (default, 'Marrom', '26255650255', '11987088489', null, '5');

SELECT 
    *
FROM
    participante;
    
alter table participante add constraint 
	foreign key (fkResponsavel) references participante(idParticipante);

UPDATE participante 
SET 
    fkResponsavel = '3'
WHERE
    fkPalco = 1;

UPDATE participante 
SET 
    fkResponsavel = '3'
WHERE
    fkPalco = 2;

UPDATE participante 
SET 
    fkResponsavel = '3'
WHERE
    fkPalco = 3;
    
UPDATE participante 
SET 
    fkResponsavel = NULL
WHERE
    fkPalco = 4;

UPDATE participante 
SET 
    fkResponsavel = '7'
WHERE
    fkPalco = 5;

SELECT 
    p.nome, p.CPF, palco.nome
FROM
    participante AS p
        JOIN
    palco AS palco ON p.fkPalco = Palco.idPalco;

UPDATE palco 
SET 
    preco = '9999'
WHERE
    idPalco = 4;

alter table participante add column email varchar(255);

alter table participante rename column telefone to contato;

SELECT 
    p.nome, p.CPF, r.nome, r.CPF
FROM
    participante AS p
        LEFT JOIN
    participante AS r ON p.fkResponsavel = r.idParticipante;

SELECT 
    *
FROM
    participante
WHERE
    fkResponsavel IS NULL;

SELECT 
    p.nome AS nomeParticipante, palco.nome AS nomePalco
FROM
    participante AS p
        JOIN
    palco AS palco ON p.fkPalco = Palco.idPalco;

SELECT 
    p.nome AS nomeParticipante, r.nome AS nomeResponsavel
FROM
    participante AS p
        JOIN
    participante AS r ON p.fkResponsavel = r.idParticipante;

SELECT 
    nome, qtd
FROM
    palco
WHERE
    preco <= 150;

SELECT 
    p.nome, palco.nome
FROM
    participante AS p
        JOIN
    palco AS palco ON p.fkPalco = Palco.idPalco
WHERE
    palco.nome LIKE 'S%';

SELECT 
    palco.*, p.nome
FROM
    palco
        JOIN
    participante AS p ON palco.idPalco = p.fkPalco;

SELECT 
    palco.*, p.nome
FROM
    palco
        JOIN
    participante AS p ON palco.idPalco = p.fkPalco
ORDER BY p.nome AND palco.nome DESC;


-- Ex 3


create database pokemon;

use pokemon;

CREATE TABLE treinador (
    idTreinador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNasc DATE,
    qtdMedalha INT DEFAULT 0,
    cidade VARCHAR(45),
    fkMentor INT
);

alter table treinador add constraint chkDtNasc check (dtNasc < '2010-12-31');

insert into treinador values
	(default, 'Red', '2008-05-12', default, 'Heahea', null),
    (default, 'Blue', '2010-12-13', default, 'Dewford', null),
    (default, 'Green', '2010-10-15', default, 'Pallet', null),
    (default, 'Yellow', '2010-12-03', default, 'Lumiose', null),
    (default, 'Orange', '2008-11-06', default, 'Snowpoint', null);

SELECT 
    *
FROM
    treinador;

alter table treinador add constraint fkMentorTreinador 
	foreign key (fkMentor) 
    references treinador(idTreinador);

UPDATE treinador 
SET 
    fkMentor = 5
WHERE
    idTreinador <> 5;

CREATE TABLE pokemon (
    idPokemon INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    altura FLOAT(4 , 2 ),
    peso FLOAT(7 , 2 ),
    lendario CHAR(3),
    tipo VARCHAR(45),
    CONSTRAINT chkTipo CHECK (tipo IN ('Fogo' , 'Água',
        'Fantasma',
        'Pedra',
        'Elétrico',
        'Lutador')),
    fkTreinador INT,
    FOREIGN KEY (fkTreinador)
        REFERENCES treinador (idTreinador)
)  AUTO_INCREMENT=100;

alter table pokemon add constraint chkLendario check (lendario in('Sim', 'Não'));

insert into pokemon values
	(default, 'Falinks', '3', '62', 'Não', 'Lutador', null),
    (default, 'Zapdos', '1.6', '52.6', 'Sim', 'Elétrico', null),
    (default, 'Vaporeon', '1', '29', 'Não', 'Água', null),
    (default, 'Drifblim', '1.2', '15', 'Não', 'Fantasma', null),
    (default, 'Sudowoodo', '1.2', '38', 'Não', 'Pedra', null),
    (default, 'Centiskorch', '3', '120', 'Não', 'Fogo', null),
    (default, 'Stakataka', '5.5', '820', 'Não', 'Pedra', null),
    (default, 'Riolu', '0.7', '20.2', 'Não', 'Lutador', null),
    (default, 'Piplup', '0.4', '5.2', 'Não', 'Água', null),
    (default, 'Chandelure', '1', '34.3', 'Não', 'Fantasma', null);

SELECT 
    *
FROM
    pokemon;

UPDATE pokemon 
SET 
    fkTreinador = 2
WHERE
    tipo = 'Fantasma';
    
UPDATE pokemon 
SET 
    fkTreinador = 2
WHERE
    tipo = 'Água';

UPDATE pokemon 
SET 
    fkTreinador = 1
WHERE
    tipo = 'Pedra';

UPDATE pokemon 
SET 
    fkTreinador = 3
WHERE
    tipo = 'fogo';

UPDATE pokemon 
SET 
    fkTreinador = 4
WHERE
    tipo = 'Elétrico';

SELECT 
    t.nome, p.nome, p.tipo
FROM
    pokemon AS p
        JOIN
    treinador AS t ON p.fkTreinador = t.idTreinador;

SELECT 
    t.nome,
    p.nome AS Pokemon,
    p.peso,
    IFNULL(p.peso, 'Muito leve')
FROM
    treinador AS t
        JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador;

SELECT 
    t.nome AS 'Nome Treinador',
    p.nome AS 'Nome Pokemon',
    CASE
        WHEN p.tipo = 'Fantasma' THEN 'Fantasma'
        WHEN p.tipo = 'Fogo' THEN 'Água'
        WHEN p.tipo = 'Água' THEN 'Elétrico'
    END AS 'Fraqueza'
FROM
    treinador AS t
        JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador
WHERE
    p.tipo = 'Fantasma' OR p.tipo = 'Fogo'
        OR p.tipo = 'Água';

SELECT 
    m.nome AS 'Nome Mentor',
    t.nome AS 'Nome Treinador',
    p.nome AS 'Nome Pokemon'
FROM
    treinador AS t
        JOIN
    treinador AS m ON t.fkMentor = m.idTreinador
        JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador
WHERE
    t.dtNasc < '2005-12-31';

SELECT 
    m.nome AS 'Nome Mentor',
    t.nome AS 'Nome Treinador',
    p.nome AS 'Nome Pokemon'
FROM
    treinador AS t
        JOIN
    treinador AS m ON t.fkMentor = m.idTreinador
        RIGHT JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador;

SELECT 
    m.nome AS 'Nome Mentor',
    t.nome AS 'Nome Treinador',
    p.nome AS 'Nome Pokemon'
FROM
    treinador AS t
        JOIN
    treinador AS m ON t.fkMentor = m.idTreinador
        RIGHT JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador
WHERE
    p.nome LIKE '%e%';

SELECT 
    CONCAT('O treinador: ',
            t.nome,
            ' do Mentor: ',
            m.nome,
            ' possui o Pokemon: ',
            p.nome,
            ' do tipo: ',
            tipo) AS 'descrição'
FROM
    treinador AS t
        JOIN
    treinador AS m ON t.fkMentor = m.idTreinador
        JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador
WHERE
    p.tipo = 'Água';

alter table treinador drop constraint chkDtNasc;

SELECT 
    t.nome, p.nome
FROM
    treinador AS t
        RIGHT JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador
WHERE
    p.tipo = 'Água' OR p.tipo = 'Fogo';

SELECT 
    m.nome, t.nome
FROM
    treinador AS t
        JOIN
    treinador AS m ON t.fkMentor = m.idTreinador
        JOIN
    pokemon AS p ON t.idTreinador = p.fkTreinador
WHERE
    p.altura > 1;

UPDATE pokemon 
SET 
    fkTreinador = 2
WHERE
    tipo = 'Lutador';

drop database pokemon;


-- Ex 4


create database locadora;

use locadora;

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone CHAR(11),
    email VARCHAR(100)
);

insert into cliente values
	(default, 'Vinicius', '11980711697', 'vinicius@gmail.com'),
    (default, 'Lucca', '11938988326', 'lucca@gmail.com'),
    (default, 'Shirley', '11987983834', 'shirley@gmail.com'),
    (default, 'Guilherme', '11908856050', 'guilherme@gmail.com'),
    (default, 'Lucas', '11953084610', 'lucas@gmail.com');

SELECT 
    *
FROM
    cliente;

CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(45),
    complemento VARCHAR(45),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    UF CHAR(2) DEFAULT 'SP',
    fkCliente INT,
    FOREIGN KEY (fkCliente)
        REFERENCES cliente (idCliente)
);

insert into endereco values
	(default, 'Azul', '45', 'Cores', 'São Paulo', default, 1),
    (default, 'Vermelho', '300', 'Cores', 'São Paulo', default, 2),
    (default, 'Amarelo', '1200', 'Cores', 'São Paulo', default, 3),
    (default, 'Verde', '357', 'Aquarela', 'São Paulo', default, 4),
    (default, 'Laranja', '468', 'Aquarela', 'São Paulo', default, 5);

SELECT 
    *
FROM
    endereco;

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    ano CHAR(4),
    tipo VARCHAR(45),
    CHECK (tipo IN ('jogo' , 'filme')),
    genero VARCHAR(45),
    plataforma VARCHAR(45),
    preco CHAR(3),
    condicao VARCHAR(45)
);

insert into produto values
	(default, 'Victor ou Vitória?', '1982', 'filme', 'Comedia', 'TV', '30', 'Original'),
    (default, 'Call of Duty: Black Ops II', '2012', 'jogo', 'Ação', 'Console', '45', 'Original'),
    (default, 'Missão Impossivel 2', '2000', 'filme', 'Ação', 'TV', '30', 'Original'),
    (default, 'The Legend of Zelda', '2017', 'jogo', 'Aventura', 'Console', '60', 'Premium'),
    (default, 'Horizon Zero Dawn', '2017', 'jogo', 'RPG', 'Console', '60', 'Premium'),
    (default, 'FFXIV', '2016', 'jogo', 'RPG', 'Console', '45', 'Original');

SELECT 
    *
FROM
    produto;

CREATE TABLE aluguel (
    idAluguel INT PRIMARY KEY AUTO_INCREMENT,
    fkCliente INT,
    fkProduto INT UNIQUE,
    dtRetirada DATE,
    dtDevolucao DATE
);

insert into aluguel values
	(default, 2, 5, '2024-10-20', '2024-10-27'),
    (default, 1, 6, '2024-10-15', '2024-10-22'),
    (default, 4, 1, '2024-10-19', '2024-10-26');

SELECT 
    *
FROM
    aluguel;

SELECT 
    c.nome, p.titulo, a.dtRetirada, a.dtDevolucao
FROM
    cliente AS c
		left JOIN
    aluguel AS a ON a.fkCliente = c.idCliente
		left JOIN
    produto AS p ON p.idProduto = a.fkProduto;

UPDATE aluguel 
SET 
    dtDevolucao = NULL
WHERE
    fkcliente = 4;

SELECT 
    c.nome, p.titulo
FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        JOIN
    produto AS p ON a.fkProduto = p.idProduto
WHERE
    p.preco > 15;

SELECT 
    c.nome
FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
WHERE
    dtDevolucao IS NULL;

SELECT 
    c.nome,
    p.titulo,
    CASE
        WHEN ISNULL(dtDevolucao) THEN 'Em Aberto'
        ELSE 'Concluido'
    END AS 'Situação'
FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        JOIN
    produto AS p ON a.fkProduto = p.idProduto;

select c.nome,
	p.titulo
    FROM
    cliente AS c
        left JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        left JOIN
    produto AS p ON a.fkProduto = p.idProduto;

SELECT 
    c.nome, p.titulo, p.plataforma
FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        JOIN
    produto AS p ON a.fkProduto = p.idProduto
WHERE
    p.genero = 'esporte';

alter table produto rename column condicao to condicaoProduto;

alter table produto rename column condicaoProduto to condicao;

select c.nome,
	p.titulo
    FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        JOIN
    produto AS p ON a.fkProduto = p.idProduto
    where p.titulo like 'm%' or c.nome like 'm%';

select c.nome,
	p.titulo
    FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        JOIN
    produto AS p ON a.fkProduto = p.idProduto
    where a.idAluguel <= 3;

select c.nome,
	p.titulo
    FROM
    cliente AS c
        JOIN
    aluguel AS a ON c.idCliente = a.fkCliente
        right JOIN
    produto AS p ON a.fkProduto = p.idProduto;

drop database locadora;


-- Ex 5


create database hogwarts;

use hogwarts;

CREATE TABLE casa (
    idCasa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fundador VARCHAR(50),
    responsavel VARCHAR(50)
);

insert into casa values
	(default, 'Grifinória', 'Godric Gryffindor', 'Vivian'),
    (default, 'Sonserina', 'Salazar Slytherin', 'JP'),
    (default, 'Corvinal', 'Rowena Ravenclaw', 'Marise'),
    (default, 'Lufa-Lufa', 'Helga Hufflepuff', 'Matheus');

SELECT 
    *
FROM
    casa;

CREATE TABLE aluno (
    RA CHAR(5) PRIMARY KEY,
    nome VARCHAR(45),
    quadribol CHAR(3),
    dtInicio DATE,
    dtFim DATE,
    pet VARCHAR(45),
    patrono VARCHAR(45),
    fkCasa INT,
    FOREIGN KEY (fkCasa)
        REFERENCES casa (idCasa)
);

alter table aluno add constraint chkQuadribol
	check(quadribol in('sim', 'não'));

insert into aluno values
	(96728, 'Shirley', 'sim', '2024-06-01', '2026-12-30', null, 'gato', 2),
    (14878, 'Vitor', 'não', '2023-01-01', '2026-12-30', 'kita', 'raposa', 4),
    (24113, 'Vinicius', 'não', '2024-01-01', '2027-06-29', null, null, 3),
    (69252, 'Cainã', 'sim', '2022-01-01', '2026-12-30', 'branca', 'dragão', 1),
    (89287, 'Isabela', 'sim', '2022-01-01', '2026-12-30', null, 'coruja', 1),
    (56732, 'Paloma', 'sim', '2023-07-01', '2028-12-30', null, null, 4),
    (22875, 'Lucca', 'não', '2020-01-01', '2030-12-30', 'mingau', 'cavalo marinho', 2),
    (18122, 'Eduardo', 'não', '2024-01-01', '2027-06-30', null, 'urso', 2),
    (72330, 'Cynthia', 'sim', '2023-01-01', '2027-12-30', 'michael', null, 3),
    (20754, 'Isabela', 'sim', '2022-01-01', '2026-12-30', null, 'texugo', 4),
    (81069, 'Moises', 'não', '2020-01-01', '2024-12-30', null, null, 1),
    (21178, 'Guilherme', 'sim', '2021-01-01', '2025-12-30', null, 'cobra', 3);

alter table aluno add column fkMonitor char(5);

UPDATE aluno 
SET 
    fkMonitor = 96728
WHERE
    fkCasa = 2;
    
UPDATE aluno 
SET 
    fkMonitor = 81069
WHERE
    fkCasa = 1;
    
UPDATE aluno 
SET 
    fkMonitor = 72330
WHERE
    fkCasa = 3;
    
UPDATE aluno 
SET 
    fkMonitor = 20754
WHERE
    fkCasa = 4;

SELECT 
    *
FROM
    aluno;

SELECT 
    nome AS 'nomeAluno',
    dtInicio AS 'Data Inicio',
    patrono AS patrono
FROM
    aluno
WHERE
    fkCasa = 4;

SELECT 
    a.nome AS 'Nome Aluno', a.pet AS Pet, c.nome AS Casa
FROM
    aluno AS a
        JOIN
    casa AS c ON a.fkCasa = c.idCasa;

SELECT 
    m.nome AS 'Monitor responsável',
    a.nome AS 'nome aluno',
    c.nome AS 'Casa'
FROM
    aluno AS a
        LEFT JOIN
    aluno AS m ON a.fkMonitor = m.RA
        JOIN
    casa AS c ON a.fkCasa = c.idCasa;

SELECT 
    nome AS 'Nome Aluno',
    quadribol AS 'Faz parte do Time?',
    IFNULL(fkCasa, 'Aluno não Alocado') AS 'Casa',
    IFNULL(pet, 'Nunhum pet') AS 'Pet',
    IFNULL(patrono, 'Sem memórias felizes') AS 'Patrono'
FROM
    aluno;

SELECT 
    a.nome AS 'Nome Aluno',
    a.dtInicio AS 'Data de Inicio',
    a.dtFim AS 'Data de Término',
    c.nome AS 'Nome da Casa',
    c.fundador AS 'Fundador da Casa',
    c.responsavel AS 'Professor Responsavel'
FROM
    aluno AS a
        JOIN
    casa AS c ON a.fkCasa = c.idCasa;

SELECT 
    *,
    IFNULL(fkMonitor, 'Tem caroço nesse angu') AS 'RA Monitor'
FROM
    aluno;

SELECT 
    a.nome AS 'Nome do Aluno',
    m.nome AS 'Nome do Monitor',
    IFNULL(a.fkMonitor,
            'aluno não iniciou o curso e Hogwarts') AS 'RA monitor'
FROM
    aluno AS a
        JOIN
    aluno AS m ON m.RA = a.fkMonitor;

drop database hogwarts;