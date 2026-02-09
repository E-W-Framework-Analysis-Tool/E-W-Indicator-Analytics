CREATE TABLE [staging].[DimLEAs]
(
	[DimLeaId]                     [int]            NULL,
	[SeaOrganizationIdentifierSea] [nvarchar](50)   NULL,
	[LeaIdentifierSea]             [nvarchar](50)   NULL,
	[LeaOrganizationName]          [nvarchar](1000) NULL,
	[LeaTypeCode]                  [nvarchar](50)   NULL,
	[LeaTypeDescription]           [nvarchar](100)  NULL
)
GO
--------------------------------------------------------------------------------------
