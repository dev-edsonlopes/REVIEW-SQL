-- TRIGGER 

CREATE TABLE tbSaldos (
	produto VARCHAR(10),
	saldo_inicial NUMERIC(10),
	saldo_final NUMERIC(10),
	data_ulti_mov DATETIME
);
GO

INSERT INTO tbSaldos (produto, saldo_inicial, saldo_final, data_ulti_mov)
	VALUES ('Produto A', 0, 100, GETDATE());
GO

CREATE TABLE tbVendas (
	id_vendas INT,
	produto VARCHAR(10),
	quantidade INT,
	[data] DATETIME
);
GO

CREATE SEQUENCE seq_tbVendas
	AS NUMERIC
	START WITH 1
	INCREMENT BY 1;

CREATE TABLE tbHistoricoVendas (
	produto VARCHAR(10),
	quantidade INT,
	data_venda DATETIME
);
GO

CREATE TRIGGER trg_AjustaSaldo
ON tbVendas
FOR INSERT
AS
BEGIN
	DECLARE
		@quantidade INT,
		@data datetime,
		@produto varchar(10)

	SELECT 
		@data = [data], 
		@quantidade = quantidade, 
		@produto = produto 
	FROM inserted

	UPDATE tbSaldos
		SET saldo_final = saldo_final - @quantidade,
			data_ulti_mov = @data
		WHERE produto = @produto;

	INSERT INTO tbHistoricoVendas (produto, quantidade, data_venda)
		VALUES(@produto, @quantidade, @data);
END
GO

INSERT INTO tbVendas (id_vendas, produto, quantidade, [data])
	VALUES (NEXT VALUE FOR seq_tbVendas, 'Produto A', 5, GETDATE()); 

SELECT * FROM tbVendas;
SELECT * FROM tbSaldos;
SELECT * FROM tbHistoricoVendas;