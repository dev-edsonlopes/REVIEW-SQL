-- WHILE

SELECT * INTO tTemp FROM alunos;
SELECT * FROM tTemp;

DECLARE @vString VARCHAR(100);
	SET @vString = 'SQL            SERVER                |';

WHILE CHARINDEX('  ', @vString) > 0
	BEGIN
		SET @vString = REPLACE(@vString, '  ', ' ')
	END
SELECT @vString;
