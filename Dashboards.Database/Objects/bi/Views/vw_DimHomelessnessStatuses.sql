CREATE VIEW [bi].[vw_DimHomelessnessStatuses] AS
SELECT 
 DimHomelessnessStatusId as Id
,HomelessnessStatusCode as  Code
,HomelessnessStatusDescription as  [Desc]
FROM [reporting].[DimHomelessnessStatuses];