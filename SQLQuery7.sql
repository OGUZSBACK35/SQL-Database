USE TarifUebersciht;

--Daten Anlegen
INSERT INTO Ansprechpartner
VALUES ('Max', 'Mustermann', NULL, NULL);

INSERT INTO Ansprechpartner (Vorname, Nachname)
VALUES ('Maria', 'Musterfrau');


INSERT INTO Ansprechpartner
VALUES ('Jack',  'Panzer', '0123/456789/0' , 'abc@.de');

INSERT INTO Kunde
VALUES ('Clara' , 'Maier', 'Waldessaum' , '9999' , 'Tammem' , 1);

INSERT INTO Tarif
VALUES ('Ökostorm Normal');

--Datum JJJMTT
INSERT INTO KundeTarif
VALUES (1, 1, '20170131', NULL);

--Daten Aktualisieren
UPDATE Ansprechpartner
SET Vorname = 'Maximilian', Email = 'max@example.com'
WHERE AnsprechparnetNr = 1;

-- NULL Kann Nur mit IS/IS NOT geprüft werden
UPDATE Ansprechpartner
SET Telefon = '12345/3535-0'
WHERE Telefon IS NULL;

--Daten Löschen
DELETE FROM Ansprechpartner
WHERE AnsprechparnetNr =3;


SELECT * FROM Ansprechpartner;

