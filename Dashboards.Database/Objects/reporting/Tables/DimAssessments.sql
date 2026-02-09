CREATE TABLE [reporting].[DimAssessments]
(
	[DimAssessmentId]                      [int] IDENTITY (1,1),
	[AssessmentIdentifierState]            [nvarchar](40)  NULL,
	[AssessmentTypeCode]                   [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectCode]        [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](300) NOT NULL,
	CONSTRAINT [PK_DimAssessments_DimAssessmentId] PRIMARY KEY ([DimAssessmentId]),
	INDEX [FK_DimAssessments_AssessmentIdentifierState] NONCLUSTERED ([AssessmentIdentifierState])
)
GO
--------------------------------------------------------------------------------------
