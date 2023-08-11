-- SELECIONAR O BANCO
USE SQL_DB_1
GO

-- ADD CONSTRAINT NA TABELA TURMAS

	-- TURMAS E ALUNOS
ALTER TABLE 
	turmas
		ADD CONSTRAINT fk_turmas_alunos
			FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno);

	-- Turmas e Cursos
ALTER TABLE
	turmas
		ADD CONSTRAINT fk_turmas_cursos
			FOREIGN KEY (id_curso) REFERENCES cursos(id_curso);
	
-- ADD CONSTRAINT NA TABELA registro_presenca

	-- registro_presenca e turmas

ALTER TABLE
	registro_presenca
		ADD CONSTRAINT fk_registroPresenca_turmas
			FOREIGN KEY (id_turma) REFERENCES turmas(id_turma);

	-- registro_presenca e alunos
ALTER TABLE
	registro_presenca
		ADD CONSTRAINT fk_registroPresenca_alunos
			FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno);

	-- registro_presenca e situacao
ALTER TABLE
	registro_presenca
		ADD CONSTRAINT fk_registroPresenca_situacao
			FOREIGN KEY (id_situacao) REFERENCES situacao(id_situacao);