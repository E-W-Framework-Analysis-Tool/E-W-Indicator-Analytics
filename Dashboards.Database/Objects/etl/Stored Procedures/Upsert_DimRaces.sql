CREATE PROCEDURE [etl].[Upsert_DimRaces]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimRaces] AS [Target]
	USING [staging].[DimRaces] AS [Source]
	ON ([Target].[RaceCode] = [Source].[RaceCode])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[RaceDescription] = [Source].[RaceDescription]
		  , [Target].[RaceEdFactsCode] = [Source].[RaceEdFactsCode]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [RaceCode]
				, [RaceDescription]
				, [RaceEdFactsCode]
			)
		VALUES
			(
				  [Source].[RaceCode]
				, [Source].[RaceDescription]
				, [Source].[RaceEdFactsCode]
			);
	
	PRINT 'Upsert for [reporting].[DimRaces] completed.';
END
GO
