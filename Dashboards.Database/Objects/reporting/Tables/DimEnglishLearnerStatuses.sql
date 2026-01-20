CREATE TABLE [reporting].[DimEnglishLearnerStatuses](
	[DimEnglishLearnerStatusId] [int] IDENTITY(1,1) PRIMARY KEY,
	[EnglishLearnerStatusCode] [nvarchar](100) NOT NULL,
	[EnglishLearnerStatusDescription] [nvarchar](300) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimEnglishLearnerStatuses_EnglishLearnerStatusCode
ON [reporting].[DimEnglishLearnerStatuses] ([EnglishLearnerStatusCode]);
