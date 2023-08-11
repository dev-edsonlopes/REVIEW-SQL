-- IF...ELSE
DROP TABLE tTemp;
SELECT * INTO tTemp FROM alunos;

IF 10 > 20
	SELECT '10 � MAIOR QUE 20'
ELSE
	SELECT '10 � MENOR QUE 20';

IF DATENAME(WEEKDAY, GETDATE()) IN ('Sabado', 'Domingo')
	SELECT 'ESTAMOS NO FIM DA SEMANA. HOJE � ' + DATENAME(WEEKDAY, GETDATE())
ELSE
	SELECT 'ESTAMOS EM UM DIA DE SEMANA. HOJE � ' + DATENAME(WEEKDAY, GETDATE());

-- VARIAVEIS GLOBAIS DO SQL

SELECT @@SERVERNAME;
SELECT @@LANGUAGE;
SELECT @@LANGID;
SELECT @@TRANCOUNT;

IF @@LANGUAGE <> 'Portugu�s (Brasil)'
	SELECT 'TODAY IS ' + DATENAME(WEEKDAY, GETDATE())
ELSE
	SELECT 'HOJE � '+ DATENAME(WEEKDAY, GETDATE());

DECLARE @vIdadeMax		INT;
DECLARE @vParam			INT;
	
	SET @vIdadeMax =	27;
	SET @vParam =		30;

IF @vIdadeMax >= @vParam
	SELECT 
		t.nome, 
		t.data_nascimento, 
		DATEDIFF(YEAR, t.data_nascimento, GETDATE()) AS IDADE 
	FROM tTemp AS t
		WHERE DATEDIFF(YEAR, t.data_nascimento, GETDATE()) >= @vIdadeMax
	ORDER BY 3 ASC
ELSE
	SELECT 
		t.nome, 
		t.data_nascimento, 
		DATEDIFF(YEAR, t.data_nascimento, GETDATE()) AS IDADE 
	FROM tTemp AS t
		WHERE DATEDIFF(YEAR, t.data_nascimento, GETDATE()) < @vIdadeMax
	ORDER BY 3 ASC;

DROP TABLE tTemp;