USE [master]
GO
/****** Object:  Database [TheaterDB]    Script Date: 07.12.2021 18:25:42 ******/
CREATE DATABASE [TheaterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheaterDB', FILENAME = N'D:\SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\TheaterDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheaterDB_log', FILENAME = N'D:\SQL SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\TheaterDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TheaterDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheaterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheaterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheaterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheaterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheaterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheaterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheaterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TheaterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheaterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheaterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheaterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheaterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheaterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheaterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheaterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheaterDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TheaterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheaterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheaterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheaterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheaterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheaterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheaterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheaterDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheaterDB] SET  MULTI_USER 
GO
ALTER DATABASE [TheaterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheaterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheaterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheaterDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheaterDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheaterDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TheaterDB] SET QUERY_STORE = OFF
GO
USE [TheaterDB]
GO
/****** Object:  Table [dbo].[Plays]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plays](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[PlayType] [nvarchar](max) NOT NULL,
	[Duration] [int] NOT NULL,
	[AmountOfActs] [int] NOT NULL,
 CONSTRAINT [PK_Plays] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayWorkers]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayWorkers](
	[Worker] [int] NOT NULL,
	[Play] [int] NOT NULL,
 CONSTRAINT [PK_PlayWorkers] PRIMARY KEY CLUSTERED 
(
	[Worker] ASC,
	[Play] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repertoirs]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repertoirs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Play] [int] NOT NULL,
	[DateOfPerformance] [date] NOT NULL,
	[TimeOfPerformance] [time](7) NOT NULL,
	[TicketsSold] [int] NOT NULL,
 CONSTRAINT [PK_Repertoirs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Actor] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesOfActorsOfRepertoir]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesOfActorsOfRepertoir](
	[Actor] [int] NOT NULL,
	[Role] [int] NOT NULL,
	[Repertoire] [int] NOT NULL,
 CONSTRAINT [PK_RolesOfActorsOfRepertoir] PRIMARY KEY CLUSTERED 
(
	[Actor] ASC,
	[Role] ASC,
	[Repertoire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketsSale]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketsSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Play] [int] NOT NULL,
	[PlayDate] [date] NOT NULL,
	[PlayTime] [time](7) NOT NULL,
	[DateOfPurchase] [date] NOT NULL,
	[TicketsBought] [int] NOT NULL,
 CONSTRAINT [PK_TicketsSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 07.12.2021 18:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NOT NULL,
	[Rank] [nvarchar](max) NULL,
	[IsFired] [bit] NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Plays] ON 

INSERT [dbo].[Plays] ([ID], [Name], [Author], [PlayType], [Duration], [AmountOfActs]) VALUES (1, N'Домино', N'Б. Стругацкий', N'Комедия', 120, 3)
INSERT [dbo].[Plays] ([ID], [Name], [Author], [PlayType], [Duration], [AmountOfActs]) VALUES (2, N'Кошки', N'С. Воробьёв', N'Мюзикл', 60, 2)
INSERT [dbo].[Plays] ([ID], [Name], [Author], [PlayType], [Duration], [AmountOfActs]) VALUES (3, N'Каламбур', N'Р. Тверской', N'Мелодрама', 180, 6)
SET IDENTITY_INSERT [dbo].[Plays] OFF
GO
INSERT [dbo].[PlayWorkers] ([Worker], [Play]) VALUES (2, 1)
INSERT [dbo].[PlayWorkers] ([Worker], [Play]) VALUES (2, 2)
INSERT [dbo].[PlayWorkers] ([Worker], [Play]) VALUES (4, 1)
INSERT [dbo].[PlayWorkers] ([Worker], [Play]) VALUES (4, 2)
INSERT [dbo].[PlayWorkers] ([Worker], [Play]) VALUES (5, 1)
INSERT [dbo].[PlayWorkers] ([Worker], [Play]) VALUES (5, 2)
GO
SET IDENTITY_INSERT [dbo].[Repertoirs] ON 

INSERT [dbo].[Repertoirs] ([ID], [Play], [DateOfPerformance], [TimeOfPerformance], [TicketsSold]) VALUES (1, 1, CAST(N'2022-01-11' AS Date), CAST(N'12:00:00' AS Time), 103)
INSERT [dbo].[Repertoirs] ([ID], [Play], [DateOfPerformance], [TimeOfPerformance], [TicketsSold]) VALUES (3, 2, CAST(N'2022-02-05' AS Date), CAST(N'16:30:00' AS Time), 13)
SET IDENTITY_INSERT [dbo].[Repertoirs] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name], [Actor]) VALUES (2, N'Главный герой', 2)
INSERT [dbo].[Roles] ([ID], [Name], [Actor]) VALUES (3, N'Главный злодей', 4)
INSERT [dbo].[Roles] ([ID], [Name], [Actor]) VALUES (4, N'Отец главного героя', 5)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RolesOfActorsOfRepertoir] ([Actor], [Role], [Repertoire]) VALUES (2, 2, 1)
INSERT [dbo].[RolesOfActorsOfRepertoir] ([Actor], [Role], [Repertoire]) VALUES (4, 4, 3)
INSERT [dbo].[RolesOfActorsOfRepertoir] ([Actor], [Role], [Repertoire]) VALUES (5, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([ID], [Surname], [Name], [MiddleName], [Position], [Rank], [IsFired]) VALUES (1, N'Гаврилов', N'Михаил', N'Степанович', N'Художественный руководитель', NULL, 0)
INSERT [dbo].[Workers] ([ID], [Surname], [Name], [MiddleName], [Position], [Rank], [IsFired]) VALUES (2, N'Иванов', N'Иван', N'Иванович', N'Актёр', N'Заслуженный артист РФ', 0)
INSERT [dbo].[Workers] ([ID], [Surname], [Name], [MiddleName], [Position], [Rank], [IsFired]) VALUES (3, N'Петров', N'Евгений', NULL, N'Художник', NULL, 0)
INSERT [dbo].[Workers] ([ID], [Surname], [Name], [MiddleName], [Position], [Rank], [IsFired]) VALUES (4, N'Сидоров', N'Анатолий', N'Олегович', N'Актёр', N'Народный артист РФ', 0)
INSERT [dbo].[Workers] ([ID], [Surname], [Name], [MiddleName], [Position], [Rank], [IsFired]) VALUES (5, N'Лопатин', N'Олег', N'Владимирович', N'Актёр', N'Народный артист СССР', 0)
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
ALTER TABLE [dbo].[PlayWorkers]  WITH CHECK ADD  CONSTRAINT [FK_PlayWorkers_Plays] FOREIGN KEY([Play])
REFERENCES [dbo].[Plays] ([ID])
GO
ALTER TABLE [dbo].[PlayWorkers] CHECK CONSTRAINT [FK_PlayWorkers_Plays]
GO
ALTER TABLE [dbo].[PlayWorkers]  WITH CHECK ADD  CONSTRAINT [FK_PlayWorkers_Workers] FOREIGN KEY([Worker])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[PlayWorkers] CHECK CONSTRAINT [FK_PlayWorkers_Workers]
GO
ALTER TABLE [dbo].[Repertoirs]  WITH CHECK ADD  CONSTRAINT [FK_Repertoirs_Plays] FOREIGN KEY([Play])
REFERENCES [dbo].[Plays] ([ID])
GO
ALTER TABLE [dbo].[Repertoirs] CHECK CONSTRAINT [FK_Repertoirs_Plays]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Workers] FOREIGN KEY([Actor])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Workers]
GO
ALTER TABLE [dbo].[RolesOfActorsOfRepertoir]  WITH CHECK ADD  CONSTRAINT [FK_RolesOfActorsOfRepertoir_Repertoirs] FOREIGN KEY([Repertoire])
REFERENCES [dbo].[Repertoirs] ([ID])
GO
ALTER TABLE [dbo].[RolesOfActorsOfRepertoir] CHECK CONSTRAINT [FK_RolesOfActorsOfRepertoir_Repertoirs]
GO
ALTER TABLE [dbo].[RolesOfActorsOfRepertoir]  WITH CHECK ADD  CONSTRAINT [FK_RolesOfActorsOfRepertoir_Roles] FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[RolesOfActorsOfRepertoir] CHECK CONSTRAINT [FK_RolesOfActorsOfRepertoir_Roles]
GO
ALTER TABLE [dbo].[RolesOfActorsOfRepertoir]  WITH CHECK ADD  CONSTRAINT [FK_RolesOfActorsOfRepertoir_Workers] FOREIGN KEY([Actor])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[RolesOfActorsOfRepertoir] CHECK CONSTRAINT [FK_RolesOfActorsOfRepertoir_Workers]
GO
ALTER TABLE [dbo].[TicketsSale]  WITH CHECK ADD  CONSTRAINT [FK_TicketsSale_Plays] FOREIGN KEY([Play])
REFERENCES [dbo].[Plays] ([ID])
GO
ALTER TABLE [dbo].[TicketsSale] CHECK CONSTRAINT [FK_TicketsSale_Plays]
GO
USE [master]
GO
ALTER DATABASE [TheaterDB] SET  READ_WRITE 
GO
