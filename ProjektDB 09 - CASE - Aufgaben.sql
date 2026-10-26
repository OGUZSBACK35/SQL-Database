-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:
USE ProjektDB;
SET LANGUAGE german;

-- ==============
-- CASE-Ausdrücke
-- ==============

-- Aufgabe 9.1
--
-- Geben Sie eine Liste aller Projekte aus, in der 
-- Sie diese nach den verfügbaren Mitteln in 
-- Kategorien einteilen:
--  weniger als  90.000 => Kategorie 1
--  weniger als 135.000 => Kategorie 2
--  weniger als 170.000 => Kategorie 3
--  ab 170.000          => Kategorie 4
--
--      bezeichnung  kategorie
--      Apollo       2
--      Gemini       2
--      Merkur       4
--      Pluto        1
--      Ariane       3



-- Aufgabe 9.2
--
-- Kategorisieren Sie Ihre Mitarbeiter. Mitarbeiter, 
-- die in der Abteilung 'Einkauf' arbeiten, kommen 
-- in Kategorie A. Mitarbeiter aus anderen Abteilungen 
-- kommen in Kategorie B. Aber wer in Landshut oder 
-- Rosenheim wohnt (also auf dem Land), der kommt auf 
-- jeden Fall in Kategorie F.
--
--      id     nachname  ort         bezeichnung  kategorie
--      2581   Kaufmann  NULL        Diagnose     B
--      5765   Schäfer   Landshut    Freigabe     F
--      9031   Meier     NULL        Diagnose     B
--      9912   Wolf      Heidenheim  Einkauf      A
--      10102  Huber     Landshut    Freigabe     F
--      12121  Richter   München     Einkauf      A
--      ...
--      (15 Zeilen)



-- Aufgabe 9.3
--
-- Erweitern Sie die Abfrage aus Aufgabe 9.2. Mitarbeiter 
-- aus der Kategorie b sollen noch feiner unterteilt werden: 
-- Wenn Sie an einem Projekt mit mehr als 100.000 Mitteln 
-- arbeiten, sollen sie in Kategorie B1 fallen, sonst in 
-- Kategorie B2.
--
--      id     nachname  ort         bezeichnung  kategorie
--      2581   Kaufmann  NULL        Diagnose     B1
--      5765   Schäfer   Landshut    Freigabe     F
--      9031   Meier     NULL        Diagnose     B1
--      9912   Wolf      Heidenheim  Einkauf      A
--      10102  Huber     Landshut    Freigabe     F
--      12121  Richter   München     Einkauf      A
--      ...
--      (15 Zeilen)



-- Aufgabe 9.4
-- 
-- Kategorisieren Sie Arbeiter in Ihren Projekten. Wer am
-- Wochenende in ein Projekt eingetreten ist, ist ein
-- Arbeitstier, wer am Montag oder Dienstag angefangen hat 
-- ist fleissig, und der Rest ist ein Faulenzer. Benutzen
-- Sie diesmal CASE. Den Wochentag bekommen Sie mit der
-- Funktion DATENAME(dw, <Datum>).
--
--      einst_dat   wochentag   kategorie
--      2019-10-15  Dienstag    Fleissig
--      2018-07-20  Freitag     Faulenzer
--      2019-04-15  Montag      Fleissig
--      2018-11-15  Donnerstag  Faulenzer
--      2019-01-17  Donnerstag  Faulenzer
--      2018-10-01  Montag      Fleissig
--      ...
--      (20 Zeilen)


