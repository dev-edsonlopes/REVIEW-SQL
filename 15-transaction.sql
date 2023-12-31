-- TRANSACTION

-- BEGIN TRANSACTION
-- ROLLBACK TRANSACTION
-- COMMIT

-------------------------------

SELECT * INTO tTemp
FROM alunos;

BEGIN TRANSACTION;
	update tTemp
		SET sexo = LOWER(sexo);
COMMIT;

SELECT * FROM tTemp;

-- REFAZER 
BEGIN TRANSACTION;
	UPDATE tTemp SET sexo = UPPER(sexo);
ROLLBACK;

-------------------------------
DECLARE @TR1 VARCHAR(20);
	SELECT @TR1 = 'Transa��o Delete';

BEGIN TRANSACTION @TR1;
	DELETE FROM tTemp WHERE nome LIKE 'J%';
COMMIT TRANSACTION @TR1;

SELECT * FROM tTemp;

SELECT @@TRANCOUNT;
 
IF OBJECT_ID('TabelaTeste', 'U') IS NOT NULL
	DROP TABLE TabelaTeste
GO

CREATE TABLE TabelaTeste (id INT PRIMARY KEY, letra CHAR(1));
GO

-- INICIANDO A VARIAVEL DE CONTROLE DE TRANSACTIONS @@TRANCOUNT PARA 1

BEGIN TRANSACTION TR1;
	PRINT 'Transaction: contador depois do BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO TabelaTeste VALUES (1, 'A');

BEGIN TRANSACTION TR2;
	PRINT 'Transaction: contador depois do 2� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO TabelaTeste VALUES (2, 'B');

BEGIN TRANSACTION TR3;
	PRINT 'Transaction: contador depois do 3� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO TabelaTeste VALUES (3, 'C');

COMMIT TRANSACTION TR2;
	PRINT 'Transaction: contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
COMMIT TRANSACTION TR1;
	PRINT 'Transaction: contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
COMMIT TRANSACTION TR3;
	PRINT 'Transaction: contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

SELECT * FROM TabelaTeste;



BEGIN TRANSACTION;

	UPDATE alunos
		SET sexo = LOWER(sexo)
	WHERE id_aluno = 4;
	select * from alunos;

-- SALVAR ALTERA��O
COMMIT;
select * from alunos;

-- REFAZER ALTERA��O
ROLLBACK;
select * from alunos;