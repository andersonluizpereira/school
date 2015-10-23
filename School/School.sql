USE [master]
GO
/****** Object:  Database [School]    Script Date: 07/14/2014 15:43:49 ******/
CREATE DATABASE [School] ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Projetos\School\School.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Projetos\School\School_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [School] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [School] SET ARITHABORT OFF
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [School] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [School] SET  DISABLE_BROKER
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [School] SET  READ_WRITE
GO
ALTER DATABASE [School] SET RECOVERY SIMPLE
GO
ALTER DATABASE [School] SET  MULTI_USER
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [School] SET DB_CHAINING OFF
GO
USE [School]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 07/14/2014 15:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 07/14/2014 15:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Student')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Teacher')
/****** Object:  Table [dbo].[UsersLogin]    Script Date: 07/14/2014 15:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersLogin](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserLastLogin] [datetime] NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_User-Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UsersLogin] ON
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (1, N'euclides@w2c.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (2, N'josesilva@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1)
SET IDENTITY_INSERT [dbo].[UsersLogin] OFF
/****** Object:  StoredProcedure [dbo].[TryLogin]    Script Date: 07/14/2014 15:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return password using email
-- =============================================
CREATE PROCEDURE [dbo].[TryLogin] 
	@UserEmail nvarchar(50)
AS
BEGIN
	SELECT UserPassword 
	FROM UsersLogin
	WHERE UserEmail = @UserEmail
END
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 07/14/2014 15:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherLastName] [nvarchar](50) NOT NULL,
	[TeacherFirstName] [nvarchar](50) NOT NULL,
	[TeacherDateJoin] [datetime] NOT NULL,
	[TeacherDepartment] [nvarchar](50) NOT NULL,
	[LoginID] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (1, N'Chuma', N'Euclides', CAST(0x00008EAC00000000 AS DateTime), N'Science', 1)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
/****** Object:  Table [dbo].[Students]    Script Date: 07/14/2014 15:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentLastName] [nvarchar](50) NOT NULL,
	[StudentFirstName] [nvarchar](50) NOT NULL,
	[StudentBirthday] [datetime] NOT NULL,
	[StudentAddress] [nvarchar](100) NOT NULL,
	[StudentCity] [nvarchar](50) NOT NULL,
	[StudentUF] [nvarchar](50) NOT NULL,
	[StudentPhone] [nvarchar](20) NOT NULL,
	[StudentDateJoin] [datetime] NOT NULL,
	[LoginID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Students] ON
INSERT [dbo].[Students] ([StudentID], [StudentLastName], [StudentFirstName], [StudentBirthday], [StudentAddress], [StudentCity], [StudentUF], [StudentPhone], [StudentDateJoin], [LoginID]) VALUES (3, N'Silva', N'Jose', CAST(0x000056B500000000 AS DateTime), N'Rua Dr. Lobo Mau 123', N'São Paulo', N'SP', N'11-1212-1212', CAST(0x0000A13900000000 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Students] OFF
/****** Object:  Table [dbo].[Grades]    Script Date: 07/14/2014 15:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Grade] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 07/14/2014 15:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[ClassroomID] [int] IDENTITY(1,1) NOT NULL,
	[ClassroomSemester] [nvarchar](20) NOT NULL,
	[CourseID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[ClassroomObs] [nvarchar](max) NULL,
 CONSTRAINT [PK_Classrooms] PRIMARY KEY CLUSTERED 
(
	[ClassroomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrooms-Students]    Script Date: 07/14/2014 15:43:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms-Students](
	[ClassroomID] [int] NOT NULL,
	[StudentID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_User-Login_Roles]    Script Date: 07/14/2014 15:43:51 ******/
ALTER TABLE [dbo].[UsersLogin]  WITH CHECK ADD  CONSTRAINT [FK_User-Login_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UsersLogin] CHECK CONSTRAINT [FK_User-Login_Roles]
GO
/****** Object:  ForeignKey [FK_Teachers_User-Login]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Teachers]  WITH NOCHECK ADD  CONSTRAINT [FK_Teachers_User-Login] FOREIGN KEY([LoginID])
REFERENCES [dbo].[UsersLogin] ([LoginID])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_User-Login]
GO
/****** Object:  ForeignKey [FK_Students_User-Login]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Students]  WITH NOCHECK ADD  CONSTRAINT [FK_Students_User-Login] FOREIGN KEY([LoginID])
REFERENCES [dbo].[UsersLogin] ([LoginID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_User-Login]
GO
/****** Object:  ForeignKey [FK_Grades_Courses]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Courses]
GO
/****** Object:  ForeignKey [FK_Grades_Students]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Students]
GO
/****** Object:  ForeignKey [FK_Classrooms_Courses]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Classrooms]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Classrooms] CHECK CONSTRAINT [FK_Classrooms_Courses]
GO
/****** Object:  ForeignKey [FK_Classrooms_Teachers]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Classrooms]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Classrooms] CHECK CONSTRAINT [FK_Classrooms_Teachers]
GO
/****** Object:  ForeignKey [FK_Classrooms-Students_Classrooms]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Classrooms-Students]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms-Students_Classrooms] FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classrooms] ([ClassroomID])
GO
ALTER TABLE [dbo].[Classrooms-Students] CHECK CONSTRAINT [FK_Classrooms-Students_Classrooms]
GO
/****** Object:  ForeignKey [FK_Classrooms-Students_Students]    Script Date: 07/14/2014 15:43:53 ******/
ALTER TABLE [dbo].[Classrooms-Students]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms-Students_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Classrooms-Students] CHECK CONSTRAINT [FK_Classrooms-Students_Students]
GO
