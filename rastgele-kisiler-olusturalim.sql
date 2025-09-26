CREATE TABLE Kisiler(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
isim VARCHAR(100),
soyisim VARCHAR(100),
sehirid INT,
ilceid INT,
dogumtarihi DATE
)



DECLARE @IsimSayisi INT
DECLARE @SoyisimSayisi INT
DECLARE @IlceSayisi INT
DECLARE @Rastgele AS INT
DECLARE @DogumTarihi AS DATE

SELECT @IsimSayisi = COUNT(*) FROM Isimler

SELECT @SoyisimSayisi = COUNT(*) FROM Soyisimler

SELECT @IlceSayisi = COUNT(*) FROM Ilceler

SET @Rastgele = RAND() * @IsimSayisi
SELECT * FROM Isimler WHERE id = @Rastgele

SET @Rastgele = RAND() * @SoyisimSayisi
SELECT * FROM Soyisimler WHERE id = @Rastgele

SET @Rastgele = RAND() * @IlceSayisi
SELECT * FROM Ilceler WHERE id = @Rastgele

SET @Rastgele = RAND() * 365 * 80
SET @DogumTarihi = GETDATE() - @Rastgele
SELECT @DogumTarihi
