CREATE PROCEDURE [etl].[Upsert_DimStudents]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimStudents] AS [Target]
	USING [staging].[DimStudents] AS [Source]
	ON ([Target].[StudentIdentifierState] = [Source].[StudentIdentifierState])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[StudentIdentifierState] = [Source].[StudentIdentifierState]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				[StudentIdentifierState]
			)
		VALUES
			(
				[Source].[StudentIdentifierState]
			);
	
	PRINT 'Upsert for [reporting].[DimStudents] completed.';
END
GO
