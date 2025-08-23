use sprint2b;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
fkLogin int
) auto_increment = 100;

insert into usuario values
	(default, 'Alegria', null, null);

select * from usuario;

alter table usuario modify column fkLogin int unique;

describe usuario;

create table login (
idLogin int primary key auto_increment,
username varchar(45),
senha varchar(45),
dtUltimoAcesso datetime default current_timestamp
);

-- DATETIME 'YYYY-MM-DD HH:MM:SS'

insert into login values
	(default, 'alegria2024', md5('1234'), default);

select * from login;

alter table usuario add constraint fkUsuarioLogin
	foreign key (fkLogin) references login(idLogin);

update usuario set fkLogin = 1
	where idUsuario = 100;

select * from usuario;

insert into login values
	(default, 'nova_alegria', md5('1234'), default);

select * from login;

update login set username = 'Nojinho',
	senha = md5('1234'), dtUltimoAcesso = default
	where idLogin = 2;

insert into usuario values
	(default, 'Nojinho', null, 2);

select * from usuario;

select * from usuario join login
	on idLogin = fkLogin;

select u.nome as NomeUsuario,
	ifnull(u.email, 'Sem email') as EmailUsuario,
    l.username as 'Apelido User',
    l.senha as Criptografada
    from usuario as u join login as l
    on idLogin = fkLogin;
    
SELECT nome,
	CASE
	WHEN nome = 'Alegria' THEN 'Muita Alegria'
    ELSE 'Nenhuma Alegria'
    END as TipoAlegria
    FROM usuario;