CREATE TABLE [reporting].[FactPsStudentCourseTranscripts]
(
	[FactPsStudentCourseTranscriptId]   [bigint] IDENTITY (1,1),
	[SchoolYear]                        [smallint]      NOT NULL,
	[PsInstitutionId]                   [int]           NOT NULL,
	[PsStudentId]                       [bigint]        NOT NULL,
	[CipCodeId]                         [int]           NOT NULL,
	[EnglishLearnerStatusId]            [int]           NOT NULL,
	[PsDemographicId]                   [int]           NOT NULL,
	[DisabilityStatusId]                [int]           NOT NULL,
	[EconomicallyDisadvantagedStatusId] [int]           NOT NULL,
	[HomelessnessStatusId]              [int]           NOT NULL,
	[MigrantStatusId]                   [int]           NOT NULL,
	[PrimaryDisabilityTypeId]           [int]           NOT NULL,
	[IdeaStatusId]                      [int]           NOT NULL,
	[ImmigrantStatusId]                 [int]           NOT NULL,
	[MilitaryStatusId]                  [int]           NOT NULL,
	[NumberOfCreditsAttempted]          [decimal](9, 2) NULL,
	[NumberOfCreditsEarned]             [decimal](9, 2) NULL,
	[StudentCourseSectionGradeEarned]   [nvarchar](15)  NULL,
	CONSTRAINT [PK_FactPsStudentCourseTranscriptId]
		PRIMARY KEY ([FactPsStudentCourseTranscriptId]),
	CONSTRAINT [FK_FactPsStudentCourseTranscript_SchoolYear_DimSchoolYears_Year]
		FOREIGN KEY ([SchoolYear])
			REFERENCES [reporting].[DimSchoolYears] ([Year]),
	CONSTRAINT [FK_FactPsStudentCourseTranscript_PsInstitutionId_DimPsInstitutions_DimPsInstitutionId]
		FOREIGN KEY ([PsInstitutionId])
			REFERENCES [reporting].[PS_DimInstitutions] ([DimPsInstitutionId]),
	CONSTRAINT [FK_FactPsStudentCourseTranscript_PSStudentId_PS_DimStudents_DimPSStudentId]
		FOREIGN KEY ([PSStudentId])
			REFERENCES [reporting].[PS_DimStudents] ([DimPSStudentId])
)