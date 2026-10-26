-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:
USE ProjektDB;

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

SELECT MIN(id) AS minimum
FROM Mitarbeiter;

-- Aufgabe 4.2
--
-- Berechnen Sie die Summe der finanziellen Mittel aller Projekte.
--
--      summe
--		---------
--      655000,00

SELECT SUM(mittel) AS summe
FROM Projekt;

-- Aufgabe 4.3
--
-- Berechnen Sie den arithmetischen Mittelwert der Geldbeträge, 
-- die höher als 92336,10 Euro sind.
--
--      durchschnitt
--		------------
--      141625,00

SELECT AVG(mittel) AS durchschnitt
FROM Projekt
WHERE mittel > 92336.1;

-- Aufgabe 4.4
--
-- Ermitteln Sie den höchsten, einzelnen Umsatz, der bisher erzielt wurde.
--
--      umsatz
--		---------
--      150000,00

SELECT MAX(umsatz) AS umsatz
FROM Umsatz;

-- Aufgabe 4.5
--
-- Ermitteln Sie den kleinsten, einzelnen Umsatz, der 
-- im Jahr 2018 erzielt wurde.
--
--		umsatz
--		------
--		500,00

SELECT MIN(umsatz) AS umsatz
FROM Umsatz
WHERE YEAR(datum) = 2018;
