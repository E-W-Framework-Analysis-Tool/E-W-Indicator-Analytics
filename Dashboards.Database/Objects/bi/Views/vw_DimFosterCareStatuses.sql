CREATE VIEW [bi].[vw_DimFosterCareStatuses] AS
SELECT
	[DimFosterCareStatusId]
  , [FosterCareStatusCode] AS [FosterCareStatus]
FROM [reporting].[DimFosterCareStatuses];