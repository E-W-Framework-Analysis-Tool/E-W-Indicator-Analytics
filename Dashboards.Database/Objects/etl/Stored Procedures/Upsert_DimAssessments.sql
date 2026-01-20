CREATE PROCEDURE [etl].[Upsert_DimAssessments]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimAssessments] AS [Target]
	USING [staging].[DimAssessments] AS [Source]
	ON ([Target].[AssessmentIdentifierState] = [Source].[AssessmentIdentifierState])
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[AssessmentTypeCode]= [Source].[AssessmentTypeCode]
		  , [Target].[AssessmentAcademicSubjectCode]= [Source].[AssessmentAcademicSubjectCode]
		  , [Target].[AssessmentAcademicSubjectDescription]= [Source].[AssessmentAcademicSubjectDescription]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [AssessmentIdentifierState]
				, [AssessmentTypeCode]
				, [AssessmentAcademicSubjectCode]
				, [AssessmentAcademicSubjectDescription]
			)
		VALUES
			(
				  [Source].[AssessmentIdentifierState]
				, [Source].[AssessmentTypeCode]
				, [Source].[AssessmentAcademicSubjectCode]
				, [Source].[AssessmentAcademicSubjectDescription]
			);
	
	PRINT 'Upsert for [reporting].[DimAssessments] completed.';
END
GO
