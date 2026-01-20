CREATE VIEW [bi].[vw_DimDisabilityStatuses] AS
SELECT 
 DimDisabilityStatusId as Id
,DisabilityStatusCode as  Code
,DisabilityStatusDescription as  [Desc]
FROM [reporting].[DimDisabilityStatuses];