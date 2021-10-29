    USE [QuizDB]  
    GO  
      
   /* table Questions */
    SET ANSI_NULLS ON  
    GO  
      
    SET QUOTED_IDENTIFIER ON  
    GO  
      
    SET ANSI_PADDING ON  
    GO  
      
    CREATE TABLE [dbo].[Questions](  
        [QuestionId] [int] IDENTITY(1,1) NOT NULL,  
        [QuestionTextKey] [varchar](max) NULL,  
        [QuizId] [int] NULL,  
		[ChangeUser] [varchar](50) NOT NULL,
		[ChangeDate] [datetime] NOT NULL,
		[CreateUser] [varchar](50) NOT NULL,
		[CreateDate] [datetime] NOT NULL,
     CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED   
    (  
        [QuestionId] ASC  
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]  
      
    GO  
      
    SET ANSI_PADDING OFF  
    GO  
      
    ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Quiz] FOREIGN KEY([QuizId])  
    REFERENCES [dbo].[Quiz] ([QuizId])  
    GO  
      
    ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Quiz]  
    GO  