CREATE PROCEDURE [etl].[Upsert_PS_DimStudents]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[PS_DimStudents] AS [Target]
	USING [staging].[PS_DimStudents] AS [Source]
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
	
	PRINT 'Upsert for [reporting].[PS_DimStudents] completed.';
END
GO
