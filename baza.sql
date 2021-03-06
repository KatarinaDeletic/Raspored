USE [master]
GO
/****** Object:  Database [BAZA]    Script Date: 11/19/2020 10:50:49 PM ******/
CREATE DATABASE [BAZA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BAZA', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BAZA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BAZA_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BAZA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BAZA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BAZA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BAZA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BAZA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BAZA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BAZA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BAZA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BAZA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BAZA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BAZA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BAZA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BAZA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BAZA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BAZA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BAZA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BAZA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BAZA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BAZA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BAZA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BAZA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BAZA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BAZA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BAZA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BAZA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BAZA] SET RECOVERY FULL 
GO
ALTER DATABASE [BAZA] SET  MULTI_USER 
GO
ALTER DATABASE [BAZA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BAZA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BAZA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BAZA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BAZA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BAZA', N'ON'
GO
ALTER DATABASE [BAZA] SET QUERY_STORE = OFF
GO
USE [BAZA]
GO
/****** Object:  Table [dbo].[LAB_SPECIFICNA]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LAB_SPECIFICNA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[vremeOd] [datetime] NULL,
	[vremeDo] [datetime] NULL,
	[redosled] [int] NULL,
	[Id_Lab_vezbe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LAB_VEZBA]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LAB_VEZBA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tag] [varchar](255) NOT NULL,
	[naziv] [varchar](255) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabVezbaStudent]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabVezbaStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabVezbaId] [int] NULL,
	[StudentId] [int] NULL,
 CONSTRAINT [PK_LabVezbaStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESOR]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESOR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](200) NULL,
	[ime] [nvarchar](50) NULL,
	[prezime] [nvarchar](50) NULL,
 CONSTRAINT [PK_PROFESOR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RASPORED]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RASPORED](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student] [int] NULL,
	[lab_vezba] [int] NULL,
	[pocetak_laba] [datetime] NULL,
	[zavrsetak_laba] [datetime] NULL,
	[ucionica] [nvarchar](10) NULL,
	[Izmenjen] [bit] NULL,
 CONSTRAINT [PK_RASPORED] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [varchar](255) NOT NULL,
	[prezime] [varchar](255) NULL,
	[indeks] [int] NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](100) NULL,
	[notifikacije] [bit] NULL,
 CONSTRAINT [PK__STUDENT__3214EC275A7DB6C5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LAB_SPECIFICNA] ON 

INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (3, CAST(N'2020-01-08T16:00:00.000' AS DateTime), CAST(N'2020-01-08T16:30:00.000' AS DateTime), 2, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (4, CAST(N'2020-01-08T17:00:00.000' AS DateTime), CAST(N'2020-01-08T17:30:00.000' AS DateTime), 2, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (11, CAST(N'2019-02-10T12:00:00.000' AS DateTime), NULL, 2, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), NULL, 2, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), NULL, 2, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (14, CAST(N'2019-02-10T18:00:00.000' AS DateTime), NULL, 2, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), NULL, 1, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), NULL, 1, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), NULL, 1, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), NULL, 1, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (36, CAST(N'2018-02-20T12:00:00.000' AS DateTime), NULL, 2, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (37, CAST(N'2018-02-20T13:00:00.000' AS DateTime), NULL, 2, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (38, CAST(N'2018-02-28T12:00:00.000' AS DateTime), NULL, 3, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (39, CAST(N'2018-02-28T13:00:00.000' AS DateTime), NULL, 3, 4)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (40, CAST(N'2019-03-10T12:00:00.000' AS DateTime), NULL, 3, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (41, CAST(N'2019-03-10T13:00:00.000' AS DateTime), NULL, 3, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (42, CAST(N'2019-04-01T12:00:00.000' AS DateTime), NULL, 1, 5)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (43, CAST(N'2019-04-01T13:00:00.000' AS DateTime), NULL, 1, 5)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (44, CAST(N'2019-05-01T12:00:00.000' AS DateTime), NULL, 2, 5)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), NULL, 2, 5)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), NULL, 3, 5)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (47, CAST(N'2019-06-01T13:00:00.000' AS DateTime), NULL, 3, 5)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (48, CAST(N'2018-04-01T12:00:00.000' AS DateTime), NULL, 1, 6)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (49, CAST(N'2018-04-01T13:00:00.000' AS DateTime), NULL, 1, 6)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (50, CAST(N'2018-05-01T12:00:00.000' AS DateTime), NULL, 2, 6)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (51, CAST(N'2018-05-01T13:00:00.000' AS DateTime), NULL, 2, 6)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (52, CAST(N'2018-06-01T12:00:00.000' AS DateTime), NULL, 3, 6)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (53, CAST(N'2018-06-01T13:00:00.000' AS DateTime), NULL, 3, 6)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (62, CAST(N'2020-11-11T12:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (63, CAST(N'2020-11-11T12:15:00.000' AS DateTime), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[LAB_SPECIFICNA] OFF
SET IDENTITY_INSERT [dbo].[LAB_VEZBA] ON 

INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (1, N'PP', N'PP2020', 1)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (2, N'PS', N'PS2020', 1)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (3, N'PP', N'PP2019', 0)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (4, N'PP', N'PP2018', 0)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (5, N'PS', N'PS2019', 0)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (6, N'PS', N'PS2018', 0)
SET IDENTITY_INSERT [dbo].[LAB_VEZBA] OFF
SET IDENTITY_INSERT [dbo].[LabVezbaStudent] ON 

INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (1, 1, 1)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (2, 2, 2)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (3, 1, 3)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (4, 1, 4)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (5, 3, 1)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (6, 3, 2)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (7, 3, 3)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (8, 3, 4)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (9, 3, 5)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (10, 3, 6)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (11, 3, 7)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (12, 3, 8)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (13, 3, 9)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (14, 3, 10)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (15, 3, 11)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (16, 3, 12)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (17, 3, 13)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (18, 3, 14)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (19, 3, 15)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (20, 3, 16)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (21, 3, 17)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (22, 3, 18)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (23, 3, 19)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (24, 3, 20)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (25, 4, 1)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (26, 4, 2)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (27, 4, 3)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (28, 4, 4)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (29, 4, 5)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (30, 4, 6)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (31, 4, 7)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (32, 4, 8)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (33, 4, 9)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (34, 4, 10)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (35, 4, 11)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (36, 4, 12)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (37, 4, 13)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (38, 4, 14)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (39, 4, 15)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (40, 4, 16)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (41, 4, 17)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (42, 4, 18)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (43, 4, 19)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (44, 4, 20)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (45, 1, 21)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (46, 2, 21)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (47, 1, 1)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (48, 1, 2)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (49, 1, 3)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (50, 1, 4)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (51, 1, 5)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (52, 1, 6)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (53, 1, 7)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (54, 1, 8)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (55, 1, 9)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (56, 1, 10)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (57, 1, 11)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (58, 1, 12)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (59, 1, 13)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (60, 1, 14)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (61, 1, 15)
INSERT [dbo].[LabVezbaStudent] ([Id], [LabVezbaId], [StudentId]) VALUES (62, 1, 16)
SET IDENTITY_INSERT [dbo].[LabVezbaStudent] OFF
SET IDENTITY_INSERT [dbo].[PROFESOR] ON 

INSERT [dbo].[PROFESOR] ([ID], [username], [password], [ime], [prezime]) VALUES (1, N'test@elfak.ni.ac.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'test', N'testov')
SET IDENTITY_INSERT [dbo].[PROFESOR] OFF
SET IDENTITY_INSERT [dbo].[RASPORED] ON 

INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (11, 1, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:10:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (12, 2, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:10:00.000' AS DateTime), N'521', 0)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (13, 3, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:10:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (14, 4, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:10:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (15, 5, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:34:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (16, 6, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:34:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (17, 7, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:34:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (18, 8, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:34:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (19, 9, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:47:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (20, 10, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:47:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (21, 11, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:47:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (22, 12, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:47:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (23, 13, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:47:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (24, 14, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:47:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (25, 15, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:58:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (26, 16, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:58:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (27, 17, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:58:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (28, 18, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:58:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (29, 19, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T13:20:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (30, 20, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T13:20:00.000' AS DateTime), N'521', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (31, 1, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:00:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (32, 2, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', 0)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (33, 3, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (34, 4, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (35, 5, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (36, 6, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (37, 7, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (38, 8, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (39, 9, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (40, 10, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (41, 11, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (42, 12, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (43, 13, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (44, 14, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (45, 15, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (46, 16, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:40:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (47, 17, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:57:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (48, 18, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:57:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (49, 19, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:57:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (50, 20, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:57:00.000' AS DateTime), N'222', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (54, 1, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:00:00.000' AS DateTime), N'333', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (55, 2, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:00:00.000' AS DateTime), N'333', 0)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (56, 3, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (57, 4, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (58, 5, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (59, 6, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (60, 7, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (61, 8, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (62, 9, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (63, 10, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (64, 11, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (65, 12, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (66, 13, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (67, 14, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (68, 15, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (69, 16, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T17:26:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (70, 17, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T17:26:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (71, 18, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T17:26:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (72, 19, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T17:26:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (73, 20, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T17:26:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (91, 5, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (92, 13, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (93, 6, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (94, 14, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (95, 15, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (96, 16, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (97, 17, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (98, 18, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (99, 19, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (100, 20, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (101, 4, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (102, 3, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (103, 1, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (104, 8, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (105, 2, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, N'123', 0)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (106, 7, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (123, 1, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T13:00:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (124, 2, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T13:20:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (125, 3, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:25:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (126, 4, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:17:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (127, 5, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:19:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (128, 6, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:50:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (129, 7, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:51:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (130, 8, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:42:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (131, 9, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:23:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (132, 10, 32, CAST(N'2018-02-10T12:00:00.000' AS DateTime), CAST(N'2018-02-10T12:44:00.000' AS DateTime), N'555', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (133, 11, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:51:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (134, 12, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:54:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (135, 13, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:12:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (136, 14, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:56:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (137, 15, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:57:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (138, 16, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:36:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (139, 17, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:45:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (140, 18, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:49:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (141, 19, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:51:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (142, 20, 33, CAST(N'2018-02-10T13:00:00.000' AS DateTime), CAST(N'2018-02-10T13:44:00.000' AS DateTime), N'666', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (143, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T15:20:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (144, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:25:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (145, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:19:00.000' AS DateTime), N'777', NULL)
GO
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (146, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:51:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (147, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:23:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (148, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:44:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (149, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:49:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (150, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:56:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (151, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:54:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (152, NULL, 34, CAST(N'2018-02-10T14:00:00.000' AS DateTime), CAST(N'2018-02-10T14:12:00.000' AS DateTime), N'777', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (153, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:33:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (154, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:56:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (155, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:45:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (156, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:17:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (157, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:16:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (158, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T16:00:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (159, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:50:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (160, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:19:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (161, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T15:58:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (162, NULL, 35, CAST(N'2018-02-10T15:00:00.000' AS DateTime), CAST(N'2018-02-10T16:10:00.000' AS DateTime), N'888', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (163, NULL, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2019-01-10T12:08:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (164, NULL, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2019-01-10T12:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (165, NULL, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2019-01-10T12:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (166, NULL, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2019-01-10T12:35:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (167, NULL, 22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2019-01-10T12:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (168, NULL, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), CAST(N'2019-01-10T12:22:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (169, NULL, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), CAST(N'2019-01-10T12:25:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (170, NULL, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), CAST(N'2019-01-10T12:33:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (171, NULL, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), CAST(N'2019-01-10T12:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (172, NULL, 23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), CAST(N'2019-01-10T13:05:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (173, NULL, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), CAST(N'2019-01-10T12:37:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (174, NULL, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), CAST(N'2019-01-10T12:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (175, NULL, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), CAST(N'2019-01-10T13:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (176, NULL, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), CAST(N'2019-01-10T13:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (177, NULL, 24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), CAST(N'2019-01-10T13:22:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (178, NULL, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), CAST(N'2019-01-10T12:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (179, NULL, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), CAST(N'2019-01-10T12:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (180, NULL, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), CAST(N'2019-01-10T13:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (181, NULL, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), CAST(N'2019-01-10T13:37:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (182, NULL, 25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), CAST(N'2019-01-10T13:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (183, NULL, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), CAST(N'2019-01-10T13:07:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (184, NULL, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), CAST(N'2019-01-10T13:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (185, NULL, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), CAST(N'2019-01-10T13:35:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (186, NULL, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), CAST(N'2019-01-10T13:48:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (187, NULL, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), CAST(N'2019-01-10T13:59:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (189, NULL, 36, CAST(N'2018-02-20T12:00:00.000' AS DateTime), CAST(N'2018-02-20T12:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (190, NULL, 36, CAST(N'2018-02-20T12:00:00.000' AS DateTime), CAST(N'2018-02-20T12:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (191, NULL, 36, CAST(N'2018-02-20T12:00:00.000' AS DateTime), CAST(N'2018-02-20T12:45:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (192, NULL, 36, CAST(N'2018-02-20T12:00:00.000' AS DateTime), CAST(N'2018-02-20T12:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (193, NULL, 37, CAST(N'2018-02-20T13:00:00.000' AS DateTime), CAST(N'2018-02-20T13:22:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (194, NULL, 37, CAST(N'2018-02-20T13:00:00.000' AS DateTime), CAST(N'2018-02-20T13:17:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (195, NULL, 37, CAST(N'2018-02-20T13:00:00.000' AS DateTime), CAST(N'2018-02-20T13:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (196, NULL, 37, CAST(N'2018-02-20T13:00:00.000' AS DateTime), CAST(N'2018-02-20T13:47:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (197, NULL, 38, CAST(N'2018-02-28T12:00:00.000' AS DateTime), CAST(N'2018-02-28T12:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (198, NULL, 38, CAST(N'2018-02-28T12:00:00.000' AS DateTime), CAST(N'2018-02-28T12:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (199, NULL, 38, CAST(N'2018-02-28T12:00:00.000' AS DateTime), CAST(N'2018-02-28T12:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (200, NULL, 38, CAST(N'2018-02-28T12:00:00.000' AS DateTime), CAST(N'2018-02-28T12:44:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (201, NULL, 39, CAST(N'2018-02-28T13:00:00.000' AS DateTime), CAST(N'2018-02-28T13:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (202, NULL, 39, CAST(N'2018-02-28T13:00:00.000' AS DateTime), CAST(N'2018-02-28T13:47:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (203, NULL, 39, CAST(N'2018-02-28T13:00:00.000' AS DateTime), CAST(N'2018-02-28T13:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (204, NULL, 39, CAST(N'2018-02-28T13:00:00.000' AS DateTime), CAST(N'2018-02-28T13:59:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (205, NULL, 40, CAST(N'2019-03-10T12:00:00.000' AS DateTime), CAST(N'2019-03-10T12:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (206, NULL, 40, CAST(N'2019-03-10T12:00:00.000' AS DateTime), CAST(N'2019-03-10T12:27:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (207, NULL, 40, CAST(N'2019-03-10T12:00:00.000' AS DateTime), CAST(N'2019-03-10T12:47:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (208, NULL, 40, CAST(N'2019-03-10T12:00:00.000' AS DateTime), CAST(N'2019-03-10T12:59:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (209, NULL, 41, CAST(N'2019-03-10T13:00:00.000' AS DateTime), CAST(N'2019-03-10T13:08:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (210, NULL, 41, CAST(N'2019-03-10T13:00:00.000' AS DateTime), CAST(N'2019-03-10T13:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (211, NULL, 41, CAST(N'2019-03-10T13:00:00.000' AS DateTime), CAST(N'2019-03-10T13:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (212, NULL, 41, CAST(N'2019-03-10T13:00:00.000' AS DateTime), CAST(N'2019-03-10T13:59:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (213, NULL, 42, CAST(N'2019-04-01T12:00:00.000' AS DateTime), CAST(N'2019-04-01T12:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (214, NULL, 42, CAST(N'2019-04-01T12:00:00.000' AS DateTime), CAST(N'2019-04-01T12:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (215, NULL, 42, CAST(N'2019-04-01T12:00:00.000' AS DateTime), CAST(N'2019-04-01T12:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (216, NULL, 42, CAST(N'2019-04-01T12:00:00.000' AS DateTime), CAST(N'2019-04-01T12:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (217, NULL, 43, CAST(N'2019-04-01T13:00:00.000' AS DateTime), CAST(N'2019-04-01T13:08:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (218, NULL, 43, CAST(N'2019-04-01T13:00:00.000' AS DateTime), CAST(N'2019-04-01T13:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (219, NULL, 43, CAST(N'2019-04-01T13:00:00.000' AS DateTime), CAST(N'2019-04-01T13:44:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (220, NULL, 43, CAST(N'2019-04-01T13:00:00.000' AS DateTime), CAST(N'2019-04-01T13:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (221, NULL, 44, CAST(N'2019-05-01T12:00:00.000' AS DateTime), CAST(N'2019-05-01T12:08:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (222, NULL, 44, CAST(N'2019-05-01T12:00:00.000' AS DateTime), CAST(N'2019-05-01T12:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (223, NULL, 44, CAST(N'2019-05-01T12:00:00.000' AS DateTime), CAST(N'2019-05-01T12:43:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (224, NULL, 44, CAST(N'2019-05-01T12:00:00.000' AS DateTime), CAST(N'2019-05-01T12:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (225, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (226, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (227, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (228, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (229, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (230, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (231, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (232, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (233, NULL, 48, CAST(N'2018-04-01T12:00:00.000' AS DateTime), CAST(N'2018-04-01T12:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (234, NULL, 48, CAST(N'2018-04-01T12:00:00.000' AS DateTime), CAST(N'2018-04-01T12:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (235, NULL, 48, CAST(N'2018-04-01T12:00:00.000' AS DateTime), CAST(N'2018-04-01T12:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (236, NULL, 48, CAST(N'2018-04-01T12:00:00.000' AS DateTime), CAST(N'2018-04-01T12:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (245, NULL, 49, CAST(N'2018-04-01T13:00:00.000' AS DateTime), CAST(N'2018-04-01T13:08:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (246, NULL, 49, CAST(N'2018-04-01T13:00:00.000' AS DateTime), CAST(N'2018-04-01T13:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (247, NULL, 49, CAST(N'2018-04-01T13:00:00.000' AS DateTime), CAST(N'2018-04-01T13:44:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (248, NULL, 49, CAST(N'2018-04-01T13:00:00.000' AS DateTime), CAST(N'2018-04-01T13:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (249, NULL, 51, CAST(N'2018-05-01T13:00:00.000' AS DateTime), CAST(N'2018-05-01T13:08:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (250, NULL, 51, CAST(N'2018-05-01T13:00:00.000' AS DateTime), CAST(N'2018-05-01T13:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (251, NULL, 51, CAST(N'2018-05-01T13:00:00.000' AS DateTime), CAST(N'2018-05-01T13:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (252, NULL, 44, CAST(N'2019-05-01T12:00:00.000' AS DateTime), CAST(N'2019-05-01T12:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (254, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (255, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:12:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (256, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (257, NULL, 45, CAST(N'2019-05-01T13:00:00.000' AS DateTime), CAST(N'2019-05-01T13:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (258, NULL, 51, CAST(N'2018-05-01T13:00:00.000' AS DateTime), CAST(N'2018-05-01T13:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (259, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (260, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (261, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (262, NULL, 46, CAST(N'2019-06-01T12:00:00.000' AS DateTime), CAST(N'2019-06-01T12:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (263, NULL, 51, CAST(N'2018-05-01T13:00:00.000' AS DateTime), CAST(N'2018-05-01T13:48:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (268, NULL, 50, CAST(N'2018-05-01T12:00:00.000' AS DateTime), CAST(N'2018-05-01T12:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (269, NULL, 50, CAST(N'2018-05-01T12:00:00.000' AS DateTime), CAST(N'2018-05-01T12:22:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (270, NULL, 50, CAST(N'2018-05-01T12:00:00.000' AS DateTime), CAST(N'2018-05-01T12:47:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (271, NULL, 50, CAST(N'2018-05-01T12:00:00.000' AS DateTime), CAST(N'2018-05-01T12:57:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (272, NULL, 52, CAST(N'2018-06-01T12:00:00.000' AS DateTime), CAST(N'2018-06-01T12:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (273, NULL, 52, CAST(N'2018-06-01T12:00:00.000' AS DateTime), CAST(N'2018-06-01T12:23:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (274, NULL, 52, CAST(N'2018-06-01T12:00:00.000' AS DateTime), CAST(N'2018-06-01T12:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (275, NULL, 52, CAST(N'2018-06-01T12:00:00.000' AS DateTime), CAST(N'2018-06-01T12:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (276, NULL, 53, CAST(N'2018-06-01T13:00:00.000' AS DateTime), CAST(N'2018-06-01T13:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (277, NULL, 53, CAST(N'2018-06-01T13:00:00.000' AS DateTime), CAST(N'2018-06-01T13:33:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (278, NULL, 53, CAST(N'2018-06-01T13:00:00.000' AS DateTime), CAST(N'2018-06-01T13:48:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (279, NULL, 53, CAST(N'2018-06-01T13:00:00.000' AS DateTime), CAST(N'2018-06-01T13:59:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (303, 21, 62, NULL, NULL, N'123asd', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (304, 5, 62, NULL, NULL, N'123asd', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (305, 13, 62, NULL, NULL, N'123asd', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (306, 6, 63, NULL, NULL, N'123asd', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (318, NULL, 62, CAST(N'2020-11-11T12:00:00.000' AS DateTime), CAST(N'2020-11-11T13:33:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (319, NULL, 62, CAST(N'2020-11-11T12:00:00.000' AS DateTime), CAST(N'2020-11-11T13:55:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (320, NULL, 63, CAST(N'2020-11-11T12:15:00.000' AS DateTime), CAST(N'2020-11-11T13:58:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (321, NULL, 63, CAST(N'2020-11-11T12:15:00.000' AS DateTime), CAST(N'2020-11-11T13:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[RASPORED] OFF
SET IDENTITY_INSERT [dbo].[STUDENT] ON 

INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (1, N'Katarina', N'Deletic', 16046, N'katarinadeletic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (2, N'Jovana', N'Nikolic', 16255, N'jocikanik@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (3, N'Jovan', N'Jovanovic', 15860, N'jovanjovanovic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (4, N'Nemanja', N'Nikolic', 15285, N'nemanjanikolic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (5, N'Milan', N'Milanovic', 12000, N'milanmilanovic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (6, N'Milan', N'Jovanovic', 12001, N'milanjovanovic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (7, N'Stefan', N'Petkovic', 16277, N'test@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (8, N'Damjan', N'Denic', 16047, N'damjandenic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (9, N'Maja', N'Petrovic', 17000, N'majapetrovic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (10, N'Jelena', N'Jovic', 17001, N'jelenajovic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (11, N'Vladimir', N'Cvetkovic', 16444, N'vlatko@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (12, N'Nikola', N'Nikolic', 16555, N'nikolan@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (13, N'Novak', N'Djokovic', 12000, N'nole@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (14, N'Stevan', N'Simic', 12001, N'stevan@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (15, N'Milan', N'Milic', 12002, N'milanm@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (16, N'Milos', N'Milosevic', 12003, N'milosm@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (17, N'Stefan', N'Stefanovic', 12004, N'stefans@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (18, N'Katarina', N'Milosevic', 12005, N'katm@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (19, N'Milan', N'Jovanovic', 12006, N'milanm@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (20, N'Ana', N'Jovanovic', 12007, N'anaj@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (21, N'asd', N'asd', 123, N'asd@elfak.ni.ac.rs', N'123', 1)
SET IDENTITY_INSERT [dbo].[STUDENT] OFF
ALTER TABLE [dbo].[LAB_VEZBA] ADD  CONSTRAINT [DF_LAB_VEZBA_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[LAB_SPECIFICNA]  WITH CHECK ADD  CONSTRAINT [FK_LAB_SPECIFICNA_LAB_VEZBA] FOREIGN KEY([Id_Lab_vezbe])
REFERENCES [dbo].[LAB_VEZBA] ([ID])
GO
ALTER TABLE [dbo].[LAB_SPECIFICNA] CHECK CONSTRAINT [FK_LAB_SPECIFICNA_LAB_VEZBA]
GO
ALTER TABLE [dbo].[LabVezbaStudent]  WITH CHECK ADD  CONSTRAINT [FK_LabVezbaStudent_LAB_VEZBA] FOREIGN KEY([LabVezbaId])
REFERENCES [dbo].[LAB_VEZBA] ([ID])
GO
ALTER TABLE [dbo].[LabVezbaStudent] CHECK CONSTRAINT [FK_LabVezbaStudent_LAB_VEZBA]
GO
ALTER TABLE [dbo].[LabVezbaStudent]  WITH CHECK ADD  CONSTRAINT [FK_LabVezbaStudent_STUDENT] FOREIGN KEY([StudentId])
REFERENCES [dbo].[STUDENT] ([ID])
GO
ALTER TABLE [dbo].[LabVezbaStudent] CHECK CONSTRAINT [FK_LabVezbaStudent_STUDENT]
GO
ALTER TABLE [dbo].[RASPORED]  WITH CHECK ADD  CONSTRAINT [FK_RASPORED_LAB_SPECIFICNA] FOREIGN KEY([lab_vezba])
REFERENCES [dbo].[LAB_SPECIFICNA] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RASPORED] CHECK CONSTRAINT [FK_RASPORED_LAB_SPECIFICNA]
GO
ALTER TABLE [dbo].[RASPORED]  WITH CHECK ADD  CONSTRAINT [FK_RASPORED_STUDENT] FOREIGN KEY([student])
REFERENCES [dbo].[STUDENT] ([ID])
GO
ALTER TABLE [dbo].[RASPORED] CHECK CONSTRAINT [FK_RASPORED_STUDENT]
GO
/****** Object:  StoredProcedure [dbo].[USP_PROSEK]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        <Author,,Name>
-- Create date: <Create Date,,>
-- Description:    <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_PROSEK]
@naziv as nvarchar(10),
    @tag as nvarchar(10),
    @redosled as int
AS
begin
select avg(DATEDIFF(minute,r.pocetak_laba,r.zavrsetak_laba)) as prosecna_vrednost
from LAB_VEZBA as lv
inner join LAB_SPECIFICNA as ls on lv.ID = ls.Id_Lab_vezbe
inner join RASPORED as r on ls.ID = r.lab_vezba
inner join STUDENT as s on r.student = s.ID
where @tag =lv.tag and ls.redosled = @redosled and @naziv != lv.naziv
group by lv.naziv,lv.tag,ls.redosled
end
GO
/****** Object:  StoredProcedure [dbo].[USP_TRENUTNO_ZADRZAVANJE]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_TRENUTNO_ZADRZAVANJE]
@naziv as nvarchar(10),
    @tag as nvarchar(10),
    @redosled as int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select all (DATEDIFF(minute,r.pocetak_laba,r.zavrsetak_laba)) as trenutno_vreme_zadrzavanja
from LAB_VEZBA as lv
inner join LAB_SPECIFICNA as ls on lv.ID = ls.Id_Lab_vezbe
inner join RASPORED as r on ls.ID = r.lab_vezba
where @tag =lv.tag and ls.redosled = @redosled and @naziv = lv.naziv
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ZADRZAVANJE]    Script Date: 11/19/2020 10:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_ZADRZAVANJE]
@naziv as nvarchar(10),
    @tag as nvarchar(10),
    @redosled as int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select all (DATEDIFF(minute,r.pocetak_laba,r.zavrsetak_laba)) as vreme_zadrzavanja
from LAB_VEZBA as lv
inner join LAB_SPECIFICNA as ls on lv.ID = ls.Id_Lab_vezbe
inner join RASPORED as r on ls.ID = r.lab_vezba
where @tag =lv.tag and ls.redosled = @redosled and @naziv != lv.naziv
END
GO
USE [master]
GO
ALTER DATABASE [BAZA] SET  READ_WRITE 
GO
