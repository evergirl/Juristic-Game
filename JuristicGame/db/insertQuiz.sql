USE [QuizDB]
GO

INSERT INTO [dbo].[Quiz]
           ([QuizName]
           ,[ChangeUser]
           ,[ChangeDate]
           ,[CreateUser]
           ,[CreateDate])
     VALUES
           ('e-Contracting'
           ,CURRENT_USER
           ,CURRENT_TIMESTAMP
           ,CURRENT_USER
           ,CURRENT_TIMESTAMP)
GO


