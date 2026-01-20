CREATE PROCEDURE [etl].[Upsert_DimAssessmentSubtests]
AS
BEGIN
	SET NOCOUNT ON;
	
	MERGE [reporting].[DimAssessmentSubtests] AS [Target]
	USING [staging].[DimAssessmentSubtests] AS [Source]
	ON (
		[Target].[AssessmentSubtestIdentifierInternal] = [Source].[AssessmentSubtestIdentifierInternal]
			AND [target].[AssessmentAcademicSubjectCode] = [source].[AssessmentAcademicSubjectCode]
		)
	WHEN MATCHED THEN
		UPDATE
		SET
			[Target].[AssessmentAcademicSubjectDescription] = [Source].[AssessmentAcademicSubjectDescription]
		  , [Target].[AssessmentSubtestTitle]               = [Source].[AssessmentSubtestTitle]
		  , [Target].[AssessmentSubtestAbbreviation]        = [Source].[AssessmentSubtestAbbreviation]
		  , [Target].[AssessmentSubtestDescription]         = [Source].[AssessmentSubtestDescription]
		  , [Target].[AssessmentSubtestMinimumValue]        = [Source].[AssessmentSubtestMinimumValue]
		  , [Target].[AssessmentSubtestMaximumValue]        = [Source].[AssessmentSubtestMaximumValue]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(
				  [AssessmentAcademicSubjectCode]
				, [AssessmentAcademicSubjectDescription]
				, [AssessmentSubtestIdentifierInternal]
				, [AssessmentSubtestTitle]
				, [AssessmentSubtestAbbreviation]
				, [AssessmentSubtestDescription]
				, [AssessmentSubtestMinimumValue]
				, [AssessmentSubtestMaximumValue]
			)
		VALUES
			(
				  [Source].[AssessmentAcademicSubjectCode]
				, [Source].[AssessmentAcademicSubjectDescription]
				, [Source].[AssessmentSubtestIdentifierInternal]
				, [Source].[AssessmentSubtestTitle]
				, [Source].[AssessmentSubtestAbbreviation]
				, [Source].[AssessmentSubtestDescription]
				, [Source].[AssessmentSubtestMinimumValue]
				, [Source].[AssessmentSubtestMaximumValue]
			);
	
	PRINT 'Upsert for [reporting].[DimAssessmentSubtests] completed.';
END
GO
