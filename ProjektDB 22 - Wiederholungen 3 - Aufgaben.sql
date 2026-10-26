-- Nutzen Sie die Datenbank ProjektDB,
-- um die folgenden Aufgaben zu lösen.


-- Aufgabe 22.1
--
-- Schreiben Sie eine Abfrage, die Personalnummer,
-- Vorname, Nachname und den Name der Abteilung
-- der Mitarbeiter sortiert nach Personalnummer
-- ausgibt. Geben Sie nur die ersten drei Zeilen
-- aus.
--
--      id      vorname     nachname    bezeichnung
--      2581    Brigitte    Kaufmann    Diagnose
--      5765    Sabine      Schäfer     Freigabe
--      9031    Rainer      Meier       Diagnose



-- Aufgabe 22.2
--
-- Schreiben Sie eine Abfrage, die alle Projekt-Aufgaben 
-- mit den zugehörigen Projekten kombiniert. Geben Sie die
-- Felder pro_id, bezeichnung, mit_id und aufgabe aus. Sortieren 
-- Sie die Ausgabe nach pro_id aufsteigend und mit_id absteigend.
--
--      pro_id  bezeichnung mit_id  aufgabe
--      1       Apollo      29346   Sachbearbeiter
--      1       Apollo      28559   NULL
--      1       Apollo      17000   NULL
--      1       Apollo      10102   Projektleiter
--      1       Apollo      9031    Gruppenleiter 
--      ...
--      (20 Zeilen)



-- Aufgabe 22.3
--
-- Erweitern Sie die Abfrage aus Aufgabe 22.2, indem Sie
-- zusätzlich noch den Nachnamen des Mitarbeiters im
-- Ergebnis mit ausgeben.
--
--      pro_id  bezeichnung mit_id  nachname    aufgabe
--      1       Apollo      29346   Probst      Sachbearbeiter
--      1       Apollo      28559   Mozer       NULL
--      1       Apollo      17000   Krüger      NULL
--      1       Apollo      10102   Huber       Projektleiter
--      1       Apollo      9031    Meier       Gruppenleiter
--      ...
--      (20 Zeilen)



-- Aufgabe 22.4
--
-- Erweitern Sie die Abfrage aus Augfgabe 2.3, indem Sie
-- zusätzlich noch den Namen der Abteilung des Mitarbeiters
-- im Ergebnis anzeigen.
--
--      pro_id  bezeichnung mit_id  nachname    aufgabe         bezeichnung
--      1       Apollo      29346   Probst      Sachbearbeiter  Diagnose
--      1       Apollo      28559   Mozer       NULL            Beratung
--      1       Apollo      17000   Krüger      NULL            Verkauf
--      1       Apollo      10102   Huber       Projektleiter   Freigabe
--      1       Apollo      9031    Meier       Gruppenleiter   Diagnose
--      ...
--      (20 Zeilen)



-- Aufgabe 22.5
--
-- Finden Sie Namen und Vornamen aller Mitarbeiter, 
-- die im Projekt Merkur arbeiten.
--
--      nachname    vorname
--      Kaufmann    Brigitte            
--      Meier       Rainer              
--      Huber       Petra 
--      Schubert    Rolf



-- Aufgabe 22.6
--
-- Nennen Sie Namen und Vornamen aller Projektleiter, deren 
-- Abteilung den Standort München hat.
--
--      nachname    vorname
--      Kaufmann    Brigitte
--      Vogel       Anke            



-- Aufgabe 22.7
--
-- Nennen Sie einmalig die Namen der Projekte, in denen die 
-- Mitarbeiter arbeiten, die ein Gehalt von mindestens 
-- 5.000 € beziehen.
--
--      bezeichnung
--      Apollo
--      Ariane
--      Gemini



-- Aufgabe 22.8
--
-- Finden Sie die Mitarbeiter, die das gleiche Gehalt
-- beziehen. Geben Sie die Personalnummer und das Gehalt
-- einmalig aus.
--
--      mit_id  gehalt
--      2581    3000,00
--      12121   3000,00
--      18316   3000,00
--      24321   3000,00
--      20204   3500,00
--      9912    3500,00
--      10102   3500,00
--      ...
--      (11 Zeilen)



-- Aufgabe 22.9
--
-- Finden Sie die Personalnummer, die Projektnummer
-- und die Aufgabe von Mitarbeitern aus, die die gleiche 
-- Aufgabe im gleichen Projekt ausführen.
--
--      mit_id  pro_id  aufgabe
--      25348   2       Sachbearbeiter
--      28559   2       Sachbearbeiter
--      20204   4       Sachbearbeiter
--      27365   4       Sachbearbeiter



-- Aufgabe 22.10
--
-- Zeigen Sie alle Mitarbeiter der Abteilung 2 mit 
-- Personalnummer und Name an und geben Sie dazu die vom 
-- Mitarbeiter getätigten Umsätze aus. Hat der Mitarbeiter 
-- noch keine Umsätze getätigt, soll in der Spalte Umsatz 
-- eine 0 angezeigt werden.
--
--      id      nachname    umsatz
--      2581    Kaufmann    100000,00
--      9031    Meier       0,00
--      29346   Probst      0,00



-- Aufgabe 22.11
--
-- Verändern Sie die Abfrage aus Aufgabe 22.10, indem Sie
-- jetzt alle Mitarbeiter anzeigen. Gruppieren Sie über
-- die Personalnummer und den Namen und geben Sie die Summe
-- der getätigten Umsätze aus. Wenn keine Umsätze getätigt
-- wurden, soll weiterhin eine 0 erscheinen.
--
--      id      nachname    umsatz
--      2581    Kaufmann    100000,00
--      5765    Schäfer     0,00
--      9031    Meier       0,00
--      9912    Wolf        0,00
--      10102   Huber       18000,00
--      12121   Richter     0,00
--      17000   Krüger      20000,00
--      18316   Müller      0,00
--      ...
--      (15 Zeilen)



-- Aufgabe 22.12
--
-- Verändern Sie die Abfrage aus Aufgabe 22.11, indem Sie
-- nur die Mitarbeiter anzeigen, die noch keine Umsätze 
-- getätigt haben.
--
--      id      nachname    umsatz
--      5765    Schäfer     0,00
--      9031    Meier       0,00
--      9912    Wolf        0,00
--      12121   Richter     0,00
--      18316   Müller      0,00
--      20204   Fuchs       0,00
--      22222   Vogel       0,00
--      24321   Schubert    0,00
--      27365   Albrecht    0,00
--      28559   Mozer       0,00
--      29346   Probst      0,00



-- Aufgabe 22.13
--
-- Finden Sie alle Mitarbeiter mit Personalnummer und
-- Namen, die in keinem Projekt als Sachbearbeiter tätig sind.
--
--      id      nachname
--      2581    Kaufmann
--      5765    Schäfer
--      10102   Huber
--      12121   Richter
--      17000   Krüger
--      18316   Müller
--      22222   Vogel
--      24321   Schubert


