CREATE VIEW [bi].[vw_DimK12Schools] AS
SELECT
	[DimK12SchoolId]
  , [ds].[SeaOrganizationName]
  , [dl].[LeaOrganizationName]
  , [dks].[NameOfInstitution]                           AS [K12SchoolName]
  , [dl].[LeaTypeDescription]
  , IIF([SchoolTypeCode] = '', 'N/A', [SchoolTypeCode]) AS [SchoolTypeCode]
FROM
	[reporting].[DimK12Schools] AS [dks]
		INNER JOIN
		[reporting].[DimLEAs]   AS [dl]
			ON [dks].[LeaId] = [dl].[DimLeaId]
				AND [dks].[SeaId] = [dl].[SeaId]
		INNER JOIN
		[reporting].[DimSEAs]   AS [ds]
			ON [ds].[DimSeaId] = [dks].[SeaId];