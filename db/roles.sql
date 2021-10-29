USE [QuizDB]  
GO  
  
/* table Users */ 
SET ANSI_NULLS ON  
GO  
  
SET QUOTED_IDENTIFIER ON  
GO  
  
SET ANSI_PADDING ON  
GO  
  
CREATE TABLE [dbo].[Roles](  
    [RoleId] [int] IDENTITY(1,1) NOT NULL,  
    [RoleName] [varchar](50) NULL,  
    [ChangeUser] [varchar](50) NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED   
(  
    [RoleId] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY]  
  
GO  
  
SET ANSI_PADDING OFF  
GO

