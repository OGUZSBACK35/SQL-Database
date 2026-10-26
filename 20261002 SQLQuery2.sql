USE ProjektDB;

-- TOP-Klausel
SELECT *
FROM Mitarbeiter
ORDER BY ort ASC;

SELECT TOP (1) *
FROM Mitarbeiter
ORDER BY vorname DESC;

SELECT TOP (1) WITH TIES *
FROM Mitarbeiter
ORDER BY abt_id DESC;

-- OFFSET/FETCH-Klausel
SELECT *
FROM Mitarbeiter
ORDER BY id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
