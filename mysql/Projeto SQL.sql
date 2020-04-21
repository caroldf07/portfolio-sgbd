USE projeto_sql;

CREATE TABLE aluno ( 
	id int unsigned not null auto_increment,
	nome_aluno varchar (64) not null,
    email varchar (128) not null,
    endereco varchar (230) not null,
    PRIMARY KEY (id)
);

CREATE TABLE instrutor (
	id int unsigned not null auto_increment,
	nome_instrutor varchar (64) not null,
    telefone int unsigned not null,
    PRIMARY KEY (id)
);

CREATE TABLE tipo (
	id int unsigned not null auto_increment,
    tipo varchar (60) not null,
    PRIMARY KEY (id)
);

CREATE TABLE curso (
	id int unsigned not null auto_increment,
    nome varchar (60) not null,
    tipo int unsigned not null,
    instrutor int unsigned not null,
    preco double unsigned null default '0',
    primary key (id),
    index fk_tipo (tipo),
    index fk_instrutor (instrutor),
    constraint foreign key (tipo) references tipo (id),
    constraint foreign key (instrutor) references instrutor (id)
);
    
CREATE TABLE matricula (
	id int unsigned not null auto_increment,
    aluno int unsigned not null,
    curso int unsigned not null,
    preco double unsigned null default '0',
    datahora datetime not null,
    primary key (id),
    index fk_aluno (aluno),
    index fk_curso (curso),
    constraint foreign key (aluno) references aluno (id),
    constraint foreign key (curso) references curso (id)
);
    
ALTER TABLE aluno add column data_nascimento varchar(10);
ALTER TABLE aluno change column data_nascimento nascimento date;

CREATE INDEX aluno ON aluno (nome_aluno);

ALTER TABLE instrutor add column email varchar (100);
ALTER TABLE instrutor drop column email;

CREATE INDEX instrutor ON curso (instrutor);
ALTER table curso drop index instrutor;
    