CREATE TABLE [reporting].[FactK12StudentCourseSections]
(
	[FactK12StudentCourseSectionId]      [bigint] IDENTITY (1,1),
	[SchoolYear]                         [smallint]      NOT NULL,
	[SeaId]                              [int]           NOT NULL,
	[LeaId]                              [int]           NOT NULL,
	[K12SchoolId]                        [int]           NOT NULL,
	[K12StudentId]                       [bigint]        NOT NULL,
	[GradeLevelCode]                     [varchar](8)    NOT NULL,
	[K12CourseId]                        [int]           NOT NULL,
	[K12CourseStatusId]                  [int]           NULL,
	[StudentCourseSectionGradeEarned]    [nvarchar](15)  NULL,
	[StudentCourseSectionGradeNarrative] [nvarchar](300) NULL,
	CONSTRAINT [PK_FactK12StudentCourseSectionId] PRIMARY KEY ([FactK12StudentCourseSectionId]),
	CONSTRAINT [FK_FactK12StudentCourseSections_SchoolYear_DimSchoolYears_Year] FOREIGN KEY ([SchoolYear]) REFERENCES [reporting].[DimSchoolYears] ([Year]),
	CONSTRAINT [FK_FactK12StudentCourseSections_SeaId_DimSEAs_DimSeaId] FOREIGN KEY ([SeaId]) REFERENCES [reporting].[DimSEAs] ([DimSeaId]),
	CONSTRAINT [FK_FactK12StudentCourseSections_LeaId_DimLEAs_DimLeaId] FOREIGN KEY ([LeaId]) REFERENCES [reporting].[DimLEAs] ([DimLeaId]),
	CONSTRAINT [FK_FactK12StudentCourseSections_K12SchoolId_DimK12Schools_DimK12SchoolId] FOREIGN KEY ([K12SchoolId]) REFERENCES [reporting].[DimK12Schools] ([DimK12SchoolId]),
	CONSTRAINT [FK_FactK12StudentCourseSections_K12StudentId_DimStudents_DimK12StudentId] FOREIGN KEY ([K12StudentId]) REFERENCES [reporting].[DimStudents] ([DimK12StudentId]),
	CONSTRAINT [FK_FactK12StudentCourseSections_GradeLevelCode_DimGradeLevels_GradeLevelCode] FOREIGN KEY ([GradeLevelCode]) REFERENCES [reporting].[DimGradeLevels] ([GradeLevelCode]),
	CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseId_DimAssessments_K12CourseStatusId] FOREIGN KEY ([K12CourseId]) REFERENCES [reporting].[DimK12Courses] ([DimK12CourseId]),
	CONSTRAINT [FK_FactK12StudentCourseSections_K12CourseStatusId_DimAssessmentSubtests_K12CourseStatusId] FOREIGN KEY ([K12CourseStatusId]) REFERENCES [reporting].[DimK12CourseStatuses] ([DimK12CourseStatusId]),
	INDEX [NCIX_FactK12StudentCourseSections_NaturalKey] NONCLUSTERED
		([SchoolYear], [SeaId], [LeaId], [K12SchoolId], [K12StudentId], [GradeLevelCode], [K12CourseId])
)
GO