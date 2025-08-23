create database estoque;

use estoque;


-- Ex 4


create table MisterioSA (
	id int primary key auto_increment,
    nome varchar(50),
    data_da_compra date,
    preço float,
    peso float,
    data_de_retirada date );

describe MisterioSA;

insert into MisterioSA (nome, data_da_compra, preço, peso) values
	('Biscoitos Scooby', '2024-01-20', 100.00, 1000),
    ('Pão de Forma', '2024-06-20', 6.00, 500),
    ('Morango', '2024-06-20', 15.00, 500),
    ('Leite', '2024-06-20', 90.00, 18000),
    ('Presunto', '2024-06-20', 10, 200);

select * from MisterioSA;

select nome, data_da_compra, data_de_retirada, id from MisterioSA order by data_da_compra;

update MisterioSA set data_de_retirada = '2024-05-23'
	where id = 1;
    
alter table MisterioSA rename column id to idComida;

Truncate table MisterioSA;

Alter table MisterioSA add constraint chkNome
	Check (nome in('Biscoitos Scooby', 'Cachorro-quente'));

insert into MisterioSA (nome, data_da_compra, preço, peso) values
	('Biscoitos Scooby', '2024-06-19', 100.00, 1000),
    ('Cachorro-quente', '2024-06-20', 6.00, 500),
    ('Cachorro-quente', '2024-06-21', 15.00, 500),
    ('Cachorro-quente', '2024-06-22', 90.00, 18000),
    ('Biscoitos Scooby', '2024-06-23', 10, 200);
    
select * from MisterioSA;

select data_da_compra as 'data da compra', data_de_retirada as 'data de retirada', nome, idComida, preço, peso 
	from MisterioSA where nome = 'Biscoitos Scooby';

select * from MisterioSA
	where data_da_compra < '2024-07-25';

select * from MisterioSA
	where preço >= 30.50;

truncate MisterioSA;


-- Ex 1


create database game_store;

use game_store;

create table jogo (
	id int primary key auto_increment,
    nome varchar(30),
    diretor varchar(30),
    genero varchar(30),
    lançamento date,
    nota int,
    qtd int);

alter table jogo add constraint chkNota
	Check (nota in(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));

insert into jogo values
	(default, 'Super Mario Bros', 'Tom', 'aventura', '1990-02-20', 7, 20);
    
insert into jogo values
	(default, 'Mario Kart', 'Tom', 'corrida', '1998-01-01', 9, 20),
    (default, 'Mario Party', 'Tom', 'familia', '1999-07-25', 5, 15),
    (default, 'Mario Tennis', 'Karen', 'sport', '2003-11-09', 1, 1),
    (default, 'Mario Golf', 'Lucas', 'sport', '2005-02-26', 3, 2);

alter table jogo add column midia varchar(30);

alter table jogo add constraint chkMidia
	Check (midia in('digital', 'fisica'));

update jogo set midia = 'digital'
	where id = 1;

update jogo set midia = 'fisica'
	where id = 2;
    
update jogo set midia = 'digital'
	where id = 3;

update jogo set midia = 'digital'
	where id = 4;
    
update jogo set midia = 'fisica'
	where id = 5;
    
select * from jogo;

select * from jogo
	where lançamento > '2014-12-31';

select * from jogo
	where nome like '%a%' and midia = 'fisica';

select * from jogo
	where diretor != '%e%';

alter table jogo drop constraint chkNota;

alter table jogo add constraint chkNota
	Check (nota in(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10));

select * from jogo
	where genero = 'corrida' and qtd > 0;

-- não tem jogos com sem estoque
delete from jogo
	where qtd = 0;

alter table jogo rename column diretor to criador;

describe jogo;


-- Ex 2


create database olimpiadas;

use olimpiadas;

create table esporte (
	id int primary key auto_increment,
    nome varchar(40),
    categoria varchar(20),
    Njogadores int,
    estreia date,
    PaisOrigem varchar(30),
    constraint chkCategoria 
		check (categoria in('Individual', 'Coletivo'))
    );

insert into esporte values
	(default, 'Skate', 'Individual', 1, '2000-01-01', 'Brasil'),
    (default, 'Natação', 'Coletivo', 4, '1950-01-01', 'USA'),
    (default, 'Ciclismo', 'Individual', 1, '1998-01-01', 'Italia'),
    (default, 'Futebol', 'Coletivo', 11, '1800-01-01', 'Inglaterra'),
    (default, 'Tennis', 'Individual', 1, '1950-01-01', 'França');

alter table esporte add column popularidade float;

describe esporte;

Update esporte set popularidade = 10
	where id = 6;

Update esporte set popularidade = 2.4
	where id = 7;

Update esporte set popularidade = 7.8
	where id = 8;

Update esporte set popularidade = 1.9
	where id = 9;

Update esporte set popularidade = 5.5
	where id = 10;

select * from esporte 
	order by popularidade;

select * from esporte
	where estreia > '1999-12-31';

update esporte set estreia = '1900-01-01'
	where id = 9;

alter table esporte add constraint chkEstreia
	Check (estreia >('1895-01-01'));

alter table esporte drop constraint chkCategoria;

select * from esporte
	where PaisOrigem like '_a%';

select * from esporte
	where Njogadores >= 4 and Njogadores <= 11;

delete from esporte
	where id = 1;

delete from esporte
	where id = 3;

delete from esporte
	where id = 5;


-- Ex 3


create database desenho;

use desenho;

create table catalogo (
	id int primary key auto_increment,
    Titulo varchar(50),
    DataLançamento date,
    EmissoraOriginal varchar(50),
    Classificação varchar(10),
    Sta varchar(15),
    Nota int) auto_increment = 10;

alter table catalogo add constraint chkNota
	Check (nota in(nota >= 1 and nota <= 5));

alter table catalogo drop constraint chkNota;

alter table catalogo add constraint chkNota
	Check (nota in(1, 2, 3, 4, 5));

insert into catalogo values
	(default, 'Morte do Cão', '2024-01-01', 'Depressão', '18 anos', 'encerrado', 1),
    (default, 'Morte do Gato', '2024-02-01', 'Depressão', '18 anos', 'encerrado', 1),
    (default, 'A Vida é Bela', '2000-05-20', 'Felicidade', '10 anos', 'encerrado', 4),
    (default, 'Kung Fu Panda', '2004-10-16', 'Dream Works', '10 anos', 'encerrado', 5),
    (default, 'Gaia', '2024-08-20', 'Aleatorio', '10 anos', 'em cartas', 3);

select * from catalogo;

select * from catalogo
	where Classificação >= '14 anos';

select * from catalogo
	where EmissoraOriginal = 'Depressão';

Update catalogo Set Sta = 'cancelado'
	where id = 10;

Update catalogo Set Sta = 'cancelado'
	where id = 11;

Update catalogo Set Sta = 'finalizado'
	where id = 12;

Update catalogo Set Sta = 'finalizado'
	where id = 13;

Update catalogo Set Sta = 'exibindo'
	where id = 14;

alter table catalogo add constraint chkStatus
	check (Sta in('exibindo', 'finalizado', 'cancelado'));

insert into catalogo values
	(default, 'Devertida Mente', '2015-08-09', 'Disney', '0 anos', 'finalizado', 1);

insert into catalogo values
	(default, 'Um novo filme', '2024-07-29', 'Coelho', '0 anos', 'exibindo', 4);

select * from catalogo;

update catalogo set Sta = 'finalizado'
	where id = 14;

update catalogo set Sta = 'finalizado'
	where id = 16;

delete from catalogo
	where id = 12;

select * from catalogo
	where Titulo like 'm%';

alter table catalogo rename column Classificação to ClassificaçãoIndicativa;

update catalogo
	set nota = 2, DataLançamento = '2024-03-20'
	where id = 11;

truncate catalogo;

alter table catalogo drop constraint chkStatus;


-- Ex 5


create database Vingadores;

use Vingadores;

create table heroi (
	id int auto_increment primary key,
    nome varchar(45),
    versao varchar(45),
    habilidade varchar(45),
    altura int) auto_increment = 1;

insert into heroi values
	(default, 'Hulk', 'Hulk Vermelho', 'Super força', 210),
    (default, 'Doutor Estranho', 'Olho de Agamoto', 'Magia', 180),
    (default, 'Mercurio', 'Ainda vivo', 'Super velocidade', 175),
    (default, 'Wanda', 'Feiticeira Escarlate', 'Magia', 160),
    (default, 'Ganbit', 'Spoiler', 'Magia', 184);

alter table heroi add column regeneração varchar(5);

describe heroi;

alter table heroi add constraint chkRegeneração
	check (regeneração in('TRUE', 'FALSE'));

alter table heroi modify column versao varchar(100);

update heroi set regeneração = 'TRUE'
	where id = 1;

update heroi set regeneração = 'FALSE'
	where id = 2;

update heroi set regeneração = 'FALSE'
	where id = 3;

update heroi set regeneração = 'False'
	where id = 4;

update heroi set regeneração = 'FALSE'
	where id = 5;

delete from heroi
	where id = 3;

insert into heroi values
	(default, 'Deadpool', 'Vivo', 'Imortalidade', 189, 'TRUE');

select * from heroi
	where nome like 'C%' or nome like 'H%';

select * from heroi
	where nome != '%A%';

select * from heroi
	where altura >= 190;

select * from heroi
	where altura >= 180 order by nome desc;

truncate heroi;