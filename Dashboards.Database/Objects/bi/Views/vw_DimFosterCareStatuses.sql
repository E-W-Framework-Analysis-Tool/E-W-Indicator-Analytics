CREATE VIEW [bi].[vw_DimFosterCareStatuses] AS
SELECT 
 DimFosterCareStatusId as Id
,FosterCareStatusCode as  Code
,FosterCareStatusDescription as  [Desc]
FROM [reporting].[DimFosterCareStatuses];