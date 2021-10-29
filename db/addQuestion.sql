USE [QuizDB]	
GO

SET ANSI_NULLS ON  
GO  
      
SET QUOTED_IDENTIFIER ON  
GO  



CREATE OR ALTER PROCEDURE [dbo].[AddQuestion]
	@Question nvarchar(max),
	@Quiz nvarchar(80),
	@RightChoice nvarchar(max),
	@WrongChoice1 nvarchar(max),
	@WrongChoice2 nvarchar(max)
AS BEGIN
	DECLARE @QuizId int, @QuestionId int, @RightChoiceId int

	SET NOCOUNT ON;

	BEGIN TRANSACTION AddQuestion;

	BEGIN TRY
		-- Get quiz id from table Quiz
		SELECT @QuizId = QuizId
		FROM [dbo].[Quiz]
		WHERE [QuizName] = @Quiz;
		IF @@ROWCOUNT=0 RAISERROR(N'AddQuestion: Question <%d> does not belong to an existing quiz <%d>',@Question,@Quiz);

		BEGIN
			-- insert question
			INSERT INTO Questions([QuestionTextKey],[QuizId],[ChangeUser],[ChangeDate],[CreateUser],[CreateDate])
			VALUES (@Question,@QuizId, CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP)
			SELECT @QuestionId = @@IDENTITY
		END

		BEGIN 
			-- insert choices, fk question
			INSERT INTO Choices([ChoiceTextKey],[QuestionId],[ChangeUser],[ChangeDate],[CreateUser],[CreateDate])
			VALUES (@RightChoice,@QuestionId, CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP)
			SELECT @RightChoiceId = @@IDENTITY

			INSERT INTO Choices([ChoiceTextKey],[QuestionId],[ChangeUser],[ChangeDate],[CreateUser],[CreateDate])
			VALUES (@WrongChoice1,@QuestionId, CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP),
			(@WrongChoice2,@QuestionId, CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP)
		END

		BEGIN 
			-- insert right answer, fk question & choice
			INSERT INTO Answers([ChoiceId],[QuestionId],[ChangeUser],[ChangeDate],[CreateUser],[CreateDate])
			VALUES (@RightChoiceId,@QuestionId, CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP)
		END

		COMMIT TRANSACTION AddQuestion;
	END TRY

	BEGIN CATCH
		-- error occured
		ROLLBACK TRANSACTION AddQuestion;
	END CATCH
END

GO
