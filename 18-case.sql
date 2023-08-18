-- CASE 

SELECT * FROM alunos_turmas;
DROP TABLE tTEMP;

SELECT 
	x.*
	INTO tTemp
	FROM (
		SELECT 
			ROW_NUMBER() 
			OVER (ORDER BY id_aluno) AS linha,
			y.id_aluno, y.nome, y.sexo, y.nome_curso, y.data_inicio, y.valor
			FROM (
				SELECT
					a.id_aluno,
					a.nome,
					a.sexo,
					c.nome_curso,
					t.data_inicio,
					[at].valor
					FROM alunos_turmas AS [at]
						INNER JOIN turmas AS t
							ON t.id_turma = [at].id_turma
						INNER JOIN cursos AS c
							ON c.id_curso = t.id_curso
						INNER JOIN alunos AS a
							ON a.id_aluno = [at].id_aluno
			) AS y
	) AS x;

SELECT * FROM tTemp;

SELECT
	id_aluno,
	nome,
	CASE sexo
		WHEN 'M' THEN 'Masculino'
		WHEN 'F' THEN 'Feminio'
	ELSE
		'Verifique' END AS sexo,
	nome_curso
FROM tTemp; 

SELECT
		nome,
		nome_curso,
		valor,
		CONVERT(DATE, data_inicio) AS dt_inicio,
	CASE YEAR(data_inicio)
		WHEN 2022 THEN 'Ano anterior'
		WHEN 2023 THEN 'Ano atual'
		WHEN 2024 THEN 'Próximo ano'
	ELSE 'ANO INVALIDO' END "Analise de ano"
FROM tTemp;

SELECT 
	nome, 
	data_nascimento,
	DATEDIFF(YEAR, data_nascimento, GETDATE()) AS idade,
	CASE
		WHEN DATEDIFF(YEAR, data_nascimento, GETDATE()) < 18 THEN 'Menor de idade'
		WHEN DATEDIFF(YEAR, data_nascimento, GETDATE()) >= 18 THEN 'Maior de idade'
	END AS status_idade
FROM alunos;

SELECT 
	nome,
	nome_curso,
	sexo
FROM tTemp
ORDER BY
    CASE sexo 
		WHEN 'F' THEN 'Feminino'
		WHEN 'M' THEN 'Masculino'
	ELSE
		'sexo' END DESC;
		

