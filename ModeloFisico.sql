-- Active: 1699365647129@@127.0.0.1@3306
CREATE DATABASE 
   

CREATE TABLE Regiao (
    regiao_id INT PRIMARY KEY,
    nome VARCHAR(255)
);


CREATE TABLE Estado (
    estado_id INT PRIMARY KEY,
    nome VARCHAR(255),
    regiao_id INT,
    FOREIGN KEY (regiao_id) REFERENCES Regiao(regiao_id)
);


CREATE TABLE Municipio (
    municipio_id INT PRIMARY KEY,
    nome VARCHAR(255),
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES Estado(estado_id)
);


CREATE TABLE Instituicao (
    instituicao_id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    municipio_id INT,
    FOREIGN KEY (municipio_id) REFERENCES Municipio(municipio_id)
);


CREATE TABLE Sala (
    sala_id INT PRIMARY KEY,
    numeroSala VARCHAR(50),
    capacidadePessoas INT
);


CREATE TABLE Aluno (
    aluno_id INT PRIMARY KEY,
    nome VARCHAR(255),
    idade INT,
    numeroMatricula VARCHAR(50)
);


CREATE TABLE AlunoDisciplina (
    aluno_id INT,
    disciplina_id INT,
    PRIMARY KEY (aluno_id, disciplina_id),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(disciplina_id)
);


CREATE TABLE Disciplina (
    disciplina_id INT PRIMARY KEY,
    nome VARCHAR(255),
    materia_id INT UNIQUE,
    FOREIGN KEY (materia_id) REFERENCES Materia(materia_id)
);


CREATE TABLE Materia (
    materia_id INT PRIMARY KEY,
    nome VARCHAR(255),
    disciplina_id INT UNIQUE,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(disciplina_id)
);


CREATE TABLE Professor (
    professor_id INT PRIMARY KEY,
    nome VARCHAR(255),
    disciplina_id INT,
    instituicao_id INT,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(disciplina_id),
    FOREIGN KEY (instituicao_id) REFERENCES Instituicao(instituicao_id)
);


CREATE TABLE AlunoSala (
    aluno_id INT,
    sala_id INT,
    PRIMARY KEY (aluno_id, sala_id),
    FOREIGN KEY (aluno_id) REFERENCES Aluno(aluno_id),
    FOREIGN KEY (sala_id) REFERENCES Sala(sala_id)
);
