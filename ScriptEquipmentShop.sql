USE [master]
GO
/****** Object:  Database [EquipmentShop]    Script Date: 06.11.2024 15:49:48 ******/
CREATE DATABASE [EquipmentShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EquipmentShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\EquipmentShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EquipmentShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS1\MSSQL\DATA\EquipmentShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EquipmentShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EquipmentShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EquipmentShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EquipmentShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EquipmentShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EquipmentShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EquipmentShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [EquipmentShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EquipmentShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EquipmentShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EquipmentShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EquipmentShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EquipmentShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EquipmentShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EquipmentShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EquipmentShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EquipmentShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EquipmentShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EquipmentShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EquipmentShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EquipmentShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EquipmentShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EquipmentShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EquipmentShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EquipmentShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EquipmentShop] SET  MULTI_USER 
GO
ALTER DATABASE [EquipmentShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EquipmentShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EquipmentShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EquipmentShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EquipmentShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EquipmentShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EquipmentShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [EquipmentShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EquipmentShop]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_name] [varchar](255) NOT NULL,
	[second_name] [varchar](50) NOT NULL,
	[surname] [varchar](50) NULL,
	[contact_info] [varchar](255) NULL,
	[client_email] [varchar](50) NULL,
 CONSTRAINT [PK__clients__BF21A424FFB33DAC] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name] [varchar](255) NOT NULL,
	[position] [varchar](100) NULL,
	[contact_info] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipment_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_name] [varchar](255) NOT NULL,
	[model] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_comments]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[request_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[comment_text] [text] NULL,
	[comment_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_history]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_history](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[request_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[change_date] [datetime] NULL,
	[changed_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_status]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 06.11.2024 15:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[request_id] [int] IDENTITY(1,1) NOT NULL,
	[request_number] [varchar](20) NOT NULL,
	[creation_date] [date] NULL,
	[equipment_id] [int] NOT NULL,
	[issue_type] [varchar](255) NULL,
	[issue_description] [text] NULL,
	[client_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[responsible_employee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[request_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request_comments] ADD  DEFAULT (getdate()) FOR [comment_date]
GO
ALTER TABLE [dbo].[Request_history] ADD  DEFAULT (getdate()) FOR [change_date]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[Request_comments]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Request_comments]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[Requests] ([request_id])
GO
ALTER TABLE [dbo].[Request_history]  WITH CHECK ADD FOREIGN KEY([changed_by])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Request_history]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[Requests] ([request_id])
GO
ALTER TABLE [dbo].[Request_history]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[Request_status] ([status_id])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK__requests__client__4CA06362] FOREIGN KEY([client_id])
REFERENCES [dbo].[Clients] ([client_id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK__requests__client__4CA06362]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([equipment_id])
REFERENCES [dbo].[Equipment] ([equipment_id])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([responsible_employee])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[Request_status] ([status_id])
GO
USE [master]
GO
ALTER DATABASE [EquipmentShop] SET  READ_WRITE 
GO
