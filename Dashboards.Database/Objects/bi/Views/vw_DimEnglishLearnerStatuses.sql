CREATE VIEW [bi].[vw_DimEnglishLearnerStatuses] AS
SELECT 
DimEnglishLearnerStatusId as Id
,EnglishLearnerStatusCode as Code
,EnglishLearnerStatusDescription as [Desc]
FROM [reporting].[DimEnglishLearnerStatuses];