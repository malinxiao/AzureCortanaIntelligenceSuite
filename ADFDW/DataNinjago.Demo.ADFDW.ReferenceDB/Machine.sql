CREATE TABLE [dbo].[Machine]
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY,
	[Code] VARCHAR(10) NOT NULL,
    [Name] VARCHAR(50) NOT NULL, 
    [Condition] VARCHAR(10) NOT NULL, 
    [LastModified] DATETIME2 NOT NULL
)
