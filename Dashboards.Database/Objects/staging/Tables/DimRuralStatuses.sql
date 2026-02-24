CREATE TABLE [staging].[DimRuralStatuses]
(
	[DimRuralStatusId]                      [int],
	[ERSRuralUrbanContinuumCodeCode]        [nvarchar](50),
	[ERSRuralUrbanContinuumCodeDescription] [nvarchar](200),
	[RuralResidencyStatusCode]              [nvarchar](50),
	[RuralResidencyStatusDescription]       [nvarchar](200),
)