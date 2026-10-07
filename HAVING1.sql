USE ProjektDB;	

--AUFGABE 4.12
SELECT pro_id, 
COUNT (mit_id) AS mitarbeiter
FROM Arbeit
GROUP BY pro_id
HAVING COUNT(mit_id) < 4
ORDER BY pro_id DESC;
--------------------------------------------------------------------------------

--AUFGABE  4.13

SELECT mit_id,
COUNT (pro_id) AS Projekte
FROM Arbeit
GROUP BY mit_id
HAVING COUNT (pro_id) > 1;
--------------------------------------------------------------------------

--AUFGABE 4.14
SELECT datum,
SUM (umsatz) AS gesamt_umsatz
FROM Umsatz
GROUP BY datum
HAVING SUM (umsatz) > 5000;
--------------------------------------------------------------------------------------

--AUFGBAE 4.15
SELECT gehalt,
COUNT (mit_id) AS mitarbeiter
FROM Gehalt
GROUP BY gehalt 
HAVING COUNT (mit_id) = 1;
-----------------------------------------------------------------------------

SELECT TOP 1 * FROM Gehalt;

-- 1. Veritabanındaki tüm tabloların adını listeleyelim
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES;



----------------------------AUFGABEN-------------------------------------------------


-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:


-- ======
-- HAVING
-- ======

-- Aufgabe 4.12
--
-- Nennen Sie alle Projekte (pro_id), mit denen weniger als 
-- vier Mitarbeiter befasst sind.
--
--      pro_id  mitarbeiter
--      5       3



-- Aufgabe 4.13
--
-- Finden Sie alle Mitarbeiter, die in mehr als einem Projekt arbeiten.
--
--      mit_id  projekte
--      9031    2
--      10102   2
--      17000   2
--      28559   2
--      29346   2



-- Aufgabe 4.14
-- 
-- Ermitteln Sie die Tage, an denen mehr als 5000 €
-- Umsatz generiert wurde.
--
--      datum       umsatz
--      2018-05-02  15000,00
--      2018-10-11  15000,00
--      2018-11-01  5500,00
--      2019-02-01  150000,00
--      2019-05-01  100150,00



-- Aufgabe 4.15
--
-- Ermitteln Sie, welche Gehälter jeweils nur von genau einem
-- Mitarbeiter bezogen werden.
--
--      gehalt   mitarbeiter
--      1000,00  1
--      2500,00  1
--      4500,00  1
--      6000,00  1


