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

-- GETDATE
SELECT GETDATE() AS "DATA e HORA";

-- convert data para formato 
SELECT CONVERT(CHAR, GETDATE(), 103) AS "dd/mm/yyyy"; 
SELECT CONVERT(CHAR, GETDATE(), 102) AS "yyyy.mm.dd";
SELECT CONVERT(CHAR, GETDATE(), 3)	AS "dd/mm/yy";

-- data unidade

SELECT DAY(GETDATE()) AS dias;
SELECT MONTH(GETDATE()) AS mês;
SELECT YEAR(GETDATE()) AS ano;

-- DATEPART

SELECT DATEPART(DAY, GETDATE()) AS dias;
SELECT DATEPART(MONTH, GETDATE()) AS mês;
SELECT DATEPART(YEAR, GETDATE()) AS ano;

-- DATEADD 

SELECT DATEADD(MONTH, +2, GETDATE());

SELECT CONVERT(DATE,DATEADD(DAY, -2, GETDATE()));
SELECT CONVERT(DATE, DATEADD(YEAR, -2, GETDATE()));
SELECT CONVERT(DATE, DATEADD(YEAR, -2, GETDATE()));

-- DATEDIFF

SELECT DATEDIFF(YEAR, GETDATE(), DATEADD(YEAR, 2, GETDATE())) AS intervalo;
SELECT DATEDIFF(MONTH, GETDATE(), DATEADD(YEAR, 2, GETDATE())) AS intervalo;
SELECT DATEDIFF(DAY, GETDATE(), DATEADD(YEAR, 2, GETDATE())) AS intervalo;
SELECT DATEDIFF(HOUR, GETDATE(), DATEADD(YEAR, 2, GETDATE())) AS intervalo;
SELECT DATEDIFF(MINUTE, GETDATE(), DATEADD(YEAR, 2, GETDATE())) AS intervalo;
SELECT DATEDIFF(SECOND, GETDATE(), DATEADD(YEAR, 2, GETDATE())) AS intervalo;

-- FUNÇÃO TEXTO

-- ASCII
SELECT ASCII('A');
SELECT ASCII('a');
SELECT ASCII(9);

--NCHAR
SELECT NCHAR(57);

--CHAR
SELECT CHAR(97);

--CHARINDEX
SELECT CHARINDEX('o', 'edson');
SELECT CHARINDEX('o', 'edson', 2);

SELECT 
	a.nome,
	CHARINDEX('Santos', a.nome, 1)
FROM alunos AS a
WHERE 
	CONVERT(INT, CHARINDEX('Santos', a.nome, 1)) > 0;

SELECT 
	a.nome,
	CHARINDEX('Santos', a.nome, 1)
FROM alunos AS a
WHERE 
	 CHARINDEX('Santos', a.nome, 1) <> 0;

-- CONCAT

SELECT CONCAT('Edson', ' ', 'Lopes', ' ', 'JR');

SELECT 'Edson ' +  'Lopes ' + 'JR';

SELECT 
	CONCAT_WS(' | ', a.nome, c.nome_curso,
			'INICIO: '+ TRIM(CONVERT(CHAR, t.data_inicio)) +
			'PG: ' + CONVERT(CHAR, [at].valor))
FROM 
	alunos AS a
	INNER JOIN alunos_turmas AS [at]
		ON [at].id_aluno = a.id_aluno
	INNER JOIN turmas AS t
		ON t.id_turma = [at].id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso;

SELECT 
	CONCAT(a.nome,' - ',c.nome_curso)
FROM 
	alunos AS a
	INNER JOIN alunos_turmas AS [at]
		ON [at].id_aluno = a.id_aluno
	INNER JOIN turmas AS t
		ON t.id_turma = [at].id_turma
	INNER JOIN cursos AS c
		ON c.id_curso = t.id_curso;
