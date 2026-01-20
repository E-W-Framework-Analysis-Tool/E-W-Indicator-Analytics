CREATE TABLE [reporting].[DimAssessmentSubtests](
	[DimAssessmentSubtestId] [int] IDENTITY(1,1) PRIMARY KEY,
	[AssessmentAcademicSubjectCode] [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](400) NULL,
	[AssessmentSubtestIdentifierInternal] [nvarchar](40) NOT NULL,
	[AssessmentSubtestTitle] [nvarchar](40) NOT NULL,
	[AssessmentSubtestAbbreviation] [nvarchar](40) NOT NULL,
	[AssessmentSubtestDescription] [nvarchar](40) NULL,
	[AssessmentSubtestMinimumValue] [nvarchar](40) NULL,
	[AssessmentSubtestMaximumValue] [nvarchar](40) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimAssessmentSubtests_AssessmentSubtestIdentifierInternal
ON [reporting].[DimAssessmentSubtests] ([AssessmentSubtestIdentifierInternal]);
