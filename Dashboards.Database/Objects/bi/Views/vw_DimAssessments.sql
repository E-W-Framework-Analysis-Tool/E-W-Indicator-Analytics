CREATE VIEW [bi].[vw_DimAssessments] AS
SELECT
	[DimAssessmentId]
  , [AssessmentTypeCode]                   AS [AssessmentCode]
  , [AssessmentAcademicSubjectDescription] AS [AcademicSubject]
FROM [reporting].[DimAssessments];