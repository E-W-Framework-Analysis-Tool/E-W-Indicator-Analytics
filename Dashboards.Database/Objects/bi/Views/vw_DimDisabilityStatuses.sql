CREATE VIEW [bi].[vw_DimDisabilityStatuses] AS
SELECT
	[DimDisabilityStatusId]
  , [DisabilityStatusCode] AS [DisabilityStatus]
FROM [reporting].[DimDisabilityStatuses];