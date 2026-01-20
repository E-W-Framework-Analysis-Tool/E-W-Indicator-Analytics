CREATE TABLE [reporting].[DimNOrDStatuses](
	[DimNOrDStatusId] [int] IDENTITY(1,1) PRIMARY KEY,
	[NeglectedOrDelinquentLongTermStatusCode] [nvarchar](50) NULL,
	[NeglectedOrDelinquentLongTermStatusDescription] [nvarchar](100) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusCode
ON [reporting].[DimNOrDStatuses] ([NeglectedOrDelinquentLongTermStatusCode]);
