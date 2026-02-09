CREATE TABLE [reporting].[DimFosterCareStatuses]
(
	[DimFosterCareStatusId]       [int] IDENTITY (1,1),
	[FosterCareStatusCode]        [nvarchar](50)  NOT NULL,
	[FosterCareStatusDescription] [nvarchar](200) NULL,
	CONSTRAINT [PK_DimFosterCareStatusId] PRIMARY KEY ([DimFosterCareStatusId]),
	INDEX [NCIX_DimFosterCareStatuses_FosterCareStatusCode] NONCLUSTERED ([FosterCareStatusCode])
)
GO
--------------------------------------------------------------------------------------
