USE ProjektDB;

SELECT mit_id, SUM(umsatz) AS umsatz
FROM Umsatz
--WHERE SUM(umsatz) < 100000	-- geht nicht!
GROUP BY mit_id
HAVING SUM(umsatz) < 100000;		-- das geht!


SELECT mit_id, SUM(umsatz) AS umsatz
FROM Umsatz
GROUP BY mit_id
HAVING YEAR(datum) = 2018;		-- geht nicht!


SELECT mit_id, SUM(umsatz) AS umsatz
FROM Umsatz
WHERE YEAR(datum) = 2018		-- "normale" Daten filtern
GROUP BY mit_id
HAVING SUM(umsatz) < 100000		-- Aggregate filtern
ORDER BY mit_id DESC;			-- nur Aggregate oder aus GROUP BY
