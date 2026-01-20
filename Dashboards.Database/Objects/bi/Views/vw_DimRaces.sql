CREATE VIEW [bi].[vw_DimRaces] AS
SELECT
	[DimRaceId]
  , [RaceDescription] AS [RaceEthnicity]
FROM [reporting].[DimRaces];