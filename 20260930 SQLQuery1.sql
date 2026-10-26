USE TarifUebersicht;

-- Daten anlegen
INSERT INTO Ansprechpartner
VALUES ('Max', 'Mustermann', NULL, NULL);

INSERT INTO Ansprechpartner (Vorname, Nachname)
VALUES ('Maria', 'Musterfrau');

INSERT INTO Ansprechpartner
VALUES ('Paul', 'Panzer', '0123/45678-9', 'a@bd.de');

INSERT INTO Kunde
VALUES ('Clara', 'Maier', 'Waldessaum 11', '99999', 'Tannen', 1);

INSERT INTO Tarif
VALUES ('Ökostrom normal');

-- Datum JJJJMMTT
INSERT INTO KundeTarif
VALUES (1, 1, '20170131', NULL);

-- Daten aktualisieren
-- WHERE-Klausel beachten!
UPDATE Ansprechpartner
SET Vorname = 'Maximilian', Email = 'max@example.com'
WHERE AnsprechpartnerNr = 1;

-- NULL kann nur mit IS/IS NOT geprüft werden
UPDATE Ansprechpartner
SET Telefon = '0123/45678-0'
WHERE Telefon IS NULL;

-- Daten löschen
DELETE FROM Ansprechpartner
WHERE AnsprechpartnerNr = 3;



-- Daten ansehen
SELECT * FROM Ansprechpartner;
