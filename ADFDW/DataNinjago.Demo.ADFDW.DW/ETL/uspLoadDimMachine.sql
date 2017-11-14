CREATE PROC [stg].[uspLoadDimMachine] AS
BEGIN

	INSERT INTO [prod].[DimMachine]
		([Code]
		,[Name]
		,[Condition]
		,[CurrentRow]
		,[ValidTo]
		,[LastModified]
		)
	SELECT
		 M.[Code]
		,M.[Name]
		,M.[Condition]
		,1
		,'9999-12-31'
		, GETDATE()
	FROM (
		MERGE [prod].[DimMachine] AS [Target]
			USING [stg].[Machine] AS [Source] ON Target.Code = Source.Code
		WHEN MATCHED AND Target.[Condition] <> Source.[Condition]
			 THEN UPDATE SET
				[CurrentRow] = 0
			   ,[LastModified] = GETDATE()
			   ,[ValidTo] = GETDATE()
		WHEN NOT MATCHED BY TARGET
			 THEN INSERT (
				 [Code]
				,[Name]
				,[Condition]
				,[CurrentRow]
				,[ValidTo]
				,[LastModified]
			   ) VALUES (
				 Source.Code
				,Source.Name
				,Source.Condition
				,1
				,'9999-12-31'
				,GETDATE()
			   )
		 OUTPUT $action AS Action, [Source].*
		) AS M
		WHERE M.Action = 'UPDATE' AND M.[Code]  IS NOT NULL;

END
