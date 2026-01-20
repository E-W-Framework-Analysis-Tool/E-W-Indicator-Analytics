CREATE VIEW [bi].[vw_DimAssessmentSubtests] AS
SELECT
  DimAssessmentSubtestId as Id
, AssessmentAcademicSubjectCode as [Code]
, AssessmentAcademicSubjectDescription as [AcademicSubject]
FROM [reporting].[DimAssessmentSubtests];