CREATE VIEW [bi].[vw_DimNeglectedStatuses] AS
SELECT 
 DimNOrDStatusId as Id
,NeglectedOrDelinquentLongTermStatusCode as  Code
,NeglectedOrDelinquentLongTermStatusDescription as  [Desc]
FROM [reporting].[DimNOrDStatuses];
