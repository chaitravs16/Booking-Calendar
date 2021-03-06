USE [master]
GO
/****** Object:  Database [Photography]    Script Date: 30-10-2021 04:25:28 PM ******/
CREATE DATABASE [Photography]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Photography', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Photography.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Photography_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Photography_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Photography] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Photography].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Photography] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Photography] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Photography] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Photography] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Photography] SET ARITHABORT OFF 
GO
ALTER DATABASE [Photography] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Photography] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Photography] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Photography] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Photography] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Photography] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Photography] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Photography] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Photography] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Photography] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Photography] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Photography] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Photography] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Photography] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Photography] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Photography] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Photography] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Photography] SET RECOVERY FULL 
GO
ALTER DATABASE [Photography] SET  MULTI_USER 
GO
ALTER DATABASE [Photography] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Photography] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Photography] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Photography] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Photography] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Photography] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Photography', N'ON'
GO
ALTER DATABASE [Photography] SET QUERY_STORE = OFF
GO
USE [Photography]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 30-10-2021 04:25:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhotographerId] [int] NOT NULL,
	[BDate] [datetime] NOT NULL,
	[StartTime] [nvarchar](500) NOT NULL,
	[EndTime] [nvarchar](500) NOT NULL,
	[FName] [nvarchar](500) NOT NULL,
	[LName] [nvarchar](500) NOT NULL,
	[Phone] [nvarchar](250) NULL,
	[Email] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photographers]    Script Date: 30-10-2021 04:25:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photographers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Phone] [nvarchar](250) NULL,
	[Email] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (5, 1, CAST(N'2021-10-31T00:00:00.000' AS DateTime), N'09:00:00', N'12:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (6, 2, CAST(N'2021-10-31T00:00:00.000' AS DateTime), N'13:00:00', N'16:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (7, 1, CAST(N'2021-11-01T00:00:00.000' AS DateTime), N'10:00:00', N'12:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (8, 2, CAST(N'2021-11-06T00:00:00.000' AS DateTime), N'09:00:00', N'11:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (9, 1, CAST(N'2021-11-24T00:00:00.000' AS DateTime), N'12:00:00', N'15:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (10, 2, CAST(N'2021-12-22T00:00:00.000' AS DateTime), N'12:00:00', N'14:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (11, 1, CAST(N'2021-11-27T00:00:00.000' AS DateTime), N'09:00:00', N'12:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
INSERT [dbo].[Booking] ([Id], [PhotographerId], [BDate], [StartTime], [EndTime], [FName], [LName], [Phone], [Email], [Status], [IsDeleted]) VALUES (12, 2, CAST(N'2021-11-04T00:00:00.000' AS DateTime), N'14:00:00', N'15:00:00', N'Chaitraa', N'V Shetty', N'chaitravshetty@live.com', N'1234567890', 1, 0)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Photographers] ON 

INSERT [dbo].[Photographers] ([Id], [Name], [Phone], [Email], [Status], [IsDeleted]) VALUES (1, N'Otto Crawford', N'1111111', N'otto.crawford@gmail.com', 1, 0)
INSERT [dbo].[Photographers] ([Id], [Name], [Phone], [Email], [Status], [IsDeleted]) VALUES (2, N'Jens Mills', N'2222222', N'jens.mills@gmail.com', 1, 0)
SET IDENTITY_INSERT [dbo].[Photographers] OFF
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Photographers] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Photographers] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
USE [master]
GO
ALTER DATABASE [Photography] SET  READ_WRITE 
GO
