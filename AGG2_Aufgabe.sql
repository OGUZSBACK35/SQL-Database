USE ProjektDB;

SELECT abt_id
FROM Mitarbeiter
GROUP BY abt_id;
-------------------------------------------------
SELECT DISTINCT abt_id
FROM Mitarbeiter;
-----------------------------------------------------
SELECT abt_id, COUNT(*) AS anzahl
FROM Mitarbeiter
GROUP BY abt_id;
----------------------------------------------------------
SELECT abt_id, nachname, COUNT(*) AS anzahl --Geht Nicht!
FROM Mitarbeiter
GROUP BY abt_id,;
-------------------------------------------------------------
SELECT datum, SUM (umsatz) AS umsatz
FROM Umsatz
GROUP BY datum;
---------------------------------------------------------------
--GROUP BY mit Funktionen
SELECT YEAR (datum), MONTH (datum), SUM (umsatz) AS umsatz
FROM Umsatz
GROUP BY YEAR (datum), MONTH (datum)
ORDER BY YEAR (datum), MONTH (datum);
------------------------------------------------------------------
 
 -- GROUP BY AUFGABE 4.7
 SELECT pro_id,
 COUNT (DISTINCT aufgabe) AS anzahl
 FROM Arbeit
 GROUP BY pro_id;
 -------------------------------------------------------------------------
 -- GROUP BY AUFGABE 4.8
 SELECT pro_id,
 COUNT (mit_id) AS anzahl
 FROM Arbeit
 GROUP BY pro_id;
 ---------------------------------------------------------------------

 -- GROUP BY AUFGABE4.9
 SELECT mit_id,
 COUNT (aufgabe) AS anzahl
 FROM Arbeit
 WHERE mit_id > 20000
 GROUP BY mit_id;
 -------------------------------------------------------------------------

 -- GROUP BY AUFGABE 4.10
  SELECT YEAR (einst_dat) AS Jahr,
  COUNT (*) AS Anzhal
  From Arbeit
  GROUP BY YEAR (einst_Dat);
  -- ALTERNATIVE: SELCET YEAR  (einst_dat) AS Jahr, COUNT (DISTINCT mit_id) AS Anzahl
  ---------------------------------------------------------------------------------------------------------------

  ----------------------AUFGABEN------------------------------------------------------------------------------

  
SELECT TOP 1 * 
FROM Projekt;

  -- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen


-- ==================================
-- Aggregatfunktionen mit Gruppierung
-- ==================================

-- Aufgabe 4.7
--
-- Finden Sie heraus, wie viele verschiedene Aufgaben in jedem 
-- Projekt ausgeübt werden. Nullwerte sollen nicht gezählt werden!
--
--      pro_id  anzahl
--      1       3
--      2       1
--      3       3
--      4       3
--      5       2



-- Aufgabe 4.8
--
-- Finden Sie heraus, wieviele Mitarbeiter in jedem Projekt arbeiten.
--
--      pro_id  anzahl
--      1       5
--      2       4
--      3       4
--      4       4
--      5       3



-- Aufgabe 4.9
--
-- Gruppieren Sie die Reihen der Tabelle “Arbeit“ nach den 
-- vorhandenen Aufgaben und zählen Sie die Anzahl der Mitarbeiter 
-- abhängig von der jeweiligen Aufgabe.
--
--      aufgabe         anzahl
--      NULL            5
--      Gruppenleiter   3
--      Projektleiter   4
--      Sachbearbeiter  7



-- Aufgabe 4.10
--
-- Wie viele echte Aufgaben nehmen die Mitarbeiter wahr,
-- deren Id größer als 20000 ist
--
--      mit_id  anzahl
--      20204   1
--      22222   1
--      24321   0
--      25348   1
--      27365   1
--      28559   1
--      29346   1



-- Aufgabe 4.11
--
-- Zählen Sie, wie viele Mitarbeiter in jedem Jahr für mindestens
-- ein Projekt eingestellt wurden.
--
--      Jahr  Anzahl
--      2017  2
--      2018  8
--      2019  8



