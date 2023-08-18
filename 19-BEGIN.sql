-- BEGIN END

SELECT * FROM tTemp;

-- DECLARE

DECLARE @vContador INT = 1;

WHILE @vContador < 10
BEGIN 
	PRINT 'Contador: ' + CONVERT(VARCHAR, @vContador)
	SET @vContador += 1
END

BEGIN TRANSACTION
IF @@TRANCOUNT = 0
	SELECT nome, nome_curso, sexo
	FROM tTEMP
	WHERE sexo = 'M';

ROLLBACK TRANSACTION;
