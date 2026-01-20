CREATE TABLE [reporting].[DimK12Demographics](
	[DimK12DemographicId] [int] IDENTITY(1,1) PRIMARY KEY,
	[SexCode] [nvarchar](50) NOT NULL,
	[SexDescription] [nvarchar](200) NOT NULL
)