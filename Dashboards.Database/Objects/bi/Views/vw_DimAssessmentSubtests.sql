CREATE VIEW [bi].[vw_DimAssessmentSubtests] AS
SELECT
	[DimAssessmentSubtestId]
  , [AssessmentSubtestTitle]
  , [AssessmentAcademicSubjectCode]        AS [AssessmentSubtestCode]
  , [AssessmentAcademicSubjectDescription] AS [AcademicSubject]
FROM [reporting].[DimAssessmentSubtests];