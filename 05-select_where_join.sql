-- SELECT PARA TODOS OS REGISTRO DA TAELA.
SELECT * 
	FROM dbo.turmas;

SELECT * 
	FROM cursos;

--  SELEÇÃO DE REGISTRO CHAMANDO PELO NOME DA TABELA
SELECT turmas.* FROM turmas;

-- SELEÇÃO DE REGISTRO INFORMANDO OS CAMPOS DESEJADOS
SELECT 
	turmas.id_turma, 
	turmas.id_curso, 
	turmas.data_inicio
FROM turmas;

-- APELIDO PARA TABELAS

SELECT 
	t.*
FROM turmas as t;

-- UTILIZAR NOMES PERSONALIZADOS PARA OS CAMPOS

SELECT
	c.id_curso AS id, 
	c.nome_curso AS "nome do curso", 
	c.login_cadastro AS turma
FROM cursos AS c;

-- FIILTRO DE DADOS WHERE

SELECT
	a.*
FROM 
	alunos AS a
WHERE
	a.data_nascimento >= '2000';

-- OPERDAORES DE COMPARAÇÃO
-- >  MAIOR
-- <  MENOR
-- >= MAIOR OU IGUAL
-- <= MENOR OU IGUAL
-- <> DIFERENTE
-- =  IGUAL 

SELECT 
	a.*
FROM 
	alunos AS a
WHERE 
	a.sexo = 'F';

-- AND | OR

SELECT 
	a.*
FROM 
	alunos AS a
WHERE
	a.sexo = 'F' 
	AND a.data_nascimento < '2000' 
	AND a.id_aluno < 9;

SELECT
	a.nome, 
	a.sexo, 
	YEAR(a.data_nascimento) AS "Ano de Nascimento"
FROM 
	alunos AS a
WHERE
	a.data_nascimento >= '2000'
	AND a.sexo = 'M';

-- Operação e Funções dentro do SELECT
SELECT 
	at.id_aluno,
	at.valor,
	(at.valor * at.desconto) as "valor desconto",
	FLOOR((at.valor - (at.valor * at.desconto))) as "valor total"
FROM
	alunos_turmas AS at

-- JUNTAR SEM JOIN 
SELECT
	c.id_curso,
	c.nome_curso,
	t.data_inicio,
	(at.valor * at.desconto) as "valor desconto",
	(at.valor - (at.valor * at.desconto)) as "valor total"
FROM 
	alunos_turmas AS at,
	turmas AS t,
	cursos AS c
WHERE
	at.id_aluno = t.id_turma
	AND c.id_curso = t.id_curso;

-- JOIN

SELECT 
	*
FROM 
	turmas AS t
	RIGHT JOIN cursos AS c
		ON c.id_curso = t.id_curso;


-- EXERCICIO trazer quantidades de alunos por turmas.
SELECT 
	c.nome_curso,
	COUNT([at].id_aluno) AS "quantidade de alunos"
FROM
	alunos_turmas AS [at]
	INNER JOIN turmas AS t
		ON t.id_turma = [at].id_turma
	RIGHT JOIN cursos AS c
			ON c.id_curso = t.id_curso
	GROUP BY
		 c.nome_curso;

