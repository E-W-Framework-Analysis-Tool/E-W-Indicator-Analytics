CREATE TABLE [reporting].[DimEconomicallyDisadvantagedStatuses](
	[DimEconomicallyDisadvantagedStatusId] [int] IDENTITY(1,1) PRIMARY KEY,
	[EconomicDisadvantageStatusCode] [nvarchar](100) NOT NULL,
	[EconomicDisadvantageStatusDescription] [nvarchar](300) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimEconomicallyDisadvantagedStatuses_EconomicDisadvantageStatusCode
ON [reporting].[DimEconomicallyDisadvantagedStatuses] ([EconomicDisadvantageStatusCode]);
