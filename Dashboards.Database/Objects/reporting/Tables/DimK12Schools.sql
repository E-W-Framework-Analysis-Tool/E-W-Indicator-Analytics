CREATE TABLE [reporting].[DimK12Schools](
	[DimK12SchoolId] [int] IDENTITY(1,1) PRIMARY KEY,
	[SeaId] [int] NOT NULL REFERENCES [reporting].[DimSEAs]([DimSeaId]),
	[LeaId] [int] NOT NULL REFERENCES [reporting].[DimLEAs]([DimLeaId]),
	[SchoolIdentifierSea] [nvarchar](50) NULL,
	[NameOfInstitution] [nvarchar](1000) NULL,
	[SchoolTypeCode] [nvarchar](50) NULL,
	[SchoolTypeDescription] [nvarchar](100) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimK12Schools_SchoolIdentifierSea
ON [reporting].[DimK12Schools] ([SchoolIdentifierSea]);
