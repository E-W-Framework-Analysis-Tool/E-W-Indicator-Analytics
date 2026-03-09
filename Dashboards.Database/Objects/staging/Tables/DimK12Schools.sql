CREATE TABLE [staging].[DimK12Schools]
(
	[DimK12SchoolId]               [int]            NULL,
	[SeaOrganizationIdentifierSea] [nvarchar](50)   NULL,
	[LeaIdentifierSea]             [nvarchar](50)   NULL,
	[SchoolIdentifierSea]          [nvarchar](50)   NULL,
	[NameOfInstitution]            [nvarchar](1000) NULL,
	[SchoolTypeCode]               [nvarchar](50)   NULL,
	[SchoolTypeDescription]        [nvarchar](100)  NULL
)
GO
--------------------------------------------------------------------------------------