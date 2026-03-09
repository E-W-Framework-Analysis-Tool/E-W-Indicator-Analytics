CREATE TABLE [reporting].[FactK12StaffCounts]
(
	[FactK12StaffCountId]        [int] IDENTITY (1,1),
	[SchoolYear]                 [smallint]       NOT NULL,
	[SeaId]                      [int]            NOT NULL,
	[LeaId]                      [int]            NOT NULL,
	[K12SchoolId]                [int]            NOT NULL,
	[K12StaffId]                 [bigint]         NOT NULL,
	[K12Staff_CurrentId]         [bigint]         NULL,
	[K12StaffCategoryId]         [int]            NOT NULL,
	[StaffFullTimeEquivalency]   [decimal](18, 3) NULL,
	CONSTRAINT [PK_FactK12StaffCountId]
		PRIMARY KEY ([FactK12StaffCountId]),
	CONSTRAINT [FK_FactK12StaffCounts_SchoolYear_DimSchoolYears_Year]
		FOREIGN KEY ([SchoolYear])
			REFERENCES [reporting].[DimSchoolYears] ([Year]),
	CONSTRAINT [FK_FactK12StaffCounts_SeaId_DimSEAs_DimSeaId]
		FOREIGN KEY ([SeaId])
			REFERENCES [reporting].[DimSEAs] ([DimSeaId]),
	CONSTRAINT [FK_FactK12StaffCounts_LeaId_DimLEAs_DimLeaId]
		FOREIGN KEY ([LeaId])
			REFERENCES [reporting].[DimLEAs] ([DimLeaId]),
	CONSTRAINT [FK_FactK12StaffCounts_K12SchoolId_DimK12Schools_DimK12SchoolId]
		FOREIGN KEY ([K12SchoolId])
			REFERENCES [reporting].[DimK12Schools] ([DimK12SchoolId]),
	CONSTRAINT [FK_FactK12StaffCounts_K12StudentId_DimStudents_DimK12StudentId]
		FOREIGN KEY ([K12StaffId])
			REFERENCES [reporting].[DimStaffs] ([DimK12StaffId]),
	CONSTRAINT [FK_FactK12StaffCounts_K12StaffCategoryId_DimK12StaffCategories_DimK12StaffCategoryId]
		FOREIGN KEY ([K12StaffCategoryId])
			REFERENCES [reporting].[DimK12StaffCategories] ([DimK12StaffCategoryId]),
	INDEX [NCIX_FactK12StaffCounts_NaturalKey] NONCLUSTERED
		([SchoolYear], [SeaId], [LeaId], [K12SchoolId], [K12StaffId])
)
