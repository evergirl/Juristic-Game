USE [QuizDB]  
GO  
  
/* table Choices */
SET ANSI_NULLS ON  
GO  
  
SET QUOTED_IDENTIFIER ON  
GO  
  
SET ANSI_PADDING ON  
GO  
  
CREATE TABLE [dbo].[Choices](  
    [ChoiceId] [int] IDENTITY(1,1) NOT NULL,  
    [ChoiceTextKey] [varchar](max) NULL,  
    [QuestionId] [int] NULL,  
	[ChangeUser] [varchar](50) NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CreateUser] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED   
(  
    [ChoiceId] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]  
  
GO  
  
SET ANSI_PADDING OFF  
GO  
  
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [FK_Choices_Questions] FOREIGN KEY([QuestionId])  
REFERENCES [dbo].[Questions] ([QuestionId])  
GO  
  
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [FK_Choices_Questions]  
GO 