    USE [QuizDB]  
    GO  
      
   /* table Questions */
    SET ANSI_NULLS ON  
    GO  
      
    SET QUOTED_IDENTIFIER ON  
    GO  
      
    SET ANSI_PADDING ON  
    GO  
      
    CREATE TABLE [dbo].[Learning](  
        [LearningId] [int] IDENTITY(1,1) NOT NULL,
		[Subtitle] [varchar](50) NULL,
        [TextKey] [varchar](max) NULL,  
        [QuizId] [int] NULL,  
		[ChangeUser] [varchar](50) NOT NULL,
		[ChangeDate] [datetime] NOT NULL,
		[CreateUser] [varchar](50) NOT NULL,
		[CreateDate] [datetime] NOT NULL,
     CONSTRAINT [PK_Learning] PRIMARY KEY CLUSTERED   
    (  
        [LearningId] ASC  
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
    ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]  
      
    GO  
      
    SET ANSI_PADDING OFF  
    GO  
      
    ALTER TABLE [dbo].[Learning]  WITH CHECK ADD  CONSTRAINT [FK_Learning_Quiz] FOREIGN KEY([QuizId])  
    REFERENCES [dbo].[Quiz] ([QuizId])  
    GO  
      
    ALTER TABLE [dbo].[Learning] CHECK CONSTRAINT [FK_Learning_Quiz]  
    GO  