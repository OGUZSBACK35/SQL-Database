-- Bsp Erstellen oder Ändern der Stored Procedure

CREATE OR ALTER PROCEDURE sp_GetKundenNachOrt 
---- Musterileri bulmak icin stored procedure tanimlar

	@SuchOrt VARCHAR (35) -- Optinaler parameter beim Aufruf der SP
	-- Procedure cagrilirken disaridan alinan parametre


AS
BEGIN
	-- ab hier der Ausführbare Block
	SELECT id,firma, ort     -- Belirtilen ort degerine sahip musterileri getirir
	FROM Kunde
	WHERE ort = @SuchOrt;
END; -- Ende des Blocks
GO -- Batch'i sonlandirir

EXEC sp_GetKundenNachOrt @Suchort = 'München'; -- Procedure'i München parametresiyle calistirir
--EXEC, stored procedure'ü çalıştırır. Parametre adı @SuchOrt ile aynı yazılmalıdır.

-- Was eignet sich besser SP oder UDF

CREATE OR ALTER FUNCTION dbo.fn_GetKundenNachOrt
(
	@SuchOrt VARCHAR(35)
)
RETURNS TABLE
AS 
RETURN 
(
	SELECT id, firma, ort
	FROM Kunde
	WHERE ort = @SuchOrt 
);
GO

-- UDF lässt sich nur innerhalb der SQL-Klauseln ausführen
SELECT * 
FROM dbo.fn_GetKundenNachOrt('München') AS Kude_Ort

-- Löschen der SP oder UDF mit DROP

DROP PROCEDURE sp_GetKundenNachOrt;
DROP FUNCTION fn_GetKundenNachOrt;

-- Bsp Skalare UDF 
GO
CREATE OR ALTER FUNCTION dbo.fn_NettoZuBrutto
(
	@NettoPreis DECIMAL(10,2),
	@MwStSatz DECIMAL(4,2) --z.B. 0.19 für %19
)
RETURNS DECIMAL(10,2) -- Gitbt einen einzelnen Wert zurück
BEGIN	
	DECLARE @Brutto DECIMAL(10,2);
	SET @Brutto = @NettoPreis * (1 + @MwStSatz);

	RETURN @Brutto; -- Rückgabe
END;
GO

SELECT dbo.fn_NettoZuBrutto(100.00, 0.19) AS BruttoBetrag;

-- Udf = Lesen und Berechnen
-- Stored Procedure = Steuern und Schreiben auch INSERT und UPDATE,