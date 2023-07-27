USE SQL_DB_1;

-- DROP COLLUMN 

-- DROP CONSTRAINT PRIMEIRO PARA PODER APAGAR UMA FOREIGN KEY

ALTER TABLE turmas 
	DROP CONSTRAINT fk_turmas_alunos;

ALTER TABLE turmas
	DROP COLUMN id_aluno;

ALTER TABLE turmas
	DROP COLUMN valor_turma;

ALTER TABLE turmas
	DROP COLUMN desconto;

SELECT * FROM turmas;

CREATE TABLE alunos_turmas (
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	valor NUMERIC(13, 2) NOT NULL,
	desconto NUMERIC(3,2),
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

-- ADD CONSTRAINT aluno_turmas

ALTER TABLE alunos_turmas
	ADD CONSTRAINT fk_turma FOREIGN KEY (id_turma) REFERENCES turmas(id_turma);

ALTER TABLE alunos_turmas
	ADD CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno);

-- INSERÇÃO DE DADOS

INSERT INTO turmas
	(id_turma, id_curso, data_inicio, data_cadastro,  login_cadastro)
	VALUES
		(2, 2, '2023-08-01', GETDATE(), 'LGP-2023.2'),
		(1, 1, '2023-08-01', GETDATE(), 'BD-2023.2'); 

INSERT INTO alunos_turmas
	(id_turma, id_aluno, valor, desconto, data_cadastro, login_cadastro)
	VALUES
		(2, 1, 230.30, 0.13, GETDATE(), 'joao.silva'),
		(1, 1, 350.98, 0.2, GETDATE(), 'joao.silva')

SELECT * FROM cursos;
SELECT * FROM turmas;
SELECT * FROM alunos;
SELECT * FROM alunos_turmas;