CREATE VIEW [bi].[vw_DimEconomicallyDisadvantagedStatuses] AS
SELECT 
 DimEconomicallyDisadvantagedStatusId as Id
,EconomicDisadvantageStatusCode as  Code
,EconomicDisadvantageStatusDescription as  [Desc]
FROM [reporting].[DimEconomicallyDisadvantagedStatuses];