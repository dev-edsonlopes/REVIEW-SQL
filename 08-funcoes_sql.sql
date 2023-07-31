-- FUNÇÕES DE AGREGAÇÃO SUM, COUNT, AVG, MAX, MIM

-- SUM
SELECT 
	a.nome,
	SUM([at].valor) AS "valor bruto",
	SUM([at].valor - ([at].valor * [at].desconto)) AS "valor com desconto",
	SUM([at].desconto) AS "Soma do desconto"
FROM 
	turmas AS t
	INNER JOIN alunos_turmas AS [at]
		ON [at].id_turma = t.id_turma
		INNER JOIN alunos AS a
			ON a.id_aluno = [at].id_aluno
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso
GROUP BY
	a.nome
ORDER BY
	[Soma do desconto] DESC;

SELECT 
	c.nome_curso, 
	SUM([at].valor) AS valor_bruto,
	SUM([at].valor - ([at].valor * [at].desconto)) AS valor_total,
	SUM([at].valor) - SUM([at].valor - ([at].valor * [at].desconto)) AS "Valor do Desconto"
FROM 
	turmas AS t
	INNER JOIN alunos_turmas AS [at]
		ON [at].id_turma =  t.id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso
GROUP BY
	c.nome_curso
ORDER BY
	c.nome_curso;

-- COUNT
SELECT 
	c.nome_curso,
	COUNT(t.id_turma) AS "Total de Alunos",
	SUM([at].valor - ([at].valor * [at].desconto)) AS "Valor total"
FROM 
	alunos_turmas AS [at]
	INNER JOIN turmas AS t 
		ON t.id_turma = [at].id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso
GROUP BY
	c.nome_curso

-- AVG
SELECT 
 c.nome_curso,
 AVG([at].valor - ([at].valor * [at].desconto)) AS "Valor total"
FROM 
	alunos_turmas AS [at]
	INNER JOIN turmas AS t 
		ON t.id_turma = [at].id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso
GROUP BY
	c.nome_curso
	
-- MAX
SELECT 
 c.nome_curso,
 MAX([at].valor - ([at].valor * [at].desconto)) AS "Valor total"
FROM 
	alunos_turmas AS [at]
	INNER JOIN turmas AS t 
		ON t.id_turma = [at].id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso
GROUP BY
	c.nome_curso
-- MIN
SELECT 
 c.nome_curso,
 MIN([at].valor - ([at].valor * [at].desconto)) AS "Valor total"
FROM 
	alunos_turmas AS [at]
	INNER JOIN turmas AS t 
		ON t.id_turma = [at].id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso
GROUP BY
	c.nome_curso

-- FUNÇÕES DE DATA
