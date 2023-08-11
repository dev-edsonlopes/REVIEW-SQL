SELECT * 
INTO tTemp
FROM alunos;

EXEC sp_columns tTemp;

-- adicionar coluna

ALTER TABLE tTemp
	ADD cpf NUMERIC(11);

SELECT * FROM tTemp;

UPDATE tTemp
	SET cpf =11144477889
WHERE id_aluno = 20;

ALTER TABLE tTemp
	ADD email VARCHAR(100);

-- APAGAR COLUNA
ALTER TABLE tTemp
	DROP COLUMN email;

-- ALTERAR TIPO DE DADOS DA COLUMN
ALTER TABLE tTemp
	ALTER COLUMN cpf VARCHAR(14);

DROP TABLE tTemp;