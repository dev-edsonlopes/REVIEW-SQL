-- DROP

SELECT * FROM sys.tables;

-- APAGAR TABELAS
SELECT * FROM tbDelete;
DROP TABLE tbDelete;

-- APAGAR  SEQUENCES

SELECT * FROM sys.sequences;
DROP SEQUENCE seq_tbAlunos;

-- APAGAR Indices

CREATE INDEX indAlunosTeste ON alunos(id_aluno);
DROP INDEX alunos.indAlunosTeste;

-- APAGAR PROCEDURES

CREATE PROCEDURE prcListaAlunos 
AS 
	SELECT al.nome, al.data_nascimento
	FROM alunos AS al
	WHERE  al.nome LIKE 'J%';

EXEC prcListaAlunos;

DROP PROCEDURE prcListaAlunos;

-- APAGAR CONSTRAINTS

SELECT * FROM sys.key_constraints;

SELECT * 
INTO tbDelete
FROM CURSOS;

SELECT * FROM tbDelete;

ALTER TABLE tbDelete ADD CONSTRAINT pk_idcurso UNIQUE (id_curso);

ALTER TABLE tbDelete
DROP CONSTRAINT pk_idcurso;

-- APAGAR VIEWS

CREATE VIEW vwAlunosTurmasTeste AS
	 SELECT	 
		nome,
		data_nascimento,
		DATEDIFF(YEAR, data_nascimento, GETDATE()) AS idade
	FROM alunos
	WHERE DATEDIFF(YEAR, data_nascimento, GETDATE()) <= 25;

SELECT * FROM vwAlunosTurmasTeste;

DROP VIEW vwAlunosTurmasTeste;

-- APAGAR BANCO DE DADOS

CREATE DATABASE dbTesteDrop;
USE SQL_DB_1;
GO

DROP DATABASE dbTesteDrop;
