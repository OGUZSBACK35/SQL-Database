-- Daten einfügen Tabelle Mannschaft
INSERT INTO Mannschaft (id, bezeichnung) VALUES
	(1, 'FC Schlumpfhausen'),
	(2, 'BVB Heimat08'),
	(3, 'Holsterhausen');

-- Daten einfügen Tabelle Trainer
INSERT INTO Trainer VALUES
	('Bossmann', '19511025', 0815, 1),
	('Lusche', '19990412', 0816, 3),
	('Eddi', '19780917', 0815, 2);


-- Daten einfügen Tabelle Spieler
INSERT INTO Spieler(id, _name, geburtsdatum, spielerpass, mannschaft_id) VALUES
	(1, 'Holzer', '19990214', 041, 2),
	(2, 'Hacker', '20050305', 042, 2),
	(3, 'Kicker', '20000102', 043, 1);
-- Daten einfügen Tabelle Spiel
INSERT INTO Spiel (id, gegner, spieltag) VALUES
	(1, 'Schlumpfhausen-Heimat', '20250214'),
	(2, 'Schlumpfhausen-Holsterhausen', '20250218'),
	(3, 'Heimat-Holsterhausen', '20250327');

-- Daten einfügen Tabelle SpielerSpiel
INSERT INTO SpielerSpiel (spieler_id, spiel_id, position, einsatzzeitMin) VALUES
	(1, 1, 'Torwart', 0),
	(2, 1, 'Verteidiger', 0),
	(3, 1, 'Mittelfeld', 0);
