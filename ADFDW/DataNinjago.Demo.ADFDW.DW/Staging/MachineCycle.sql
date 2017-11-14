CREATE TABLE [stg].[MachineCycle]
(
	[CycleId] int NOT NULL,
	[MachineName] varchar(50) NOT NULL,
	[CustomerName] varchar(50) NOT NULL,
	[StartDateTime] datetime2 NOT NULL,
	[EndDateTime] datetime2 NOT NULL,
    [LastModified] DATETIME2 NOT NULL
)
