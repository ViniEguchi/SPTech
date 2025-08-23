-- Ex 1
 
 
create database sprint1;

use sprint1;

create table atleta (
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40) ,
qtdMedalha int);

describe atleta;

insert into atleta values
	('1', 'Rayssa Leal', 'Skate feminino', '1');

select * from atleta;

insert into atleta values
	('2', 'Gabriel Medina', 'Surfe', '1'),
    ('3', 'Rebeca Andrade', 'Ginastica', '4'),
    ('4', 'Kelvin Hoefler', 'Skate masculino', '0');
    
select * from atleta;

insert into atleta values
	('5', 'Gabriela Mazetto', 'Skate feminino', '0'),
    ('6', 'Felipe Gustavo', 'Skate masculino', '0'),
    ('7', 'Filipe Toledo', 'Surfe', '0'),
    ('8', 'Jade Barbosa', 'Ginastica', '1');
    
select * from atleta;

select nome, qtdMedalha from atleta;

select * from atleta
	where modalidade = 'surfe';

select * from atleta order by modalidade;

select * from atleta order by qtdMedalha desc;

Select * from atleta
	Where nome like '%s%';

Select * from atleta
	where nome like 'r%';

select * from atleta
	where nome like '%o';

select * from atleta
	where nome like '% %r_';

drop table atleta;


-- Ex 2


use sprint1;

create table Musica (
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

describe musica;

Insert into musica values
	('1', 'livin on a prayer', 'Bom Jovi', 'Rock'),
    ('2', 'its my life', 'Bom Jovi', 'Rock'),
    ('3', 'HATE', 'Band Maid', 'Rock'),
    ('4', 'Influencer', 'Band Maid', 'Rock'),
    ('5', 'Through the fire and the flames', 'Dragon Force', 'Rock'),
    ('6', 'Heroes of our time', 'Dragon Force', 'Rock'),
    ('7', 'Lightbringer', 'Pentakill', 'Rock'),
    ('8', 'Mortal Reminder', 'Pentakill', 'Rock');
    
Select * from musica;

Select titulo, artista from musica;

Select * from musica
	where genero = 'certanejo';

Select * from musica
	where artista = 'Bom Jovi';
    
Select * from musica order by titulo;

Select * from musica order by artista desc;

Select * from musica
	where titulo like 'h%';
    
Select * from musica
	where artista like '%l';
    
Select * from musica
	where genero like '_o%';
    
Select * from musica
	where artista like '%i_';
    
Drop table musica;


-- Ex 3


create table Filme(
idFilme int primary key,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

insert into filme values
	('1', 'Deadpool', 'Ação', 'Tim Miller'),
    ('2', 'Toy Story', 'Animação', 'Jhon Lasseter'),
    ('3', 'A Noiva Cadaver', 'Animação', 'Tim Burton'),
    ('4', 'Batman', 'Ação', 'Tim Burton'),
    ('5', 'Gladiador', 'Ação', 'Ridley Scott'),
    ('6', 'E.T', 'Ficção Cientifica', 'Steven Spielberg'),
    ('7', 'Kung Fu Panda', 'Animação', 'Mark Osborne');

Select * from filme;

select titulo, diretor from filme;

Select * from filme
	where genero = 'ação';

select * from filme
	where diretor = 'Tim Burton';

Select * from filme order by titulo;

Select * from filme order by diretor desc;

select * from filme
	where titulo like 'b%';

select * from filme
	where diretor like '%n';

select * from filme
	where genero like '_n%';

select * from filme
	where titulo like '%d_';

drop table filme;


-- Ex 4


create table Professor(
idProfessor int primary key,
nome varchar(50),
especialidade varchar(40),
dtNasc date
);

insert into professor values
	('1', 'Sandra', 'Portugues', '1990-10-22'),
	('2', 'Lucas', 'Matematica', '1982-05-18'),
    ('3', 'Pedro', 'Portugues', '1970-01-01'),
    ('4', 'Luiza', 'Historia', '1995-06-28'),
    ('5', 'Rayssa', 'Quimica', '1999-11-08'),
    ('6', 'Guilherme', 'Quimica', '1986-04-22');

select * from professor;

select especialidade from professor;

select * from professor
	where especialidade = 'matematica';

select * from professor order by nome;

select * from professor order by dtnasc desc;

select * from professor
	where nome like 'g%';

select * from professor
	where nome like '%a';
    
select * from professor
	where nome like '_u%';
    
select * from professor
	where nome like '%r_';
    
drop table professor;


-- Ex 5


create table Curso(
idCurso int primary key,
nome varchar(50),
sigla char(3),
coordenador varchar(40)
);

insert into curso values
	('1', 'engenharia', 'ENG', 'Deus'),
    ('2', 'linguas', 'LIN', 'Devil'),
    ('3', 'programação', 'PRO', 'Louco');
    
select * from curso;

select coordenador from curso;

Select * from curso
	where sigla = 'eng';
    
select * from curso order by nome;

select * from curso order by coordenador desc;

select * from curso
	where nome like 'p%';
    
select * from curso
	where nome like '%s';
    
select * from curso
	where nome like '_n%';
    
select * from curso
	where nome like '%a_';
    
drop table curso;


-- Ex 6


