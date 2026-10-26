USE TarifUebersicht;

-- Erstellen Sie SQL-Statements um die unten gezeigten 
-- Informationen in der Datenbank anzulegen:
INSERT INTO Ansprechpartner
VALUES ('Hans', 'Müller', '0111-45678', 'hans.mueller@energieversorger.de');

INSERT INTO Tarif
VALUES ('Ökostrom 3+');

UPDATE Kunde
SET AnsprechpartnerNr = 5
WHERE KundenNr = 1;

DELETE FROM KundeTarif;

INSERT INTO KundeTarif
VALUES (1, 1, '20210101', '20210403'),
(1, 2, '20210404', '20211031'),
(1, 1, '20211101', '20211231');

-- Legen Sie eine neue Tabelle „Kundengruppe“ mit folgenden 
-- Feldern an:
--        KundengruppeNr INT,
--        Name VARCHAR(50)
CREATE TABLE Kundengruppe (
	KundengruppeNr INT IDENTITY NOT NULL,
	Name VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Kundengruppe
		PRIMARY KEY (KundengruppeNr)
);

-- Fügen Sie die folgenden beiden Gruppen in die Tabelle ein:
--    Stammkunden
--    Rabatt-Jäger
INSERT INTO Kundengruppe
VALUES ('Stammkunden'), ('Rabatt-Jäger');

-- Die Tabelle „Kunde“ soll in einer 1:n-Beziehung zur Tabelle 
-- „Kundengruppe“ stehen. Ein Kunde ist in genau einer Gruppe 
-- und in einer Gruppe können mehrere Kunden sein. Stellen Sie 
-- die Verknüpfung zwischen den Tabellen her.
ALTER TABLE Kunde
ADD KundengruppeNr INT NULL;

ALTER TABLE Kunde
ADD CONSTRAINT FK_Kunde_Kundengruppe
	FOREIGN KEY (KundengruppeNr)
	REFERENCES Kundengruppe (KundengruppeNr);

-- Ordnen Sie alle Kunden der Gruppe „Stammkunden“ zu.
UPDATE Kunde
SET KundengruppeNr = 1;

-- Die Spalte „KundengruppeNr“ (oder wie sie die Spalte auch 
-- immer genannt haben) in der Tabelle „Kunde“ soll ab sofort 
-- kein NULL mehr erlauben. Passen Sie die Tabelle entsprechend an.
ALTER TABLE Kunde
ALTER COLUMN KundengruppeNr INT NOT NULL;

-- Benennen Sie in der Tabelle „Kundengruppe“ die Spalte „Name“ 
-- in „Bezeichnung“ um.
EXEC sp_rename 'Kundengruppe.Name', 'Bezeichnung', 'COLUMN';

-- Die Tabelle „Kundengruppe“ mit all ihren Informationen soll 
-- wieder aus der Datenbank entfernt werden. Unternehmen Sie die 
-- notwendigen Schritte.
ALTER TABLE Kunde
DROP CONSTRAINT FK_Kunde_Kundengruppe;

ALTER TABLE Kunde
DROP COLUMN KundengruppeNr;

DROP TABLE Kundengruppe;




