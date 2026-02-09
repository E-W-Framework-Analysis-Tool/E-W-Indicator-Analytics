CREATE TABLE [staging].[DimRaces]
	(
		[DimRaceId]       [int]           NOT NULL,
		[RaceCode]        [nvarchar](50)  NOT NULL,
		[RaceDescription] [nvarchar](200) NULL,
		[RaceEdFactsCode] [nvarchar](100) NULL
	)
GO
--------------------------------------------------------------------------------------
