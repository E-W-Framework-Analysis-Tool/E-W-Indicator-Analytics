CREATE VIEW [bi].[vw_DimAssessments] AS
SELECT
DimAssessmentId as Id
, AssessmentTypeCode as [Code]
, AssessmentAcademicSubjectDescription as [AcademicSubject]
FROM [reporting].[DimAssessments];