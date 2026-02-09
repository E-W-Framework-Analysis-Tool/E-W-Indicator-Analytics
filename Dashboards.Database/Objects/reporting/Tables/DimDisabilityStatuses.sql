CREATE TABLE [reporting].[DimDisabilityStatuses]
(
	[DimDisabilityStatusId]                 [int] IDENTITY (1,1),
	[DisabilityStatusCode]                  [nvarchar](100) NOT NULL,
	[DisabilityStatusDescription]           [nvarchar](300) NULL,
	CONSTRAINT [PK_DimDisabilityStatusId]	PRIMARY KEY ([DimDisabilityStatusId]),
	INDEX [NCIX_DimDisabilityStatuses_DisabilityStatusCode] NONCLUSTERED ([DisabilityStatusCode])
)
GO
--------------------------------------------------------------------------------------
