CREATE VIEW [bi].[vw_DimHomelessnessStatuses] AS
SELECT
	[DimHomelessnessStatusId]
  , [HomelessnessStatusCode] AS [HomelessnessStatus]
FROM [reporting].[DimHomelessnessStatuses];