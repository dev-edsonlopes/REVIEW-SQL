-- PROCEDURE
CREATE PROCEDURE buscaCurso
	@NomeCurso VARCHAR(20)
AS
SET @NomeCurso = '%' + @NomeCurso + '%';

SELECT
	c.id_curso,
	c.nome_curso,
	a.nome,
	ISNULL(a.sexo, 'NI') AS sexo
FROM cursos as c
	INNER JOIN turmas AS t
		ON t.id_curso = c.id_curso
	INNER JOIN alunos_turmas AS [at]
		ON [at].id_turma = t.id_turma
	INNER JOIN alunos AS a
		ON a.id_aluno = [at].id_aluno
WHERE c.nome_curso LIKE @NomeCurso;

EXEC buscaCurso 'PHP';

-- PROCEDURE COM RETORNO

CREATE PROCEDURE incluirNovoCurso
	@nomeCurso VARCHAR(100),
	@loginCadastro VARCHAR(100)
AS
BEGIN
	DECLARE @vIdCurso INT;

	SELECT @vIdCurso = MAX(id_curso) +1 FROM cursos;

	INSERT INTO cursos (id_curso, nome_curso, data_cadastro, login_cadastro)
		VALUES (@vIdCurso, @nomeCurso, GETDATE(), @loginCadastro);

	SELECT 
		@vIdCurso = id_curso
	FROM 
		cursos
	WHERE
		id_curso = @vIdCurso;
	
	SELECT @vIdCurso AS retorno;

END;
GO

EXEC incluirNovoCurso 'Flutter', 'Edson';

EXEC buscaCurso '%';

SELECT * FROM cursos;

CREATE PROCEDURE incluirNovoCursoComValidacao
	@nomeCurso VARCHAR(100),
	@loginCadastro	VARCHAR(100)
AS
BEGIN
	DECLARE @vIdCurso INT;
	DECLARE @vExisteCurso INT;

	SELECT
		@vExisteCurso = id_curso
	FROM cursos
	WHERE nome_curso = @nomeCurso;

	IF @vExisteCurso > 0
		BEGIN
			SELECT 'O curso já existe!' AS retorno
		END
	ELSE
		BEGIN
			SELECT @vIdCurso = MAX(id_curso) + 1 FROM cursos;

			INSERT INTO cursos (id_curso, nome_curso, data_cadastro, login_cadastro)
				VALUES (@vIdCurso, @nomeCurso, GETDATE(), @loginCadastro);

			SELECT 
				@vIdCurso = id_curso
			FROM 
				cursos 
			WHERE 
				id_curso = @vIdCurso;

			SELECT @vIdCurso AS retorno;
		END
END;
GO

EXEC incluirNovoCursoComValidacao 'PHP POO', 'disc.php.poo';