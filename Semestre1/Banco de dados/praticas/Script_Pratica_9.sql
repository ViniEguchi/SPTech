drop database PI;

create database PI;

use PI;

CREATE TABLE grupo (
    idGrupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descProjeto VARCHAR(250)
);

insert into grupo values
	(default, 'CBsafe', 'Controle de umidade do solo em compost barn'),
    (default, 'ONDO', 'Controle de temperatura em estufas de wasabi');

SELECT * FROM grupo;

CREATE TABLE aluno (
    RA CHAR(8) PRIMARY KEY,
    fkGrupoAluno INT,
    nome VARCHAR(45),
    email VARCHAR(45),
    CONSTRAINT fkGrupoAluno FOREIGN KEY (fkGrupoAluno)
        REFERENCES grupo (idGrupo)
);

insert into aluno values
	(01242530, 2, 'Vinius', 'vinius@sptech.school'),
    (01242080, 1, 'Lucca', 'lucca@sptech.school'),
    (01242464, 2, 'Guilherme', 'guilherme@sptech.school'),
    (01242782, 1, 'Diego', 'diego@sptech.school'),
    (01242265, 1, 'Eduardo', 'eduardo@sptech.school'),
    (01242007, 2, 'Lucas', 'lucas@sptech.school');

SELECT * FROM aluno;

CREATE TABLE professor (
    idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    disciplina VARCHAR(45)
)  AUTO_INCREMENT=10000;

insert into professor values
	(default, 'JP', 'Algoritmos'),
    (default, 'Frizza', 'Pesquisa e Inovação'),
    (default, 'Vivian', 'Banco de Dados');

SELECT * FROM professor;

CREATE TABLE avaliacao (
    idAvaliacao INT AUTO_INCREMENT,
    fkGrupo INT,
    fkProfessor INT,
    primary key (idAvaliacao, fkGrupo, fkProfessor),
    dtInicio DATETIME,
    nota FLOAT(4 , 2 ),
    CONSTRAINT fkAvaliacaoGrupo FOREIGN KEY (fkGrupo)
        REFERENCES grupo (idGrupo),
    CONSTRAINT fkAvaliacaoProfessor FOREIGN KEY (fkProfessor)
        REFERENCES professor (idProfessor)
)  AUTO_INCREMENT=100000;

insert into avaliacao values
	(default, 1, 10000, '2024-11-04 11:00:00', 8.55),
    (default, 1, 10001, '2024-11-04 11:00:00', 7.5),
    (default, 2, 10000, '2024-11-04 12:00:00', 8.46),
    (default, 2, 10002, '2024-11-04 12:00:00', 9.00);

SELECT * FROM avaliacao;

-- 5

SELECT 
    g.nome AS 'Nome do Grupo', a.nome AS 'Nome do Aluno'
FROM
    grupo AS g
        JOIN
    aluno AS a ON idGrupo = fkGrupoAluno;

-- 6

SELECT 
    g.nome AS 'Nome do Grupo',
    descProjeto AS 'Tema do Projeto',
    RA AS RA,
    a.nome AS 'NOme do Aluno'
FROM
    grupo AS g
        JOIN
    aluno AS a ON idGrupo = fkGrupoAluno
WHERE
    idGrupo = 1;

-- 7

SELECT 
    AVG(nota)
FROM
    avaliacao;

-- 8

SELECT 
    MAX(nota) AS 'Maior nota', MIN(nota) AS 'Menor nota'
FROM
    avaliacao;
    
-- 9

SELECT 
    SUM(nota)
FROM
    avaliacao;

-- 10

SELECT 
    p.nome AS 'Nome do Professor',
    disciplina AS 'Disciplina Aplicada',
    g.nome AS 'Nome do Grupo',
    dtInicio AS 'Data e Hora da Avaliação',
    nota AS 'Nota da Apresentação'
FROM
    professor AS p
        JOIN
    avaliacao ON idProfessor = fkProfessor
        JOIN
    grupo AS g ON idGrupo = fkGrupo;

-- 11

SELECT 
    p.nome AS 'Nome do Professor',
    disciplina AS 'Disciplina Aplicada',
    g.nome AS 'Nome do Grupo',
    dtInicio AS 'Data e Hora da Avaliação',
    nota AS 'Nota da Apresentação'
FROM
    professor AS p
        JOIN
    avaliacao ON idProfessor = fkProfessor
        JOIN
    grupo AS g ON idGrupo = fkGrupo
WHERE
    idGrupo = 1;

-- 12

SELECT 
    p.nome AS 'Professor Avaliador', g.nome AS 'Grupo Avaliado'
FROM
    professor AS p
        JOIN
    avaliacao ON idProfessor = fkProfessor
        JOIN
    grupo AS g ON idGrupo = fkGrupo
WHERE
    p.nome = 'JP';

-- 13

SELECT 
    grupo.nome AS 'Nome do Grupo',
    aluno.nome AS 'Nome do Aluno',
    professor.nome AS 'Nome do Professor',
    disciplina AS 'Disciplina Aplicada',
    dtInicio AS 'Data e Hora da Avaliação'
FROM
    aluno
        JOIN
    grupo ON idGrupo = aluno.fkGrupoAluno
        JOIN
    avaliacao ON avaliacao.fkGrupo = idGrupo
        JOIN
    professor ON idProfessor = fkProfessor;

-- 14

SELECT DISTINCT
    nota
FROM
    avaliacao;

-- 15

SELECT 
    nome,
    SUM(nota) AS 'Soma das notas',
    AVG(nota) AS 'Média das notas'
FROM
    professor
        JOIN
    avaliacao ON idProfessor = fkProfessor
GROUP BY nome;

-- 16

SELECT 
    nome,
    SUM(nota) AS 'Soma das notas',
    AVG(nota) AS 'Média das notas'
FROM
    grupo
        JOIN
    avaliacao ON idGrupo = fkGrupo
GROUP BY nome;

-- 17

SELECT 
    nome, MAX(nota), MIN(nota)
FROM
    professor
        JOIN
    avaliacao ON idProfessor = fkProfessor
GROUP BY nome;

-- 18

SELECT 
    nome, MAX(nota), MIN(nota)
FROM
    grupo
        JOIN
    avaliacao ON idGrupo = fkGrupo
GROUP BY nome;