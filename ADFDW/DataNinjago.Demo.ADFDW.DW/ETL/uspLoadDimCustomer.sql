CREATE PROC [stg].[uspLoadDimCustomer] AS
BEGIN

	INSERT INTO [prod].[DimCustomer]
		([Code]
		,[Name]
		,[CurrentRow]
		,[ValidTo]
		,[LastModified]
		)
	SELECT
		 M.[Code]
		,M.[Name]
		,1
		,'9999-12-31'
		, GETDATE()
	FROM (
		MERGE [prod].[DimCustomer] AS [Target]
			USING [stg].[Customer] AS [Source] ON Target.Code = Source.Code
		WHEN MATCHED AND Target.[Name] <> Source.[Name]
			 THEN UPDATE SET
				[CurrentRow] = 0
			   ,[LastModified] = GETDATE()
			   ,[ValidTo] = GETDATE()
		WHEN NOT MATCHED BY TARGET
			 THEN INSERT (
				 [Code]
				,[Name]
				,[CurrentRow]
				,[ValidTo]
				,[LastModified]
			   ) VALUES (
				 Source.Code
				,Source.Name
				,1
				,'9999-12-31'
				,GETDATE()
			   )
		 OUTPUT $action AS Action, [Source].*
		) AS M
		WHERE M.Action = 'UPDATE' AND M.[Code]  IS NOT NULL;

END