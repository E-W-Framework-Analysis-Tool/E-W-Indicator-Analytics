CREATE TABLE [reporting].[DimAssessments](
	[DimAssessmentId] [int] IDENTITY(1,1) PRIMARY KEY,
	[AssessmentIdentifierState] [nvarchar](40) NULL,
	[AssessmentTypeCode] [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectCode] [nvarchar](100) NOT NULL,
	[AssessmentAcademicSubjectDescription] [nvarchar](300) NOT NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimAssessments_AssessmentIdentifierState
ON [reporting].[DimAssessments] ([AssessmentIdentifierState]);
