-- Funktion um NULL abzufangen und eine Zeihkette als Wert eintragen

SELECT id, nachname, ISNULL(ort, 'kein Ort') -- Stündaki NULL Degerleri 
-- kein Ort metniyle degistirir.
FROM Mitarbeiter;

-- In einfacher Anwendungsweise geht das auch mit COELESCE
--COALESCE null olmayan ifadeleri döndürür
SELECT id, nachname, 
COALESCE (ort, 'kein Ort') AS Ort -- ort NULL ise 'kein Ort' degerini gosterir
FROM Mitarbeiter


-- Mitarbeiter bilgilerini getirir; once proje adini, sonra ort bilgisini,
-- ikisi de NULL ise '-k.A-' degerini gosterir.
SELECT m.id, m.nachname, 
COALESCE(p.bezeichnung, m.ort, '-k.A-') AS Angbae
FROM Mitarbeiter m
LEFT JOIN Arbeit a ON a.mit_id = m.id AND a.aufgabe = 'Projektleiter'
LEFT JOIN Projekt p ON p.id = a.pro_id;

--Funktion TRIM() entfernt Leerzeich von Links und Rechts der Zeichkette
--TRIM() fonksiyonu, metnin solundaki ve sagindaki bosluklari kaldirir.
SELECT '	Hallo	' AS Ruf

--Anwendungsfall von TRIM() bei CONCAT(), zusammenführen von Zeichketten, um
--saubere Spalten ohne Leerzeichnen zu erkhalten
-- TRIM() fonksiyonu CONCAT ile kullanimi; metinleri birlestirerek bosluksuz temiz sütun saglar
SELECT CONCAT_WS('-', TRIM(vorname), TRIM(nachname), TRIM(ort)) AS Name

FROM Mitarbeiter;



--CONCAT_WS('-'...) degerleri -isaretleriyle birlestirir ve bas son bosluklari temizler
--LEN (vorname+nachname) karakter uzunlugunu gösterir
SELECT CONCAT_WS('-', TRIM(vorname), TRIM(nachname), TRIM(ort)) AS Name,
	LEN(vorname+nachname) AS LängerVorn
FROM Mitarbeiter;

-- CONCAT_WS Ad, soyad, ve konumu - ile birlestirir
-- LEN Ad ve Soyad karakter uzunlugunu hesaplar
-- DATALENGTH vorname degerini byte olarak kapladigi alani hesaplar
-- UPPER(vorname) Adi Büyük Harfe Cevirir
-- LOVER(vorname) Adi Kücük Harfe Cevirir
-- LEFT(vorname, 3) Soldan ilk 3 karakteri alir.
-- RIGHT(vorname, 3) Sadan son 3 karakteri alir
-- SUBSTRING(vorname, 2, 4) 2. karakterden baslayarak 4 karakter alir
SELECT CONCAT_WS('-', TRIM(vorname), TRIM(nachname), TRIM(ort)) AS Name,
	LEN(vorname+nachname) AS LängerVorn,
	DATALENGTH(vorname) AS LängerByteVorn,
	UPPER(vorname) AS Großvorn,
	LOWER(vorname) AS Kleinbvor,
	LEFT(vorname, 3) AS VronBis3,
	RIGHT(vorname, 3) AS VornRechts3Bust,
	SUBSTRING(vorname, 2, 4 ) AS TeilstringVON_Bis
	
FROM Mitarbeiter;

-- Datumsfunktionen
-- Aktuelle Datum
-- GETDATE() Gecerli tarih ve saati dateitime türüne getirir
-- SYSDATETIME() Gecerli tarih ve saati daha yüksesk hassasiyetle datetim2 türüne getirir.
SELECT GETDATE() AS Zeitstempel,
		SYSDATETIME() AS Zeitstempel_datetime2

-- einst_dat tarihini ve haftanin gununu gosterir
-- Tarihten yil, ay, hafta, gun adi ve haftanin gun numarasini getirir
SELECT einst_dat,
DATENAME(YEAR, einst_dat) AS wochentag,
DATENAME(MONTH, einst_dat) AS monat,
DATENAME(WEEK, einst_dat) AS woche,
DATENAME(DAY, einst_dat) AS Tag,
DATEPART(dw, einst_dat) wochentah_zahl
FROM Arbeit;

-- Suchstring einer einer Spalte mit Zeichketten
-- nachname icinde 'r' harfinin bulundugu ilk konumu getirir
SELECT id, nachname,
PATINDEX('%r', nachname) AS NanaMitSuche
FROM Mitarbeiter;


-- Aktuel tarihe 1 yil ekler ve sonucu gosterir -1 Yazarsan bir yil cikarir
-- Aktuel tarihe 1 yil ekler ve 26.10.2026 ile bugun arasindaki gun farkini hesaplar 
SELECT DATEADD(year, 1, GETDATE()) AS akDatumPlusJahr,
DATEDIFF(day, '20261026', GETDATE()) AS DauerModul; 

-- Datentypen umwandeln
-- CAST ile tarih ve saat sadece tarih formatina donusturulur; 
--  ,.GETDATE() ise tarih ve saati gosterir
SELECT CAST(GETDATE() AS DATE) AS datum, GETDATE() AS aktDat;