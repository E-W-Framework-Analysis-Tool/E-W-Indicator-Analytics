CREATE TABLE [reporting].[DimSEAs](
	[DimSeaId] [int] IDENTITY(1,1) PRIMARY KEY,
	[SeaOrganizationIdentifierSea] [nvarchar](50) NOT NULL,
	[SeaOrganizationName] [nvarchar](1000) NULL,
	[StateAnsiCode] [nvarchar](10) NULL,
	[StateAbbreviationCode] [nvarchar](10) NULL
)
GO
--------------------------------------------------------------------------------------
CREATE NONCLUSTERED INDEX NCIX_reporting_DimSEAs_SeaOrganizationIdentifierSea
ON [reporting].[DimSEAs] ([SeaOrganizationIdentifierSea]);
