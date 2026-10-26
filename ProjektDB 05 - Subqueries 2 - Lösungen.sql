-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:
USE ProjektDB;

-- =========================
-- Korrelierte Unterabfragen
-- =========================

-- Aufgabe 5.9
--
-- Geben Sie eine Liste der Projekt-Ids und Aufgaben aus und 
-- nennen Sie dazu den Namen des Mitarbeiters. Sortieren Sie
-- die Ausgabe nach Projekt-Id und Aufgabe. Nutzen Sie eine
-- korrelierte Unterabfrage im SELECT.
--
--      pro_id  aufgabe         nachname
--      1       NULL            Krüger
--      1       NULL            Mozer
--      1       Gruppenleiter   Meier
--      1       Projektleiter   Huber
--      1       Sachbearbeiter  Probst
--      2       NULL            Probst
--		...
--		(20 Zeilen)

SELECT pro_id, aufgabe,
	(SELECT nachname FROM Mitarbeiter m
	 WHERE m.id = a.mit_id) AS nachname
FROM Arbeit a
ORDER BY pro_id ASC, aufgabe ASC;

-- Aufgabe 5.10
--
-- Erweitern Sie die Abfrage aus Aufgabe 5.9 und geben Sie
-- zusätzlich auch den Projektnamen aus. Nutzen Sie zwei
-- korrelierte Unterabfragen im SELECT.
--
--      pro_id  bezeichnung  aufgabe         nachname
--      1       Apollo       NULL            Krüger
--      1       Apollo       NULL            Mozer
--      1       Apollo       Gruppenleiter   Meier
--      1       Apollo       Projektleiter   Huber
--      1       Apollo       Sachbearbeiter  Probst
--      2       Gemini       NULL            Probst
--		...
--		(20 Zeilen)

SELECT pro_id, 
	(SELECT bezeichnung FROM Projekt p
	 WHERE p.id = a.pro_id) AS bezeichnung,
	aufgabe,
	(SELECT nachname FROM Mitarbeiter m
	 WHERE m.id = a.mit_id) AS nachname
FROM Arbeit a
ORDER BY pro_id ASC, aufgabe ASC;

-- Aufgabe 5.11
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

SELECT bezeichnung,
	(SELECT COUNT(*) FROM Mitarbeiter m
	 WHERE m.abt_id = a.id) AS anzahl
FROM Abteilung a;

-- Aufgabe 5.12
--
-- Geben Sie eine Liste aller Mitarbeiter-Ids mit Gehalt aus.
-- Geben Sie dazu auch den Namen des Mitarbeiters aus. Nutzen
-- Sie eine korrelierte Unterabfrage im SELECT.
--
--      mit_id  nachname  gehalt
--      2581    Kaufmann  3000,00
--      5765    Schäfer   4500,00
--      9031    Meier     4000,00
--      9912    Wolf      3500,00
--      10102   Huber     3500,00
--      12121   Richter   3000,00
--		...
--		(15 Zeilen)

SELECT mit_id, 
	(SELECT nachname FROM Mitarbeiter m
	 WHERE m.id = g.mit_id) AS nachname,
	gehalt
FROM Gehalt g

-- Aufgabe 5.13
--
-- Erweitern Sie die Abfrage aus Aufgabe 5.12 und geben
-- Sie zusätzlich noch das Durschnitts-Gehalt aller 
-- Mitarbeiter aus. Zeigen Sie anschließend noch die
-- Differenz des Mitarbeiters zum Durchschnitt an.
--
--      mit_id  nachname  gehalt   durchschnitt  differenz
--      2581    Kaufmann  3000,00  3633,3333     -633,3333
--      5765    Schäfer   4500,00  3633,3333     866,6667
--      9031    Meier     4000,00  3633,3333     366,6667
--      9912    Wolf      3500,00  3633,3333     -133,3333
--      10102   Huber     3500,00  3633,3333     -133,3333
--      12121   Richter   3000,00  3633,3333     -633,3333
--		...
--		(15 Zeilen)

SELECT mit_id, 
	(SELECT nachname FROM Mitarbeiter m
	 WHERE m.id = g.mit_id) AS nachname,
	gehalt,
	(SELECT AVG(gehalt) FROM Gehalt) AS durchschnitt,
	gehalt - (SELECT AVG(gehalt) FROM Gehalt) AS differenz
FROM Gehalt g

-- Aufgabe 5.14
--
-- Zeigen Sie die Mitarbeiternamen und Abteilungsnamen der 
-- Mitarbeiter an, die im Projekt "Apollo" arbeiten. Nutzen 
-- Sie zwei verschachtelte Unterabfragen und eine korrelierte
-- Unterabfrage im SELECT.
--
--      nachname  abteilung
--      Meier     Diagnose
--      Huber     Freigabe
--      Krüger    Verkauf
--      Mozer     Beratung
--      Probst    Diagnose

SELECT nachname,
	(SELECT bezeichnung FROM Abteilung a
	 WHERE a.id = m.abt_id) AS abteilung
FROM Mitarbeiter m
WHERE id IN (
	SELECT mit_id FROM Arbeit
	WHERE pro_id IN (
		SELECT id FROM Projekt
		WHERE bezeichnung = 'Apollo'
	)
);
