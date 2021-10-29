USE [QuizDB]
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Was ist e-Contracting?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Komplette elektronische Abbildung des Vertragsprozesses'
  ,@WrongChoice1 = 'Das Sammeln der unterschriebenen, für den Vertrag notwendingen, Dokumente.'
  ,@WrongChoice2 = 'Das Abwickeln des Zahlungsprozess im shop.'
GO


