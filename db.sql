USE [master]
GO
/****** Object:  Database [CmsTeacher]    Script Date: 13/07/2023 02:00:08 ******/
CREATE DATABASE [CmsTeacher]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CmsTeacher', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CmsTeacher.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CmsTeacher_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CmsTeacher_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CmsTeacher] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CmsTeacher].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CmsTeacher] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CmsTeacher] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CmsTeacher] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CmsTeacher] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CmsTeacher] SET ARITHABORT OFF 
GO
ALTER DATABASE [CmsTeacher] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CmsTeacher] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CmsTeacher] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CmsTeacher] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CmsTeacher] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CmsTeacher] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CmsTeacher] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CmsTeacher] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CmsTeacher] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CmsTeacher] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CmsTeacher] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CmsTeacher] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CmsTeacher] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CmsTeacher] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CmsTeacher] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CmsTeacher] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CmsTeacher] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CmsTeacher] SET RECOVERY FULL 
GO
ALTER DATABASE [CmsTeacher] SET  MULTI_USER 
GO
ALTER DATABASE [CmsTeacher] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CmsTeacher] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CmsTeacher] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CmsTeacher] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CmsTeacher] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CmsTeacher] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CmsTeacher', N'ON'
GO
ALTER DATABASE [CmsTeacher] SET QUERY_STORE = OFF
GO
USE [CmsTeacher]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 13/07/2023 02:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[duedate] [date] NULL,
	[description] [nvarchar](1000) NULL,
	[course_id] [int] NULL,
	[linkSource] [nvarchar](50) NULL,
	[teacher] [nvarchar](50) NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 13/07/2023 02:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[teacher] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 13/07/2023 02:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[course_id] [int] NULL,
	[student_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmitAssigment]    Script Date: 13/07/2023 02:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitAssigment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cmt] [nvarchar](550) NULL,
	[student_id] [int] NULL,
	[linkSource] [nvarchar](500) NULL,
	[assign_id] [int] NULL,
	[submittime] [datetime] NULL,
 CONSTRAINT [PK_SubmitAssigment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/07/2023 02:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[mail] [nvarchar](200) NULL,
	[phone] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([id], [name], [duedate], [description], [course_id], [linkSource], [teacher]) VALUES (1, N'PT1', CAST(N'2023-07-07' AS Date), N'Pt 1', 1, N'123123', N'123')
INSERT [dbo].[Assignment] ([id], [name], [duedate], [description], [course_id], [linkSource], [teacher]) VALUES (2, N'Pt2', CAST(N'2023-10-10' AS Date), N'pt2', 1, N'123123', N'123')
INSERT [dbo].[Assignment] ([id], [name], [duedate], [description], [course_id], [linkSource], [teacher]) VALUES (3, N'PE Test', CAST(N'2023-07-13' AS Date), N'tu ban kiem nhieu tien lam', 1, N'', N'Teacher 1')
INSERT [dbo].[Assignment] ([id], [name], [duedate], [description], [course_id], [linkSource], [teacher]) VALUES (4, NULL, NULL, NULL, NULL, N'', N'thientm012@gmail.com')
SET IDENTITY_INSERT [dbo].[Assignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [name], [teacher]) VALUES (1, N'PRJ301', 1)
INSERT [dbo].[Course] ([id], [name], [teacher]) VALUES (2, N'PRF101', 1)
INSERT [dbo].[Course] ([id], [name], [teacher]) VALUES (3, N'PRn221', 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Enroll] ([course_id], [student_id]) VALUES (1, 2)
INSERT [dbo].[Enroll] ([course_id], [student_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [mail], [phone], [address], [role]) VALUES (1, N'Teacher 1', N'123', N'TECH@gamil.com', N'123123123', N'hanoi', 2)
INSERT [dbo].[Users] ([id], [username], [password], [mail], [phone], [address], [role]) VALUES (2, N'Student', N'123', N'stu@gmail.com', N'121231231', N'hanoi', 1)
INSERT [dbo].[Users] ([id], [username], [password], [mail], [phone], [address], [role]) VALUES (3, N'Student2', N'123', N'stu1@gmail.com', N'0378387199', N'hong cho anh oi', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD  CONSTRAINT [FK_Assignment_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Assignment] CHECK CONSTRAINT [FK_Assignment_Course]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Course]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Users]
GO
ALTER TABLE [dbo].[SubmitAssigment]  WITH CHECK ADD  CONSTRAINT [FK_SubmitAssigment_Assignment] FOREIGN KEY([assign_id])
REFERENCES [dbo].[Assignment] ([id])
GO
ALTER TABLE [dbo].[SubmitAssigment] CHECK CONSTRAINT [FK_SubmitAssigment_Assignment]
GO
ALTER TABLE [dbo].[SubmitAssigment]  WITH CHECK ADD  CONSTRAINT [FK_SubmitAssigment_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[SubmitAssigment] CHECK CONSTRAINT [FK_SubmitAssigment_Users]
GO
USE [master]
GO
ALTER DATABASE [CmsTeacher] SET  READ_WRITE 
GO
