SELECT 
	c.id_curso,
	c.nome_curso,
	COUNT(t.id_turma) AS "Total de Turmas"
FROM
	turmas AS t
	INNER JOIN cursos as c
		ON c.id_curso = t.id_curso
GROUP BY
	c.id_curso, c.nome_curso

-- CLASULA IN
SELECT * FROM turmas WHERE id_curso IN (1,5);

-- CLASULA NOT IN
SELECT * FROM turmas WHERE id_curso NOT IN (1,5);

-- CLASULA DISTINCT
SELECT DISTINCT(DATEPART(YEAR, data_nascimento))
FROM alunos