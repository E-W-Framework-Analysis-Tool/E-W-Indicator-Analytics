CREATE TABLE [reporting].[DimAssessmentSubtests]
(
	[DimAssessmentSubtestId]               [int] IDENTITY (1,1),
	[AssessmentAcademicSubjectCode]        [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](400) NULL,
	[AssessmentSubtestIdentifierInternal]  [nvarchar](40)  NOT NULL,
	[AssessmentSubtestTitle]               [nvarchar](40)  NOT NULL,
	[AssessmentSubtestAbbreviation]        [nvarchar](40)  NOT NULL,
	[AssessmentSubtestDescription]         [nvarchar](40)  NULL,
	[AssessmentSubtestMinimumValue]        [nvarchar](40)  NULL,
	[AssessmentSubtestMaximumValue]        [nvarchar](40)  NULL,
	CONSTRAINT [PK_DimAssessmentSubtestId] PRIMARY KEY ([DimAssessmentSubtestId]),
	INDEX [NCIX_DimAssessmentSubtests_AssessmentSubtestIdentifierInternal] NONCLUSTERED ([AssessmentSubtestIdentifierInternal])
)
GO
--------------------------------------------------------------------------------------
