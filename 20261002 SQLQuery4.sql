USE ProjektDB;

-- GROUP BY ohne Aggregat = DISTINCT
SELECT abt_id
FROM Mitarbeiter
GROUP BY abt_id;

SELECT DISTINCT abt_id
FROM Mitarbeiter;

-- GROUP BY mit Aggregat
SELECT ort, COUNT(*) AS anzahl
FROM Mitarbeiter
GROUP BY ort;

SELECT abt_id, nachname, COUNT(*) AS anzahl  -- geht nicht!
FROM Mitarbeiter
GROUP BY abt_id;

SELECT mit_id, SUM(umsatz) AS umsatz, COUNT(*) AS anzahl
FROM Umsatz
GROUP BY mit_id;

-- GROUP BY mit Funktionen
SELECT YEAR(datum), MONTH(datum), SUM(umsatz) AS umsatz
FROM Umsatz
GROUP BY YEAR(datum), MONTH(datum)
ORDER BY YEAR(datum), MONTH(datum);
