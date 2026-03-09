CREATE TABLE [reporting].[DimNOrDStatuses]
(
	[DimNOrDStatusId]                                [int] IDENTITY (1,1),
	[NeglectedOrDelinquentLongTermStatusCode]        [nvarchar](50)  NULL,
	[NeglectedOrDelinquentLongTermStatusDescription] [nvarchar](100) NULL,
	CONSTRAINT [PK_DimNOrDStatusId] PRIMARY KEY ([DimNOrDStatusId]),
	INDEX [NCIX_DimNOrDStatuses_NeglectedOrDelinquentLongTermStatusCode] NONCLUSTERED ([NeglectedOrDelinquentLongTermStatusCode])
)
GO
--------------------------------------------------------------------------------------
