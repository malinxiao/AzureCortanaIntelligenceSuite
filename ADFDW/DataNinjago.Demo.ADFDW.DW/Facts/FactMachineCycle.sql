CREATE TABLE [prod].[FactMachineCycle]
(
	[CycleId] int NOT NULL PRIMARY KEY,
	[MachineId] int NOT NULL,
	[CustomerId] int NOT NULL,
	[DateKey] int NOT NULL,
	[Duration] float NOT NULL,
    [RowAdded] DATETIME2 NOT NULL
)
