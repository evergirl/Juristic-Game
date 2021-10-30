USE [QuizDB]	
GO

SET ANSI_NULLS ON  
GO  
      
SET QUOTED_IDENTIFIER ON  
GO  



CREATE OR ALTER PROCEDURE [dbo].[AddUser]
	--@UserId int,
	@Name nvarchar(50),
	@Password nvarchar(8),
	@Role nvarchar(20)
AS BEGIN
	DECLARE @DEFAULT_ROLEID int, @RoleId int

	SET @DEFAULT_ROLEID = 2

	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	BEGIN TRY
		-- Get role id from table Roles
		SELECT @RoleId = RoleId
		FROM [dbo].[Roles]
		WHERE RoleName = @Role;
		IF @@ROWCOUNT=0 RAISERROR(N'AddUser: User <%d> does not have an existing role <%d>',@Name,@Role);

		BEGIN
			-- insert user
			INSERT INTO Users([Name],[Password],[RoleId],[ChangeUser],[ChangeDate],[CreateUser],[CreateDate])
			VALUES (@Name,@Password,@RoleId, CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP)
			SELECT @RoleId = @@IDENTITY

			COMMIT TRANSACTION AddUser;
		END
	END TRY

	BEGIN CATCH
		-- error occured
		ROLLBACK TRANSACTION AddUser;
	END CATCH
END

GO
