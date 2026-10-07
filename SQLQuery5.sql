CREATE DATABASE Projekte;
GO
USE Projekte;

CREATE TABLE Abteilung (
	AbteilungNr INT IDENTITY (1,1) PRIMARY KEY,
	Bezeichnung VARCHAR(50) NOT NULL,
	Standort VARCHAR(50) NOT NULL,
);

CREATE TABLE Mitarbeiter (
	PersonalNr INT IDENTITY (1,1) PRIMARY KEY,
	Vorname VARCHAR (50) NOT NULL,
	Nachname VARCHAR (50) NOT NULL,
	Geburtsdatum DATE NOT NULL,
	Gehalt DECIMAL (10,2) NOT NULL,
	Tätigkeit VARCHAR(50) NULL,
	AbteilungNr INT NOT NULL,
	CONSTRAINT FK_Mitarbeiter_Abteilung
	FOREIGN KEY (AbteilungNr)
	REFERENCES Abteilung (AbteilungNr)
);

CREATE TABLE Projekt (
	ProjektNr INT IDENTITY (1,1) PRIMARY KEY,
	Bezeichnung VARCHAR (50) NOT NULL,
	Projektbeginn DATE NOT NULL,
	ProjektEnde DATE NULL,
	LieterPersonalNr INT NOT NULL,
	CONSTRAINT FK_Projekt_Mitarbeiter_Leiter
		FOREIGN KEY (LieterPersonalNr)
		REFERENCES Mitarbeiter (PersonalNr)
);

CREATE TABLE MitarbeiterProjekt (
	PersonalNr INT NOT NULL, 
	ProjektNr INT NOT NULL,
	Stundenzahl DECIMAL (5,2) NOT NULL,
	PRIMARY KEY (PersonalNr, ProjektNr),
	CONSTRAINT FK_MitarbeiterProjekt_Mitarbeiter
		FOREIGN KEY (PersonalNr)
		REFERENCES Mitarbeiter(PersonalNr),
	CONSTRAINT FK_MitarbeiterProjekt_Projekt
		FOREIGN KEY (ProjektNr)
		REFERENCES Projekt(ProjektNr)
);