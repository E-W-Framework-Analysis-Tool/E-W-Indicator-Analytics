CREATE PROCEDURE [etl].[Upsert_DimPsAcademicAwardTitles]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimPsAcademicAwardTitles] AS [Target]
	USING [staging].[DimPsAcademicAwardTitles] AS [Source]
	ON ([Target].[DimPsAcademicAwardTitleId] = [Source].[DimPsAcademicAwardTitleId])
	WHEN NOT MATCHED BY TARGET THEN
		INSERT ( [AcademicAwardTitle] )
		VALUES ( [Source].[AcademicAwardTitle] );
	
	PRINT 'Upsert for [reporting].[Upsert_DimPsAcademicAwardTitles] completed.';
END
GO