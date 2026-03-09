CREATE VIEW [bi].[vw_DimSEAs] AS
SELECT
	[DimSeaId]
  , [SeaOrganizationName]
  , [StateAbbreviationCode] AS [StateCode]
FROM [reporting].[DimSEAs];