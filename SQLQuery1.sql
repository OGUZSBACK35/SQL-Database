USE ProjektDB

SELECT * 
FROM Mitarbeiter

--Projektion
SELECT id, vorname, ort
FROM Mitarbeiter;

SELECT id,LEFT(vorname,1) AS Erste_Zeichnen
From Mitarbeiter;

--Selektion
SELECT * 
FROM Mitarbeiter
WHERE abt_id = 5 AND ort IS NULL;

SELECT * 
FROM Mitarbeiter
WHERE LEFT (vorname,1) = 'A';

--Projekt und Selektion
SELECT vorname, nachname
FROM Mitarbeiter
WHERE ort = 'München';

--NULL / NOT NULL
SELECT *
FROM Mitarbeiter
WHERE ort = NULL; -- Funktioniert Nicht

SELECT *
FROM Mitarbeiter
WHERE ort IS NULL;

-- IN und BETWEEN
SELECT *
FROM Mitarbeiter
WHERE ort NOT IN ('München', 'Ulm', 'Landhsut') OR ort IS NULL;

SELECT *
FROM Mitarbeiter
WHERE id  NOT BETWEEN 10000 AND 2000; 

--DISTINCT
SELECT DISTINCT abt_id, 
FROM Mitarbeiter;
