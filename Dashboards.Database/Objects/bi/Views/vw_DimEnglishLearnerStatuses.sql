CREATE VIEW [bi].[vw_DimEnglishLearnerStatuses] AS
SELECT
	[DimEnglishLearnerStatusId]
  , [EnglishLearnerStatusCode] AS [EnglishLearnerStatus]
FROM [reporting].[DimEnglishLearnerStatuses];