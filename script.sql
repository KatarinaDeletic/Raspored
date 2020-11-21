USE [BAZA]
GO
/****** Object:  Table [dbo].[LAB_SPECIFICNA]    Script Date: 10/18/2020 8:04:22 PM ******/
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
/****** Object:  Table [dbo].[LAB_VEZBA]    Script Date: 10/18/2020 8:04:22 PM ******/
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
/****** Object:  Table [dbo].[LabVezbaStudent]    Script Date: 10/18/2020 8:04:22 PM ******/
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
/****** Object:  Table [dbo].[PROFESOR]    Script Date: 10/18/2020 8:04:22 PM ******/
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
/****** Object:  Table [dbo].[RASPORED]    Script Date: 10/18/2020 8:04:22 PM ******/
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
/****** Object:  Table [dbo].[STUDENT]    Script Date: 10/18/2020 8:04:22 PM ******/
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

INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (1, CAST(N'2020-01-01T15:00:00.000' AS DateTime), CAST(N'2020-01-01T15:30:00.000' AS DateTime), 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (2, CAST(N'2020-01-01T16:00:00.000' AS DateTime), CAST(N'2020-01-01T16:30:00.000' AS DateTime), 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (3, CAST(N'2020-01-08T16:00:00.000' AS DateTime), CAST(N'2020-01-08T16:30:00.000' AS DateTime), 2, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (4, CAST(N'2020-01-08T17:00:00.000' AS DateTime), CAST(N'2020-01-08T17:30:00.000' AS DateTime), 2, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (5, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (6, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (7, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (8, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (9, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (10, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (14, CAST(N'2020-02-10T18:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (16, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (17, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (18, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (19, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (20, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (21, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (22, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (23, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (24, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (25, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (27, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (28, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (29, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (30, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[LAB_SPECIFICNA] ([ID], [vremeOd], [vremeDo], [redosled], [Id_Lab_vezbe]) VALUES (31, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[LAB_SPECIFICNA] OFF
SET IDENTITY_INSERT [dbo].[LAB_VEZBA] ON 

INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (1, N'PP', N'PP2020', 1)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (2, N'PS', N'PS2020', 1)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (3, N'PP', N'PP2019', 1)
INSERT [dbo].[LAB_VEZBA] ([ID], [tag], [naziv], [Active]) VALUES (4, N'PP', N'PP2018', 1)
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
SET IDENTITY_INSERT [dbo].[LabVezbaStudent] OFF
SET IDENTITY_INSERT [dbo].[PROFESOR] ON 

INSERT [dbo].[PROFESOR] ([ID], [username], [password], [ime], [prezime]) VALUES (1, N'test@elfak.ni.ac.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'test', N'testov')
SET IDENTITY_INSERT [dbo].[PROFESOR] OFF
SET IDENTITY_INSERT [dbo].[RASPORED] ON 

INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (1, 1, 1, CAST(N'2019-05-10T12:30:00.000' AS DateTime), CAST(N'2020-01-01T15:15:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (2, 2, 1, CAST(N'2020-01-01T15:00:00.000' AS DateTime), CAST(N'2020-01-01T16:15:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (3, 3, 1, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2020-01-01T16:01:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (4, 4, 1, CAST(N'2019-01-10T12:00:00.000' AS DateTime), CAST(N'2020-01-01T16:02:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (8, 1, 8, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (9, 3, 9, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (10, 4, 10, CAST(N'2020-01-12T12:12:12.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (11, 1, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:10:00.000' AS DateTime), N'521', 1)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (12, 2, 11, CAST(N'2020-02-10T12:00:00.000' AS DateTime), CAST(N'2020-02-10T12:10:00.000' AS DateTime), N'521', 1)
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
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (32, 2, 12, CAST(N'2019-02-10T14:00:00.000' AS DateTime), CAST(N'2019-02-10T14:10:00.000' AS DateTime), N'222', NULL)
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
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (55, 2, 13, CAST(N'2019-02-10T16:00:00.000' AS DateTime), CAST(N'2019-02-10T16:00:00.000' AS DateTime), N'333', NULL)
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
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (74, 4, 16, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (75, 3, 16, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (76, 4, 17, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (77, 3, 17, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (78, 1, 18, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (79, 5, 19, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (80, 13, 19, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (81, 6, 19, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (82, 14, 19, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (83, 15, 19, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (84, 16, 20, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (85, 17, 20, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (86, 18, 20, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (87, 19, 20, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (88, 20, 21, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (89, 4, 21, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (90, 3, 21, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
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
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (105, 2, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, N'123', NULL)
GO
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (106, 7, 26, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (107, 5, 27, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (108, 13, 27, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (109, 6, 27, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (110, 14, 27, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (111, 15, 27, CAST(N'2019-01-10T12:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (112, 16, 28, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (113, 17, 28, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (114, 18, 28, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (115, 19, 28, CAST(N'2019-01-10T12:15:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (116, 20, 29, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (117, 4, 29, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (118, 3, 29, CAST(N'2019-01-10T12:30:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (119, 1, 30, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (120, 8, 30, CAST(N'2019-01-10T12:45:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (121, 2, 31, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, N'123', NULL)
INSERT [dbo].[RASPORED] ([id], [student], [lab_vezba], [pocetak_laba], [zavrsetak_laba], [ucionica], [Izmenjen]) VALUES (122, 7, 31, CAST(N'2019-01-10T13:00:00.000' AS DateTime), NULL, N'123', NULL)
SET IDENTITY_INSERT [dbo].[RASPORED] OFF
SET IDENTITY_INSERT [dbo].[STUDENT] ON 

INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (1, N'Katarina', N'Deletic', 16046, N'katarinadeletic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
INSERT [dbo].[STUDENT] ([ID], [ime], [prezime], [indeks], [username], [password], [notifikacije]) VALUES (2, N'Jovana', N'Nikolic', 16255, N'jovananikolic@elfak.rs', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL)
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
GO
ALTER TABLE [dbo].[RASPORED] CHECK CONSTRAINT [FK_RASPORED_LAB_SPECIFICNA]
GO
ALTER TABLE [dbo].[RASPORED]  WITH CHECK ADD  CONSTRAINT [FK_RASPORED_STUDENT] FOREIGN KEY([student])
REFERENCES [dbo].[STUDENT] ([ID])
GO
ALTER TABLE [dbo].[RASPORED] CHECK CONSTRAINT [FK_RASPORED_STUDENT]
GO
/****** Object:  StoredProcedure [dbo].[USP_PROSEK]    Script Date: 10/18/2020 8:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_PROSEK]
@naziv as nvarchar(10),
	@tag as nvarchar(10),
	@redosled as int
AS
select avg(DATEDIFF(minute,r.pocetak_laba,r.zavrsetak_laba)) as prosecna_vrednost
from LAB_VEZBA as lv
inner join LAB_SPECIFICNA as ls on lv.ID = ls.Id_Lab_vezbe
inner join RASPORED as r on ls.ID = r.lab_vezba
inner join STUDENT as s on r.student = s.ID
where @tag =lv.tag and ls.redosled = @redosled and @naziv != lv.naziv
group by lv.naziv,lv.tag,ls.redosled

GO
/****** Object:  StoredProcedure [dbo].[USP_ZADRZAVANJE]    Script Date: 10/18/2020 8:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[USP_ZADRZAVANJE]
@naziv as nvarchar(10),
    @tag as nvarchar(10),
    @redosled as int
AS
select all (DATEDIFF(minute,r.pocetak_laba,r.zavrsetak_laba)) as vreme_zadrzavanja
from LAB_VEZBA as lv
inner join LAB_SPECIFICNA as ls on lv.ID = ls.Id_Lab_vezbe
inner join RASPORED as r on ls.ID = r.lab_vezba
inner join STUDENT as s on r.student = s.ID
where @tag =lv.tag and ls.redosled = @redosled and @naziv != lv.naziv
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
END
GO
