USE [master]
GO
/****** Object:  Database [KamAirLines]    Script Date: 05.06.2015 12:01:48 ******/
CREATE DATABASE [KamAirLines]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KamAirLines', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.BESIKTAS\MSSQL\DATA\KamAirLines.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KamAirLines_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.BESIKTAS\MSSQL\DATA\KamAirLines_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KamAirLines] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KamAirLines].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KamAirLines] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KamAirLines] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KamAirLines] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KamAirLines] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KamAirLines] SET ARITHABORT OFF 
GO
ALTER DATABASE [KamAirLines] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KamAirLines] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [KamAirLines] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KamAirLines] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KamAirLines] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KamAirLines] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KamAirLines] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KamAirLines] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KamAirLines] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KamAirLines] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KamAirLines] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KamAirLines] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KamAirLines] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KamAirLines] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KamAirLines] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KamAirLines] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KamAirLines] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KamAirLines] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KamAirLines] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KamAirLines] SET  MULTI_USER 
GO
ALTER DATABASE [KamAirLines] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KamAirLines] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KamAirLines] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KamAirLines] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KamAirLines]
GO
/****** Object:  StoredProcedure [dbo].[sp_HavaalaniEkle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_HavaalaniEkle]
@HAdi varchar(50),
@Kita varchar(20),
@Ulke varchar(20),
@Sehir varchar(20)
as
insert into HavaAlanlari(HavaAlaniAdi,Kita,Ulke,Sehir) values(@HAdi,@Kita,@Ulke,@Sehir)
GO
/****** Object:  StoredProcedure [dbo].[sp_HavaalaniGuncelle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_HavaalaniGuncelle]
@HAdi varchar(50),
@Kita varchar(20),
@Ulke varchar(20),
@Sehir varchar(20),
@ID int
as
update Havaalanlari set HavaAlaniAdi=@HAdi, Kita=@Kita, Ulke=@Ulke,Sehir=@Sehir where HavaAlaniID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_HavaalaniSil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc	[dbo].[sp_HavaalaniSil]
@ID int
as
update Havaalanlari set silindi = 1 where HavaAlaniID=@ID 
GO
/****** Object:  StoredProcedure [dbo].[sp_MusteriEkle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_MusteriEkle]
@Ad varchar(20),
@Soyad varchar(20),
@TcNo varchar(20),
@Telefon varchar(20),
@Mail varchar(20),
@Adres varchar(20)
as
insert into Musteriler(MusteriAdi,MusteriSoyadi,MusteriTCKNo,Telefon,Email,Adres) values(@Ad,@Soyad,@TcNo,@Telefon,@Mail,@Adres)
GO
/****** Object:  StoredProcedure [dbo].[sp_MusteriGuncelle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MusteriGuncelle]
@ID int,
@Ad varchar(30),
@Soyad varchar(30),
@TcNo varchar(11),
@Telefon varchar(20),
@Mail varchar(100),
@Adres varchar(200)
as
update  Musteriler set MusteriAdi=@Ad, MusteriSoyadi=@Soyad, MusteriTCKNo=@TcNo, Telefon=@Telefon, Email=@Mail, Adres=@Adres where MusteriID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_MusteriSil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_MusteriSil]
@ID int
as
update Musteriler set Silindi = 1 where MusteriID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_PersonelEkle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_PersonelEkle]
@Ad varchar(20),
@Soyad varchar(20),
@TcNo varchar(20),
@KAdi varchar(20),
@KSifre varchar(15),
@GorevID int,
@UstuID int,
@YetkiID int,
@Telefon varchar(20),
@Mail varchar(20),
@IBT datetime,
@Adres varchar(20)
as
insert into Personeller(PersonelAdi,PersonelSoyadi,PersonelTCK,KullaniciAdi,KullaniciSifresi,GorevID,UstuID,YetkiTipiID,Telefon,Mail,IseBaslamaTarihi,Adres) values(@Ad,@Soyad,@TcNo,@KAdi,@KSifre,@GorevID,@UstuID,@YetkiID,@Telefon,@Mail,@IBT,@Adres)
GO
/****** Object:  StoredProcedure [dbo].[sp_PersonelGuncelle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_PersonelGuncelle]
@ID int,
@Ad varchar(20),
@Soyad varchar(20),
@TcNo varchar(20),
@KAdi varchar(20),
@KSifre varchar(15),
@GorevID int,
@UstuID int,
@YetkiID int,
@Telefon varchar(20),
@Mail varchar(20),
@IBT datetime,
@Adres varchar(20)
as
update  Personeller set PersonelAdi=@Ad,PersonelSoyadi=@Soyad,PersonelTCK=@TcNo,KullaniciAdi=@KAdi,KullaniciSifresi=@KSifre,GorevID=@GorevID,UstuID=@UstuID,YetkiTipiID=@YetkiID,Telefon=@Telefon,Mail=@Mail,IseBaslamaTarihi=@IBT,Adres=@Adres where PersonelID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_PersonelSil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_PersonelSil]
@ID int
as
update Personeller set Silindi = 1 where PersonelID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_UcakEkle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_UcakEkle]
@UcakAdi varchar(20),
@UcakTuru varchar(30),
@Kontenjani int,
@UMesafesi int,
@USuresi varchar(20),
@BYMID int,
@SBT datetime,
@BAciklamasi varchar(150)
as
insert into Ucaklar(UcakAdi,UcakTuru,Kontenjani,UcusMesafesi,UcusSuresi,BakiminiYapanMuhendisID,SonBakimTarihi,BakimAciklamasi) values(@UcakAdi,@UcakTuru,@Kontenjani,@UMesafesi,@USuresi,@BYMID,@SBT,@BAciklamasi)

GO
/****** Object:  StoredProcedure [dbo].[sp_UcakGuncelle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UcakGuncelle]
@ID int,
@UcakAdi varchar(20),
@UcakTuru varchar(30),
@Kontenjani int,
@UMesafesi int,
@USuresi varchar(20),
@BYMID int,
@SBT datetime,
@BAciklamasi varchar(150)
as
update Ucaklar set UcakAdi=@UcakAdi, UcakTuru=@UcakTuru, Kontenjani=@Kontenjani, UcusMesafesi=@UMesafesi, UcusSuresi=@USuresi, BakiminiYapanMuhendisID=@BYMID, SonBakimTarihi=@SBT, BakimAciklamasi=@BAciklamasi  where UcakID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_UcakSil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UcakSil]
@ID int 
as
update ucaklar set Silindi = 1 where UcakID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_UcusEkle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_UcusEkle]
@NeredenID int,
@NereyeID int,
@Mesafe int,
@TKalkis datetime,
@TVaris datetime,
@PID int,
@KEID int,
@Ucret money,
@UID int
as
insert into Ucuslar(NeredenID,NereyeID,Mesafe,TahminiKalkis,TahminiVaris,PilotID,KabinEkibiID,Ucret,UcakID) values (@NeredenID,@NereyeID,@Mesafe,@TKalkis,@TVaris,@PID,@KEID,@Ucret,@UID)
GO
/****** Object:  StoredProcedure [dbo].[sp_UcusGuncelle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UcusGuncelle]
@ID int,
@NeredenID int,
@NereyeID int,
@Mesafe int,
@TKalkis datetime,
@TVaris datetime,
@PID int,
@KEID int,
@Ucret money,
@UID int
as
update ucuslar set NeredenID=@NeredenID, NereyeID=@NereyeID,Mesafe=@Mesafe,TahminiKalkis=@TKalkis,TahminiVaris=@TVaris,KabinEkibiID=@KEID,PilotID=@PID,Ucret=@Ucret,UcakID=@UID where UcusID=@ID


GO
/****** Object:  StoredProcedure [dbo].[sp_UcusSil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_UcusSil]
 @ID int
 as
 update ucuslar set ucuslar.silindi = 1 where UcusID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_YetkiDegistir]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_YetkiDegistir]
 @ID int,
 @YAd varchar(30)
 as
 update Yetki set  YetkiliAd =@YAd where Silindi=0 and YetkiliID =@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_YetkiEkle]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_YetkiEkle]
 @YAd varchar(30)
 as
 insert into Yetki (YetkiliAd) values (@YAd)
GO
/****** Object:  StoredProcedure [dbo].[sp_YetkiSil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[sp_YetkiSil]
 @ID int
 as
 update Yetki set Silindi = 1 where YetkiliID = @ID
GO
/****** Object:  Table [dbo].[Dil]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dil](
	[DilID] [int] IDENTITY(1,1) NOT NULL,
	[DilAd] [varchar](20) NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Dil] PRIMARY KEY CLUSTERED 
(
	[DilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DilLogID]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DilLogID](
	[DilLogID] [int] IDENTITY(1,1) NOT NULL,
	[DilID] [int] NOT NULL,
	[PersonelID] [int] NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_DilLogID] PRIMARY KEY CLUSTERED 
(
	[DilLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gorevler]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gorevler](
	[GorevID] [int] IDENTITY(1,1) NOT NULL,
	[GorevAd] [varchar](40) NOT NULL,
	[GorevAciklama] [varchar](150) NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Gorevler] PRIMARY KEY CLUSTERED 
(
	[GorevID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HavaAlanlari]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HavaAlanlari](
	[HavaAlaniID] [int] IDENTITY(1,1) NOT NULL,
	[HavaAlaniAdi] [varchar](50) NOT NULL,
	[Kita] [varchar](20) NOT NULL,
	[Ulke] [varchar](20) NOT NULL,
	[Sehir] [varchar](20) NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_HavaAlanlari] PRIMARY KEY CLUSTERED 
(
	[HavaAlaniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdi] [varchar](30) NOT NULL,
	[MusteriSoyadi] [varchar](30) NOT NULL,
	[Telefon] [varchar](20) NOT NULL,
	[Adres] [varchar](150) NULL,
	[Email] [nvarchar](100) NULL,
	[MusteriTCKNo] [varchar](11) NULL,
	[SatisID] [int] NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personeller](
	[PersonelID] [int] IDENTITY(1,1) NOT NULL,
	[PersonelAdi] [varchar](50) NOT NULL,
	[PersonelSoyadi] [varchar](50) NOT NULL,
	[KullaniciAdi] [varchar](50) NOT NULL,
	[KullaniciSifresi] [varchar](50) NOT NULL,
	[YetkiTipiID] [int] NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Telefon] [varchar](50) NOT NULL,
	[PersonelTCK] [varchar](50) NOT NULL,
	[Adres] [varchar](250) NULL,
	[Uygunluk] [bit] NOT NULL,
	[UstuID] [int] NULL,
	[IseBaslamaTarihi] [datetime] NULL,
	[GorevID] [int] NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Satis](
	[RezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[UcusKodu] [int] NOT NULL,
	[OdemeTipi] [varchar](50) NOT NULL,
	[PersonelID] [int] NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Rezervasyonlar] PRIMARY KEY CLUSTERED 
(
	[RezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ucaklar]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ucaklar](
	[UcakID] [int] IDENTITY(1,1) NOT NULL,
	[UcakAdi] [varchar](50) NOT NULL,
	[UcakTuru] [varchar](50) NOT NULL,
	[Kontenjani] [int] NOT NULL,
	[UcusMesafesi] [int] NOT NULL,
	[UcusSuresi] [varchar](50) NULL,
	[BakiminiYapanMuhendisID] [int] NULL,
	[SonBakimTarihi] [datetime] NULL,
	[BakimAciklamasi] [varchar](150) NULL,
	[Uygunluk] [bit] NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Ucaklar] PRIMARY KEY CLUSTERED 
(
	[UcakID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ucuslar]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ucuslar](
	[UcusID] [int] IDENTITY(1,1) NOT NULL,
	[NeredenID] [int] NOT NULL,
	[NereyeID] [int] NOT NULL,
	[Mesafe] [int] NOT NULL,
	[TahminiKalkis] [datetime] NOT NULL,
	[TahminiVaris] [datetime] NOT NULL,
	[KabinEkibiID] [int] NOT NULL,
	[PilotID] [int] NOT NULL,
	[PersonelID] [int] NULL,
	[Ucret] [money] NOT NULL,
	[UcakID] [int] NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Ucuslar] PRIMARY KEY CLUSTERED 
(
	[UcusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 05.06.2015 12:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Yetki](
	[YetkiliID] [int] IDENTITY(1,1) NOT NULL,
	[YetkiliAd] [varchar](25) NOT NULL,
	[Silindi] [bit] NOT NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[YetkiliID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Dil] ON 

INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (1, N'İngilizce', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (2, N'Arapça', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (3, N'Fransızca', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (4, N'Almanca', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (5, N'İtalyanca', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (6, N'Çince', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (7, N'Japonca', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (8, N'Flemenkçe', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (9, N'İspanyolca', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (10, N'Portekizce', 0)
INSERT [dbo].[Dil] ([DilID], [DilAd], [Silindi]) VALUES (11, N'Rusça', 0)
SET IDENTITY_INSERT [dbo].[Dil] OFF
SET IDENTITY_INSERT [dbo].[DilLogID] ON 

INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (1, 1, 3, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (2, 4, 3, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (3, 5, 3, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (4, 2, 6, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (5, 11, 6, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (6, 1, 8, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (7, 3, 8, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (8, 4, 8, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (9, 9, 8, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (10, 1, 9, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (11, 3, 9, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (12, 4, 10, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (13, 5, 10, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (14, 1, 11, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (16, 9, 11, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (17, 1, 12, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (18, 10, 12, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (20, 1, 13, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (21, 1, 14, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (22, 1, 15, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (23, 1, 16, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (24, 3, 16, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (25, 6, 16, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (26, 1, 17, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (27, 1, 18, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (28, 1, 19, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (29, 3, 19, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (30, 1, 20, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (31, 1, 21, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (33, 1, 22, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (34, 5, 22, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (35, 10, 22, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (36, 1, 23, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (37, 4, 23, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (38, 9, 23, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (39, 6, 24, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (40, 7, 24, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (41, 11, 24, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (42, 1, 25, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (43, 1, 26, 1)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (44, 1, 27, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (45, 1, 28, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (46, 1, 29, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (47, 1, 30, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (48, 1, 31, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (49, 3, 31, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (50, 3, 32, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (51, 1, 33, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (52, 1, 34, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (53, 1, 35, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (54, 1, 36, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (55, 1, 37, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (56, 1, 38, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (57, 1, 39, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (58, 1, 40, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (59, 1, 41, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (60, 3, 41, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (61, 5, 41, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (62, 1, 42, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (63, 1, 43, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (64, 1, 45, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (65, 3, 45, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (66, 5, 45, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (67, 1, 46, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (68, 1, 47, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (69, 1, 48, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (70, 1, 49, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (71, 3, 49, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (72, 5, 49, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (73, 9, 49, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (74, 1, 50, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (75, 1, 51, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (77, 1, 55, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (78, 1, 57, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (79, 1, 58, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (80, 1, 59, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (81, 5, 59, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (82, 1, 61, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (83, 11, 61, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (84, 1, 62, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (85, 8, 62, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (86, 1, 63, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (87, 8, 63, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (88, 1, 65, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (89, 3, 65, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (90, 11, 65, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (91, 1, 66, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (92, 2, 66, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (93, 1, 67, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (94, 5, 67, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (95, 1, 68, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (96, 8, 68, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (97, 1, 69, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (98, 1, 70, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (99, 7, 70, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (100, 1, 71, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (101, 1, 72, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (102, 1, 73, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (103, 7, 73, 0)
GO
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (104, 1, 74, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (105, 1, 75, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (106, 1, 76, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (107, 5, 76, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (108, 1, 77, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (109, 1, 78, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (110, 10, 78, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (111, 1, 79, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (112, 3, 79, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (113, 8, 79, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (114, 1, 80, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (115, 3, 80, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (116, 5, 80, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (117, 1, 81, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (118, 6, 81, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (119, 9, 81, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (120, 1, 82, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (121, 1, 83, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (122, 1, 84, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (123, 5, 84, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (124, 1, 85, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (125, 1, 86, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (126, 5, 86, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (127, 1, 87, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (128, 1, 88, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (129, 1, 89, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (130, 1, 90, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (131, 1, 91, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (132, 1, 92, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (133, 1, 93, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (134, 1, 94, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (135, 1, 95, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (136, 1, 96, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (137, 1, 97, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (138, 5, 97, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (139, 1, 98, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (140, 1, 99, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (141, 1, 100, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (142, 1, 101, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (143, 1, 102, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (144, 1, 103, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (145, 1, 104, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (146, 5, 104, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (147, 1, 105, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (148, 1, 106, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (149, 1, 107, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (150, 1, 108, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (151, 1, 109, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (152, 11, 109, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (153, 1, 110, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (154, 1, 111, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (155, 1, 112, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (156, 2, 112, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (157, 1, 113, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (158, 1, 114, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (159, 1, 115, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (160, 6, 115, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (161, 1, 116, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (162, 1, 117, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (163, 1, 118, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (164, 4, 118, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (165, 1, 119, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (166, 1, 120, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (167, 1, 121, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (168, 1, 122, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (169, 1, 123, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (170, 1, 124, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (171, 5, 124, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (172, 1, 125, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (173, 1, 126, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (174, 6, 126, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (175, 8, 126, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (176, 1, 127, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (177, 1, 128, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (178, 1, 129, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (179, 1, 130, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (181, 1, 133, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (182, 1, 134, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (183, 2, 134, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (184, 1, 135, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (185, 1, 137, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (186, 1, 138, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (187, 1, 140, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (188, 1, 141, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (189, 1, 143, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (190, 1, 144, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (191, 1, 145, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (192, 1, 146, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (193, 1, 147, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (194, 5, 147, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (195, 1, 148, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (196, 5, 148, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (197, 1, 149, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (198, 3, 149, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (199, 1, 150, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (200, 1, 151, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (201, 7, 151, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (202, 1, 152, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (203, 1, 153, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (204, 1, 154, 0)
GO
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (205, 1, 155, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (206, 8, 155, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (207, 1, 156, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (208, 7, 156, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (209, 1, 157, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (210, 6, 157, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (211, 1, 158, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (212, 2, 158, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (213, 1, 159, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (214, 3, 159, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (215, 1, 160, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (216, 2, 160, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (217, 1, 161, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (218, 1, 162, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (221, 1, 162, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (222, 1, 164, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (223, 1, 165, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (224, 1, 166, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (225, 1, 167, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (226, 8, 167, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (227, 1, 168, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (228, 1, 169, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (229, 6, 169, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (230, 1, 170, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (231, 1, 171, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (232, 1, 172, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (233, 1, 173, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (234, 1, 174, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (235, 1, 175, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (236, 3, 175, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (237, 1, 176, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (238, 9, 176, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (239, 1, 177, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (240, 1, 178, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (241, 5, 178, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (242, 1, 179, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (243, 1, 179, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (245, 2, 179, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (246, 1, 180, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (247, 1, 181, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (248, 1, 182, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (249, 1, 183, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (251, 1, 185, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (252, 3, 185, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (253, 1, 186, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (254, 2, 186, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (255, 1, 187, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (256, 1, 188, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (257, 1, 189, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (258, 9, 189, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (260, 1, 191, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (261, 4, 191, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (262, 8, 191, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (263, 11, 191, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (264, 1, 192, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (265, 1, 193, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (266, 2, 193, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (267, 6, 193, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (269, 1, 194, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (270, 1, 195, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (271, 1, 196, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (272, 1, 197, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (273, 1, 198, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (274, 2, 198, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (275, 3, 198, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (276, 1, 199, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (277, 4, 199, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (278, 5, 199, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (279, 6, 199, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (280, 1, 200, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (281, 7, 200, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (282, 8, 200, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (283, 9, 200, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (284, 10, 200, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (285, 1, 201, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (286, 11, 201, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (287, 1, 202, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (288, 5, 202, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (289, 6, 202, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (290, 1, 203, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (291, 5, 203, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (292, 6, 203, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (293, 1, 204, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (294, 1, 205, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (295, 1, 206, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (296, 5, 206, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (297, 1, 207, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (298, 6, 207, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (299, 1, 208, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (300, 9, 208, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (302, 1, 210, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (303, 1, 211, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (304, 1, 212, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (305, 1, 213, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (306, 1, 214, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (307, 5, 214, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (308, 8, 214, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (309, 1, 215, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (310, 5, 215, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (311, 6, 215, 0)
GO
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (312, 1, 216, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (313, 1, 217, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (314, 9, 217, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (315, 1, 218, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (316, 8, 218, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (317, 9, 218, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (318, 1, 219, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (319, 7, 219, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (320, 1, 220, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (321, 6, 220, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (322, 8, 220, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (323, 1, 221, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (324, 2, 221, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (325, 1, 222, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (326, 2, 222, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (327, 1, 223, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (328, 1, 224, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (331, 1, 226, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (332, 1, 227, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (333, 1, 228, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (334, 9, 228, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (335, 1, 229, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (336, 9, 229, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (337, 11, 229, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (338, 1, 230, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (340, 2, 230, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (343, 4, 230, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (344, 8, 230, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (345, 9, 230, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (346, 10, 230, 0)
INSERT [dbo].[DilLogID] ([DilLogID], [DilID], [PersonelID], [Silindi]) VALUES (347, 11, 230, 0)
SET IDENTITY_INSERT [dbo].[DilLogID] OFF
SET IDENTITY_INSERT [dbo].[Gorevler] ON 

INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (1, N'Pilot', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (2, N'Co-Pilot', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (3, N'Kabin Amiri', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (4, N'Kabin Ekibi', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (5, N'Uçak Muhendisi', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (6, N'Uçus Teknisyeni', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (7, N'Yer Ekibi', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (8, N'Hareket Amirliği', NULL, 0)
INSERT [dbo].[Gorevler] ([GorevID], [GorevAd], [GorevAciklama], [Silindi]) VALUES (9, N'Admin', NULL, 0)
SET IDENTITY_INSERT [dbo].[Gorevler] OFF
SET IDENTITY_INSERT [dbo].[HavaAlanlari] ON 

INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (1, N'Atatürk Havalimanı', N'Avrupa', N'Türkiye', N'İstanbul', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (2, N'Esenboğa Havalimanı', N'Asya', N'Türkiye', N'Ankara', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (3, N'Adnan Menderes Havalimanı', N'Asya', N'Türkiye', N'İzmir', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (4, N'Antalya Havalimanı', N'Asya', N'Türkiye', N'Antalya', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (5, N'Gaziantep Havalimanı', N'Asya', N'Türkiye', N'Gaziantep', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (6, N'Trabzon Havalimanı', N'Asya', N'Türkiye', N'Trabzon', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (7, N'Erzurum Havalimanı', N'Asya', N'Türkiye', N'Erzurum', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (8, N'Milas - Bodrum Havalimanı', N'Asya', N'Türkiye', N'Muğla', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (9, N'Diyarbakır Havalimanı', N'Asya', N'Türkiye', N'Diyarbakır', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (10, N'Heathrow Havalimanı', N'Avrupa', N'İngiltere', N'Londra', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (11, N'Paris-Charles de Gaulle Havalimanı', N'Avrupa', N'Fransa', N'Paris', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (12, N'Frankfurt Havalimanı', N'Avrupa', N'Almanya', N'Frankfurt', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (13, N'Amsterdam Schiphol Havalimanı', N'Avrupa', N'Hollanda', N'Amsterdam', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (14, N'Madrid Barajas Uluslararası Havalimanı', N'Avrupa', N'İspanya', N'Madrid', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (15, N'Münih Havalimanı', N'Avrupa', N'Almanya', N'Münih', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (16, N'Roma- Fiumicino – Leonardo da Vinci Havalimanı', N'Avrupa', N'İtalya', N'Roma', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (17, N'Gatwick Havalimanı', N'Avrupa', N'İngiltere', N'Londra', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (18, N'Barcelona Uluslararası Havalimanı', N'Avrupa', N'İspanya', N'Barcelona', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (19, N'Domodedovo Havalimanı', N'Avrupa', N'Rusya', N'Moskova', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (20, N'Sheremetyevo Havalimanı', N'Avrupa', N'Rusya', N'Moskova', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (22, N'Kopenhag Havalimanı', N'Avrupa', N'Danimarka', N'Kopenhag', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (23, N'Zürih Havalimanı', N'Avrupa', N'İsviçre', N'Zürih', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (26, N'Viyana Uluslararası Havalimanı', N'Avrupa', N'Avusturya', N'Viyana', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (27, N'Stockholm-Arlanda Havalimanı', N'Avrupa', N'İsveç', N'Stockholm', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (28, N'Manchester Havalimanı', N'Avrupa', N'İngiltere', N'Manchester', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (29, N'Brüksel Havalimanı', N'Avrupa', N'Belçika', N'Brüksel', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (31, N'Lizbon Portela Havalimanı', N'Avrupa', N'Portekiz', N'Lizbon', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (32, N'Helsinki - Vantaa Havalimanı', N'Avrupa', N'Finlandiya', N'Helsinki', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (33, N'Atina Uluslararası Havalimanı', N'Avrupa', N'Yunanistan', N'Atina', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (35, N'Los Angeles Uluslararası Havaalanı', N'K. Amerika', N'A.B.D', N'Los Angeles', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (36, N'John F Kennedy Uluslararası Havaalanı', N'K. Amerika', N'A.B.D', N'New York', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (37, N'Dulles Uluslararası Havaalanı', N'K. Amerika', N'A.B.D', N'Washington', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (44, N'Antônio Carlos Jobim Uluslararası Havaalanı', N'G. Amerika', N'Brezilya', N'Rio de Janeiro', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (45, N'Ezeiza Uluslararası Havaalanı', N'G. Amerika', N'Arjantin', N'Buenos Aires', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (46, N'Pekin Capital Havaalanı', N'Asya', N'Çin', N'Pekin', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (47, N'Tokyo Haneda Uluslararası Havaalanı', N'Asya', N'Japonya', N'Tokyo', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (48, N'Dubai Uluslararası Havalimanı', N'Asya', N'B.A.E', N'Dubai', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (51, N'Kingsford Smith Havaalanı', N'Okyanusya', N'Avustralya', N'Sydney', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (52, N'Incheon Uluslararası Havaalanı', N'Asya', N'G. Kore', N'Seul', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (53, N'Suvarnabhumi Uluslararası Havaalanı', N'Asya', N'Tayvan', N'Bangkok', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (54, N'Cape Town Uluslararası Havaalanı', N'Afrika', N'Güney Afrika', N'Cape Town', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (56, N'Kartaca Havaalanı', N'Afrika', N'Tunus', N'Tunus', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (57, N'Sabiha Gökçen', N'Asya', N'Türkiye', N'İstanbul', 0)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (72, N'Van Havaalanı', N'Asya', N'Türkiye', N'Van', 1)
INSERT [dbo].[HavaAlanlari] ([HavaAlaniID], [HavaAlaniAdi], [Kita], [Ulke], [Sehir], [Silindi]) VALUES (73, N'Lyon–Saint-Exupéry', N'Avrupa', N'Fransa', N'Lyon', 0)
SET IDENTITY_INSERT [dbo].[HavaAlanlari] OFF
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (1, N'Anıl', N'Demir', N'(532)-356-66-26', N'Beylikdüzü - İstanbul', N'', N'22556698794', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (2, N'Berker ', N'Aksoy', N'(532)-844-56-62', N'Bahçelievler - İstanbul', N'', N'22434862486', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (3, N'Buse', N'Giray', N'(534)-866-52-53', N'Kasaplar - Balikesir', N'', N'22736576548', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (4, N'Buğra', N'Yazman', N'(505)-488-62-21', N'Göztepe - İzmir', N'', N'22486144895', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (5, N'Seda', N'Tezcan', N'(506)-741-51-54', N'Karşıyaka - İzmir', N'', N'54854844848', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (6, N'Sinem', N'Bolat', N'(504)-874-58-98', N'Dikmen - Ankara', N'', N'65485845784', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (7, N'Miray', N'Şahin', N'(504)-549-84-51', N'Cumhuriyet - Kocaeli', N'', N'45844654776', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (8, N'Merve', N'Dolunay', N'(536)-646-54-84', N'Konyaaltı - Antalya', N'', N'51478645178', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (9, N'Mert', N'Güney', N'(537)-655-84-54', N'Beyoğlu - İstanbul', N'', N'65645164578', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (10, N'Dila', N'Naz', N'(535)-545-18-56', N'Kadıköy - İstanbul', N'', N'85165176529', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (11, N'Onur', N'Akıcı', N'(538)-451-84-58', N'Bahçelievler - Balıkesir', N'', N'36549651945', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (12, N'Melis', N'Aydın', N'(539)-456-18-88', N'Bahçelievler - Ankara', N'', N'54952616260', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (15, N'Onur', N'Kibar', N'(534)-568-54-81', N'Bornova - İzmir', N'', N'61496510658', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (16, N'Ece', N'Parlak', N'(539)-758-65-48', N'Konak - İzmir', N'', N'25035169520', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (17, N'Aslı', N'Duru', N'(532)-485-52-18', N'Dikmen - Ankara', N'', N'56018423197', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (18, N'Nur', N'Yıldız', N'(534)-768-47-76', N'Nilüfer - Bursa', N'', N'32351320678', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (19, N'Esra', N'Yazıcı', N'(502)-654-84-78', N'Alanya - Antalya', N'', N'65159165204', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (20, N'Burak', N'Usta', N'(505)-687-57-71', N'Kemer - Antalya', N'', N'32651651302', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (21, N'Dilek ', N'Baymen', N'(535)-485-85-48', N'Ünye - Samsun', N'', N'56136116541', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (22, N'Toygun', N'Sağlam', N'(507)-654-84-66', N'Kadıköy - İstanbul', N'', N'65103614579', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (23, N'Gökhan', N'Güven', N'(506)-845-84-72', N'Şirinevler - İstanbul', N'', N'84654784651', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (24, N'Tuğçe', N'Derin', N'(509)-548-24-87', N'Pamukkale - Denizli', N'', N'51658465184', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (25, N'Merve', N'Yıldırım', N'(545)-364-34-71', N'New Jersey - ABD', N'', N'65169487461', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (26, N'Barut', N'Bulut', N'(534)-854-45-78', N'New York - ABD', N'', N'65184652164', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (27, N'Rüzgar', N'Esen', N'(534)-455-28-51', N'Boston - ABD', N'', N'51846521658', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (28, N'Bilge', N'Ersöz', N'(530)-545-86-64', N'Köln - Almanya', N'', N'66516513035', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (29, N'Murat', N'Kılıç', N'(534)-785-21-26', N'Atina - Yunanistan', N'', N'85432548846', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (30, N'Gizem', N'Yaren', N'(539)-564-48-11', N'Bornova - İzmir', N'', N'25486465469', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (31, N'Ezgi', N'Guven', N'(534)-832-45-45', N'Yeşilköy - İstanbul', N'', N'35435213584', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (32, N'Burcu', N'Esmer', N'(537)-862-14-58', N'Florya - İstanbul', N'', N'98476514685', 0, 0)
INSERT [dbo].[Musteriler] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [Telefon], [Adres], [Email], [MusteriTCKNo], [SatisID], [Silindi]) VALUES (33, N'asdasd', N'adasd', N'(121)-212-12-12', N'asdsada', N'qwqwdqd', N'12312312312', 0, 1)
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (3, N'Beyza ', N'Akbay', N'bakbay', N'ba123456', 4, N'b@gmail.com', N'(532)-456-89-65', N'10000000000', N'', 0, 0, CAST(0x0000A48E010300B0 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (6, N'Büşra', N'Yaren', N'byaren', N'by123456', 1, N'b@hotmail.com', N'(532)-145-69-87', N'20000000000', N'', 1, 3, CAST(0x0000A48C017E6944 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (8, N'İrem ', N'Yıldız', N'iyildiz', N'iy123456', 1, N'i@gmail.com', N'(532)-145-98-74', N'30000000000', N'', 1, 3, CAST(0x0000A48C017EB444 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (9, N'Burcu', N'Savaş', N'savasb', N'bs123456', 1, N'bs@gmail.com', N'(532)-146-32-58', N'40000000000', N'', 1, 3, CAST(0x0000A48C017F5BD8 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (10, N'Hazel ', N'Türker', N'hturker', N'ht123456', 4, N'h@gmail.com', N'(532)-147-98-23', N'50000000000', N'', 0, 3, CAST(0x0000A48C017F9B20 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (11, N'Ayşenur', N'Koca', N'aykoca', N'ak123456', 1, N'a@gmail.com', N'(532)-147-25-63', N'60000000000', N'', 1, 3, CAST(0x0000A48C017FDF18 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (12, N'Pelinsu', N'Öztürk', N'pelinsu', N'po123456', 1, N'p@gmail.com', N'(532)-145-23-69', N'70000000000', N'', 1, 3, CAST(0x0000A48C01801ADC AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (13, N'Simge', N'Sağlam', N'ssaglam', N'ss123456', 1, N'ss@gmail.com', N'(532)-145-87-00', N'80000000000', N'', 1, 3, CAST(0x0000A48C01805C7C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (14, N'Elçin', N'Özbent', N'elcozo', N'eo123456', 4, N'e@gmail.com', N'(532)-165-47-00', N'90000000000', N'', 0, 0, CAST(0x0000A48C018094BC AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (15, N'Gizem', N'Kocabaş', N'gikozk', N'gk123456', 1, N'giz@gmail.com', N'(532)-146-58-74', N'11000000000', N'', 1, 14, CAST(0x0000A48C0180F27C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (16, N'Esra', N'Kaplan', N'ekaplan', N'ek123456', 1, N'ek@gmail.com', N'(532)-222-11-33', N'12000000000', N'', 1, 14, CAST(0x0000A48C01816B30 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (17, N'Almira', N'Gürcan', N'almira', N'ag123456', 1, N'ag@gmail.com', N'(532)-147-85-69', N'13000000000', N'', 1, 14, CAST(0x0000A48C0181E63C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (18, N'Hilal', N'Güzel', N'hilalg', N'hg123456', 4, N'hg@gmail.com', N'(531)-458-56-95', N'14000000000', N'', 0, 0, CAST(0x0000A48C01821E7C AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (19, N'Gökçe', N'Göker', N'ggoker', N'gg123456', 1, N'gg@gmail.com', N'(532)-852-19-73', N'15000000000', N'', 1, 18, CAST(0x0000A48C018264CC AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (20, N'Gizem', N'Gürçay', N'gizoli', N'giz123456', 1, N'giz@gmail.com', N'(532)-136-25-47', N'16000000000', N'', 1, 18, CAST(0x0000A48C0182EDE8 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (21, N'Dilan', N'Işıklı', N'dilani', N'di123456', 1, N'd@gmail.com', N'(532)-587-96-21', N'17000000000', N'', 1, 18, CAST(0x0000A49600000000 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (22, N'Sultan', N'Kara', N'sultan', N'sk123456', 4, N'sk@gmail.com', N'5326985200', N'18000000000', NULL, 0, 0, CAST(0x0000A48C01839747 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (23, N'Simge', N'Doğru', N'sdogru', N'sd123456', 1, N'sd@gmail.com', N'5321114477', N'19000000000', NULL, 1, 22, CAST(0x0000A48C0183F1A9 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (24, N'Ceyda ', N'Ersoy', N'cersoy', N'ce123456', 1, N'ce@gmail.com', N'5326668844', N'21000000000', NULL, 1, 22, CAST(0x0000A48C01842CF6 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (25, N'Betül ', N'Er', N'betule', N'be123456', 1, N'be@gmail.com', N'5321114477', N'22000000000', NULL, 1, 22, CAST(0x0000A48C01846E16 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (26, N'Ülkü', N'Dursun', N'dursun', N'ud123456', 4, N'ud@gmail.com', N'(532)-145-63-28', N'23000000000', N'', 1, 22, CAST(0x0000A48C0185112C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (27, N'Nazlı', N'Eren', N'nerena', N'ne123456', 1, N'ne@gmail.com', N'(532)-698-54-12', N'24000000000', N'', 1, 22, CAST(0x0000A48C01854F48 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (28, N'Elif ', N'Eveci', N'eeveci', N'ee123456', 1, N'ee@gmail.com', N'(532)-145-63-28', N'25000000000', N'', 1, 22, CAST(0x0000A48C0185A4D4 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (29, N'Büşra', N'Gercünmüş', N'bercun', N'bg123456', 1, N'bg@gmail.cm', N'(532)-146-32-88', N'26000000000', N'', 1, 22, CAST(0x0000A48C01861A04 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (30, N'Beste', N'Çay', N'bestec', N'bc123456', 4, N'bc@gmail.com', N'5321478532', N'27000000000', NULL, 1, 0, CAST(0x0000A48C01865532 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (31, N'Aybike', N'Çiftçi', N'aybici', N'ac123456', 1, N'ac@gmail.com', N'5326985200', N'28000000000', NULL, 1, 30, CAST(0x0000A48C01868B74 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (32, N'Ceyda', N'Dalan', N'cdalan', N'cd123456', 1, N'cd@gmail.com', N'5320001122', N'29000000000', NULL, 1, 30, CAST(0x0000A48C0186AF5E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (33, N'Ayşe Nur ', N'Çulha', N'aculha', N'ac123456', 1, N'ac@gmail.com', N'5328877999', N'31000000000', NULL, 1, 30, CAST(0x0000A48C018723C5 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (34, N'Ayşe', N'Danacı', N'adanaci', N'ad123456', 4, N'ad@gmail.com', N'5328529600', N'32000000000', NULL, 1, 0, CAST(0x0000A48C0187B8EC AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (35, N'Hazal', N'Canlı', N'hcanli', N'hc123456', 1, N'hc@gmail.com', N'5321115599', N'33000000000', NULL, 1, 34, CAST(0x0000A48C0187F1FD AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (36, N'Simge', N'Cindoruk', N'simgec', N'sc123456', 1, N'sc@gmail.com', N'5326668512', N'34000000000', NULL, 1, 34, CAST(0x0000A48C01882C41 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (37, N'İrem', N'Bulut', N'ibulut', N'ib123456', 1, N'ib@gmail.com', N'5321478500', N'35000000000', NULL, 1, 34, CAST(0x0000A48C0188507E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (38, N'Aslı', N'Balcıoğlu', N'asliba', N'ab123456', 4, N'ab@gmail.com', N'5321110025', N'36000000000', NULL, 1, 0, CAST(0x0000A48C018885B1 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (39, N'Esma Sultan', N'Başyeşil', N'sultan', N'es123456', 1, N'es@gmail.com', N'5326985214', N'37000000000', NULL, 1, 38, CAST(0x0000A48C018923C1 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (40, N'Mervenur', N'Ballı', N'mballi', N'mb123456', 1, N'mb@gmail.com', N'5326987411', N'38000000000', NULL, 1, 38, CAST(0x0000A48C018968E7 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (41, N'Bilge', N'Bıçak', N'bbicak', N'bb123456', 1, N'bb@gmail.com ', N'5321414411', N'39000000000', NULL, 1, 38, CAST(0x0000A48C01899107 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (42, N'Ayşe', N'But', N'aybute', N'ab123456', 1, N'ab@gmail.com', N'5326985417', N'41000000000', NULL, 1, 38, CAST(0x0000A48C0189B96D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (43, N'İremnur', N'Candan', N'candan', N'in123456', 1, N'ic@gmail.com', N'5326987412', N'42000000000', NULL, 1, 38, CAST(0x0000A48C0189E65F AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (45, N'Sevcan', N'Bozkıp', N'sevcan', N'sb123456', 4, N'sb@gmail.com', N'5321452360', N'43000000000', NULL, 0, 0, CAST(0x0000A48C018A1EDD AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (46, N'Dilara', N'Bakırcı', N'dilara', N'db123456', 1, N'db@gmail.cm', N'5321478965', N'44000000000', NULL, 1, 45, CAST(0x0000A48C018A55BE AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (47, N'Nilgün', N'Bodur', N'nilgun', N'nb123456', 1, N'nb@gmail.com', N'5326951478', N'45000000000', NULL, 1, 45, CAST(0x0000A48C018A814A AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (48, N'Sezen', N'Kücük', N'sezenk', N'sk123456', 1, N'sk@gmail.com', N'5321014041', N'46000000000', NULL, 1, 45, CAST(0x0000A48C018AB917 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (49, N'Alara', N'Toprak', N'toprak', N'at123456', 1, N'at@gmail.com', N'5326669988', N'47000000000', NULL, 1, 45, CAST(0x0000A48D00002B82 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (50, N'Cansu', N'Güler', N'cguler', N'cg123456', 1, N'cg@gmail.com', N'5326980014', N'48000000000', NULL, 1, 45, CAST(0x0000A48D00004D13 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (51, N'Cansu', N'Kılıç', N'ckilic', N'ck123456', 4, N'ck@gmail.com', N'5328887799', N'49000000000', NULL, 1, 0, CAST(0x0000A48D0000A0DE AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (55, N'Tuğba', N'Dikbaş', N'dikbas', N'td123456', 1, N'td@gmail.com', N'5326985222', N'51000000000', NULL, 1, 51, CAST(0x0000A48D0000E0C1 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (57, N'Burcu', N'Güney', N'burcug', N'bg123456', 1, N'bg@gmail.com', N'5321478500', N'52000000000', NULL, 1, 51, CAST(0x0000A48D00014B03 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (58, N'Özge', N'Bayrakaçan', N'bayrak', N'ob123456', 1, N'ob@gmail.com', N'5326451289', N'53000000000', NULL, 1, 51, CAST(0x0000A48D0001961D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (59, N'Ceren', N'Özçağatay', N'cerenc', N'co123456', 1, N'co@gmail.com', N'5324789631', N'54000000000', NULL, 1, 51, CAST(0x0000A48D0001C12E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (61, N'Burcu', N'Acar', N'burcua', N'ba123456', 1, N'ba@gmail.com', N'5328975641', N'55000000000', NULL, 1, 51, CAST(0x0000A48D0001F39D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (62, N'Büşra', N'Uyanık', N'busrau', N'bu123456', 4, N'bu@gmail.com', N'5324789632', N'56000000000', NULL, 1, 0, CAST(0x0000A48D00021FE8 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (63, N'Sezen', N'Ulaş', N'sezenu', N'su123456', 1, N'su@gmail.com', N'5326981423', N'57000000000', NULL, 1, 62, CAST(0x0000A48D00024BFA AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (65, N'Nergis', N'Sevinç', N'nergis', N'ns123456', 1, N'ns@gmail.com', N'5324128965', N'58000000000', NULL, 1, 62, CAST(0x0000A48D0002810E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (66, N'Ece', N'Böler', N'eboler', N'eb123456', 1, N'eb@gmail.com', N'5326984120', N'59000000000', NULL, 1, 62, CAST(0x0000A48D0002AF85 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (67, N'Gökçe', N'Alır', N'gokcea', N'ga123456', 1, N'ga@gmail.com', N'5321119955', N'61000000000', NULL, 1, 62, CAST(0x0000A48D0002D484 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (68, N'Selin', N'Berber', N'selinb', N'sb123456', 1, N'sb@gmail.com', N'5326644555', N'62000000000', NULL, 1, 62, CAST(0x0000A48D0002F56B AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (69, N'Gözde', N'Demirkıran', N'gozded', N'gd123456', 4, N'gd@gmail.com', N'5320001122', N'63000000000', NULL, 1, 62, CAST(0x0000A48D000315D2 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (70, N'Selin', N'Yılmaz', N'Seliny', N'sy123456', 1, N'sy@gmail.com', N'5326665544', N'64000000000', NULL, 1, 62, CAST(0x0000A48D00033CD2 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (71, N'Aslıhan', N'Arı', N'asliar', N'aa123456', 4, N'aa@gmail.com', N'5326611555', N'65000000000', NULL, 1, 0, CAST(0x0000A48D00036D27 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (72, N'Pelin', N'Yücel', N'peycel', N'py123456', 1, N'py@gmail.com', N'5325555555', N'66000000000', NULL, 1, 71, CAST(0x0000A48D00039B6D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (73, N'Tuğçe', N'Karaduman', N'tugcek', N'tk123456', 4, N'tk@gmail.com', N'5326982505', N'67000000000', NULL, 1, 71, CAST(0x0000A48D0003D236 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (74, N'Merve', N'Tanrıver', N'tanrim', N'mt123456', 1, N'mt@gmail.com', N'5326655444', N'68000000000', NULL, 1, 71, CAST(0x0000A48D00040427 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (75, N'Melisa', N'Kasapoğlu', N'melisa', N'mk123456', 4, N'mk@gmail.com', N'5326915486', N'69000000000', NULL, 1, 71, CAST(0x0000A48D00043588 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (76, N'Nida', N'Karakoç', N'nidakk', N'nk123456', 1, N'nk@gmail.com', N'5326541287', N'71000000000', NULL, 1, 71, CAST(0x0000A48D00045B88 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (77, N'Berra', N'Işık', N'berrai', N'bi123456', 4, N'bi@gmail.com', N'5322368740', N'72000000000', NULL, 1, 71, CAST(0x0000A48D0004BDFA AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (78, N'Sena', N'Yaman', N'senaya', N'sy123456', 1, N'sy@gmail.com', N'5326542008', N'73000000000', NULL, 1, 71, CAST(0x0000A48D0004DAAC AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (79, N'Alptuğ', N'Yaman', N'alptug', N'ay123456', 1, N'ay@gmail.com', N'5328527414', N'74000000000', NULL, 1, 0, CAST(0x0000A48D00071145 AS DateTime), 8, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (80, N'Mehmet', N'Çetinkaya', N'mehmet', N'mc123456', 1, N'mc@gmail.com', N'5329632145', N'75000000000', NULL, 1, 0, CAST(0x0000A48D0007483E AS DateTime), 8, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (81, N'Kerem', N'Şenturk', N'kerems', N'ks123456', 1, N'ks@gmail.com', N'5326541200', N'76000000000', NULL, 1, 0, CAST(0x0000A48D0007AA38 AS DateTime), 8, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (82, N'Mete', N'Albaş', N'Meteal', N'ma123456', 1, N'ma@gmail.com', N'5320011444', N'77000000000', NULL, 0, 0, CAST(0x0000A48D0007CBBC AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (83, N'Arda', N'Alp', N'ardalp', N'aa123456', 1, N'aa@gmail.com', N'5329862415', N'78000000000', NULL, 1, 82, CAST(0x0000A48D0007F994 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (84, N'Kemalcan', N'Bal', N'kemalc', N'kb123456', 1, N'kb@gmail.com', N'5322589614', N'79000000000', NULL, 0, 0, CAST(0x0000A48D00085C65 AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (85, N'Halil', N'Alper', N'halila', N'ha123456', 1, N'ha@gmail.com', N'5329658742', N'81000000000', NULL, 1, 84, CAST(0x0000A48D00094BE1 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (86, N'Barbaros', N'Billor', N'billor', N'bb123456', 1, N'bb@gmail.com', N'5322031452', N'82000000000', NULL, 0, 0, CAST(0x0000A48D00097B0F AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (87, N'Yunus', N'İnce', N'yunusi', N'yi123456', 1, N'yi@gmail.com', N'5321478523', N'83000000000', NULL, 1, 86, CAST(0x0000A48D0009AC13 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (88, N'Mert', N'Karabulut', N'mertka', N'mk123456', 1, N'mk@gmail.om', N'5321013035', N'84000000000', NULL, 0, 0, CAST(0x0000A48D0009CE2E AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (89, N'Burak', N'Kara', N'burakk', N'bk123456', 1, N'bk@gmail.com', N'5321426850', N'85000000000', NULL, 1, 88, CAST(0x0000A48D000A028C AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (90, N'Celal', N'Güler', N'celalg', N'cg123456', 1, N'cg@gmail.com', N'5328527496', N'86000000000', NULL, 0, 0, CAST(0x0000A48D000A28BB AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (91, N'Enver', N'İnce', N'enveri', N'ei123456', 1, N'ei@gmail.com', N'5326952214', N'87000000000', NULL, 1, 90, CAST(0x0000A48D000A48D1 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (92, N'Özen', N'Işık', N'ozisik', N'oi123456', 1, N'oi@gmail.com', N'5328465214', N'88000000000', NULL, 0, 0, CAST(0x0000A48D000ABC91 AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (93, N'Umut', N'Kılıç', N'umutki', N'uk123456', 1, N'uk@gmail.com', N'5326542855', N'89000000000', NULL, 1, 92, CAST(0x0000A48D000B8903 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (94, N'Anıl', N'Konya', N'anilko', N'ak123456', 1, N'ak@gmail.com', N'5321017090', N'91000000000', NULL, 1, 0, CAST(0x0000A48D000BC799 AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (95, N'Onur', N'Koç', N'onurko', N'ok123456', 1, N'ok@gmail.com', N'5328541632', N'92000000000', NULL, 1, 94, CAST(0x0000A48D000BE3D7 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (96, N'Taha', N'İryaki', N'tahair', N'ti123456', 1, N'ti@gmail.com', N'5326854521', N'93000000000', NULL, 1, 0, CAST(0x0000A48D000C147C AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (97, N'Mustafa', N'Sağlam', N'mustaf', N'ms123456', 1, N'ms@gmail.com', N'5326954752', N'94000000000', NULL, 1, 96, CAST(0x0000A48D000C54B6 AS DateTime), 2, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (98, N'Berkan ', N'Sarıkaya', N'berkay', N'bs123456', 1, N'bs@gmail.com', N'(532)-147-85-22', N'95000000000', N'', 1, 0, CAST(0x0000A48D000C7380 AS DateTime), 1, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (99, N'Burak', N'Orman', N'burako', N'bo123456', 1, N'bo@gmail.com', N'5328496321', N'96000000000', NULL, 1, 0, CAST(0x0000A48D000C9C07 AS DateTime), 5, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (100, N'Batuhan', N'Tarakçı', N'Batuha', N'bt123456', 1, N'bt@gmail.com', N'5326984120', N'97000000000', NULL, 1, 0, CAST(0x0000A48D000CCFCC AS DateTime), 5, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (101, N'Barış', N'Turan', N'Barist', N'bt123456', 1, N'bt@hotmail.com', N'5326413585', N'98000000000', NULL, 1, 0, CAST(0x0000A48D000D027A AS DateTime), 5, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (102, N'İbrahim', N'Taş', N'ibotas', N'it123456', 1, N'it@gmail.com', N'5321118855', N'99000000000', NULL, 1, 0, CAST(0x0000A48D000D29F3 AS DateTime), 5, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (103, N'Hasan', N'Yıldız', N'hasany', N'hy123456', 1, N'hy@gmail.com', N'5328456957', N'11100000000', NULL, 1, 0, CAST(0x0000A48D000D57F3 AS DateTime), 6, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (104, N'Erol', N'Baştuğ', N'bastug', N'eb123456', 1, N'eb@gmail.com', N'5326584125', N'11200000000', NULL, 1, 0, CAST(0x0000A48D0155AAF1 AS DateTime), 6, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (105, N'Sefa', N'Başar', N'sbasar', N'sb123456', 1, N'sb@gmail.com', N'5321452367', N'11300000000', NULL, 1, 0, CAST(0x0000A48D0155CF3A AS DateTime), 6, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (106, N'Ziya', N'Pancar', N'pancar', N'zp123456', 1, N'zp@gmail.com', N'5321479632', N'11400000000', NULL, 1, 0, CAST(0x0000A48D015609D6 AS DateTime), 6, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (107, N'Nusret', N'Palut', N'nusret', N'np123456', 1, N'np@gmail.com', N'5321478963', N'11500000000', NULL, 1, 0, CAST(0x0000A48D01564E23 AS DateTime), 6, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (108, N'Barbaros', N'Molla', N'bmolla', N'bm123456', 1, N'bm@gmail.com', N'5326985246', N'11600000000', NULL, 1, 0, CAST(0x0000A48D0156846E AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (109, N'Görkem', N'Mumcu', N'gmumcu', N'gm123456', 1, N'gm@gmail.com', N'5326985214', N'11700000000', NULL, 1, 0, CAST(0x0000A48D0156A99F AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (110, N'Egehan', N'Özkök', N'eozkok', N'eo123456', 1, N'eo@gmail.com', N'5326985514', N'11800000000', NULL, 1, 0, CAST(0x0000A48D0156DFCF AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (111, N'Ecem', N'Özgül', N'eozgul', N'eo123456', 4, N'eo@hotmail.com', N'5326325523', N'11900000000', NULL, 1, 0, CAST(0x0000A48D01570C14 AS DateTime), 3, 0)
GO
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (112, N'Dilara', N'Ayşim', N'dilara', N'da123456', 1, N'da@gmail.com', N'5326985214', N'12100000000', NULL, 1, 111, CAST(0x0000A48D0157346D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (113, N'Bahar', N'Merve', N'bmerve', N'bm123456', 1, N'bm@gmail.com', N'5326325418', N'12200000000', NULL, 1, 111, CAST(0x0000A48D0157531E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (114, N'Kevser ', N'Portakal', N'kevser', N'kp123456', 1, N'kp@gmail.com', N'5320145235', N'12300000000', NULL, 1, 111, CAST(0x0000A48D01577985 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (115, N'Özge', N'Kuntman', N'kuntma', N'ok123456', 4, N'ok@gmail.com', N'5329628456', N'12400000000', NULL, 1, 111, CAST(0x0000A48D0157C00C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (116, N'Sıla', N'Kurtuluş', N'silaku', N'sk123456', 1, N'sk@gmail.com', N'5326262321', N'12500000000', NULL, 1, 111, CAST(0x0000A48D0157EDD1 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (117, N'Melike', N'Tamara', N'tamara', N'mt123456', 1, N'mt@gmail.com', N'5326985454', N'12600000000', NULL, 1, 111, CAST(0x0000A48D01581117 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (118, N'Berna', N'Küçükkase', N'bernak', N'bk123456', 1, N'bk@gmail.com', N'5326955552', N'12700000000', NULL, 1, 111, CAST(0x0000A48D01586808 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (119, N'Bahar', N'Karaca', N'bahark', N'bk123456', 4, N'bk@hotmail.com', N'5323695545', N'12800000000', NULL, 1, 0, CAST(0x0000A48D01589C6D AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (120, N'Melis', N'Masır', N'melism', N'mm123456', 1, N'mm@gmail.com', N'5325874655', N'12900000000', NULL, 1, 119, CAST(0x0000A48D015906B9 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (121, N'Karaca', N'Maydagil', N'karaca', N'km123456', 1, N'km@gmail.com', N'5326951236', N'13100000000', NULL, 1, 119, CAST(0x0000A48D0159465E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (122, N'Seren', N'Karakan', N'serenk', N'sk123456', 1, N'sk@gmail.com', N'5326685566', N'13200000000', NULL, 1, 119, CAST(0x0000A48D0160CFED AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (123, N'Esma', N'Sezer', N'esmase', N'es123456', 4, N'es@gmail.com', N'5326564512', N'13300000000', NULL, 1, 119, CAST(0x0000A48D016160B9 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (124, N'Gözde', N'Turan', N'gozdet', N'gt123456', 1, N'gt@gmail.com', N'5321232032', N'13400000000', NULL, 1, 119, CAST(0x0000A48D01618032 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (125, N'Zeynep', N'Günel', N'zeynep', N'zg123456', 1, N'zg@gmail.com', N'5326985452', N'13500000000', NULL, 1, 119, CAST(0x0000A48D01619F6A AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (126, N'Gizem', N'Korkmaz', N'gizemk', N'gk123456', 1, N'gk@gmail.com', N'5326545654', N'13600000000', NULL, 1, 119, CAST(0x0000A48D0161CE92 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (127, N'Dolunay', N'Gül', N'doluna', N'dg123456', 4, N'dg@gmail.com', N'5326564564', N'13700000000', NULL, 1, 0, CAST(0x0000A48D0161F624 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (128, N'Selma', N'Aksay', N'selmaa', N'sa123456', 1, N'sq@gmail.com', N'5326564646', N'13800000000', NULL, 1, 127, CAST(0x0000A48D0162224F AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (129, N'Semiha', N'Balkaya', N'semiha', N'sb123456', 1, N'sb@gmail.com', N'5325565522', N'13900000000', NULL, 1, 127, CAST(0x0000A48D01623CF0 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (130, N'Serap', N'Altınok', N'serapa', N'sa123456', 1, N'sa@gmail.com', N'5362854165', N'14100000000', NULL, 1, 127, CAST(0x0000A48D0162805E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (133, N'Zeynep', N'Aras', N'zeynep', N'za123456', 4, N'za@gmail.com', N'5326565640', N'14200000000', NULL, 1, 0, CAST(0x0000A48D0162B39F AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (134, N'Deniz', N'Kılıç', N'denizk', N'dk123456', 1, N'dk@gmail.com', N'5326565202', N'14300000000', NULL, 1, 133, CAST(0x0000A48D0162DD82 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (135, N'Aysun', N'Çol', N'aysunc', N'ac123456', 1, N'ac@gmail.com', N'5326563323', N'14400000000', NULL, 1, 133, CAST(0x0000A48D016324DC AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (137, N'Hilal', N'Irmak', N'hirmak', N'hi123456', 1, N'hi@gmail.com', N'5326655646', N'14500000000', NULL, 1, 133, CAST(0x0000A48D01635A2D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (138, N'Zehra', N'Koç', N'zehrak', N'zk123456', 4, N'zk@gmail.com', N'5326854163', N'14600000000', NULL, 1, 0, CAST(0x0000A48D01637D08 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (140, N'Şenay', N'Cuma', N'senayc', N'sc123456', 1, N'sc@gmail.com', N'5326985494', N'14700000000', NULL, 1, 138, CAST(0x0000A48D01639FA1 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (141, N'Çiğdem', N'Topuz', N'cigdem', N'ct123456', 1, N'ct@gmail.com', N'5326565652', N'14800000000', NULL, 1, 138, CAST(0x0000A48D0163C69F AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (143, N'Didem', N'Aksoy', N'didema', N'da123456', 1, N'da@gmail.com', N'5322341856', N'14900000000', NULL, 1, 138, CAST(0x0000A48D0163EAD4 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (144, N'Nadide ', N'Başeğmez', N'nadide', N'nb123456', 4, N'nb@gmail.com', N'5326565854', N'15100000000', NULL, 1, 138, CAST(0x0000A48D01642145 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (145, N'Funda', N'Evsen', N'fundae', N'fe123456', 1, N'fe@gmail.com', N'5326598552', N'15200000000', NULL, 1, 138, CAST(0x0000A48D01643BE7 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (146, N'Gülşen', N'Güven', N'gguven', N'gg123456', 1, N'gg@gmail.com', N'5320011223', N'15300000000', NULL, 1, 138, CAST(0x0000A48D01645B08 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (147, N'Esin', N'Demirden', N'esinde', N'ed123456', 1, N'ed@gmail.com', N'5326565858', N'15400000000', NULL, 1, 138, CAST(0x0000A48D01648393 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (148, N'Nevin', N'Hızlı', N'nevinh', N'nh123456', 4, N'nh@gmail.com', N'5326446321', N'15500000000', NULL, 1, 0, CAST(0x0000A48D0164A998 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (149, N'Suzan', N'Pamuk', N'suzanp', N'sp123456', 1, N'sp@gmail.com', N'5326564654', N'15600000000', NULL, 1, 148, CAST(0x0000A48D0164CD3D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (150, N'Aysun', N'Çelebioğlu', N'aysunc', N'ac123456', 1, N'ac@gmail.com', N'5326564784', N'15700000000', NULL, 1, 148, CAST(0x0000A48D0164F8BA AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (151, N'Yeşim', N'Yavuz', N'yyavuz', N'yy123456', 1, N'yy@gmail.com', N'5326565888', N'15800000000', NULL, 1, 148, CAST(0x0000A48D01651F1D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (152, N'Banu', N'Balta', N'bbalta', N'bb123456', 4, N'bb@gmail.com', N'5326523652', N'15900000000', NULL, 1, 148, CAST(0x0000A48D0165431B AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (153, N'Handan', N'Yavuz', N'handan', N'hy123456', 1, N'hy@gmail.com', N'5326502020', N'16100000000', NULL, 1, 148, CAST(0x0000A48D016566D5 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (154, N'Fulya', N'Tezel', N'fulyat', N'ft123456', 1, N'ft@gmail.com', N'5326564547', N'16200000000', NULL, 1, 148, CAST(0x0000A48D01658B8E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (155, N'Lamia', N'Başkal', N'lamiab', N'lb123456', 1, N'lb@gmail.com', N'5252478989', N'16300000000', NULL, 1, 148, CAST(0x0000A48D0165B5B4 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (156, N'Sibel', N'Yetkin', N'sibely', N'sy123456', 4, N'sy@gmail.com', N'5326565658', N'16400000000', NULL, 1, 0, CAST(0x0000A48D0165F993 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (157, N'Hülya', N'Uz', N'hulyau', N'hu123456', 1, N'hu@gail.com', N'5326562587', N'16500000000', NULL, 1, 156, CAST(0x0000A48D016618D3 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (158, N'Pınar', N'Gül', N'pinarg', N'pg123456', 1, N'pg@gmail.com', N'5325874669', N'16600000000', NULL, 1, 156, CAST(0x0000A48D01666488 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (159, N'Elmas', N'Kurt', N'elmask', N'ek123456', 1, N'ek@gmail.com', N'5326565323', N'16700000000', NULL, 1, 156, CAST(0x0000A48D0166CD66 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (160, N'Damla', N'Şahin', N'damlas', N'ds123456', 4, N'ds@gmail.com', N'5325465484', N'16800000000', NULL, 1, 156, CAST(0x0000A48D01682D8D AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (161, N'Ayda ', N'Gürsel', N'aydagu', N'ag123456', 1, N'ag@gmail.com', N'5326578852', N'16900000000', NULL, 1, 156, CAST(0x0000A48D01684E63 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (162, N'Sultan', N'Şeker', N'sseker', N'ss123456', 1, N'ss@gmail.com', N'5325325325', N'17100000000', NULL, 1, 156, CAST(0x0000A48D01687B08 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (164, N'Mine', N'Güler', N'minegu', N'mg123456', 1, N'mg@gmail.com', N'5328528974', N'17200000000', NULL, 1, 156, CAST(0x0000A48D0168A74E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (165, N'Duygu', N'Şenen', N'duygus', N'ds123456', 4, N'ds@gmail.com', N'5321478236', N'17300000000', NULL, 1, 0, CAST(0x0000A48D0168C6C5 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (166, N'Handan', N'Ergin', N'handan', N'he123456', 1, N'he@gmail.com', N'5326984646', N'17400000000', NULL, 1, 165, CAST(0x0000A48D0169116B AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (167, N'Derya', N'Aslan', N'deryaa', N'da123456', 1, N'da@gmail.com', N'5328879687', N'17500000000', NULL, 1, 165, CAST(0x0000A48D01692C83 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (168, N'Nevin', N'Çalık', N'nevinc', N'nc123456', 1, N'nc@gmail.com', N'5326528865', N'17600000000', NULL, 1, 165, CAST(0x0000A48D01695230 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (169, N'Nazan', N'Keskin', N'nazank', N'nk123456', 1, N'nk@gmail.com', N'5325874587', N'17700000000', NULL, 1, 165, CAST(0x0000A48D016973E0 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (170, N'Gülgün', N'Ulusoy', N'gulgun', N'gu123456', 1, N'gu@gmail.com', N'5328546528', N'17800000000', NULL, 1, 165, CAST(0x0000A48D01699A60 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (171, N'İlkay', N'Yakar', N'ilkayy', N'iy123456', 4, N'iy@gmail.com', N'5326985454', N'17900000000', NULL, 1, 0, CAST(0x0000A48D0169B798 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (172, N'Çiğdem', N'Bayram', N'cigdem', N'cb123456', 1, N'cb@gmail.com', N'5326598646', N'18100000000', NULL, 1, 171, CAST(0x0000A48D0169EF45 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (173, N'Gülşen', N'Tanır', N'gulsen', N'gt123456', 1, N'gt@gmail.com', N'5326985489', N'18200000000', NULL, 1, 171, CAST(0x0000A48D016A13B3 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (174, N'Candan', N'Çevik', N'candan', N'cc123456', 1, N'cc@gmail.com', N'5322215488', N'18300000000', NULL, 1, 171, CAST(0x0000A48D016A309B AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (175, N'Güler', N'Uca', N'guleru', N'gu123456', 1, N'gu@gmail.com', N'5326598989', N'18400000000', NULL, 1, 171, CAST(0x0000A48D016A4C1B AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (176, N'Elif', N'Avunya', N'elifav', N'ea123456', 1, N'ea@gmail.com', N'5326565989', N'18500000000', NULL, 1, 171, CAST(0x0000A48D016A68BB AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (177, N'Sedef', N'Küçük', N'sedefk', N'sk123456', 4, N'sk@gmail.com', N'5326568577', N'18600000000', NULL, 1, 0, CAST(0x0000A48D016AA43E AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (178, N'Sedef', N'Şayan', N'sedefs', N'ss123456', 1, N'ss@hotmail.com', N'5325458788', N'18700000000', NULL, 1, 177, CAST(0x0000A48D016ACD52 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (179, N'Başak', N'Karakaş', N'basakk', N'bk123456', 1, N'bk@gmail.com', N'5326585255', N'18800000000', NULL, 1, 177, CAST(0x0000A48D016AF2D7 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (180, N'Banu', N'Alver', N'banual', N'ba123456', 1, N'ba@gmail.com', N'5321478963', N'18900000000', NULL, 1, 177, CAST(0x0000A48D016B0F4E AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (181, N'Meryem', N'Ünlü', N'meryem', N'mu123456', 1, N'mu@gmail.com', N'5326589565', N'19100000000', NULL, 1, 177, CAST(0x0000A48D016B2CBF AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (182, N'Beyza', N'Öz', N'beyzao', N'bo123456', 1, N'bo@gmail.com', N'5322211447', N'19200000000', NULL, 1, 177, CAST(0x0000A48D016B49BE AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (183, N'Duygu', N'Bal', N'duygub', N'db123456', 4, N'db@gmail.com', N'5322255884', N'19300000000', NULL, 1, 0, CAST(0x0000A48D016B86A1 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (185, N'Sevil', N'Acar', N'sevila', N'sa123456', 1, N'sa@yahoo.com', N'5320202032', N'19400000000', NULL, 1, 183, CAST(0x0000A48D016BB2C0 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (186, N'Burçak', N'Saral', N'burcak', N'bs123456', 1, N'bs@gmail.com', N'5326585455', N'19500000000', NULL, 1, 183, CAST(0x0000A48D016BD7C2 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (187, N'Ebru', N'Ot', N'ebruot', N'eo123456', 1, N'eo@gmail.com', N'5326598525', N'19600000000', NULL, 1, 183, CAST(0x0000A48D016BF843 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (188, N'Meral', N'Can', N'meralc', N'mc123456', 1, N'mc@gmail.com', N'5326585465', N'19700000000', NULL, 1, 183, CAST(0x0000A48D016C188F AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (189, N'Beyza', N'Terzi', N'beyzat', N'bt123456', 1, N'bt@gmail.com', N'5326568584', N'19800000000', NULL, 1, 183, CAST(0x0000A48D01731104 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (191, N'Deniz', N'Diribaş', N'denizd', N'dd123456', 4, N'dd@gmail.com', N'5326565644', N'19900000000', NULL, 1, 0, CAST(0x0000A48D01734C45 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (192, N'Ezgi', N'Geyik', N'ezgige', N'eg123456', 1, N'eg@gmail.com', N'5326565647', N'21100000000', NULL, 1, 191, CAST(0x0000A48D017376E3 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (193, N'Merve', N'Acar', N'mervea', N'ma123456', 1, N'ma@gmail.com', N'5320000111', N'21200000000', NULL, 1, 191, CAST(0x0000A48D0173A36F AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (194, N'Mine', N'Şensoy', N'miness', N'ms123456', 1, N'ms@gmail.com', N'5326235353', N'21300000000', NULL, 1, 191, CAST(0x0000A48D0173C563 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (195, N'Özge', N'Arı', N'ozgear', N'oa123456', 1, N'oa@gmail.com', N'5326585858', N'21400000000', NULL, 1, 191, CAST(0x0000A48D0173E106 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (196, N'Tuğçe', N'Peker', N'ozgepe', N'op123456', 1, N'op@gmail.com', N'5322125874', N'21500000000', NULL, 1, 191, CAST(0x0000A48D01740415 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (197, N'Yasemin', N'Duman', N'yasemi', N'yd123456', 4, N'yd@gmail.com', N'5324565456', N'21600000000', NULL, 1, 0, CAST(0x0000A48D017425D7 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (198, N'Begüm', N'Şener', N'begums', N'bs123456', 1, N'bs@gmail.com', N'5326565654', N'21700000000', NULL, 1, 197, CAST(0x0000A48D01744EE0 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (199, N'Büşra', N'Demir', N'busrad', N'bd123456', 1, N'bd@gmail.com', N'5325252521', N'21800000000', NULL, 1, 197, CAST(0x0000A48D0174A532 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (200, N'Dilay', N'Temel', N'dilayt', N'dt123456', 1, N'dt@gmail.com', N'5326565625', N'21900000000', NULL, 1, 197, CAST(0x0000A48D0174F3CE AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (201, N'Gizem', N'Güler', N'gguler', N'gg123456', 1, N'gg@yahoo.com', N'5326568574', N'22100000000', NULL, 1, 197, CAST(0x0000A48D017513DA AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (202, N'İrem', N'Karpat', N'iremka', N'ik123456', 1, N'ik@gmail.com', N'5323665654', N'22200000000', NULL, 1, 197, CAST(0x0000A48D017534A6 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (203, N'Melisa', N'Çelik', N'melisa', N'mc123456', 4, N'mc@gmail.com', N'5326598565', N'22300000000', NULL, 1, 0, CAST(0x0000A48D0175516B AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (204, N'Sıla', N'Türk', N'silatu', N'st123456', 1, N'st@gmail.com', N'5321010203', N'22400000000', NULL, 1, 203, CAST(0x0000A48D01756EBC AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (205, N'Ada', N'Gök', N'adagok', N'ag123456', 1, N'ag@gmail.com', N'5325456545', N'22500000000', NULL, 1, 203, CAST(0x0000A48D01759C9B AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (206, N'Bahar', N'Süncak', N'bahars', N'bs123456', 1, N'bs@yahoo.com', N'5326502020', N'22600000000', NULL, 1, 203, CAST(0x0000A48D0175CA5A AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (207, N'Beril', N'Sicim', N'berils', N'bs123456', 1, N'bs@hotmail.com.tr', N'5326753215', N'22700000000', NULL, 1, 203, CAST(0x0000A48D0175ED41 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (208, N'Buse', N'Kalkan', N'buseka', N'bk123456', 1, N'bk@gmail.com', N'5325846258', N'22800000000', NULL, 1, 203, CAST(0x0000A48D017611B1 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (210, N'Çağla', N'Şen', N'caglas', N'cs123456', 4, N'cs@gmail.com', N'5325985466', N'22900000000', NULL, 1, 0, CAST(0x0000A48D01763157 AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (211, N'Gözde', N'Onay', N'gozdeo', N'go123456', 1, N'go@gmail.com', N'5321479635', N'23100000000', NULL, 1, 210, CAST(0x0000A48D01765438 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (212, N'Irmak', N'Yıldırım', N'irmaki', N'iy123456', 4, N'iy@yahoo.com', N'5326852552', N'23200000000', NULL, 1, 210, CAST(0x0000A48D01767A1F AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (213, N'Sena', N'Çelik', N'senaca', N'sc123456', 1, N'sc@gmail.com', N'(532)-656-85-45', N'23300000000', N'', 1, 210, CAST(0x0000A48E0128E7D0 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (214, N'Asya', N'Şengün', N'asyase', N'as123456', 4, N'as@gmail.com', N'5322426252', N'23400000000', NULL, 1, 210, CAST(0x0000A48D0176DE8C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (215, N'Aybüke', N'Yol', N'aybuke', N'ay123456', 1, N'ay@yahoo.com', N'5320120858', N'23500000000', NULL, 1, 210, CAST(0x0000A48D017702C5 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (216, N'Aysel', N'Şeker', N'aysels', N'as123456', 4, N'as@gmail.com', N'5328978978', N'23600000000', NULL, 1, 210, CAST(0x0000A48D01771F74 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (217, N'Beyza', N'Cicik', N'beyzac', N'bc123456', 1, N'bc@gmail.com', N'5328528585', N'23700000000', NULL, 1, 210, CAST(0x0000A48D017746BE AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (218, N'Buse', N'Çetin', N'busece', N'bc123456', 4, N'bc@hotmail.com.tr', N'5328465858', N'23800000000', NULL, 1, 0, CAST(0x0000A48D01777C5A AS DateTime), 3, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (219, N'Deniz', N'Tok', N'denizt', N'dt123456', 1, N'dt@gmail.com', N'5324147414', N'23900000000', NULL, 1, 218, CAST(0x0000A48D0177A424 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (220, N'Ezgi', N'Ergi', N'ezergi', N'ee123456', 4, N'ee@gmail.com', N'5326585452', N'24100000000', NULL, 1, 218, CAST(0x0000A48D0177C65E AS DateTime), 4, 0)
GO
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (221, N'Gözde', N'Ak', N'gozdea', N'ga123456', 1, N'ga@gmail.com', N'5326568556', N'24200000000', NULL, 1, 218, CAST(0x0000A48D0177E2D2 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (222, N'Gülce', N'Gül', N'gülgül', N'gg123456', 4, N'gg@hotmail.com', N'5328585879', N'24300000000', NULL, 1, 218, CAST(0x0000A48D01780265 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (223, N'İlayda', N'Oruç', N'ilayda', N'io123456', 1, N'ia@gmail.com', N'5321199558', N'24400000000', NULL, 1, 218, CAST(0x0000A48D01785552 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (224, N'İmran', N'Uğur', N'imranu', N'iu123456', 4, N'iu@gmail.com', N'5326565685', N'24500000000', NULL, 1, 218, CAST(0x0000A48D01787E1C AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (226, N'Melisa', N'Taşlı', N'melisa', N'mt123456', 1, N'mt@gmail.com', N'5328584658', N'24600000000', NULL, 1, 218, CAST(0x0000A48D0178B906 AS DateTime), 4, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (227, N'Öykü', N'Ürgen', N'oykuur', N'ou123456', 1, N'ou@gmail.com', N'5325878988', N'24700000000', NULL, 1, 0, CAST(0x0000A48D0178DF58 AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (228, N'Seher', N'Sadıç', N'sehers', N'ss123456', 1, N'ss@hotmail.com.tr', N'5326558855', N'24800000000', NULL, 1, 0, CAST(0x0000A48D0178FF11 AS DateTime), 6, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (229, N'Yağmur', N'Boz', N'yagmur', N'yb123456', 1, N'yb@gmail.com', N'5326568956', N'24900000000', NULL, 1, 0, CAST(0x0000A48D01792602 AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (230, N'Efsun', N'Yıldız', N'efsuny', N'ey123456', 1, N'ey@gmail.com', N'5326587854', N'25100000000', NULL, 1, 0, CAST(0x0000A48D01794A0C AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (233, N'Hülya', N'Şaşar', N'hulyas', N'hs123456', 1, N'hs@yahoo.com', N'5326540202', N'25200000000', NULL, 1, 0, CAST(0x0000A48F000CD6DE AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (236, N'Sibel', N'Kar', N'sibelk', N'sk123456', 1, N'sk@hotmail.com.tr', N'5326521452', N'25300000000', NULL, 1, 0, CAST(0x0000A48F000D7D47 AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (251, N'Nazlı', N'Keten', N'nazlık', N'nk123456', 1, N'nk@gmail.com', N'5326585254', N'25400000000', NULL, 1, 0, CAST(0x0000A49000B6AEBB AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (253, N'Tülay', N'Soner', N'gsgs', N'gs123456', 1, N'gs@gmail.com', N'(532)-333-33-33', N'33333333333', N'', 1, 0, CAST(0x0000A43600000000 AS DateTime), 7, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (255, N'Ayşe', N'Koşar', N'akosar', N'ak123456', 1, N'ak@gmail.com', N'(532)-652-22-11', N'25600000000', N'İstanbul', 1, 0, CAST(0x0000A43600000000 AS DateTime), 8, 0)
INSERT [dbo].[Personeller] ([PersonelID], [PersonelAdi], [PersonelSoyadi], [KullaniciAdi], [KullaniciSifresi], [YetkiTipiID], [Mail], [Telefon], [PersonelTCK], [Adres], [Uygunluk], [UstuID], [IseBaslamaTarihi], [GorevID], [Silindi]) VALUES (262, N'Asya', N'Keleş', N'asyake', N'ak123456', 4, N'ak@gmail.com', N'(532)-155-84-65', N'77777777777', N'Mecidiyeköy - İstanb', 1, 0, CAST(0x0000A4AD000D2DD4 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
SET IDENTITY_INSERT [dbo].[Satis] ON 

INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (4, 1, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (5, 2, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (6, 3, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (7, 4, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (8, 5, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (9, 6, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (10, 7, 1, N'Nakit', 251, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (11, 8, 1, N'Nakit', 236, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (13, 9, 1, N'Nakit', 236, 0)
INSERT [dbo].[Satis] ([RezervasyonID], [MusteriID], [UcusKodu], [OdemeTipi], [PersonelID], [Silindi]) VALUES (14, 10, 1, N'Nakit', 236, 0)
SET IDENTITY_INSERT [dbo].[Satis] OFF
SET IDENTITY_INSERT [dbo].[Ucaklar] ON 

INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (5, N'Hayal', N'Embraer E190', 110, 3300, N'', 101, CAST(0x0000A49800000000 AS DateTime), N'', 0, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (6, N'Masal', N'Embraer E190', 110, 3300, NULL, 101, NULL, NULL, 0, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (13, N'Rüya', N'Embraer E190', 110, 3300, NULL, 101, NULL, NULL, 0, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (14, N'Hezarfen', N'Embraer E190', 110, 3300, NULL, 101, NULL, NULL, 0, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (15, N'Vecihi', N'Embraer E190', 110, 3300, NULL, 102, NULL, NULL, 0, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (16, N'Anka', N'Boeing 707 - 120', 140, 5300, NULL, 102, NULL, NULL, 0, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (17, N'Ikarus', N'Boeing 707 - 120', 140, 5300, NULL, 102, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (19, N'Pegasus', N'Boeing 707 - 120', 140, 5300, NULL, 103, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (20, N'Prometheus', N'Boeing 707 - 120', 140, 5300, NULL, 103, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (21, N'Güneş', N'Embraer EMB 120', 40, 1300, NULL, 103, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (22, N'Ay', N'Embraer EMB 120', 40, 1300, NULL, 103, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (23, N'Yıldız', N'Embraer EMB 120', 40, 1300, NULL, 103, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (25, N'Bulut', N'Embraer EMB 120', 40, 1300, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (26, N'Sema', N'Embraer EMB 120', 40, 1300, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (27, N'Yakamoz', N'Embraer EMB 120', 40, 1300, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (28, N'Mehtap', N'Embraer EMB 120', 40, 1300, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (29, N'Uzay', N'Embraer EMB 120', 40, 1300, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (30, N'Machbeth', N'Airbus A340', 270, 13700, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (31, N'Lear', N'Airbus A340', 270, 13700, NULL, 104, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (32, N'Romeo', N'Airbus A340', 270, 13700, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (33, N'Juliet', N'Airbus A340', 270, 13700, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (34, N'Hamlet', N'Airbus A340', 270, 13700, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (36, N'Desdemona', N'Airbus A340', 270, 13700, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (38, N'Bodrum', N'Boeing 737 - 700ER', 130, 10200, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (40, N'Çeşme', N'Boeing 737 - 700ER', 130, 10200, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (41, N'Kemer', N'Boeing 737 - 700ER', 130, 10200, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (42, N'Fethiye', N'Boeing 737 - 700ER', 130, 10200, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (43, N'Ayvalık', N'Boeing 737 - 700ER', 130, 10200, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (44, N'Neo', N'Embraer ERJ 145', 50, 2500, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (45, N'Morpheus', N'Embraer ERJ 145', 50, 2500, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (46, N'Trinity', N'Embraer ERJ 145', 50, 2500, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (47, N'Persephone', N'Embraer ERJ 145', 50, 2500, NULL, 105, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (48, N'Smith', N'Embraer ERJ 145', 50, 2500, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (50, N'MrAnderson', N'Embraer ERJ 145', 50, 2500, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (51, N'TheChoosenOne', N'Embraer ERJ 145', 50, 2500, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (87, N'BlackSabbath', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (88, N'LedZeppelin', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (89, N'PinkFloyd', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (90, N'Rainbow', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (91, N'DeepPurple', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (92, N'ACDC', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (93, N'DepecheMode', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (94, N'Motörhead', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (95, N'IronMaiden', N'Airbus A340', 270, 13700, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (96, N'RE-L', N'Boeing 707 - 120', 140, 5300, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (97, N'124', N'Boeing 707 - 120', 140, 5300, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (98, N'C41+', N'Boeing 707 - 120', 140, 5300, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (100, N'Black', N'Boeing 707 - 120', 140, 5300, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (101, N'White', N'Boeing 707 - 120', 140, 5300, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (102, N'Red', N'Boeing 707 - 120', 140, 5300, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (103, N'Yellow', N'Embraer ERJ 145', 50, 2500, NULL, 106, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (104, N'Green', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (105, N'Brown', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (106, N'Gray', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (107, N'Purple', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (108, N'Pink', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (109, N'Orange', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (110, N'Silver', N'Embraer ERJ 145', 50, 2500, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (111, N'Odin', N'Boeing 777-300ER', 410, 14200, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (112, N'Thor', N'Boeing 777-300ER', 410, 14200, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (113, N'Loki', N'Boeing 777-300ER', 410, 14200, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (114, N'Tyr', N'Boeing 777-300ER', 410, 14200, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (115, N'Heimdall', N'Boeing 777-300ER', 410, 14200, NULL, 107, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (116, N'Balder', N'Boeing 777-300ER', 410, 14200, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (117, N'Njord', N'Boeing 777-300ER', 410, 14200, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (118, N'Vidar', N'Boeing 777-300ER', 410, 14200, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (119, N'Vali', N'Boeing 777-300ER', 410, 14200, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (120, N'Zeus', N'Fokker 70', 80, 2400, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (121, N'Poseidon', N'Fokker 70', 80, 2400, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (122, N'Ares', N'Fokker 70', 80, 2400, NULL, 228, NULL, NULL, 1, 0)
INSERT [dbo].[Ucaklar] ([UcakID], [UcakAdi], [UcakTuru], [Kontenjani], [UcusMesafesi], [UcusSuresi], [BakiminiYapanMuhendisID], [SonBakimTarihi], [BakimAciklamasi], [Uygunluk], [Silindi]) VALUES (123, N'Athena', N'Fokker 70', 80, 2400, NULL, 228, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Ucaklar] OFF
SET IDENTITY_INSERT [dbo].[Ucuslar] ON 

INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (1, 1, 2, 366, CAST(0x0000000000000000 AS DateTime), CAST(0x0000A41700000000 AS DateTime), 3, 90, 82, 160.0000, 5, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (2, 1, 3, 329, CAST(0x0000000000000000 AS DateTime), CAST(0x0000A41700000000 AS DateTime), 10, 84, 82, 170.0000, 6, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (3, 1, 10, 2506, CAST(0x0000000000000000 AS DateTime), CAST(0x0000000000000000 AS DateTime), 14, 86, 82, 650.0000, 16, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (5, 1, 2, 366, CAST(0x0000A4A800F73140 AS DateTime), CAST(0x0000A4A80107AC00 AS DateTime), 3, 90, 83, 160.0000, 5, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (6, 1, 4, 444, CAST(0x0000A54700C5C100 AS DateTime), CAST(0x0000A56500D63BC0 AS DateTime), 26, 92, 83, 1212.0000, 17, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (7, 1, 2, 366, CAST(0x0000A4A50000B5FE AS DateTime), CAST(0x0000A4A50000B5FE AS DateTime), 3, 90, 82, 160.0000, 5, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (16, 1, 29, 3500, CAST(0x0000A4A500CA11A9 AS DateTime), CAST(0x0000A4A500CA11A9 AS DateTime), 10, 84, NULL, 350.0000, 14, 1)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (17, 1, 2, 650, CAST(0x0000A4AA00A4CB80 AS DateTime), CAST(0x0000A4AA00B80560 AS DateTime), 3, 84, NULL, 200.0000, 5, 0)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (18, 1, 15, 3500, CAST(0x0000A4AB00C5C100 AS DateTime), CAST(0x0000A4AB00FF6EA0 AS DateTime), 10, 86, NULL, 600.0000, 6, 0)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (19, 1, 28, 5000, CAST(0x0000A4AD016A8C80 AS DateTime), CAST(0x0000A4AE0039ADA0 AS DateTime), 14, 88, NULL, 650.0000, 13, 0)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (20, 1, 35, 13000, CAST(0x0000A4AC0062E080 AS DateTime), CAST(0x0000A4AC01499700 AS DateTime), 18, 90, NULL, 1250.0000, 14, 0)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (21, 1, 51, 15000, CAST(0x0000A4AA00317040 AS DateTime), CAST(0x0000A4AA01499700 AS DateTime), 22, 92, NULL, 1500.0000, 15, 0)
INSERT [dbo].[Ucuslar] ([UcusID], [NeredenID], [NereyeID], [Mesafe], [TahminiKalkis], [TahminiVaris], [KabinEkibiID], [PilotID], [PersonelID], [Ucret], [UcakID], [Silindi]) VALUES (22, 1, 54, 12000, CAST(0x0000A4AD0062E080 AS DateTime), CAST(0x0000A4AD01499700 AS DateTime), 45, 82, NULL, 1200.0000, 16, 0)
SET IDENTITY_INSERT [dbo].[Ucuslar] OFF
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([YetkiliID], [YetkiliAd], [Silindi]) VALUES (1, N'User', 0)
INSERT [dbo].[Yetki] ([YetkiliID], [YetkiliAd], [Silindi]) VALUES (3, N'SuperUser', 0)
INSERT [dbo].[Yetki] ([YetkiliID], [YetkiliAd], [Silindi]) VALUES (4, N'Manager', 0)
INSERT [dbo].[Yetki] ([YetkiliID], [YetkiliAd], [Silindi]) VALUES (1007, N'JR', 1)
SET IDENTITY_INSERT [dbo].[Yetki] OFF
/****** Object:  Index [MusteriTCK]    Script Date: 05.06.2015 12:01:48 ******/
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [MusteriTCK] UNIQUE NONCLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [TCK]    Script Date: 05.06.2015 12:01:48 ******/
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [TCK] UNIQUE NONCLUSTERED 
(
	[PersonelTCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dil] ADD  CONSTRAINT [DF_Dil_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[DilLogID] ADD  CONSTRAINT [DF_DilLogID_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Gorevler] ADD  CONSTRAINT [DF_Gorevler_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[HavaAlanlari] ADD  CONSTRAINT [DF_HavaAlanlari_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [DF_Musteriler_SatisID]  DEFAULT ((0)) FOR [SatisID]
GO
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [DF_Musteriler_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_Uygunluk]  DEFAULT ((1)) FOR [Uygunluk]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_İseBaslamaTarihi]  DEFAULT (getdate()) FOR [IseBaslamaTarihi]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Satis] ADD  CONSTRAINT [DF_Satış_OdemeTipi]  DEFAULT ('Nakit') FOR [OdemeTipi]
GO
ALTER TABLE [dbo].[Satis] ADD  CONSTRAINT [DF_Rezervasyonlar_Sİlindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Ucaklar] ADD  CONSTRAINT [DF_Ucaklar_Uygunluk]  DEFAULT ((1)) FOR [Uygunluk]
GO
ALTER TABLE [dbo].[Ucaklar] ADD  CONSTRAINT [DF_Ucaklar_Silinidi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Ucuslar] ADD  CONSTRAINT [DF_Ucuslar_TahminiKalkis]  DEFAULT (getdate()) FOR [TahminiKalkis]
GO
ALTER TABLE [dbo].[Ucuslar] ADD  CONSTRAINT [DF_Ucuslar_TahminiVaris]  DEFAULT (getdate()) FOR [TahminiVaris]
GO
ALTER TABLE [dbo].[Ucuslar] ADD  CONSTRAINT [DF_Ucuslar_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[Yetki] ADD  CONSTRAINT [DF_Yetki_Silindi]  DEFAULT ((0)) FOR [Silindi]
GO
ALTER TABLE [dbo].[DilLogID]  WITH CHECK ADD  CONSTRAINT [FK_DilLogID_Dil] FOREIGN KEY([DilID])
REFERENCES [dbo].[Dil] ([DilID])
GO
ALTER TABLE [dbo].[DilLogID] CHECK CONSTRAINT [FK_DilLogID_Dil]
GO
ALTER TABLE [dbo].[DilLogID]  WITH CHECK ADD  CONSTRAINT [FK_DilLogID_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[DilLogID] CHECK CONSTRAINT [FK_DilLogID_Personeller]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Gorevler] FOREIGN KEY([GorevID])
REFERENCES [dbo].[Gorevler] ([GorevID])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Gorevler]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Yetki] FOREIGN KEY([YetkiTipiID])
REFERENCES [dbo].[Yetki] ([YetkiliID])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Yetki]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satış_Musteriler] FOREIGN KEY([MusteriID])
REFERENCES [dbo].[Musteriler] ([MusteriID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satış_Musteriler]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satış_Personeller+] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satış_Personeller+]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satış_Ucuslar+-] FOREIGN KEY([UcusKodu])
REFERENCES [dbo].[Ucuslar] ([UcusID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satış_Ucuslar+-]
GO
ALTER TABLE [dbo].[Ucaklar]  WITH CHECK ADD  CONSTRAINT [FK_Ucaklar+_Personeller+] FOREIGN KEY([BakiminiYapanMuhendisID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[Ucaklar] CHECK CONSTRAINT [FK_Ucaklar+_Personeller+]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_HavaAlanlari] FOREIGN KEY([NeredenID])
REFERENCES [dbo].[HavaAlanlari] ([HavaAlaniID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_HavaAlanlari]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_HavaAlanlari*] FOREIGN KEY([NeredenID])
REFERENCES [dbo].[HavaAlanlari] ([HavaAlaniID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_HavaAlanlari*]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_HavaAlanlari1] FOREIGN KEY([NereyeID])
REFERENCES [dbo].[HavaAlanlari] ([HavaAlaniID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_HavaAlanlari1]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_Personeller] FOREIGN KEY([PilotID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_Personeller]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_Personeller1] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_Personeller1]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_Personeller2] FOREIGN KEY([KabinEkibiID])
REFERENCES [dbo].[Personeller] ([PersonelID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_Personeller2]
GO
ALTER TABLE [dbo].[Ucuslar]  WITH CHECK ADD  CONSTRAINT [FK_Ucuslar_Ucaklar1] FOREIGN KEY([UcakID])
REFERENCES [dbo].[Ucaklar] ([UcakID])
GO
ALTER TABLE [dbo].[Ucuslar] CHECK CONSTRAINT [FK_Ucuslar_Ucaklar1]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [PersonelTCK] CHECK  ((len([PersonelTCK])=(11)))
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [PersonelTCK]
GO
USE [master]
GO
ALTER DATABASE [KamAirLines] SET  READ_WRITE 
GO
