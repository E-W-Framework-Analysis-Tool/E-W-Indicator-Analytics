CREATE VIEW [bi].[vw_DimK12Demographics] AS
SELECT
	[Dimk12DemographicId]
  , [SexDescription] AS [Gender]
FROM [reporting].[DimK12Demographics]
WHERE DimK12DemographicId != -1;