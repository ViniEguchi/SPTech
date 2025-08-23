-- Aula do primeiro JOIN
CREATE DATABASE sprint2b;

USE sprint2b;

-- primeiro criar a tabela que não tem FK
CREATE TABLE empresa (
idEmpresa INT primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
) auto_increment = 100;

insert into empresa (nome) values
	('C6 Bank'),
    ('Stefanini');

select * from empresa;

CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
telefone char(12),
fkEmpresa int, -- igual ao idEmpresa da tabela empresa
constraint fkAlunoEmpresa foreign key (fkEmpresa)
	references empresa(idEmpresa)
);

INSERT INTO aluno (ra, nome, fkEmpresa) VALUES
	('01242014','Rômulo', 100),
    ('01242017','Mathias', 101),
    ('01242050','Viviane', 100);

SELECT * FROM aluno;

-- JOIN = inner join
-- Exibir o nome do aluno e sua respectiva empresa(nome);
SELECT aluno.nome, empresa.nome FROM aluno JOIN empresa
	ON idEmpresa = fkEmpresa;

SELECT a.nome AS NomeAluno, e.nome AS 'Nome Empresa' FROM aluno 
	AS a JOIN empresa AS e ON idEmpresa = fkEmpresa
    WHERE e.nome = 'C6 Bank';