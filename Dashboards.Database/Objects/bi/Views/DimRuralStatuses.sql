CREATE VIEW [bi].[vw_DimRuralStatuses]
AS
	SELECT
		[DimRuralStatusId]
	  , CASE
			WHEN [ERSRuralUrbanContinuumCodeDescription] LIKE '%metro%'
				THEN 'Metro'
			WHEN [ERSRuralUrbanContinuumCodeDescription] LIKE '%Urban%'
				THEN 'Urban'
			WHEN [ERSRuralUrbanContinuumCodeDescription] LIKE '%rural%'
				THEN 'Rural'
			ELSE 'N/A'
		END AS [Urbanicity]
	FROM [reporting].[DimRuralStatuses]