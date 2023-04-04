CREATE DATABASE Controle_faltas_01

CREATE TABLE Disciplina
(
    codigo_disciplina INT NOT NULL,
    carga_horaria DECIMAL NOT NULL,

    CONSTRAINT pk_codigo_disciplina PRIMARY KEY(codigo_disciplina)
)

CREATE TABLE Prova
(
    cod_disciplina INT NOT NULL,
    numero_prova INT NOT NULL,
    descricao VARCHAR NOT NULL,
    nota_maxima DECIMAL NOT NULL,
    intervalo_pontos DECIMAL NOT NULL,

    CONSTRAINT pk_codigo_disciplina_numero_prova PRIMARY KEY(cod_disciplina,numero_prova),
    CONSTRAINT fk_numero_prova FOREIGN KEY(cod_disciplina) REFERENCES Disciplina(codigo_disciplina)

)

CREATE TABLE Aluno
(
    RA INT NOT NULL,
    coeficiente_rendimento_academico DECIMAL,

    CONSTRAINT pk_RA PRIMARY KEY(RA) 
)

CREATE TABLE Disciplina_Aluno
(
    cd_disciplina INT NOT NULL,
    RA_aluno INT NOT NULL,
    numero_faltas INT NOT NULL,
    status_disciplina BIT NOT NULL,

    CONSTRAINT pk_cd_disciplina_RA_aluno PRIMARY KEY(cd_disciplina,RA_aluno),
    CONSTRAINT fk_cd_disciplina FOREIGN KEY(cd_disciplina) REFERENCES Disciplina(codigo_disciplina),
    CONSTRAINT fk_RA_aluno FOREIGN KEY(RA_aluno) REFERENCES Aluno(RA)

)

CREATE TABLE Nota
(
    codig_disciplina INT NOT NULL,
    RA_nota INT NOT NULL,
    nro_prova INT NOT NULL,
    nota_prova DECIMAL NOT NULL,

    CONSTRAINT pk_codig_disciplina_RA_nota PRIMARY KEY(codig_disciplina,RA_nota,nro_prova),
    CONSTRAINT fk_codig_disciplina FOREIGN KEY(codig_disciplina) REFERENCES Disciplina(codigo_disciplina),
    CONSTRAINT fk_RA_nota FOREIGN KEY(RA_nota) REFERENCES Aluno(RA)

)