CREATE TABLE [reporting].[FactK12AccessibleEducationMaterialAssignments]
	(
		[FactK12AccessibleEducationMaterialAssignmentId] [int] IDENTITY (1,1),
		[SchoolYear]                                     [smallint] NOT NULL,
		[SeaId]                                          [int]      NOT NULL,
		[LeaId]                                          [int]      NOT NULL,
		[K12SchoolId]                                    [int]      NOT NULL,
		[K12StudentId]                                   [bigint]   NOT NULL,
		[RuralStatusId]                                  [int]      NOT NULL,
		CONSTRAINT [PK_FactK12AccessibleEducationMaterialAssignmentId]
			PRIMARY KEY ([FactK12AccessibleEducationMaterialAssignmentId]),
		CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_SchoolYear_DimSchoolYears_Year]
			FOREIGN KEY ([SchoolYear])
				REFERENCES [reporting].[DimSchoolYears] ([Year]),
		CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_SeaId_DimSEAs_DimSeaId]
			FOREIGN KEY ([SeaId])
				REFERENCES [reporting].[DimSEAs] ([DimSeaId]),
		CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_LeaId_DimLEAs_DimLeaId]
			FOREIGN KEY ([LeaId])
				REFERENCES [reporting].[DimLEAs] ([DimLeaId]),
		CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12SchoolId_DimK12Schools_DimK12SchoolId]
			FOREIGN KEY ([K12SchoolId])
				REFERENCES [reporting].[DimK12Schools] ([DimK12SchoolId]),
		CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_K12StudentId_DimStudents_DimK12StudentId]
			FOREIGN KEY ([K12StudentId])
				REFERENCES [reporting].[DimStudents] ([DimK12StudentId]),
		CONSTRAINT [FK_FactK12AccessibleEducationMaterialAssignments_RuralStatusId_DimRuralStatuses_DimRuralStatusId]
			FOREIGN KEY ([RuralStatusId])
				REFERENCES [reporting].[DimRuralStatuses] ([DimRuralStatusId]),
		INDEX [NCIX_FactK12AccessibleEducationMaterialAssignments_NaturalKey] NONCLUSTERED
			([SchoolYear], [SeaId], [LeaId], [K12SchoolId], [K12StudentId])
	)