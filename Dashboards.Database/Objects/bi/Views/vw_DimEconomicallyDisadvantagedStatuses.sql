CREATE VIEW [bi].[vw_DimEconomicallyDisadvantagedStatuses] AS
SELECT
	[DimEconomicallyDisadvantagedStatusId]
  , [EconomicDisadvantageStatusCode] AS [EconomicDisadvantageStatus]
FROM [reporting].[DimEconomicallyDisadvantagedStatuses];