USE ProjektDB;

SELECT * 
FROM Mitarbeiter;

-- Projektion
SELECT id, vorname, ort AS stadt
FROM Mitarbeiter;

SELECT id, LEFT(vorname, 1) AS Erstes_Zeichen
FROM Mitarbeiter;

-- Selektion
SELECT *
FROM Mitarbeiter
WHERE abt_id = 5 AND ort IS NULL;

SELECT *
FROM Mitarbeiter
WHERE LEFT(vorname, 1) = 'A';

-- Projektion und Selektion
SELECT vorname, nachname
FROM Mitarbeiter
WHERE ort = 'München';

-- NULL / NOT NULL
SELECT *
FROM Mitarbeiter
WHERE ort = NULL;	-- funktioniert nicht

SELECT *
FROM Mitarbeiter
WHERE ort IS NULL;

-- IN und BETWEEN
SELECT *
FROM Mitarbeiter
WHERE ort NOT IN ('München', 'Ulm', 'Landshut') OR ort IS NULL;

SELECT *
FROM Mitarbeiter
WHERE id NOT BETWEEN 10000 AND 25000;
--WHERE id < 10000 OR id > 25000;

-- DISTINCT
SELECT DISTINCT abt_id, ort
FROM Mitarbeiter;

