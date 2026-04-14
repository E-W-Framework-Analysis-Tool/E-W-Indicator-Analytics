CREATE VIEW [bi].[vw_DimCipCodes]
AS
	WITH
		[base] AS
			(SELECT
				 [DimCipCodeId]
			   , CAST(CAST(IIF([CipCode] = 'MISSING', '-1.0', [CipCode]) AS DECIMAL) AS SMALLINT) AS [CipCode]
			 FROM [reporting].[DimCipCodes])
	SELECT
		[DimCipCodeId]
	  , CASE
			WHEN [CipCode] IN (11, 14, 15, 26, 27, 30, 40, 41)
				THEN 'STEM'
			WHEN [CipCode] IN (52, 62)
				THEN 'Business'
			WHEN [CipCode] IN (5, 16, 23, 24, 38, 39, 45, 50, 54)
				THEN 'Liberal Arts & Humanities'
			ELSE 'Other'
		END AS [FieldOfStudy]
	FROM [base]