CREATE DATABASE TarifUebersciht; --Veri tabani olusturma

USE TarifUebersciht; --Bos bir veri tabani olusturduk

CREATE TABLE Ansprechpartner ( -- Bagimsiz Tablo Olusturma
	AnsprechparnetNr INT IDENTITY (1,1) PRIMARY KEY, --Yetkili Kisiye Ait Benzersiz Kimlik Nosu IDENTY(1,1) sayesinde SQL bu numarayi 1'den baslatip her yeni kayitta 1 arttirir
	Vorname VARCHAR (50) NOT NULL, -- Ad bilgisidir. NOT NULL oldugu icin bos birakilmaz.
	Nachname VARCHAR (50) NOT NULL, -- Burasida Ayni Sekilde NOT NULL ve bos kalmaz
	Telefon VARCHAR(30) NULL, -- NULL Oldugu icin bos birakilabilir.
	Email VARCHAR (75) NULL --Burasida NULL
);

CREATE TABLE Tarif ( -- Tarife Tablosu
	TarifNr INT IDENTITY (1,1) PRIMARY KEY, -- Tarifenin benzersiz kimlik numarasidir (PK) ve otomatik artar
	Bezeichnung VARCHAR (50) NOT NULL -- Tarifenin adi/tanimi NOT NULL bos birakilmaz
);

CREATE TABLE Kunde ( -- Müsteri Tablosu
	KundenNR INT PRIMARY KEY, -- Müsteri Numarasidir (PK)
	Vorname VARCHAR(50) NOT NULL, --Müsteri Adi Bos Birakilmaz NOT NULL
	Nachname VARCHAR(50) NOT NULL, --NOT NULL Mantigi Bos Birakilmaz
	Strasse VARCHAR (50) NULL, 
	PLZ CHAR (5) NULL,
	ORT VARCHAR(50) NULL,
	AnsprechpartnerNr INT NULL,
	CONSTRAINT FK_Kunde_Ansprechparner
		FOREIGN KEY (AnsprechpartnerNr)
		REFERENCES Ansprechpartner(AnsprechparnetNr)
);

CREATE TABLE KundeTarif (
	KundenTarifNr INT IDENTITY (1,1) PRIMARY KEY, --Hangi Müsterinin Hnagi Tarifeyi Aldigini Gösteren Sözlesme/Kayit Numarasidir (PK)
	KundenNr INT NOT NULL,  -- Tarifeyi alan Müsterinin Numarasidir (FK)
	TarifNr INT NOT NULL, --Alinan Tarifenin Numarasidir
	Startdatum DATE NOT NULL, --Tarife Baslama Tarihi
	Enddatum DATE NULL, --Bitis Tarihi
	CONSTRAINT FK_KundeTarif_Kunde --KundeNr alanini Kunde Tablosuna Baglar
		FOREIGN KEY (KundenNR) 
		REFERENCES Kunde (KundenNr),
	CONSTRAINT Fk_Kunden_Tarif --TarifNr alanini Tarif Tablosuna baglar
		FOREIGN KEY (TarifNr)
		REFERENCES Tarif (TarifNr)
);