SELECT CITY, DATE2, SUM(TOTALPRICE) AS TOTALPRICE

--CONVERT (DATE, DATE_) AS DATE2,* --Veri Tipini Alıp, Başka Bir Veri Tipine Çeviriyor

FROM SALES WHERE CITY = 'ANKARA'
GROUP BY CITY, DATE2
ORDER BY CITY, DATE2

--Bir Şehrin Günlere Göre Toplam Satışların Listelenmesi