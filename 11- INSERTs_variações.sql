SELECT * FROM alunos;
SELECT 
	MAX(id_aluno) +1
FROM alunos;

CREATE SEQUENCE seq_tbAlunos
	START WITH 11
	INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_tbAlunos;


-- CONSULTAR CAMPOS DE TABELAS

EXEC sp_columns alunos;

-- INSERT 

INSERT INTO 
	dbo.alunos (
		id_aluno,
		nome,
		data_nascimento,
		sexo,
		data_cadastro,
		login_cadastro
	)
VALUES (
	NEXT VALUE FOR seq_tbAlunos,
	'Jennifer Marcela',
	'2000/12/07',
	'F',
	GETDATE(),
	'jennifer.marcel'
);

-- INSERT 2
EXEC sp_columns cursos;
DECLARE @vIDcurso INT;
SELECT @vIDcurso = MAX(id_curso) + 1 FROM cursos;

INSERT INTO 
	cursos (
		id_curso,
		nome_curso,
		data_cadastro,
		login_cadastro
	)
VALUES (
	@vIDcurso,
	'SQÇ SERVER',
	GETDATE(),
	'2023.2sql'
);
	
SELECT * FROM cursos;

-- INSERT COM A CRIAÇÃO DE UMA NOVA TABELA

SELECT *
	INTO dbo.novaTabela
FROM dbo.cursos;

SELECT * FROM dbo.novaTabela;

DROP TABLE dbo.novaTabela;

-- INSERT COM SELECT

DELETE FROM dbo.novaTabela;

EXEC sp_columns novaTabela;

INSERT INTO novatabela (
	id_curso,
	nome_curso,
	data_cadastro,
	login_cadastro
)
SELECT id_curso,
		nome_curso,
		GETDATE(),
		'EDSON'
FROM cursos
WHERE id_curso > 5;

INSERT INTO novaTabela( id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT * FROM cursos WHERE nome_curso LIKE '%PHP%';