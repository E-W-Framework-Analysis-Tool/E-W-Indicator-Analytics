CREATE TABLE [reporting].[DimPsAcademicAwardTitles]
(
	[DimPsAcademicAwardTitleId] [int] IDENTITY (1,1),
	[AcademicAwardTitle]        [nvarchar](160) NOT NULL,
	CONSTRAINT [PK_DimPsAcademicAwardTitleId] PRIMARY KEY ([DimPsAcademicAwardTitleId]),
	INDEX [NCIX_DimPsAcademicAwardTitles_AcademicAwardTitle] NONCLUSTERED ([AcademicAwardTitle])
)