CREATE TABLE [reporting].[DimSEAs]
(
	[DimSeaId]                     [int] IDENTITY (1,1),
	[SeaOrganizationIdentifierSea] [nvarchar](50)   NOT NULL,
	[SeaOrganizationName]          [nvarchar](1000) NULL,
	[StateAnsiCode]                [nvarchar](10)   NULL,
	[StateAbbreviationCode]        [nvarchar](10)   NULL,
	CONSTRAINT [PK_DimSeaId] PRIMARY KEY ([DimSeaId]),
	INDEX [NCIX_DimSEAs_SeaOrganizationIdentifierSea] NONCLUSTERED ([SeaOrganizationIdentifierSea])
)
GO
--------------------------------------------------------------------------------------
