SELECT*
FROM Kunde;

-- DML (Data Manipulation Language), Kommandos: INSERT, UPDATE, DELETE
INSERT INTO Kunde
	VAlUES ('Max Mustermann', 'Hamburg');
-- INSERT fügt einen neuen Datensatz hinzu, die id muss nicht angegeben werden,
-- da für id die Option IDENTITY gesetzt ist. Hier wird die id automatisch vergeben, 
-- beginnend mit der nächst möglichen id, in einser Schritten aufwärts
SELECT kd_id
FROM Projekt;

-- Löschen der Datensätze, die einen Fremdschlüssel in einer anderen Tabelle haben
-- ist nicht möglich.
DELETE FROM Kunde
WHERE id = 1;
-- Diese Anweisung führt zu einem Fehler "Konflikt mit der REFERENCE-Einschränkung
-- fk_projek_kunde. Für diesen Datensatz in der Elterntabelle (Kunde) steht 
-- ein Fremdschlüssel in der Kindtabelle (Projekt). Wenn der Datensatz gelöscht würde,
-- wäre der Fremdschlüssel in der Projekttabelle ungültig. Das ist verboten. Das Prinzip
-- nennt sich Referentielle Integrität.
-- Nur Datensätze die keine Referenz in einer anderen Tabelle haben, können gelöscht werden.
DELETE FROM Kunde
WHERE id = 7;

CREATE TABLE Ueb_Trunc (
	id INT IDENTITY,
	Bezeichnung varchar(20)
);
SELECT*
FROM Ueb_Trunc

INSERT INTO Ueb_Trunc
	VALUES
		('Haus'),
		('Auto');
-- Löschen Sie die Datensätze einer Tabelle mit DELETE und ist eine IDENTITY auf
-- der id-Spalte gesetzt, dann Zählt der Zähler bei der letzten id weiter. Waren 
-- die id 1-3 vorhanden, wird automatisch mit der id 4 weitergezählt.
BEGIN TRANSACTION
DELETE FROM UEB_Trunc;
ROllBACK TRANSACTION;
	
-- Wenn Sie mit Truncate die Datensätze einer Tabelle löschen und IDENTITY für
-- die id-Spalte definiert ist, dann wird der Zähler auf 1 zurückgesetzt. Beim Einfügen 
-- eines neuen Datensatz beginnt dieser automatisch mit der id 1.
BEGIN TRANSACTION
TRUNCATE TABLE Ueb_Trunc;
ROLLBACK TRANSACTION;

-- Unterabfragen beim Ändern von Tabellenwerten mit Filterkriterien aus einer anderen
-- Tabelle
UPDATE Kunde
SET stadt = 'Hamburg'
WHERE id IN (
			SELECT kd_id FROM Projekt
			WHERE mittel < 100000);

-- Erstellen einer Backup-Tabelle
SELECT*
FROM Arbeit;
CREATE TABLE BackupArbeit (
			mit_id INT,
			pro_id CHAR(2),
			aufgabe VARCHAR(30),
			ein_dat DATE
);
-- Verifizieren ob die neu angelegte Tabelle vorhanden ist
SELECT*
FROM BackupArbeit;

-- fügt den kompletten Datensatz von Arbeit in BackupArbeit ein
INSERT INTO BackupArbeit
SELECT* FROM Arbeit;

-- Lösche des kompletten Inhalts von Arbeit
DELETE FROM Arbeit;

-- Datensätze aus der Backup-Tabell in die Tabelle Arbeit einfügen
INSERT INTO Arbeit
SELECT* FROM BackupArbeit;

-- Löschen der Backup-Tabelle
DROP TABLE BackupArbeit;

-- Erstellen der Backup-Tabelle und gleichzeitig werden die Datensätze aus der Tabelle
-- Arbeit eingefügt.
SELECT*
INTO BackupArbeit
FROM Arbeit;
