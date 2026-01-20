CREATE PROCEDURE [etl].[Upsert_DimK12CourseStatuses]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimK12CourseStatuses] AS [Target]
	USING [staging].[DimK12CourseStatuses] AS [Source]
	ON ([Target].[CourseLevelCharacteristicCode] = [Source].[CourseLevelCharacteristicCode])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[CourseLevelCharacteristicDescription] = [Source].[CourseLevelCharacteristicDescription]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [CourseLevelCharacteristicCode]
				, [CourseLevelCharacteristicDescription]
			)
		VALUES
			(
				  [Source].[CourseLevelCharacteristicCode]
				, [Source].[CourseLevelCharacteristicDescription]
			);
	
	PRINT 'Upsert for [reporting].[DimK12CourseStatuses] completed.';
END
GO
