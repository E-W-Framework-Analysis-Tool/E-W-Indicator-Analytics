CREATE VIEW [bi].[vw_DimPsInstitutions]
AS
	SELECT
		[di].[DimPsInstitutionId]
	  , [ds].[DimSeaId]
	  , [di].[NameOfInstitution]
	FROM
		[reporting].[PS_DimInstitutions]    AS [di]
			LEFT JOIN [reporting].[DimSEAs] AS [ds]
						  ON [di].[StateAbbreviation] = [ds].[StateAbbreviationCode]
	WHERE
		[ds].[DimSeaId] IS NOT NULL;