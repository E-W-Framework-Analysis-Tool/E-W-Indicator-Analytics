CREATE TABLE [reporting].[DimK12StaffCategories]
(
	[DimK12StaffCategoryId]             [int],
	[K12StaffClassificationDescription] [nvarchar](100) NOT NULL,
	CONSTRAINT [PK_DimK12StaffCategoryId] PRIMARY KEY ([DimK12StaffCategoryId]),
	INDEX [NCIX_DimK12StaffCategories_K12StaffClassificationDescription] NONCLUSTERED ([K12StaffClassificationDescription])
)