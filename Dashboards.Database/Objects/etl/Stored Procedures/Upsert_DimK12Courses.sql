CREATE PROCEDURE [etl].[Upsert_DimK12Courses]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimK12Courses] AS [Target]
	USING [staging].[DimK12Courses] AS [Source]
	ON ([Target].[CourseIdentifier] = [Source].[CourseIdentifier])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[CourseTitle]= [Source].[CourseTitle]
		  , [Target].[CourseDescription]= [Source].[CourseDescription]
		  , [Target].[CourseDepartmentName]= [Source].[CourseDepartmentName]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [CourseIdentifier]
				, [CourseTitle]
				, [CourseDescription]
				, [CourseDepartmentName]
			)
		VALUES
			(
				  [Source].[CourseIdentifier]
				, [Source].[CourseTitle]
				, [Source].[CourseDescription]
				, [Source].[CourseDepartmentName]
			);
	
	PRINT 'Upsert for [reporting].[DimK12Courses] completed.';
END
GO
