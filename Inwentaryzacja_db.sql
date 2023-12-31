USE [master]
GO
/****** Object:  Database [Inwentaryzacja]    Script Date: 28.06.2023 21:11:59 ******/
CREATE DATABASE [Inwentaryzacja]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inwentaryzacja', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inwentaryzacja.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inwentaryzacja_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inwentaryzacja_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Inwentaryzacja] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inwentaryzacja].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inwentaryzacja] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inwentaryzacja] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inwentaryzacja] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Inwentaryzacja] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inwentaryzacja] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET RECOVERY FULL 
GO
ALTER DATABASE [Inwentaryzacja] SET  MULTI_USER 
GO
ALTER DATABASE [Inwentaryzacja] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inwentaryzacja] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inwentaryzacja] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inwentaryzacja] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inwentaryzacja] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inwentaryzacja] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inwentaryzacja', N'ON'
GO
ALTER DATABASE [Inwentaryzacja] SET QUERY_STORE = OFF
GO
USE [Inwentaryzacja]
GO
/****** Object:  User [User]    Script Date: 28.06.2023 21:11:59 ******/
CREATE USER [User] FOR LOGIN [User] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [User]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 28.06.2023 21:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Index] [int] IDENTITY(1,1) NOT NULL,
	[UID] [varchar](9) NULL,
	[Nazwa] [varchar](20) NULL,
	[Lokalizacja] [varchar](15) NULL,
	[Kategoria] [varchar](15) NULL,
	[Model] [varchar](15) NULL,
	[Opis] [varchar](100) NULL,
	[DataDodania] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 28.06.2023 21:11:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Passwd] [varchar](50) NOT NULL,
	[Permissions] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [Permissions]
GO
USE [master]
GO
ALTER DATABASE [Inwentaryzacja] SET  READ_WRITE 
GO
