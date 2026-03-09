CREATE PROCEDURE [etl].[Upsert_DimLEAs]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[dl].*
		  , [ds].[DimSeaId]
		FROM
			[staging].[DimLEAs]                 AS [dl]
				LEFT JOIN [reporting].[DimSeas] AS [ds]
							  ON [dl].[SeaOrganizationIdentifierSea] = [ds].[SeaOrganizationIdentifierSea]
		WHERE [ds].[DimSeaId] IS NOT NULL
		)
		MERGE [reporting].[DimLEAs] AS [Target]
	USING [Source]
	ON (
		[target].[SeaId] = [source].[DimSeaId]
			AND [Target].[LeaIdentifierSea] = [Source].[LeaIdentifierSea])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[LeaOrganizationName] = [Source].[LeaOrganizationName]
		  , [Target].[LeaTypeCode]         = [Source].[LeaTypeCode]
		  , [Target].[LeaTypeDescription]  = [Source].[LeaTypeDescription]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SeaId]
				, [LeaIdentifierSea]
				, [LeaOrganizationName]
				, [LeaTypeCode]
				, [LeaTypeDescription]
			)
		VALUES
			(
				  [Source].[DimSeaId]
				, [Source].[LeaIdentifierSea]
				, [Source].[LeaOrganizationName]
				, [Source].[LeaTypeCode]
				, [Source].[LeaTypeDescription]
			);
	
	PRINT 'Upsert for [reporting].[DimLEAs] completed.';
END
GO
