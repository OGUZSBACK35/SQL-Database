SELECT * FROM Autor
SELECT * FROM Buch;

--Anzeigen von Nachname des Autors und dem Buch des Autors
SELECT a.nachname, titel
FROM Autor a
JOIN AutorBuch ON A.id = autor_id 
JOIN Buch b ON B.id = buch_id;
-----------------------------------------------------------------

-- Ergänzen von Spalten zur Tabelle Autor, Spalte Anrede und Spalte Emaail

BEGIN TRANSACTION; -- Bir Islem Blogunun Baslangicini Belirten Komuttur
ALTER TABLE Autor
	ADD 
		Anrede CHAR(4),
		--Email VARCHAR(40);

-- ROLLBACK macht die Transaktion Rückgangig und Bringt die Datenbank in
-- den Ursprünglich Zustand. 
-- Islem Sirasinda Bir Hata Olursa, Yapilan Tüm Degisiklikleri Iptal Edip
-- Basa Döndürür (Veriyi)
ROLLBACK TRANSACTION;

-- Die Transaction Dauerhaft in der Datenbank Übernehmen
--COMMIT Islemi Hatasiy Bittiyse Degisikleri Veritabanina Kalici Olarak Kaydeder.
COMMIT TRANSACTION;

-- Erstellen einer CHECK-Regel, die Prüft, ob bei der Erstellung eines neuen 
-- Datensatzes nur Frau oder Herr Eingegeben Wurde.
--CHECK Constraint Veri Tablosundaki Sütunlara Girebilecek Verilerin Belirli
-- Bir Mantiksal Kosulu Saglamak Zorunda Oldugunu Belirten Kisaltmadir

ALTER TABLE Autor
ADD CONSTRAINT ck_autor_anrede
	CHECK (Anrede IN ('Frau', 'Herr')); --Buraya Sadece 'Frau' veya 'Herr' Yazilmasina izin Verdik.

-- Löschen der fehlerhaften Spalte Arede und s.o. Ausführen der ALTER TABLE Anweisung
-- mit Korrektur Anrede
ALTER TABLE Autor
DROP COLUMN Arede;

-- Aufgabe: Prüfen ob die Checkregel funktioniert
-- Zwei Möhlichkeiten: 1. Einen neuen Datensatz mit INSERT anlegen
--					   2. Einen besthenenden Datensatz in der Spalte Anrede ändern
BEGIN TRANSACTION;
INSERT INTO Autor (id, vorname, nachname, Geburtstag, Anrede)
VALUES (5, 'Test', 'User', '20020212', 'Herr');
 
UPDATE Autor
SET Anrede = 'Prof' --Anrede'ye verdigimiz Sart Burda Uymadigi icin ck_autor_anrede Hatasi Aldi
WHERE id = 1;

UPDATE Autor
SET Anrede = 'Herr' 
WHERE id = 1;

ROLLBACK TRANSACTION;

COMMIT TRANSACTION;
-- Transaktionen mit BEGIN TRANSACTION, ROLLBACK TRANSACTION, COMMIT TRANSACTION
-- Gehören zu TCL (Transaction Control Language, dies ist bisher Keine IHK-SQL-Syntax
-- Anwendung bei Ändern von Tabellespalten oder Einfügen von Datensätzen. Diese Können
-- durch ROLLBACK auf einfache Weise zurückgesetzt werden.

-- Aufgabe: Erstellen Sie eine CHECK-Regel für die Spalte Email, die Nur eine
-- Email als Zeichnenkette erlaubt. Sie Können Hier mit Pattern Machting und LIKE arbeiten.

ALTER TABLE Autor
ADD CONSTRAINT ck_autor_email
	CHECK (Email LIKE '%@%');

BEGIN TRANSACTION;

INSERT INTO Autor (id, vorname, nachname, Geburtstag, Email, Anrede)
VALUES (6, 'Test', 'User', '20020212', 'qwertz@hotmail.com', 'Herr');


UPDATE Autor
SET Email = 'ungültiges1@_email' 
WHERE Autor.id = 6;

UPDATE Autor
SET Email = 'ungültiges2@_email' 
WHERE Autor.id = 1;


UPDATE Autor
SET Email = 'ungültiges3@_email' 
WHERE Autor.id = 2;


UPDATE Autor
SET Email = 'ungültiges4@_email' 
WHERE Autor.id = 3;


UPDATE Autor
SET Email = 'ungültiges5@_email' 
WHERE Autor.id = 4;

ROLLBACK TRANSACTION;

-- Alternative zum Einfügen über Mehrere UPDATE Anweisungen, mit einer CASE-Anweisung

--1.Schritt Einfügen von einzigartigen Email in der Emailspalte.
BEGIN TRANSACTION;
UPDATE Autor
SET Email = CASE
	WHEN Autor.id = 1 THEN 'ungültige1s@_email' 
	WHEN Autor.id = 2 THEN 'ungültiges2@_email' 
	WHEN Autor.id = 3 THEN 'ungültiges3@_email'
	WHEN Autor.id = 4 THEN 'ungültiges4@email'
	ELSE Email -- Der Rest bleibt unverändert
END;
-- Optional 
-- WHERE Anerede = 'Herr' -- Hier wird nur die Email der männlichen Autor gesetz.
COMMIT TRANSACTION;

--2. Schritt: Die Spalte Email auf NOT NULL umstellen
ALTER TABLE Autor
ALTER COLUMN Email VARCHAR(40) NOT NULL;

--3. Schritt UNIQUE-CONSTRAINT (die Einzigartigkeit) als Regel Hinzufügen


ALTER TABLE Autor
ADD CONSTRAINT uq_autor_email UNIQUE (Email);

-- Bei einer bestehenden DB sind Änderungen Tabellenebene
-- mit CONSTRAINS das bessere Mittel, weil sie relativ einfach über DROP CONSTRAINT
--
ROLLBACK TRANSACTION; --Entfernt werden können
INSERT INTO Autor (id, vorname, nachname, Anrede, Email)
	VALUES (5, 'Anna', 'Speer', 'Frau', 'walteremail.com');

DELETE FROM Autor
WHERE Autor.id = 5;


-- Alternative: Dies Funktionert Nicht da sich UNIQUE nur in einer CONTRAINT einsetzen lässt.
BEGIN TRANSACTION;
ALTER TABLE Autor
ALTER COLUMN Email VARCHAR(50) NOT NULL UNIQUE 

--CONSTARINT Löschen, hier UNIQUE
ALTER TABLE Autor
DROP CONSTRAINT uq_autor_email; 

SELECT
	CONSTRAINT_NAME,
	CONSTRAINT_TYPE,
	TABLE_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Autor';

-- Die Constarints stehen in den Metadaten der Benuzterdatenbank (hier BuchclubDB).
-- Dies bezieht sich auch auf die Store Procedures in Ihrer Benuzerdatenbank.
-- Stored Procedures sind Funktionen, die fest in Ihrer Datenbank hinterlegt sinde oder 
-- die sie selber geschrieben haben.
-- Metadaten Stehen hier in INFORTMATION_SCHEMA
-- Anzeige der CONSTARIN über eine Stored Procedure 
EXEC sp_helpconstraint 'Atuor';