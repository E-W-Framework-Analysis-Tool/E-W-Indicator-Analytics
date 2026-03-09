CREATE PROCEDURE [etl].[Upsert_DimK12Schools]
AS
BEGIN
	SET NOCOUNT ON;
	
	WITH [Source] AS (
		SELECT
			[dks].*
		  , [ds].[DimSeaId]
		  , [dl].[DimLeaId]
		FROM
			[staging].[DimK12Schools]           AS [dks]
				LEFT JOIN [reporting].[DimSeas] AS [ds]
							  ON [dks].[SeaOrganizationIdentifierSea] = [ds].[SeaOrganizationIdentifierSea]
				LEFT JOIN [reporting].[DimLeas] AS [dl]
							  ON [dks].[LeaIdentifierSea] = [dl].[LeaIdentifierSea]
		WHERE
			  [ds].[DimSeaId] IS NOT NULL
		  AND [dl].[DimLeaId] IS NOT NULL
		)
		MERGE [reporting].[DimK12Schools] AS [Target]
	USING [Source]
	ON (
		[target].[SeaId] = [source].[DimSeaId]
			AND [target].[LeaId] = [source].[DimLeaId]
			AND [Target].[SchoolIdentifierSea] = [Source].[SchoolIdentifierSea]
		)
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[NameOfInstitution]     = [Source].[NameOfInstitution]
		  , [Target].[SchoolTypeCode]        = [Source].[SchoolTypeCode]
		  , [Target].[SchoolTypeDescription] = [Source].[SchoolTypeDescription]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SeaId]
				, [LeaId]
				, [SchoolIdentifierSea]
				, [NameOfInstitution]
				, [SchoolTypeCode]
				, [SchoolTypeDescription]
			)
		VALUES
			(
				  [source].[DimSeaId]
				, [source].[DimLeaId]
				, [Source].[SchoolIdentifierSea]
				, [Source].[NameOfInstitution]
				, [Source].[SchoolTypeCode]
				, [Source].[SchoolTypeDescription]
			);
	
	PRINT 'Upsert for [reporting].[DimK12Schools] completed.';
END
GO
