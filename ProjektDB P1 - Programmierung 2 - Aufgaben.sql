--	Nutzen Sie die Datenbank ProjektDB zur 
--	Lösung dieser Aufgabe
USE ProjektDB;

--	Aufgabe P1.3
--
--	Erstellen Sie eine gespeicherte Prozedur "sp_FilterMitarbeiter2",
--	die eine Liste der Mitarbeiter ausgibt, die in einer bestimmten
--	Gehalts-Range liegen. Die Prozedur soll die beiden Parameter
--	@MinGehalt und @MaxGehalt entgegennehmen. Wenn es keine passenden
--	Mitarbeiter gibt, soll eine entsprechende Meldung ausgegeben werden.
ALTER PROC sp_FilterMitarbeiter2 -- Maas araligina gore Mitarbeiter listesini filtreler
	@MinGehalt INT,
	@MaxGehalt INT
AS
BEGIN
    -- Mitarbeiter ve Gehalt tablolarini birlestirir
	SELECT m.id, m.vorname, m.nachname, g.gehalt 
	FROM Mitarbeiter m
	JOIN Gehalt g ON m.id = g.mit_id
	WHERE g.gehalt BETWEEN @MinGehalt AND @MaxGehalt
	
	--2     -- Sorgu hic satir dondurmediyse mesaj gosterir
	IF @@ROWCOUNT = 0
	BEGIN
		PRINT 'Keine Mitarbeiter im angegebenen Gehaltsberich gefunden'
	END
END;



--	Aufgabe P1.4
--
--	Erstellen Sie eine Prozedur, die ein neues Projekt anlegt. Der
--	Prozedur sollen die Werte für die Projekt-Id, die Bezeichnung
--	und die Mittel übergeben werden. Das Projekt darf nur angelegt
--	werden, wenn es keinen Konflikt bei Id und Bezeichnung gibt.

CREATE PROC sp_NeuesProjekt
	@id INT, 
	@bezeichnung NVARCHAR(30), 
	@mittel MONEY
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Projekt WHERE id = @id OR bezeichnung = @bezeichnung ) --1. Kontroö
	BEGIN
		INSERT INTO Projekt (id, bezeichnung, mittel)
		VALUES (@id, @bezeichnung, @mittel);
	END
	ELSE
	BEGIN
		PRINT 'Projekt mit dieser ID oder Bezeichnung existiert bereits.';
	END
END;