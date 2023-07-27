-- SELECIONAR BANCO
USE SQL_DB_1

--  INSERT 

-- Inserir dados na tabela 'alunos'
INSERT INTO 
	alunos (id_aluno, nome, data_nascimento, sexo, data_cadastro, login_cadastro)
VALUES
	  (2, 'Maria Santos', '1995-08-20', 'F', GETDATE(), 'maria.santos'),
	  (3, 'Pedro Oliveira', '1999-01-10', 'M', GETDATE(), 'pedro.oliveira'),
	  (4, 'Ana Souza', '2000-03-05', 'F', GETDATE(), 'ana.souza'),
	  (5, 'Lucas Pereira', '1997-11-02', 'M', GETDATE(), 'lucas.pereira'),
	  (6, 'Carla Mendes', '1996-06-18', 'F', GETDATE(), 'carla.mendes'),
	  (7, 'Bruno Almeida', '1994-09-22', 'M', GETDATE(), 'bruno.almeida'),
	  (8, 'Isabela Costa', '2001-07-12', 'F', GETDATE(), 'isabela.costa'),
	  (9, 'Rafaela Pereira', '1998-12-28', 'F', GETDATE(), 'rafaela.pereira'),
	  (10, 'Fernando Santos', '2002-02-14', 'M', GETDATE(), 'fernando.santos');


SELECT * FROM alunos;

-- Inserir dados na tabela 'situacao'
INSERT INTO 
	situacao (id_situacao, situacao, data_cadastro, login_cadastro)
VALUES
	(1, 'Em andamento', GETDATE(), 'joao.silva'),
	(2, 'Reprovado', '25-07-2023 10:30:00', 'maria.santos'),
	(3, 'Matriculado', '25-07-2023 12:15:00', 'pedro.oliveira'),
	(4, 'Desistente', '25-07-2023 14:00:00', 'ana.souza'),
	(5, 'Em andamento', '25-07-2023 16:30:00', 'lucas.pereira'),
	(6, 'Trancado', '25-07-2023 19:45:00', 'carla.mendes'),
	(7, 'Aguardando Avaliação', '25-07-2023 14:30:00', 'bruno.almeida'),
	(8, 'Em Recuperação', '25-07-2023 09:15:00', 'isabela.costa'),
	(9, 'Reprovado por Falta', '25-07-2023 11:00:00', 'rafaela.pereira'),
	(10, 'Pendente', '25-07-2023 13:45:00', 'fernando.santos');

-- Inserir dados na tabela 'cursos'
INSERT INTO 
	cursos (id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
    (2, 'Lógica de Programação', GETDATE(), 'disc.LGP'),
    (1, 'Banco de dados', GETDATE(), 'disc.bd'),
    (3, 'Ciência da Computação', '25-07-2023 11:15:00', 'disc.cien.comp'),
    (4, 'Biologia', '25-07-2023 13:30:00', 'disc.bio'),
    (5, 'Literatura Brasileira', '25-07-2023 15:45:00', 'disc.lit.bra'),
    (6, 'Engenharia Civil', '25-07-2023 18:00:00', 'disc.eng.cv'),
    (7, 'Geografia', '25-07-2023 14:30:00', 'disc.geo'),
    (8, 'Engenharia de Software', '25-07-2023 09:15:00', 'disc.eng.soft'),
    (9, 'Educação Física', '25-07-2023 11:00:00', 'disc.ed.fi'),
    (10, 'Administração', '25-07-2023 13:45:00', 'disc.adm');

-- Inserir dados na tabela 'turmas'
INSERT INTO 
	turmas (id_turma, id_aluno, id_curso, valor_turma, desconto, data_inicio, data_cadastro, login_cadastro)
VALUES
    (1, 1, 1, 500.00, 0.10, '2023-08-01', '25-07-2023 12:00:00', ''),
    (1, 2, 1, 500.00, 0.10, '2023-08-01', '25-07-2023 12:00:00', ''),
    (2, 3, 2, 450.00, 0.05, '2023-08-15', '25-07-2023 12:30:00', ''),
    (2, 4, 2, 450.00, 0.05, '2023-08-15', '25-07-2023 12:30:00', ''),
    (3, 5, 3, 600.00, 0.15, '2023-08-05', '25-07-2023 17:30:00', ''),
    (3, 6, 3, 600.00, 0.15, '2023-08-05', '25-07-2023 17:30:00', ''),
    (4, 7, 4, 400.00, 0.20, '2023-08-10', '25-07-2023 14:45:00', ''),
    (4, 8, 4, 400.00, 0.20, '2023-08-10', '25-07-2023 14:45:00', ''),
    (5, 9, 5, 550.00, 0.08, '2023-08-20', '25-07-2023 11:15:00', ''),
    (5, 10, 5, 550.00, 0.08, '2023-08-20', '25-07-2023 11:15:00', '');

-- Inserir dados na tabela 'registro_presenca'
INSERT INTO
	registro_presenca (id_turma, id_aluno, id_situacao, data_ppresenca, data_cadastro, login_cadastro)
VALUES
	(1, 1, 1, '2023-08-02', '2023-07-25', ''),
	(1, 2, 2, '2023-08-02', '2023-07-25', ''),
	(1, 3, 3, '2023-08-02', '2023-07-25', ''),
	(2, 4, 4, '2023-08-16', '2023-07-25', ''),
	(2, 5, 5, '2023-08-16', '2023-07-25', ''),
	(3, 6, 6, '2023-08-06', '2023-07-25', ''),
	(3, 7, 7, '2023-08-06', '2023-07-25', ''),
	(4, 8, 8, '2023-08-11', '2023-07-25', ''),
	(4, 9, 9, '2023-08-11', '2023-07-25', ''),
	(5, 10, 10, '2023-08-21', '2023-07-25', '');