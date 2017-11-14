CREATE TABLE [prod].[DimMachine]
(
	[Id] int NOT NULL PRIMARY KEY IDENTITY,
	[Code] VARCHAR(10) NOT NULL,
    [Name] VARCHAR(50) NOT NULL, 
	[Condition] VARCHAR(10) NOT NULL, 
	[CurrentRow] bit NOT NULL,
	[ValidTo] DATETIME2 NULL,
    [LastModified] DATETIME2 NOT NULL
)
