use sprint_1;

-- três tipos de comando: DDL, DML, DCL

-- DDL usa Table

-- DML altera o dado

-- DCL gere permissões de acesso

Create table empresa (
id int primary key auto_increment,
nome varchar(45) not null,
tipo varchar(50),
constraint chkTipo check (tipo in ('Matriz', 'Filial', 'Franquia'))
    -- tipo = 'matriz' or tipo = 'filial' or tipo = 'franquia'
);

-- ALTER TABLE empresa ADD CONSTRAINT chkTipo
	-- CHECK (tipo in ('Matriz', 'Filial', 'Franquia'));

Describe empresa;

insert into empresa (nome) values
	('McDonalds'),
    ('Bobs');

alter table empresa add column dtCriada date;

update empresa 
	set dtCriada = '1955-01-01', tipo = 'Matriz'
	where id = 1;

select * from empresa;

Alter table empresa 
	modify column tipo varchar(50) default 'Franquia';
    
insert into empresa (nome, dtCriada) values
	('McDonalds', '1977-02-28');

select * from empresa;

alter table empresa rename column id to idEmpresa;

describe empresa;

Delete from empresa where idEmpresa = 2;

select * from empresa;

-- DROP = tudo que for relacionado a tabela/campo
-- DELETE = DADO; TUPLA
-- TRUNCATE = limpa os dados da tabela

-- NOVOS CONCEITOS
-- DECIMAIS 
/* -- FLOAT 7 caracteres 12345,67
   -- DOUBLE 15 caracteres
   -- DECIMAL 32 caracteres
*/
-- INTEIROS INT

Create table funcionario (
id int primary key auto_increment,
nome varchar(45) default 'Sem nome',
dtNasc date,
Peso float,
altura float,
salario decimal(10,2) -- 12345678,90
);

-- decimal (5,3) > 12,345

describe funcionario;

insert into funcionario values
	(default, 'Isabela', '2004-05-31', 50.300, 1.60, 1.99);

select * from funcionario;

select concat('O nome da funcionaria é ', nome, 
', a data de nascimento dela é ', dtNasc, 
', ela pesa ', peso,
', sua altura é ', altura,
' e seu salario é R$', salario)
	from funcionario;

select nome as 'nome do funcionario' from funcionario;

select concat('O nome da funcionaria é ', nome, 
', a data de nascimento dela é ', dtNasc, 
', ela pesa ', peso,
', sua altura é ', altura,
' e seu salario é R$', salario) as Frase
	from funcionario;

