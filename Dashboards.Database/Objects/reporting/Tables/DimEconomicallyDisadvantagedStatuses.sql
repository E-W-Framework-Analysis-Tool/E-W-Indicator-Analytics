CREATE TABLE [reporting].[DimEconomicallyDisadvantagedStatuses]
(
	[DimEconomicallyDisadvantagedStatusId]  [int] IDENTITY (1,1),
	[EconomicDisadvantageStatusCode]        [nvarchar](100) NOT NULL,
	[EconomicDisadvantageStatusDescription] [nvarchar](300) NULL,
	CONSTRAINT [PK_DimEconomicallyDisadvantagedStatusId] PRIMARY KEY ([DimEconomicallyDisadvantagedStatusId]),
	INDEX [NCIX_DimEconomicallyDisadvantagedStatuses_EconomicDisadvantageStatusCode] NONCLUSTERED ([EconomicDisadvantageStatusCode])
)
GO
--------------------------------------------------------------------------------------
