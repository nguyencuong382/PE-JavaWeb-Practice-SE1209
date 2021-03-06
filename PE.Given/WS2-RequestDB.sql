CREATE database RequestDB
GO
USE [RequestDB]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 02/25/2018 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName]) VALUES (1, N'Mr A')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName]) VALUES (2, N'Mr B')
INSERT [dbo].[Employees] ([EmployeeID], [EmployeeName]) VALUES (3, N'Mr C')
/****** Object:  Table [dbo].[RequestTypes]    Script Date: 02/25/2018 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequestTypes](
	[TypeID] [int] NOT NULL,
	[TypeName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_RequestTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[RequestTypes] ([TypeID], [TypeName]) VALUES (1, N'Holiday')
INSERT [dbo].[RequestTypes] ([TypeID], [TypeName]) VALUES (2, N'Privilege')
INSERT [dbo].[RequestTypes] ([TypeID], [TypeName]) VALUES (3, N'Quarantine')
INSERT [dbo].[RequestTypes] ([TypeID], [TypeName]) VALUES (4, N'Half Pay')
/****** Object:  Table [dbo].[Requests]    Script Date: 02/25/2018 20:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Requests](
	[RequestID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[From] [date] NOT NULL,
	[To] [date] NOT NULL,
	[Reason] [varchar](max) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Requests] ([RequestID], [EmployeeID], [TypeID], [From], [To], [Reason], [Status]) VALUES (1, 1, 1, CAST(0xE93D0B00 AS Date), CAST(0xE93D0B00 AS Date), N'No reason', N'Processing')
INSERT [dbo].[Requests] ([RequestID], [EmployeeID], [TypeID], [From], [To], [Reason], [Status]) VALUES (2, 2, 2, CAST(0xEA3D0B00 AS Date), CAST(0xEA3D0B00 AS Date), N'No reason', N'Processing')
INSERT [dbo].[Requests] ([RequestID], [EmployeeID], [TypeID], [From], [To], [Reason], [Status]) VALUES (3, 3, 3, CAST(0xEB3D0B00 AS Date), CAST(0xEB3D0B00 AS Date), N'No reason', N'Approved')
INSERT [dbo].[Requests] ([RequestID], [EmployeeID], [TypeID], [From], [To], [Reason], [Status]) VALUES (4, 1, 3, CAST(0xEC3D0B00 AS Date), CAST(0xEC3D0B00 AS Date), N'No reason', N'Rejected')
INSERT [dbo].[Requests] ([RequestID], [EmployeeID], [TypeID], [From], [To], [Reason], [Status]) VALUES (5, 1, 4, CAST(0xED3D0B00 AS Date), CAST(0xED3D0B00 AS Date), N'Wedding day', N'Rejected')
/****** Object:  ForeignKey [FK_Requests_Employees]    Script Date: 02/25/2018 20:47:51 ******/
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Employees]
GO
/****** Object:  ForeignKey [FK_Requests_RequestTypes]    Script Date: 02/25/2018 20:47:51 ******/
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_RequestTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[RequestTypes] ([TypeID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_RequestTypes]
GO
