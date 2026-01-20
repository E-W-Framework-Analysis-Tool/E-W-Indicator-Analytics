CREATE VIEW [bi].[vw_DimK12Schools] AS
SELECT
	[DimK12SchoolId]
  , [SeaId]
  , [LeaId]
  , [NameOfInstitution]
  , [SchoolTypeCode]
FROM [reporting].[DimK12Schools];