USE master;

--Prüfen
IF DB_ID ('Projekte') IS NOT NULL
	ALTER DATABASE Projekte
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- Datenbank Löschen Wenn da
DROP DATABASE IF EXISTS Projekte;
GO

-- Datenbank Neu Erstellen

CREATE DATABASE Projekte;
GO

USE Projekte;

CREATE TABLE abteildung (
	abteilungNr INT IDENTITY NOT NULL,
	bezeichnunh VARCHAR(100) NOT NULL,
	standort VARCHAR(100) NOT NULL,
	CONSTRAINT pk_abteilung
		PRIMARY KEY (abteilungNr)
);

CREATE TABLE mitarbeite (
	personalNr INT IDENTITY NOT NULL,
	name VARCHAR(50) NOT NULL,
	vorname VARCHAR (50) NOT NULL,
	gebDat DATE NOT NULL,
	gehalt MONEY NOT NULL,
	taetigkeit VARCHAR (100) NOT NULL,
	abteilungsNr INT NULL,
	CONSTRAINT pk_mitarbeite
		PRIMARY KEY (personalNR),	
	CONSTRAINT fk_mitarbeite_abteilung
		FOREIGN KEY (abteilungsNr)
		REFERENCES abteilung (abteilungsNr)
);

CREATE TABLE projek (
projektNr INT IDENTITY NOT NULL,
bezeichnung VARCHAR (50) NOT NULL,
beginn DATE NOT NULL,
ende DATE NULL,
leiterNr INT NULL
CONSTRAINT pk_projekt
	PRIMARY KEY (projektNr),
CONSTRAINT fk_projek_mitarbeiter
	FOREIGN KEY (leiterNr)
	REFERENCES mitarbeiter (personalNr)
	);

CREATE TABLE projektMitarbeiter (
	projektNr INT NOT NULL,
	personalNr INT NOT NULL,
	wochenstunden FLOAT NOT NULL,
	CONSTRAINT pk_projektMitarbeiter
	PRIMARY KEY (projektNr, personalNr),
	CONSTRAINT fk_projektMitarbeiter_projekt
		FOREIGN KEY (projektNr)
		REFERENCES projekt (projektNr),
	CONSTRAINT fk_projektMitarbeiter_Mitarbeiter
		FOREIGN KEY (personalNr)
		REFERENCES mitarbeiter (personalNr)
);