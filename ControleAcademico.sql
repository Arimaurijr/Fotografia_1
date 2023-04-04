CREATE DATABASE Controle_Academico
GO

USE Controle_Academico
GO

CREATE TABLE Aluno
(
    RA INT IDENTITY(1,1) NOT NULL,
    nome VARCHAR(100) NOT NULL,

    CONSTRAINT pk_ra_aluno PRIMARY KEY(RA)
)
GO

CREATE TABLE Disciplina
(
    codigo_disciplina INT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    carga_horaria DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_codigo_disciplina_disciplina PRIMARY KEY(codigo_disciplina)

)
GO

CREATE TABLE Matricula
(
    codigo_matricula INT IDENTITY(1,1) NOT NULL,
    RA_matricula INT NOT NULL,
    ano INT NOT NULL,
    semestre INT NOT NULL,

    CONSTRAINT pk_codigo_matricula_matricula PRIMARY KEY(codigo_matricula),
    CONSTRAINT fk_RA_matricula_matricula FOREIGN KEY(RA_matricula) REFERENCES Aluno(RA)
)
GO

CREATE TABLE Item_Matricula
(
    codigo_matricula_item INT NOT NULL,
    codigo_disciplina_item INT NOT NULL,
    nota_1 DECIMAL(3,1) NOT NULL,
    nota_2 DECIMAL(3,1) NOT NULL,
    sub DECIMAL(3,1) NOT NULL,
    situacao BIT NOT NULL,
    fata INT NOT NULL,

    CONSTRAINT pk_codigo_matricula_codigo_disciplina PRIMARY KEY(codigo_matricula_item,codigo_disciplina_item),
    CONSTRAINT fk_codigo_matricula_item FOREIGN KEY(codigo_matricula_item) REFERENCES Matricula(codigo_matricula),
    CONSTRAINT fk_codigo_disciplina_item FOREIGN KEY(codigo_disciplina_item) REFERENCES Disciplina(codigo_disciplina)
)
GO

insert into Disciplina(nome,carga_horaria) values ('Lógica de programação',50.0);

select * from Disciplina;

insert into Disciplina(nome,carga_horaria) values ('Estrutura de dados',100.0),('Sistemas operacionais',60.0),('Programação orientada a objetos',100.0);