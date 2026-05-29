CREATE TABLE [staging].[FactPsStudentCourseTranscripts]
(
	[FactPsStudentCourseTranscriptId]   [bigint]        NOT NULL,
	[SchoolYear]                        [smallint]      NULL,
	[IPEDSIdentifier]                   [int]           NULL,
	[PsStudentStudentIdentifierState]   [nvarchar](40)  NULL,
	[CipCodeId]                         [int]           NULL,
	[EnglishLearnerStatusId]            [int]           NULL,
	[PsDemographicId]                   [int]           NULL,
	[DisabilityStatusId]                [int]           NULL,
	[EconomicallyDisadvantagedStatusId] [int]           NULL,
	[HomelessnessStatusId]              [int]           NULL,
	[MigrantStatusId]                   [int]           NULL,
	[PrimaryDisabilityTypeId]           [int]           NULL,
	[IdeaStatusId]                      [int]           NULL,
	[ImmigrantStatusId]                 [int]           NULL,
	[MilitaryStatusId]                  [int]           NULL,
	[NumberOfCreditsAttempted]          [decimal](9, 2) NULL,
	[NumberOfCreditsEarned]             [decimal](9, 2) NULL,
	[StudentCourseSectionGradeEarned]   [nvarchar](15)  NULL
)