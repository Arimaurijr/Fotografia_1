CREATE TABLE PessoaFisica
(
   cpf CHAR(11) NOT NULL,
   rg VARCHAR(10),
   dataNascimento DATE,
   sexo CHAR,
   nome VARCHAR(50) NOT NULL,
   codigo INT NOT NULL

)

CREATE TABLE PessoaJuridica
(
   cnpj CHAR(14) NOT NULL,
   inscricaoEstatual CHAR(9),
   nomeResponsavel varchar(50) NOT NULL,
   nome VARCHAR(50) NOT NULL,
   codigo INT NOT NULL

)

CREATE TABLE Funcionario
(
    codigo INT NOT NULL,
    departamento VARCHAR(30),
    nome VARCHAR(50) NOT NULL,
    funcao VARCHAR(30) NOT NULL

)

CREATE TABLE Produto
(
    codigo INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    precoCusto DECIMAL NOT NULL,
    precoVenda DECIMAL NOT NULL,
    qtdMin INT NOT NULL,
    qtdEstoque INT NOT NULL

)

CREATE TABLE Venda
(
    id INT NOT NULL,
    [Data] DATETIME NOT NULL,
    formaPagamento VARCHAR(10) NOT NULL,
    valor DECIMAL NOT NULL

)

CREATE TABLE Endereco
(
    logradouro VARCHAR(50) NOT NULL,
    numero INT,
    complemento VARCHAR(50),
    bairro VARCHAR(20) NOT NULL,
    CEP CHAR(8),
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    pais CHAR(2) NOT NULL

)

CREATE TABLE Telefone
(
    tipo VARCHAR(10) NOT NULL,
    numero VARCHAR(11) NOT NULL

)
GO

ALTER TABLE Funcionario ADD
    Tipo_Telefone VARCHAR(10) NULL,

    CONSTRAINT FK_Funcionario_Telefone FOREIGN KEY(Tipo_Telefone) REFERENCES Telefone(Tipo) 

