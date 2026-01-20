CREATE VIEW [bi].[vw_DimGradeLevels] AS
SELECT
	[GradeLevelCode]          AS [Code]
  , [GradeLevelDescription] AS [Desc]
  , CASE
		WHEN [GradeLevelCode] IN ('01', '02', '03', '04', '05') THEN 'Elementary'
		WHEN [GradeLevelCode] IN ('06', '07', '08')             THEN 'Middle'
		WHEN [GradeLevelCode] IN ('09', '10', '11', '12')       THEN 'High'
		                                                        ELSE 'Other'
	END                       AS [GradeLevelGroup]
FROM [reporting].[DimGradeLevels];
