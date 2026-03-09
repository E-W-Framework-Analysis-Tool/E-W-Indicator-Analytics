CREATE TABLE [reporting].[DimK12Schools]
(
	[DimK12SchoolId]        [int] IDENTITY (1,1),
	[SeaId]                 [int]            NOT NULL,
	[LeaId]                 [int]            NOT NULL,
	[SchoolIdentifierSea]   [nvarchar](50)   NULL,
	[NameOfInstitution]     [nvarchar](1000) NULL,
	[SchoolTypeCode]        [nvarchar](50)   NULL,
	[SchoolTypeDescription] [nvarchar](100)  NULL,
	CONSTRAINT [PK_DimK12SchoolId] PRIMARY KEY ([DimK12SchoolId]),
	CONSTRAINT [FK_DimK12Schools_DimSEAs_DimSeaId] FOREIGN KEY ([SeaId]) REFERENCES [reporting].[DimSEAs] ([DimSeaId]),
	CONSTRAINT [FK_DimK12Schools_DimLEAs_DimLeaId] FOREIGN KEY ([LeaId]) REFERENCES [reporting].[DimLEAs] ([DimLeaId]),
	INDEX [NCIX_DimK12Schools_SchoolIdentifierSea] NONCLUSTERED ([SchoolIdentifierSea])
)
GO
--------------------------------------------------------------------------------------
