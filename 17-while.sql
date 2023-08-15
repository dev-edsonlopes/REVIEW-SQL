-- WHILE ------------------------------------------------------------------------

SELECT * INTO tTemp FROM alunos;
SELECT * FROM tTemp;

DECLARE @vString VARCHAR(100);
	SET @vString = 'SQL            SERVER                |';

WHILE CHARINDEX('  ', @vString) > 0
	BEGIN
		SET @vString = REPLACE(@vString, '  ', ' ')
	END
SELECT @vString;

------------------------------------------------------------------------

DECLARE @vCONT INT;
	 SET @vCONT = 5;
WHILE(@vCONT <= 10)
	BEGIN
		PRINT 'O contador está em: ' + CONVERT(VARCHAR, @vCONT)
			SET @vCONT = @vCONT + 1
	END;

------------------------------------------------------------------------

DECLARE @vCONT INT;
	 SET @vCONT = 5;
WHILE(@vCONT < 10)
	BEGIN
		PRINT 'O contador está em: ' + CONVERT(VARCHAR, @vCONT)
		IF @vCONT = 7 
			BREAK
		SET @vCONT = @vCONT + 1
	END; 

DECLARE	@vCONT INT;
	SET @vCONT = 1;

WHILE(@vCONT <= 10)

BEGIN
	IF @vCONT % 2 = 0
		BEGIN
			SET @vCONT = @vCONT + 1
			CONTINUE	
		END;
	PRINT @vCONT
	SET @vCONT = @vCONT + 1
END;

------------------------------------------------------------------------

DROP TABLE tTEMP;

SELECT * INTO tTEMP
FROM (
	SELECT ROW_NUMBER() OVER( ORDER BY id_aluno) AS linha,
		y.id_aluno, y.nome, y.nome_curso, y.data_inicio
	FROM (
		SELECT 
			a.id_aluno, a.nome,
			c.nome_curso,
			t.data_inicio
		FROM alunos_turmas	AS [at]
			INNER JOIN turmas AS t
				ON t.id_turma = [at].id_turma
			INNER JOIN cursos AS c
				ON c.id_curso = t.id_curso
			INNER JOIN alunos AS a
				ON a.id_aluno = [at].id_aluno
	) AS y
) AS x;

SELECT * FROM tTEMP;

DECLARE @CONTADOR INT,
		@MAXLinhas INT,
		@CursoProcura NVARCHAR(100),
		@CursoNome NVARCHAR(100),
		@CursoAluno NVARCHAR(100),
		@NomeAluno NVARCHAR(100);
	SET @CursoProcura = 'BANCO';

-- ARMAZENANDO A QUANTIDADE
SELECT @CONTADOR = MIN(linha), @MAXLinhas = MAX(linha) FROM tTEMP;

WHILE (@CONTADOR IS NOT NULL AND @CONTADOR <= @MAXLinhas)

BEGIN 
	SELECT @CursoNome = nome_curso, @NomeAluno = nome FROM tTEMP
	WHERE linha = @CONTADOR

	IF CHARINDEX(@CursoProcura, @CursoNome) > 0
		PRINT CONVERT(VARCHAR, @CONTADOR) + '> Curso: ' + @CursoNome + ' Aluno: ' + @NomeAluno

	SET @CONTADOR = @CONTADOR + 1
END;