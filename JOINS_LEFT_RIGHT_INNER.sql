USE ProjektDB;

SELECT m.id, SUM(u.umsatz) AS umsatz
FROM Mitarbeiter M
	INNER JOIN Umsatz u ON u.mit_id = m.id
GROUP BY m.id;

SELECT m.id, COALESCE (SUM(u.umsatz), 0) AS umsatz
FROM Mitarbeiter M
	LEFT JOIN Umsatz u ON u.mit_id = m.id
GROUP BY m.id;

--LEFT vs RIGHT
SELECT *
FROM Kunde k
	LEFT JOIN Projekt p ON p.kunde_id = k.id;

SELECT *
FROM Projekt p 
	RIGHT JOIN Kunde k ON k.id = p.kunde_id;

-- WHERE vs ON im LEFT JOIN
-- INNER JOIN

SELECT*
FROM Mitarbeiter m	
	INNER JOIN Umsatz u ON u.mit_id = m.id
WHERE u.umsatz > 5000;

SELECT*
FROM Mitarbeiter m	
	INNER JOIN Umsatz u ON u.mit_id = m.id AND u.umsatz > 5000;

-- LEFT  JOIN 
SELECT* 
FROM Mitarbeiter m
	LEFT JOIN Umsatz u ON u.mit_id = m.id AND u.umsatz > 5000;