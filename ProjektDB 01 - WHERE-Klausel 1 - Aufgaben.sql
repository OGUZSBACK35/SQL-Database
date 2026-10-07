-- Nutzen Sie die Datenbank ProjektDB, 
-- um die folgenden Aufgaben zu lösen:
USE ProjektDB;

-- =====
-- WHERE
-- =====

-- Aufgabe 1.1
--
-- Finden Sie die Namen und Id aller Abteilungen, 
-- die in München ihren Sitz haben.
--
--      bezeichnung  id
--      Beratung     1
--      Diagnose     2
--      Einkauf      4



-- Aufgabe 1.2
--
-- Nennen Sie die Vor- und Nachnamen aller Mitarbeiter,
-- deren Personalnummer größer oder gleich 20000 ist.
--
--      vorname  nachname
--      Dirk     Fuchs
--      Anke     Vogel
--      Rolf     Schubert
--      Hans     Keller
--      Lena     Albrecht
--      Sibille  Mozer
--      Andreas  Probst



-- Aufgabe 1.3
--
-- Finden Sie alle Projekte, deren Finanzmittel mehr als 
-- 129.960,01 $ betragen. Der fiktive Umrechnungskurs soll 
-- bei 1,083 $ für 1 Euro liegen. Die Mittel des Projekts
-- sind in Euro angegeben!
--
--      id  kuerzel  bezeichnung  mittel     kunde_id
--      3   MK       Merkur       186500,00  1
--      5   AR       Ariane       165000,00  2



-- Aufgabe 1.4
--
-- Gesucht werden Mitarbeiter-Id, Projektnummer und Aufgabe 
-- der Mitarbeiter, die im Projekt 2 Sachbearbeiter sind.
--
--      mit_id  pro_id  aufgabe
--      25348   2       Sachbearbeiter
--      28559   2       Sachbearbeiter



-- Aufgabe 1.5
--
-- Finden Sie die Id, den Umsatz und das Datum für alle 
-- Mitarbeiter, die im Jahr 2018 Umsätze von mindestens 
-- 5000 € hatten.
--
--      mit_id  umsatz    datum
--      10102   5000,00   2018-11-01
--      10102   5000,00   2018-12-23
--      25348   15000,00  2018-05-02
--      25348   15000,00  2018-10-11
--      17000   5000,00   2018-03-03
--      17000   5000,00   2018-03-04
--      17000   5000,00   2018-03-05
--      17000   5000,00   2018-03-06



-- Aufgabe 1.6
--
-- Gesucht wird einmalig die Personalnummer der Mitarbeiter, 
-- die entweder im Projekt 1 oder 5 oder in beiden arbeiten.
--
--      mit_id
--      9031
--      9912
--      10102
--      17000
--      22222
--      28559
--      29346



-- Aufgabe 1.7
--
-- Nennen Sie Personalnummer und Nachnamen der Mitarbeiter, 
-- die nicht in den Abteilungen 2, 3 und 4 arbeiten.
--
--      id     nachname
--      17000  Krüger
--      18316  Müller
--      24321  Schubert
--      27365  Albrecht
--      28559  Mozer



-- Aufgabe 1.8
--
-- Finden Sie alle Mitarbeiter, deren Personalnummer
-- Entweder 29346, 2866 oder 25348 ist.
--
--	id		nachname	vorname		abt_id		ort			chef_id
--	25348		Keller		Hans		3			München		2581
--	28559		Mozer		Sibille		1			Ulm			2581
--	29346		Probst		Andreas		2			Ausburg		2581


-- ERSTE AUFGABE 1.1
USE ProjektDB;
SELECT bezeichnung, id
FROM Abteilung
WHERE ort = 'München';
-------------------------------------------------------------
--2. PERSONALNUMMER 1.2
SELECT vorname, nachname
FROM Mitarbeiter
WHERE id <= 20000;

 --------------------------------------------------------------------
-- AUFGABE 1.3
SELECT *
FROM Projekt
WHERE mittel > 120000;

-------------------------------------------------------------------------
--AUFGABE 1.4
SELECT mit_id, pro_id, aufgabe
FROM Arbeit
WHERE pro_id = 2 AND aufgabe = 'Sachbearbeiter';

-------------------------------------------------------------------------
--AUFGABE 1.5
SELECT mit_id, umsatz, datum
FROM Umsatz
WHERE umsatz >= 5000 
	AND datum BETWEEN '2018-01-01' AND '2018-12-31' ;
	--Alternetif 1: WHERE umsatz <= 5000 AND datum BETWEEN '20180101' AND '20181231';
	--Alternatif 2: WHERE umsatz >= 5000 AND datum >= '20180101' AND datum <= '20181231';
	--Alternatif 3: umsatz >= 5000 AND YEAR (datum) = 2018;

-----------------------------------------------------------------------------------------
--AUFGABE 1.6
SELECT DISTINCT mit_id
FROM Arbeit
WHERE pro_id = 1 OR pro_id = 5;
--Alternatif1:  WHERE pro_id IN (1,5);

---------------------------------------------------------------------------------------------
--AUFGABE 1.7
SELECT *
FROM Projekt
WHERE mittel BETWEEN 100000 AND 250000;

----------------------------------------------------------------------------------------------------
--AUFGABE 1.8
USE ProjektDB;

SELECT *
FROM Mitarbeiter
WHERE id IN (25348, 28559, 29346);

----------------------------------------------------------------------------------------------------------
--AUFGABE 1.9
SELECT *
FROM Mitarbeiter
WHERE ort NOT IN ('München', 'Ulm');

-------------------------------------------------------------------------------------------
--AUFGABE 1.10
SELECT bezeichnung, mittel
FROM Projekt
WHERE  mittel BETWEEN 95000 AND 120000;

--------------------------------------------------------------------------------------------------------------------------
--AUFGABE 1.11
SELECT  mit_id
FROM Arbeit 
WHERE aufgabe = 'Projektleiter'
	AND YEAR(einst_dat) <> 2018;
------------------------------------------------------------

--AUGFABE 1.12
SELECT mit_id, pro_id
FROM Arbeit
WHERE pro_id IN (1,5)
	AND aufgabe IS NULL;
----------------------------------------------------------------------

--AUFGABE 1.13
SELECT mit_id, aufgabe
FROM Arbeit
WHERE pro_id = 5
	AND (aufgabe <> 'Sachbearbeiter' OR aufgabe IS NULL);

--------------------------------------------------------------------------------------
-- AUFGABE 2.1
SELECT nachname, id
FROM Mitarbeiter
WHERE nachname LIKE 'K%';

-------------------------------------------------------------------------------
-- AUFGABE 2.2
SELECT nachname, vorname, id
FROM Mitarbeiter
WHERE vorname LIKE '_a%'; -- alt cizgi (_) Tek Bir Karakter Yer Tutar
-- Yani 1.Harf Herhangi Bir Harf Olabilir.
-- a: 2. Harfi Mutlaka "a" Olmasi Gerektigini Belirtir.
--% (Yüzde) "a" Harfinden Sonra Kac Karakter Gelirse Gelsin Fark Etmez Demektir.
----------------------------------------------------------------------------------------

--AUFGABE 2.3
-- [...]: SQL'de Harf Araligi Belirtmek Icin Köseli Parantez Kullanilir.
SELECT id, ort
FROM Abteilung
WHERE ort LIKE '[N-Zn-z]%' OR ort LIKE '[n-z]%'
------------------------------------------------------------------------------
--AFUGABE 2.4
SELECT id, nachname, vorname 
FROM Mitarbeiter
WHERE nachname NOT LIKE '[K,P]%' AND vorname NOT LIKE 'U%';
------------------------------------------------------------------------------------

--AUFGABE 2.5
SELECT vorname, nachname
FROM Mitarbeiter
WHERE vorname NOT LIKE '%er';
--------------------------------------------------------------------------------

--AUFGABE 2.6
SELECT firma, ort
FROM Kunde
WHERE firma LIKE '%[%]%' 
   OR ort LIKE '%[_]%';
----------------------------------------------------------------------------

--AUFGBAE 2.7
SELECT *
FROM Mitarbeiter
WHERE nachname LIKE '%[aeiou]%[aueiou]%[aeiou]'
	AND vorname NOT LIKE '%a&';
------------------------------------------------------------------------------

-- AUFGABE 2.8
SELECT id, vorname, nachname, abt_id, ort, chef_id
FROM Mitarbeiter
WHERE vorname LIKE '_______';
--ALTERNATIVE: WHERE LEN (vorname) =;
------------------------------------------------------------------------------------

--AUFGABE 2.9
SELECT  id, vorname, nachname, abt_id, ort, chef_id
FROM Mitarbeiter
WHERE vorname LIKE '______[^AEIOaeiou]';
---------------------------------------------

--AUFGABE 2.10
SELECT *
FROM Mitarbeiter
WHERE vorname LIKE '%[AEIOUaeiou]_';
------------------------------------------------------ 

------------------------------------------------------------------------------
--SELECT id, ort 
--FROM Abteilung;
------------------------------------------------------------------------------------

--	SELECT TOP 1 * COLUMN NAME 
--FROM Arbeit;

-----------------------------------------------------------------------------
-- SELECT TABLE_NAME  --TABLE DETAILS 
-- FROM INFORMATION_SCHEMA.TABLES;

-------------------------------------------------------------------------------------------
-- SELECT TOP 1 *  Bu Komut Tablodaki Bütün Sütun Basliklarini Gösterir
-- FROM Mitarbeiter;

--------------------------------------------
 