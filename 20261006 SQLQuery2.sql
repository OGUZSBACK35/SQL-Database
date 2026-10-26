USE ProjektDB;

-- Unterabfrage in SELECT-Klausel
-- skalare, korrelierte Unterabfrage
SELECT vorname, nachname, 
	(SELECT bezeichnung FROM Abteilung a
	 WHERE a.id = m.abt_id) AS abteilung,
	(SELECT gehalt FROM Gehalt g
	 WHERE g.mit_id = m.id) AS gehalt
FROM Mitarbeiter m;

-- Unterabfrage in WHERE -Klausel
-- 1.Schritt
SELECT id FROM Abteilung
WHERE ort = 'München'

-- 2.Schritt
SELECT vorname, nachname
FROM Mitarbeiter
WHERE abt_id IN (1, 2, 4);

-- In einem Schritt mit Subquery
-- mehrwertige, selbständige Unterabfrage
SELECT vorname, nachname
FROM Mitarbeiter
WHERE abt_id IN (SELECT id FROM Abteilung
				 WHERE ort = 'München');


-- skalare, korrelierte Unterabfrage
SELECT vorname, nachname
FROM Mitarbeiter m
WHERE (SELECT COUNT(*) FROM Umsatz u
       WHERE u.mit_id = m.id) > 5;

-- das gleiche mit selbständiger UA
SELECT mit_id
FROM Umsatz
GROUP BY mit_id
HAVING COUNT(*) > 5;

SELECT vorname, nachname
FROM Mitarbeiter
WHERE id IN (10102, 25348);

SELECT vorname, nachname
FROM Mitarbeiter
WHERE id IN (
	SELECT mit_id FROM Umsatz
	GROUP BY mit_id HAVING COUNT(*) > 5
);

-- Mitarbeiter die PL sind
SELECT vorname, nachname
FROM Mitarbeiter
WHERE id IN (
	SELECT mit_id FROM Arbeit
	WHERE aufgabe = 'Projektleiter'
		AND pro_id IN (
			SELECT id FROM Projekt
			WHERE bezeichnung = 'Apollo'
		)
);
