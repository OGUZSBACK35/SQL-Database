use master;
-- falls die DB vorhanden ist, löschen
DROP DATABASE IF EXISTS FussballDB;

-- Datenbank erstellen
CREATE DATABASE FussballDB;
GO

-- Authorisierung ändern
ALTER AUTHORIZATION ON DATABASE::FussballDB TO sa;
GO

-- Wechseln zur neuen DB
use FussballDB;
GO

-- Tabellen erstellen

CREATE TABLE Spiel(
		id INT NOT NULL,
		gegner VARCHAR(40),
		spieltag DATE,
		CONSTRAINT pk_Spiel
				PRIMARY KEY (id)
);
GO

CREATE TABLE Mannschaft(
		id INT NOT NULL,
		bezeichnung VARCHAR(40),
		CONSTRAINT pk_Mannschaft
				PRIMARY KEY (id)
);
GO

CREATE TABLE Spieler(
		id INT NOT NULL,
		_name VARCHAR(40),
		geburtsdatum DATE,
		spielerpass INT,
		mannschaft_id INT,
		CONSTRAINT pk_Spieler
				PRIMARY KEY (id),
		CONSTRAINT fk_Spieler
				FOREIGN KEY (mannschaft_id) REFERENCES Mannschaft (id)
		);
		GO

CREATE TABLE SpielerSpiel(
		spieler_id INT NOT NULL,
		spiel_id INT NOT NULL,
		position VARCHAR(30),
		einsatzZeitMin INT,
		CONSTRAINT pk_SpielerSpiel
				PRIMARY KEY (spieler_id, spiel_id),
		CONSTRAINT fk_SpielerSpiel_Spieler
				FOREIGN KEY (spieler_id) REFERENCES Spieler (id),
		CONSTRAINT fk_SpielerSpiel_Spiel
				FOREIGN KEY (spiel_id) REFERENCES Spiel (id)
);
GO

CREATE TABLE Trainer(
		id INT IDENTITY(1,1) NOT NULL,
		_name VARCHAR(20),
		geburtsdatum DATE,
		trainerlizenz INT NOT NULL,
		mannschaft_id INT NOT NULL,
		CONSTRAINT pk_Trainer
				PRIMARY KEY (id),
		CONSTRAINT fk_Trainer_mannschaft
				FOREIGN KEY (mannschaft_id) REFERENCES Mannschaft (id)
);