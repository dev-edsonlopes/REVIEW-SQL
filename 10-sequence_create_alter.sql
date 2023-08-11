-- SEQUENCE

CREATE SEQUENCE seq_Teste01;

SELECT NEXT VALUE FOR seq_Teste01;

/*
tinyint - intervalo de 0 a 255
smallint - intervalo de -32.768 a 32.768
int - intervalo de -2.147.483.648 a 2.147.483.648
bigint- intervalo de -9.223.372.036.854.775.808 a 9.223.372.036.854.775.808
decimal e numeric com uma escala de 0.
*/

CREATE SEQUENCE seq_Teste02
	AS NUMERIC
	START WITH 1
	INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_teste02;

CREATE SEQUENCE seq_Teste03
	START WITH 100
	INCREMENT BY -1;

SELECT NEXT VALUE FOR seq_teste03;

-- APAGAR SEQUENCE

DROP SEQUENCE seq_Teste03;

-- VALORES MAX E MIN

CREATE SEQUENCE seq_Teste04
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 100
	CYCLE
	CACHE 3;

SELECT NEXT VALUE FOR seq_teste04;

-- alterar sequence

ALTER SEQUENCE seq_teste04
	RESTART WITH 100
	MAXVALUE 10000
	NO CACHE;

-- CONSULTAR SEQUENCES
SELECT * FROM sys.sequences;

ALTER SEQUENCE seq_teste04
	RESTART WITH 100;

DECLARE @vIDALuno INT;
	SET @vIDALuno = NEXT VALUE FOR seq_teste04;

	SELECT @vIDALuno;

DROP SEQUENCE seq_Teste01;
DROP SEQUENCE seq_Teste02;
DROP SEQUENCE seq_Teste03;
DROP SEQUENCE seq_Teste04;