CREATE VIEW [bi].[vw_DimStudents] AS
SELECT
	[DimK12StudentId]
  , MAX([fkse].[K12DemographicId]) AS [K12DemographicId]
  , MAX([fkse].[RaceId])           AS [RaceId]
FROM
	[reporting].[DimStudents]                             AS [ds]
		LEFT JOIN [reporting].[FactK12StudentEnrollments] AS [fkse]
					  ON [ds].[DimK12StudentId] = [fkse].[K12StudentId]
GROUP BY
	[DimK12StudentId];
