CREATE PROCEDURE [etl].[Upsert_DimSEAs]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimSEAs] AS [Target]
	USING [staging].[DimSEAs] AS [Source]
	ON ([Target].[SeaOrganizationIdentifierSea] = [Source].[SeaOrganizationIdentifierSea])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[SeaOrganizationName]   = [Source].[SeaOrganizationName]
		  , [Target].[StateAnsiCode]         = [Source].[StateAnsiCode]
		  , [Target].[StateAbbreviationCode] = [Source].[StateAbbreviationCode]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [SeaOrganizationIdentifierSea]
				, [SeaOrganizationName]
				, [StateAnsiCode]
				, [StateAbbreviationCode]
			)
		VALUES
			(
				  [Source].[SeaOrganizationIdentifierSea]
				, [Source].[SeaOrganizationName]
				, [Source].[StateAnsiCode]
				, [Source].[StateAbbreviationCode]
			);
	
	PRINT 'Upsert for [reporting].[DimSEAs] completed.';
END
GO
