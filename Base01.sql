create database Base01;

create table Cliente
(
    id int NOT NULL,
    nome varchar(100) NOT NULL,
    cpf char(11) NOT NULL,

    constraint PK_Cliente primary key (id),
    constraint UN_Cliente_CPF unique (cpf)

)

create table Cliente_Fone
(
   id_cliente int not null,
   numero varchar(14) not null,
   tipo int not null,

   constraint PK_Clienet_Fone primary key(id_cliente, numero),
   constraint FK_Cliente_Fone_Cliente Foreign key (id_cliente) references Cliente (id) 
);

select nome from Cliente;
insert into Cliente (id,nome,cpf) values (1,'Fábio','12345678900');
select id,nome,cpf from Cliente;

insert into Cliente_Fone(id_cliente,numero,tipo) values (1,'5516997080816',1);

select id_cliente,numero from Cliente_Fone;