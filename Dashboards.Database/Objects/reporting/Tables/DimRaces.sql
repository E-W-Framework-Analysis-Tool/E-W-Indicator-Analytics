CREATE TABLE [reporting].[DimRaces]
(
	[DimRaceId]       [int] IDENTITY (1,1),
	[RaceCode]        [nvarchar](50)  NOT NULL,
	[RaceDescription] [nvarchar](200) NULL,
	[RaceEdFactsCode] [nvarchar](100) NULL,
	CONSTRAINT [PK_DimRaceId] PRIMARY KEY ([DimRaceId]),
	INDEX [NCIX_DimRaces_RaceCode] NONCLUSTERED ([RaceCode])
)
GO
--------------------------------------------------------------------------------------