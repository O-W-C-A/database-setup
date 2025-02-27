USE [master]
GO
/****** Object:  Database [ExamsDB]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE DATABASE [ExamsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamsDB', FILENAME = N'C:\Users\Daniel\ExamsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExamsDB_log', FILENAME = N'C:\Users\Daniel\ExamsDB.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExamsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamsDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [ExamsDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [ExamsDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [ExamsDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [ExamsDB] SET ARITHABORT ON 
GO
ALTER DATABASE [ExamsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamsDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ExamsDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [ExamsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamsDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [ExamsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamsDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExamsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExamsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExamsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ExamsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExamsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExamsDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorID] [int] NOT NULL,
	[SpecializationID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[Semester] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamRequestRooms]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamRequestRooms](
	[ExamRequestID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ExamRequestRooms] PRIMARY KEY CLUSTERED 
(
	[ExamRequestID] ASC,
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamRequests]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamRequests](
	[ExamRequestID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[AssistantID] [int] NULL,
	[SessionID] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Date] [datetime2](7) NOT NULL,
	[TimeStart] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[Details] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ExamRequests] PRIMARY KEY CLUSTERED 
(
	[ExamRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyID] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NULL,
	[LongName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[SpecializationID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabHolders]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabHolders](
	[ProfessorID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_LabHolders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modifications]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modifications](
	[ModificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TableName] [nvarchar](max) NULL,
	[ColumnName] [nvarchar](max) NULL,
	[OldValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Modifications] PRIMARY KEY CLUSTERED 
(
	[ModificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professors]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DepartmentID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Capacity] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Secretaries]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secretaries](
	[SecretaryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SpecializationID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Secretaries] PRIMARY KEY CLUSTERED 
(
	[SecretaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[Semester] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[SpecializationID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Specializations] PRIMARY KEY CLUSTERED 
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[IsLeader] [bit] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/10/2025 5:35:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FacultyID] [int] NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
	[UniversityID] [int] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Courses_ProfessorID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Courses_ProfessorID] ON [dbo].[Courses]
(
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Courses_SpecializationID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Courses_SpecializationID] ON [dbo].[Courses]
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Departments_FacultyID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Departments_FacultyID] ON [dbo].[Departments]
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamRequestRooms_RoomID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamRequestRooms_RoomID] ON [dbo].[ExamRequestRooms]
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamRequests_AssistantID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamRequests_AssistantID] ON [dbo].[ExamRequests]
(
	[AssistantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamRequests_CourseID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamRequests_CourseID] ON [dbo].[ExamRequests]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamRequests_GroupID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamRequests_GroupID] ON [dbo].[ExamRequests]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamRequests_SessionID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamRequests_SessionID] ON [dbo].[ExamRequests]
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Groups_SpecializationID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Groups_SpecializationID] ON [dbo].[Groups]
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LabHolders_CourseID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_LabHolders_CourseID] ON [dbo].[LabHolders]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LabHolders_ProfessorID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_LabHolders_ProfessorID] ON [dbo].[LabHolders]
(
	[ProfessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Modifications_UserID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Modifications_UserID] ON [dbo].[Modifications]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Professors_DepartmentID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Professors_DepartmentID] ON [dbo].[Professors]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Professors_UserID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Professors_UserID] ON [dbo].[Professors]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_DepartmentID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_DepartmentID] ON [dbo].[Rooms]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Secretaries_SpecializationID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Secretaries_SpecializationID] ON [dbo].[Secretaries]
(
	[SpecializationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Secretaries_UserID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Secretaries_UserID] ON [dbo].[Secretaries]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Specializations_FacultyID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Specializations_FacultyID] ON [dbo].[Specializations]
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_GroupID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Students_GroupID] ON [dbo].[Students]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_UserID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Students_UserID] ON [dbo].[Students]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_FacultyID]    Script Date: 1/10/2025 5:35:51 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_FacultyID] ON [dbo].[Users]
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [Semester]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [Semester]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [PasswordHash]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professors_ProfessorID] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professors] ([ProfessorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professors_ProfessorID]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Specializations_SpecializationID] FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Specializations_SpecializationID]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties_FacultyID] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties_FacultyID]
GO
ALTER TABLE [dbo].[ExamRequestRooms]  WITH CHECK ADD  CONSTRAINT [FK_ExamRequestRooms_ExamRequests_ExamRequestID] FOREIGN KEY([ExamRequestID])
REFERENCES [dbo].[ExamRequests] ([ExamRequestID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamRequestRooms] CHECK CONSTRAINT [FK_ExamRequestRooms_ExamRequests_ExamRequestID]
GO
ALTER TABLE [dbo].[ExamRequestRooms]  WITH CHECK ADD  CONSTRAINT [FK_ExamRequestRooms_Rooms_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamRequestRooms] CHECK CONSTRAINT [FK_ExamRequestRooms_Rooms_RoomID]
GO
ALTER TABLE [dbo].[ExamRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExamRequests_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExamRequests] CHECK CONSTRAINT [FK_ExamRequests_Courses_CourseID]
GO
ALTER TABLE [dbo].[ExamRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExamRequests_Groups_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[ExamRequests] CHECK CONSTRAINT [FK_ExamRequests_Groups_GroupID]
GO
ALTER TABLE [dbo].[ExamRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExamRequests_Professors_AssistantID] FOREIGN KEY([AssistantID])
REFERENCES [dbo].[Professors] ([ProfessorID])
GO
ALTER TABLE [dbo].[ExamRequests] CHECK CONSTRAINT [FK_ExamRequests_Professors_AssistantID]
GO
ALTER TABLE [dbo].[ExamRequests]  WITH CHECK ADD  CONSTRAINT [FK_ExamRequests_Sessions_SessionID] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Sessions] ([SessionID])
GO
ALTER TABLE [dbo].[ExamRequests] CHECK CONSTRAINT [FK_ExamRequests_Sessions_SessionID]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Specializations_SpecializationID] FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Specializations_SpecializationID]
GO
ALTER TABLE [dbo].[LabHolders]  WITH CHECK ADD  CONSTRAINT [FK_LabHolders_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[LabHolders] CHECK CONSTRAINT [FK_LabHolders_Courses_CourseID]
GO
ALTER TABLE [dbo].[LabHolders]  WITH CHECK ADD  CONSTRAINT [FK_LabHolders_Professors_ProfessorID] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professors] ([ProfessorID])
GO
ALTER TABLE [dbo].[LabHolders] CHECK CONSTRAINT [FK_LabHolders_Professors_ProfessorID]
GO
ALTER TABLE [dbo].[Modifications]  WITH CHECK ADD  CONSTRAINT [FK_Modifications_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Modifications] CHECK CONSTRAINT [FK_Modifications_Users_UserID]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments_DepartmentID]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Users_UserID]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Departments_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Departments_DepartmentID]
GO
ALTER TABLE [dbo].[Secretaries]  WITH CHECK ADD  CONSTRAINT [FK_Secretaries_Specializations_SpecializationID] FOREIGN KEY([SpecializationID])
REFERENCES [dbo].[Specializations] ([SpecializationID])
GO
ALTER TABLE [dbo].[Secretaries] CHECK CONSTRAINT [FK_Secretaries_Specializations_SpecializationID]
GO
ALTER TABLE [dbo].[Secretaries]  WITH CHECK ADD  CONSTRAINT [FK_Secretaries_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Secretaries] CHECK CONSTRAINT [FK_Secretaries_Users_UserID]
GO
ALTER TABLE [dbo].[Specializations]  WITH CHECK ADD  CONSTRAINT [FK_Specializations_Faculties_FacultyID] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Specializations] CHECK CONSTRAINT [FK_Specializations_Faculties_FacultyID]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups_GroupID]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users_UserID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Faculties_FacultyID] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Faculties_FacultyID]
GO
USE [master]
GO
ALTER DATABASE [ExamsDB] SET  READ_WRITE 
GO
