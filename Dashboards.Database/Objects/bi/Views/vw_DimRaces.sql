CREATE VIEW [bi].[vw_DimRaces] AS
SELECT
	[DimRaceId]
  , CASE 
		WHEN [RaceDescription] = 'Demographic Race Two or More Races' THEN 'Two or More Races'
		WHEN [RaceDescription] = 'Hispanic' THEN 'Hispanic or Latino'
	ELSE [RaceDescription] END AS [RaceEthnicity]
FROM [reporting].[DimRaces]
WHERE [DimRaceId] != -1;