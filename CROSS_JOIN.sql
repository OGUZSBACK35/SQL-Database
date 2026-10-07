USE ProjektDB;

-- CROSS JOIN SQL 92 Syntax
SELECT *
FROM Mitarbeiter n 
CROSS JOIN Abteilung a;


-- CROSS JOIN, SQL 89- Syntax
SELECT * 
FROM Mitarbeiter, Abteilung;

-- INNER JOIN, SQL 89- Syntax
SELECT *
FROM Mitarbeiter m, Abteilung a
WHERE m.abt_id = a.id;

-- INNER JOIN, SQL 92 Syntax
SELECT *
FROM Mitarbeiter m
	INNER JOIN Abteilung a ON a.id = m.abt_id
	INNER JOIN Gehalt g ON g.mit_id = m.id;

SELECT *
FROM Mitarbeiter m
	INNER JOIN Umsatz u ON u.mit_id = m.id;

SELECT m.id, m.vorname, m.nachname, SUM(u.umsatz) AS umsatz
FROM Mitarbeiter m
	INNER JOIN Umsatz u ON u.mit_id = m.id
--WHERE m.nachname = 'Huber'
GROUP BY m.id, m.vorname, m.nachname;

