	 --SELECT COUNT (*) -- COUNT ile Satır Saydırma Yapılır
	 
	 
	 
	 SELECT  MIN(TOTALPRICE), MAX (TOTALPRICE), COUNT(*), SUM(TOTALPRICE), AVG(TOTALPRICE) -- SUM/COUNT Yaparsak = AVG'nin Cevabını Manuel Bulabiliriz 
	 --SELECT MAX (AMOUNT) -- Adet'i AGG MAX Şeklinde Tek Bir Satırda da Görebiliriz.| MAX (AMOUNT), MIN(AMOUNT), COUNT(*) Şeklinde Yanyana da Yazılabilir   
	 --SELECT MIN(AMOUNT) -- Adet'i AGG MIN Şeklinde Tek Bir Satırda da Görebiliriz | MAX (AMOUNT), MIN(AMOUNT), COUNT(*)
	 -- MAX (AMOUNT), MIN(AMOUNT), COUNT(*) Örnekteki gibi
	 FROM SALES WHERE CITY = 'ADANA'
	 --ORDER BY AMOUNT -- AMOUNT(Adet) Alanı ORDER BY ile Sıralama Yaptırıyoruz. En Az Alandan En Çok Alana Sıralı Şekilde

	 
	  SELECT  MIN(TOTALPRICE), MAX (TOTALPRICE), COUNT(*), SUM(TOTALPRICE), AVG(TOTALPRICE)
	  	 FROM SALES WHERE CITY = 'İSTANBUL'
	 
	 SELECT * FROM SALES ORDER BY TOTALPRICE

	  SELECT  MIN(TOTALPRICE), MAX (TOTALPRICE), COUNT(*), SUM(TOTALPRICE), AVG(TOTALPRICE)
	  FROM SALES WHERE CITY = 'ANKARA'
