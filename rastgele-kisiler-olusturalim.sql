CREATE TABLE Kisiler(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
isim VARCHAR(100),
soyisim VARCHAR(100),
sehirid INT,
ilceid INT,
dogumtarihi DATE
)

  
DECLARE @SAYAC INT = 0
WHILE @SAYAC < 1000000
BEGIN
   DECLARE @Isim VARCHAR(100)
   DECLARE @IsimSayisi INT
   DECLARE @Soyisim VARCHAR(100)
   DECLARE @SoyisimSayisi INT
   DECLARE @IlceSayisi INT
   DECLARE @SehirId INT
   DECLARE @IlceId INT
   DECLARE @Rastgele AS INT
   DECLARE @DogumTarihi AS DATE

   SELECT @IsimSayisi = COUNT(*) FROM Isimler

   SELECT @SoyisimSayisi = COUNT(*) FROM Soyisimler

   SELECT @IlceSayisi = COUNT(*) FROM Ilceler

   SET @Rastgele = RAND() * @IsimSayisi
   SELECT @Isim = isim FROM Isimler WHERE id = @Rastgele

   SET @Rastgele = RAND() * @SoyisimSayisi
   SELECT @Soyisim = soyisim FROM Soyisimler WHERE id = @Rastgele

   SET @Rastgele = RAND() * @IlceSayisi
   SELECT @SehirId = sehirid, @IlceId = id FROM Ilceler WHERE id = @Rastgele

   SET @Rastgele = RAND() * 365 * 80
   SET @DogumTarihi = GETDATE() - @Rastgele

   INSERT INTO Kisiler (isim, soyisim, sehirid, ilceid, dogumtarihi) VALUES (@Isim, @Soyisim, @SehirId, @IlceId, @DogumTarihi)
   SET @SAYAC = @SAYAC + 1
END
