-- UNION
SELECT
	p.EnglishDescription,
	p.SafetyStockLevel,
	p.DaysToManufacture,
	p.Class,
	p.Color
FROM DimProduct AS p
WHERE p.Color = 'na'
	AND p.EnglishDescription is not null
-- UNION ALL (all register)
-- UNION (distinct)
SELECT 
	p.EnglishDescription,
	p.SafetyStockLevel,
	p.DaysToManufacture,
	p.Class,
	p.Color
FROM DimProduct AS p
WHERE p.Color <> 'na';
