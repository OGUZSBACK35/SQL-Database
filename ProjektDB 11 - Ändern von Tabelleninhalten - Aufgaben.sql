-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:


-- ===========
-- INSERT INTO
-- ===========

-- Aufgabe 11.1
--
-- Erstellen Sie eine neue Tabelle mit allen Abteilungen, 
-- die in München ihren Standort haben (Name: MuenchAbt), 
-- und füllen Sie diese mit den entsprechenden Reihen aus der 
-- Tabelle Abteilung. Die Attribute ort und kuerzel werden 
-- in der neuen Tabelle nicht benötigt.
--
--      id  bezeichnung
--      1   Beratung
--      2   Diagnose
--      4   Einkauf



-- Aufgabe 11.2
--
-- Erstellen Sie eine Tabelle aller Sachbearbeiter (Nachname, 
-- Vorname, Abteilungsname), die im Projekt 2 arbeiten, und 
-- füllen Sie diese mit den entsprechenden Reihen aus der 
-- Tabelle Arbeit. Die Tabelle trägt den Namen: SachP2
--
--      nachname  vorname  bezeichnung
--      Keller    Hans     Freigabe
--      Mozer     Sibille  Beratung



-- ======
-- UPDATE
-- ======

-- Aufgabe 11.3
--
-- Ändern Sie die Aufgabe des Mitarbeiters mit der Id 18316 
-- im Projekt 2. Er soll Gruppenleiter dieses Projektes 
-- werden.
--
--      mit_id  pro_id  aufgabe        einst_dat
--      18316   2       Gruppenleiter  2019-06-01



-- Aufgabe 11.4
--
-- Die Finanzmittel aller Projekte sollen geändert und in 
-- Schweizer Franken dargestellt werden. Der augenblickliche 
-- Währungskurs soll bei 1,04170 SFR für 1 EURO liegen.
--
--      id  bezeichnung  mittel     kunde_id
--      1   Apollo       125004,00  3
--      2   Gemini       98961,50   5
--      3   Merkur       194277,05  1
--      4   Pluto        92190,45   4
--      5   Ariane       171880,50  2



-- Aufgabe 11.5
--
-- Die Aufgaben von Frau Huber sollen, wegen längerer Krankheit, 
-- in allen Projekten auf NULL gesetzt werden.
--
--      mit_id  pro_id  aufgabe  einst_dat
--      10102   1       NULL     2018-10-01
--      10102   3       NULL     2019-01-01



-- Aufgabe 11.6
--
-- Erhöhen Sie die Mittel in allen Projekten, abhängig von den
-- bestehenden Mitteln
--   bis 100.000 um 20 %
--   bis 150.000 um 10 %
--   ansonsten um 5 Prozent
-- Versuchen Sie, das mit einem einzigen UPDATE zu erreichen. 
-- Recherchieren Sie dazu den CASE-Ausdruck.
--
--      id  bezeichnung  mittel       kunde_id
--      1   Apollo       137504,40    3
--      2   Gemini       118753,80    5
--      3   Merkur       203990,9025  1
--      4   Pluto        110628,54    4
--      5   Ariane       180474,525   2



-- ======
-- DELETE
-- ======

-- Aufgabe 11.7
--
-- Entfernen Sie alle Gruppenleiter aus den bestehenden 
-- Projekten.



-- Aufgabe 11.8
--
-- Die Mitarbeiterin namens Mozer scheidet aus der Firma 
-- aus. Versuchen Sie den Datensatz von Frau Mozer aus der 
-- Tabelle Mitarbeiter zu entfernen. Was müssen Sie tun?



-- Aufgabe 11.9
--
-- Löschen Sie alle Reihen der Tabelle Arbeit.



-- Aufgabe 11.10
--
-- Starten Sie das Skript zum Erstellen der ProjektDB
-- erneut, um den alten Zustand wiederherzustellen.
