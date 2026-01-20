CREATE TABLE [reporting].[DimRaces](
	[DimRaceId] [int] IDENTITY(1,1) PRIMARY KEY,
	[RaceCode] [nvarchar](50) NOT NULL,
	[RaceDescription] [nvarchar](200) NULL,
	[RaceEdFactsCode] [nvarchar](100) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimRaces_RaceCode
ON [reporting].[DimRaces] ([RaceCode]);
