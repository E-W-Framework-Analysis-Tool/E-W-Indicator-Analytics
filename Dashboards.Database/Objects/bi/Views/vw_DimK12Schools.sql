CREATE VIEW [bi].[vw_DimK12Schools] AS
WITH
	[EnrollmentData] AS (SELECT DISTINCT
							 [K12SchoolId]
						   , MIN([GradeLevelCode]) AS [MinGradeLevel]
						   , MAX([GradeLevelCode]) AS [MaxGradeLevel]
						 FROM [reporting].[FactK12StudentEnrollments] AS [fkse]
						 GROUP BY [K12SchoolId])
SELECT
	[DimK12SchoolId]
  , [ds].[SeaOrganizationName]
  , [dl].[LeaOrganizationName]
  , [dks].[NameOfInstitution]                           AS [K12SchoolName]
  , [dl].[LeaTypeDescription]
  , IIF([SchoolTypeCode] = '', 'N/A', [SchoolTypeCode]) AS [SchoolTypeCode]
  , CASE
		WHEN [ed].[MaxGradeLevel] < '05'
			THEN 'Elementary'
		WHEN [ed].[MaxGradeLevel] < '08'
			THEN 'Middle'
		WHEN [ed].[MaxGradeLevel] >= '10'
			THEN 'High'
		ELSE 'K12'
	END                                                 AS [EducationLevel]
FROM
	[reporting].[DimK12Schools]         AS [dks]
		INNER JOIN
				  [reporting].[DimLEAs] AS [dl]
					  ON [dks].[LeaId] = [dl].[DimLeaId]
						  AND [dks].[SeaId] = [dl].[SeaId]
		INNER JOIN
				  [reporting].[DimSEAs] AS [ds]
					  ON [ds].[DimSeaId] = [dks].[SeaId]
		LEFT JOIN [EnrollmentData]      AS [ed]
					  ON [dks].[DimK12SchoolId] = [ed].[K12SchoolId];