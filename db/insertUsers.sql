USE [QuizDB]
GO

DECLARE @RC int
DECLARE @Name nvarchar(50)
DECLARE @Password nvarchar(8)
DECLARE @Role nvarchar(20)

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[AddUser] 
   @Name = 'celine'
  ,@Password = 'pw'
  ,@Role = 'Admin'
GO

DECLARE @RC int
DECLARE @Name nvarchar(50)
DECLARE @Password nvarchar(8)
DECLARE @Role nvarchar(20)

EXECUTE @RC = [dbo].[AddUser] 
   @Name = 'julia'
  ,@Password = 'pw'
  ,@Role = 'Admin'
GO
