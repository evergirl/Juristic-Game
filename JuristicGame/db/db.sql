USE [master]  
GO  
  
/* db [QuizDB] */  
CREATE DATABASE [QuizDB]  
-- CONTAINMENT = NONE  
-- ON  PRIMARY   
--( NAME = N'QuizDB', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuizDB.txt' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )  
-- LOG ON   
--( NAME = N'QuizDB_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuizDB_log.txt' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)  
GO  
  
ALTER DATABASE [QuizDB] SET COMPATIBILITY_LEVEL = 110  
GO  
  
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))  
begin  
EXEC [QuizDB].[dbo].[sp_fulltext_database] @action = 'enable'  
end  
GO  
  
ALTER DATABASE [QuizDB] SET ANSI_NULL_DEFAULT OFF   
GO  
  
ALTER DATABASE [QuizDB] SET ANSI_NULLS OFF   
GO  
  
ALTER DATABASE [QuizDB] SET ANSI_PADDING OFF   
GO  
  
ALTER DATABASE [QuizDB] SET ANSI_WARNINGS OFF   
GO  
  
ALTER DATABASE [QuizDB] SET ARITHABORT OFF   
GO  
  
ALTER DATABASE [QuizDB] SET AUTO_CLOSE OFF   
GO  
  
ALTER DATABASE [QuizDB] SET AUTO_CREATE_STATISTICS ON   
GO  
  
ALTER DATABASE [QuizDB] SET AUTO_SHRINK OFF   
GO  
  
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS ON   
GO  
  
ALTER DATABASE [QuizDB] SET CURSOR_CLOSE_ON_COMMIT OFF   
GO  
  
ALTER DATABASE [QuizDB] SET CURSOR_DEFAULT  GLOBAL   
GO  
  
ALTER DATABASE [QuizDB] SET CONCAT_NULL_YIELDS_NULL OFF   
GO  
  
ALTER DATABASE [QuizDB] SET NUMERIC_ROUNDABORT OFF   
GO  
  
ALTER DATABASE [QuizDB] SET QUOTED_IDENTIFIER OFF   
GO  
  
ALTER DATABASE [QuizDB] SET RECURSIVE_TRIGGERS OFF   
GO  
  
ALTER DATABASE [QuizDB] SET  DISABLE_BROKER   
GO  
  
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF   
GO  
  
ALTER DATABASE [QuizDB] SET DATE_CORRELATION_OPTIMIZATION OFF   
GO  
  
ALTER DATABASE [QuizDB] SET TRUSTWORTHY OFF   
GO  
  
ALTER DATABASE [QuizDB] SET ALLOW_SNAPSHOT_ISOLATION OFF   
GO  
  
ALTER DATABASE [QuizDB] SET PARAMETERIZATION SIMPLE   
GO  
  
ALTER DATABASE [QuizDB] SET READ_COMMITTED_SNAPSHOT OFF   
GO  
  
ALTER DATABASE [QuizDB] SET HONOR_BROKER_PRIORITY OFF   
GO  
  
ALTER DATABASE [QuizDB] SET RECOVERY SIMPLE   
GO  
  
ALTER DATABASE [QuizDB] SET  MULTI_USER   
GO  
  
ALTER DATABASE [QuizDB] SET PAGE_VERIFY CHECKSUM    
GO  
  
ALTER DATABASE [QuizDB] SET DB_CHAINING OFF   
GO  
  
ALTER DATABASE [QuizDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )   
GO  
  
ALTER DATABASE [QuizDB] SET TARGET_RECOVERY_TIME = 0 SECONDS   
GO  
  
ALTER DATABASE [QuizDB] SET  READ_WRITE   
GO 