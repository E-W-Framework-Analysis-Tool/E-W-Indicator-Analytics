CREATE VIEW [bi].[vw_DimNeglectedOrDelinquentStatus] AS
SELECT
	[DimNOrDStatusId]
  , [NeglectedOrDelinquentLongTermStatusCode] AS [NeglectedOrDelinquentStatus]
FROM [reporting].[DimNOrDStatuses];
