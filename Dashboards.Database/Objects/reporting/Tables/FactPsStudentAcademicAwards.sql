CREATE TABLE [reporting].[FactPsStudentAcademicAwards]
	(
		[FactPsStudentAcademicAwardId] [bigint] IDENTITY (1,1),
		[PsInstitutionId]              [int]          NOT NULL,
		[PSStudentId]                  [bigint]       NOT NULL,
		[PsAcademicAwardTitleId]       [int]          NOT NULL,
		[AcademicAwardDate]            [datetime2](7) NULL,
		[PsAcademicAwardStatusId]      [int]          NOT NULL,
		[SchoolYear]                   [smallint]     NULL,
		[K12DemographicId]             [int]          NULL,
		CONSTRAINT [PK_FactPsStudentAcademicAwardId]
			PRIMARY KEY ([FactPsStudentAcademicAwardId]),
		CONSTRAINT [FK_FactPsStudentAcademicAwards_SchoolYear_DimSchoolYears_Year]
			FOREIGN KEY ([SchoolYear])
				REFERENCES [reporting].[DimSchoolYears] ([Year]),
		CONSTRAINT [FK_FactPsStudentAcademicAwards_PsInstitutionId_PS_DimInstitutions_DimPsInstitutionId]
			FOREIGN KEY ([PsInstitutionId])
				REFERENCES [reporting].[PS_DimInstitutions] ([DimPsInstitutionId]),
		CONSTRAINT [FK_FactPsStudentAcademicAwards_PSStudentId_PS_DimStudents_DimPSStudentId]
			FOREIGN KEY ([PSStudentId])
				REFERENCES [reporting].[PS_DimStudents] ([DimPSStudentId]),
		CONSTRAINT [FK_FactPsStudentAcademicAwards_PsAcademicAwardTitleId_DimPsAcademicAwardTitles_DimPsAcademicAwardTitleId]
			FOREIGN KEY ([PsAcademicAwardTitleId])
				REFERENCES [reporting].[DimPsAcademicAwardTitles] ([DimPsAcademicAwardTitleId]),
		CONSTRAINT [FK_FactPsStudentAcademicAwards_PsAcademicAwardStatusId_DimPsAcademicAwardStatuses_DimPsAcademicAwardStatusId]
			FOREIGN KEY ([PsAcademicAwardStatusId])
				REFERENCES [reporting].[DimPsAcademicAwardStatuses] ([DimPsAcademicAwardStatusId]),
		CONSTRAINT [FK_FactPsStudentAcademicAwards_K12DemographicId_DimK12Demographics_DimK12DemographicId]
			FOREIGN KEY ([K12DemographicId])
				REFERENCES [reporting].[DimK12Demographics] ([DimK12DemographicId]),
		INDEX [NCIX_FactPsStudentAcademicAwards_NaturalKey] NONCLUSTERED
			([SchoolYear], [PsInstitutionId], [PSStudentId])
	)
GO
