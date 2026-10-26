-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:


-- Aufgabe 23.1
--
-- Nennen Sie die Abteilungsnummern der Mitarbeiter, die 
-- in Projekt 3 arbeiten. Nutzen Sie eine einfache 
-- Unterabfrage.
--
--      abt_id
--      2
--      2
--      3
--      5



-- Aufgabe 23.2
--
-- Erstellen Sie eine Liste der Ids aller Mitarbeiter, 
-- deren Gehalt über dem  Durchschnitt liegt. Nutzen 
-- Sie eine einfache Unterabfrage.
--
--      mit_id
--      5765
--      9031
--      17000
--      22222
--      28559
--      29346



-- Aufgabe 23.3
--
-- Nennen Sie die Namen aller Mitarbeiter, die in einer 
-- Abteilung in Stuttgart arbeiten. Nutzen Sie eine 
-- einfache Unterabfrage.
--
--      nachname  vorname
--      Schäfer   Sabine
--      Huber     Petra
--      Keller    Hans



-- Aufgabe 23.4
--
-- Geben Sie eine Liste der Aufgaben im Projekt 1 aus und 
-- nennen Sie dazu den Namen des Mitarbeiters. Sortieren Sie
-- die Ausgabe nach der Aufgabe. Nutzen Sie eine korrelierte 
-- Unterabfrage im SELECT.
--
--      pro_id  aufgabe         nachname
--      1       NULL            Krüger
--      1       NULL            Mozer
--      1       Gruppenleiter   Meier
--      1       Projektleiter   Huber
--      1       Sachbearbeiter  Probst



-- Aufgabe 23.5
--
-- Geben Sie eine Liste aller Abteilungsnamen aus. Geben 
-- Sie dazu aus, wie viele Mitarbeiter in der Abteilung 
-- arbeiten. Nutzen Sie eine korrelierte Unterabfrage 
-- im SELECT.
--
--      bezeichnung  anzahl
--      Beratung     2
--      Diagnose     3
--      Freigabe     3
--      Einkauf      4
--      Verkauf      3


