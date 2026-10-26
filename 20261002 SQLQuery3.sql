USE ProjektDB;

SELECT MIN(gehalt) AS mini, 
	MAX(gehalt) AS maxi, 
	AVG(gehalt) AS durch
FROM Gehalt;

SELECT SUM(gehalt) AS summe,
	SUM(DISTINCT gehalt) AS einmalig
FROM Gehalt;

SELECT COUNT(*) AS alle,
	COUNT(ort) AS orte,
	COUNT(DISTINCT ort) AS eindeutige_orte
FROM Mitarbeiter;

SELECT COUNT(*) AS anzahl, nachname -- geht nicht!
FROM Mitarbeiter;


SELECT COUNT(*) AS anzahl, STRING_AGG(nachname, ', ') AS namen
FROM Mitarbeiter;
