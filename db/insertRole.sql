SELECT TOP (1000) [RoleId]
      ,[RoleName]
      ,[ChangeUser]
      ,[ChangeDate]
      ,[CreateUser]
      ,[CreateDate]
  FROM [QuizDB].[dbo].[Roles]

  BEGIN TRANSACTION
  
  SET IDENTITY_INSERT [QuizDB].[dbo].[Roles] ON
  GO

  INSERT INTO [QuizDB].[dbo].[Roles]
  ([RoleId]
	  ,[RoleName]
      ,[ChangeUser]
      ,[ChangeDate]
      ,[CreateUser]
      ,[CreateDate])
  VALUES
  (1,'Admin',CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP),
  (2,'Default_User',CURRENT_USER,CURRENT_TIMESTAMP,CURRENT_USER,CURRENT_TIMESTAMP);

  SET IDENTITY_INSERT [QuizDB].[dbo].[Roles] OFF
  GO

  ROLLBACK TRANSACTION

