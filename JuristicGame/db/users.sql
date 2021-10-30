USE [QuizDB]  
GO  
  
/* table Users */ 
SET ANSI_NULLS ON  
GO  
  
SET QUOTED_IDENTIFIER ON  
GO  
  
SET ANSI_PADDING ON  
GO  
  
CREATE TABLE [dbo].[Users](  
    [UserId] [int] IDENTITY(1,1) NOT NULL,  
    [Name] [varchar](50) NULL,  
	[Password] [varchar](8) NOT NULL,
	[RoleId] [int] NOT NULL,  
	[ChangeUser] [varchar](50) NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY   
(  
    [UserId] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY]  
  
GO  
  
SET ANSI_PADDING OFF  
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])  
    REFERENCES [dbo].[Roles] ([RoleId])  
    GO  
      
    ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]  
    GO  
