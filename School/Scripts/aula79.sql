USE [DevmediaSchool]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 09/01/2014 16:24:10 ******/
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
SET IDENTITY_INSERT [dbo].[Courses] ON
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription]) VALUES (1, N'Algebra I', N'Introduction to the Algebra')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription]) VALUES (2, N'Portuguese I', N'Introduction to the portuguese literature')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription]) VALUES (4, N'Physics I', N'Introduction to the Physics of the motions')
INSERT [dbo].[Courses] ([CourseID], [CourseName], [CourseDescription]) VALUES (6, N'Science III', N'Continue to the Science')
SET IDENTITY_INSERT [dbo].[Courses] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 09/01/2014 16:24:10 ******/
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
/****** Object:  Table [dbo].[UsersLogin]    Script Date: 09/01/2014 16:24:10 ******/
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
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (2, N'josesilvas@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (4, N'pedro.pedrosa@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (5, N'mario@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (6, N'maria.maria@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (7, N'rita.ritinha@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (8, N'joazinho@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (10, N'fernandinha@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (14, N'antonina@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (15, N'paulino@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (16, N'katiele@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (17, N'gomesgouveia@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 2)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (19, N'marcelasilva@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (23, N'terezinha@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1)
INSERT [dbo].[UsersLogin] ([LoginID], [UserEmail], [UserPassword], [UserLastLogin], [RoleID]) VALUES (24, N'pauleto@devmedia.com.br', N'40BD001563085FC35165329EA1FF5C5ECBDBBEEF', NULL, 1)
SET IDENTITY_INSERT [dbo].[UsersLogin] OFF
/****** Object:  StoredProcedure [dbo].[TryLogin]    Script Date: 09/01/2014 16:24:11 ******/
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
/****** Object:  Table [dbo].[Teachers]    Script Date: 09/01/2014 16:24:11 ******/
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
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (1, N'Chuma', N'Euclides', CAST(0x00008EAC00000000 AS DateTime), N'Biology', 1)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (2, N'Pedrosa', N'Pedro', CAST(0x00009CF100000000 AS DateTime), N'Mathematics', 4)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (3, N'Mario', N'Mariano', CAST(0x00009FCB00000000 AS DateTime), N'Chemical', 5)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (4, N'Maria', N'Maria', CAST(0x00009B8400000000 AS DateTime), N'Science', 6)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (5, N'Rita', N'Ritinha', CAST(0x0000A13900000000 AS DateTime), N'Biology', 7)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (7, N'João', N'Joãozinho', CAST(0x000095CF00000000 AS DateTime), N'Literature', 8)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (9, N'Fernanda', N'Fernandinha', CAST(0x00009E5E00000000 AS DateTime), N'Physics', 10)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (13, N'Antonia', N'Antonina', CAST(0x0000A37000A490EB AS DateTime), N'Biology', 14)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (14, N'Paulo', N'Paulino', CAST(0x0000A376008BEC46 AS DateTime), N'Science', 15)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (15, N'Katia', N'Katiele', CAST(0x0000A376008C08F5 AS DateTime), N'Biology', 16)
INSERT [dbo].[Teachers] ([TeacherID], [TeacherLastName], [TeacherFirstName], [TeacherDateJoin], [TeacherDepartment], [LoginID]) VALUES (16, N'Gouveia', N'Gomes', CAST(0x0000A376008C48AC AS DateTime), N'Literarture', 17)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
/****** Object:  Table [dbo].[Students]    Script Date: 09/01/2014 16:24:11 ******/
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
INSERT [dbo].[Students] ([StudentID], [StudentLastName], [StudentFirstName], [StudentBirthday], [StudentAddress], [StudentCity], [StudentUF], [StudentPhone], [StudentDateJoin], [LoginID]) VALUES (3, N'Silvax', N'Mario', CAST(0x000056B500000000 AS DateTime), N'Rua Dr. Lobo Mau 123', N'São Paulo', N'SP', N'11-1212-1212', CAST(0x0000A13900000000 AS DateTime), 2)
INSERT [dbo].[Students] ([StudentID], [StudentLastName], [StudentFirstName], [StudentBirthday], [StudentAddress], [StudentCity], [StudentUF], [StudentPhone], [StudentDateJoin], [LoginID]) VALUES (4, N'Silva', N'Marcela', CAST(0x00005CBD00000000 AS DateTime), N'Rua Professor Jose 123', N'Rio de Janeiro', N'RJ', N'21-2121-2121', CAST(0x00009FCB00000000 AS DateTime), 19)
INSERT [dbo].[Students] ([StudentID], [StudentLastName], [StudentFirstName], [StudentBirthday], [StudentAddress], [StudentCity], [StudentUF], [StudentPhone], [StudentDateJoin], [LoginID]) VALUES (8, N'Terez', N'Tereza', CAST(0x0000654C00000000 AS DateTime), N'Av. Professor Anibal', N'São Paulo', N'SP', N'11-1212-2121', CAST(0x0000A38700FA37E8 AS DateTime), 23)
INSERT [dbo].[Students] ([StudentID], [StudentLastName], [StudentFirstName], [StudentBirthday], [StudentAddress], [StudentCity], [StudentUF], [StudentPhone], [StudentDateJoin], [LoginID]) VALUES (9, N'Pauleto', N'Paulo', CAST(0x00006C1B00000000 AS DateTime), N'Rua Maracaiax 69999', N'São Paulo', N'SP', N'11-1313-1313', CAST(0x0000A38C00915BB4 AS DateTime), 24)
SET IDENTITY_INSERT [dbo].[Students] OFF
/****** Object:  StoredProcedure [dbo].[InsertTeacher]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Insert Teacher
-- =============================================
CREATE PROCEDURE [dbo].[InsertTeacher] 
	@TeacherLastName nvarchar(50),
	@TeacherFirstName nvarchar(50),
	@TeacherDepartment nvarchar(50),
	@UserEmail nvarchar(50),
	@UserPassword nvarchar(max)
AS
BEGIN
	INSERT INTO UsersLogin 
	(UserEmail, UserPassword, RoleID)
	VALUES 
	(@UserEmail, @UserPassword, 2)

	INSERT INTO Teachers 
	(TeacherLastName, TeacherFirstName, TeacherDateJoin, TeacherDepartment, LoginID)
	VALUES 
	(@TeacherFirstName, @TeacherLastName, GETDATE(), @TeacherDepartment, SCOPE_IDENTITY())
END
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Insert Student
-- =============================================
CREATE PROCEDURE [dbo].[InsertStudent] 
	@StudentLastName nvarchar(50),
	@StudentFirstName nvarchar(50),
	@StudentBirthday datetime,
	@StudentAddress nvarchar(100),
	@StudentCity nvarchar(50),
	@StudentUF nvarchar(50),
	@StudentPhone nvarchar(20),
	@UserEmail nvarchar(50),
	@UserPassword nvarchar(max)
AS
BEGIN
	DECLARE @PasswordTemp nvarchar(max)
	SELECT @PasswordTemp = UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('SHA1', CONVERT(varchar(max),@UserPassword))), 3, 40)) 

	INSERT INTO UsersLogin 
	(UserEmail, UserPassword, RoleID)
	VALUES 
	(@UserEmail, @PasswordTemp, 1)

	INSERT INTO Students 
	(StudentLastName, StudentFirstName, StudentBirthday, StudentAddress, StudentCity, StudentUF, StudentPhone, StudentDateJoin,  LoginID)
	VALUES 
	(@StudentLastName, @StudentFirstName, @StudentBirthday, @StudentAddress, @StudentCity, @StudentUF, @StudentPhone, GETDATE(), SCOPE_IDENTITY())
END
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 09/01/2014 16:24:11 ******/
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
SET IDENTITY_INSERT [dbo].[Grades] ON
INSERT [dbo].[Grades] ([GradeID], [StudentID], [CourseID], [Grade]) VALUES (8, 8, 4, CAST(7.50 AS Decimal(5, 2)))
INSERT [dbo].[Grades] ([GradeID], [StudentID], [CourseID], [Grade]) VALUES (9, 4, 4, CAST(8.00 AS Decimal(5, 2)))
INSERT [dbo].[Grades] ([GradeID], [StudentID], [CourseID], [Grade]) VALUES (11, 3, 4, CAST(2.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Grades] OFF
/****** Object:  StoredProcedure [dbo].[GetTeachers]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return teachers information
-- =============================================
CREATE PROCEDURE [dbo].[GetTeachers] 
AS
BEGIN
	SELECT TeacherID, TeacherLastName, TeacherFirstName, TeacherDateJoin, TeacherDepartment  
	FROM Teachers
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[GetStudents]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return students information
-- =============================================
CREATE PROCEDURE [dbo].[GetStudents] 
AS
BEGIN
	SELECT Students.*, UsersLogin.UserEmail, UserPassword = 'xxxxxx'    
	FROM Students INNER JOIN UsersLogin ON Students.LoginID = UsersLogin.LoginID 
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTeacher]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Delete a teacher
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTeacher] 
	@TeacherID int,
	@LoginID int = -1
AS
BEGIN
	SELECT @LoginID = LoginID 
	FROM Teachers 
	WHERE TeacherID = @TeacherID
	
	DELETE FROM Teachers
	WHERE TeacherID = @TeacherID

	DELETE FROM UsersLogin
	WHERE LoginID = @LoginID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Delete a student
-- =============================================
CREATE PROCEDURE [dbo].[DeleteStudent] 
	@StudentID int,
	@LoginID int = -1
AS
BEGIN
	SELECT @LoginID = LoginID 
	FROM Students 
	WHERE StudentID = @StudentID
	
	DELETE FROM Students
	WHERE StudentID = @StudentID

	DELETE FROM UsersLogin
	WHERE LoginID = @LoginID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTeacher]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return password using email
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTeacher] 
	@TeacherID int,
	@TeacherLastName nvarchar(50),
	@TeacherFirstName nvarchar(50),
	@TeacherDateJoin datetime,
	@TeacherDepartment nvarchar(50)
AS
BEGIN
	UPDATE Teachers
	SET 
	TeacherLastName = @TeacherLastName,
	TeacherFirstName = @TeacherFirstName,
	TeacherDateJoin = @TeacherDateJoin,
	TeacherDepartment = @TeacherDepartment
	WHERE TeacherID = @TeacherID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Update student informations
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStudent] 
	@StudentID int,
	@StudentLastName nvarchar(50),
	@StudentFirstName nvarchar(50),
	@StudentBirthday datetime,
	@StudentAddress nvarchar(100),
	@StudentCity nvarchar(50),
	@StudentUF nvarchar(50),
	@StudentPhone nvarchar(20),
	@StudentDateJoin datetime,
	@UserEmail nvarchar(50),
	@UserPassword nvarchar(max),
	@LoginID int = -1
AS
BEGIN
	SELECT @LoginID = LoginID 
	FROM Students 
	WHERE StudentID = @StudentID

	UPDATE Students
	SET 
	StudentLastName = @StudentLastName,
	StudentFirstName = @StudentFirstName,
	StudentBirthday = @StudentBirthday,
	StudentAddress = @StudentAddress,
	StudentCity = @StudentCity,
	StudentUF = @StudentUF,
	StudentPhone = @StudentPhone,
	StudentDateJoin = @StudentDateJoin
	WHERE StudentID = @StudentID
	
	DECLARE @tempx nvarchar(max)
	SELECT @tempx = UPPER(SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('SHA1', CONVERT(varchar(max),@UserPassword))), 3, 40)) 
	
	UPDATE UsersLogin
	SET 
	UserEmail = @UserEmail,
	UserPassword = @tempx  
	WHERE LoginID = @LoginID
END
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 09/01/2014 16:24:11 ******/
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
SET IDENTITY_INSERT [dbo].[Classrooms] ON
INSERT [dbo].[Classrooms] ([ClassroomID], [ClassroomSemester], [CourseID], [TeacherID], [ClassroomObs]) VALUES (1, N'2/2014', 2, 14, N'Nothing')
INSERT [dbo].[Classrooms] ([ClassroomID], [ClassroomSemester], [CourseID], [TeacherID], [ClassroomObs]) VALUES (3, N'1/2014', 4, 7, N'Nothing')
SET IDENTITY_INSERT [dbo].[Classrooms] OFF
/****** Object:  Table [dbo].[Classrooms-Students]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms-Students](
	[ClassroomID] [int] NOT NULL,
	[StudentID] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Classrooms-Students] ([ClassroomID], [StudentID]) VALUES (1, 3)
INSERT [dbo].[Classrooms-Students] ([ClassroomID], [StudentID]) VALUES (3, 3)
INSERT [dbo].[Classrooms-Students] ([ClassroomID], [StudentID]) VALUES (3, 4)
INSERT [dbo].[Classrooms-Students] ([ClassroomID], [StudentID]) VALUES (3, 8)
/****** Object:  StoredProcedure [dbo].[UpdateClassroom]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Update classroom informations
-- =============================================
CREATE PROCEDURE [dbo].[UpdateClassroom] 
	@ClassroomID int,
	@ClassroomSemester nvarchar(20),
	@CourseID int,
	@TeacherID int
AS
BEGIN
	UPDATE Classrooms
	SET 
	ClassroomSemester = @ClassroomSemester,
	CourseID = @CourseID,
	TeacherID = @TeacherID
	WHERE ClassroomID = @ClassroomID
END
GO
/****** Object:  StoredProcedure [dbo].[GetClassrooms]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return classrooms information
-- =============================================
CREATE PROCEDURE [dbo].[GetClassrooms] 
AS
BEGIN
	SELECT Classrooms.ClassroomID
      ,Classrooms.ClassroomSemester
      ,Classrooms.CourseID
      ,Courses.CourseName 
      ,Classrooms.TeacherID
      ,Teachers.TeacherFirstName + ' ' + Teachers.TeacherLastName AS TeacherName
      ,Classrooms.ClassroomObs  
  FROM Classrooms INNER JOIN Courses ON Classrooms.CourseID = Courses.CourseID INNER JOIN Teachers On Classrooms.TeacherID = Teachers.TeacherID 
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[EditGrade]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Edit grade
-- =============================================
CREATE PROCEDURE [dbo].[EditGrade] 
	@Grade decimal(5,2),
	@CourseID int,
	@StudentID int,
	@GradeID int
AS
BEGIN
	IF @GradeID = -1
		INSERT INTO Grades 
		(Grade, CourseID, StudentID)
		VALUES 
		(@Grade, @CourseID, @StudentID)
	ELSE
		UPDATE Grades SET Grade = @Grade WHERE GradeID = @GradeID	
END
GO
/****** Object:  StoredProcedure [dbo].[InsertClassroom]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Insert classroom
-- =============================================
CREATE PROCEDURE [dbo].[InsertClassroom] 
	@ClassroomSemester nvarchar(20),
	@CourseID int,
	@TeacherID int
AS
BEGIN
	INSERT INTO Classrooms 
	(ClassroomSemester, CourseID, TeacherID)
	VALUES 
	(@ClassroomSemester, @CourseID, @TeacherID)
END
GO
/****** Object:  StoredProcedure [dbo].[GetGradesClassrooms]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return classrooms information to grades
-- =============================================
CREATE PROCEDURE [dbo].[GetGradesClassrooms] 
AS
BEGIN
	SELECT Classrooms.ClassroomID
      ,Classrooms.ClassroomSemester
      ,Classrooms.CourseID
      ,Courses.CourseName 
      ,Classrooms.TeacherID
      ,Teachers.TeacherFirstName + ' ' + Teachers.TeacherLastName AS TeacherName
      ,Classrooms.ClassroomObs  
  FROM Classrooms INNER JOIN Courses ON Classrooms.CourseID = Courses.CourseID INNER JOIN Teachers On Classrooms.TeacherID = Teachers.TeacherID 
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[GetClassroomStudents]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return students information in classroom
-- =============================================
CREATE PROCEDURE [dbo].[GetClassroomStudents] 
@ClassroomId int
AS
BEGIN
	SELECT Students.*    
	FROM Students INNER JOIN [Classrooms-Students] ON Students.StudentID = [Classrooms-Students].StudentID 
	WHERE ClassroomID=@ClassroomId
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[GetGradesStudents]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Return students information to grades
-- =============================================
CREATE PROCEDURE [dbo].[GetGradesStudents] 
@ClassroomId int
AS
BEGIN
	SELECT Students.StudentID, Students.StudentLastName, Students.StudentFirstName, Courses.CourseName, Courses.CourseID, ISNULL(Grades.GradeID, -1) AS GradeID, ISNULL(Grades.Grade, 0) AS Grade     
	FROM Students INNER JOIN [Classrooms-Students] ON Students.StudentID = [Classrooms-Students].StudentID INNER JOIN [Classrooms] ON [Classrooms].ClassroomID = [Classrooms-Students].ClassroomID INNER JOIN [Courses] ON [Courses].CourseID = [Classrooms].CourseID LEFT OUTER JOIN [Grades] ON [Grades].StudentID = [Classrooms-Students].StudentID
	WHERE [Classrooms-Students].ClassroomID=@ClassroomId
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClassroom]    Script Date: 09/01/2014 16:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Euclides Chuma
-- Create date: 2014
-- Description:	Delete a classroom
-- =============================================
CREATE PROCEDURE [dbo].[DeleteClassroom] 
	@ClassroomID int
AS
BEGIN
	DELETE FROM [Classrooms-Students]
	WHERE ClassroomID = @ClassroomID

	DELETE FROM Classrooms 
	WHERE ClassroomID = @ClassroomID
END
GO
/****** Object:  ForeignKey [FK_User-Login_Roles]    Script Date: 09/01/2014 16:24:10 ******/
ALTER TABLE [dbo].[UsersLogin]  WITH CHECK ADD  CONSTRAINT [FK_User-Login_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UsersLogin] CHECK CONSTRAINT [FK_User-Login_Roles]
GO
/****** Object:  ForeignKey [FK_Teachers_User-Login]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Teachers]  WITH NOCHECK ADD  CONSTRAINT [FK_Teachers_User-Login] FOREIGN KEY([LoginID])
REFERENCES [dbo].[UsersLogin] ([LoginID])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_User-Login]
GO
/****** Object:  ForeignKey [FK_Students_User-Login]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Students]  WITH NOCHECK ADD  CONSTRAINT [FK_Students_User-Login] FOREIGN KEY([LoginID])
REFERENCES [dbo].[UsersLogin] ([LoginID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_User-Login]
GO
/****** Object:  ForeignKey [FK_Grades_Courses]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Courses]
GO
/****** Object:  ForeignKey [FK_Grades_Students]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD  CONSTRAINT [FK_Grades_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Grades] CHECK CONSTRAINT [FK_Grades_Students]
GO
/****** Object:  ForeignKey [FK_Classrooms_Courses]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Classrooms]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Classrooms] CHECK CONSTRAINT [FK_Classrooms_Courses]
GO
/****** Object:  ForeignKey [FK_Classrooms_Teachers]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Classrooms]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[Classrooms] CHECK CONSTRAINT [FK_Classrooms_Teachers]
GO
/****** Object:  ForeignKey [FK_Classrooms-Students_Classrooms]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Classrooms-Students]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms-Students_Classrooms] FOREIGN KEY([ClassroomID])
REFERENCES [dbo].[Classrooms] ([ClassroomID])
GO
ALTER TABLE [dbo].[Classrooms-Students] CHECK CONSTRAINT [FK_Classrooms-Students_Classrooms]
GO
/****** Object:  ForeignKey [FK_Classrooms-Students_Students]    Script Date: 09/01/2014 16:24:11 ******/
ALTER TABLE [dbo].[Classrooms-Students]  WITH CHECK ADD  CONSTRAINT [FK_Classrooms-Students_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Classrooms-Students] CHECK CONSTRAINT [FK_Classrooms-Students_Students]
GO
