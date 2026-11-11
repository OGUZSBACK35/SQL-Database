-- @minGehalt adinda INT turunde degisken tanimlar
DECLARE @minGehalt INT; -- Degisken Tanimlar

SET @minGehalt = 4000; -- SET Degiskene Deger Atar

-- Maasi 4000'den az olan Mitarbeiter kayitlarini getirir
SELECT vorname, nachname
FROM Mitarbeiter
WHERE gehalt < @minGehalt;
-----------------------------------------------------------------------------------------------

DECLARE @zahl1 int = 11, @zahl2 int = 22; -- -- Iki adet INT degisken tanimlar ve deger atar
DECLARE @ergebnis int;

SET @ergebnis = @zahl1 + @zahl2; -- Iki sayiyi toplar ve sonucu degiskene aktarir

PRINT @ergebnis; -- Sonucu ekrana yazdirir

-- Ausgabe im Ergebnisfenster
SELECT @ergebnis;

-- Kombinierte Ausgabe
PRINT 'Das Ergebnis Lautet:' + CAST(@ergebnis AS VARCHAR(10)); -- Sonucu metne cevirerek aciklama ile birlikte yazdirir
-- CAST, Bir Degeri Baska Bir Veri Türüne Dönüstürür.

-- Ende Batch
GO
---------------------------------------------------------------------------------------------------

-- Deklaration und Initialisierung
DECLARE @zahl TINYINT = 42; -- TINYINT kücük tam sayilari tutan veri türüdür

-- Die IF-/ELSE Anweisung
IF @zahl = 42 -- Deger 42 ise ilk mesaji yazdirir
	BEGIN
		PRINT '@zahl = 42';
	END

ELSE
	BEGIN
		PRINT '@zahl <> 42';  -- Deger 42 degilse ikinci mesaji yazdirir
	END	

-- Nach der IF/ELSE- Anweisung geht es normal weiter
-- IF/ELSE sonrasinda bu mesaj her durumda yazdirilir
PRINT 'Das ist das Ende';

-- Vershachteltes IF/ELSE
-- Deklaration der Variablen
DECLARE @KundenTyp VARCHAR(20) = 'Premium'; -- Musteri tipini metin olarak tanimlar
DECLARE @BestellWert DECIMAL (10,2) = 150.00; -- Siparis tutarini 2 ondalik basamakla tanimlar
DECLARE @Rabatt DECIMAL (5,2);


-- Äussere Verzweigung: Prüfung des Kundentyps
-- KundenTyp Premium ise mesaji yazdirir
IF @KundenTyp = 'Premium'
BEGIN
	PRINT 'Kunde ist Premium-Mitglied';

-- Innere Verzweigung (Verschachtelung 1): Bestellwert beit Premium Prüfen
IF @BestellWert >= 200.00 -- Siparis tutari 200 veya daha fazlaysa 
	BEGIN
		SET @Rabatt = 0.20; -- %20 indirim tanimlar
	END 

ELSE -- Siparis tutari 200'den azsa 
	BEGIN
		SET @Rabatt = 0.10; -- %10 indirim tanimlar
	END
END
ELSE 
BEGIN
	PRINT 'Kunde ist Standart-Mitglied.'


-- Innere Verzweigung (Verschatelung 2): Bestellwert bei Standard Prüfen
	IF @BestellWert <= 100.00
	BEGIN
		SET @Rabatt = 0.05; -- %5 Rabatt
	END
	ELSE 
	BEGIN
		SET	@Rabatt = 0.00; -- Kein Rabatt
	END
	END;

-- Ausgabe des Finalen Ergebnisses
PRINT 'Der Gewährte Rabatt Beträgt:' + CAST((@Rabatt *100) AS VARCHAR(5)) + '%'; 
GO
-- einfaches CASE
-- Deklaration der Variablen
DECLARE @zahl INT = 40; -- @zahl adinda INT degiskeni tanimlar ve 40 degerini atar
DECLARE @text VARCHAR(35); -- Sonuc metnini tutacak degiskeni tanimlar

--Text Für die Ausgabe Auswählen
-- @zahl degerine gore uygun metni secer
SET @text = CASE @zahl 
WHEN 42 THEN 'Treffer!'
WHEN 41 THEN 'Ein kleines bisschen zu wenig.'
WHEN 43 THEN 'Einkleines bisschen zu viel.'
ELSE 'Voll daneben'
END;

-- Ausgabe
PRINT @text -- @text degiskenindeki metni ekrana yazdirir
GO -- Batch'i sonlandirir

-- komplexes CASE
-- Deklaration der Variablen
DECLARE @zahl INT = 42; -- @zahl ve @text degiskenlerini tanimlar
DECLARE @text VARCHAR(35); -- @zahl degerine gore uygun metni secer

-- Tect für Ausgabe Auswählen
SET @text = CASE
WHEN @zahl = 42 THEN 'Treffer!'
WHEN ABS(42 - @zahl) <= 2 THEN 'Nah Dran ...'
WHEN @zahl % 2 = 0 THEN 'Immerhin Gerade ...'
ELSE 'Voll daneben!'
END;

--Ausgabe 
PRINT @text -- Secilen metni ekrana yazdirir
GO -- Batch'i sonlandirir

-- Beispiel WHILE Schleife
-- Deklaration
DECLARE @zahl TINYINT = 2; -- @zahl degiskenini 2 olarak baslatir

-- Schleife
WHILE @zahl < 42 -- @zahl 42'den kucuk oldugu surece donguyu calistirir
BEGIN 
	PRINT 'Wird Sind Aktuell bei ' + CAST(@zahl AS CHAR(2)) -- Mevcut sayiyi ekrana yazdirir
	SET @zahl = @zahl + 1;  -- Sayiyi bir artirir
END

-- Ausgabe am Ende
IF @zahl = 42 -- Dongu bittikten sonra sonucu kontrol eder
	PRINT 'Wir haben es geschafft; ' + CAST(@zahl AS CHAR(2));
	-- CAST bir degeri baska bir veri türüne dönüstürür
ELSE 
	PRINT 'Wir Wollten zu Hoch hinaus ...';
GO

-- While-Schleife mit Break und Continue
DECLARE @zaehler INT = 0; -- Sayac degiskenini 0 olarak baslatir

WHILE @zaehler < 10 -- Sayac 10'dan kucuk oldugu surece donguyu calistirir

BEGIN
	SET @zaehler = @zaehler +1;     -- Sayaci bir artirir


	-- 1. Beispiel für Continue:
	-- Übersprince alle Zahlen, die glatt durch 3 teilbar sind.
	IF @zaehler % 3 = 0         -- 3'un katlarini ekrana yazdirir

	BEGIN
		PRINT '--- Überspringe Vielfaches von3:' + CAST(@zaehler AS VARCHAR(2)) + '---';
		CONTINUE -- Dongunun kalan kismini atlayip basa doner

	END

	-- 2. Beispiel Für BREAK:
	-- Die Schleife soll sofort komplett abgebrochen werden, wenn Zähler 8 erreicht:

-- Deklaration
-- Iki sayisal degisken tanimlar
DECLARE @zahl1 TINYINT = 10;
DECLARE @zahl2 TINYINT = 0;
BEGIN TRY
	PRINT 'Addition';
	SELECT @zahl1 + @zahl2;
	PRINT 'Subtraktion:';
	SELECT @zahl1 - @zahl2;
	PRINT 'Division:';   
	SELECT @zahl1 / NULLIF  (@zahl2,0); -- @zahl2 sifirsa NULL dondurur ve hata olusmaz
	PRINT 'Multiplikation:';
	SELECT @zahl1 * @zahl2;
END TRY
BEGIN CATCH   -- TRY blogunda hata olusursa calisir
	PRINT 'Im CATCH-Block';
END CATCH -- TRY veya CATCH sonrasinda calisir
	PRINT 'Fertig';
GO


BEGIN TRY -- Hata olusabilecek kodu dener
SELECT 1/0; -- Sifira bolme hatasi olusturur
END TRY
BEGIN CATCH
-- Hatayla ilgili bilgileri getirir
SELECT
	ERROR_NUMBER() AS errNum,
	ERROR_SEVERITY() AS errSev,
	ERROR_STATE() AS errState,
	ERROR_PROCEDURE() AS errProc,
	ERROR_LINE() AS errLine,
	ERROR_MESSAGE() AS errMess
END CATCH 
GO



