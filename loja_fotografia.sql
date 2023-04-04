-- banco ainda em fase de construção

CREATE DATABASE loja_fotografia_01;
GO

USE loja_fotografia_01;
GO

CREATE TABLE Endereco
(
    CEP CHAR(8) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    pais CHAR(3) NOT NULL,

    CONSTRAINT pk_cep PRIMARY KEY(CEP)
)

CREATE TABLE Pessoa_Fisica
(
    codigo_cliente_f INT IDENTITY(1,1),
    nome_cliente_f VARCHAR(100) NOT NULL,
    genero varchar(20) NOT NULL,
    RG VARCHAR(10) NOT NULL,
    CPF char(11) NOT NULL,
    data_nascimento DATE,
    logradouro VARCHAR(100) NOT NULL,
    CEP_f CHAR(8) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    complemento VARCHAR(100) NOT NULL,

    CONSTRAINT pk_cliente_f PRIMARY KEY(codigo_cliente_f),
    CONSTRAINT fk_cep_f FOREIGN KEY(CEP_f) REFERENCES Endereco (CEP),
    CONSTRAINT un_cliente_cpf UNIQUE (CPF)

)

CREATE TABLE Pessoa_Juridica
(
    codigo_cliente_j INT IDENTITY(1,1),
    nome_cliente_j VARCHAR(100) NOT NULL,
    nome_responsavel VARCHAR(100) NOT NULL,
    inscricao_estadual CHAR(9) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    CEP_j CHAR(8) NOT NULL,

    CONSTRAINT pk_cliente_j PRIMARY KEY (codigo_cliente_j),
    CONSTRAINT fk_cep_f FOREIGN KEY (CEP_j),
    CONSTRAINT un_cliente_j UNIQUE (CNPJ)
)

CREATE TABLE Telefone_Cliente
(
    codigo_cliente_f_J INT IDENTITY(1,1),
    numero VARCHAR(10) NOT NULL,

    CONSTRAINT pk_codigo_cliente_f_j_numero PRIMARY KEY(codigo_cliente_f_j, numero),
    CONSTRAINT fk_numero FOREIGN KEY(numero) REFERENCES 
)

CREATE TABLE Produto
(
    codigo_produto INT IDENTITY(1,1) NOT NULL,
    descricao TEXT NOT NULL,
    quantidade INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    qtd_minima INT NOT NULL,
    estoque INT NOT NULL,

    CONSTRAINT pk_codigo_produto PRIMARY KEY(codigo_produto)
)

CREATE TABLE Funcao_Departamento
(
   funcao VARCHAR(50) NOT NULL,
   departamento VARCHAR(50) NOT NULL,

   CONSTRAINT pk_funcao PRIMARY KEY(funcao)
)

CREATE TABLE Funcionario
(
    codigo_funcionario INT IDENTITY(1,1) NOT NULL,
    nome_funcionario VARCHAR(100) NOT NULL,
    funcao_f VARCHAR(50) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    CEP_func CHAR(8) NOT NULL,
    bairro VARCHAR(100) NOT NULL,

    CONSTRAINT pk_codigo_funcionario PRIMARY KEY(codigo_funcionario),
    CONSTRAINT fk_funcao_k FOREIGN KEY(funcao_f) REFERENCES Funcao_Departamento(funcao),
    CONSTRAINT fk_cep_f FOREIGN KEY(CEP_func) REFERENCES Endereco(CEP)
)

CREATE TABLE Venda
(
    codigo_venda INT IDENTITY(1,1),
    data_venda DATETIME NOT NULL,
    condicao_pagamento VARCHAR(10) NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    codigo_cliente_f INT,
    codigo_cliente_j INT,
    codigo_vendedor_v INT NOT NULL,

    CONSTRAINT pk_codigo_venda PRIMARY KEY(codigo_venda),
    CONSTRAINT fk_codigo_cliente_v FOREIGN KEY(codigo_cliente_f) REFERENCES Pessoa_Fisica(codigo_cliente_f),
    CONSTRAINT fk_codigo_cliente_j FOREIGN KEY(codigo_cliente_j) REFERENCES Pessoa_Juridica(codigo_cliente_j),

)

CREATE TABLE Venda_Produto
(
  codigo_produto_vp INT NOT NULL,
  codigo_venda_vp INT NOT NULL,
  quantidade INT NOT NULL,
  valor_total_item DECIMAL(10,2),

  CONSTRAINT pk_codigo_produto_vp_codigo_venda_vp PRIMARY KEY(codigo_produto_vp,codigo_venda_vp),
  CONSTRAINT fk_codigo_produto_vp FOREIGN KEY(codigo_produto_vp) REFERENCES Produto(codigo_produto),
  CONSTRAINT fk_codigo_venda_vp FOREIGN KEY(codigo_venda_vp) REFERENCES Venda(codigo_venda)

)

CREATE TRIGGER TGR_valor_total_item
ON Venda_Produto
FOR INSERT
BEGIN

DECLARE
 @preco_venda_v DECIMAL(10,2),
 @quantidade_v INT,
 @codigo_produto_v INT,
 @codigo_venda_v INT

 select @preco_venda_v = Venda_Produto.preco_venda, 
 @quantidade_v = Venda_Produto.quantidade, 
 @codigo_produto_v = Venda_Produto.codigo_produto_vp, 
 @codigo_venda_v = Venda_produto.codigo_venda_vp 
 from INSERTED

 UPDATE Venda_Produto SET valor_total_item = @preco_venda_v * @quantidade_v
 where codigo_produto_vp = @codigo_produto_v and codigo_venda_vp = @codigo_venda_v

 END