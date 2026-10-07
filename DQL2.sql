USE ProjektDB;

-- Unterabfrage in SELECT-Klausel
-- Skalare, korrelierte Unterabfrage
SELECT vorname, nachname, 
	(SELECT bezeichnung FROM Abteilung AS a
	WHERE a.id = m.abt_id) AS abteilung,
	(SELECT gehalt FROM Gehalt g
	WHERE g.mit_id = m.id) AS gehalt
FROM Mitarbeiter AS  m;

-- Unterabfrage in WHERE -Klauser
-- 1. Schritt
SELECT id FROM Abteilung
WHERE ort = 'München'

-- 2. Schritt
SELECT vorname, nachname
FROM Mitarbeiter
WHERE abt_id IN (1, 2, 4);

-- In einem Schritt mit Subquery
-- Mehrvertigr, Selbständige Unterabfrage
SELECT vorname, nachname
FROM Mitarbeiter
WHERE abt_id IN (SELECT id FROM Abteilung
				 WHERE ort = 'München');


-- Skalare, Korrelierte Unterabfrage
SELECT vorname, nachname,
	(SELECT COUNT (*) FROM Umsatz u
		WHERE u.mit_id = m.id) AS anzhal
FROM Mitarbeiter m
WHERE (SELECT COUNT (*) FROM Umsatz u
		WHERE u.mit_id = m.id) > 5;


-- Das Gleiche mit Selbständiger UA
SELECT mit_id, COUNT (*)
FROM Umsatz
GROUP BY mit_id
HAVING COUNT (*) > 5;

SELECT vorname, nachname
FROM Mitarbeiter
WHERE id IN (10102, 25348);

SELECT vorname, nachname
FROM Mitarbeiter
WHERE id IN (
	SELECT mit_id FROM Umsatz
	GROUP BY mit_id HAVING COUNT(*) > 5
	);

	-- Mitarbeiter die Projektleiter sind 
	SELECT vorname, nachname
	FROM Mitarbeiter
	WHERE id IN (
		SELECT mit_id FROM Arbeit
		WHERE aufgabe = 'Projektleiter'
		AND pro_id IN (
			SELECT id FROM Projekt
			WHERE bezeichnung = 'Apollo')
	);