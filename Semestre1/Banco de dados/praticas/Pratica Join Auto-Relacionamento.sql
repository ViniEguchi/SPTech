use sprint2b;

-- Ex 3


create table aluno (
idAluno int primary key auto_increment,
nome varchar(45),
fkMonitor int);

describe aluno;

insert into aluno (idAluno, nome) values
	(default, 'Lucca'),
    (default, 'Vinicius'),
    (default, 'Shirley'),
    (default, 'Eduardo'),
    (default, 'Isabela');

 select * from aluno;

update aluno set fkMonitor = 5
	where idAluno = 1;

update aluno set fkMonitor = 5
	where idAluno = 2;

update aluno set fkMonitor = 5
	where idAluno = 3;
    
update aluno set fkMonitor = 5
	where idAluno = 4;

alter table aluno add constraint fkAlunoMonitor
	foreign key (fkMonitor)
	references aluno(idAluno);

select * from aluno;

select a.idAluno as 'idAluno',
	a.nome as 'Nome Aluno',
	m.idAluno as 'idMonitor',
    m.nome as 'Nome Monitor'
    from aluno as a
    join aluno as m
    on a.fkMonitor = m.idAluno;

select a.idAluno as 'id',
	a.nome as 'nome',
	case
    when a.nome = 'Isabela' then 'Monitor'
    else 'Aluno'
    End as 'Situação'
    from aluno as a;

select idAluno, nome,
	ifnull(fkMonitor, '0') as 'idMonitor'
    from aluno;


-- Ex 1


create table habilitacao (
idHabilitacao int primary key auto_increment,
tipo varchar(3),
veiculo varchar(45)
);

describe habilitacao;

insert into habilitacao values
	(default, 'A', 'motocicleta'),
    (default, 'B', 'automovel'),
    (default, 'ACC', 'ciclomotor');

select * from habilitacao;

create table pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
CNH char(11),
fkHabilitacao int
);

alter table pessoa add constraint fkPessoaHabilitacao
	foreign key (fkHabilitacao)
    references Habilitacao(idHabilitacao);

describe pessoa;

insert into pessoa values
	(default, 'Vinicius', 04240232577, 2),
    (default, 'Lucca', 91473514652, 1),
    (default, 'Shirley', 00024736608, 3),
    (default, 'Eduardo', 77274155408, 2),
    (default, 'Guilherme', 97089175025, 1);

select * from pessoa;

select p.nome as 'Nome',
	p.CNH as 'CNH',
    h.tipo as 'Categoria',
    h.veiculo as 'Meio de Transporte'
    from pessoa as p
    join habilitacao as h
    on h.idHabilitacao = p.fkHabilitacao;

select *,
	case
    when h.tipo = 'A' then 'IFood'
    when h.tipo = 'B' then 'Uber'
    when h.tipo = 'ACC' then 'Desempregado'
    end as Emprego
    from pessoa as p
    join habilitacao as h
    on h.idHabilitacao = p.fkHabilitacao;

insert into pessoa values
	(default, 'Diego', null, null);

select nome,
    ifnull(CNH, 'não dirige') as CNH
    from pessoa 
    left join habilitacao
    on idHabilitacao = fkHabilitacao;


-- Ex 2


create table farmaceutico (
idFarmaceutico int primary key auto_increment,
nome varchar(45),
idade int
);

describe farmaceutico;

insert into farmaceutico values
	(default, 'Vinicius', 24),
    (default, 'Lucca', null),
    (default, 'Shirley', 19),
    (default, 'Guilherme', 22),
    (default, 'Isabela', null);

select * from farmaceutico;

create table endereco (
idEndereco int primary key auto_increment,
rua varchar(45),
numero int,
CEP char(8)
);

describe endereco;

insert into endereco values
	(default, 'Paulista', 1000, '68446677'),
    (default, 'Consolacao', 200, '50113968'),
    (default, 'Sumare', 550, '06735692'),
    (default, 'Augusta',1420 ,'69748243'),
    (default, 'Pompeia',630 ,'36522239');

select * from endereco;

create table farmacia (
idFarmacia int primary key auto_increment,
loja varchar(45),
fkEndereco int,
fkFarmaceutico int
);

alter table farmacia add constraint fkFarmaciaEndereco
	foreign key (fkEndereco)
    references Endereco(idEndereco);

alter table farmacia add constraint fkFarmaciaFarmaceutico
	foreign key (fkFarmaceutico)
    references farmaceutico(idFarmaceutico);
    
alter table farmacia add constraint chkFarmacia
	check (loja in('matriz', 'filial'));

describe farmacia;

insert into farmacia values
	(default, 'matriz', 3, 1),
    (default, 'filial', 1, 2),
    (default, 'filial', 2, 5),
    (default, 'filial', 5, 4),
    (default, 'filial', 4, 3);

select * from farmacia;

select Far.loja as Loja,
	f.nome as responsavel,
    f.idade as IdadeResponsavel,
    e.CEP as CEP,
    e.rua as RuaLoja,
    e.numero as NumeroLoja
    from farmacia as Far
    join farmaceutico as f
    on f.idFarmaceutico= Far.fkFarmaceutico
    join endereco as e
    on e.idEndereco= Far.fkEndereco;

select Far.loja as loja,
	f.nome as responsavel,
    f.idade as IdadeResponsavel,
    e.CEP as CEP,
    e.rua as RuaLoja,
    e.numero as NumeroLoja,
	case
    when Far.loja = 'filial' then 'Menos impacto'
    else 'Muito importante'
    End as 'situação',
    ifnull(idade, 'idade não informada') as 'Situação idade'
    from farmacia as Far
    join farmaceutico as f
    on f.idFarmaceutico= Far.fkFarmaceutico
    join endereco as e
    on e.idEndereco= Far.fkEndereco;
    
    
-- Ex 4


create table RG (
idRG int primary key auto_increment,
nome varchar(45),
pai varchar (45),
mae varchar (45),
numeroRG char(9) unique,
fkPai int,
fkMae int
-- constraint fkRGPai foreign key (fkPai)
-- 	references RG(idRG),
-- constraint fkRGMae foreign key (fkMae)
-- 	references RG(idRG)
);

alter table RG add constraint fkRGPai
	foreign key (fkPai)
    references RG(idRG);

alter table RG add constraint fkRGMae
	foreign key (fkMae)
    references RG(idRg);

describe RG;

insert into RG values
	(default, 'Vinicius', 'Rogerio', 'Marici', '386058520', 2, 3), 
    (default, 'Rogerio', null, null, '871342017', null, null),
    (default, 'Marici', null, null, '906448235', null, null),
    (default, 'Gulherme', 'Rogerio', 'Marici','874273567', 2, 3), 
    (default, 'Lucca', 'Vinicius', null,'685789411', 1, null);

select * from RG;

-- Usei o ISNULL para o select funcionar como eu queria.
select filho.nome as 'Nome Filho',
	filho.numeroRG as 'RG filho',
    pai.nome as 'Nome Pai',
    mae.nome as 'Nome mãe',
    case
    when isnull(pai.nome) then 'Pai ausente'
    else 'Pai presente'
    end as 'Situação Pai',
    case
    when isnull(mae.nome) then 'Mãe ausente'
    else 'Mãe presente'
    end as 'Situação Mãe'
    from RG as filho
	left join RG as pai
    on pai.idRG= filho.fkPai
    left join RG as mae
    on mae.idRG= filho.fkMae;

select *,
	ifnull(fkPai, 'Pai ausente') as 'Situação Pai',
    ifnull(fkMae, 'Mãe ausente') as 'Situação Mãe'
    from RG;