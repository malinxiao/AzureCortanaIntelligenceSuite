CREATE PROC [stg].[uspLoadFactMachineCycle] AS
BEGIN
   
   INSERT INTO [prod].[FactMachineCycle]
	   SELECT S.[CycleId]
		  ,CASE 
				WHEN DM.Id IS NULL THEN 0
				ELSE DM.Id
		   END AS MachineId
		  ,CASE 
				WHEN DC.Id IS NULL THEN 0
				ELSE DC.Id
		   END as CustomerId
		  ,Year(S.[StartDateTime])*10000+Month(S.[StartDateTime])*100+Day(S.[StartDateTime]) AS DateKey
		  ,DATEDIFF(s, S.[StartDateTime], S.[EndDateTime]) AS Duration
		  ,GETDATE() AS RowAdded
	  FROM [stg].[MachineCycle] S
	  LEFT JOIN [prod].[FactMachineCycle] F ON S.CycleId = F.CycleId
	  LEFT JOIN [prod].[DimCustomer] DC ON S.CustomerName = DC.Code AND DC.CurrentRow=1 
	  LEFT JOIN [prod].[DimMachine] DM ON S.MachineName = DM.Code AND DM.CurrentRow=1
	  WHERE F.CycleId IS NULL

END