
SELECT * INTO tbTemp FROM ALUNOS;

SELECT * FROM tbTemp WHERE sexo IS NULL;

UPDATE tbTemp
	SET sexo = 'F'
WHERE sexo IS NULL;

DROP TABLE tbTemp;