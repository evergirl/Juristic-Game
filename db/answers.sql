    USE [QuizDB]  
    GO  
      
    /* table Answers*/  
    SET ANSI_NULLS ON  
    GO  
      
    SET QUOTED_IDENTIFIER ON  
    GO  
      
    SET ANSI_PADDING ON  
    GO  
      
    CREATE TABLE [dbo].[Answers](  
        [AnswerId] [int] IDENTITY(1,1) NOT NULL,  
        [ChoiceId] [int] NULL,  
        [QuestionId] [int] NULL,  
		[ChangeUser] [varchar](50) NOT NULL,
		[ChangeDate] [datetime] NOT NULL,
		[CreateUser] [varchar](50) NOT NULL,
		[CreateDate] [datetime] NOT NULL,
     CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED   
    (  
        [AnswerId] ASC  
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
    ) ON [PRIMARY] 
      
    GO  
      
    SET ANSI_PADDING OFF  
    GO  
      
    ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])  
    REFERENCES [dbo].[Questions] ([QuestionId])  
    GO  
      
    ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]  
    GO  

	ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Choices] FOREIGN KEY([ChoiceId])  
    REFERENCES [dbo].[Choices] ([ChoiceId])  
    GO  

    ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Choices]  
    GO  
