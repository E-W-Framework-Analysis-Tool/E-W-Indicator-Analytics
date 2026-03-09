CREATE TABLE [staging].[DimAssessments]
(
	[DimAssessmentId]                      [int]           NOT NULL,
	[AssessmentIdentifierState]            [nvarchar](40)  NULL,
	[AssessmentTypeCode]                   [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectCode]        [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](300) NOT NULL
)
GO
--------------------------------------------------------------------------------------