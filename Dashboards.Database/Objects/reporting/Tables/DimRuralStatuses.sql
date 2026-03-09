CREATE TABLE [reporting].[DimRuralStatuses]
(
	[DimRuralStatusId]                      [int],
	[ERSRuralUrbanContinuumCodeCode]        [nvarchar](50),
	[ERSRuralUrbanContinuumCodeDescription] [nvarchar](200),
	[RuralResidencyStatusCode]              [nvarchar](50),
	[RuralResidencyStatusDescription]       [nvarchar](200),
	CONSTRAINT [PK_DimRuralStatusId] PRIMARY KEY ([DimRuralStatusId]),
	INDEX [NCIX_DimRuralStatuses_ERSRuralUrbanContinuumCodeDescription] NONCLUSTERED ([ERSRuralUrbanContinuumCodeDescription])
)