CREATE VIEW [bi].[vw_DimLEAs] AS
SELECT
	[DimLeaId]
  , [SeaId]
  , [LeaOrganizationName]
  , [LeaTypeDescription]
FROM [reporting].[DimLEAs];