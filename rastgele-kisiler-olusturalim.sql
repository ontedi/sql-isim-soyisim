CREATE TABLE Kisiler(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
isim VARCHAR(100),
soyisim VARCHAR(100),
sehirid INT,
ilceid INT,
dogumtarihi DATE
)

  
DECLARE @SAYAC1 INT = 0
DECLARE @SAYAC2 INT = 0

WHILE @SAYAC1 < 20
BEGIN

	WHILE @SAYAC2 < 8000000
	BEGIN
		DECLARE @ToplamIsim INT
		DECLARE @RastgeleIsim VARCHAR(100)
		DECLARE @RastgeleIsimId INT
		DECLARE @ToplamSoyisim INT
		DECLARE @RastgeleSoyisim VARCHAR(100)
		DECLARE @RastgeleSoyisimId INT
		DECLARE @RastgeleSehirId INT
		DECLARE @ToplamIlce INT
		DECLARE @RastgeleIlceId INT
		DECLARE @RastgeleDogumTarihi DATE
		
		SELECT @ToplamIsim = COUNT(*) FROM Isimler
		SET @RastgeleIsimId = RAND() * @ToplamIsim
		SELECT @RastgeleIsim = isim FROM Isimler WHERE id = @RastgeleIsimId

		SELECT @ToplamSoyisim = COUNT(*) FROM Soyisimler
		SET @RastgeleSoyisimId = RAND() * @ToplamSoyisim
		SELECT @RastgeleSoyisim = soyisim FROM Soyisimler WHERE id = @RastgeleSoyisimId

		SELECT @ToplamIlce = COUNT(*) FROM Ilceler
		SET @RastgeleIlceId = RAND() * @ToplamIlce
		SELECT @RastgeleSehirId = sehirid, @RastgeleIlceId = id FROM Ilceler WHERE id = @RastgeleIlceId

		SET @RastgeleDogumTarihi = GETDATE() - (RAND() * 365 * 80)

		INSERT INTO Kisiler (isim, soyisim, sehirid, ilceid, dogumtarihi) VALUES (@RastgeleIsim, @RastgeleSoyisim, @RastgeleSehirId, @RastgeleIlceId, @RastgeleDogumTarihi)
		SET @SAYAC2 = @SAYAC2 + 1
	END

	SET @SAYAC1 = @SAYAC1 + 1
END


/*
DECLARE @BaslangicTarihi DATETIME
DECLARE @BitisTarihi DATETIME
DECLARE @Fark INT
SET @BaslangicTarihi = format(getdate(), 'yyyy-MM-dd HH:mm:ss.fff')
SELECT * FROM Kisiler AS k
INNER JOIN Ilceler AS i ON k.ilceid = i.id 
WHERE 
k.isim LIKE '%g%' AND k.isim not in ('e') AND k.soyisim LIKE '%ad%' --AND (dogumtarihi > '1988-08-01' or dogumtarihi < '2001-07-16')
AND
i.ilce LIKE '%z%'
SET @BitisTarihi = format(getdate(), 'yyyy-MM-dd HH:mm:ss.fff')
SET @Fark = DATEDIFF(MILLISECOND, @BaslangicTarihi, @BitisTarihi)
SELECT ('Başlangıç: '  + CONVERT(VARCHAR(24), @BaslangicTarihi, 121)) BASLANGIC, ('Bitiş: '  + CONVERT(VARCHAR(24), @BitisTarihi, 121)) BITIS, ('Fark: ' + CAST(@Fark as varchar(20)) + ' milisaniye') FARK
*/