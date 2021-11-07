USE [QuizDB]
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Was ist e-Contracting?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Komplette elektronische Abbildung des Vertragsprozesses'
  ,@WrongChoice1 = 'Das Sammeln der unterschriebenen, für den Vertrag notwendingen, Dokumente.'
  ,@WrongChoice2 = 'Das Abwickeln des Zahlungsprozess im shop.'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Was sind relevante Dokumente in der Vetragshandlung?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Protokolle'
  ,@WrongChoice1 = 'Einkommensbescheinigungen'
  ,@WrongChoice2 = 'Versicherungsbelege'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Ist ein physischer und persönlicher Kontakt nötig?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Nein'
  ,@WrongChoice1 = 'Ja'
  ,@WrongChoice2 = 'Nur eines'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Wenn der Vertragsprozess abgeschlossen ist dann ...?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Sind Parteien rechtsgültig an den Vertrag gebunden'
  ,@WrongChoice1 = 'Die Parteien sind an denn Vertrag gebunden'
  ,@WrongChoice2 = 'Sind Parteien rechtsgültig and denn Prozess gebunden'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Was für Merkmale weisst der papierbasierte Vertrag auf?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Rechte und Pflichten der Vertragsparteien'
  ,@WrongChoice1 = 'Von denn Vertragsparteien ihre Vorderungen'
  ,@WrongChoice2 = 'Ansicht der Rechte und Pflichten während des Prozess'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Was unterscheidet denn elektronischen Vertrag zum papierbasierten?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Kann diese während der Laufzeit überwachen'
  ,@WrongChoice1 = 'Kann die Rechte und Pflichten in einem PDF anzeigen'
  ,@WrongChoice2 = 'Kann Live während der Verhandlung angepasst werden'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'E-Verträge sind rechtsverbindlich zu?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Käufer und Verkäufer'
  ,@WrongChoice1 = 'Käufer und Firma'
  ,@WrongChoice2 = 'Verkäufer und Firma'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Wie heissen die zwei Phasen des E-Contracting?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Vertragserstellung und Vertragserfüllung'
  ,@WrongChoice1 = 'Vertragsbearbeitung und Vertragserstellung'
  ,@WrongChoice2 = 'Vertragsbearbeitung und Vertragserfüllung'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Wie heisst die Gesetzliche Regelungen?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'E-Commerce-Verordnung'
  ,@WrongChoice1 = 'E-Confidental-Verordnung'
  ,@WrongChoice2 = 'E-Contracting-Verordnung'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Der erste Zweck und nutzen eines E-Vertrags?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Eine Garantie gemäss Klauseln'
  ,@WrongChoice1 = 'Eine Garantie auf die Gesetze'
  ,@WrongChoice2 = 'Eine Garantie auf die gesetzten Regeln'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Der zweite Zweck und nutzen eines E-Vertrags?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Man baut eine Geschäftsbeziehung auf'
  ,@WrongChoice1 = 'Man baut Vertrauen auf'
  ,@WrongChoice2 = 'Man baut Vertrauen und eine Beziehung auf'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Wie viele kritische Aspekte gibt es bei einem E-Vertrag?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Drei'
  ,@WrongChoice1 = 'Zweit'
  ,@WrongChoice2 = 'Vier'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Erster Aspekt eines E-Vertrags?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Thema wird definiert'
  ,@WrongChoice1 = 'Leute werden eingeladen'
  ,@WrongChoice2 = 'Termin wird vereinbart'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Zweiter Aspekt eines E-Vertrags?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Rechtsgültigkeit formuliert'
  ,@WrongChoice1 = 'Unterschriften werden gesammelt'
  ,@WrongChoice2 = 'Parteien werden ausgewählt'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Dritter Aspekt eines E-Vertrags?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Preis und Bedingungen werden definiert'
  ,@WrongChoice1 = 'Dienstleistungen werden definiert'
  ,@WrongChoice2 = 'Qualität der Leistungen'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Was passiert beim E-Contracting?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Elektronischer Verhandlungsprozess'
  ,@WrongChoice1 = 'Elektronischer Verkaufsprozess'
  ,@WrongChoice2 = 'Elektronischer Vertragsbehandlung'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Können E-Verträge Offline oder Online sein?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Beides'
  ,@WrongChoice1 = 'Online'
  ,@WrongChoice2 = 'Offline'
GO

DECLARE @RC int
DECLARE @Question nvarchar(max)
DECLARE @Quiz nvarchar(80)
DECLARE @RightChoice nvarchar(max)
DECLARE @WrongChoice1 nvarchar(max)
DECLARE @WrongChoice2 nvarchar(max)

EXECUTE @RC = [dbo].[AddQuestion] 
   @Question = 'Kann die erstellung von E-Verträgen synchron oder asynchron erfolgen?'
  ,@Quiz = 'e-Contracting'
  ,@RightChoice = 'Beides'
  ,@WrongChoice1 = 'Asynchron'
  ,@WrongChoice2 = 'Synchron'
GO