CREATE TABLE [reporting].[DimEnglishLearnerStatuses]
(
	[DimEnglishLearnerStatusId]       [int] IDENTITY (1,1),
	[EnglishLearnerStatusCode]        [nvarchar](100) NOT NULL,
	[EnglishLearnerStatusDescription] [nvarchar](300) NULL,
	CONSTRAINT [PK_DimEnglishLearnerStatusId] PRIMARY KEY ([DimEnglishLearnerStatusId]),
	INDEX [NCIX_DimEnglishLearnerStatuses_EnglishLearnerStatusCode] NONCLUSTERED ([EnglishLearnerStatusCode])
)
GO
--------------------------------------------------------------------------------------
