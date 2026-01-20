CREATE TABLE [reporting].[DimLEAs](
	[DimLeaId] [int] IDENTITY(1,1) PRIMARY KEY,
  [SeaId] [int] NOT NULL REFERENCES [reporting].[DimSEAs]([DimSeaId]),
	[LeaIdentifierSea] [nvarchar](50) NULL,
	[LeaOrganizationName] [nvarchar](1000) NULL,
	[LeaTypeCode] [nvarchar](50) NULL,
	[LeaTypeDescription] [nvarchar](100) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimLEAs_LeaIdentifierSea
ON [reporting].[DimLEAs] ([LeaIdentifierSea]);
