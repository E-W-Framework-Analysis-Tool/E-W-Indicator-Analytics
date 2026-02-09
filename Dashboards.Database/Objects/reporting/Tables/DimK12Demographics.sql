CREATE TABLE [reporting].[DimK12Demographics]
(
	[DimK12DemographicId] [int] IDENTITY (1,1),
	[SexCode]             [nvarchar](50)  NOT NULL,
	[SexDescription]      [nvarchar](200) NOT NULL,
	CONSTRAINT [PK_DimK12DemographicId] PRIMARY KEY ([DimK12DemographicId])
)
GO
--------------------------------------------------------------------------------------