--	criar tabela
CREATE TABLE alunos (
	-- Campos da Tabela 
	id_aluno INT PRIMARY KEY NOT NULL,
	nome VARCHAR(255) NOT NULL, 
	data_nascimento DATE NOT NULL,
	sexo varchar(1) NULL,
	data_cadastro datetime NOT NULL,
	login_cadastro varchar(15) NOT NULL
	-- CONSTRAINT fk_turmas FOREIGN KEY (id_aluno) REFERENCES turmas (id_aluno)
);

CREATE TABLE situacao (
	id_situacao INT PRIMARY KEY NOT NULL,
	situacao VARCHAR(25) NOT NULL,
	data_cadastro DATETIME,
	login_cadastro VARCHAR(15)
);

CREATE TABLE cursos (
	id_curso INT PRIMARY KEY NOT NULL,
	nome_curso VARCHAR(200) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

CREATE TABLE turmas (
	id_turma INT PRIMARY KEY NOT NULL,
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	valor_turma NUMERIC(15,2) NOT NULL,
	desconto NUMERIC(3,2) NOT NULL,
	data_inicio DATE NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15),
);

CREATE TABLE registro_presenca (
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	id_situacao INT NOT NULL,
	data_ppresenca DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	login_cadastro VARCHAR(15)
);

-- Apagar tabela
/*
DROP TABLE alunos;
DROP TABLE cursos;
DROP TABLE turmas;
DROP TABLE situacao;
DROP TABLE registro_presenca;
*/