USE ProjektDB;

SELECT MIN(gehalt) AS mini,
	MAX (gehalt) AS maxi, 
	AVG (gehalt)  AS DURCH
FROM Gehalt;
-----------------------------------
SELECT SUM (gehalt) AS summe,
	SUM (DISTINCT gehalt) AS einmalig
---------------------------------------
SELECT COUNT (*) AS alle,
	COUNT (ort) AS orte,
	COUNT (DISTINCT ort) AS eindeutihe_orte
FROM Mitarbeiter;
-----------------------------------------------
SELECT COUNT (*) AS anzahl, nachname --Geht Nicht!
FROM Mitarbeiter;
------------------------------------------------------
SELECT COUNT (*) AS anzahl, STRING_AGG(nachname, ', ') AS namen
FROM Mitarbeiter;
-------------------------------------------------------------

-- AGG AUFGABE 4.1
SELECT MIN (id) AS minimum
FROM Mitarbeiter;
--------------------------------------------

-- AGG AUFGABE 4.2
SELECT SUM (mittel) AS summe
FROM Projekt;
---------------------------------------------------

-- AGG AUFGABE 4.3
SELECT MAX (mittel) AS durchschnitt
FROM Projekt;
---------------------------------------------------------

-- AGG AUFGABE 4.4
SELECT MAX (Umsatz) AS umsatz
FROM Umsatz;
-------------------------------------------------------------

-- AUFGABE 4.5
SELECT MIN (Umsatz) AS umsatz
FROM Umsatz
WHERE YEAR (datum) = 2018;
---------------------------------------------------------------------
SELECT TOP 1 *  -- AS = Umbennen
FROM Projekt;

---------------------------FRAGEN----------------------------------------------

-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:


-- ==================
-- Aggregatfunktionen
-- ==================

-- Aufgabe 4.1
--
-- Nennen Sie die kleinste Personalnummer der Mitarbeiter.
--
--      minimum
--		-------
--      2581



-- Aufgabe 4.2
--
-- Berechnen Sie die Summe der finanziellen Mittel aller Projekte.
--
--      summe
--		---------
--      655000,00



-- Aufgabe 4.3
--
-- Berechnen Sie den arithmetischen Mittelwert der Geldbeträge, 
-- die höher als 92336,10 Euro sind.
--
--      durchschnitt
--		------------
--      141625,00



-- Aufgabe 4.4
--
-- Ermitteln Sie den höchsten, einzelnen Umsatz, der bisher erzielt wurde.
--
--      umsatz
--		---------
--      150000,00



-- Aufgabe 4.5
--
-- Ermitteln Sie den kleinsten, einzelnen Umsatz, der im Jahr 2018 erzielt wurde.
--
--		umsatz
--		------
--		500,00


