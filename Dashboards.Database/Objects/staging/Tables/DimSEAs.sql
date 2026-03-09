CREATE TABLE [staging].[DimSEAs]
(
	[DimSeaId]                     [int]            NULL,
	[SeaOrganizationIdentifierSea] [nvarchar](50)   NULL,
	[SeaOrganizationName]          [nvarchar](1000) NULL,
	[StateAnsiCode]                [nvarchar](10)   NULL,
	[StateAbbreviationCode]        [nvarchar](10)   NULL
)
GO
--------------------------------------------------------------------------------------
