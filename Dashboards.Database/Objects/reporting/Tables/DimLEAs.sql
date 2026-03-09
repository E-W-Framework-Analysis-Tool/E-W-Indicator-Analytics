CREATE TABLE [reporting].[DimLEAs]
(
	[DimLeaId]            [int] IDENTITY (1,1),
	[SeaId]               [int]            NOT NULL,
	[LeaIdentifierSea]    [nvarchar](50)   NULL,
	[LeaOrganizationName] [nvarchar](1000) NULL,
	[LeaTypeCode]         [nvarchar](50)   NULL,
	[LeaTypeDescription]  [nvarchar](100)  NULL,
	CONSTRAINT [PK_DimLEAs_DimLeaId] PRIMARY KEY ([DimLeaId]),
	CONSTRAINT [FK_DimLEAs_DimSEAs_DimSeaId] FOREIGN KEY ([SeaId]) REFERENCES [reporting].[DimSEAs] ([DimSeaId]),
	INDEX [IX_DimLEAs_LeaIdentifierSea] NONCLUSTERED ([LeaIdentifierSea])
)
GO
--------------------------------------------------------------------------------------
