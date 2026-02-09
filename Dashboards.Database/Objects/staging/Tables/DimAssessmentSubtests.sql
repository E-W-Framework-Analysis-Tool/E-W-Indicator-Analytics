CREATE TABLE [staging].[DimAssessmentSubtests]
(
	[DimAssessmentSubtestId]               [int]           NOT NULL,
	[AssessmentAcademicSubjectCode]        [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](400) NULL,
	[AssessmentSubtestIdentifierInternal]  [nvarchar](40)  NOT NULL,
	[AssessmentSubtestTitle]               [nvarchar](40)  NOT NULL,
	[AssessmentSubtestAbbreviation]        [nvarchar](40)  NOT NULL,
	[AssessmentSubtestDescription]         [nvarchar](40)  NULL,
	[AssessmentSubtestMinimumValue]        [nvarchar](40)  NULL,
	[AssessmentSubtestMaximumValue]        [nvarchar](40)  NULL
)
GO
--------------------------------------------------------------------------------------