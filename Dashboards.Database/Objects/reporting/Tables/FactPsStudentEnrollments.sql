CREATE TABLE [reporting].[FactPsStudentEnrollments]
(
	[FactPsStudentEnrollmentsId] [bigint] IDENTITY (1,1),
	[PsInstitutionId]          INT,
	[SchoolYear]               SMALLINT,
	[PSStudentId]              BIGINT,
	[PsEnrollmentStatusId]     INT,
	CONSTRAINT [PK_FactPsStudentEnrollmentsId]
		PRIMARY KEY ([FactPsStudentEnrollmentsId]),
	CONSTRAINT [FK_FactPsStudentEnrollments_SchoolYear_DimSchoolYears_Year]
		FOREIGN KEY ([SchoolYear])
			REFERENCES [reporting].[DimSchoolYears] ([Year]),
	CONSTRAINT [FK_FactPsStudentEnrollments_PsInstitutionId_DimPsInstitutions_DimPsInstitutionId]
		FOREIGN KEY ([PsInstitutionId])
			REFERENCES [reporting].[PS_DimInstitutions] ([DimPsInstitutionId]),
	CONSTRAINT [FK_FactPsStudentEnrollments_PSStudentId_PS_DimStudents_DimPSStudentId]
		FOREIGN KEY ([PSStudentId])
			REFERENCES [reporting].[PS_DimStudents] ([DimPSStudentId]),
	CONSTRAINT [FK_FactPsStudentEnrollments_PsEnrollmentStatusId_DimPsEnrollmentStatuses_DimPsEnrollmentStatusId]
		FOREIGN KEY ([PsEnrollmentStatusId])
			REFERENCES [reporting].[DimPsEnrollmentStatuses] ([DimPsEnrollmentStatusId])
)